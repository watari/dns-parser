<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Service\Manager;

use App\Entity\Interfaces\DomainInterface;
use App\Entity\ORM\Domain;
use App\Helper\DomainHelper;
use App\Repository\Interfaces\DomainRepositoryInterface;
use App\Repository\ORM\DomainRepository;
use App\Service\Manager\DomainManager;
use App\Service\Manager\Buffer\DomainBuffer;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use PHPUnit\Framework\MockObject\MockObject;
use PHPUnit\Framework\TestCase;
use Symfony\Component\HttpKernel\Tests\Logger;
use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Component\Validator\Validator\RecursiveValidator;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class DomainManagerTest extends TestCase
{
    public function testGetDomainsByNamesAllPresent(): void
    {
        $domainNames = [
            'google.com',
            'yahoo.com',
            'dou.ua',
        ];
        $logger = new Logger();
        $entityManagerLog = new \ArrayObject();
        $entityManagerLog->persist = [];

        $domains = [];
        foreach ($domainNames as $name) {
            $domains[$name] = $this->createDomain($name);
        }

        $buffer = new DomainBuffer();

        $manager = new DomainManager(
            $this->getDomainRepositoryMock($domains),
            $this->getValidatorMock(0, false),
            $this->getEntityManagerMock(0, $entityManagerLog),
            $buffer,
            $logger
        );

        $actualDomains = $manager->getDomainsByNames($domainNames);

        self::assertEquals($domains, $actualDomains);
        self::assertEquals($domains, $buffer->getByNames($domainNames));
    }

    public function testGetDomainsByNamesParentsPresent(): void
    {
        $parentNames = [
            'google.com',
            'com',
        ];
        $domainNames = [
            'image.google.com',
        ];
        $logger = new Logger();
        $entityManagerLog = new \ArrayObject();
        $entityManagerLog->persist = [];

        $domains = [];
        foreach ($parentNames as $name) {
            $domains[$name] = $this->createDomain($name);
        }

        $buffer = new DomainBuffer();

        $manager = new DomainManager(
            $this->getDomainRepositoryMock($domains),
            $this->getValidatorMock(1, false),
            $this->getEntityManagerMock(1, $entityManagerLog),
            $buffer,
            $logger
        );

        $actualDomains = $manager->getDomainsByNames($domainNames);

        $domainName = $domainNames[0];
        self::assertEquals(1, \count($actualDomains));
        self::assertEquals($domainName, $actualDomains[$domainName]->getDomain());
        self::assertEquals($domains[$parentNames[0]], $actualDomains[$domainName]->getParent());
        self::assertEquals($entityManagerLog->persist[0], $actualDomains[$domainName]);
    }

    public function testGetDomainsByNamesAllMissing(): void
    {
        $parentNames = [];
        $domainNames = [
            'image.google.com',
        ];
        $logger = new Logger();
        $entityManagerLog = new \ArrayObject();
        $entityManagerLog->persist = [];

        $domains = [];
        foreach ($parentNames as $name) {
            $domains[$name] = $this->createDomain($name);
        }

        $buffer = new DomainBuffer();

        $manager = new DomainManager(
            $this->getDomainRepositoryMock($domains),
            $this->getValidatorMock(3, false),
            $this->getEntityManagerMock(3, $entityManagerLog),
            $buffer,
            $logger
        );

        $actualDomains = $manager->getDomainsByNames($domainNames);

        $domainName = $domainNames[0];
        $parentName = DomainHelper::getParentDomain($domainName);
        $rootDomainName = DomainHelper::getParentDomain($parentName);
        self::assertEquals(1, \count($actualDomains));
        self::assertEquals($domainName, $actualDomains[$domainName]->getDomain());
        $parent = $actualDomains[$domainName]->getParent();
        $root = $parent->getParent();
        self::assertEquals($parentName, $parent->getDomain());
        self::assertEquals($rootDomainName, $root->getDomain());
        self::assertNull($root->getParent());
        self::assertEquals($entityManagerLog->persist[0], $root);
        self::assertEquals($entityManagerLog->persist[1], $parent);
        self::assertEquals($entityManagerLog->persist[2], $actualDomains[$domainName]);
    }

    public function testGetDomainsByNamesValidationFailsForParent(): void
    {
        $parentNames = [];
        $domainNames = [
            'image.google.com',
        ];
        $logger = new Logger();
        $entityManagerLog = new \ArrayObject();
        $entityManagerLog->persist = [];

        $domains = [];
        foreach ($parentNames as $name) {
            $domains[$name] = $this->createDomain($name);
        }

        $buffer = new DomainBuffer();

        $manager = new DomainManager(
            $this->getDomainRepositoryMock($domains),
            $this->getValidatorMock(1, false, ['com']),
            $this->getEntityManagerMock(0, $entityManagerLog),
            $buffer,
            $logger
        );

        $actualDomains = $manager->getDomainsByNames($domainNames);

        self::assertEquals(0, \count($actualDomains));
        $warnings = $logger->getLogs('warning');
        self::assertEquals(3, \count($warnings));
        self::assertStringStartsWith("Created domain instance for domain 'com' is not valid.", $warnings[0]);
        self::assertStringStartsWith("Parent for domain 'google.com' cannot be located.", $warnings[1]);
        self::assertStringStartsWith("Parent for domain 'image.google.com' cannot be located.", $warnings[2]);
    }

    public function testGetDomainsByNamesBufferingCheck(): void
    {
        $domainNames = [
            'google.com',
            'yahoo.com',
            'dou.ua',
        ];
        $logger = new Logger();
        $entityManagerLog = new \ArrayObject();
        $entityManagerLog->persist = [];

        $domains = [];
        foreach ($domainNames as $name) {
            $domains[$name] = $this->createDomain($name);
        }

        $buffer = new DomainBuffer();
        $buffer->addByNames($domains);

        $manager = new DomainManager(
            $this->getDomainRepositoryMock([]),
            $this->getValidatorMock(0, false, \array_merge($domainNames, ['com', 'ua'])),
            $this->getEntityManagerMock(0, $entityManagerLog),
            $buffer,
            $logger
        );

        $actualDomains = $manager->getDomainsByNames($domainNames);

        self::assertEquals($domains, $actualDomains);
        self::assertEquals($domains, $buffer->getByNames($domainNames));


        $manager = new DomainManager(
            $this->getDomainRepositoryMock([]),
            $this->getValidatorMock(1, false, ['ua']),
            $this->getEntityManagerMock(0, $entityManagerLog),
            $buffer,
            $logger
        );
        $manager->clearDomainBufferEntry('dou.ua');

        $actualDomains = $manager->getDomainsByNames($domainNames);

        self::assertEquals(2, \count($actualDomains));
        self::assertArrayNotHasKey('dou.ua', $actualDomains);


        $manager = new DomainManager(
            $this->getDomainRepositoryMock([]),
            $this->getValidatorMock(3, false, \array_merge($domainNames, ['com', 'ua'])),
            $this->getEntityManagerMock(0, $entityManagerLog),
            $buffer,
            $logger
        );
        $manager->clearBuffer();

        self::assertEquals(0, \count($manager->getDomainsByNames($domainNames)));
    }

    protected function createDomain(string $domainName): DomainInterface
    {
        $domain = new Domain();
        $domain->setDomain($domainName);

        return $domain;
    }

    protected function getDomainRepositoryMock(array $domains): DomainRepositoryInterface
    {
        /** @var MockObject|DomainRepositoryInterface $repository */
        $repository = $this->getMockBuilder(DomainRepository::class)
                           ->disableOriginalConstructor()
                           ->setMethods(['findByNames'])
                           ->getMock();

        $repository->method('findByNames')->willReturnCallback(
            function (array $domainNames) use ($domains) {
                return \array_intersect_key($domains, \array_flip($domainNames));
            }
        );

        return $repository;
    }

    protected function getEntityManagerMock(int $persistCalls, \ArrayObject $log): EntityManagerInterface
    {
        $log->persist = [];
        /** @var EntityManagerInterface|MockObject $manager */
        $manager = $this->getMockBuilder(EntityManager::class)
                        ->disableOriginalConstructor()
                        ->setMethods(['persist'])
                        ->getMock();

        $manager->expects(self::exactly($persistCalls))->method('persist')->willReturnCallback(
            function ($object) use ($log): void {
                $log->persist[] = $object;
            }
        );

        return $manager;
    }

    protected function getValidatorMock(
        int $callsAmount,
        bool $shouldFail = false,
        array $shouldFailForNames = []
    ): ValidatorInterface {
        /** @var ValidatorInterface|MockObject $validator */
        $validator = $this->getMockBuilder(RecursiveValidator::class)
                          ->disableOriginalConstructor()
                          ->setMethods(['validate'])
                          ->getMock();

        $validator->expects(self::exactly($callsAmount))->method('validate')->willReturnCallback(
            function ($value, $constraints = null, $groups = null) use ($shouldFail, $shouldFailForNames) {
                $constrains = [];
                /** @var DomainInterface $value */
                if (\in_array($value->getDomain(), $shouldFailForNames)) {
                    $constrains[] = new ConstraintViolation(
                        'Test validation fail',
                        null,
                        [],
                        $this,
                        null,
                        'test'
                    );

                }

                return new ConstraintViolationList($constrains);
            }
        );

        return $validator;
    }
}
