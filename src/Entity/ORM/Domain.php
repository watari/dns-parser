<?php
declare(strict_types = 1);

namespace App\Entity\ORM;

use App\Entity\Interfaces\DomainInterface;
use App\Entity\Interfaces\IpAddressInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Class Domain
 * @package App\Entity\ORM
 *
 * @ORM\Entity()
 * @ORM\Table(name="domain")
 */
class Domain implements DomainInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\Column(type="integer")
     *
     * @var int
     */
    protected $id;

    /**
     * @Assert\NotBlank()
     * @ORM\Column(type="string", unique=true)
     *
     * @var string
     */
    protected $domain;

    /**
     * @ORM\ManyToOne(targetEntity=Domain::class, cascade={"all"})
     * @ORM\JoinColumn(name="parent_domain_id",nullable=true)
     *
     * @var DomainInterface|null
     */
    protected $parent;

    /**
     * @ORM\ManyToMany(targetEntity=IpAddress::class, cascade={"all"}, orphanRemoval=true)
     * @ORM\JoinTable(
     *     name="domain_ip",
     *     joinColumns={@ORM\JoinColumn(name="domain_id", referencedColumnName="id")},
     *     inverseJoinColumns={@ORM\JoinColumn(name="ip", referencedColumnName="ip")}
     * )
     *
     * @var Collection
     */
    protected $ipList;


    public function __construct()
    {
        $this->ipList = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function getDomain(): ?string
    {
        return $this->domain;
    }

    public function setDomain(string $domain): void
    {
        $this->domain = $domain;
    }

    public function getParent(): ?DomainInterface
    {
        return $this->parent;
    }

    public function setParent(?DomainInterface $parent): void
    {
        $this->parent = $parent;
    }

    /**
     * @return IpAddressInterface[]
     */
    public function getIpList(): array
    {
        return $this->ipList->toArray();
    }

    /**
     * @param IpAddressInterface[] $ipList
     */
    public function setIpList(array $ipList): void
    {
        $this->ipList->clear();
        foreach ($ipList as $ip) {
            $this->ipList->add($ip);
        }
    }
}
