<?php
declare(strict_types = 1);

namespace App\Service\Reader;

interface ReaderInterface
{
    public function open(): void;

    public function getRowIterator(): \Iterator;

    public function close(): void;
}
