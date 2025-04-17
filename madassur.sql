-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 17 avr. 2025 à 12:52
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `madassur`
--

-- --------------------------------------------------------

--
-- Structure de la table `assurances`
--

CREATE TABLE `assurances` (
  `id_assurances` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `mdp` varchar(20) NOT NULL,
  `image` varchar(50) NOT NULL,
  `lien` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `assurances`
--

INSERT INTO `assurances` (`id_assurances`, `nom`, `email`, `mdp`, `image`, `lien`) VALUES
(2, 'Assurance Ny Havana', 'havana@email.com', 'azerty', 'img/Havana.png', 'havana.php'),
(3, 'Allianz Madagascar', 'allianz@email.com', 'azerty', 'img/Allianz.png', 'allianz.php'),
(4, 'Sanlam Madagascar', 'sanlam@email.com', 'azerty', 'img/Sanlam.png', 'sanlam.php'),
(5, 'Ascoma Madagascar', 'ascoma@email.com', 'azerty', 'img/ASCOMA.png', 'ascoma.php'),
(6, 'Saham Assurance', 'saham@email.com', 'azerty', 'img/SAHAM.png', 'saham.php'),
(7, 'Assurance MAMA', 'mama@email.com', 'azerty', 'img/MAMA.png', 'mama.php'),
(8, 'BNI Madagascar', 'bni@email.com', 'azerty', 'img/BNI.png', 'bni.php'),
(10, 'Assurance AFAFI', 'afafi@email.com', 'azerty', 'img/AFAFI.gif', 'afafi.php'),
(12, 'Assurance FJKM', 'fjkm@email.com', 'azerty', 'img/FJKM.png', 'fjkm.php'),
(13, 'Assurance OTIV', 'otiv@email.com', 'azerty', 'img/OTIV.png', 'otiv.php'),
(14, 'Assurance CNaPS', 'cnaps@email.com', 'azerty', 'img/CNaPS.png', 'cnaps.php'),
(15, 'Assurance APEM', 'apem@email.com', 'azerty', 'img/APEM.jpg', 'apem.php'),
(16, 'Assurance OTIVTANA', 'oti@email.com', 'azerty', 'img/OTIVTana.jpg', 'oti.php'),
(17, 'Assurance SIPEM', 'sipem@email.com', 'azerty', 'img/SIPEM.webp', 'sipem.php'),
(21, 'Assurances ARO', 'aro@email.com', 'azerty', 'img/Aro.png', 'aro.php'),
(23, 'SAMB\'A assurances', 'samba@email.com', 'azerty', 'img/SAMBA.png', 'samba.php'),
(24, 'BOA assurance', 'boa@email.com', 'azerty', 'img/BOA.png', 'boa.php'),
(26, 'Bureau de Souscripti', 'bsa@email.com', 'azerty', 'img/bsa.png', 'bsa.php'),
(28, 'BSA Madagascar Gras ', 'bsa@email.com', 'azerty', 'img/bsa.png', 'bsa.php'),
(30, 'BSA Madagascar Gras ', 'bsa@email.com', 'azerty', 'img/bsa.png', 'bsa.php'),
(31, 'Assurances Mitsinjo', 'mitsinjo@email.com', 'azerty', 'img/mitsinjo.jpg', 'mitsinjo.php'),
(33, 'BSA Madagascar', 'bsa@email.com', 'azerty', 'img/BSA.png', 'bsa.php'),
(34, 'BAOBAB Assurance', 'baobab@email.com', 'azerty', 'img/baobab.png', 'baobab.php'),
(35, 'Assurance KOBABY', 'kobaby@email.com', 'azert', 'img/KOBABY.png', 'kobaby.php');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `expediteur_id` int(11) NOT NULL,
  `expediteur_type` enum('user','assurance') NOT NULL,
  `destinataire_id` int(11) NOT NULL,
  `destinataire_type` enum('user','assurance') NOT NULL,
  `contenu` text NOT NULL,
  `date_envoi` datetime DEFAULT current_timestamp(),
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `expediteur_id`, `expediteur_type`, `destinataire_id`, `destinataire_type`, `contenu`, `date_envoi`, `message`) VALUES
(1, 1, 'user', 2, 'assurance', 'bbbbbbonjour', '2025-04-17 12:32:34', ''),
(2, 1, 'user', 21, 'assurance', 'bonjour', '2025-04-17 12:33:57', ''),
(3, 1, 'user', 21, 'assurance', '', '2025-04-17 12:51:10', 'y a t il quelqu\'un?'),
(4, 1, 'user', 2, 'assurance', '', '2025-04-17 13:39:39', 'bonjour encore'),
(5, 2, 'user', 21, 'assurance', 'hello world', '2025-04-17 13:47:41', ''),
(6, 2, 'user', 1, 'assurance', 'hé oh', '2025-04-17 13:47:41', '');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `mdp` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_users`, `nom`, `email`, `mdp`) VALUES
(1, 'Societe', 'email@email.com', 'azerty'),
(2, 'startup', 'email@mail.com', 'qsdfgh');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assurances`
--
ALTER TABLE `assurances`
  ADD PRIMARY KEY (`id_assurances`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `assurances`
--
ALTER TABLE `assurances`
  MODIFY `id_assurances` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
