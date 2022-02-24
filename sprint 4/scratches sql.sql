-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 21, 2022 at 06:56 AM
-- Server version: 8.0.27
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
-- Table structure for table `customorder`
--

DROP TABLE IF EXISTS `customorder`;
CREATE TABLE IF NOT EXISTS `customorder` (
  `Order_id` int NOT NULL AUTO_INCREMENT,
  `User` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Image` varchar(200) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Amount` int NOT NULL,
  `Proof` varchar(60) NOT NULL,
  `Status` varchar(500) NOT NULL,
  PRIMARY KEY (`Order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customorder`
--

INSERT INTO `customorder` (`Order_id`, `User`, `Name`, `Address`, `Image`, `Description`, `Date`, `Amount`, `Proof`, `Status`) VALUES
(4, 2, 'Praveen Thappily', 'ad', 'uploads/20220221053054.jpg', 'ad', '2022-02-21', 500, 'uploads/20220221063155.png', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `Feed_id` int NOT NULL AUTO_INCREMENT,
  `Order_id` int NOT NULL,
  `Feedback` varchar(50) NOT NULL,
  PRIMARY KEY (`Feed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`Feed_id`, `Order_id`, `Feedback`) VALUES
(1, 2, 'Product quality is not good');

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
-- Table structure for table `order_tbl`
--

DROP TABLE IF EXISTS `order_tbl`;
CREATE TABLE IF NOT EXISTS `order_tbl` (
  `Order_id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `pid` int NOT NULL,
  `Amount` int NOT NULL,
  `payment_mode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `d_date` date NOT NULL,
  `customisation` varchar(100) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `delivery_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`Order_id`),
  KEY `order_tbl_ibfk_1` (`u_id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`Order_id`, `u_id`, `Name`, `Address`, `pid`, `Amount`, `payment_mode`, `d_date`, `customisation`, `Image`, `delivery_date`, `status`) VALUES
(2, 2, 'Praveen Thappily', 'asdasd', 10, 1000, 'Cash On Delivery', '2022-02-08', 'use dark shading', 'uploads/20220208113703.png', '0000-00-00', 'Delivered'),
(4, 2, 'Praveen Thappily', 'abcd house, fghjfh', 10, 1000, 'Cash On Delivery', '2022-02-21', '', 'uploads/20220221031818.', '0000-00-00', 'Order placed'),
(5, 2, 'asd', 'asd', 13, 8000, 'Cash On Delivery', '2022-02-21', 'No', 'uploads/20220221032552.', '0000-00-00', 'Order placed');

-- --------------------------------------------------------

--
-- Table structure for table `product1`
--

DROP TABLE IF EXISTS `product1`;
CREATE TABLE IF NOT EXISTS `product1` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `catid` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(300) NOT NULL,
  `price` int NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `product1_ibfk_1` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product1`
--

INSERT INTO `product1` (`pid`, `catid`, `name`, `image`, `price`, `image1`, `image2`, `description`) VALUES
(10, 1, 'Tiger Picture', 'uploads/20220131110654.jpg', 1000, 'uploads/20220131110654a.jpg', 'uploads/20220131110654b.jpg', ''),
(13, 2, 'Lion Portrate', 'uploads/20220131103751.jpg', 8000, 'uploads/20220131103751a.jpg', 'uploads/20220131103751b.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Housename` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Area` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Pincode` int NOT NULL,
  `District` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Constraints for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD CONSTRAINT `order_tbl_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `registration` (`uid`),
  ADD CONSTRAINT `order_tbl_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product1` (`pid`);

--
-- Constraints for table `product1`
--
ALTER TABLE `product1`
  ADD CONSTRAINT `product1_ibfk_1` FOREIGN KEY (`catid`) REFERENCES `category` (`catid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
