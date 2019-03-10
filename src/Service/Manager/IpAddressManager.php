<?php
declare(strict_types = 1);

namespace App\Service\Manager;

use App\Entity\Interfaces\DomainInterface;
use App\Entity\Interfaces\IpAddressInterface;
use App\Helper\ValueHelper;
use App\Repository\Interfaces\IpAddressRepositoryInterface;

class IpAddressManager
{

    /** @var IpAddressInterface[]|array<string,IpAddressInterface> */
    protected $ipAddressBuffer = [];

    /** @var IpAddressRepositoryInterface */
    protected $ipAddressRepository;

    public function __construct(IpAddressRepositoryInterface $ipAddressRepository)
    {
        $this->ipAddressRepository = $ipAddressRepository;
    }

    /**
     * @param string[] $ipAddresses
     */
    public function assignIpAddresses(DomainInterface $domain, array $ipAddresses): void
    {
        $validAddresses = [];
        $existingAddresses = [];
        /** @var IpAddressInterface $ipAddress */
        foreach ($domain->getIpList() as $ipAddress) {
            $existingAddresses[$ipAddress->getIp()] = $ipAddress;
        }

        $ipAddresses = \array_flip(\array_flip($ipAddresses));
        /** @var string $ip */
        foreach ($ipAddresses as $ip) {
            if (ValueHelper::isValidIp($ip)) {
                if (!empty($existingAddresses[$ip])) {
                    $ipAddress = $this->ipAddressBuffer[$ip] = $existingAddresses[$ip];
                } elseif (!empty($this->ipAddressBuffer[$ip])) {
                    $ipAddress = $this->ipAddressBuffer[$ip];
                } else {
                    $ipAddress = $this->ipAddressRepository->find($ip);
                    if ($ipAddress === null) {
                        $ipAddress = $this->ipAddressRepository->createEntity();
                        $ipAddress->setIp($ip);
                    }
                    $this->ipAddressBuffer[$ip] = $ipAddress;
                }
                $validAddresses[] = $ipAddress;
            }
        }
        $domain->setIpList($validAddresses);
    }

    public function clearBuffer(): void
    {
        $this->ipAddressBuffer = [];
    }
}
