<?php
declare(strict_types = 1);

namespace App\Service\Reader;

class ReaderFactory
{
    public function build(string $file): ReaderInterface
    {
        return new Reader($file);
    }
}
