<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Helper;

use App\Helper\DomainHelper;
use PHPUnit\Framework\TestCase;

class DomainHelperTest extends TestCase
{
    public function testGetParentDomainEmptyStringException(): void
    {
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage("Passed domain is empty string");
        DomainHelper::getParentDomain('');
    }

    public function testGetParentDomainRootDomain(): void
    {
        $parent = DomainHelper::getParentDomain('com');
        self::assertNull($parent);
    }

    public function testGetParentDomainRegularDomain(): void
    {
        $parent = DomainHelper::getParentDomain('example.com');
        self::assertEquals('com', $parent);
    }
}
