<?php
declare(strict_types = 1);

namespace App\Entity\Interfaces;

interface IpAddressInterface
{
    public function getIp(): ?string;

    public function setIp(string $id): void;
}
