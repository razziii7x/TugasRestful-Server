-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2020 at 10:47 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gi-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `character`
--

CREATE TABLE `character` (
  `id_char` int(11) NOT NULL,
  `name_char` varchar(20) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `star` int(11) NOT NULL,
  `organization` varchar(50) NOT NULL,
  `origin` varchar(10) NOT NULL,
  `constellation` varchar(50) NOT NULL,
  `element` varchar(20) NOT NULL,
  `weapon` varchar(15) NOT NULL,
  `vo_japanese` varchar(50) NOT NULL,
  `vo_chinese` varchar(50) NOT NULL,
  `vo_english` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `character`
--

INSERT INTO `character` (`id_char`, `name_char`, `gender`, `star`, `organization`, `origin`, `constellation`, `element`, `weapon`, `vo_japanese`, `vo_chinese`, `vo_english`) VALUES
(1, 'Amber', 'Female', 4, 'Knights of Favonius', 'Mondstadt', 'Lepus', 'Pyro / Fire', 'Bow', '石见舞菜香 / Iwami Manaka', '牛奶君 / Niunai Jun', 'Kelly Baskin'),
(2, 'Kamisato Ayaka', 'Female', 5, 'House Kamisato', 'Inazuma', '-', 'Cryo / Ice', 'Sword', '-', '-', '-'),
(3, 'Gunnhildr Barbara', 'Female', 4, 'Church of Favonius', 'Mondstadt', 'Crater', 'Hydro / Water', 'Catalyst', '鬼头明里 / Kitō Akari', '宋媛媛 / Sòng Yuàn Yuàn', 'Laura Stahl'),
(4, 'Beidou', 'Female', 4, 'Crux Fleet', 'Liyue', 'Victor Mare', 'Electro / Lioghting', 'Claymore', '小清水亜美 / Koshimizu Ami', '唐雅菁 / Yajing Tang', 'Allegra Clark'),
(5, 'Benett', 'Male', 4, 'Adventurers\' Guild', 'Mondstadt', 'Rota Calamitas', 'Pyro / Fire', 'Sword', '逢坂良太 / Ōsaka Ryōta', '穆雪婷 / Mu Xueting', 'Cristina Vee Valenzuela');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'Gdb01', 1, 0, 0, NULL, 1),
(2, 2, 'Gdb02', 1, 0, 0, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:api/Character/index:get', 52, 1607369414, 'Gdb01'),
(2, 'uri:api/character/index:get', 71, 1607585291, 'Gdb02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `character`
--
ALTER TABLE `character`
  ADD PRIMARY KEY (`id_char`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `character`
--
ALTER TABLE `character`
  MODIFY `id_char` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
