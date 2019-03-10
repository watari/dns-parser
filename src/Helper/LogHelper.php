<?php
declare(strict_types = 1);

namespace App\Helper;

class LogHelper
{

    /**
     * @param mixed  $payload
     *
     * @return mixed[]|array<string,mixed>
     */
    public static function prepareContext(string $file, int $line, $payload = []): array
    {
        return [
            'class' => $file,
            'line' => $line,
            'payload' => $payload,
        ];
    }
}
