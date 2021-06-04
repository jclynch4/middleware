-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 04, 2021 at 10:45 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tastecuba`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
CREATE TABLE IF NOT EXISTS `applicants` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `First Name` varchar(50) NOT NULL,
  `Last Name` varchar(50) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Date Of Birth` date NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Zip Code` int(5) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone Number` int(11) NOT NULL,
  `Country Of Origin` varchar(50) NOT NULL,
  `ID` int(7) NOT NULL,
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `Customer ID` int(11) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Customer Name` varchar(50) NOT NULL,
  `Customer Last Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Customer ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `First Name` varchar(50) NOT NULL,
  `Last Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ID` int(7) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `Check In Date` date NOT NULL,
  `Check Out Date` date NOT NULL,
  `Room Number` int(11) NOT NULL,
  `Customer ID` int(11) NOT NULL,
  `Reservation ID` int(11) NOT NULL,
  `ID` int(7) NOT NULL,
  PRIMARY KEY (`Reservation ID`),
  KEY `Room Number` (`Room Number`,`Customer ID`),
  KEY `reservation_ibfk_1` (`Customer ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `Room Number` int(11) NOT NULL,
  `Floor` int(11) NOT NULL,
  `No Of Beds` int(11) NOT NULL,
  `Cost Per Night` int(11) NOT NULL,
  `Room Service` int(7) NOT NULL,
  PRIMARY KEY (`Room Number`),
  KEY `Room Service` (`Room Service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applicants`
--
ALTER TABLE `applicants`
  ADD CONSTRAINT `applicants_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `employees` (`ID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Customer ID`) REFERENCES `customers` (`Customer ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`Room Number`) REFERENCES `rooms` (`Room Number`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`ID`) REFERENCES `employees` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
