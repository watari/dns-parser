<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Console;

use App\Console\FileImportCommand;
use App\Service\Parser;
use PHPUnit\Framework\MockObject\MockObject;
use PHPUnit\Framework\TestCase;
use Symfony\Component\Console\Tester\CommandTester;

class FileImportCommandTest extends TestCase
{
    protected const FILE = __DIR__ . '/../../Fixtures/files/parser/valid.json';

    public function testRunFileNotSpecified(): void
    {
        $tester = new CommandTester(new FileImportCommand($this->getParseMock(0)));

        $this->expectException(\RuntimeException::class);
        $this->expectExceptionMessage("Not enough arguments (missing: \"file\")");
        $tester->execute([]);
    }

    public function testRunFileNotExists(): void
    {
        $file = 'fake.file';
        $tester = new CommandTester(new FileImportCommand($this->getParseMock(0)));

        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage("File '{$file}' does not exist.");
        $tester->execute(['file' => $file]);
    }

    public function testRun(): void
    {
        $file = self::FILE;
        $tester = new CommandTester(new FileImportCommand($this->getParseMock(1, $file)));

        $tester->execute(['file' => $file]);
    }

    protected function getParseMock(int $callsAmount, ?string $file = null): Parser
    {
        /** @var Parser|MockObject $parser */
        $parser = $this->getMockBuilder(Parser::class)
            ->disableOriginalConstructor()
            ->setMethods(['parse'])
            ->getMock();

        $parser->expects(self::exactly($callsAmount))->method('parse')->with($file);

        return $parser;
    }
}
