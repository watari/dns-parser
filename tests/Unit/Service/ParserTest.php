<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Service;

use App\Entity\Interfaces\DomainInterface;
use App\Entity\ORM\Domain;
use App\Entity\ORM\IpAddress;
use App\Service\Manager\DomainManager;
use App\Service\Manager\IpAddressManager;
use App\Service\Parser;
use App\Service\Reader\ReaderFactory;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use PHPUnit\Framework\MockObject\MockObject;
use PHPUnit\Framework\TestCase;
use Symfony\Component\HttpKernel\Tests\Logger;

class ParserTest extends TestCase
{
    protected const FILE = __DIR__ . '/../../Fixtures/files/parser/valid.json';

    public function testParse(): void
    {
        $expectedDomains = ['google.com', 'yahoo.com'];
        $expectedIps = [
            'google.com' => [
                '172.217.17.78',
            ],
            'yahoo.com' => [
                '111.117.17.78',
                '222.117.17.78',
            ],
        ];
        $batchSize = 100;
        $logger = new Logger();
        $ipAddressLog = new \ArrayObject();
        $ipAddressLog->assignIpAddressesCalls = [];
        $domainLog = new \ArrayObject();
        $domainLog->getDomainsByNamesCalls = [];

        $parser = new Parser(
            $batchSize,
            new ReaderFactory(),
            $this->getDomainManagerMock(1, 1, $domainLog),
            $this->getIpAddressManagerMock(2, 1, $ipAddressLog),
            $this->getEntityManagerMock(1, 1, 1, 1),
            $logger
        );

        $parser->parse(self::FILE);

        $getDomainsByNamesCall = $domainLog->getDomainsByNamesCalls[0];
        self::assertEquals([$expectedDomains], $getDomainsByNamesCall);

        $assignIpAddressesCalls = $ipAddressLog->assignIpAddressesCalls;

        foreach ($assignIpAddressesCalls as $assignIpAddressesCall) {
            /**
             * @var DomainInterface $domain
             * @var string[]        $ipAddresses
             */
            [$domain, $ipAddresses] = $assignIpAddressesCall;
            self::assertEquals($expectedIps[$domain->getDomain()], $ipAddresses);
        }

        $debugMessages = $logger->getLogs('debug');
        self::assertEquals(5, \count($debugMessages));

        $expectedDebugMessages = [
            "Record have invalid structure. 'status', 'answers' or 'additionals' is not found.",
            "Record have invalid structure. 'status', 'answers' or 'additionals' is not found.",
            "Record have invalid structure. 'status', 'answers' or 'additionals' is not found.",
            "Record have invalid structure. 'status', 'answers' or 'additionals' is not found.",
            "Record will be skipped due to invalid status 'ERROR'.",
        ];

        self::assertEquals($expectedDebugMessages, $debugMessages);
    }

