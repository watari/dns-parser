<?php
declare(strict_types = 1);

namespace App\Repository\ORM;

use App\Repository\Interfaces\RepositoryInterface;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\EntityRepository;

abstract class Repository implements RepositoryInterface
{
    /** @var EntityRepository */
    protected $repository;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->repository = $entityManager->getRepository($this->getEntityClass());
    }

    abstract public function getEntityClass(): string;

    /**
     * @return object
     * @phpcsSuppress SlevomatCodingStandard.TypeHints.TypeHintDeclaration.MissingReturnTypeHint
     */
    public function createEntity()
    {
        $class = $this->getEntityClass();

        return new $class();
    }

    /**
     * @return object[]
     * @phpcsSuppress SlevomatCodingStandard.TypeHints.TypeHintDeclaration.MissingReturnTypeHint
     */
    public function findAll(): array
    {
        return $this->repository->findAll();
    }
}
