<?php
declare(strict_types = 1);

namespace App\Entity\Interfaces;

interface DomainInterface
{
    public function getId(): ?int;

    public function setId(int $id): void;

    public function getDomain(): ?string;

    public function setDomain(string $domain): void;

    public function getParent(): ?DomainInterface;

    public function setParent(?DomainInterface $parent): void;

    /**
     * @return IpAddressInterface[]
     */
    public function getIpList(): array;

    /**
     * @param IpAddressInterface[] $ipList
     */
    public function setIpList(array $ipList): void;
}
