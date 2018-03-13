-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 13 mars 2018 à 19:01
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pweb17_cassanel`
--

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

DROP TABLE IF EXISTS `carte`;
CREATE TABLE IF NOT EXISTS `carte` (
  `idcarte` int(11) NOT NULL AUTO_INCREMENT,
  `intitulecarte` varchar(250) NOT NULL,
  `idtheme` int(11) NOT NULL,
  PRIMARY KEY (`idcarte`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `carte`
--

INSERT INTO `carte` (`idcarte`, `intitulecarte`, `idtheme`) VALUES
(1, 'Monde', 1);

-- --------------------------------------------------------

--
-- Structure de la table `indice`
--

DROP TABLE IF EXISTS `indice`;
CREATE TABLE IF NOT EXISTS `indice` (
  `idindice` int(11) NOT NULL AUTO_INCREMENT,
  `idpays` int(11) NOT NULL,
  PRIMARY KEY (`idindice`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
CREATE TABLE IF NOT EXISTS `joueur` (
  `idjoueur` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(250) NOT NULL,
  `mdp` varchar(50) NOT NULL,
  `connect` int(250) NOT NULL,
  PRIMARY KEY (`idjoueur`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`idjoueur`, `pseudo`, `mdp`, `connect`) VALUES
(1, 'Sacdeneu', 'root', 0),
(2, 'alison', 'alison', 0),
(3, 'root', 'root', 0),
(4, 'philippe', 'philippe', 0);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `idlieu` int(11) NOT NULL AUTO_INCREMENT,
  `intitulelieu` varchar(250) NOT NULL,
  `idcarte` int(11) NOT NULL,
  PRIMARY KEY (`idlieu`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`idlieu`, `intitulelieu`, `idcarte`) VALUES
(1, 'France', 1),
(2, 'Italie', 1),
(3, 'Togo', 1),
(4, 'Chine', 1),
(5, 'Canada', 1),
(6, 'Japon', 1),
(7, 'Belgique', 1),
(8, 'Russie', 1);

-- --------------------------------------------------------

--
-- Structure de la table `partie`
--

DROP TABLE IF EXISTS `partie`;
CREATE TABLE IF NOT EXISTS `partie` (
  `idpartie` int(11) NOT NULL AUTO_INCREMENT,
  `encours` tinyint(1) NOT NULL,
  `idjoueur` int(11) NOT NULL,
  `idcarte` int(11) NOT NULL,
  PRIMARY KEY (`idpartie`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `qcm`
--

DROP TABLE IF EXISTS `qcm`;
CREATE TABLE IF NOT EXISTS `qcm` (
  `idqcm` int(11) NOT NULL AUTO_INCREMENT,
  `idpartie` int(11) NOT NULL,
  `idquest` int(11) NOT NULL,
  `questactivee` tinyint(1) NOT NULL,
  PRIMARY KEY (`idqcm`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `idquestion` int(11) NOT NULL AUTO_INCREMENT,
  `intitulequestion` varchar(250) NOT NULL,
  `idlieu` int(11) NOT NULL,
  `idtheme` int(11) NOT NULL,
  PRIMARY KEY (`idquestion`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`idquestion`, `intitulequestion`, `idlieu`, `idtheme`) VALUES
(1, 'Ou se trouve la Tour Eiffel ?\r\n', 1, 1),
(2, 'Quel est le plus grand pays du monde ?', 8, 1),
(3, 'D\'où est originaire le sirop d\'érable ?', 5, 1),
(4, 'Où se trouve la cité interdite ?', 4, 1),
(5, 'Quel pays a pour couleur le noir jaune rouge ?', 7, 1),
(6, 'Où peut-on déguster de bonnes pizzas', 2, 1),
(7, 'D\'où vient Alili l\'exploratrice?', 3, 1),
(8, 'Quel pays a pour capital Tokyo ? ', 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `idreponse` int(11) NOT NULL AUTO_INCREMENT,
  `idquestion` int(11) NOT NULL,
  `bonnerep` tinyint(1) NOT NULL,
  PRIMARY KEY (`idreponse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `idscore` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `idjoueur` int(11) NOT NULL,
  `idpartie` int(11) NOT NULL,
  PRIMARY KEY (`idscore`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `idtheme` int(11) NOT NULL AUTO_INCREMENT,
  `intituletheme` varchar(250) NOT NULL,
  PRIMARY KEY (`idtheme`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `theme`
--

INSERT INTO `theme` (`idtheme`, `intituletheme`) VALUES
(1, 'monde');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
