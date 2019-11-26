-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2019. Nov 26. 23:08
-- Kiszolgáló verziója: 5.7.28-0ubuntu0.18.04.4
-- PHP verzió: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `hoe`
--
CREATE DATABASE IF NOT EXISTS `hoe` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hoe`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `building`
--

DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `ID` bigint(20) NOT NULL,
  `BUILDTIME` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PRODUCE` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `empire`
--

DROP TABLE IF EXISTS `empire`;
CREATE TABLE `empire` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LEVEL` bigint(20) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `POPULATION` longblob,
  `PRODUCE` longblob,
  `WAREHOUSE` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `empire_building`
--

DROP TABLE IF EXISTS `empire_building`;
CREATE TABLE `empire_building` (
  `Empire_ID` bigint(20) NOT NULL,
  `buildings_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hero`
--

DROP TABLE IF EXISTS `hero`;
CREATE TABLE `hero` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hero_hybrid`
--

DROP TABLE IF EXISTS `hero_hybrid`;
CREATE TABLE `hero_hybrid` (
  `Hero_ID` bigint(20) NOT NULL,
  `hybrid_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hybrid`
--

DROP TABLE IF EXISTS `hybrid`;
CREATE TABLE `hybrid` (
  `ID` bigint(20) NOT NULL,
  `PERCENT` tinyint(4) DEFAULT NULL,
  `SPECIES_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `naturals`
--

DROP TABLE IF EXISTS `naturals`;
CREATE TABLE `naturals` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `naturals`
--

INSERT INTO `naturals` (`ID`, `DESCRIPTION`, `NAME`) VALUES
(5, 'fák kivágásával nyerhet?', 'fa'),
(6, 'bányászattal nyerhet?', 'k?'),
(7, 'bányászattal nyerhet?', 'arany'),
(55, 'fák kivágásával nyerhet?', 'fa'),
(56, 'bányászattal nyerhet?', 'k?'),
(57, 'bányászattal nyerhet?', 'arany'),
(104, 'fák kivágásával nyerhet?', 'fa'),
(105, 'bányászattal nyerhet?', 'k?'),
(106, 'bányászattal nyerhet?', 'arany'),
(154, 'fák kivágásával nyerhet?', 'fa'),
(155, 'bányászattal nyerhet?', 'k?'),
(156, 'bányászattal nyerhet?', 'arany'),
(354, 'fák kivágásával nyerhet?', 'fa'),
(355, 'bányászattal nyerhet?', 'k?'),
(356, 'bányászattal nyerhet?', 'arany');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `SEQUENCE`
--

DROP TABLE IF EXISTS `SEQUENCE`;
CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `SEQUENCE`
--

INSERT INTO `SEQUENCE` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '600');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `species`
--

DROP TABLE IF EXISTS `species`;
CREATE TABLE `species` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `QUALITIES` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `species`
--

INSERT INTO `species` (`ID`, `DESCRIPTION`, `NAME`, `QUALITIES`) VALUES
(2, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(3, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(4, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(52, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(53, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(54, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(101, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(102, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(103, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(151, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(152, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(153, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(201, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(202, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(203, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(251, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(252, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(253, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(301, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(302, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(303, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(351, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(352, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(353, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(401, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(402, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(403, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(451, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(452, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(453, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(501, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(502, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(503, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(551, 'okos', 'Ember', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(552, 'kicsi', 'Torpe', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078),
(553, 'szép', 'Tunde', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL,
  `ADMIN` tinyint(1) DEFAULT '0',
  `NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`ID`, `ADMIN`, `NAME`, `PASSWORD`) VALUES
(1, 0, 'aa', 'aa'),
(51, 0, 'aa', 'aa');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_empire`
--

DROP TABLE IF EXISTS `user_empire`;
CREATE TABLE `user_empire` (
  `User_ID` bigint(20) NOT NULL,
  `empires_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_hero`
--

DROP TABLE IF EXISTS `user_hero`;
CREATE TABLE `user_hero` (
  `User_ID` bigint(20) NOT NULL,
  `heroes_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `empire`
--
ALTER TABLE `empire`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `empire_building`
--
ALTER TABLE `empire_building`
  ADD PRIMARY KEY (`Empire_ID`,`buildings_ID`),
  ADD KEY `FK_empire_building_buildings_ID` (`buildings_ID`);

--
-- A tábla indexei `hero`
--
ALTER TABLE `hero`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `hero_hybrid`
--
ALTER TABLE `hero_hybrid`
  ADD PRIMARY KEY (`Hero_ID`,`hybrid_ID`),
  ADD KEY `FK_hero_hybrid_hybrid_ID` (`hybrid_ID`);

--
-- A tábla indexei `hybrid`
--
ALTER TABLE `hybrid`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_hybrid_SPECIES_ID` (`SPECIES_ID`);

--
-- A tábla indexei `naturals`
--
ALTER TABLE `naturals`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `SEQUENCE`
--
ALTER TABLE `SEQUENCE`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- A tábla indexei `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `user_empire`
--
ALTER TABLE `user_empire`
  ADD PRIMARY KEY (`User_ID`,`empires_ID`),
  ADD KEY `FK_user_empire_empires_ID` (`empires_ID`);

--
-- A tábla indexei `user_hero`
--
ALTER TABLE `user_hero`
  ADD PRIMARY KEY (`User_ID`,`heroes_ID`),
  ADD KEY `FK_user_hero_heroes_ID` (`heroes_ID`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `empire_building`
--
ALTER TABLE `empire_building`
  ADD CONSTRAINT `FK_empire_building_Empire_ID` FOREIGN KEY (`Empire_ID`) REFERENCES `empire` (`ID`),
  ADD CONSTRAINT `FK_empire_building_buildings_ID` FOREIGN KEY (`buildings_ID`) REFERENCES `building` (`ID`);

--
-- Megkötések a táblához `hero_hybrid`
--
ALTER TABLE `hero_hybrid`
  ADD CONSTRAINT `FK_hero_hybrid_Hero_ID` FOREIGN KEY (`Hero_ID`) REFERENCES `hero` (`ID`),
  ADD CONSTRAINT `FK_hero_hybrid_hybrid_ID` FOREIGN KEY (`hybrid_ID`) REFERENCES `hybrid` (`ID`);

--
-- Megkötések a táblához `hybrid`
--
ALTER TABLE `hybrid`
  ADD CONSTRAINT `FK_hybrid_SPECIES_ID` FOREIGN KEY (`SPECIES_ID`) REFERENCES `species` (`ID`);

--
-- Megkötések a táblához `user_empire`
--
ALTER TABLE `user_empire`
  ADD CONSTRAINT `FK_user_empire_User_ID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_user_empire_empires_ID` FOREIGN KEY (`empires_ID`) REFERENCES `empire` (`ID`);

--
-- Megkötések a táblához `user_hero`
--
ALTER TABLE `user_hero`
  ADD CONSTRAINT `FK_user_hero_User_ID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_user_hero_heroes_ID` FOREIGN KEY (`heroes_ID`) REFERENCES `hero` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
