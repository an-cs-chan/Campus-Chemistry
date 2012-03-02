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
  `user_id` varchar(20) NOT NULL,
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

--
-- Table structure for table `survey_answer`
--

DROP TABLE IF EXISTS `survey_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(45) NOT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answer`
--

LOCK TABLES `survey_answer` WRITE;
/*!40000 ALTER TABLE `survey_answer` DISABLE KEYS */;
INSERT INTO `survey_answer` VALUES (1,'Agree'),(2,'Somewhat Agree'),(3,'Disagree'),(4,'Somewhat Disagree');
/*!40000 ALTER TABLE `survey_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `User_ID` varchar(20) NOT NULL,
  `User_Name` varchar(100) NOT NULL,
  `Email_ID` varchar(60) NOT NULL,
  `User_Created` datetime NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `Marital_Status` varchar(20) NOT NULL DEFAULT 'Single',
  `Relationship_Type` varchar(45) NOT NULL DEFAULT 'Hang Out',
  `City` varchar(45) NOT NULL DEFAULT 'Winnipeg',
  `Province` varchar(10) NOT NULL DEFAULT 'MB',
  `Faculty` varchar(45) NOT NULL,
  `Department` varchar(55) NOT NULL,
  `Birth_Country` varchar(45) NOT NULL DEFAULT 'Canada',
  `Image_ID` varchar(45) NOT NULL,
  `Ethinicity` varchar(45) DEFAULT NULL,
  `School` varchar(40) NOT NULL DEFAULT 'University of Manitoba',
  `Survey_Status` varchar(10) NOT NULL DEFAULT 'No',
  `Postal Code` varchar(10) NOT NULL,
  `Hair Colour` varchar(45) DEFAULT NULL,
  `Body_type` varchar(45) DEFAULT NULL,
  `Height` varchar(45) DEFAULT NULL,
  `Eye Colour` varchar(45) DEFAULT NULL,
  `Do you Drink` varchar(45) DEFAULT NULL,
  `About Me` varchar(200) DEFAULT NULL,
  `Do you Smoke` varchar(45) DEFAULT NULL,
  `Do you have Car` varchar(45) DEFAULT NULL,
  `Orientation` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `User_ID` FOREIGN KEY (`User_ID`) REFERENCES `user_login` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES ('','','','0000-00-00 00:00:00','','0000-00-00','Single','Hang Out','Winnipeg','MB','','','Canada','','','University of Manitoba','No','E1O 4S0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1','Lucy','tortor.nibh.sit@fames.ca','2013-01-07 03:10:31','M','1987-06-04','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('10','Beau','elit.elit@ut.edu','2011-07-08 05:43:28','M','1987-08-06','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('11','Fleur','iaculis.nec.eleifend@nonummyFuscefermentum.com','2013-01-16 03:55:14','M','1989-09-13','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('12','Coby','aliquet.lobortis@Sednuncest.edu','2012-09-30 21:35:49','M','1988-10-08','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('13','Tatum','felis.eget.varius@Class.org','2012-09-26 14:54:18','M','1988-09-29','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('14','Yoshi','senectus@mollisIntegertincidunt.ca','2012-12-05 23:08:23','M','1991-05-30','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('15','Tanisha','eros.Proin@cursus.ca','2011-09-11 14:16:40','M','1988-05-21','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('16','Yardley','metus@bibendumullamcorperDuis.ca','2012-09-08 18:01:45','M','1987-03-06','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('17','Fletcher','condimentum.Donec@liberoDonec.ca','2011-10-02 07:41:44','M','1990-03-14','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('18','Anastasia','est.congue.a@idmollisnec.ca','2012-01-01 14:16:05','M','1987-01-13','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('19','Xander','ridiculus.mus.Aenean@nequevenenatis.ca','2011-11-12 02:50:03','M','1989-07-09','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('2','Yasir','ac.feugiat.non@Duiselementum.com','2013-02-03 00:08:22','M','1989-07-18','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('20','Jordan','vel.lectus.Cum@Pellentesquehabitantmorbi.com','2011-02-21 19:36:33','M','1987-09-10','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('21','Travis','vel@enim.edu','2012-07-15 21:23:33','M','1989-04-17','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('22','Mona','auctor@a.org','2012-03-27 21:39:19','M','1986-06-10','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('23','Dacey','mauris.sit@etipsum.com','2011-03-25 19:13:45','M','1989-04-09','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('24','Petra','at.nisi.Cum@Sedid.org','2011-03-14 03:02:52','M','1990-01-29','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('25','Tanya','pede.nonummy.ut@eu.org','2011-09-09 16:07:44','F','1991-02-09','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('26','Lilah','amet@CurabiturdictumPhasellus.com','2012-07-16 02:33:47','F','1988-05-09','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('27','Rahim','interdum.enim.non@mollisPhaselluslibero.com','2012-09-09 06:09:16','F','1987-11-29','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('28','Jayme','ligula.Nullam@InfaucibusMorbi.org','2011-03-23 14:47:48','F','1988-06-28','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('29','Rahim','malesuada.id@aduiCras.org','2012-09-26 15:17:24','F','1987-03-29','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('3','Rooney','pharetra@consequatlectussit.ca','2012-03-24 06:08:34','M','1990-03-18','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('30','Basia','a.auctor.non@ridiculusmus.com','2012-07-05 06:45:33','F','1986-11-22','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('31','Shannon','ipsum.Suspendisse@pellentesqueegetdictum.edu','2011-05-03 05:05:02','F','1988-10-13','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('32','Kathleen','enim@uteros.ca','2012-06-29 07:05:27','F','1986-04-18','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('33','Xander','Integer@montesnasceturridiculus.edu','2011-06-12 17:33:13','F','1990-01-24','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('34','Quinlan','scelerisque@eleifendnon.edu','2011-07-10 02:37:51','F','1989-01-07','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('35','Zachary','Fusce.fermentum.fermentum@sapien.com','2012-11-10 19:48:19','F','1988-11-21','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('36','Brynne','tempor@eterosProin.ca','2013-01-31 16:54:45','F','1991-05-25','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('37','Xerxes','turpis.non@Praesentluctus.org','2012-07-05 18:09:06','F','1987-11-15','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('38','Kirestin','et.pede.Nunc@bibendum.edu','2011-08-06 11:22:39','F','1990-02-17','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('39','Tara','Cum.sociis@temporbibendum.org','2011-06-09 09:41:24','F','1990-01-30','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('4','Phillip','Nulla.facilisi@eratneque.edu','2011-06-09 08:07:00','M','1988-07-13','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('40','Dawn','vitae@iaculisquispede.org','2012-07-24 02:44:58','F','1986-06-01','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('41','Dieter','dignissim.magna.a@neque.org','2011-10-23 03:16:42','F','1991-06-09','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('42','Rinah','dis.parturient@Morbisitamet.edu','2012-09-10 20:07:27','F','1990-01-11','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('43','Flynn','Cras@arcuSedeu.com','2011-04-24 20:52:23','F','1989-10-30','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('44','Ivan','Nulla.eu.neque@nibhdolornonummy.org','2012-10-13 07:25:45','F','1987-08-02','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('45','Amir','mollis@Phasellusvitaemauris.ca','2012-04-15 05:31:59','F','1987-11-26','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('46','Madaline','turpis.In@commodo.ca','2011-04-05 06:01:48','F','1990-10-06','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('47','Piper','montes.nascetur@egetdictumplacerat.edu','2012-06-28 16:51:29','F','1987-09-04','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('48','Solomon','augue@eratin.ca','2011-11-07 15:21:00','F','1991-01-12','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('49','Dominic','Phasellus.fermentum.convallis@Pellentesquehabitant.edu','2011-03-07 14:35:37','F','1989-09-16','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('5','Harding','sed.pede.Cum@non.org','2011-04-07 19:48:44','M','1989-06-14','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('50','Kylan','interdum.Curabitur@tincidunt.ca','2011-05-08 11:20:01','F','1986-08-24','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('6','Guy','a.mi@velest.edu','2011-11-29 05:13:33','M','1989-10-29','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('7','Heather','Sed.nunc.est@consectetuermaurisid.ca','2012-03-07 12:21:13','M','1986-10-09','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('8','Dale','Lorem@tempusrisusDonec.edu','2011-04-05 02:53:43','M','1989-04-26','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL),('9','Raja','et.ultrices.posuere@molestie.edu','2011-11-29 17:39:32','M','1989-04-28','Single','Hang Out','Winnipeg','MB','Science','Computer Science','Canada','','Canadian','University of Manitoba','No','E1O 4S0','Brown','Athelitic','5 feet 8 inches',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login` (
  `User_ID` varchar(20) NOT NULL,
  `User_Name` varchar(100) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Email_ID` varchar(60) NOT NULL,
  `User_Created` datetime NOT NULL,
  `Last_Login` datetime NOT NULL,
  `Session_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES ('1','Lucy','WSY07UFO3FW','tortor.nibh.sit@fames.ca','2013-01-07 03:10:31','2011-12-04 10:56:39','CFC31AZC2NT'),('10','Beau','GHW14WBE5YQ','elit.elit@ut.edu','2011-07-08 05:43:28','2013-01-10 02:49:45','CRH81PCN9BX'),('11','Fleur','EFK45HOA1QE','iaculis.nec.eleifend@nonummyFuscefermentum.com','2013-01-16 03:55:14','2011-06-09 16:10:16','VRK93RUM2XA'),('12','Coby','YXN11YNQ2CR','aliquet.lobortis@Sednuncest.edu','2012-09-30 21:35:49','2011-05-05 15:51:30','RIP59ZLI6GU'),('13','Tatum','DUC07QFW5TN','felis.eget.varius@Class.org','2012-09-26 14:54:18','2011-05-13 14:42:13','AJU66JFR3RA'),('14','Yoshi','XVW06ZDJ6IF','senectus@mollisIntegertincidunt.ca','2012-12-05 23:08:23','2012-11-19 23:56:55','XIK97EQK5WC'),('15','Tanisha','NCW39TLO7OX','eros.Proin@cursus.ca','2011-09-11 14:16:40','2012-05-01 02:08:35','VSV70GRT4ID'),('16','Yardley','EFW63TBG4MU','metus@bibendumullamcorperDuis.ca','2012-09-08 18:01:45','2012-07-06 04:45:30','UFV69RJY8AS'),('17','Fletcher','JVH50EEJ9GQ','condimentum.Donec@liberoDonec.ca','2011-10-02 07:41:44','2012-05-21 19:14:35','CGR84MNK1WJ'),('18','Anastasia','XBJ28RTY8YI','est.congue.a@idmollisnec.ca','2012-01-01 14:16:05','2011-06-26 21:01:26','JUQ40IJM8XX'),('19','Xander','UGA63KYF0SD','ridiculus.mus.Aenean@nequevenenatis.ca','2011-11-12 02:50:03','2011-05-14 01:41:00','LUS75JHP6RC'),('2','Yasir','PTP44NMF3ST','ac.feugiat.non@Duiselementum.com','2013-02-03 00:08:22','2012-04-28 07:40:15','SNK87NEV5DY'),('20','Jordan','OZL32MAO8ZT','vel.lectus.Cum@Pellentesquehabitantmorbi.com','2011-02-21 19:36:33','2011-04-27 02:31:38','JND72WPW2WL'),('21','Travis','OOK15WLT3MH','vel@enim.edu','2012-07-15 21:23:33','2012-08-21 10:09:40','YZL34PDU4SR'),('22','Mona','PCP16ZHE8SY','auctor@a.org','2012-03-27 21:39:19','2011-10-31 16:39:39','HOT25EOA7SV'),('23','Dacey','LMX05NFG5MK','mauris.sit@etipsum.com','2011-03-25 19:13:45','2012-11-28 02:40:31','OZA85UCB9RC'),('24','Petra','JYZ84XVZ3BG','at.nisi.Cum@Sedid.org','2011-03-14 03:02:52','2013-02-01 00:09:50','ZVC57DKI9MJ'),('25','Tanya','DMQ54QIV5EU','pede.nonummy.ut@eu.org','2011-09-09 16:07:44','2012-09-08 11:13:01','RBL68OFR6PZ'),('26','Lilah','BJM28DSF7AA','amet@CurabiturdictumPhasellus.com','2012-07-16 02:33:47','2012-12-21 14:56:38','WZD50OGY0LP'),('27','Rahim','BOJ19WIT0BZ','interdum.enim.non@mollisPhaselluslibero.com','2012-09-09 06:09:16','2012-11-15 10:11:40','VGR72VHH3NF'),('28','Jayme','ZUG03QEG4MZ','ligula.Nullam@InfaucibusMorbi.org','2011-03-23 14:47:48','2011-02-08 18:38:08','YIX75PNU4VC'),('29','Rahim','JHG30MJL1NR','malesuada.id@aduiCras.org','2012-09-26 15:17:24','2011-06-21 22:41:41','QJE57CJH6XB'),('3','Rooney','RRU24JTW8GB','pharetra@consequatlectussit.ca','2012-03-24 06:08:34','2012-04-13 03:44:57','LJI18SYP2CL'),('30','Basia','SEW04CKN6UY','a.auctor.non@ridiculusmus.com','2012-07-05 06:45:33','2012-04-18 17:35:28','HLX98BNN1XV'),('31','Shannon','UXY50UPM9ZZ','ipsum.Suspendisse@pellentesqueegetdictum.edu','2011-05-03 05:05:02','2011-09-07 09:51:15','OPK80HUW3IK'),('32','Kathleen','FFJ00IOD1DP','enim@uteros.ca','2012-06-29 07:05:27','2012-03-12 23:41:19','NVY04IYL6TH'),('33','Xander','BRM28WHY1VB','Integer@montesnasceturridiculus.edu','2011-06-12 17:33:13','2012-01-14 00:29:48','HXX87VXD1VO'),('34','Quinlan','PVT64FXJ0FH','scelerisque@eleifendnon.edu','2011-07-10 02:37:51','2012-08-23 17:09:28','BWB37ZDM8BQ'),('35','Zachary','WET40MCM7AW','Fusce.fermentum.fermentum@sapien.com','2012-11-10 19:48:19','2012-11-08 21:25:49','NPH54IXG3BS'),('36','Brynne','CJD95WLN3OA','tempor@eterosProin.ca','2013-01-31 16:54:45','2013-01-10 05:55:54','AXB54IDZ6BF'),('37','Xerxes','CYC12FEU1PI','turpis.non@Praesentluctus.org','2012-07-05 18:09:06','2012-09-01 19:49:25','FKN23OUV8YU'),('38','Kirestin','ZZN09QHE8LZ','et.pede.Nunc@bibendum.edu','2011-08-06 11:22:39','2011-10-15 10:34:32','QZX84LCS0XO'),('39','Tara','VIL83ZXG6FL','Cum.sociis@temporbibendum.org','2011-06-09 09:41:24','2011-10-24 15:23:57','SXX38VFH2HA'),('4','Phillip','GJO90JGM7ZJ','Nulla.facilisi@eratneque.edu','2011-06-09 08:07:00','2011-11-07 13:18:54','GTC61KVZ1UP'),('40','Dawn','EOD09PWG5UM','vitae@iaculisquispede.org','2012-07-24 02:44:58','2011-11-25 12:58:47','ICI09FJV0OD'),('41','Dieter','WDN06RBP2XV','dignissim.magna.a@neque.org','2011-10-23 03:16:42','2011-04-12 07:27:21','FQH57PNR7XN'),('42','Rinah','MQB37PJM2KC','dis.parturient@Morbisitamet.edu','2012-09-10 20:07:27','2011-02-27 12:28:11','FHR48YYP5MH'),('43','Flynn','JUD84FEF7NR','Cras@arcuSedeu.com','2011-04-24 20:52:23','2011-08-04 07:45:08','RVH91YIA9HP'),('44','Ivan','UWU16XAC1EH','Nulla.eu.neque@nibhdolornonummy.org','2012-10-13 07:25:45','2012-09-02 17:38:30','TMX43EIK1RL'),('45','Amir','ZBM79GXP1XS','mollis@Phasellusvitaemauris.ca','2012-04-15 05:31:59','2011-06-15 08:55:51','ZDK76HEY4NJ'),('46','Madaline','EUR18EXT4VJ','turpis.In@commodo.ca','2011-04-05 06:01:48','2012-09-22 12:48:28','BCO02ZTW2YU'),('47','Piper','LDJ69BUT2SM','montes.nascetur@egetdictumplacerat.edu','2012-06-28 16:51:29','2011-12-17 19:43:06','XDB92QYM5SI'),('48','Solomon','RCQ12ZTD0OW','augue@eratin.ca','2011-11-07 15:21:00','2012-09-18 06:27:32','FEA13BAO6ZA'),('49','Dominic','SID34TMQ7FU','Phasellus.fermentum.convallis@Pellentesquehabitant.edu','2011-03-07 14:35:37','2011-05-06 20:27:16','AZU21VJL8KZ'),('5','Harding','XBD14SCM0JZ','sed.pede.Cum@non.org','2011-04-07 19:48:44','2011-07-27 23:51:59','TGS90URC2MC'),('50','Kylan','KZV12ZMS7ZJ','interdum.Curabitur@tincidunt.ca','2011-05-08 11:20:01','2012-12-31 21:58:35','UIZ83UCL6LW'),('6','Guy','HST17XIE5LR','a.mi@velest.edu','2011-11-29 05:13:33','2011-02-12 22:57:32','ZWR71JRD1IG'),('679','empty','ñõÆcÝR¾*’$À','','2012-02-19 03:47:01','2012-02-19 03:47:01','55'),('7','Heather','VJT10NIV3QA','Sed.nunc.est@consectetuermaurisid.ca','2012-03-07 12:21:13','2011-08-12 04:17:35','JBA39RBB0SF'),('8','Dale','BMQ98KAW8JS','Lorem@tempusrisusDonec.edu','2011-04-05 02:53:43','2011-11-23 20:16:43','KXA79ACY7EZ'),('9','Raja','WFA96QWM0WJ','et.ultrices.posuere@molestie.edu','2011-11-29 17:39:32','2011-02-21 21:31:21','UMI23IZJ3CH');
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `Message_ID` int(11) NOT NULL,
  `To_User_ID` varchar(20) NOT NULL,
  `From_User_ID` varchar(20) NOT NULL,
  `Message` varchar(200) DEFAULT NULL,
  `Read_Status` binary(1) NOT NULL DEFAULT '0',
  `Time_Stamp` datetime NOT NULL,
  PRIMARY KEY (`Message_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile_images`
--

DROP TABLE IF EXISTS `user_profile_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile_images` (
  `user_ID` varchar(20) NOT NULL,
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

--
-- Dumping routines for database 'campus chemistry'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-02-19 12:33:58
