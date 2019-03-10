<?php
declare(strict_types = 1);

namespace App\Repository\ORM;

use App\Entity\Interfaces\IpAddressInterface;
use App\Entity\ORM\IpAddress;
use App\Repository\Interfaces\IpAddressRepositoryInterface;

/**
 * Class IpAddressRepository
 * @package App\Repository\ORM
 *
 * @method IpAddressInterface createEntity()
 */
class IpAddressRepository extends Repository implements IpAddressRepositoryInterface
{

    public function getEntityClass(): string
    {
        return IpAddress::class;
    }

    public function find(string $id, ?int $lockMode = null, ?int $lockVersion = null): ?IpAddressInterface
    {
        return $this->repository->find($id, $lockMode, $lockVersion);
    }
}
