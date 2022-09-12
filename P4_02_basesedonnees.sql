-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 11 oct. 2021 à 15:06
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressfood-hocine`
--

-- --------------------------------------------------------

--
-- Structure de la table `ef_command`
--

DROP TABLE IF EXISTS `ef_command`;
CREATE TABLE IF NOT EXISTS `ef_command` (
  `id` int NOT NULL,
  `command_number` smallint(3) UNSIGNED ZEROFILL NOT NULL,
  `content` varchar(255) NOT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `delivery_time` time NOT NULL,
  `command_date` datetime NOT NULL,
  `status` tinyint NOT NULL,
  `user_address_id` int NOT NULL,
  `user_client_id` int NOT NULL,
  `user_delivery_man_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ef_user_ef_command_fk` (`user_client_id`) USING BTREE,
  KEY `ef_user_ef_command_fk1` (`user_delivery_man_id`) USING BTREE,
  KEY `ef_user_address_ef_command_fk` (`user_address_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ef_command`
--

INSERT INTO `ef_command` (`id`, `command_number`, `content`, `total_price`, `delivery_time`, `command_date`, `status`, `user_address_id`, `user_client_id`, `user_delivery_man_id`) VALUES
(1, 001, 'poulet fumé\r\nrôti au miel ', '27.80', '00:00:00', '2021-09-20 10:10:30', 1, 1, 1, 2),
(2, 002, 'Boeuf aux carottes, tiramisu', '18.80', '00:00:00', '2021-09-20 20:30:00', 1, 3, 4, 2),
(3, 003, 'rôti au miel\r\ntiramisu', '22.80', '00:00:00', '2021-08-02 14:51:03', 1, 4, 5, 6);

-- --------------------------------------------------------

--
-- Structure de la table `ef_command_dish`
--

DROP TABLE IF EXISTS `ef_command_dish`;
CREATE TABLE IF NOT EXISTS `ef_command_dish` (
  `dish_id` int NOT NULL,
  `command_id` int NOT NULL,
  `quantity` tinyint NOT NULL,
  PRIMARY KEY (`dish_id`,`command_id`),
  KEY `command_command_dish_fk` (`command_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ef_command_dish`
--

INSERT INTO `ef_command_dish` (`dish_id`, `command_id`, `quantity`) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(4, 2, 1),
(4, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ef_delivery_man_informations`
--

DROP TABLE IF EXISTS `ef_delivery_man_informations`;
CREATE TABLE IF NOT EXISTS `ef_delivery_man_informations` (
  `id` int NOT NULL,
  `position` varchar(60) NOT NULL,
  `availablity` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ef_user_ef_delivery_man_informations_fk` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ef_delivery_man_informations`
--

INSERT INTO `ef_delivery_man_informations` (`id`, `position`, `availablity`, `user_id`) VALUES
(1, '39,28°;76,60°', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ef_dish`
--

DROP TABLE IF EXISTS `ef_dish`;
CREATE TABLE IF NOT EXISTS `ef_dish` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `ingredients` varchar(255) NOT NULL,
  `dish_category` varchar(20) NOT NULL,
  `dish_price` decimal(5,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_dish_fk` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ef_dish`
--

INSERT INTO `ef_dish` (`id`, `name`, `ingredients`, `dish_category`, `dish_price`, `created_at`, `is_available`, `user_id`) VALUES
(1, 'poulet fumé', 'poulet\r\népices\r\nhuile de colza', 'plat', '13.90', '0000-00-00 00:00:00', 0, 3),
(2, 'rôti au miel', 'viande bovine\r\nmiel\r\n', 'plat', '17.90', '0000-00-00 00:00:00', 0, 3),
(3, 'Bœuf aux carottes', 'viande de boeuf\r\ncarottes\r\n', 'plat', '15.10', '0000-00-00 00:00:00', 0, 3),
(4, 'tiramisu', 'crème de\r\nlait', 'dessert', '4.90', '0000-00-00 00:00:00', 0, 3),
(5, 'soufflé glacé aux framboises', 'framboises, etc', 'dessert', '5.00', '0000-00-00 00:00:00', 0, 3);

-- --------------------------------------------------------

--
-- Structure de la table `ef_user`
--

DROP TABLE IF EXISTS `ef_user`;
CREATE TABLE IF NOT EXISTS `ef_user` (
  `id` int NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `date_birth` date NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `role` varchar(100) NOT NULL,
  `registration_number` varchar(40) DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ef_user`
--

INSERT INTO `ef_user` (`id`, `last_name`, `first_name`, `date_birth`, `phone_number`, `email`, `password`, `created_at`, `role`, `registration_number`, `is_enable`) VALUES
(1, 'patrice', 'focault', '1996-02-12', '0542541214', 'b.ocine@live.fr', '3b8910cdef4708aa637cbe752c788295', '2021-09-20', 'client', '', 1),
(2, 'coteaux', 'alex', '1989-07-06', '0652541214', 'b.mulawi@gmail.com', 'bec9bc8c31fe276c06c9522bb12ae5c2', '2021-09-20', 'livreur', '', 1),
(3, 'bouquet', 'celine', '1996-08-23', '0652541214', '', '68629db6e9afad3deb177f00978061d2', '2021-09-20', 'equipier ', '1214121', 1),
(4, 'amar', 'eric', '1993-01-08', '0542541241', 'amar-eric@live.fr', '660330d60fbc1a241be39280696b2942', '2021-09-20', 'client', '', 1),
(5, 'priou', 'natacha', '1978-02-25', '0652541214', 'priou.natacha@gmail.com', 'natacha78', '2021-08-02', 'client', NULL, 1),
(6, 'dannois', 'chel', '1993-05-23', '0521521425', 'dannois-chel@gmail.com', 'dannoischel', '2021-10-01', 'livreur', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ef_user_address`
--

DROP TABLE IF EXISTS `ef_user_address`;
CREATE TABLE IF NOT EXISTS `ef_user_address` (
  `id` int NOT NULL,
  `number_wording_way` varchar(100) NOT NULL,
  `city` varchar(60) NOT NULL,
  `zip_code` char(5) NOT NULL,
  `door_number` tinyint NOT NULL,
  `floor_number` tinyint NOT NULL,
  `is_default_address` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ef_user_ef_user_address_fk` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ef_user_address`
--

INSERT INTO `ef_user_address` (`id`, `number_wording_way`, `city`, `zip_code`, `door_number`, `floor_number`, `is_default_address`, `user_id`) VALUES
(1, '12 rue paul dautier', 'velizy villacoublay', '78140', 0, 0, 1, 1),
(3, '3 rue des erables', 'nanterre', '92000', 0, 0, 1, 1),
(4, '16 rue des états généreaux', 'versailles', '78000', 0, 0, 1, 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
