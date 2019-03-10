<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Helper;

use App\Helper\LogHelper;
use PHPUnit\Framework\TestCase;

class LogHelperTest extends TestCase
{
    public function testPrepareContext(): void
    {
        $file = __FILE__;
        $line = __LINE__;
        $payload = ['payload'];

        $context = LogHelper::prepareContext($file, $line, $payload);

        self::assertEquals(
            [
                'class' => $file,
                'line' => $line,
                'payload' => $payload,
            ],
            $context
        );
    }
}
