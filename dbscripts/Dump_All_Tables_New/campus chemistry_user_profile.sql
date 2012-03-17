-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2012 at 04:21 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `campus chemistry`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `User_ID` varchar(60) NOT NULL,
  `User_Name` varchar(100) NOT NULL,
  `Email_ID` varchar(60) NOT NULL,
  `User_Created` datetime NOT NULL,
  `Sex` varchar(10) NOT NULL DEFAULT 'M',
  `DOB` date NOT NULL,
  `Marital_Status` varchar(20) NOT NULL DEFAULT 'Single',
  `Relationship_Type` varchar(45) NOT NULL DEFAULT 'Hang Out',
  `City` varchar(45) NOT NULL DEFAULT 'Winnipeg',
  `Province` varchar(10) NOT NULL DEFAULT 'MB',
  `Faculty` varchar(45) NOT NULL,
  `Department` varchar(55) NOT NULL,
  `Birth_Country` varchar(45) NOT NULL DEFAULT 'Canada',
  `Ethinicity` varchar(45) DEFAULT NULL,
  `School` varchar(40) NOT NULL DEFAULT 'University of Manitoba',
  `Survey_Status` varchar(10) NOT NULL DEFAULT 'No',
  `Postal_Code` varchar(10) NOT NULL,
  `Hair_Colour` varchar(45) DEFAULT NULL,
  `Body_type` varchar(45) DEFAULT NULL,
  `Height` varchar(45) DEFAULT NULL,
  `Eye_Colour` varchar(45) DEFAULT NULL,
  `Do_you_Drink` varchar(45) DEFAULT NULL,
  `About_Me` varchar(200) DEFAULT NULL,
  `Do_you_Smoke` varchar(45) DEFAULT NULL,
  `Do_you_have_Car` varchar(45) DEFAULT NULL,
  `Orientation` varchar(5) NOT NULL DEFAULT 'F',
  `Religion` varchar(45) DEFAULT NULL,
  `MinAgePref` int(11) NOT NULL DEFAULT '18',
  `MaxAgePref` int(11) NOT NULL DEFAULT '25',
  `Profile_Picture` varchar(200) NOT NULL DEFAULT 'images/test.png',
  PRIMARY KEY (`User_ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`User_ID`, `User_Name`, `Email_ID`, `User_Created`, `Sex`, `DOB`, `Marital_Status`, `Relationship_Type`, `City`, `Province`, `Faculty`, `Department`, `Birth_Country`, `Ethinicity`, `School`, `Survey_Status`, `Postal_Code`, `Hair_Colour`, `Body_type`, `Height`, `Eye_Colour`, `Do_you_Drink`, `About_Me`, `Do_you_Smoke`, `Do_you_have_Car`, `Orientation`, `Religion`, `MinAgePref`, `MaxAgePref`, `Profile_Picture`) VALUES
('', '', '', '0000-00-00 00:00:00', '', '0000-00-00', 'Single', 'Hang Out', 'Winnipeg', 'MB', '', '', 'Canada', '', 'University of Manitoba', 'No', 'E1O 4S0', '', NULL, NULL, '', '', '', '', '', '', 'Christian', 18, 25, 'images/test.png'),
('1', 'Lucy', 'tortor.nibh.sit@fames.ca', '2013-01-07 03:10:31', 'M', '1987-06-04', 'Single', 'Hang Out', 'Vancouver', 'MB', 'Science', 'Computer Science', 'US', 'Italy', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('10', 'Beau', 'elit.elit@ut.edu', '2011-07-08 05:43:28', 'M', '1987-08-06', 'Single', 'Hang Out', 'Vancouver', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', NULL, NULL, 'F', 'Buddist', 18, 25, 'images/test.png'),
('11', 'Fleur', 'iaculis.nec.eleifend@nonummyFuscefermentum.com', '2013-01-16 03:55:14', 'M', '1989-09-13', 'Single', 'Hang Out', 'Edmonton', 'MB', 'Science', 'Computer Science', 'Canada', 'French', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', '', '', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur', '', '', 'F', 'Catholic', 18, 25, 'images/test.png'),
('12', 'Coby', 'aliquet.lobortis@Sednuncest.edu', '2012-09-30 21:35:49', 'M', '1988-10-08', 'Single', 'Hang Out', 'Regina', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu', NULL, NULL, 'F', 'Buddist', 18, 25, 'images/test.png'),
('13', 'Tatum', 'felis.eget.varius@Class.org', '2012-09-26 14:54:18', 'M', '1988-09-29', 'Single', 'Hang Out', 'Victoria', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('14', 'Yoshi', 'senectus@mollisIntegertincidunt.ca', '2012-12-05 23:08:23', 'M', '1991-05-30', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Chinese', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet,', NULL, NULL, 'F', 'Buddist', 18, 25, 'images/test.png'),
('15', 'Tanisha', 'eros.Proin@cursus.ca', '2011-09-11 14:16:40', 'M', '1988-05-21', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Indian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', NULL, NULL, 'F', 'Catholic', 18, 25, 'images/test.png'),
('16', 'Yardley', 'metus@bibendumullamcorperDuis.ca', '2012-09-08 18:01:45', 'M', '1987-03-06', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Korean', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', NULL, NULL, 'F', 'Buddist', 18, 25, 'images/test.png'),
('17', 'Fletcher', 'condimentum.Donec@liberoDonec.ca', '2011-10-02 07:41:44', 'M', '1990-03-14', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur', NULL, NULL, 'M', 'Buddist', 18, 25, 'images/test.png'),
('18', 'Anastasia', 'est.congue.a@idmollisnec.ca', '2012-01-01 14:16:05', 'M', '1987-01-13', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', NULL, NULL, 'M', 'Catholic', 18, 25, 'images/test.png'),
('19', 'Xander', 'ridiculus.mus.Aenean@nequevenenatis.ca', '2011-11-12 02:50:03', 'M', '1989-07-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet,', NULL, NULL, 'M', 'Buddist', 18, 25, 'images/test.png'),
('2', 'Yasir', 'ac.feugiat.non@Duiselementum.com', '2013-02-03 00:08:22', 'M', '1989-07-18', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing', NULL, NULL, 'M', 'Buddist', 18, 25, 'images/test.png'),
('20', 'Jordan', 'vel.lectus.Cum@Pellentesquehabitantmorbi.com', '2011-02-21 19:36:33', 'M', '1987-09-10', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', NULL, NULL, 'M', 'Buddist', 18, 25, 'images/test.png'),
('21', 'Travis', 'vel@enim.edu', '2012-07-15 21:23:33', 'M', '1989-04-17', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('22', 'Mona', 'auctor@a.org', '2012-03-27 21:39:19', 'M', '1986-06-10', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('23', 'Dacey', 'mauris.sit@etipsum.com', '2011-03-25 19:13:45', 'M', '1989-04-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('24', 'Petra', 'at.nisi.Cum@Sedid.org', '2011-03-14 03:02:52', 'M', '1990-01-29', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('25', 'Tanya', 'pede.nonummy.ut@eu.org', '2011-09-09 16:07:44', 'M', '1991-02-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('26', 'Lilah', 'amet@CurabiturdictumPhasellus.com', '2012-07-16 02:33:47', 'M', '1988-05-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('27', 'Rahim', 'interdum.enim.non@mollisPhaselluslibero.com', '2012-09-09 06:09:16', 'M', '1987-11-29', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('28', 'Jayme', 'ligula.Nullam@InfaucibusMorbi.org', '2011-03-23 14:47:48', 'M', '1988-06-28', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('29', 'Rahim', 'malesuada.id@aduiCras.org', '2012-09-26 15:17:24', 'M', '1987-03-29', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('3', 'Rooney', 'pharetra@consequatlectussit.ca', '2012-03-24 06:08:34', 'M', '1990-03-18', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('30', 'Basia', 'a.auctor.non@ridiculusmus.com', '2012-07-05 06:45:33', 'M', '1986-11-22', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('31', 'Shannon', 'ipsum.Suspendisse@pellentesqueegetdictum.edu', '2011-05-03 05:05:02', 'M', '1988-10-13', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('32', 'Kathleen', 'enim@uteros.ca', '2012-06-29 07:05:27', 'M', '1986-04-18', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('33', 'Xander', 'Integer@montesnasceturridiculus.edu', '2011-06-12 17:33:13', 'M', '1990-01-24', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('34', 'Quinlan', 'scelerisque@eleifendnon.edu', '2011-07-10 02:37:51', 'M', '1989-01-07', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('35', 'Zachary', 'Fusce.fermentum.fermentum@sapien.com', '2012-11-10 19:48:19', 'M', '1988-11-21', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('36', 'Brynne', 'tempor@eterosProin.ca', '2013-01-31 16:54:45', 'F', '1991-05-25', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('37', 'Xerxes', 'turpis.non@Praesentluctus.org', '2012-07-05 18:09:06', 'F', '1987-11-15', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('38', 'Kirestin', 'et.pede.Nunc@bibendum.edu', '2011-08-06 11:22:39', 'F', '1990-02-17', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('39', 'Tara', 'Cum.sociis@temporbibendum.org', '2011-06-09 09:41:24', 'F', '1990-01-30', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('4', 'Phillip', 'Nulla.facilisi@eratneque.edu', '2011-06-09 08:07:00', 'M', '1988-07-13', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('40', 'Dawn', 'vitae@iaculisquispede.org', '2012-07-24 02:44:58', 'F', '1986-06-01', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('41', 'Dieter', 'dignissim.magna.a@neque.org', '2011-10-23 03:16:42', 'F', '1991-06-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('42', 'Rinah', 'dis.parturient@Morbisitamet.edu', '2012-09-10 20:07:27', 'F', '1990-01-11', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('43', 'Flynn', 'Cras@arcuSedeu.com', '2011-04-24 20:52:23', 'F', '1989-10-30', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('44', 'Ivan', 'Nulla.eu.neque@nibhdolornonummy.org', '2012-10-13 07:25:45', 'F', '1987-08-02', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('45', 'Amir', 'mollis@Phasellusvitaemauris.ca', '2012-04-15 05:31:59', 'F', '1987-11-26', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('46', 'Madaline', 'turpis.In@commodo.ca', '2011-04-05 06:01:48', 'F', '1990-10-06', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('47', 'Piper', 'montes.nascetur@egetdictumplacerat.edu', '2012-06-28 16:51:29', 'F', '1987-09-04', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('48', 'Solomon', 'augue@eratin.ca', '2011-11-07 15:21:00', 'F', '1991-01-12', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('49', 'Dominic', 'Phasellus.fermentum.convallis@Pellentesquehabitant.edu', '2011-03-07 14:35:37', 'F', '1989-09-16', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('5', 'Harding', 'sed.pede.Cum@non.org', '2011-04-07 19:48:44', 'M', '1989-06-14', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('50', 'Kylan', 'interdum.Curabitur@tincidunt.ca', '2011-05-08 11:20:01', 'F', '1986-08-24', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet,', NULL, NULL, 'F', 'Christian', 18, 25, 'images/test.png'),
('6', 'Guy', 'a.mi@velest.edu', '2011-11-29 05:13:33', 'M', '1989-10-29', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('7', 'Heather', 'Sed.nunc.est@consectetuermaurisid.ca', '2012-03-07 12:21:13', 'M', '1986-10-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('8', 'Dale', 'Lorem@tempusrisusDonec.edu', '2011-04-05 02:53:43', 'M', '1989-04-26', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna', NULL, NULL, 'M', 'Christian', 18, 25, 'images/test.png'),
('9', 'Raja', 'et.ultrices.posuere@molestie.edu', '2011-11-29 17:39:32', 'M', '1989-04-28', 'Single', 'Hang Out', 'Toronto', 'MB', 'Science', 'Computer Science', 'Canada', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna', NULL, NULL, 'M', 'Buddist', 18, 25, 'images/test.png'),
('flowacat@shaw.ca', 'flowacat', 'flowacat@shaw.ca', '2012-03-05 23:37:06', 'F', '0000-00-00', 'Single', 'Hang Out', 'Winnipeg', 'MB', '', '', 'Canada', NULL, 'University of Manitoba', 'No', '', '', NULL, NULL, '', '', NULL, '', '', 'M', NULL, 18, 25, 'images/test.png'),
('makendall@shaw.ca', 'makendall', 'makendall@shaw.ca', '2012-03-05 23:38:26', 'F', '0000-00-00', 'Single', 'Hang Out', 'Winnipeg', 'MB', '', '', 'Canada', NULL, 'University of Manitoba', 'No', '', '', NULL, NULL, '', '', NULL, '', '', 'M', NULL, 18, 25, 'images/test.png');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
