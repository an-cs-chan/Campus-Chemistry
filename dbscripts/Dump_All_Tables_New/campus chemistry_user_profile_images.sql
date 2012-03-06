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
-- Table structure for table `user_profile_images`
--

DROP TABLE IF EXISTS `user_profile_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile_images` (
  `user_ID` varchar(60) NOT NULL,
  `Image_ID` varchar(45) NOT NULL,
  `Image_File` varchar(150) NOT NULL,
  `Profile_Image` varchar(5) NOT NULL,
  PRIMARY KEY (`user_ID`,`Image_ID`),
  KEY `User_ID` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile_images`
--

LOCK TABLES `user_profile_images` WRITE;
/*!40000 ALTER TABLE `user_profile_images` DISABLE KEYS */;
INSERT INTO `user_profile_images` VALUES ('1','','',''),('10','','',''),('11','','',''),('12','','',''),('13','','',''),('14','','',''),('15','','',''),('16','','',''),('17','','',''),('18','','',''),('19','','',''),('2','','',''),('20','','',''),('21','','',''),('22','','',''),('23','','',''),('24','','',''),('25','','',''),('26','','',''),('27','','',''),('28','','',''),('29','','',''),('3','','',''),('30','','',''),('31','','',''),('32','','',''),('33','','',''),('34','','',''),('35','','',''),('36','','',''),('37','','',''),('38','','',''),('39','','',''),('4','','',''),('40','','',''),('41','','',''),('42','','',''),('43','','',''),('44','','',''),('45','','',''),('46','','',''),('47','','',''),('48','','',''),('49','','',''),('5','','',''),('50','','',''),('6','','',''),('7','','',''),('8','','',''),('9','','','');
/*!40000 ALTER TABLE `user_profile_images` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-05 22:08:41
