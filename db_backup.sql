-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: hoe
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SEQUENCE`
--

DROP TABLE IF EXISTS `SEQUENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE`
--

LOCK TABLES `SEQUENCE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE` DISABLE KEYS */;
INSERT INTO `SEQUENCE` VALUES ('SEQ_GEN',400);
/*!40000 ALTER TABLE `SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `ID` bigint(20) NOT NULL,
  `BUILDTIME` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (354,10,'oktatasra szolgal','Akademia'),(355,20,'katonak kepzese','Barakk'),(356,25,'asvanyok tarolasara szolgal','Raktar'),(357,40,'lakossag novelesere szolgal','Haz'),(358,30,'allatok tartasara szolgal','Istallo'),(359,35,'vedelemre szolgal','Ortorony'),(360,10,'uzletelesre szolgal','Bolt');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_stock`
--

DROP TABLE IF EXISTS `building_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_stock` (
  `Building_ID` bigint(20) NOT NULL,
  `produce_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Building_ID`,`produce_ID`),
  KEY `FK_building_stock_produce_ID` (`produce_ID`),
  CONSTRAINT `FK_building_stock_Building_ID` FOREIGN KEY (`Building_ID`) REFERENCES `building` (`ID`),
  CONSTRAINT `FK_building_stock_produce_ID` FOREIGN KEY (`produce_ID`) REFERENCES `stock` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_stock`
--

