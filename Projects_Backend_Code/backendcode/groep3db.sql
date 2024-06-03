-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 22, 2024 at 12:52 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `groep3db`
--

-- --------------------------------------------------------

--
-- Table structure for table `don`
--

DROP TABLE IF EXISTS `don`;
CREATE TABLE IF NOT EXISTS `don` (
  `KlantID` int NOT NULL,
  `klantNaam` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `AantalUren` decimal(10,2) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  PRIMARY KEY (`KlantID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `don`
--

INSERT INTO `don` (`KlantID`, `klantNaam`, `project`, `AantalUren`, `Datum`) VALUES
(1, 'Wonder Construction', 'Lambda Taskforce', '20.00', '2024-03-01 00:00:00'),
(2, 'Blooming Flowers', 'Theta Operation', '20.50', '2024-03-02 00:00:00'),
(3, 'Technovation Inc.', 'Zeta Assignment', '30.00', '2024-03-03 00:00:00'),
(4, 'Retail Giants', 'Epsilon Venture', '40.00', '2024-03-04 00:00:00'),
(5, 'Happy Foods', 'Alpha Project', '50.00', '2024-03-05 00:00:00'),
(6, 'Medical Solutions', 'Kappa Initiative', '60.00', '2024-03-06 00:00:00'),
(7, 'Travel Experts', 'Iota Project', '70.00', '2024-03-07 00:00:00'),
(8, 'Coding Crew', 'Gamma Taskforce', '80.00', '2024-03-08 00:00:00'),
(9, 'Creative Agency', 'Beta Initiative', '20.00', '2024-03-09 00:00:00'),
(10, 'Legal Services', 'Delta Endeavor', '20.50', '2024-03-10 00:00:00'),
(11, 'Pet Paradise', 'Sigma Quest', '30.00', '2024-03-11 00:00:00'),
(12, 'Financial Advisors', 'Omega Expedition', '40.00', '2024-03-12 00:00:00'),
(13, 'Educational Solutions', 'Nexus Campaign', '50.00', '2024-03-13 00:00:00'),
(14, 'Adventure Tours', 'Spectrum Endeavor', '60.00', '2024-03-14 00:00:00'),
(15, 'Bookworms Unite', 'Horizon Quest', '70.00', '2024-03-15 00:00:00'),
(16, 'Green Solutions', 'Apex Venture', '80.00', '2024-03-16 00:00:00'),
(17, 'Happy Pets', 'Catalyst Assignment', '20.00', '2024-03-17 00:00:00'),
(18, 'Tech Repair', 'Horizon Project', '20.50', '2024-03-18 00:00:00'),
(19, 'Fashion Boutique', 'Eclipse Initiative', '30.00', '2024-03-19 00:00:00'),
(20, 'Bakery Delights', 'Odyssey Taskforce', '40.00', '2024-03-20 00:00:00'),
(21, 'Interior Design', 'Quantum Venture', '50.00', '2024-03-21 00:00:00'),
(22, 'Law Firm', 'Momentum Operation', '60.00', '2024-03-22 00:00:00'),
(23, 'Cleaning Services', 'Zenith Project', '70.00', '2024-03-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `klanten`
--

DROP TABLE IF EXISTS `klanten`;
CREATE TABLE IF NOT EXISTS `klanten` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Bedrijfsnaam` varchar(255) NOT NULL,
  `Project Naam` varchar(250) DEFAULT NULL,
  `Voornaam` varchar(255) NOT NULL,
  `Tussenvoegsel` varchar(255) DEFAULT NULL,
  `Achternaam` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Telefoonnummer` varchar(255) NOT NULL,
  `Adres` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `klanten`
--

INSERT INTO `klanten` (`ID`, `Bedrijfsnaam`, `Project Naam`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Email`, `Telefoonnummer`, `Adres`) VALUES
(1, 'Wonder Construction', NULL, 'John', '', 'Doe', 'john.doe@example.com', '+12345678901', '123 Fake Street'),
(2, 'Blooming Flowers', NULL, 'Jane', '', 'Smith', 'jane.smith@example.com', '+12345678902', '456 Mock Avenue'),
(3, 'Technovation Inc.', NULL, 'Alice', '', 'Johnson', 'alice.johnson@example.com', '+12345678903', '789 Fictitious Road'),
(4, 'Retail Giants', NULL, 'Bob', '', 'Brown', 'bob.brown@example.com', '+12345678904', '321 Bogus Boulevard'),
(5, 'Happy Foods', NULL, 'Emily', '', 'Jones', 'emily.jones@example.com', '+12345678905', '654 Sham Street'),
(6, 'Medical Solutions', NULL, 'Michael', '', 'Wilson', 'michael.wilson@example.com', '+12345678906', '987 Imaginary Lane'),
(7, 'Travel Experts', NULL, 'Sarah', '', 'Martinez', 'sarah.martinez@example.com', '+12345678907', '246 Unreal Avenue'),
(8, 'Coding Crew', NULL, 'David', '', 'Taylor', 'david.taylor@example.com', '+12345678908', '135 Fictional Road'),
(9, 'Creative Agency', NULL, 'Emma', '', 'Anderson', 'emma.anderson@example.com', '+12345678909', '864 Dream Street'),
(10, 'Legal Services', NULL, 'James', '', 'Garcia', 'james.garcia@example.com', '+12345678910', '579 Fantasy Lane'),
(11, 'Pet Paradise', NULL, 'Olivia', '', 'Wilson', 'olivia.wilson@example.com', '+12345678911', '321 Enchanted Boulevard'),
(12, 'Financial Advisors', NULL, 'William', '', 'Hernandez', 'william.hernandez@example.com', '+12345678912', '753 Mythical Street'),
(13, 'Educational Solutions', NULL, 'Sophia', '', 'Lopez', 'sophia.lopez@example.com', '+12345678913', '159 Magic Avenue'),
(14, 'Adventure Tours', NULL, 'Alexander', '', 'King', 'alexander.king@example.com', '+12345678914', '852 Wonderland Lane'),
(15, 'Bookworms Unite', NULL, 'Isabella', '', 'Young', 'isabella.young@example.com', '+12345678915', '753 Fairy Tale Road'),
(16, 'Green Solutions', NULL, 'Ethan', '', 'Scott', 'ethan.scott@example.com', '+12345678916', '468 Mystical Avenue'),
(17, 'Happy Pets', NULL, 'Mia', '', 'Green', 'mia.green@example.com', '+12345678917', '246 Legendary Lane'),
(18, 'Tech Repair', NULL, 'Daniel', '', 'Adams', 'daniel.adams@example.com', '+12345678918', '951 Mythical Street'),
(19, 'Fashion Boutique', NULL, 'Charlotte', '', 'Hill', 'charlotte.hill@example.com', '+12345678919', '357 Magic Road'),
(20, 'Bakery Delights', NULL, 'Aiden', '', 'Baker', 'aiden.baker@example.com', '+12345678920', '864 Fairy Tale Boulevard'),
(21, 'Interior Design', NULL, 'Amelia', '', 'Mitchell', 'amelia.mitchell@example.com', '+12345678921', '579 Enchanted Avenue'),
(22, 'Law Firm', NULL, 'Benjamin', '', 'Carter', 'benjamin.carter@example.com', '+12345678922', '753 Fantasy Road'),
(23, 'Cleaning Services', NULL, 'Avery', '', 'Cook', 'avery.cook@example.com', '+12345678923', '159 Dream Lane');

-- --------------------------------------------------------

--
-- Table structure for table `medewerkers`
--

DROP TABLE IF EXISTS `medewerkers`;
CREATE TABLE IF NOT EXISTS `medewerkers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(255) DEFAULT NULL,
  `Tussenvoegsel` varchar(255) DEFAULT NULL,
  `Achternaam` varchar(255) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `Geboortedatum` date DEFAULT NULL,
  `Functie` varchar(255) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `Werkmail` varchar(255) DEFAULT NULL,
  `Kantoorruimte` varchar(255) DEFAULT NULL,
  `Avatar` varchar(255) DEFAULT NULL,
  `passwd` varchar(30) DEFAULT NULL,
  `Admin` int DEFAULT NULL,
  `skills` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `medewerkers`
--

INSERT INTO `medewerkers` (`ID`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `gender`, `Geboortedatum`, `Functie`, `department`, `Werkmail`, `Kantoorruimte`, `Avatar`, `passwd`, `Admin`, `skills`) VALUES
(101, 'Jan', '', 'de Vries', NULL, '1980-01-01', 'Software Engineer', NULL, 'jan.devries@example.com', 'A123', 'https://randomuser.me/api/portraits/men/1.jpg', '123456', 1, 'Java, C++, C, C#'),
(102, 'Piet', '', 'Jansen', NULL, '1981-02-02', 'Data Scientist', NULL, 'piet.jansen@example.com', 'B456', 'https://randomuser.me/api/portraits/women/2.jpg', '123456', NULL, ''),
(103, 'Klaas', '', 'Bakker', NULL, '1982-03-03', 'Product Manager', NULL, 'klaas.bakker@example.com', 'C789', 'https://randomuser.me/api/portraits/men/3.jpg', '654321', 1, ''),
(104, 'Henk', '', 'Smit', NULL, '1983-04-04', 'Project Manager', NULL, 'henk.smit@example.com', 'D1011', 'https://randomuser.me/api/portraits/women/4.jpg', 'Str0ngP@55!', NULL, ''),
(105, 'Sjaak', '', 'Visser', NULL, '1984-05-05', 'Marketing Manager', NULL, 'sjaak.visser@example.com', 'E1213', 'https://randomuser.me/api/portraits/men/5.jpg', 'Pa$$w0rd!2024', NULL, ''),
(106, 'Rinus', '', 'de Jong', NULL, '1985-06-06', 'Sales Manager', NULL, 'rinus.dejong@example.com', 'F1415', 'https://randomuser.me/api/portraits/women/6.jpg', 'P@ssw0rd2024!', NULL, ''),
(107, 'Willem', '', 'van Dijk', NULL, '1986-07-07', 'Customer Support Manager', NULL, 'willem.vandijk@example.com', 'G1617', 'https://randomuser.me/api/portraits/men/7.jpg', 'S3cur3P@ssw0rd!', NULL, ''),
(108, 'Cornelis', '', 'van der Meer', NULL, '1987-08-08', 'IT Manager', NULL, 'cornelis.vandermeer@example.com', 'H1819', 'https://randomuser.me/api/portraits/women/8.jpg', 'C0mpl3xP@55!', NULL, ''),
(109, 'Theo', '', 'Peters', NULL, '1988-09-09', 'HR Manager', NULL, 'theo.peters@example.com', 'I2021', 'https://randomuser.me/api/portraits/men/9.jpg', 'H@rdP@55w0rd!', NULL, ''),
(110, 'Adriaan', '', 'Boer', NULL, '1989-10-10', 'Finance Manager', NULL, 'adriaan.boer@example.com', 'J2223', 'https://randomuser.me/api/portraits/women/10.jpg', 'P@ssw0rd2024!', NULL, ''),
(111, 'Bart', '', 'Janssen', NULL, '1990-11-11', 'CEO', NULL, 'bart.janssen@example.com', 'K2425', 'https://randomuser.me/api/portraits/men/11.jpg', 'S3cur3P@ss!', NULL, ''),
(112, 'Gert', '', 'Pietersen', NULL, '1991-12-12', 'COO', NULL, 'gert.pietersen@example.com', 'L2627', 'https://randomuser.me/api/portraits/women/12.jpg', 'C0mpl3xP@ss!', NULL, ''),
(113, 'Jan', 'van', 'Dijk', NULL, '1992-01-01', 'Software Engineer', NULL, 'jan.vandijk@example.com', 'M2829', 'https://randomuser.me/api/portraits/men/13.jpg', 'Str0ngP@55w0rd!', NULL, ''),
(114, 'Piet', 'van', 'Velzen', NULL, '1993-02-02', 'Data Scientist', NULL, 'piet.vanvelzen@example.com', 'N3031', 'https://randomuser.me/api/portraits/women/14.jpg', 'P@55w0rd!2024', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `opdrachten`
--

DROP TABLE IF EXISTS `opdrachten`;
CREATE TABLE IF NOT EXISTS `opdrachten` (
  `ID` int NOT NULL,
  `Klantnaam` varchar(255) DEFAULT NULL,
  `Titel` varchar(255) DEFAULT NULL,
  `Omschrijving` text,
  `Aanvraagdatum` date DEFAULT NULL,
  `Benodigde_kennis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projecttijd`
--

DROP TABLE IF EXISTS `projecttijd`;
CREATE TABLE IF NOT EXISTS `projecttijd` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MedewerkerId` int DEFAULT NULL,
  `AantalGewerktUren` decimal(5,2) DEFAULT NULL,
  `Projectnaam` varchar(255) DEFAULT NULL,
  `Omschrijving` varchar(255) DEFAULT NULL,
  `Datum` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `MedewerkerId` (`MedewerkerId`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projecttijd`
--

INSERT INTO `projecttijd` (`ID`, `MedewerkerId`, `AantalGewerktUren`, `Projectnaam`, `Omschrijving`, `Datum`) VALUES
(1, 101, '4.00', 'Lambda Taskforce', 'Work on Lambda Taskforce', '2024-03-23 00:00:00'),
(2, 102, '6.00', 'Lambda Taskforce', 'Work on Lambda Taskforce', '2024-03-24 00:00:00'),
(3, 101, '5.00', 'Lambda Taskforce', 'Work on Lambda Taskforce', '2024-03-25 00:00:00'),
(4, 102, '5.00', 'Lambda Taskforce', 'Work on Lambda Taskforce', '2024-03-26 00:00:00'),
(5, 103, '2.00', 'Lambda Taskforce', 'Work on Lambda Taskforce', '2024-03-27 00:00:00'),
(42, 114, '1.00', 'Theta Operation', 'gedaan', '2024-03-28 12:32:24'),
(41, 102, '4.00', 'Theta Operation', 'jjj', '2024-03-26 14:40:11'),
(8, 103, '3.00', 'Theta Operation', 'Work on Theta Operation', '2024-03-24 00:00:00'),
(9, 104, '5.00', 'Theta Operation', 'Work on Theta Operation', '2024-03-25 00:00:00'),
(10, 105, '5.00', 'Theta Operation', 'Work on Theta Operation', '2024-03-26 00:00:00'),
(11, 105, '3.00', 'Zeta Assignment', 'Work on Zeta Assignment', '2024-03-20 00:00:00'),
(12, 106, '6.00', 'Zeta Assignment', 'Work on Zeta Assignment', '2024-03-21 00:00:00'),
(13, 105, '4.00', 'Zeta Assignment', 'Work on Zeta Assignment', '2024-03-22 00:00:00'),
(14, 106, '3.00', 'Zeta Assignment', 'Work on Zeta Assignment', '2024-03-23 00:00:00'),
(15, 107, '2.00', 'Zeta Assignment', 'Work on Zeta Assignment', '2024-03-24 00:00:00'),
(16, 107, '4.00', 'Epsilon Venture', 'Work on Epsilon Venture', '2024-03-15 00:00:00'),
(17, 108, '3.00', 'Epsilon Venture', 'Work on Epsilon Venture', '2024-03-16 00:00:00'),
(18, 107, '5.00', 'Epsilon Venture', 'Work on Epsilon Venture', '2024-03-17 00:00:00'),
(19, 108, '4.00', 'Epsilon Venture', 'Work on Epsilon Venture', '2024-03-18 00:00:00'),
(20, 109, '4.00', 'Epsilon Venture', 'Work on Epsilon Venture', '2024-03-19 00:00:00'),
(21, 109, '3.00', 'Alpha Project', 'Work on Alpha Project', '2024-03-10 00:00:00'),
(22, 110, '5.00', 'Alpha Project', 'Work on Alpha Project', '2024-03-11 00:00:00'),
(23, 109, '6.00', 'Alpha Project', 'Work on Alpha Project', '2024-03-12 00:00:00'),
(24, 110, '3.00', 'Alpha Project', 'Work on Alpha Project', '2024-03-13 00:00:00'),
(25, 111, '3.00', 'Alpha Project', 'Work on Alpha Project', '2024-03-14 00:00:00'),
(26, 111, '6.00', 'Beta Initiative', 'Work on Beta Initiative', '2024-03-05 00:00:00'),
(27, 112, '4.00', 'Beta Initiative', 'Work on Beta Initiative', '2024-03-06 00:00:00'),
(28, 111, '3.00', 'Beta Initiative', 'Work on Beta Initiative', '2024-03-07 00:00:00'),
(29, 112, '5.00', 'Beta Initiative', 'Work on Beta Initiative', '2024-03-08 00:00:00'),
(30, 113, '2.00', 'Beta Initiative', 'Work on Beta Initiative', '2024-03-09 00:00:00'),
(46, 102, '11.00', 'Iota Project', 'yiy', '2024-04-22 12:36:16'),
(45, 102, '82.00', 'Spectrum Endeavor', 'mmm', '2024-04-04 09:14:10'),
(44, 102, '1.00', 'Catalyst Assignment', 'ht', '2024-04-03 13:15:05'),
(43, 102, '1.00', 'Catalyst Assignment', 'done', '2024-04-03 13:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(250) NOT NULL,
  `user_id` int NOT NULL,
  `expiration_time` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `expiration_time`) VALUES
('6601545c6dfe8', 101, '2024-03-25 15:39:24'),
('66016aec3eeb1', 101, '2024-03-25 17:15:40'),
('66016cfec8eaf', 101, '2024-03-25 17:24:30'),
('66016d10a0f18', 102, '2024-03-25 17:24:48'),
('66016d85879d6', 102, '2024-03-25 17:26:45'),
('660173ff072f8', 102, '2024-03-25 17:54:23'),
('660174452ef5d', 101, '2024-03-25 17:55:33'),
('660174e0296fc', 101, '2024-03-25 17:58:08'),
('66017657d2049', 102, '2024-03-25 18:04:23'),
('6601768ac0111', 102, '2024-03-25 18:05:14'),
('66017727df744', 101, '2024-03-25 18:07:51'),
('66017d51056ed', 102, '2024-03-25 18:34:09'),
('66028992078af', 101, '2024-03-26 13:38:42'),
('6602a2134af94', 101, '2024-03-26 15:23:15'),
('6602a5561de5b', 102, '2024-03-26 15:37:10'),
('6602a598a491a', 101, '2024-03-26 15:38:16'),
('6602a813a5e10', 102, '2024-03-26 15:48:51'),
('6602a83e31775', 102, '2024-03-26 15:49:34'),
('6602b5bddad9c', 101, '2024-03-26 16:47:09'),
('6602bacec1e17', 102, '2024-03-26 17:08:46'),
('6602bae951349', 101, '2024-03-26 17:09:13'),
('6602bb33a5a4a', 101, '2024-03-26 17:10:27'),
('6602be610504d', 101, '2024-03-26 17:24:01'),
('6602c10969904', 101, '2024-03-26 17:35:21'),
('6602cc23ebe49', 102, '2024-03-26 18:22:43'),
('6602cc6be9288', 101, '2024-03-26 18:23:55'),
('6602cc8cc382e', 102, '2024-03-26 18:24:28'),
('6602cca85935a', 101, '2024-03-26 18:24:56'),
('6602cdb512e0e', 101, '2024-03-26 18:29:25'),
('6602d005cb6f3', 102, '2024-03-26 18:39:17'),
('6602d07882800', 101, '2024-03-26 18:41:12'),
('6603fa639fd7b', 101, '2024-03-27 15:52:19'),
('66040e9983c88', 102, '2024-03-27 17:18:33'),
('66041210ae9f3', 101, '2024-03-27 17:33:20'),
('66041830b9818', 102, '2024-03-27 17:59:28'),
('66054914a395b', 101, '2024-03-28 15:40:20'),
('660551d7adc98', 101, '2024-03-28 16:17:43'),
('6605522b6b174', 101, '2024-03-28 16:19:07'),
('6605529e3fb05', 101, '2024-03-28 16:21:02'),
('660d0542c0dd6', 101, '2024-04-03 12:29:06'),
('660d057721719', 102, '2024-04-03 12:29:59'),
('660d080e1c06d', 101, '2024-04-03 12:41:02'),
('660d3a0e42535', 102, '2024-04-03 16:14:22'),
('660e518064cc8', 101, '2024-04-04 12:06:40'),
('660e533225a64', 102, '2024-04-04 12:13:54'),
('660e53509eaef', 101, '2024-04-04 12:14:24'),
('6615171bbff11', 101, '2024-04-09 15:23:23'),
('66263502b567b', 101, '2024-04-22 14:59:30'),
('66263d76e15e3', 102, '2024-04-22 15:35:34'),
('66263db302114', 101, '2024-04-22 15:36:35'),
('66263f1f14575', 101, '2024-04-22 15:42:39'),
('66265c8dd88cd', 101, '2024-04-22 17:48:13'),
('66265d07d8675', 101, '2024-04-22 17:50:15'),
('66265d4364249', 102, '2024-04-22 17:51:15');

-- --------------------------------------------------------

--
-- Table structure for table `timeinformation`
--

DROP TABLE IF EXISTS `timeinformation`;
CREATE TABLE IF NOT EXISTS `timeinformation` (
  `memberId` int DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `absentReason` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `memberId` (`memberId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `timeinformation`
--

INSERT INTO `timeinformation` (`memberId`, `startTime`, `endTime`, `absentReason`, `timestamp`) VALUES
(101, '10:00:00', '13:00:00', NULL, '2024-02-21 10:34:34'),
(102, '08:30:00', '16:30:00', NULL, '2024-02-21 10:34:34'),
(103, NULL, NULL, 'Sick Leave', '2024-02-21 10:34:34'),
(104, '09:30:00', '17:30:00', NULL, '2024-02-21 10:34:34'),
(105, '10:00:00', '18:00:00', NULL, '2024-02-21 10:34:34'),
(106, '08:45:00', '16:45:00', NULL, '2024-02-21 10:34:34'),
(107, '09:15:00', '17:15:00', NULL, '2024-02-21 10:34:34'),
(108, '09:30:00', '18:00:00', NULL, '2024-02-21 10:34:34'),
(109, '08:00:00', '16:30:00', NULL, '2024-02-21 10:34:34'),
(110, NULL, NULL, 'Vacation', '2024-02-21 10:34:34'),
(111, '10:00:00', '18:00:00', NULL, '2024-02-21 10:34:34'),
(112, '09:00:00', '17:00:00', NULL, '2024-02-21 10:34:34'),
(113, '08:30:00', '16:30:00', NULL, '2024-02-21 10:34:34'),
(114, '09:00:00', '17:30:00', NULL, '2024-02-21 10:34:34'),
(115, '09:15:00', '17:15:00', NULL, '2024-02-21 10:34:34'),
(116, '08:45:00', '16:45:00', NULL, '2024-02-21 10:34:34'),
(117, '10:30:00', '18:30:00', NULL, '2024-02-21 10:34:34'),
(118, '08:00:00', '16:30:00', NULL, '2024-02-21 10:34:34'),
(119, '09:00:00', '17:00:00', NULL, '2024-02-21 10:34:34'),
(120, '09:15:00', '17:15:00', NULL, '2024-02-21 10:34:34'),
(121, '10:00:00', '18:00:00', NULL, '2024-02-21 10:34:34'),
(122, NULL, NULL, 'Maternity Leave', '2024-02-21 10:34:34'),
(123, '08:30:00', '16:30:00', NULL, '2024-02-21 10:34:34'),
(124, '09:00:00', '17:00:00', NULL, '2024-02-21 10:34:34'),
(125, '09:15:00', '17:15:00', NULL, '2024-02-21 10:34:34'),
(126, '08:45:00', '16:45:00', NULL, '2024-02-21 10:34:34'),
(127, '08:30:00', '17:00:00', NULL, '2024-02-21 10:34:34'),
(128, '09:00:00', '18:00:00', NULL, '2024-02-21 10:34:34'),
(129, '09:15:00', '17:15:00', NULL, '2024-02-21 10:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `werkzaamheden`
--

DROP TABLE IF EXISTS `werkzaamheden`;
CREATE TABLE IF NOT EXISTS `werkzaamheden` (
  `ID` int NOT NULL,
  `VoornaamMedewerker` varchar(255) DEFAULT NULL,
  `TussenvoegselMedewerker` varchar(255) DEFAULT NULL,
  `AchternaamMedewerker` varchar(255) DEFAULT NULL,
  `Aantal_uren` int DEFAULT NULL,
  `Projectnaam` varchar(255) DEFAULT NULL,
  `Omschrijving_werkzaamheden` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
