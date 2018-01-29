-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2018 at 05:07 PM
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
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `char_courseCode` char(10) NOT NULL,
  `varchar_courseTitle` varchar(50) NOT NULL,
  `int_courseUnit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_org`
--

CREATE TABLE `tbl_org` (
  `int_orgID` int(11) NOT NULL,
  `varchar_orgName` varchar(50) NOT NULL,
  `int_orgMemb` int(11) NOT NULL DEFAULT '0',
  `char_orgCode` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_org`
--

INSERT INTO `tbl_org` (`int_orgID`, `varchar_orgName`, `int_orgMemb`, `char_orgCode`) VALUES
(1, 'IBITS', 0, 'IBITS20182'),
(2, 'JFINEX', 0, 'JFINEX2018'),
(3, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orgmemb`
--

CREATE TABLE `tbl_orgmemb` (
  `int_orgMembID` int(11) NOT NULL,
  `int_userID` int(11) NOT NULL,
  `char_orgCode` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_orgmemb`
--

INSERT INTO `tbl_orgmemb` (`int_orgMembID`, `int_userID`, `char_orgCode`) VALUES
(5, 28, ''),
(7, 27, 'IBITS2018'),
(8, 26, 'IBITS2018');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_petition`
--

CREATE TABLE `tbl_petition` (
  `int_petitID` int(11) NOT NULL,
  `int_schedID` int(11) NOT NULL,
  `int_petitMemb` int(11) DEFAULT '0',
  `varchar_petitStatus` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_petitmemb`
--

CREATE TABLE `tbl_petitmemb` (
  `int_petitMembID` int(11) NOT NULL,
  `int_petitID` int(11) NOT NULL,
  `int_userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sched`
--

CREATE TABLE `tbl_sched` (
  `int_schedID` int(11) NOT NULL,
  `char_courseCode` char(10) NOT NULL,
  `varchar_schedDay` varchar(10) NOT NULL,
  `varchar_schedTime` varchar(50) NOT NULL,
  `varchar_schedRoom` varchar(20) NOT NULL,
  `varchar_schedProf` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `int_userID` int(11) NOT NULL,
  `char_userStudNo` char(15) NOT NULL,
  `varchar_userFName` varchar(50) NOT NULL,
  `varchar_userLName` varchar(50) NOT NULL,
  `varchar_userAddress` varchar(100) NOT NULL,
  `varchar_userEmailAdd` varchar(50) NOT NULL,
  `varchar_userPassword` varchar(50) NOT NULL,
  `varchar_userType` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`int_userID`, `char_userStudNo`, `varchar_userFName`, `varchar_userLName`, `varchar_userAddress`, `varchar_userEmailAdd`, `varchar_userPassword`, `varchar_userType`) VALUES
(1, '2015-05488-MN-0', 'Abigale', 'Del Rosario', '13 Buli Muntinlupa City', 'admin@gmail.com', 'admin', 'Admin'),
(20, '2014-06422-MN-0', 'Angelika', 'Del Rosario', '1232 Alabang Muntinlupa City', 'orgcouncil@gmail.com', 'orgcouncil', 'Org/Council'),
(22, '2000-12345-MN-0', 'Mel', 'Del Rosario', '501 Sucat Muntinlupa City', 'student@gmail.com', 'student', 'Student'),
(25, '2017-54321-MN-0', 'Abbygale', 'Punzalan', '13 Banana Island', 'abigale@gmail.com', 'miyaka13', 'Student'),
(26, '2014-05488-MN-1', 'Abi ', 'Org', '13 ANONA', 'abigaled@gmail.com', 'miyaka13', 'Org/Council'),
(27, '2013-05488-MN-1', 'Abigale ', 'Organization', '13 WHHHAAAAT', 'abigaledr13@gmail.com', 'miyaka13', 'Org/Council'),
(28, '2001-05488-MN-0', 'ABIGALEEEE', 'DEL ROSAAAAAARIO', '13 WHAT GUMANA KA NA PLEASE', 'what@gmail.com', 'miyaka13', 'Org/Council');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`char_courseCode`),
  ADD UNIQUE KEY `courseTitle` (`varchar_courseTitle`);

--
-- Indexes for table `tbl_org`
--
ALTER TABLE `tbl_org`
  ADD PRIMARY KEY (`int_orgID`),
  ADD UNIQUE KEY `orgName` (`varchar_orgName`),
  ADD UNIQUE KEY `char_orgCode` (`char_orgCode`),
  ADD KEY `char_orgCode_2` (`char_orgCode`);

--
-- Indexes for table `tbl_orgmemb`
--
ALTER TABLE `tbl_orgmemb`
  ADD PRIMARY KEY (`int_orgMembID`),
  ADD UNIQUE KEY `int_userID` (`int_userID`),
  ADD KEY `user_idx` (`int_userID`);

--
-- Indexes for table `tbl_petition`
--
ALTER TABLE `tbl_petition`
  ADD PRIMARY KEY (`int_petitID`),
  ADD KEY `sched_idx` (`int_schedID`);

--
-- Indexes for table `tbl_petitmemb`
--
ALTER TABLE `tbl_petitmemb`
  ADD PRIMARY KEY (`int_petitMembID`),
  ADD KEY `use_idx` (`int_userID`),
  ADD KEY `petit_idx` (`int_petitID`);

--
-- Indexes for table `tbl_sched`
--
ALTER TABLE `tbl_sched`
  ADD PRIMARY KEY (`int_schedID`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`int_userID`),
  ADD UNIQUE KEY `userEmailAdd` (`varchar_userEmailAdd`),
  ADD UNIQUE KEY `varchar_userEmailAdd` (`varchar_userEmailAdd`),
  ADD UNIQUE KEY `char_userStudNo` (`char_userStudNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_org`
--
ALTER TABLE `tbl_org`
  MODIFY `int_orgID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_orgmemb`
--
ALTER TABLE `tbl_orgmemb`
  MODIFY `int_orgMembID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_petition`
--
ALTER TABLE `tbl_petition`
  MODIFY `int_petitID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_petitmemb`
--
ALTER TABLE `tbl_petitmemb`
  MODIFY `int_petitMembID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_sched`
--
ALTER TABLE `tbl_sched`
  MODIFY `int_schedID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `int_userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_orgmemb`
--
ALTER TABLE `tbl_orgmemb`
  ADD CONSTRAINT `user` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_petition`
--
ALTER TABLE `tbl_petition`
  ADD CONSTRAINT `sched` FOREIGN KEY (`int_schedID`) REFERENCES `tbl_sched` (`int_schedID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_petitmemb`
--
ALTER TABLE `tbl_petitmemb`
  ADD CONSTRAINT `petit` FOREIGN KEY (`int_petitID`) REFERENCES `tbl_petition` (`int_petitID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `use` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
