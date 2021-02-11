<?php

namespace App\Controller;

use App\Repository\RoomRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(RoomRepository $roomRepository): Response
    {

        $rooms = $roomRepository->findAll();

        // $brands = ['adidas', 'quechua', 'seagale', 'north-face'];

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            // 'brands' => $brands,
            'rooms' => $rooms
        ]);
    }
}
