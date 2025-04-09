-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 27, 2025 at 01:36 PM
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
  `sl_no` 
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

INSERT INTO `outpassmob` (`name`, `admno`, `sem`, `dept`, `reason`, `endDate`, `hostel`, `noDays`, `startDate`, `workDay`, `staff_status`, `hod_status`, `warden_status`, `security_instatus`, `security_outstatus`, `security_instatus_name`, `security_outstatus_name`, `out_time`, `in_time`) VALUES
('Mathews Vinoy', '5736', 'S6', 'AI', 'tt', '2025-03-28', 'false', 1, '2025-03-27', 1, 'pending', 'pending', 'pending', 'pending', 'pending', NULL, NULL, NULL, NULL),
('Mathews Vinoy', '5747', 'S6', 'AI', 'rhrufm', '2025-03-18', 'true', 5, '2025-03-08', 0, 'accepted', 'accepted', 'accepted', 'rejected', 'accepted', 'Thomas M.T', 'Thomas M.T', '2025-03-26', '2025-03-26');

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
