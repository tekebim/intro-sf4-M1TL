<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserFixtures extends Fixture
{
    /**
     * @var UserPasswordEncoderInterface
     */

    private $encoder;

    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }

    public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);

        $user = new User();
        $user->setEmail('admin@test.fr');
        $user->setRoles(['ROLE_ADMIN']);
        $user->setCountry('France');
        $user->setCity('Paris');
        $user->setIsAvailable(true);
        $user->setIsVerified(true);
        $user->setCompany('digital campus');
        $user->setAge(32);
        $user->setWebsiteUrl('http://localhost');
        $user->setPassword($this->encoder->encodePassword($user, 'Admin'));
        $manager->persist($user);
        $manager->flush();
    }
}
