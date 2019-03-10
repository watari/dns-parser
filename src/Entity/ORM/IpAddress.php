<?php
declare(strict_types = 1);

namespace App\Entity\ORM;

use App\Entity\Interfaces\IpAddressInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Class IpAddress
 * @package App\Entity\ORM
 * @ORM\Entity()
 * @ORM\Table(name="ip_address")
 */
class IpAddress implements IpAddressInterface
{
    /**
     * @Assert\Ip(version="all")
     *
     * @ORM\Id()
     * @ORM\Column(type="string")
     *
     * @var string
     */
    protected $ip;

    public function getIp(): ?string
    {
        return $this->ip;
    }

    public function setIp(string $ip): void
    {
        $this->ip = $ip;
    }
}
