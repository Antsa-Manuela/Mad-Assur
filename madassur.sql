-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 28 avr. 2025 à 13:25
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
  `rse_fort` int(11) DEFAULT 0,
  `rse_faible` int(11) DEFAULT 0,
  `capital_humain_fort` int(11) DEFAULT 0,
  `capital_humain_faible` int(11) DEFAULT 0,
  `experience_client_fort` int(11) DEFAULT 0,
  `experience_client_faible` int(11) DEFAULT 0,
  `impact_local_fort` int(11) DEFAULT 0,
  `impact_local_faible` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `services` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `assurances`
--

INSERT INTO `assurances` (`id_assurances`, `nom`, `email`, `mdp`, `image`, `rse_fort`, `rse_faible`, `capital_humain_fort`, `capital_humain_faible`, `experience_client_fort`, `experience_client_faible`, `impact_local_fort`, `impact_local_faible`, `description`, `services`) VALUES
(2, 'Assurance Ny Havana', 'havana@email.com', 'azerty', 'img/Havana.png', 85, 15, 70, 30, 60, 40, 50, 50, 'Assurance Ny Havana est un acteur majeur de l\'assurance à Madagascar. Reconnue pour son engagement local et ses solutions adaptées, elle accompagne particuliers et entreprises depuis de nombreuses années. Sa démarche RSE et ses services personnalisés la distinguent de ses concurrents sur le marché national.', 'Santé,Vie,Habitation,Voyage'),
(3, 'Allianz Madagascar', 'allianz@email.com', 'azerty', 'img/Allianz.png', 90, 10, 80, 20, 75, 25, 70, 30, 'Allianz Madagascar propose une gamme complète d\'assurances adaptées aux besoins variés des entreprises et des particuliers. Forte d\'une expertise mondiale, elle s\'engage à fournir des solutions fiables, innovantes et respectueuses des normes environnementales.', 'Santé,Auto,Vie,Responsabilité Civile'),
(4, 'Sanlam Madagascar', 'sanlam@email.com', 'azerty', 'img/Sanlam.png', 78, 22, 65, 35, 70, 30, 60, 40, 'Sanlam Madagascar est reconnue pour sa solidité financière et sa capacité à offrir des produits d\'assurance vie et non-vie de qualité. Avec une forte présence locale, elle met en avant l\'accessibilité, la digitalisation et la proximité client.', 'Vie,Santé,Scolaire,Décès/Invalidité'),
(5, 'Ascoma Madagascar', 'ascoma@email.com', 'azerty', 'img/ASCOMA.png', 82, 18, 77, 23, 68, 32, 58, 42, '\"Ascoma Madagascar se positionne comme un spécialiste du courtage en assurance, offrant des conseils sur mesure pour les professionnels et les particuliers. Son engagement dans la qualité de service et la gestion des risques est une référence sur le marché.', 'Auto,Professionnelle,Habitation,Responsabilité Civile'),
(6, 'Saham Assurance', 'saham@email.com', 'azerty', 'img/SAHAM.png', 75, 25, 70, 30, 65, 35, 55, 45, 'Saham Assurance propose des solutions innovantes et adaptées aux besoins spécifiques des entreprises malgaches. Elle est engagée dans des projets communautaires et dans l\'amélioration continue de ses pratiques de gouvernance responsable.', 'Santé,Voyage,Vie,Auto'),
(7, 'Assurance MAMA', 'mama@email.com', 'azerty', 'img/MAMA.png', 80, 20, 72, 28, 60, 40, 50, 50, 'Assurance MAMA est un acteur historique du marché malgache, proposant des produits accessibles à tous. Son action sociale et ses initiatives de développement durable renforcent sa place auprès des entreprises et des particuliers.', 'Santé,Agricole,Vie'),
(8, 'BNI Madagascar', 'bni@email.com', 'azerty', 'img/BNI.png', 88, 12, 85, 15, 80, 20, 78, 22, 'BNI Madagascar, filiale d\'un grand groupe bancaire, offre également des services d\'assurance performants. Elle mise sur la complémentarité entre banque et assurance pour proposer une expérience client fluide et sécurisée.', 'Vie,Habitation,Auto,Professionnelle'),
(10, 'Assurance AFAFI', 'afafi@email.com', 'azerty', 'img/AFAFI.gif', 70, 30, 65, 35, 62, 38, 48, 52, 'Assurance AFAFI est un assureur de proximité, œuvrant pour la protection sociale des communautés rurales et urbaines. Elle propose des produits responsables et adaptés aux besoins d\'une clientèle variée.', 'Santé,Scolaire,Responsabilité Civile'),
(12, 'Assurance FJKM', 'fjkm@email.com', 'azerty', 'img/FJKM.png', 77, 23, 68, 32, 66, 34, 57, 43, 'Assurance FJKM, étroitement liée à l\'Église protestante malgache, met l\'accent sur la solidarité et l\'entraide communautaire à travers ses offres d\'assurance santé, vie et scolaire.', 'Santé,Vie,Décès/Invalidité'),
(13, 'Assurance OTIV', 'otiv@email.com', 'azerty', 'img/OTIV.png', 74, 26, 60, 40, 63, 37, 52, 48, 'Assurance OTIV propose des solutions destinées aux structures mutualistes et aux micro-entreprises, avec une forte orientation sociale et solidaire. Elle accompagne les projets locaux et soutient les initiatives citoyennes.', 'Santé,Agricole,Responsabilité Civile'),
(14, 'Assurance CNaPS', 'cnaps@email.com', 'azerty', 'img/CNaPS.png', 79, 21, 0, 27, 67, 33, 56, 44, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Santé,Vie,Décès/Invalidité'),
(15, 'Assurance APEM', 'apem@email.com', 'azerty', 'img/APEM.jpg', 72, 28, 64, 36, 61, 39, 49, 51, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Santé,Scolaire,Responsabilité Civile'),
(16, 'Assurance OTIVTANA', 'oti@email.com', 'azerty', 'img/OTIVTana.jpg', 69, 31, 62, 38, 59, 41, 46, 54, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Santé,Agricole,Responsabilité Civile'),
(17, 'Assurance SIPEM', 'sipem@email.com', 'azerty', 'img/SIPEM.webp', 76, 24, 69, 31, 64, 36, 55, 45, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Santé,Agricole,Vie'),
(21, 'Assurances ARO', 'aro@email.com', 'azerty', 'img/Aro.png', 87, 13, 82, 18, 78, 22, 75, 25, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Santé,Vie,Auto,Habitation'),
(23, 'SAMB\'A assurances', 'samba@email.com', 'azerty', 'img/SAMBA.png', 68, 32, 63, 37, 58, 42, 45, 55, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Auto,Santé,Responsabilité Civile'),
(24, 'BOA assurance', 'boa@email.com', 'azerty', 'img/BOA.png', 84, 16, 79, 21, 74, 26, 71, 29, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Vie,Auto,Professionnelle'),
(28, 'BSA Madagascar Gras ', 'bsa@email.com', 'azerty', 'img/bsa.png', 75, 25, 70, 30, 65, 35, 55, 45, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Auto,Professionnelle,Responsabilité Civile'),
(31, 'Assurances Mitsinjo', 'mitsinjo@email.com', 'azerty', 'img/mitsinjo.jpg', 71, 29, 66, 34, 61, 39, 50, 50, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Santé,Habitation,Responsabilité Civile'),
(34, 'BAOBAB Assurance', 'baobab@email.com', 'azerty', 'img/baobab.png', 85, 15, 80, 20, 76, 24, 72, 28, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Santé,Vie,Habitation,Professionnelle'),
(35, 'Assurance KOBABY', 'kobaby@email.com', 'azert', 'img/KOBABY.png', 65, 35, 60, 40, 55, 45, 40, 60, 'Assurance KOBABY est dédiée à la protection des familles malgaches à travers des solutions d\'assurance santé et vie abordables, tout en mettant en avant la solidarité communautaire.', 'Santé,Scolaire,Agricole');

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
(3, 1, 'user', 21, 'assurance', '', '2025-04-17 12:51:10', 'y a t il quelqu\'un?'),
(4, 1, 'user', 2, 'assurance', '', '2025-04-17 13:39:39', 'bonjour encore'),
(5, 2, 'user', 21, 'assurance', 'hello world', '2025-04-17 13:47:41', ''),
(6, 2, 'user', 1, 'assurance', 'hé oh', '2025-04-17 13:47:41', ''),
(14, 21, 'assurance', 1, 'user', '', '2025-04-17 20:44:24', 'oui que puis - je faire?'),
(15, 2, 'assurance', 1, 'user', '', '2025-04-17 21:35:53', 'Bonjour je suis le représentant de l\'Assurance Ny Havana'),
(16, 1, 'user', 21, 'assurance', '', '2025-04-18 02:14:33', 'Plus de renseignements concernant la RSE'),
(17, 1, 'user', 2, 'assurance', '', '2025-04-18 04:41:18', 'bonjour c\'est quoi l\'impact local?'),
(18, 1, 'user', 2, 'assurance', '', '2025-04-18 04:43:51', 'et la RSE'),
(19, 2, 'assurance', 1, 'user', '', '2025-04-18 04:46:25', 'OK\r\n'),
(20, 2, 'assurance', 1, 'user', '', '2025-04-18 05:12:31', 'alors');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `mdp` varchar(10) NOT NULL,
  `image` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_users`, `nom`, `email`, `mdp`, `image`) VALUES
(1, 'Societe', 'email@email.com', 'azerty', 'img/societe.jpg'),
(2, 'startup', 'email@mail.com', 'qsdfgh', 'img/startup.jpg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
