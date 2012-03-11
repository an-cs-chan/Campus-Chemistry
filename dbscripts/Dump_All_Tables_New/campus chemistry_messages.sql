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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `To_User_ID` varchar(60) NOT NULL,
  `From_User_ID` varchar(60) NOT NULL,
  `Message` varchar(200) DEFAULT NULL,
  `Read_Status` varchar(1) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `Time_Stamp` datetime NOT NULL,
  `Deleted` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Message_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'1','2','Hello','1','2012-02-21 17:00:59','0'),(2,'1','2','Hello','1','2012-02-21 17:01:35','0'),(3,'13','12','Hello','1','2012-02-21 17:16:26','1'),(4,'13','14','Hello, Wassup','1','2012-02-21 17:17:39','0'),(5,'13','14','Hello, Girl','1','2012-02-21 17:17:39','0'),(6,'13','14','Ping : Request Times out','1','2012-02-21 17:17:39','1'),(7,'12','1','sdfsd','1','2012-02-24 12:46:11','0'),(8,'12','1','empty','1','2012-02-24 12:54:35','0'),(13,'13','12','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid','1','2012-02-26 01:00:15','0'),(14,'13','11','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus','1','2012-02-26 01:00:15','0'),(15,'13','11','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid','1','2012-02-26 01:00:15','0'),(16,'13','11','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid','1','2012-02-26 01:00:15','0'),(17,'13','12','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis','1','2012-02-26 01:00:15','0'),(18,'12','1','swdef','1','2012-03-10 21:30:28','0');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-11 15:26:45
