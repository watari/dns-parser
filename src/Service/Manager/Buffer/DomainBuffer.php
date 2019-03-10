<?php
declare(strict_types = 1);

namespace App\Service\Manager\Buffer;

use App\Entity\Interfaces\DomainInterface;

class DomainBuffer
{

    /** @var DomainInterface[]|array<string,DomainInterface> */
    protected $buffer = [];


    public function getByName(string $domain): ?DomainInterface
    {
        return empty($this->buffer[$domain]) ? null : $this->buffer[$domain];
    }

    /**
     * @param string[] $domains
     *
     * @return DomainInterface[]
     */
    public function getByNames(array $domains): array
    {
        return \array_intersect_key($this->buffer, \array_flip($domains));
    }

    /**
     * @param DomainInterface[]|array<string,DomainInterface> $domains Domain entities indexed by their names.
     */
    public function addByNames(array $domains): void
    {
        $this->buffer += $domains;
    }

    public function clear(): void
    {
        $this->buffer = [];
    }

    public function clearByKey(string $domain): void
    {
        unset($this->buffer[$domain]);
    }
}
