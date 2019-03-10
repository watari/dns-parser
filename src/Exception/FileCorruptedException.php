<?php
declare(strict_types = 1);

namespace App\Exception;

class FileCorruptedException extends \RuntimeException
{
    /** @var string */
    protected $corruptedLine;

    public function __construct(string $file, string $corruptedLine, int $code = 0, \Throwable $previous = null)
    {
        parent::__construct("File '{$file}' is corrupted: detected line with not valid JSON data.", $code, $previous);
        $this->corruptedLine = $corruptedLine;
    }

    public function getCorruptedLine(): string
    {
        return $this->corruptedLine;
    }
}
