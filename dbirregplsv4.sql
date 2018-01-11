-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2018 at 06:37 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbirregpls`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `int_userID` int(11) NOT NULL,
  `varchar_userFName` varchar(50) NOT NULL,
  `varchar_userLName` varchar(50) NOT NULL,
  `varchar_userAddress` varchar(100) NOT NULL,
  `varchar_userEmailAdd` varchar(50) NOT NULL,
  `varchar_userPassword` varchar(50) NOT NULL,
  `varchar_userType` varchar(11) NOT NULL,
  `varchar_userStatus` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`int_userID`, `varchar_userFName`, `varchar_userLName`, `varchar_userAddress`, `varchar_userEmailAdd`, `varchar_userPassword`, `varchar_userType`, `varchar_userStatus`) VALUES
(1, 'Abigale', 'Del Rosario', '13 Buli Muntinlupa City', 'admin@gmail.com', 'admin', 'Admin', ''),
(20, 'Angelika', 'Del Rosario', '1232 Alabang Muntinlupa City', 'orgcouncil@gmail.com', 'orgcouncil', 'Org/Council', 'Approved'),
(21, 'Marlon ', 'Del Rosario', '920 Cupang Muntinlupa City', 'officer@gmail.com', 'officer', 'Officer', 'Approved'),
(22, 'Mel', 'Del Rosario', '501 Sucat Muntinlupa City', 'student@gmail.com', 'student', 'Student', 'Approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`int_userID`),
  ADD UNIQUE KEY `userEmailAdd` (`varchar_userEmailAdd`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `int_userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
