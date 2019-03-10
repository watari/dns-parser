<?php
declare(strict_types = 1);

namespace App\Helper;

class ValueHelper
{
    public static function isValidIp(string $ip): bool
    {
        return \filter_var($ip, \FILTER_VALIDATE_IP, \FILTER_FLAG_IPV4)
            || \filter_var($ip, \FILTER_VALIDATE_IP, \FILTER_FLAG_IPV6);
    }
}
