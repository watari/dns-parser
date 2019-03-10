<?php
declare(strict_types = 1);

namespace App\Helper;

class DomainHelper
{

    public static function getParentDomain(string $domain): ?string
    {
        if ($domain === '') {
            throw new \InvalidArgumentException("Passed domain is empty string");
        }

        $firstDotPosition = \strpos($domain, '.');
        if ($firstDotPosition === false) {
            return null;
        }

        return \mb_substr($domain, $firstDotPosition + 1);
    }
}
