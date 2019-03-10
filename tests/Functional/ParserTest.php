<?php
declare(strict_types = 1);

namespace App\Tests\Functional;

use App\Entity\Interfaces\DomainInterface;
use App\Repository\Interfaces\DomainRepositoryInterface;
use App\Repository\Interfaces\IpAddressRepositoryInterface;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class ParserTest extends WebTestCase
{
    protected const FILE = __DIR__ . '/../Fixtures/files/parser/valid.json';

    public function testParseAllCreated(): void
    {
        self::bootKernel();

        $expectedDomains = ['google.com', 'yahoo.com', 'com'];
        $expectedIps = [
            'google.com' => [
                '172.217.17.78',
            ],
            'yahoo.com' => [
                '111.117.17.78',
                '222.117.17.78',
            ],
            'com' => [],
        ];

        $ipsAmount = 3;

        $container = self::$kernel->getContainer();

        $parser = $container->get('test.parser');

        $parser->parse(self::FILE);

        /** @var DomainRepositoryInterface $domainRepository */
        $domainRepository = $container->get('test.domain.repository');
        /** @var IpAddressRepositoryInterface $ipAddressRepository */
        $ipAddressRepository = $container->get('test.ip_address.repository');

        self::assertEquals($ipsAmount, \count($ipAddressRepository->findAll()));

        /** @var DomainInterface[] $domains */
        $domains = $domainRepository->findAll();

        self::assertEquals(\count($expectedDomains), \count($domains));
        foreach ($domains as $domain) {
            self::assertTrue(\in_array($domain->getDomain(), $expectedDomains));
            $ipList = [];
            foreach ($domain->getIpList() as $address) {
                $ipList[] = $address->getIp();
            }

            self::assertEmpty(\array_diff($expectedIps[$domain->getDomain()], $ipList));
        }
    }
}
