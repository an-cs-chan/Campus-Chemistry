-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2012 at 01:22 AM
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
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`User_ID`, `User_Name`, `Email_ID`, `User_Created`, `Sex`, `DOB`, `Marital_Status`, `Relationship_Type`, `City`, `Province`, `Faculty`, `Department`, `Birth_Country`, `Image_ID`, `Ethinicity`, `School`, `Survey_Status`, `Postal Code`, `Hair Colour`, `Body_type`, `Height`, `Eye Colour`, `Do you Drink`, `About Me`, `Do you Smoke`, `Do you have Car`, `Orientation`) VALUES
('', '', '', '0000-00-00 00:00:00', '', '0000-00-00', 'Single', 'Hang Out', 'Winnipeg', 'MB', '', '', 'Canada', '', '', 'University of Manitoba', 'No', 'E1O 4S0', '', NULL, NULL, '', '', '', '', '', NULL),
('1', 'Lucy', 'tortor.nibh.sit@fames.ca', '2013-01-07 03:10:31', 'M', '1987-06-04', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('10', 'Beau', 'elit.elit@ut.edu', '2011-07-08 05:43:28', 'M', '1987-08-06', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('11', 'Fleur', 'iaculis.nec.eleifend@nonummyFuscefermentum.com', '2013-01-16 03:55:14', 'M', '1989-09-13', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('12', 'Coby', 'aliquet.lobortis@Sednuncest.edu', '2012-09-30 21:35:49', 'M', '1988-10-08', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('13', 'Tatum', 'felis.eget.varius@Class.org', '2012-09-26 14:54:18', 'M', '1988-09-29', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('14', 'Yoshi', 'senectus@mollisIntegertincidunt.ca', '2012-12-05 23:08:23', 'M', '1991-05-30', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('15', 'Tanisha', 'eros.Proin@cursus.ca', '2011-09-11 14:16:40', 'M', '1988-05-21', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('16', 'Yardley', 'metus@bibendumullamcorperDuis.ca', '2012-09-08 18:01:45', 'M', '1987-03-06', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('17', 'Fletcher', 'condimentum.Donec@liberoDonec.ca', '2011-10-02 07:41:44', 'M', '1990-03-14', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('18', 'Anastasia', 'est.congue.a@idmollisnec.ca', '2012-01-01 14:16:05', 'M', '1987-01-13', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('19', 'Xander', 'ridiculus.mus.Aenean@nequevenenatis.ca', '2011-11-12 02:50:03', 'M', '1989-07-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('2', 'Yasir', 'ac.feugiat.non@Duiselementum.com', '2013-02-03 00:08:22', 'M', '1989-07-18', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('20', 'Jordan', 'vel.lectus.Cum@Pellentesquehabitantmorbi.com', '2011-02-21 19:36:33', 'M', '1987-09-10', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('21', 'Travis', 'vel@enim.edu', '2012-07-15 21:23:33', 'M', '1989-04-17', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('22', 'Mona', 'auctor@a.org', '2012-03-27 21:39:19', 'M', '1986-06-10', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('23', 'Dacey', 'mauris.sit@etipsum.com', '2011-03-25 19:13:45', 'M', '1989-04-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('24', 'Petra', 'at.nisi.Cum@Sedid.org', '2011-03-14 03:02:52', 'M', '1990-01-29', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('25', 'Tanya', 'pede.nonummy.ut@eu.org', '2011-09-09 16:07:44', 'M', '1991-02-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('26', 'Lilah', 'amet@CurabiturdictumPhasellus.com', '2012-07-16 02:33:47', 'M', '1988-05-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('27', 'Rahim', 'interdum.enim.non@mollisPhaselluslibero.com', '2012-09-09 06:09:16', 'M', '1987-11-29', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('28', 'Jayme', 'ligula.Nullam@InfaucibusMorbi.org', '2011-03-23 14:47:48', 'M', '1988-06-28', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('29', 'Rahim', 'malesuada.id@aduiCras.org', '2012-09-26 15:17:24', 'M', '1987-03-29', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('3', 'Rooney', 'pharetra@consequatlectussit.ca', '2012-03-24 06:08:34', 'M', '1990-03-18', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('30', 'Basia', 'a.auctor.non@ridiculusmus.com', '2012-07-05 06:45:33', 'M', '1986-11-22', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('31', 'Shannon', 'ipsum.Suspendisse@pellentesqueegetdictum.edu', '2011-05-03 05:05:02', 'M', '1988-10-13', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('32', 'Kathleen', 'enim@uteros.ca', '2012-06-29 07:05:27', 'M', '1986-04-18', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('33', 'Xander', 'Integer@montesnasceturridiculus.edu', '2011-06-12 17:33:13', 'M', '1990-01-24', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('34', 'Quinlan', 'scelerisque@eleifendnon.edu', '2011-07-10 02:37:51', 'M', '1989-01-07', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('35', 'Zachary', 'Fusce.fermentum.fermentum@sapien.com', '2012-11-10 19:48:19', 'M', '1988-11-21', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('36', 'Brynne', 'tempor@eterosProin.ca', '2013-01-31 16:54:45', 'F', '1991-05-25', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('37', 'Xerxes', 'turpis.non@Praesentluctus.org', '2012-07-05 18:09:06', 'F', '1987-11-15', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('38', 'Kirestin', 'et.pede.Nunc@bibendum.edu', '2011-08-06 11:22:39', 'F', '1990-02-17', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('39', 'Tara', 'Cum.sociis@temporbibendum.org', '2011-06-09 09:41:24', 'F', '1990-01-30', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('4', 'Phillip', 'Nulla.facilisi@eratneque.edu', '2011-06-09 08:07:00', 'M', '1988-07-13', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('40', 'Dawn', 'vitae@iaculisquispede.org', '2012-07-24 02:44:58', 'F', '1986-06-01', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('41', 'Dieter', 'dignissim.magna.a@neque.org', '2011-10-23 03:16:42', 'F', '1991-06-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('42', 'Rinah', 'dis.parturient@Morbisitamet.edu', '2012-09-10 20:07:27', 'F', '1990-01-11', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('43', 'Flynn', 'Cras@arcuSedeu.com', '2011-04-24 20:52:23', 'F', '1989-10-30', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('44', 'Ivan', 'Nulla.eu.neque@nibhdolornonummy.org', '2012-10-13 07:25:45', 'F', '1987-08-02', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('45', 'Amir', 'mollis@Phasellusvitaemauris.ca', '2012-04-15 05:31:59', 'F', '1987-11-26', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('46', 'Madaline', 'turpis.In@commodo.ca', '2011-04-05 06:01:48', 'F', '1990-10-06', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('47', 'Piper', 'montes.nascetur@egetdictumplacerat.edu', '2012-06-28 16:51:29', 'F', '1987-09-04', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('48', 'Solomon', 'augue@eratin.ca', '2011-11-07 15:21:00', 'F', '1991-01-12', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('49', 'Dominic', 'Phasellus.fermentum.convallis@Pellentesquehabitant.edu', '2011-03-07 14:35:37', 'F', '1989-09-16', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('5', 'Harding', 'sed.pede.Cum@non.org', '2011-04-07 19:48:44', 'M', '1989-06-14', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('50', 'Kylan', 'interdum.Curabitur@tincidunt.ca', '2011-05-08 11:20:01', 'F', '1986-08-24', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'F'),
('6', 'Guy', 'a.mi@velest.edu', '2011-11-29 05:13:33', 'M', '1989-10-29', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('7', 'Heather', 'Sed.nunc.est@consectetuermaurisid.ca', '2012-03-07 12:21:13', 'M', '1986-10-09', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('8', 'Dale', 'Lorem@tempusrisusDonec.edu', '2011-04-05 02:53:43', 'M', '1989-04-26', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M'),
('9', 'Raja', 'et.ultrices.posuere@molestie.edu', '2011-11-29 17:39:32', 'M', '1989-04-28', 'Single', 'Hang Out', 'Winnipeg', 'MB', 'Science', 'Computer Science', 'Canada', '', 'Canadian', 'University of Manitoba', 'No', 'E1O 4S0', 'Brown', 'Athelitic', '5 feet 8 inches', NULL, NULL, NULL, NULL, NULL, 'M');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `User_ID` FOREIGN KEY (`User_ID`) REFERENCES `user_login` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
