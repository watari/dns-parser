<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Service\Reader;

use App\Service\Reader\Reader;
use PHPUnit\Framework\TestCase;

class ReaderTest extends TestCase
{
    protected const VALID_FILE = __DIR__ . '/../../../Fixtures/files/reader/valid.json';
    protected const EMPTY_FILE = __DIR__ . '/../../../Fixtures/files/reader/empty.json';
    protected const CORRUPTED_FILE = __DIR__ . '/../../../Fixtures/files/reader/corrupted_line.json';

    public function testCreateReaderFileNotExistException(): void
    {
        $file = "fake.file";
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage("File '{$file}' does not exist.");
        new Reader($file);
    }

    public function testReadEmptyFile(): void
    {

        $reader = new Reader(self::EMPTY_FILE);
        $reader->open();

        $rows = \iterator_to_array($reader->getRowIterator());

        $reader->close();

        self::assertEmpty($rows);
    }

    public function testReadCorruptedFile(): void
    {

        $reader = new Reader(self::CORRUPTED_FILE);
        $reader->open();

        $this->expectException(\App\Exception\FileCorruptedException::class);
        $this->expectExceptionMessage(
            "File '" . self::CORRUPTED_FILE . "' is corrupted: detected line with not valid JSON data."
        );
        \iterator_to_array($reader->getRowIterator());
    }

    public function testReadValidFile(): void
    {

        $reader = new Reader(self::VALID_FILE);
        $reader->open();

        $rows = \iterator_to_array($reader->getRowIterator());
        self::assertEquals(1, \count($rows));
        self::assertArrayHasKey('name', $rows[0]);
        self::assertArrayHasKey('class', $rows[0]);
        self::assertArrayHasKey('status', $rows[0]);
        self::assertArrayHasKey('data', $rows[0]);
        self::assertArrayHasKey('answers', $rows[0]['data']);
        self::assertArrayHasKey('additionals', $rows[0]['data']);
    }
}
