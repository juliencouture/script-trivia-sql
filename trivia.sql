-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 08 Juin 2015 à 16:39
-- Version du serveur :  5.6.21
-- Version de PHP :  5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `trivia`
--
CREATE DATABASE IF NOT EXISTS `trivia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `trivia`;

-- --------------------------------------------------------

--
-- Structure de la table `couronne`
--

CREATE TABLE IF NOT EXISTS `couronne` (
  `idjoueur` int(11) NOT NULL,
  `idpartie` int(11) NOT NULL,
  `iddomaine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `couronne`
--

INSERT INTO `couronne` (`idjoueur`, `idpartie`, `iddomaine`) VALUES
(1, 41, 1),
(1, 42, 3);

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE IF NOT EXISTS `domaine` (
`id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `idmonde` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `domaine`
--

INSERT INTO `domaine` (`id`, `libelle`, `description`, `idmonde`) VALUES
(1, 'PHP', 'domaine sur le langage PHP', 1),
(2, 'Modéle OSI', 'domaine sur les couches OSI', 1),
(3, 'AngularJS', 'domaine sur le langage angularJS', 1),
(4, 'Réalisateur', 'domaine sur les réalisateurs', 2),
(5, 'Acteur', 'domaine sur les acteurs', 2),
(6, 'Tennis', 'domaine sur le tennis', 3),
(7, 'FootBall', 'domaine sur le football', 3);

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
`id` int(11) NOT NULL,
  `idmonde` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `idrang` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `joueur`
--

INSERT INTO `joueur` (`id`, `idmonde`, `nom`, `prenom`, `mail`, `login`, `password`, `idrang`) VALUES
(1, 1, 'couture', 'julien', 'juliencouture@sts-sio-caen.info', 'jcouture', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 2),
(2, 1, 'portois', 'theo', 'theoportois@sts-sio-caen.info', 'tportois', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 2),
(3, 1, 'tostain', 'guillaume', 'guillaumetostain@sts-sio-caen.info', 'gtostain', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1),
(4, 2, 'nom1', 'prenom1', 'nom1@prenom1.test', 'Adversaire1', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 3),
(5, 2, 'nom2', 'prenom2', 'nom2@prenom2.test', 'Adversaire2', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 3),
(6, 3, 'nom3', 'prenom3', 'nom3@prenom3.test', 'Adversaire3', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 3),
(7, 3, 'nom4', 'prenom4', 'nom4@prenom4.test', 'Adversaire4', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 3);

-- --------------------------------------------------------

--
-- Structure de la table `monde`
--

CREATE TABLE IF NOT EXISTS `monde` (
`id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `monde`
--

INSERT INTO `monde` (`id`, `libelle`) VALUES
(1, 'informatique'),
(2, 'cinema'),
(3, 'sports');

-- --------------------------------------------------------

--
-- Structure de la table `partie`
--

CREATE TABLE IF NOT EXISTS `partie` (
`id` int(11) NOT NULL,
  `dernierCoup` datetime DEFAULT NULL,
  `idJoueurEnCours` int(11) NOT NULL,
  `idJoueur1` int(11) NOT NULL,
  `idJoueur2` int(11) NOT NULL,
  `fini` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `partie`
--

INSERT INTO `partie` (`id`, `dernierCoup`, `idJoueurEnCours`, `idJoueur1`, `idJoueur2`, `fini`) VALUES
(41, NULL, 2, 1, 2, 0),
(42, '2015-06-08 11:04:53', 1, 1, 2, 1),
(43, NULL, 1, 1, 2, 1),
(44, NULL, 2, 2, 1, 0),
(45, NULL, 3, 1, 3, 1),
(46, NULL, 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
`id` int(11) NOT NULL,
  `libelle` text NOT NULL,
  `validation` tinyint(1) DEFAULT NULL,
  `iddomaine` int(11) NOT NULL,
  `idcreateur` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `question`
--

INSERT INTO `question` (`id`, `libelle`, `validation`, `iddomaine`, `idcreateur`) VALUES
(1, 'Comment vérifier la syntaxe d une adresse e-mail contenue dans la variable $email ?', 1, 1, 1),
(2, 'Par défaut, dans quel ordre de priorité sont affectées les variables envoyées par HTTP ?', 1, 1, 1),
(3, 'Comment mémorise-t-on de façon pratique une variable d un script à l autre sur un serveur web ?', 1, 1, 1),
(4, 'Combien de couches le modèle OSI comporte-t-il ?', 1, 2, 1),
(5, 'Sur combien de bits une adresse IPv4 est-elle codée ?', 1, 2, 1),
(6, 'Dans 172. 20. 1. 5/24, combien de bits sont réservés pour le host ID ?', 1, 2, 1),
(7, 'quel modules externe permet de définir des services REST simplement ?', 1, 3, 1),
(8, 'Quel service permet d utiliser les promises ?', 1, 3, 1),
(9, 'Quel film Tim Burton n a pas realise?', 1, 4, 1),
(10, 'Quel film a realise Steven Spielberg?', 1, 4, 1),
(11, 'A ?', 1, 5, 1),
(12, 'B ?', 1, 5, 1),
(13, 'A ?', 1, 6, 1),
(14, 'B ?', 1, 6, 1),
(15, 'A ?', 1, 7, 1),
(16, 'B ?', 1, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `rang`
--

CREATE TABLE IF NOT EXISTS `rang` (
`id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rang`
--

INSERT INTO `rang` (`id`, `libelle`) VALUES
(1, 'administrateur'),
(2, 'concepteur'),
(3, 'joueur');

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE IF NOT EXISTS `reponse` (
`id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `estBonne` tinyint(1) NOT NULL,
  `idquestion` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reponse`
--

INSERT INTO `reponse` (`id`, `libelle`, `estBonne`, `idquestion`) VALUES
(1, 'strpos($email,"*@*.*")', 0, 1),
(2, 'preg_match("/^(w|-)+@((w|-)+.)+[a-z]{2,6}$/i",$email)', 1, 1),
(3, 'ereg($email,"[:alpha:]*@[:alpha:]*.[:alpha:]*")', 0, 1),
(4, 'headers($email)', 0, 1),
(5, 'get, post, cookie', 1, 2),
(6, 'post, get, cookie', 0, 2),
(7, 'post,cookie, get', 0, 2),
(8, 'get, cookie, post', 0, 2),
(9, 'grâce à public static void()', 0, 3),
(10, 'en utilisant __construct()', 0, 3),
(11, 'en nommant la fonction comme la classe', 1, 3),
(12, 'en le nomant avec $private', 0, 3),
(13, '6', 0, 4),
(14, '7', 1, 4),
(15, '8', 0, 4),
(16, '9', 0, 4),
(17, '16 bits', 0, 5),
(18, '32 bits', 1, 5),
(19, '48 bits', 0, 5),
(20, '64 bits', 0, 5),
(21, '8 bits', 0, 6),
(22, '16 bits', 0, 6),
(23, '32 bits', 1, 6),
(24, '64 bits', 0, 6),
(25, 'ngResource', 1, 7),
(26, 'ngRoute', 0, 7),
(27, 'ngSanitize', 0, 7),
(28, 'ngMessage', 0, 7),
(29, '$http', 0, 8),
(30, '$interpolate', 0, 8),
(31, '$q', 1, 8),
(32, '$interval', 0, 8),
(33, 'Batman', 0, 9),
(34, 'indiana jones', 1, 9),
(35, 'Charlie et la chocolaterie', 0, 9),
(36, 'Alice au pays des merveilles', 0, 9),
(37, 'Star Wars', 0, 10),
(38, 'Indiana Jones', 0, 10),
(39, 'Mission impossible', 0, 10),
(40, 'Jurassic Park', 1, 10),
(45, 'A', 1, 11),
(46, 'B', 0, 11),
(47, 'C', 0, 11),
(48, 'D', 0, 11),
(49, 'A', 0, 12),
(50, 'B', 1, 12),
(51, 'C', 0, 12),
(52, 'D', 0, 12),
(53, 'A', 1, 13),
(54, 'B', 0, 13),
(55, 'C', 0, 13),
(56, 'D', 0, 13),
(57, 'A', 0, 14),
(58, 'B', 1, 14),
(59, 'C', 0, 14),
(60, 'D', 0, 14),
(61, 'A', 1, 15),
(62, 'B', 0, 15),
(63, 'C', 0, 15),
(64, 'D', 0, 15),
(65, 'A', 0, 16),
(66, 'B', 1, 16),
(67, 'C', 0, 16),
(68, 'D', 0, 16);

-- --------------------------------------------------------

--
-- Structure de la table `score`
--

CREATE TABLE IF NOT EXISTS `score` (
`id` int(11) NOT NULL,
  `nbPartie` int(11) NOT NULL,
  `nbPartieGagne` int(11) NOT NULL,
  `idjoueur` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `score`
--

INSERT INTO `score` (`id`, `nbPartie`, `nbPartieGagne`, `idjoueur`) VALUES
(2, 0, 0, 2),
(3, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `serie`
--

CREATE TABLE IF NOT EXISTS `serie` (
`id` int(11) NOT NULL,
  `idjoueur` int(11) NOT NULL,
  `idpartie` int(11) NOT NULL,
  `nombre` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `serie`
--

INSERT INTO `serie` (`id`, `idjoueur`, `idpartie`, `nombre`) VALUES
(1, 1, 42, 0),
(4, 1, 43, 0),
(11, 1, 46, 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `couronne`
--
ALTER TABLE `couronne`
 ADD KEY `fk_Couronne_jouer1_idx` (`idjoueur`), ADD KEY `fk_Couronne_partie1_idx` (`idpartie`), ADD KEY `fk_Couronne_domaine1_idx` (`iddomaine`);

--
-- Index pour la table `domaine`
--
ALTER TABLE `domaine`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_domaine_monde_idx` (`idmonde`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD KEY `FK_travailler` (`idmonde`);

--
-- Index pour la table `monde`
--
ALTER TABLE `monde`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `partie`
--
ALTER TABLE `partie`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_partie_jouer1_idx` (`idJoueurEnCours`), ADD KEY `fk_partie_jouer2_idx` (`idJoueur1`), ADD KEY `fk_partie_jouer3_idx` (`idJoueur2`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_question_domaine1_idx` (`iddomaine`), ADD KEY `fk_question_jouer1_idx` (`idcreateur`);

--
-- Index pour la table `rang`
--
ALTER TABLE `rang`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_reponse_question1_idx` (`idquestion`);

--
-- Index pour la table `score`
--
ALTER TABLE `score`
 ADD PRIMARY KEY (`id`), ADD KEY `idjoueur` (`idjoueur`);

--
-- Index pour la table `serie`
--
ALTER TABLE `serie`
 ADD PRIMARY KEY (`id`), ADD KEY `joueur` (`idjoueur`,`idpartie`), ADD KEY `joueur_2` (`idjoueur`), ADD KEY `partie` (`idpartie`), ADD KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `domaine`
--
ALTER TABLE `domaine`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `monde`
--
ALTER TABLE `monde`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT pour la table `partie`
--
ALTER TABLE `partie`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `rang`
--
ALTER TABLE `rang`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT pour la table `score`
--
ALTER TABLE `score`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `serie`
--
ALTER TABLE `serie`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `couronne`
--
ALTER TABLE `couronne`
ADD CONSTRAINT `fk_Couronne_domaine1` FOREIGN KEY (`iddomaine`) REFERENCES `domaine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Couronne_jouer1` FOREIGN KEY (`idjoueur`) REFERENCES `joueur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Couronne_partie1` FOREIGN KEY (`idpartie`) REFERENCES `partie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `domaine`
--
ALTER TABLE `domaine`
ADD CONSTRAINT `fk_domaine_monde` FOREIGN KEY (`idmonde`) REFERENCES `monde` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `joueur`
--
ALTER TABLE `joueur`
ADD CONSTRAINT `FK_travailler` FOREIGN KEY (`idmonde`) REFERENCES `monde` (`id`);

--
-- Contraintes pour la table `partie`
--
ALTER TABLE `partie`
ADD CONSTRAINT `fk_partie_jouer1` FOREIGN KEY (`idJoueurEnCours`) REFERENCES `joueur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_partie_jouer2` FOREIGN KEY (`idJoueur1`) REFERENCES `joueur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_partie_jouer3` FOREIGN KEY (`idJoueur2`) REFERENCES `joueur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
ADD CONSTRAINT `fk_question_domaine1` FOREIGN KEY (`iddomaine`) REFERENCES `domaine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_question_jouer1` FOREIGN KEY (`idcreateur`) REFERENCES `joueur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
ADD CONSTRAINT `fk_reponse_question1` FOREIGN KEY (`idquestion`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `score`
--
ALTER TABLE `score`
ADD CONSTRAINT `fk_Score_joueur1` FOREIGN KEY (`idjoueur`) REFERENCES `joueur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `serie`
--
ALTER TABLE `serie`
ADD CONSTRAINT `serie_ibfk_1` FOREIGN KEY (`idjoueur`) REFERENCES `joueur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `serie_ibfk_2` FOREIGN KEY (`idpartie`) REFERENCES `partie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
