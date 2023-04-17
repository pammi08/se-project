-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 07:24 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bike_racing`
--
CREATE DATABASE IF NOT EXISTS `db_bike_racing` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_bike_racing`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_racer_details`
--

DROP TABLE IF EXISTS `tbl_racer_details`;
CREATE TABLE IF NOT EXISTS `tbl_racer_details` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `PhoneNO` varchar(100) DEFAULT NULL,
  `Age` int(10) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `UserRoles` varchar(100) DEFAULT NULL,
  `BYKE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_race_detail`
--

DROP TABLE IF EXISTS `tbl_race_detail`;
CREATE TABLE IF NOT EXISTS `tbl_race_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Race_date` date DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT 0.00,
  `Location` varchar(300) DEFAULT NULL,
  `Race_Detail` varchar(300) DEFAULT NULL,
  `Winner` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_race_detail`
--

INSERT INTO `tbl_race_detail` (`ID`, `Race_date`, `Price`, `Location`, `Race_Detail`, `Winner`) VALUES
(1, '2023-04-22', '10000.00', 'Mumbai', '5 Km', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_race_participate_det`
--

DROP TABLE IF EXISTS `tbl_race_participate_det`;
CREATE TABLE IF NOT EXISTS `tbl_race_participate_det` (
  `ID` int(11) NOT NULL,
  `RacerId` int(11) DEFAULT NULL,
  `RaceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_race_participate_det`
--

INSERT INTO `tbl_race_participate_det` (`ID`, `RacerId`, `RaceId`) VALUES
(0, 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
