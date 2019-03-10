<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Service\Reader;

use App\Service\Reader\ReaderFactory;
use App\Service\Reader\ReaderInterface;
use PHPUnit\Framework\TestCase;

class ReaderFactoryTest extends TestCase
{
    protected const VALID_FILE = __DIR__ . '/../../../Fixtures/files/reader/valid.json';

    public function testBuildMissingFile(): void
    {
        $factory = new ReaderFactory();

        $reader = $factory->build(self::VALID_FILE);

        self::assertInstanceOf(ReaderInterface::class, $reader);
    }
}
