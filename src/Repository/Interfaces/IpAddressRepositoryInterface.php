<?php
declare(strict_types = 1);

namespace App\Repository\Interfaces;

use App\Entity\Interfaces\IpAddressInterface;

/**
 * Interface IpAddressRepositoryInterface
 * @package App\Repository\Interfaces
 *
 * @method IpAddressInterface createEntity()
 */
interface IpAddressRepositoryInterface extends RepositoryInterface
{

    public function find(string $id, ?int $lockMode = null, ?int $lockVersion = null): ?IpAddressInterface;
}
