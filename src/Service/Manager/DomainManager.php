<?php
declare(strict_types = 1);

namespace App\Service\Manager;

use App\Entity\Interfaces\DomainInterface;
use App\Helper\DomainHelper;
use App\Helper\LogHelper;
use App\Helper\ValidationHelper;
use App\Repository\Interfaces\DomainRepositoryInterface;
use App\Service\Manager\Buffer\DomainBuffer;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class DomainManager
{

    /** @var DomainBuffer */
    protected $buffer;

    /** @var DomainRepositoryInterface */
    protected $domainRepository;

    /** @var ValidatorInterface */
    protected $validator;

    /** @var EntityManagerInterface */
    protected $entityManager;

    /** @var LoggerInterface */
    protected $logger;

    public function __construct(
        DomainRepositoryInterface $domainRepository,
        ValidatorInterface $validator,
        EntityManagerInterface $entityManager,
        DomainBuffer $buffer,
        LoggerInterface $logger
    ) {
        $this->domainRepository = $domainRepository;
        $this->validator = $validator;
        $this->entityManager = $entityManager;
        $this->buffer = $buffer;
        $this->logger = $logger;
    }

    /**
     * @param string[] $domainNames
     *
     * @return DomainInterface[]|array<string,DomainInterface>
     */
    public function getDomainsByNames(array $domainNames): array
    {
        $domains = $this->findByNames($domainNames);

        $newDomainNames = \array_diff($domainNames, \array_keys($domains));

        if (!empty($newDomainNames)) {
            $domains += $this->createDomains($newDomainNames, $domains);
        }

        return $domains;
    }

    public function clearBuffer(): void
    {
        $this->buffer->clear();
    }

    public function clearDomainBufferEntry(string $domain): void
    {
        $this->buffer->clearByKey($domain);
    }

    /**
     * @param string[] $domainNames
     *
     * @return DomainInterface[]|array<string,DomainInterface>
     */
    protected function findByNames(array $domainNames): array
    {
        $domains = $this->buffer->getByNames($domainNames);
        $missingNames = \array_diff($domainNames, \array_keys($domains));
        if (!empty($missingNames)) {
            $queriedDomains = $this->domainRepository->findByNames($missingNames);
            if (!empty($queriedDomains)) {
                $this->buffer->addByNames($queriedDomains);
                $domains += $queriedDomains;
            }
        }

        return $domains;
    }

    /**
     * @param string[]                                        $newDomainNames
     * @param DomainInterface[]|array<string,DomainInterface> $existingDomains
     *
     * @return DomainInterface[]|array<string,DomainInterface>
     */
    protected function createDomains(array $newDomainNames, array $existingDomains): array
    {
        $parentNamesMap = [];
        foreach ($newDomainNames as $domainName) {
            $parentNamesMap[$domainName] = DomainHelper::getParentDomain($domainName);
        }

        $parentNames = \array_filter(\array_values($parentNamesMap));

        $missingParentNames = \array_diff($parentNames, \array_keys($existingDomains));

        $existingParentDomains = $this->domainRepository->findByNames($missingParentNames);
        $existingDomains += $existingParentDomains;
        $missingParentNames = \array_diff($parentNames, \array_keys($existingDomains));

        if (!empty($missingParentNames)) {
            $existingDomains += $this->createDomains($missingParentNames, $existingDomains);
        }

        $newDomains = [];

        foreach ($newDomainNames as $domainName) {
            $domain = $this->buffer->getByName($domainName);
            if ($domain === null) {
                if (!empty($parentNamesMap[$domainName]) && empty($existingDomains[$parentNamesMap[$domainName]])) {
                    $this->logger->warning(
                        "Parent for domain '{$domainName}' cannot be located.",
                        LogHelper::prepareContext(__FILE__, __LINE__, ['domainName' => $domainName])
                    );
                    continue;
                }
                $domain = $this->domainRepository->createEntity();
                $domain->setDomain($domainName);
                if (!empty($parentNamesMap[$domainName])) {
                    $domain->setParent($existingDomains[$parentNamesMap[$domainName]]);
                }

                $errors = $this->validator->validate($domain);
                if (\count($errors) > 0) {
                    $this->logger->warning(
                        "Created domain instance for domain '{$domainName}' is not valid. Errors:"
                        . ValidationHelper::violationsToString($errors),
                        LogHelper::prepareContext(__FILE__, __LINE__)
                    );
                    continue;
                }
                $this->buffer->addByNames([$domainName => $domain]);
                $this->entityManager->persist($domain);
            }

            $newDomains[$domainName] = $domain;
        }

        return $newDomains;
    }
}
