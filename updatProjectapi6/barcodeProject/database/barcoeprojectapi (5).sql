-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 18, 2023 at 12:02 PM
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
-- Database: `barcoeprojectapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `emailAdmid` varchar(50) NOT NULL,
  `passwordAdmid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `Fullname`, `emailAdmid`, `passwordAdmid`) VALUES
(0, 'hh', 'ww@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `createview`
--

DROP TABLE IF EXISTS `createview`;
CREATE TABLE IF NOT EXISTS `createview` (
  `catid` int DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `titlekh` varchar(250) DEFAULT NULL,
  `desciption` longtext,
  `parentid` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('tha1234@gmail.com', '$2y$10$ZvDoK.P/VPzJWE.MZPYhdOXHd08y.qQzsk71A9CSBfgY2x5oLHBt.', '2023-07-21 03:42:50'),
('thonhourn@gmail.com', '$2y$10$6CkwJGqfWlio5lumNHnw.uCb8ddfuyimMI2AvVSYh6qPmJMjeUaPC', '2023-08-15 22:13:46'),
('thonhournoooooo@gmail.com', '$2y$10$Tei5PxajuHOQyGpBA0DGF.XmcwhIogIusCthS6EjJYHIS/ByvAKDe', '2023-07-20 19:05:21');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int NOT NULL,
  `avatar` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

DROP TABLE IF EXISTS `tblcategory`;
CREATE TABLE IF NOT EXISTS `tblcategory` (
  `catid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `titlekh` varchar(250) DEFAULT NULL,
  `desciption` longtext,
  `parentid` int DEFAULT '0',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`catid`, `title`, `titlekh`, `desciption`, `parentid`) VALUES
(1, 'Soft Drink', 'tblproduct', 'tblproduct', 0),
(27, 'Sea Food', 'Sea Food', 'Sea Food', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblpo`
--

DROP TABLE IF EXISTS `tblpo`;
CREATE TABLE IF NOT EXISTS `tblpo` (
  `poid` int NOT NULL AUTO_INCREMENT,
  `pocode` varchar(60) NOT NULL,
  `date` date NOT NULL,
  `dis` int DEFAULT '0',
  `tax` int DEFAULT '0',
  `total` float NOT NULL,
  `grantotal` float NOT NULL,
  PRIMARY KEY (`poid`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tblpo`
--

INSERT INTO `tblpo` (`poid`, `pocode`, `date`, `dis`, `tax`, `total`, `grantotal`) VALUES
(1, 'PO001', '2023-08-01', 0, 0, 100, 0),
(2, 'PO002', '2023-08-02', 0, 0, 200, 0),
(3, 'po111222', '2023-08-10', 89, 89, 72, 0),
(4, 'po12345', '2023-08-10', 49, 49, 330, 0),
(5, 'p.s11233', '2023-08-10', 10, 10, 40, 0),
(30, 'po11332', '2023-08-15', 4, 4, 85, 0),
(7, 'p.s11233', '2023-08-10', 10, 10, 40, 0),
(8, 'p.s11233', '2023-08-10', 10, 10, 40, 0),
(9, 'p.s11233', '2023-08-10', 10, 10, 40, 0),
(10, 'p.s11233', '2023-08-10', 10, 10, 40, 0),
(11, '10007', '2023-08-14', 5, 5, 54, 0),
(12, '10007', '2023-08-14', 5, 5, 54, 0),
(13, '10007', '2023-08-14', 5, 5, 54, 0),
(14, '10007', '2023-08-14', 5, 5, 54, 0),
(15, '10007', '2023-08-14', 5, 5, 54, 0),
(16, '10007', '2023-08-14', 5, 5, 54, 0),
(29, 'p.o1000', '2023-08-31', 8, 8, 79, 0),
(28, 'p.o1000', '2023-08-31', 8, 8, 79, 0),
(27, 'p.o12343', '2023-08-18', 6, 6, 752, 0),
(26, 'p.o12343', '2023-08-18', 6, 6, 752, 0),
(25, 'p.oi11222', '2023-08-08', 5, 5, 49, 0),
(31, 'po11332', '2023-08-15', 4, 4, 85, 0),
(32, 'po.11332324', '2023-08-16', 7, 7, 49, 0),
(33, 'po.11233', '2023-08-02', 778, 8, 49, 0),
(34, 'po.1234', '2023-08-16', 6, 6, 49, 0),
(35, 'po.1234', '2023-08-16', 6, 6, 49, 0),
(36, 'po.1234', '2023-08-16', 6, 6, 49, 0),
(37, 'po.1234', '2023-08-16', 6, 6, 49, 0),
(38, 'po.123545', '2023-08-16', 6, 6, 49, 0),
(39, 'po.123545', '2023-08-16', 6, 6, 49, 0),
(40, '1234', '2023-08-08', 9, 8, 72, 0),
(41, '1234', '2023-08-08', 9, 8, 72, 0),
(42, '1234', '2023-08-08', 9, 8, 72, 0),
(43, '1234', '2023-08-08', 9, 8, 72, 0),
(44, '1234', '2023-08-08', 9, 8, 72, 0),
(45, '1234', '2023-08-08', 9, 8, 72, 0),
(46, '1234', '2023-08-08', 9, 8, 72, 0),
(47, '1234', '2023-08-08', 9, 8, 72, 0),
(48, '1234', '2023-08-08', 9, 8, 72, 0),
(49, '7777', '2023-08-01', 5, 5, 42, 0),
(50, '7777', '2023-08-01', 5, 5, 42, 0),
(51, '7777', '2023-08-01', 5, 5, 42, 0),
(52, '7777', '2023-08-01', 5, 5, 42, 0),
(53, '7777', '2023-08-01', 5, 5, 42, 0),
(54, '7777', '2023-08-01', 5, 5, 42, 0),
(55, 'po12332', '2023-08-08', 4, 4, 784, 0),
(56, 'po12332', '2023-08-08', 4, 4, 784, 0),
(57, 'po12332', '2023-08-08', 4, 4, 784, 0),
(58, 'po12332', '2023-08-08', 4, 4, 784, 0),
(59, 'po12332', '2023-08-08', 4, 4, 784, 0),
(60, 'po12332', '2023-08-08', 4, 4, 784, 0),
(61, 'po12332', '2023-08-08', 4, 4, 784, 0),
(62, 'po12332', '2023-08-08', 4, 4, 784, 0),
(63, 'po12332', '2023-08-08', 4, 4, 784, 0),
(64, 'po12332', '2023-08-08', 4, 4, 784, 0),
(65, 'po12332', '2023-08-08', 4, 4, 784, 0),
(66, 'po12332', '2023-08-08', 4, 4, 784, 0),
(67, 'po12332', '2023-08-08', 4, 4, 784, 0),
(68, 'po12332', '2023-08-08', 4, 4, 784, 0),
(69, 'po12332', '2023-08-08', 4, 4, 784, 0),
(70, 'po12332', '2023-08-08', 4, 4, 784, 0),
(71, 'po12332', '2023-08-08', 4, 4, 784, 0),
(72, 'po12332', '2023-08-08', 4, 4, 784, 0),
(73, 'po12332', '2023-08-08', 4, 4, 784, 0),
(74, 'po12332', '2023-08-08', 4, 4, 784, 0),
(75, 'po12332', '2023-08-08', 4, 4, 784, 0),
(76, 'po12332', '2023-08-08', 4, 4, 784, 0),
(77, 'po12332', '2023-08-08', 4, 4, 784, 0),
(78, 'po12332', '2023-08-08', 4, 4, 784, 0),
(79, 'po12332', '2023-08-08', 4, 4, 784, 0),
(80, 'po123323', '2023-08-17', 5, 5, 35, 0),
(81, 'po123323', '2023-08-17', 5, 5, 35, 0),
(82, 'po123323', '2023-08-17', 5, 5, 35, 0),
(83, 'po123323', '2023-08-17', 5, 5, 35, 0),
(84, 'po123323', '2023-08-17', 5, 5, 35, 0),
(85, 'po123323', '2023-08-17', 5, 5, 35, 0),
(86, 'po123323', '2023-08-17', 5, 5, 35, 0),
(87, 'po123323', '2023-08-17', 5, 5, 35, 0),
(88, 'po123323', '2023-08-17', 5, 5, 35, 0),
(89, 'po123323', '2023-08-17', 5, 5, 35, 0),
(90, 'po123323', '2023-08-17', 5, 5, 35, 0),
(91, 'po123323', '2023-08-17', 5, 5, 35, 0),
(92, 'po123323', '2023-08-17', 5, 5, 35, 0),
(93, 'po123323', '2023-08-17', 5, 5, 35, 0),
(94, 'po123323', '2023-08-17', 5, 5, 35, 0),
(95, 'p.o122', '2023-07-31', 8, 8, 42, 0),
(96, '432432', '2023-08-17', 4, 4, 16, 0),
(97, '1222', '2023-08-08', 2, 7, 36, 0),
(98, '555', '2023-08-08', 5, 5, 25, 0),
(99, '4', '2023-08-08', 6, 6, 24, 0),
(100, '7', '2023-08-15', 7, 7, 49, 0),
(101, '7', '2023-08-15', 7, 7, 49, 0),
(102, '7', '2023-08-15', 7, 7, 49, 0),
(103, '7', '2023-08-15', 7, 7, 49, 0),
(104, '7', '2023-08-15', 7, 7, 49, 0),
(105, '7', '2023-08-15', 7, 7, 49, 0),
(106, '7', '2023-08-15', 7, 7, 49, 0),
(107, '7', '2023-08-15', 7, 7, 49, 0),
(108, '7', '2023-08-15', 7, 7, 49, 0),
(109, '7', '2023-08-15', 7, 7, 49, 0),
(110, '12', '2023-08-03', 4, 4, 64, 0),
(111, '12', '2023-08-03', 4, 4, 64, 0),
(112, '12', '2023-08-03', 4, 4, 64, 0),
(113, '12', '2023-08-03', 4, 4, 64, 0),
(114, '12', '2023-08-03', 4, 4, 64, 0),
(115, '12', '2023-08-03', 4, 4, 64, 0),
(116, '12', '2023-08-03', 4, 4, 64, 0),
(117, '12', '2023-08-03', 4, 4, 64, 0),
(118, '12', '2023-08-03', 4, 4, 64, 0),
(119, '122', '2023-08-08', 6, 3, 36, 0),
(120, '122', '2023-08-08', 6, 3, 36, 0),
(121, '122', '2023-08-08', 6, 3, 36, 0),
(122, '122', '2023-08-08', 6, 3, 36, 0),
(123, '122', '2023-08-08', 6, 3, 36, 0),
(124, '6', '2023-08-15', 6, 6, 30, 0),
(125, '6', '2023-08-15', 6, 6, 30, 0),
(126, '6', '2023-08-15', 6, 6, 30, 0),
(127, '6', '2023-08-15', 6, 6, 30, 0),
(128, '7', '2023-08-15', 7, 7, 49, 0),
(129, '7', '2023-08-15', 7, 7, 49, 0),
(130, '7', '2023-08-15', 7, 7, 49, 0),
(131, '7', '2023-08-15', 7, 7, 49, 0),
(132, '7', '2023-08-15', 7, 7, 49, 0),
(133, 'po1234', '2023-08-10', 4, 4, 25, 28),
(134, 'po12344', '2023-08-17', 9, 8, 801, 736.91);

-- --------------------------------------------------------

--
-- Table structure for table `tblpodetail`
--

DROP TABLE IF EXISTS `tblpodetail`;
CREATE TABLE IF NOT EXISTS `tblpodetail` (
  `pdetail` int NOT NULL AUTO_INCREMENT,
  `poid` int NOT NULL,
  `proid` int NOT NULL,
  `qty` float NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`pdetail`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tblpodetail`
--

INSERT INTO `tblpodetail` (`pdetail`, `poid`, `proid`, `qty`, `cost`) VALUES
(113, 134, 1, 89, 9),
(112, 133, 1, 5, 5),
(111, 132, 2, 7, 7),
(110, 131, 2, 7, 7),
(109, 130, 2, 7, 7),
(108, 129, 2, 7, 7),
(107, 128, 2, 7, 7),
(106, 127, 2, 5, 6),
(105, 126, 2, 5, 6),
(104, 125, 2, 5, 6),
(103, 124, 2, 5, 6),
(102, 123, 2, 6, 6),
(101, 122, 2, 6, 6),
(100, 121, 2, 6, 6),
(99, 120, 2, 6, 6),
(98, 119, 2, 6, 6),
(97, 118, 2, 8, 8),
(96, 117, 2, 8, 8),
(95, 116, 2, 8, 8),
(94, 115, 2, 8, 8),
(93, 114, 2, 8, 8),
(92, 113, 2, 8, 8),
(91, 112, 2, 8, 8),
(90, 111, 2, 8, 8),
(89, 110, 2, 8, 8),
(88, 109, 2, 7, 7),
(87, 108, 2, 7, 7),
(86, 107, 2, 7, 7),
(85, 106, 2, 7, 7),
(84, 105, 2, 7, 7),
(83, 104, 2, 7, 7),
(82, 103, 2, 7, 7),
(81, 102, 2, 7, 7),
(80, 101, 2, 7, 7),
(79, 100, 2, 7, 7),
(78, 99, 2, 6, 4),
(77, 98, 1, 5, 5),
(76, 97, 1, 6, 6),
(75, 96, 1, 4, 4),
(74, 95, 1, 7, 6),
(73, 94, 1, 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

DROP TABLE IF EXISTS `tblproduct`;
CREATE TABLE IF NOT EXISTS `tblproduct` (
  `proid` int NOT NULL AUTO_INCREMENT,
  `barcode` varchar(200) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `qty` int NOT NULL,
  `price` float NOT NULL,
  `categoryid` int NOT NULL,
  PRIMARY KEY (`proid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`proid`, `barcode`, `title`, `qty`, `price`, `categoryid`) VALUES
(2, '1234567', 'ABC', 10, 2, 1),
(3, '12134', 'caco', 4, 5, 0),
(4, '1234567', 'Caco', 6, 7, 0),
(5, '12134', 'book', 4, 4, 0),
(8, '123456', 'caco', 5, 6, 0),
(9, '12134', 'book', 6, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `avatar`) VALUES
(42, 'thon', 'dom1626@gmail.com', NULL, '$2y$10$lxgAUurCVA.zMsp4Ny.nWeZFCrtO0pQiHRfatv0KB6.aTtuzXbtEO', NULL, '2023-07-26 02:11:12', '2023-07-26 05:41:49', '1690375283.jpg'),
(43, 'sokhy', 'thonhourn1626@gmail.com', NULL, '$2y$10$jycsWBqjCgRvMcp45lyyAubf2kORNvLSbxNXFjCeK4Xa5Wa6mp.Ea', NULL, '2023-07-26 20:44:44', '2023-07-27 00:18:28', '1690442308.jfif'),
(45, 'admid43534', 'thonhourn152365@gmail.com', NULL, '$2y$10$NA00M/WFgiioe8XpN.HJROWFYVI1LN15qWcHA1IJEUEG..BNHsQg2', NULL, '2023-07-27 05:50:04', '2023-07-27 05:50:22', '1690462204.jfif'),
(46, 'thon', 'sokhychhea1626@gmail.com', NULL, '$2y$10$71hZjqhJAU6y7p8RkIsypez0PdrTWdvJJM1RLyR32mAURmuHgH2Q6', NULL, '2023-07-27 16:23:58', '2023-07-27 16:24:11', '1690500251.png'),
(51, 'thon', 'thonhourn1555@gmail.com', NULL, '$2y$10$nczRwmR.63CzzlMWPHW6se2gdBXK7EK.Ue2e1mRJ/6Zmo72NtiUa2', NULL, '2023-07-28 16:58:15', '2023-07-28 17:44:28', NULL),
(52, 'sokhy', 'thonhourn5555@gmail.com', NULL, '$2y$10$DCoNSLXgS2G/oU22ZRtKfOQEh9fTSEOYVMBe3Ry/ffhz0YuqP7vaO', NULL, '2023-07-28 22:20:02', '2023-07-28 22:24:13', NULL),
(53, 'thon', 'thonhourn88@gmail.com', NULL, '$2y$10$CHfkwyxwVqwbdW5ebH41AeEaARwE1nZLKF.Dro804SmCZ5OWHhvUi', NULL, '2023-07-28 23:22:50', '2023-07-29 00:48:07', '1690616887.jpg'),
(54, 'thon', 'thonhourn162636@gmail.com', NULL, '$2y$10$aZsMP1rhBYTLHybDBV/Gj.Ve8kaZhnUxWdRbo6nc02CD2pSs0TbEK', NULL, '2023-07-30 16:04:16', '2023-07-30 16:04:16', '1690758256.jpg'),
(55, 'thon', 'thonhourn123456@gmail.com', NULL, '$2y$10$YqFXaSVHnq4ifgsCnJD/dO9MUyvB5X0GX6eqWAEZoaPnr5nEsh.vK', NULL, '2023-07-31 00:42:00', '2023-07-31 00:42:24', NULL),
(56, 'thon', 'sokhychhea162636@gmail.com', NULL, '$2y$10$mHGqqbZjg5HdNdTqhjzZpO5kUCKVf67D4G21Qc0vlnHQLTJHDjE0e', NULL, '2023-07-31 20:17:56', '2023-07-31 20:24:46', '1690860286.jpg'),
(57, 'thon', 'thonhourn31231@gmail.com', NULL, '$2y$10$NoOJfrnGJbLG7OF17oQahOdmLRas5Ay6vpt8rcTm1S2mgsxOYmz8K', NULL, '2023-08-01 22:00:09', '2023-08-01 22:00:09', '1690952409.jpg'),
(58, 'thon', 'thonhourn7777@gmail.com', NULL, '$2y$10$KGhR/NyiuA4H0A7xq3bNGerBOpxOsCYLXDKBtTutZaunbahdG5gMG', NULL, '2023-08-02 16:27:07', '2023-08-02 16:27:07', '1691018827.jpg'),
(59, 'admin', 'thonhourn152522@gmail.com', NULL, '$2y$10$t6uLo4RlCR72QIZ3R2qqne3bLmPCt9WSw.9BPYhc5fzappGKVaaQG', NULL, '2023-08-03 05:36:16', '2023-08-03 05:36:17', '1691066177.jpg'),
(61, 'thon', 'thonhourn6765@gmail.com', NULL, '$2y$10$5Bfrr5GYnTOop1Pv298XWuAANTxa42xw0pD96Dytm8U5CtpCPNggy', NULL, '2023-08-05 02:13:11', '2023-08-05 02:13:11', '1691226791.jpg'),
(62, 'thon', 'thonhourn3333@gmail.com', NULL, '$2y$10$qpG8FoEO9WihLQicb5efH.WH6wk6wbTxi9b2yzmR/6RhAccJkj54y', NULL, '2023-08-08 09:17:23', '2023-08-08 09:17:23', '1691511443.jpg'),
(63, 'Bill', 'thonhourn152533@gmail.com', NULL, '$2y$10$XGvYkS3fATeWXHoZDaDSruKqmPqCrOoX5DrpvQ.6eiLbeptVL04Qa', NULL, '2023-08-08 19:29:49', '2023-08-08 19:29:49', '1691548189.jpg'),
(64, 'thon', 'thonhourn1111@gmail.com', NULL, '$2y$10$xmkyt9qge4t1HRkjQ2.IgOKLab6Vx9GiaZAlN4P1ZJZNIItUmn8mG', NULL, '2023-08-09 01:44:38', '2023-08-09 01:44:38', '1691570678.jpg'),
(65, 'thon', 'thonhourn1222@gmail.com', NULL, '$2y$10$uAgCTpQmRHn2M2aPfbFKGue3OTcvpzx0bdWQU7aIl9zAU8DktBHaS', NULL, '2023-08-09 04:28:41', '2023-08-09 04:28:41', '1691580521.jpg'),
(66, 'admin', 'cheasokhy@gmail.com', NULL, '$2y$10$zGn3Q.suuaFSBD5ngU.cbelLLOkYtUqVRJIEioY4L9JMHJeP0D2PK', NULL, '2023-08-10 01:14:30', '2023-08-10 01:14:30', '1691655270.jpg'),
(67, 'admin', 'tha123456@gmail.com', NULL, '$2y$10$dvpjL9kYYNaWqeM2pBb4me3yfjT2ZOmFkCYD1VQQ9gVnkpokw3uum', NULL, '2023-08-10 05:03:50', '2023-08-10 05:03:50', '1691669030.jpg'),
(68, 'thon', 'thonhourn222@gmail.com', NULL, '$2y$10$6pqDMkbloUd.i5hFhGQrd...qdhZ4rwpNB6J32daWqUAnajR56Qua', NULL, '2023-08-14 02:44:53', '2023-08-14 02:44:53', '1692006293.jfif'),
(69, 'thon', 'sokhychhea188626@gmail.com', NULL, '$2y$10$2nn6KYGKhceHLRoRrnhmzO4q/h68wg8eDa1KoTU02EAfsK948ieP.', NULL, '2023-08-14 05:58:57', '2023-08-14 05:58:57', '1692017937.jfif'),
(70, 'thon', 'thonhournrrrr@gmail.com', NULL, '$2y$10$mnGK16uvOuwgCfFV/MPFOu.StvzkFqGk2nzP2zg61ilD2FnJ6apBC', NULL, '2023-08-14 16:34:36', '2023-08-14 16:34:36', '1692056076.jpg'),
(71, 'thon', 'thonhourn888@gmail.com', NULL, '$2y$10$UbIEt0ety1weMxlHYijICObPXb7/R6zFb3x0PUwFNTn7mrhfD3WVy', NULL, '2023-08-14 21:52:40', '2023-08-14 21:52:40', '1692075160.jpg'),
(72, 'thon', 'thonhourn444@gmail.com', NULL, '$2y$10$YjIO3AZIPI4fCeoM7S.JxOGYjdo7qcQMJYoeKcaC9whJJShWrLa1m', NULL, '2023-08-15 04:48:07', '2023-08-15 04:48:07', '1692100087.jpg'),
(73, 'thon', 'thonhourn4666644@gmail.com', NULL, '$2y$10$SO3X9ze2eykdJfH3ngq.zuojb/hvgaTsgRtYTwfDKdrEzPZzsRSqy', NULL, '2023-08-15 20:47:09', '2023-08-15 20:50:49', '1692157849.jfif'),
(74, 'thon', 'thonhourn8888@gmail.com', NULL, '$2y$10$/Ux26Zx1J781Dtij0BsraOGTGqZmgsMDn.3Kvk.thCPBeLfTqHumO', NULL, '2023-08-15 22:15:21', '2023-08-15 22:15:21', '1692162921.jpg'),
(75, 'dom', 'thonhournoooooo@gmail.com', NULL, '$2y$10$NbmJUb04JtESrbufBOY3zOiZFVwuqpFXmd7b2FkFPIxCjXhdTwes.', 'KkNw4LQ3A6LzO0rToTGwpe6rsRozR9eQzIFZRTSn4ps3sD1Rg1OcdlNH9SVJ', '2023-08-15 22:17:00', '2023-08-15 22:17:00', '1692163020.jpg'),
(76, 'thonlovely', 'thonhourngggggg@gmail.com', NULL, '$2y$10$y.fIeOH9b.vyHZYOgpyLE.IuVIv01IghAVag58AEGCplqr02kV16.', NULL, '2023-08-16 01:36:06', '2023-08-16 01:36:06', '1692174966.png'),
(77, 'thon777', 'thonhourn444rr@gmail.com', NULL, '$2y$10$rr8coNYrfzw0c5LZ/X7aBuAUEbMWdVMx6QUhuqB5bzRs4Lprmd4TG', NULL, '2023-08-16 01:36:56', '2023-08-16 01:36:56', '1692175016.jpg'),
(78, 'thon', 'thonhourn66666@gmail.com', NULL, '$2y$10$68AoCT5RVWpTK/OUuC/pFe/CdHxTViYNo7N631ctE4O88rG3BTrwK', NULL, '2023-08-16 03:13:50', '2023-08-16 03:13:50', '1692180830.png'),
(79, 'dom', 'thonhourn192939@gmail.com', NULL, '$2y$10$nQJC6P1zg8iw//1jiCopyehq6XGfbRbYfuO8.2IWBYXLL0Jgwp3k.', NULL, '2023-08-16 05:15:42', '2023-08-16 05:15:42', '1692188142.png'),
(80, 'thon', 'thonhourn777666667@gmail.com', NULL, '$2y$10$rS8X//4N5c.No21pomYvmOwf9CBXzsqlml2ykIquSlUKkkQjmuOg.', NULL, '2023-08-16 06:04:24', '2023-08-16 06:04:24', '1692191064.png'),
(81, 'thon', 'thonhournwwwww@gmail.com', NULL, '$2y$10$LWIIWRYb2OzlNDDmp4yCouVpOUCi82k4Y72QlU/e1B5AMoCcvBS.u', NULL, '2023-08-16 06:14:52', '2023-08-16 06:14:52', '1692191692.png'),
(82, 'thon', 'thonhourn4444555@gmail.com', NULL, '$2y$10$JJ8UpecvtCg6eczBerVgFe7ev2CGKIYn0FsJKsfqyPwA7PnJkxbTa', NULL, '2023-08-18 04:40:15', '2023-08-18 04:40:15', '1692358815.png');

-- --------------------------------------------------------

--
-- Table structure for table `viewproduct`
--

DROP TABLE IF EXISTS `viewproduct`;
CREATE TABLE IF NOT EXISTS `viewproduct` (
  `proid` int DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `catid` int DEFAULT NULL,
  `cat_title` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
