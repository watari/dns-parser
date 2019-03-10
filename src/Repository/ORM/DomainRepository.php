<?php
declare(strict_types = 1);

namespace App\Repository\ORM;

use App\Entity\Interfaces\DomainInterface;
use App\Entity\ORM\Domain;
use App\Repository\Interfaces\DomainRepositoryInterface;

/**
 * Class DomainRepository
 * @package App\Repository\ORM
 *
 * @method DomainInterface createEntity()
 */
class DomainRepository extends Repository implements DomainRepositoryInterface
{

    public function getEntityClass(): string
    {
        return Domain::class;
    }

    /**
     * @param string[] $domainNames
     *
     * @return DomainInterface[]|array<string,DomainInterface>
     */
    public function findByNames(array $domainNames): array
    {
        /** @var DomainInterface[] $domains */
        $domains = $this->repository->findBy(['domain' => $domainNames]);

        $indexedByName = [];
        foreach ($domains as $domain) {
            $indexedByName[$domain->getDomain()] = $domain;
        }

        return $indexedByName;
    }
}
