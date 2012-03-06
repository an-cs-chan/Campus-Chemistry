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
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_questions` (
  `Ques_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question` varchar(200) NOT NULL,
  PRIMARY KEY (`Ques_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questions`
--

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;
INSERT INTO `survey_questions` VALUES (1,'I like to plan things out in detail'),(2,'I like to be spontaneous at times'),(3,'I would rather eat dinner at a restaurant than at home'),(4,'Religion is important to me'),(5,'I actively practice my religion'),(6,'Politics are important to me'),(7,'In life, my goal is to be successful'),(8,'Culture is important to me'),(9,'I like being exposed to new cultures and food'),(10,'I like to joke around a lot'),(11,'I like being productive'),(12,'I play first rather than work first'),(13,'I tend to be studious'),(14,'I enjoy staying fit and being active'),(15,'I would rather go to a house party than a pub or bar'),(16,'I would rather stay at home than go out to a party'),(17,'I am up-to-date with the latest movies'),(18,'I really enjoy listening to music'),(19,'There is nothing wrong with flirting even if I am in a relationship'),(20,'Getting good grades is extremely important to me'),(21,'I am quite involved with extracurricular activities'),(22,'I spend a lot of my free time on the computer'),(23,'I am a generally enthusiastic person'),(24,'I like the outdoors'),(25,'Passing my courses is all I try to achieve'),(26,'I would rather go to a resort than backpack when travelling in a new country'),(27,'I am pretty good at managing my own money'),(28,'I like to be the one in charge'),(29,'I am extremely stubborn when I want something'),(30,'I am interested in sports'),(31,'I like to move fast in a relationship'),(32,'I like to cook'),(33,'I drink more than 3 times a week'),(34,'I never drink, regardless of the occasion'),(35,'I would never date a smoker'),(36,'I rarely get angry'),(37,'I rarely get sad'),(38,'I don’t experience strong emotions often'),(39,'I tend to talk more than I listen'),(40,'Money is extremely important in my life'),(41,'I tend to avoid answering personal questions'),(42,'I tend to follow rather than lead'),(43,'Family is extremely important to me'),(44,'I like volunteering and helping the less fortunate'),(45,'I would like to have kids in the future'),(46,'I don’t like hanging around campus, I just go to my classes'),(47,'World issues interest me'),(48,'I am comfortable in large groups of people'),(49,'I would prefer to know someone during one-on-one time'),(50,'I would like to get married soon');
/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
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
