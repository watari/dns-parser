<?php
declare(strict_types = 1);

namespace App\Service\Reader;

use App\Exception\FileCorruptedException;

class Reader implements ReaderInterface
{
    /** @var resource|null */
    protected $resource;

    /** @var string */
    protected $file;

    public function __construct(string $file)
    {
        if (!\file_exists($file)) {
            throw new \InvalidArgumentException("File '{$file}' does not exist.");
        }
        $this->file = $file;
    }

    /**
     * Create resource for reading.
     *
     * @throws \RuntimeException If file resource cannot be opened.
     */
    public function open(): void
    {
        $resource = \fopen($this->file, 'r');
        if ($resource === false) {
            throw new \RuntimeException("File '{$this->file}' cannot be opened.");
        }

        $this->resource = $resource;
    }

    /**
     * @return \Iterator|mixed[]
     * @throws FileCorruptedException If some of file lines contain not valid JSON file.
     */
    public function getRowIterator(): \Iterator
    {
        $line = $this->readLine();

        while ($line !== null) {
            yield $line;
            $line = $this->readLine();
        }
    }

    /**
     * Close resource after reading.
     *
     * @throws \RuntimeException If file resource cannot be closed.
     */
    public function close(): void
    {
        if (!\fclose($this->resource)) {
            throw new \RuntimeException("File '{$this->file}' cannot be closed.");
        }
    }

    /**
     * @return mixed[]|null|array<string,mixed>
     */
    protected function readLine(): ?array
    {
        $line = \fgets($this->resource);

        if ($line === false) {
            return null;
        }

        $data = \json_decode($line, true);
        if ($data === null) {
            throw new \App\Exception\FileCorruptedException($this->file, $line);
        }

        return $data;
    }
}
