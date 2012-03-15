CREATE DATABASE  IF NOT EXISTS `campus chemistry` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `campus chemistry`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: campus chemistry
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `user_survey_answers`
--

DROP TABLE IF EXISTS `user_survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_survey_answers` (
  `user_id` varchar(60) NOT NULL,
  `Ques_ID_1` int(11) DEFAULT NULL,
  `Ques_ID_2` int(11) DEFAULT NULL,
  `Ques_ID_3` int(11) DEFAULT NULL,
  `Ques_ID_4` int(11) DEFAULT NULL,
  `Ques_ID_5` int(11) DEFAULT NULL,
  `Ques_ID_6` int(11) DEFAULT NULL,
  `Ques_ID_7` int(11) DEFAULT NULL,
  `Ques_ID_8` int(11) DEFAULT NULL,
  `Ques_ID_9` int(11) DEFAULT NULL,
  `Ques_ID_10` int(11) DEFAULT NULL,
  `Ques_ID_11` int(11) DEFAULT NULL,
  `Ques_ID_12` int(11) DEFAULT NULL,
  `Ques_ID_13` int(11) DEFAULT NULL,
  `Ques_ID_14` int(11) DEFAULT NULL,
  `Ques_ID_15` int(11) DEFAULT NULL,
  `Ques_ID_16` int(11) DEFAULT NULL,
  `Ques_ID_17` int(11) DEFAULT NULL,
  `Ques_ID_18` int(11) DEFAULT NULL,
  `Ques_ID_19` int(11) DEFAULT NULL,
  `Ques_ID_20` int(11) DEFAULT NULL,
  `Ques_ID_21` int(11) DEFAULT NULL,
  `Ques_ID_22` int(11) DEFAULT NULL,
  `Ques_ID_23` int(11) DEFAULT NULL,
  `Ques_ID_24` int(11) DEFAULT NULL,
  `Ques_ID_25` int(11) DEFAULT NULL,
  `Ques_ID_26` int(11) DEFAULT NULL,
  `Ques_ID_27` int(11) DEFAULT NULL,
  `Ques_ID_28` int(11) DEFAULT NULL,
  `Ques_ID_29` int(11) DEFAULT NULL,
  `Ques_ID_30` int(11) DEFAULT NULL,
  `Ques_ID_31` int(11) DEFAULT NULL,
  `Ques_ID_32` int(11) DEFAULT NULL,
  `Ques_ID_33` int(11) DEFAULT NULL,
  `Ques_ID_34` int(11) DEFAULT NULL,
  `Ques_ID_35` int(11) DEFAULT NULL,
  `Ques_ID_36` int(11) DEFAULT NULL,
  `Ques_ID_37` int(11) DEFAULT NULL,
  `Ques_ID_38` int(11) DEFAULT NULL,
  `Ques_ID_39` int(11) DEFAULT NULL,
  `Ques_ID_40` int(11) DEFAULT NULL,
  `Ques_ID_41` int(11) DEFAULT NULL,
  `Ques_ID_42` int(11) DEFAULT NULL,
  `Ques_ID_43` int(11) DEFAULT NULL,
  `Ques_ID_44` int(11) DEFAULT NULL,
  `Ques_ID_45` int(11) DEFAULT NULL,
  `Ques_ID_46` int(11) DEFAULT NULL,
  `Ques_ID_47` int(11) DEFAULT NULL,
  `Ques_ID_48` int(11) DEFAULT NULL,
  `Ques_ID_49` int(11) DEFAULT NULL,
  `Ques_ID_50` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_survey_answers`
--

LOCK TABLES `user_survey_answers` WRITE;
/*!40000 ALTER TABLE `user_survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_survey_answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-05 22:08:40
