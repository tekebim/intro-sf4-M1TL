-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 17, 2021 at 01:37 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intro_sf4`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(7, 'Bureau individuel'),
(12, 'Salle de réunion'),
(13, 'Salle de co-working');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210211111754', '2021-02-11 11:20:52', 52),
('DoctrineMigrations\\Version20210211132542', '2021-02-11 13:27:34', 157),
('DoctrineMigrations\\Version20210211135912', '2021-02-11 13:59:40', 47),
('DoctrineMigrations\\Version20210211155542', '2021-02-11 15:58:30', 187),
('DoctrineMigrations\\Version20210212084047', '2021-02-12 08:41:07', 93),
('DoctrineMigrations\\Version20210212092453', '2021-02-12 09:24:58', 51),
('DoctrineMigrations\\Version20210217100419', '2021-02-17 10:04:27', 100),
('DoctrineMigrations\\Version20210217104602', '2021-02-17 10:46:07', 158);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor` int(11) NOT NULL,
  `has_projector` tinyint(1) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `has_internet` tinyint(1) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `name`, `capacity`, `category_id`, `city`, `floor`, `has_projector`, `is_available`, `has_internet`, `address`, `user_id`) VALUES
(177, 'room numero 363', 10, 7, 'Paris', 0, 0, 1, 0, '14 chemin de l\'arbre', 6),
(178, 'salle R01', 30, 12, 'Paris', 1, 1, 1, 0, '9bis impasse lorem', 6),
(179, 'room numero 364', 12, 7, 'Paris', 2, 0, 1, 0, '123 boulevard saint-germain 75005', 6),
(180, 'Area 2', 10, 13, 'Paris', 1, 0, 1, 1, '1 rue lorem ipsum', 7),
(181, 'Salle mediterranee', 2, 7, 'Marseille', 2, 0, 0, 1, 'soon', 6),
(182, 'Espace bleu', 20, 13, 'Lyon', 3, 1, 1, 1, '2 impasse dublin', 9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `website_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`, `country`, `is_available`, `company`, `city`, `age`, `website_url`, `created_at`, `firstname`, `lastname`) VALUES
(6, 'admin@test.fr', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$6ta4SEMsM4F97vmLhPNK/g$Vq5AHo5CwOUY+TrsS8Ly4bCeFawixCXdaBXSbMLVrzs', 1, 'France', 1, 'digital campus', 'Paris', 32, 'http://localhost', '2021-02-12 09:25:14', 'Jhon', 'Doe'),
(7, 'test09h53@yopmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$CNxwHe4cWAIUQFzI8fxgBA$wRKbsRopBSIFDdRchyix9gsLhV/KdjmMPZ9Jjvn3K7Q', 0, 'AF', 1, 'test09h53', 'test09h53', 10, 'htto', '2021-02-12 09:46:39', 'Paul', 'Simpson'),
(8, 'test12h23@yopmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$FYkaXHd2roBFJfc/UHlHAg$MOiKsdJG1LgryUCcMo1wWG2eTbh8+j+iHoejfO5s/xA', 1, 'FR', 1, 'digital', 'paris', 20, 'none', '2021-02-12 11:24:09', 'Edward', 'Snowden'),
(9, 'test11h48@local.dev', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$bG/XcaXDYiTzXlAR5g3R3w$gW120mX5vWuOpllmUl1dnMiz+jsvyhp5yaIHnz0d6OU', 0, 'DE', 1, 'Skoda lab', 'Dortmund', 12, 'none', '2021-02-17 10:49:38', 'josh', 'brandon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_729F519B12469DE2` (`category_id`),
  ADD KEY `IDX_729F519BA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `FK_729F519B12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_729F519BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
