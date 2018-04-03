-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 08, 2014 at 06:53 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `sample`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_staff`
--

CREATE TABLE `data_staff` (
  `EmployeeID` varchar(7) NOT NULL DEFAULT '',
  `StaffName` varchar(40) NOT NULL,
  `Age` varchar(35) NOT NULL,
  `Birthdate` varchar(15) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agents`
--

INSERT INTO `data_staff` (`EmployeeID`, `StaffName`, `Age`, `Birthdate`, `PhoneNumber`) VALUES
('5552121  ', 'Fina Juia        ', '22       ', '11-04-1995 ', '222-111-000   ', '\r'),
('5552122  ', 'Buya Tuim        ', '23       ', '12-05-1994 ', '222-111-222   ', '\r'),
('5552123  ', 'Yaya Roli        ', '24       ', '25-07-1993 ', '222-111-333   ', '\r'),
('5552124  ', 'Ceci Mila        ', '25       ', '9-10-1992  ', '222-111-888   ', '\r'),
('9993401  ', 'Nui Juy          ', '33       ', '23-9-1984  ', '222-111-211   ', '\r'),
('4443321  ', 'Kio Rew          ', '23       ', '30-04-1994 ', '222-111-121   ', '\r'),
('4443322  ', 'Jia Jun          ', '22       ', '2-2-1995   ', '222-111-133   ', '\r');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id_city` varchar(6) NOT NULL DEFAULT '',
  `City` varchar(25) NOT NULL,
  `Postalcode` varchar(25) NOT NULL,
  PRIMARY KEY (`id_city`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id_city`, `City`, `Postalcode`) VALUES
('C1', 'NYC', '2323\r'),
('C2', 'NJ', '2121\r');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id_salary` varchar(5) NOT NULL DEFAULT '',
  `Position` varchar(20) NOT NULL,
  `BaseSalary` decimal(3,2) NOT NULL,
  PRIMARY KEY (`id_salary`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `salary` (`id_salary`, `Position`, `BaseSalary`) VALUES
('p1', 'Waiter          ', '3.4 '),
('p2', 'Manager         ', '7.8 '),
('p3', 'CleaningService ', '3.2 ');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE IF NOT EXISTS `works` (
  `EmployeeID` varchar(6,0) NOT NULL,
  `id_work` varchar(12,2) NOT NULL,
  `WorkHour` varchar(12,2) NOT NULL,
  PRIMARY KEY ('id_work'),
  FOREIGN KEY ('EmployeeID') REFERENCES 'data_staff'('EmployeeID')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`EmployeeID`, `id_work`, `WorkHour`) VALUES
('5552121', 'w1', '8\r'),
('5552122', 'w2', '10\r'),
('5552123', 'w3', '5\r'),
('5552124', 'w4', '6\r'),
('9993401', 'w5', '8\r'),
('4443321', 'w6', '10\r'),
('4443322', 'w7', '10\r');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id_item` varchar(2) NOT NULL DEFAULT '',
  `item` varchar(10) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `despatch`
--

INSERT INTO `items` (`id_item`, `item`) VALUES
('1', 'pizza\r'),
('2', 'burger\r'),
('3', 'soda\r');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `EmployeeID` varchar(10) NOT NULL DEFAULT '',
  `id_item` varchar(2) NOT NULL DEFAULT '',
  FOREIGN KEY (`EmployeeID`) REFERENCES 'data_staff'('EmployeeID'),
  FOREIGN KEY (`id_item`) REFERENCES 'items'('id_item')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foods`
--

INSERT INTO `orders` (`EmployeeID`, `id_item`) VALUES
('5552121', '1\r'),
('5552121', '1\r'),
('5552121', '2\r'),
('5552122', '2\r'),
('5552122', '3\r'),
('5552122', '1\r'),
('5552123', '2\r'),
('5552123', '3\r'),
('5552123', '3\r'),
('5552124', '1\r'),
('5552124', '1\r'),
('5552124', '1\r');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE IF NOT EXISTS `positions` (
  `EmployeeID` varchar(10) NOT NULL,
  `id_salary` varchar(3) NOT NULL,
  FOREIGN KEY (`EmployeeID`) REFERENCES 'data_staff' (`EmployeeID`),
  FOREIGN KEY (`id_salary`) REFERENCES 'salary' (`id_salary`),
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`EmployeeID`, `id_salary`) VALUES
('5552121', 'p1\r'),
('5552122', 'p1\r'),
('5552123', 'p1\r'),
('5552124', 'p1\r'),
('9993401', 'p2\r'),
('4443321', 'p3\r'),
('4443322', 'p3\r');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `EmployeeID` varchar(10) NOT NULL,
  `id_city` varchar(3) NOT NULL,
  FOREIGN KEY (`EmployeeID`) REFERENCES 'data_staff' (`EmployeeID`),
  FOREIGN KEY (`id_city`) REFERENCES 'cities' (`id_city`),
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `positions` (`EmployeeID`, `id_salary`) VALUES
('5552121', 'C1\r'),
('5552122', 'C2\r'),
('5552123', 'C1\r'),
('5552124', 'C2\r'),
('9993401', 'C1\r'),
('4443321', 'C2\r'),
('4443322', 'C2\r');    