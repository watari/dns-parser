<?php
declare(strict_types = 1);

namespace App\Repository\Interfaces;

use App\Entity\Interfaces\DomainInterface;

/**
 * Interface DomainRepositoryInterface
 * @package App\Repository\Interfaces
 *
 * @method DomainInterface createEntity()
 */
interface DomainRepositoryInterface extends RepositoryInterface
{

    /**
     * Find domain entities for specified list of domain names.
     *
     * @param string[] $domainNames
     *
     * @return DomainInterface[]|array<string,DomainInterface> List of domain entities indexed by their names.
     */
    public function findByNames(array $domainNames): array;
}
