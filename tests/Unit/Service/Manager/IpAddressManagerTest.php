<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Service\Manager;

use App\Entity\Interfaces\DomainInterface;
use App\Entity\Interfaces\IpAddressInterface;
use App\Entity\ORM\Domain;
use App\Entity\ORM\IpAddress;
use App\Repository\Interfaces\IpAddressRepositoryInterface;
use App\Repository\ORM\IpAddressRepository;
use App\Service\Manager\IpAddressManager;
use PHPUnit\Framework\MockObject\MockObject;
use PHPUnit\Framework\TestCase;

class IpAddressManagerTest extends TestCase
{
    public function testAssignIpAddressesNoneReplaced(): void
    {
        $ipList = [
            '8.8.8.8',
            '8.8.8.7',
            '8.8.8.6',
        ];

        $addresses = [];
        foreach ($ipList as $ip) {
            $addresses[] = $this->createIpAddress($ip);
        }
        $domain = $this->createDomain('google.com', $addresses);

        $manager = new IpAddressManager($this->getIpAddressRepositoryMock(0, []));
        $manager->assignIpAddresses($domain, $ipList);

        self::assertEquals($addresses, $domain->getIpList());
    }

    public function testAssignIpAddressesPartCreated(): void
    {
        $ipList = [
            '8.8.8.8',
            '8.8.8.7',
            '8.8.8.6',
        ];

        $domain = $this->createDomain('google.com', [$this->createIpAddress($ipList[0])]);

        $manager = new IpAddressManager($this->getIpAddressRepositoryMock(2, []));
        $manager->assignIpAddresses($domain, $ipList);

        $actualIpList = [];
        foreach ($domain->getIpList() as $address) {
            $actualIpList[] = $address->getIp();
        }
        self::assertEquals($ipList, $actualIpList);
    }

    public function testAssignIpAddressesCheckBuffering(): void
    {
        $ipList = [
            '8.8.8.8',
            '8.8.8.7',
            '8.8.8.6',
        ];

        $domain = $this->createDomain('google.com', [$this->createIpAddress($ipList[0])]);
        $domain2 = $this->createDomain('image.google.com', [$this->createIpAddress($ipList[0])]);

        $manager = new IpAddressManager($this->getIpAddressRepositoryMock(2, []));

        $manager->assignIpAddresses($domain, $ipList);
        $manager->assignIpAddresses($domain2, $ipList);

        // Call clear before processing second entity
        $manager = new IpAddressManager($this->getIpAddressRepositoryMock(4, []));

        $domain = $this->createDomain('google.com', [$this->createIpAddress($ipList[0])]);
        $domain2 = $this->createDomain('image.google.com', [$this->createIpAddress($ipList[0])]);
        $manager->assignIpAddresses($domain, $ipList);
        $manager->clearBuffer();
        $manager->assignIpAddresses($domain2, $ipList);
    }

    protected function getIpAddressRepositoryMock(int $findCallsAmount, array $addresses): IpAddressRepositoryInterface
    {
        /** @var MockObject|IpAddressRepositoryInterface $repository */
        $repository = $this->getMockBuilder(IpAddressRepository::class)
                           ->disableOriginalConstructor()
                           ->setMethods(['find'])
                           ->getMock();

        $repository->expects(self::exactly($findCallsAmount))->method('find')->willReturnCallback(
            function (string $id, ?int $lockMode = null, ?int $lockVersion = null) use ($addresses
            ): ?IpAddressInterface {
                return empty($addresses[$id]) ? null : $addresses[$id];
            }
        );

        return $repository;
    }

    protected function createDomain(string $domainName, array $addresses): DomainInterface
    {
        $domain = new Domain();
        $domain->setDomain($domainName);
        $domain->setIpList($addresses);

        return $domain;
    }

    protected function createIpAddress(string $ip): IpAddressInterface
    {
        $ipAddress = new IpAddress();
        $ipAddress->setIp($ip);

        return $ipAddress;
    }
}
