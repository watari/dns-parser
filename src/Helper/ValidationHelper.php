<?php
declare(strict_types = 1);

namespace App\Helper;

use Symfony\Component\Validator\ConstraintViolationListInterface;

class ValidationHelper
{
    public static function violationsToString(ConstraintViolationListInterface $constraintViolationList): string
    {
        return \implode('; ', \iterator_to_array($constraintViolationList));
    }
}