    public function testParseBatches(): void
    {
        $expectedDomains = [['google.com'], ['yahoo.com']];
        $expectedIps = [
            'google.com' => [
                '172.217.17.78',
            ],
            'yahoo.com' => [
                '111.117.17.78',
                '222.117.17.78',
            ],
        ];
        $batchSize = 3;
        $logger = new Logger();
        $ipAddressLog = new \ArrayObject();
        $ipAddressLog->assignIpAddressesCalls = [];
        $domainLog = new \ArrayObject();
        $domainLog->getDomainsByNamesCalls = [];

        $parser = new Parser(
            $batchSize,
            new ReaderFactory(),
            $this->getDomainManagerMock(2, 2, $domainLog),
            $this->getIpAddressManagerMock(2, 2, $ipAddressLog),
            $this->getEntityManagerMock(2, 2, 2, 2),
            $logger
        );

        $parser->parse(self::FILE);

        $getDomainsByNamesCalls = $domainLog->getDomainsByNamesCalls;
        foreach ($getDomainsByNamesCalls as $index => $getDomainsByNamesCall) {
            self::assertEquals([$expectedDomains[$index]], $getDomainsByNamesCall);

            $assignIpAddressesCalls = $ipAddressLog->assignIpAddressesCalls;

            foreach ($assignIpAddressesCalls as $assignIpAddressesCall) {
                /**
                 * @var DomainInterface $domain
                 * @var string[]        $ipAddresses
                 */
                [$domain, $ipAddresses] = $assignIpAddressesCall;
                self::assertEquals($expectedIps[$domain->getDomain()], $ipAddresses);
            }
        }

        $debugMessages = $logger->getLogs('debug');
        self::assertEquals(5, \count($debugMessages));

        $expectedDebugMessages = [
            "Record have invalid structure. 'status', 'answers' or 'additionals' is not found.",
            "Record have invalid structure. 'status', 'answers' or 'additionals' is not found.",
            "Record have invalid structure. 'status', 'answers' or 'additionals' is not found.",
            "Record have invalid structure. 'status', 'answers' or 'additionals' is not found.",
            "Record will be skipped due to invalid status 'ERROR'.",
        ];

        self::assertEquals($expectedDebugMessages, $debugMessages);
    }

    protected function getEntityManagerMock(
        int $beginCalls,
        int $commitCalls,
        int $flushCalls,
        int $clearCalls
    ): EntityManagerInterface {
        /** @var EntityManagerInterface|MockObject $manager */
        $manager = $this->getMockBuilder(EntityManager::class)
                        ->disableOriginalConstructor()
                        ->setMethods(
                            [
                                'beginTransaction',
                                'commit',
                                'flush',
                                'clear',
                            ]
                        )
                        ->getMock();

        $manager->expects(self::exactly($beginCalls))->method('beginTransaction');
        $manager->expects(self::exactly($commitCalls))->method('commit');
        $manager->expects(self::exactly($flushCalls))->method('flush');
        $manager->expects(self::exactly($clearCalls))->method('clear');

        return $manager;
    }

    protected function getDomainManagerMock(
        int $getByNameCalls,
        int $clearBufferCalls,
        \ArrayObject $log
    ): DomainManager {
        /** @var DomainManager|MockObject $manager */
        $manager = $this->getMockBuilder(DomainManager::class)
                        ->disableOriginalConstructor()
                        ->setMethods(['clearBuffer', 'getDomainsByNames'])
                        ->getMock();

        $manager->expects(self::exactly($clearBufferCalls))->method('clearBuffer');
        $manager->expects(self::exactly($getByNameCalls))->method('getDomainsByNames')->willReturnCallback(
            function (array $domainNames) use ($log) {
                $domains = [];
                $log->getDomainsByNamesCalls[] = \func_get_args();
                foreach ($domainNames as $name) {
                    $domain = new Domain();
                    $domain->setDomain($name);
                    $domains[$name] = $domain;
                }

                return $domains;
            }
        );

        return $manager;
    }

    protected function getIpAddressManagerMock(
        int $getByNameCalls,
        int $clearBufferCalls,
        \ArrayObject $log
    ): IpAddressManager {
        /** @var IpAddressManager|MockObject $manager */
        $manager = $this->getMockBuilder(IpAddressManager::class)
                        ->disableOriginalConstructor()
                        ->setMethods(['clearBuffer', 'assignIpAddresses'])
                        ->getMock();

        $manager->expects(self::exactly($clearBufferCalls))->method('clearBuffer');
        $manager->expects(self::exactly($getByNameCalls))->method('assignIpAddresses')->willReturnCallback(
            function (DomainInterface $domain, array $ipAddresses) use ($log) {
                $log->assignIpAddressesCalls[] = \func_get_args();
                $ipList = [];
                foreach ($ipAddresses as $address) {
                    $ip = new IpAddress();
                    $ip->setIp($address);
                    $ipList[] = $ip;
                }
                $domain->setIpList($ipList);

                return $domain;
            }
        );

        return $manager;
    }
}