LOCK TABLES `building_stock` WRITE;
/*!40000 ALTER TABLE `building_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `building_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empire`
--

DROP TABLE IF EXISTS `empire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empire` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LEVEL` bigint(20) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empire`
--

LOCK TABLES `empire` WRITE;
/*!40000 ALTER TABLE `empire` DISABLE KEYS */;
/*!40000 ALTER TABLE `empire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empire_building`
--

DROP TABLE IF EXISTS `empire_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empire_building` (
  `Empire_ID` bigint(20) NOT NULL,
  `buildings_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Empire_ID`,`buildings_ID`),
  KEY `FK_empire_building_buildings_ID` (`buildings_ID`),
  CONSTRAINT `FK_empire_building_Empire_ID` FOREIGN KEY (`Empire_ID`) REFERENCES `empire` (`ID`),
  CONSTRAINT `FK_empire_building_buildings_ID` FOREIGN KEY (`buildings_ID`) REFERENCES `building` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empire_building`
--

LOCK TABLES `empire_building` WRITE;
/*!40000 ALTER TABLE `empire_building` DISABLE KEYS */;
/*!40000 ALTER TABLE `empire_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empire_population`
--

DROP TABLE IF EXISTS `empire_population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empire_population` (
  `Empire_ID` bigint(20) NOT NULL,
  `population_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Empire_ID`,`population_ID`),
  KEY `FK_empire_population_population_ID` (`population_ID`),
  CONSTRAINT `FK_empire_population_Empire_ID` FOREIGN KEY (`Empire_ID`) REFERENCES `empire` (`ID`),
  CONSTRAINT `FK_empire_population_population_ID` FOREIGN KEY (`population_ID`) REFERENCES `population` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empire_population`
--

LOCK TABLES `empire_population` WRITE;
/*!40000 ALTER TABLE `empire_population` DISABLE KEYS */;
/*!40000 ALTER TABLE `empire_population` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empire_stock`
--

DROP TABLE IF EXISTS `empire_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empire_stock` (
  `Empire_ID` bigint(20) NOT NULL,
  `produce_ID` bigint(20) NOT NULL,
  `warehouse_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Empire_ID`,`produce_ID`,`warehouse_ID`),
  KEY `FK_empire_stock_warehouse_ID` (`warehouse_ID`),
  KEY `FK_empire_stock_produce_ID` (`produce_ID`),
  CONSTRAINT `FK_empire_stock_Empire_ID` FOREIGN KEY (`Empire_ID`) REFERENCES `empire` (`ID`),
  CONSTRAINT `FK_empire_stock_produce_ID` FOREIGN KEY (`produce_ID`) REFERENCES `stock` (`ID`),
  CONSTRAINT `FK_empire_stock_warehouse_ID` FOREIGN KEY (`warehouse_ID`) REFERENCES `stock` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empire_stock`
--

LOCK TABLES `empire_stock` WRITE;
/*!40000 ALTER TABLE `empire_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `empire_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero`
--

DROP TABLE IF EXISTS `hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hero` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero`
--

LOCK TABLES `hero` WRITE;
/*!40000 ALTER TABLE `hero` DISABLE KEYS */;
/*!40000 ALTER TABLE `hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero_hybrid`
--

DROP TABLE IF EXISTS `hero_hybrid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hero_hybrid` (
  `Hero_ID` bigint(20) NOT NULL,
  `hybrid_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Hero_ID`,`hybrid_ID`),
  KEY `FK_hero_hybrid_hybrid_ID` (`hybrid_ID`),
  CONSTRAINT `FK_hero_hybrid_Hero_ID` FOREIGN KEY (`Hero_ID`) REFERENCES `hero` (`ID`),
  CONSTRAINT `FK_hero_hybrid_hybrid_ID` FOREIGN KEY (`hybrid_ID`) REFERENCES `hybrid` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero_hybrid`
--

LOCK TABLES `hero_hybrid` WRITE;
/*!40000 ALTER TABLE `hero_hybrid` DISABLE KEYS */;
/*!40000 ALTER TABLE `hero_hybrid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero_quality`
--

DROP TABLE IF EXISTS `hero_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hero_quality` (
  `Hero_ID` bigint(20) NOT NULL,
  `qualities_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Hero_ID`,`qualities_ID`),
  KEY `FK_hero_quality_qualities_ID` (`qualities_ID`),
  CONSTRAINT `FK_hero_quality_Hero_ID` FOREIGN KEY (`Hero_ID`) REFERENCES `hero` (`ID`),
  CONSTRAINT `FK_hero_quality_qualities_ID` FOREIGN KEY (`qualities_ID`) REFERENCES `quality` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero_quality`
--

LOCK TABLES `hero_quality` WRITE;
/*!40000 ALTER TABLE `hero_quality` DISABLE KEYS */;
/*!40000 ALTER TABLE `hero_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hybrid`
--

DROP TABLE IF EXISTS `hybrid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hybrid` (
  `ID` bigint(20) NOT NULL,
  `PERCENT` tinyint(4) DEFAULT NULL,
  `SPECIES_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_hybrid_SPECIES_ID` (`SPECIES_ID`),
  CONSTRAINT `FK_hybrid_SPECIES_ID` FOREIGN KEY (`SPECIES_ID`) REFERENCES `species` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hybrid`
--

LOCK TABLES `hybrid` WRITE;
/*!40000 ALTER TABLE `hybrid` DISABLE KEYS */;
/*!40000 ALTER TABLE `hybrid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naturals`
--

DROP TABLE IF EXISTS `naturals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `naturals` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naturals`
--

LOCK TABLES `naturals` WRITE;
/*!40000 ALTER TABLE `naturals` DISABLE KEYS */;
/*!40000 ALTER TABLE `naturals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `population`
--

DROP TABLE IF EXISTS `population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `population` (
  `ID` bigint(20) NOT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `PEOPLE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_population_PEOPLE_ID` (`PEOPLE_ID`),
  CONSTRAINT `FK_population_PEOPLE_ID` FOREIGN KEY (`PEOPLE_ID`) REFERENCES `people` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `population`
--

LOCK TABLES `population` WRITE;
/*!40000 ALTER TABLE `population` DISABLE KEYS */;
/*!40000 ALTER TABLE `population` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality`
--

DROP TABLE IF EXISTS `quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ABILITY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality`
--

LOCK TABLES `quality` WRITE;
/*!40000 ALTER TABLE `quality` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES (51,'okos','Ember'),(52,'kicsi','Torpe'),(53,'szép','Tunde'),(102,'okos','Ember'),(103,'kicsi','Torpe'),(104,'szép','Tunde'),(151,'okos','Ember'),(152,'kicsi','Torpe'),(153,'szép','Tunde'),(201,'okos','Ember'),(202,'kicsi','Torpe'),(203,'szép','Tunde'),(251,'okos','Ember'),(252,'kicsi','Torpe'),(253,'szép','Tunde'),(301,'okos','Ember'),(302,'kicsi','Torpe'),(303,'szép','Tunde'),(351,'okos','Ember'),(352,'kicsi','Torpe'),(353,'szép','Tunde');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species_quality`
--

DROP TABLE IF EXISTS `species_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species_quality` (
  `Species_ID` bigint(20) NOT NULL,
  `qualities_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Species_ID`,`qualities_ID`),
  KEY `FK_species_quality_qualities_ID` (`qualities_ID`),
  CONSTRAINT `FK_species_quality_Species_ID` FOREIGN KEY (`Species_ID`) REFERENCES `species` (`ID`),
  CONSTRAINT `FK_species_quality_qualities_ID` FOREIGN KEY (`qualities_ID`) REFERENCES `quality` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species_quality`
--

LOCK TABLES `species_quality` WRITE;
/*!40000 ALTER TABLE `species_quality` DISABLE KEYS */;
/*!40000 ALTER TABLE `species_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `ID` bigint(20) NOT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `ASSET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_stock_ASSET_ID` (`ASSET_ID`),
  CONSTRAINT `FK_stock_ASSET_ID` FOREIGN KEY (`ASSET_ID`) REFERENCES `naturals` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL,
  `ADMIN` tinyint(1) DEFAULT '0',
  `NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'aa','aa'),(101,0,'adam','adam');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_empire`
--

DROP TABLE IF EXISTS `user_empire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_empire` (
  `User_ID` bigint(20) NOT NULL,
  `empires_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`User_ID`,`empires_ID`),
  KEY `FK_user_empire_empires_ID` (`empires_ID`),
  CONSTRAINT `FK_user_empire_User_ID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK_user_empire_empires_ID` FOREIGN KEY (`empires_ID`) REFERENCES `empire` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_empire`
--

LOCK TABLES `user_empire` WRITE;
/*!40000 ALTER TABLE `user_empire` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_empire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hero`
--

DROP TABLE IF EXISTS `user_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_hero` (
  `User_ID` bigint(20) NOT NULL,
  `heroes_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`User_ID`,`heroes_ID`),
  KEY `FK_user_hero_heroes_ID` (`heroes_ID`),
  CONSTRAINT `FK_user_hero_User_ID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK_user_hero_heroes_ID` FOREIGN KEY (`heroes_ID`) REFERENCES `hero` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hero`
--

LOCK TABLES `user_hero` WRITE;
/*!40000 ALTER TABLE `user_hero` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_hero` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04  8:03:06
