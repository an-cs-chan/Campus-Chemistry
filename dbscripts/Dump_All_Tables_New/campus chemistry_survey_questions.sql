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
  `Subject`  varchar(50) NOT NULL,
  PRIMARY KEY (`Ques_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questions`
--

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;
INSERT INTO `survey_questions` VALUES 
    (1,'In life, my goal is to be successful.','Ethics'),
    (2,'Religion is important to me.','Ethics'),
    (3,'I like to plan things out in detail.','Ethics'),
    (4,'I never drink, regardless of the occasion.','Ethics'),
    (5,'Culture is important to me.','Ethics'),
    (6,'Money is extremely important in my life.','Ethics'),
    (7,'I actively practice my religion.','Ethics'),
    (8,'Politics are important to me.','Ethics'),
    
    (9,'I am a generally enthusiastic person.','Personality'),
    (10,'I would rather eat dinner at a restaurant than at home.','Personality'),
    (11,'I rarely get angry.','Personality'),
    (12,'I like to be spontaneous at times.','Personality'),
    (13,'I would rather go to a resort than backpack when travelling in a new country.','Personality'),
    (14,'I don’t experience strong emotions often.','Personality'),
    (15,'I tend to follow rather than lead.','Personality'),
    (16,'I like being exposed to new cultures and food.','Personality'),
    (17,'I tend to talk more than I listen.','Personality'),
    (18,'I am extremely stubborn when I want something.','Personality'),
    (19,'I like being productive.','Personality'),
    (20,'I tend to avoid answering personal questions.','Personality'),
    (21,'I like to joke around a lot.','Personality'),
    (22,'I am pretty good at managing my own money.','Personality'),
    (23,'I rarely get sad.','Personality'),
    (24,'I like to be the one in charge.','Personality'),
    
    (25,'I like the outdoors.','Hobbies / Interests'),
    (26,'I would rather go to a house party than a pub or bar.','Hobbies / Interests'),
    (27,'I am up-to-date with the latest movies.','Hobbies / Interests'),
    (28,'I am quite involved with extracurricular activities.','Hobbies / Interests'),
    (29,'I enjoy staying fit and being active.','Hobbies / Interests'),
    (30,'I would rather stay at home than go out to a party.','Hobbies / Interests'),
    (31,'I really enjoy listening to music.','Hobbies / Interests'),
    (32,'I am interested in sports.','Hobbies / Interests'),
    (33,'I like to cook.','Hobbies / Interests'),
    (34,'I like volunteering and helping the less fortunate.','Hobbies / Interests'),
    (35,'World issues interest me.','Hobbies / Interests'),
    (36,'I drink more than 3 times a week.','Hobbies / Interests'),
    (37,'I spend a lot of my free time on the computer.','Hobbies / Interests'),
    
    (38,'I am comfortable in large groups of people.','Relationships'),
    (39,'Family is extremely important to me.','Relationships'),
    (40,'I would prefer to know someone during one-on-one time.','Relationships'),
    (41,'There is nothing wrong with flirting even if I am in a relationship.','Relationships'),
    (42,'I would never date a smoker.','Relationships'),
    (43,'I would like to get married soon.','Relationships'),
    (44,'I like to move fast in a relationship.','Relationships'),
    (45,'I would like to have kids in the future.','Relationships'),
    
    (46,'Getting good grades is extremely important to me.','Academics'),
    (47,'I play first rather than work first.','Academics'),
    (48,'I tend to be studious.','Academics'),
    (49,'Passing my courses is all I try to achieve.','Academics'),
    (50,'I don’t like hanging around campus, I just go to my classes.','Academics');
    
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
