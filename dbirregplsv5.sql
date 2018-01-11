-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2018 at 09:18 AM
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
  `char_orgCode` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_org`
--

INSERT INTO `tbl_org` (`int_orgID`, `varchar_orgName`, `int_orgMemb`, `char_orgCode`) VALUES
(1, 'IBITS', 0, 'IBITS20182'),
(2, 'JFINEX', 0, 'JFINEX2018');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orgmemb`
--

CREATE TABLE `tbl_orgmemb` (
  `int_orgMembID` int(11) NOT NULL,
  `int_orgID` int(11) NOT NULL,
  `int_userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD UNIQUE KEY `orgName` (`varchar_orgName`);

--
-- Indexes for table `tbl_orgmemb`
--
ALTER TABLE `tbl_orgmemb`
  ADD PRIMARY KEY (`int_orgMembID`),
  ADD KEY `user_idx` (`int_userID`),
  ADD KEY `org_idx` (`int_orgID`);

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
  ADD UNIQUE KEY `userEmailAdd` (`varchar_userEmailAdd`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_org`
--
ALTER TABLE `tbl_org`
  MODIFY `int_orgID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_orgmemb`
--
ALTER TABLE `tbl_orgmemb`
  MODIFY `int_orgMembID` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `int_userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_orgmemb`
--
ALTER TABLE `tbl_orgmemb`
  ADD CONSTRAINT `org` FOREIGN KEY (`int_orgID`) REFERENCES `tbl_org` (`int_orgID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
