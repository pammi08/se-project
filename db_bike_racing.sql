-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2023 at 09:04 AM
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
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_racer_details`
--

INSERT INTO `tbl_racer_details` (`UserID`, `UserName`, `FirstName`, `LastName`, `Email`, `PhoneNO`, `Age`, `Password`, `UserRoles`) VALUES
(1, 'Azar', 'Azaruddin', 'Bhadgavkar', 'azaruddinbhadgavkar1111@gmail.com', '08408098804', 32, '8408098804', 'Turnament Management'),
(2, 'Azaruddin', 'Azaruddin', 'Bhadgavkar', 'azaruddinbhadgavkar1111@gmail.com', '08408098804', 32, '8408098804', 'Racers');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
