-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 23, 2012 at 06:40 PM
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
-- Table structure for table `blinddates`
--

CREATE TABLE IF NOT EXISTS `blinddates` (
  `date_id` int(11) NOT NULL AUTO_INCREMENT,
  `To_User_ID` varchar(60) NOT NULL,
  `From_User_ID` varchar(60) NOT NULL,
  `To_User_New` varchar(5) NOT NULL DEFAULT 'FALSE',
  `From_User_New` varchar(5) NOT NULL DEFAULT 'TRUE',
  `State` varchar(10) NOT NULL DEFAULT 'Open',
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
