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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-05 22:08:41
