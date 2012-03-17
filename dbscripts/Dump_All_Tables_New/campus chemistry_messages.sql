-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 12, 2012 at 01:34 AM
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
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `To_User_ID` varchar(60) NOT NULL,
  `From_User_ID` varchar(60) NOT NULL,
  `Message` varchar(200) DEFAULT NULL,
  `Read_Status` varchar(1) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `Time_Stamp` datetime NOT NULL,
  `Deleted` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Message_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`Message_ID`, `To_User_ID`, `From_User_ID`, `Message`, `Read_Status`, `Time_Stamp`, `Deleted`) VALUES
(1, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Hello', '1', '2012-02-21 17:00:59', '1'),
(2, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Hello', '1', '2012-02-21 17:01:35', '1'),
(3, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Hello', '1', '2012-02-21 17:16:26', '1'),
(4, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Hello, Wassup', '1', '2012-02-21 17:17:39', '1'),
(5, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Hello, Girl', '1', '2012-02-21 17:17:39', '1'),
(6, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Ping : Request Times out', '1', '2012-02-21 17:17:39', '1'),
(7, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'sdfsd', '1', '2012-02-24 12:46:11', '0'),
(8, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'empty', '1', '2012-02-24 12:54:35', '0'),
(13, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid', '1', '2012-02-26 01:00:15', '1'),
(14, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus', '1', '2012-02-26 01:00:15', '1'),
(15, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid', '1', '2012-02-26 01:00:15', '0'),
(16, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravid', '1', '2012-02-26 01:00:15', '0'),
(17, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis', '1', '2012-02-26 01:00:15', '0'),
(18, 'makendall@shaw.ca', 'flowacat@shaw.ca', 'swdef', '1', '2012-03-10 21:30:28', '1'),
(19, 'makendall@shaw.ca', 'flowacat@shaw.ca', '123456789', '1', '2012-03-11 19:06:15', '0'),
(20, 'flowacat@shaw.ca', 'makendall@shaw.ca', 'All is well!', '1', '2012-03-11 19:06:47', '0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
