<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Helper;

use App\Helper\ValueHelper;
use PHPUnit\Framework\TestCase;

class ValueHelperTest extends TestCase
{
    /**
     * @dataProvider getTestData
     */
    public function testIsValidIp(bool $isValid, string $ip, string $case): void
    {
        self::assertEquals($isValid, ValueHelper::isValidIp($ip), "Assertion failed for case '{$case}'");
    }

    /**
     * @return mixed[]|array<int,mixed>
     */
    public function getTestData(): array
    {
        return [
          [false, 'qwerty', 'random string'],
          [false, '127.1.1.qwerty', 'IPv4 invalid string'],
          [true, '127.1.1.1', 'IPv4 valid string'],
          [true, '127.1.1.1', 'IPv4 valid string'],
          [true, 'FE80:0000:0000:0000:0202:B3FF:FE1E:8329', 'IPv6 valid string'],
          [false, 'FE80:0000:0000:0000:0202:B3FFFE1E8329', 'IPv6-like invalid string'],
        ];
    }
}
