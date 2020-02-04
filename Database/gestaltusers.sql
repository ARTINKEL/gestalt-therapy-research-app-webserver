-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2020 at 08:07 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestaltusers`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `ID` int(11) NOT NULL,
  `Assign` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Assign`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`ID`, `Assign`) VALUES
(123, '{\r\n\"Assignment_1\" : {\"Question_1\" : {\r\n   \"Question_Text\" : \"Text\",\r\n   \"Option_1\" : \"Option Text\",\r\n   \"Option_2\" : \"Option Text\"\r\n   },\r\n\"Question_2\" : {\r\n   \"Question_Text\" : \"Text\"\r\n}\r\n},\r\n\"Assignment_2\" : {\"Question_1\" : {\r\n   \"Question_Text\" : \"Text\",\r\n   \"Option_1\" : \"Option Text\",\r\n   \"Option_2\" : \"Option Text\"\r\n   },\r\n\"Question_2\" : {\r\n   \"Question_Text\" : \"Text\"\r\n}\r\n}\r\n}'),
(666, '{\r\n\"Assignment_A\" : {\"Question_1\" : {\r\n   \"Question_Text\" : \"Text\",\r\n   \"Option_1\" : \"Option Text\",\r\n   \"Option_2\" : \"Option Text\"\r\n   },\r\n\"Question_2\" : {\r\n   \"Question_Text\" : \"Text\"\r\n}\r\n},\r\n\"Assignment_B\" : {\"Question_1\" : {\r\n   \"Question_Text\" : \"Text\",\r\n   \"Option_1\" : \"Option Text\",\r\n   \"Option_2\" : \"Option Text\"\r\n   },\r\n\"Question_2\" : {\r\n   \"Question_Text\" : \"Text\"\r\n}\r\n}\r\n}');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` smallint(6) NOT NULL,
  `Password` text NOT NULL,
  `Admin` tinyint(1) DEFAULT NULL,
  `AssignmentData` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Password`, `Admin`, `AssignmentData`) VALUES
(123, '123', NULL, 123),
(666, '666', 0, 666);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AssignmentData` (`AssignmentData`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=667;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`AssignmentData`) REFERENCES `assignment` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
