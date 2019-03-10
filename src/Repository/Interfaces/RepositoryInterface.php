<?php
declare(strict_types = 1);

namespace App\Repository\Interfaces;

interface RepositoryInterface
{

    /**
     * @return object
     * @phpcsSuppress SlevomatCodingStandard.TypeHints.TypeHintDeclaration.MissingReturnTypeHint
     */
    public function createEntity();
    /**
     * @return object[]
     * @phpcsSuppress SlevomatCodingStandard.TypeHints.TypeHintDeclaration.MissingReturnTypeHint
     */
    public function findAll(): array;

    public function getEntityClass(): string;
}
