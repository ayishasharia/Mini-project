-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 27, 2022 at 08:12 AM
-- Server version: 8.0.27
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scratches`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `catid` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `category`) VALUES
(1, 'Arts category'),
(2, 'Equipments');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL,
  `utype` varchar(12) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`lid`, `uname`, `password`, `utype`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'user', 'user', 'user'),
(4, 'user5', 'user2', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `product1`
--

DROP TABLE IF EXISTS `product1`;
CREATE TABLE IF NOT EXISTS `product1` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `catid` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `product1_ibfk_1` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product1`
--

INSERT INTO `product1` (`pid`, `catid`, `name`, `image`, `price`) VALUES
(10, 1, 'monalisa', 'uploads/20220126091336.jpg', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Housename` varchar(20) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Pincode` int NOT NULL,
  `District` varchar(15) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`uid`, `Name`, `Username`, `Housename`, `Area`, `Pincode`, `District`, `Email`, `Phone`) VALUES
(1, 'Praveen Thappily', 'praveen', 'Thappily House', 'kakkodi', 673611, 'kozhikode', 'dr.praveen.official@gmail', '7012270499'),
(2, 'user', 'user', 'asdasd', 'asdads', 688999, 'calicut', 'user@asff.om', '8989'),
(6, 'user5', 'user5', 'thdasdad', 'kiasdasd', 6767, 'caiasdad', 'asd2@ASDASD.COM', '7897978');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product1`
--
ALTER TABLE `product1`
  ADD CONSTRAINT `product1_ibfk_1` FOREIGN KEY (`catid`) REFERENCES `category` (`catid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
