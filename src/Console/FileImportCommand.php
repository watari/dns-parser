<?php
declare(strict_types = 1);

namespace App\Console;

use App\Service\Parser;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class FileImportCommand extends Command
{

    /** @var Parser */
    protected $parser;

    public function __construct(Parser $parser, ?string $name = null)
    {
        parent::__construct($name);
        $this->parser = $parser;
    }

    protected function configure(): void
    {
        parent::configure();
        $this->setName('parser:import');
        $this->addArgument('file', InputArgument::REQUIRED, 'File with DNS information');
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $file = $input->getArgument('file');

        if (!\file_exists($file)) {
            throw new \InvalidArgumentException("File '{$file}' does not exist.");
        }

        $this->parser->parse($file);

        return 0;
    }
}
