-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 09 avr. 2025 à 14:24
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
(2, 'Assurance Ny Havana', 'havana@email.com', 'azerty', 'img/Aro.png', 'havana.php'),
(3, 'Allianz Madagascar', 'allianz@email.com', 'azerty', 'img/Aro.png', 'allianz.php'),
(4, 'Sanlam Madagascar', 'sanlam@email.com', 'azerty', 'img/Aro.png', 'sanlam.php'),
(5, 'Ascoma Madagascar', 'ascoma@email.com', 'azerty', 'img/Aro.png', 'ascoma.php'),
(6, 'Saham Assurance', 'saham@email.com', 'azerty', 'img/Aro.png', 'saham.php'),
(7, 'Assurance MAMA', 'mama@email.com', 'azerty', 'img/Aro.png', 'mama.php'),
(8, 'BNI Madagascar', 'bni@email.com', 'azerty', 'img/Aro.png', 'bni.php'),
(9, 'Mutuelle d\'Assurance', 'mam@email.com', 'azerty', 'img/Aro.png', 'mam.php'),
(10, 'Assurance AFAFI', 'afafi@email.com', 'azerty', 'img/Aro.png', 'afafi.php'),
(11, 'Assurance VELON\'NY', 'velon@email.com', 'azerty', 'img/Aro.png', 'velon.php'),
(12, 'Assurance FJKM', 'fjkm@email.com', 'azerty', 'img/Aro.png', 'fjkm.php'),
(13, 'Assurance OTIV', 'otiv@email.com', 'azerty', 'img/Aro.png', 'otiv.php'),
(14, 'Assurance CNaPS', 'cnaps@email.com', 'azerty', 'img/Aro.png', 'cnaps.php'),
(15, 'Assurance APEM', 'apem@email.com', 'azerty', 'img/Aro.png', 'apem.php'),
(16, 'Assurance OTIVTANA', 'oti@email.com', 'azerty', 'img/Aro.png', 'oti.php'),
(17, 'Assurance SIPEM', 'sipem@email.com', 'azerty', 'img/Aro.png', 'sipem.php'),
(18, 'Assurance MAFAMI', 'mafami@email.com', 'azerty', 'img/Aro.png', 'mafami.php'),
(19, 'Assurance MICROCARE', 'micro@email.com', 'azerty', 'img/Aro.png', 'micro.php'),
(20, 'Assurance TAF', 'taf@email.com', 'azerty', 'img/Aro.png', 'taf.php'),
(21, 'Assurances ARO', 'aro@email.com', 'azerty', 'img/Aro.png', 'aro.php'),
(22, 'Assurance Havana', 'havana@email.com', 'azerty', 'img/Aro.png', 'havana.php');

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
(1, 'Societe', 'email@email.com', 'azerty');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assurances`
--
ALTER TABLE `assurances`
  ADD PRIMARY KEY (`id_assurances`);

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
  MODIFY `id_assurances` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
