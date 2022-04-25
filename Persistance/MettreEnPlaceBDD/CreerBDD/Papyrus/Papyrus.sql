-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 25 avr. 2022 à 17:26
-- Version du serveur :  10.3.34-MariaDB-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Papyrus`
--

-- --------------------------------------------------------

--
-- Structure de la table `ENTCOM`
--

CREATE TABLE `ENTCOM` (
  `NUMCOM` int(11) NOT NULL,
  `OBSCOM` varchar(255) DEFAULT NULL,
  `DATCOM` datetime NOT NULL,
  `NUMFOU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `FOURNIS`
--

CREATE TABLE `FOURNIS` (
  `NUMFOU` int(11) NOT NULL,
  `NOMFOU` varchar(255) NOT NULL,
  `RUEFOU` varchar(255) NOT NULL,
  `POSFOU` varchar(5) NOT NULL,
  `VILFOU` varchar(255) NOT NULL,
  `CONFOU` varchar(255) NOT NULL,
  `SATISF` int(11) DEFAULT NULL CHECK (`SATISF` between 1 and 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `LIGCOM`
--

CREATE TABLE `LIGCOM` (
  `NUMCOM` int(11) NOT NULL,
  `NUMLIG` int(11) NOT NULL,
  `CODART` int(11) NOT NULL,
  `QTECDE` int(11) NOT NULL,
  `PRIUNI` decimal(9,0) NOT NULL,
  `QTELIV` int(11) DEFAULT NULL,
  `DERLIV` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `PRODUIT`
--

CREATE TABLE `PRODUIT` (
  `CODART` int(11) NOT NULL,
  `LIBART` varchar(30) NOT NULL,
  `STKALE` int(11) NOT NULL,
  `STKPHY` int(11) NOT NULL,
  `QTEANN` int(11) NOT NULL,
  `UNIMES` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `VENTE`
--

CREATE TABLE `VENTE` (
  `CODART` int(11) NOT NULL,
  `NUMFOU` int(11) NOT NULL,
  `DELLIV` int(11) NOT NULL,
  `QTE1` int(11) NOT NULL,
  `PRIX1` decimal(9,0) NOT NULL,
  `QTE2` int(11) DEFAULT NULL,
  `PRIX2` decimal(9,0) DEFAULT NULL,
  `QTE3` int(11) DEFAULT NULL,
  `PRIX3` decimal(9,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ENTCOM`
--
ALTER TABLE `ENTCOM`
  ADD PRIMARY KEY (`NUMCOM`),
  ADD KEY `NUMFOU_INDEX` (`NUMFOU`);

--
-- Index pour la table `FOURNIS`
--
ALTER TABLE `FOURNIS`
  ADD PRIMARY KEY (`NUMFOU`);

--
-- Index pour la table `LIGCOM`
--
ALTER TABLE `LIGCOM`
  ADD PRIMARY KEY (`NUMLIG`),
  ADD KEY `NUMCOM` (`NUMCOM`),
  ADD KEY `CODART` (`CODART`);

--
-- Index pour la table `PRODUIT`
--
ALTER TABLE `PRODUIT`
  ADD PRIMARY KEY (`CODART`);

--
-- Index pour la table `VENTE`
--
ALTER TABLE `VENTE`
  ADD PRIMARY KEY (`NUMFOU`,`CODART`),
  ADD KEY `CODART` (`CODART`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ENTCOM`
--
ALTER TABLE `ENTCOM`
  MODIFY `NUMCOM` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `FOURNIS`
--
ALTER TABLE `FOURNIS`
  MODIFY `NUMFOU` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `LIGCOM`
--
ALTER TABLE `LIGCOM`
  MODIFY `NUMLIG` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `PRODUIT`
--
ALTER TABLE `PRODUIT`
  MODIFY `CODART` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ENTCOM`
--
ALTER TABLE `ENTCOM`
  ADD CONSTRAINT `ENTCOM_ibfk_1` FOREIGN KEY (`NUMFOU`) REFERENCES `FOURNIS` (`NUMFOU`);

--
-- Contraintes pour la table `LIGCOM`
--
ALTER TABLE `LIGCOM`
  ADD CONSTRAINT `LIGCOM_ibfk_1` FOREIGN KEY (`NUMCOM`) REFERENCES `ENTCOM` (`NUMCOM`),
  ADD CONSTRAINT `LIGCOM_ibfk_2` FOREIGN KEY (`CODART`) REFERENCES `PRODUIT` (`CODART`);

--
-- Contraintes pour la table `VENTE`
--
ALTER TABLE `VENTE`
  ADD CONSTRAINT `VENTE_ibfk_1` FOREIGN KEY (`NUMFOU`) REFERENCES `FOURNIS` (`NUMFOU`),
  ADD CONSTRAINT `VENTE_ibfk_2` FOREIGN KEY (`CODART`) REFERENCES `PRODUIT` (`CODART`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
