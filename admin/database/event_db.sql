-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 15 déc. 2021 à 19:10
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `event_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `audience`
--

CREATE TABLE `audience` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `event_id` int(30) NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= pending, 1 =Paid',
  `attendance_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1= present',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = for verification,  1 = confirmed,2= declined',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `audience`
--

INSERT INTO `audience` (`id`, `name`, `contact`, `email`, `address`, `event_id`, `payment_status`, `attendance_status`, `status`, `date_created`) VALUES
(2, 'Hiba fazzeni', '+216 20 326 599', 'hibafazzeni@gmail.com', 'mannouba', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(4, 'f.benaissia', '+216 22 000 442', 'ferielbenaissia@gmail.com', 'ennasser', 4, 1, 0, 1, '2021-12-15 18:04:52');

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `id` int(30) NOT NULL,
  `venue_id` int(30) NOT NULL,
  `event` text NOT NULL,
  `description` text NOT NULL,
  `schedule` datetime NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Public, 2-Private',
  `audience_capacity` int(30) NOT NULL,
  `payment_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Free,payable',
  `amount` double NOT NULL DEFAULT 0,
  `banner` text NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `venue_id`, `event`, `description`, `schedule`, `type`, `audience_capacity`, `payment_type`, `amount`, `banner`, `date_created`) VALUES
(1, 1, 'Café et livre', '&lt;p&gt;&lt;/p&gt;&lt;h2 style=&quot;text-align: center; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;&lt;i style=&quot;text-align: center; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem; font-size: 24px;&quot;&gt;&lt;span style=&quot;font-size:20px;text-align: center; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;Venez pour d&eacute;guster le plus d&eacute;licieux caf&eacute; arabe tout en lisant votre livre devant la vue splendide de la mer de Sidi Bou.&lt;/span&gt;&lt;/i&gt;&lt;br style=&quot;text-align: center; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;&lt;/h2&gt;&lt;p&gt;&lt;/p&gt;', '2021-12-26 15:00:00', 1, 60, 2, 5, '1639581360_coffee&book.jpg', '0000-00-00 00:00:00'),
(2, 2, 'Exchange Book', '&lt;p style=&quot;text-align: center;&quot;&gt;Apportez vos livres pr&eacute;f&eacute;r&eacute;s et &eacute;changez vos inspirations avec les autres participants.&lt;br style=&quot;text-align: center;&quot;&gt;&lt;/p&gt;', '2022-01-08 15:00:00', 1, 45, 2, 1, '1639583820_exchangebook.jpg', '0000-00-00 00:00:00'),
(4, 3, 'Foire du livre', '&lt;p style=&quot;text-align: center;&quot;&gt;C&eacute;l&eacute;brons ensemble la foire du livre&lt;/p&gt;', '2021-12-12 10:00:00', 1, 20000, 2, 1, '1639584420_readtodiscuss.jpg', '0000-00-00 00:00:00'),
(5, 4, 'Analyse et discussions', '&lt;p style=&quot;text-align: center;&quot;&gt;Analyse et discussions des livres les plus tendance avec une rubrique sp&eacute;ciale autographe. Soyez nombreux !&lt;/p&gt;', '2022-02-06 14:00:00', 1, 1000, 2, 2, '1639586880_discussion.jpg', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'InspireBook ', 'inspirebook@gmail.com', '+216 71 000 350', '1639580460_book1.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;InspireBook is an online library created by students of Esprit in which you can buy your favorite books. Then, you can subscribe in different type of cultural events...&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'Feriel', '0192023a7bbd73250516f069df18b500', 1);

-- --------------------------------------------------------

--
-- Structure de la table `venue`
--

CREATE TABLE `venue` (
  `id` int(30) NOT NULL,
  `venue` text NOT NULL,
  `address` text NOT NULL,
  `description` text NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `venue`
--

INSERT INTO `venue` (`id`, `venue`, `address`, `description`, `rate`) VALUES
(1, 'SIDI BOU', 'Café des délices_SidiBou', 'Café et livre: Venez pour déguster le plus délicieux café arabe tout en lisant votre livre devant la vue splendide de la mer de Sidi Bou', 5),
(2, 'Médiathèque', 'médiathèque Ariana', 'Exchange Book: Apportez vos livres préférés et échangez vos inspirations avec les autres participants', 1),
(3, 'Kram', 'Palais des foires_Kram', 'Foire Du livre: célébrons ensemble la foire du livre', 1),
(4, 'Cité de la culture', 'cité de la culture de tunis ', 'Analyse et discussions des livres les plus tendance avec une rubrique spéciale autographe. Soyez nombreux !', 2);

-- --------------------------------------------------------

--
-- Structure de la table `venue_booking`
--

CREATE TABLE `venue_booking` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `venue_id` int(30) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-for verification,1=confirmed,2=canceled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `venue_booking`
--

INSERT INTO `venue_booking` (`id`, `name`, `address`, `email`, `contact`, `venue_id`, `duration`, `datetime`, `status`) VALUES
(1, 'Hiba fazzeni', 'manouba', 'hibafazzeni@gmail.com', '+216 20 326 599', 2, '3hours', '2021-11-12 15:00:00', 1),
(3, 'f.benaissia', '', 'ferielbenaissia@gmail.com', '+216 22 000 442', 1, '', '0000-00-00 00:00:00', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `venue_booking`
--
ALTER TABLE `venue_booking`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `audience`
--
ALTER TABLE `audience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `venue`
--
ALTER TABLE `venue`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `venue_booking`
--
ALTER TABLE `venue_booking`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
