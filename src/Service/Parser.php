<?php
declare(strict_types = 1);

namespace App\Service;

use App\Entity\Interfaces\DomainInterface;
use App\Helper\LogHelper;
use App\Service\Manager\DomainManager;
use App\Service\Manager\IpAddressManager;
use App\Service\Reader\ReaderFactory;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;

class Parser
{

    protected const VALID_STATUS = 'NOERROR';

    protected const VALID_TYPE = 'A';

    /** @var int */
    protected $batchSize;

    /** @var ReaderFactory */
    protected $readerFactory;

    /** @var DomainManager */
    protected $domainManager;

    /** @var IpAddressManager */
    protected $ipAddressManager;

    /** @var EntityManagerInterface */
    protected $entityManager;

    /** @var LoggerInterface */
    protected $logger;

    public function __construct(
        int $batchSize,
        ReaderFactory $readerFactory,
        DomainManager $domainManager,
        IpAddressManager $ipAddressManager,
        EntityManagerInterface $entityManager,
        LoggerInterface $logger
    ) {
        $this->batchSize = $batchSize;
        $this->readerFactory = $readerFactory;
        $this->domainManager = $domainManager;
        $this->ipAddressManager = $ipAddressManager;
        $this->entityManager = $entityManager;
        $this->logger = $logger;
    }

    public function parse(string $file): void
    {
        $reader = $this->readerFactory->build($file);

        $reader->open();

        $rowIterator = $reader->getRowIterator();

        $items = $this->readBatch($rowIterator);

        while (!empty($items)) {
            $this->processBatch($items);
            $items = $this->readBatch($rowIterator);
        }

        $reader->close();
    }

    /**
     * @param mixed[]|array<int,array<string,mixed>> $items
     */
    protected function processBatch(array $items): void
    {
        $domainsAddresses = [];
        foreach ($items as $item) {
            if (!$this->isItemValid($item)) {
                $this->logger->debug(
                    "Record have invalid structure. 'status', 'answers' or 'additionals' is not found.",
                    LogHelper::prepareContext(__CLASS__, __LINE__, ['item' => $item])
                );
                continue;
            }
            if ($item['status'] !== self::VALID_STATUS) {
                $this->logger->debug(
                    "Record will be skipped due to invalid status '{$item['status']}'.",
                    LogHelper::prepareContext(__CLASS__, __LINE__, ['item' => $item])
                );
                continue;
            }
            $domainsAddresses = \array_merge_recursive($domainsAddresses, $this->collectDomainsAddresses($item));
        }

        if (empty($domainsAddresses)) {
            return;
        }

        $this->entityManager->beginTransaction();

        $domains = $this->domainManager->getDomainsByNames(\array_keys($domainsAddresses));

        /**
         * @var string          $dns
         * @var DomainInterface $domain
         */
        foreach ($domains as $dns => $domain) {
            $this->ipAddressManager->assignIpAddresses($domain, $domainsAddresses[$dns]);
        }

        $this->entityManager->flush();
        $this->clearCachedState();

        $this->entityManager->commit();
    }

    protected function clearCachedState(): void
    {
        $this->entityManager->clear();
        $this->domainManager->clearBuffer();
        $this->ipAddressManager->clearBuffer();
    }

    /**
     * Collect information about domains IPs.
     *
     * @param mixed[]|array<string,mixed> $item
     *
     * @return string[]|array<string,string[]> List of unique IPs grouped by domain names to which they belong.
     */
    protected function collectDomainsAddresses(array $item): array
    {
        $domainAddresses = \array_merge_recursive(
            $this->collectDomainInfoFromAnswers($item['data']['answers']),
            $this->collectDomainInfoFromAnswers($item['data']['additionals'])
        );

        foreach ($domainAddresses as $domain => $addresses) {
            $domainAddresses[$domain] = \array_flip(\array_flip($addresses));
        }

        return $domainAddresses;
    }

    /**
     * Collect information about domains IPs from passed answers/additionals block.
     *
     * @param mixed[]|array<string,mixed> $answers
     *
     * @return string[]|array<string,string[]> List of IPs grouped by domain names to which they belong.
     */
    protected function collectDomainInfoFromAnswers(array $answers): array
    {
        $domainsAddresses = [];

        foreach ($answers as $answer) {
            if (empty($answer['type'])
                || $answer['type'] !== self::VALID_TYPE
                || empty($answer['name'])
                || empty($answer['answer'])
            ) {
                continue;
            }
            $domainsAddresses[$answer['name']][] = $answer['answer'];
        }

        return $domainsAddresses;
    }

    /**
     * @param mixed[]|array<string,mixed> $item
     */
    protected function isItemValid(array $item): bool
    {
        return !empty($item) && \array_key_exists('status', $item)
            && \array_key_exists('data', $item)
            && \array_key_exists('answers', $item['data'])
            && \array_key_exists('additionals', $item['data']);
    }

    /**
     * @return mixed[]|array<string,mixed>
     */
    protected function readBatch(\Iterator $rowIterator): array
    {
        $items = [];
        $amountCounter = 0;

        while (!empty($rowIterator->current()) && $rowIterator->valid()) {
            $amountCounter++;
            $items[] = $rowIterator->current();
            $rowIterator->next();
            if ($this->batchSize === $amountCounter) {
                break;
            }
        }

        return $items;
    }
}
