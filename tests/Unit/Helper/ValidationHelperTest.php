<?php
declare(strict_types = 1);

namespace App\Tests\Unit\Helper;

use App\Helper\ValidationHelper;
use PHPUnit\Framework\TestCase;
use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;

class ValidationHelperTest extends TestCase
{
    public function testViolationsToStringEmptyViolationsList(): void
    {
        $errors = new ConstraintViolationList();

        $errorsString = ValidationHelper::violationsToString($errors);

        self::assertEmpty($errorsString);
    }

    public function testViolationsToString(): void
    {
        $errors = new ConstraintViolationList(
            [
                new ConstraintViolation("Test 1", null, [], null, 'test', 'test'),
                new ConstraintViolation("Test 2", null, [], null, 'test', 'test'),
            ]
        );

        $errorsString = ValidationHelper::violationsToString($errors);

        self::assertEquals("test:\n    Test 1; test:\n    Test 2", $errorsString);
    }
}
