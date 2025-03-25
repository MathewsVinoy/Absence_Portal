-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 08, 2025 at 06:20 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `outpass1`
--

-- --------------------------------------------------------

--
-- Table structure for table `outpassmob`
--

CREATE TABLE IF NOT EXISTS `outpassmob` (
  `name` varchar(100) DEFAULT NULL,
  `admno` varchar(20) NOT NULL,
  `sem` varchar(50) DEFAULT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `reason` text,
  `endDate` date DEFAULT NULL,
  `hostel` varchar(100) DEFAULT NULL,
  `noDays` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `workDay` tinyint(1) DEFAULT NULL,
  `staff_status` varchar(30) DEFAULT 'pending',
  `hod_status` varchar(30) DEFAULT 'pending',
  `warden_status` varchar(30) DEFAULT 'pending',
  `security_instatus` varchar(30) DEFAULT 'pending',
  `security_outstatus` varchar(30) DEFAULT 'pending',
  `security_instatus_name` varchar(100) DEFAULT NULL,
  `security_outstatus_name` varchar(100) DEFAULT NULL,
  `out_time` date DEFAULT NULL,
  `in_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `outpassmob`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `outpassmob`
--
ALTER TABLE `outpassmob`
 ADD PRIMARY KEY (`admno`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
