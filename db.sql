-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 08, 2021 at 08:00 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `budget`
--
CREATE DATABASE IF NOT EXISTS `budget` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `budget`;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `title`, `note`, `amount`, `date`) VALUES
(22, 'Lunch', 'Hae lunch with Mobile team mate', 2.5, '2021-04-06 00:00:00.000'),
(24, 'Dinner', 'Have dinner with homer', 20, '2021-04-08 23:19:02.246004');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `shopID` int(5) NOT NULL,
  `discount` varchar(10) NOT NULL,
  `discription` varchar(10000) NOT NULL,
  `map` varchar(200) DEFAULT NULL,
  `shopName` varchar(30) NOT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`shopID`, `discount`, `discription`, `map`, `shopName`, `img`) VALUES
(1, '30%', 'The next step is determining the best format for the above information. Since some shoppers only scan text on websites, it’s a good idea to have a list of bullet points that cover the most important product details. Bullet points should generally be used for specs (like dimensions) or short phrases (like features) so that they are quick and easy to read.\r\n\r\nUnfortunately, bullet points aren’t the best way to tell a product’s story and convince shoppers that they’re looking at a great deal. They look cold and clinical on the page instead of engaging the shopper’s emotions or imagination. This is a job for prose! By writing a paragraph (three or more sentences) or two about the product, you can set the scene and help the shopper realize why their life up to this point has been incomplete without it. It may seem daunting, but after some practice, it will become second nature and even (gasp!) fun.The next step is determining the best format for the above information. Since some shoppers only scan text on websites, it’s a good idea to have a list of bullet points that cover the most important product details. Bullet points should generally be used for specs (like dimensions) or short phrases (like features) so that they are quick and easy to read.\r\n\r\nUnfortunately, bullet points aren’t the best way to tell a product’s story and convince shoppers that they’re looking at a great deal. They look cold and clinical on the page instead of engaging the shopper’s emotions or imagination. This is a job for prose! By writing a paragraph (three or more sentences) or two about the product, you can set the scene and help the shopper realize why their life up to this point has been incomplete without it. It may seem daunting, but after some practice, it will become second nature and even (gasp!) fun.The next step is determining the best format for the above information. Since some shoppers only scan text on websites, it’s a good idea to have a list of bullet points that cover the most important product details. Bullet points should generally be used for specs (like dimensions) or short phrases (like features) so that they are quick and easy to read.\r\n\r\nUnfortunately, bullet points aren’t the best way to tell a product’s story and convince shoppers that they’re looking at a great deal. They look cold and clinical on the page instead of engaging the shopper’s emotions or imagination. This is a job for prose! By writing a paragraph (three or more sentences) or two about the product, you can set the scene and help the shopper realize why their life up to this point has been incomplete without it. It may seem daunting, but after some practice, it will become second nature and even (gasp!) fun.', NULL, 'Amazon Cafe', 'https://the-parq.sgp1.cdn.digitaloceanspaces.com/2020/07/TheParq_CafeAmazon.jpg'),
(3, '30%', 'The next step is determining the best format for the above information. Since some shoppers only scan text on websites, it’s a good idea to have a list of bullet points that cover the most important product details. Bullet points should generally be used for specs (like dimensions) or short phrases (like features) so that they are quick and easy to read.\r\n\r\nUnfortunately, bullet points aren’t the best way to tell a product’s story and convince shoppers that they’re looking at a great deal. They look cold and clinical on the page instead of engaging the shopper’s emotions or imagination. This is a job for prose! By writing a paragraph (three or more sentences) or two about the product, you can set the scene and help the shopper realize why their life up to this point has been incomplete without it. It may seem daunting, but after some practice, it will become second nature and even (gasp!) fun.', NULL, 'Tos Rean', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2Ftosrean.cambodia%2Fphotos%2F&psig=AOvVaw2_Y3hxhvLNbBB6SyCBHS43&ust=1617993819086000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNCmiu-m7-8CFQAAAAAdAAAAABAD'),
(4, '10%', 'The next step is determining the best format for the above information. Since some shoppers only scan text on websites, it’s a good idea to have a list of bullet points that cover the most important product details. Bullet points should generally be used for specs (like dimensions) or short phrases (like features) so that they are quick and easy to read.\r\n\r\nUnfortunately, bullet points aren’t the best way to tell a product’s story and convince shoppers that they’re looking at a great deal. They look cold and clinical on the page instead of engaging the shopper’s emotions or imagination. This is a job for prose! By writing a paragraph (three or more sentences) or two about the product, you can set the scene and help the shopper realize why their life up to this point has been incomplete without it. It may seem daunting, but after some practice, it will become second nature and even (gasp!) fun.The next step is determining the best format for the above information. Since some shoppers only scan text on websites, it’s a good idea to have a list of bullet points that cover the most important product details. Bullet points should generally be used for specs (like dimensions) or short phrases (like features) so that they are quick and easy to read.\r\n\r\nUnfortunately, bullet points aren’t the best way to tell a product’s story and convince shoppers that they’re looking at a great deal. They look cold and clinical on the page instead of engaging the shopper’s emotions or imagination. This is a job for prose! By writing a paragraph (three or more sentences) or two about the product, you can set the scene and help the shopper realize why their life up to this point has been incomplete without it. It may seem daunting, but after some practice, it will become second nature and even (gasp!) fun.The next step is determining the best format for the above information. Since some shoppers only scan text on websites, it’s a good idea to have a list of bullet points that cover the most important product details. Bullet points should generally be used for specs (like dimensions) or short phrases (like features) so that they are quick and easy to read.\r\n\r\nUnfortunately, bullet points aren’t the best way to tell a product’s story and convince shoppers that they’re looking at a great deal. They look cold and clinical on the page instead of engaging the shopper’s emotions or imagination. This is a job for prose! By writing a paragraph (three or more sentences) or two about the product, you can set the scene and help the shopper realize why their life up to this point has been incomplete without it. It may seem daunting, but after some practice, it will become second nature and even (gasp!) fun.', NULL, 'Tesla Cambodia', 'https://batteryindustry.tech/wp-content/uploads/2020/09/Tesla2.jpg'),
(6, '10%', 'The next step is determining the best format for the above information. Since some shoppers only scan text on websites, it’s a good idea to have a list of bullet points that cover the most important product details. Bullet points should generally be used for specs (like dimensions) or short phrases (like features) so that they are quick and easy to read.\r\n\r\nUnfortunately, bullet points aren’t the best way to tell a product’s story and convince shoppers that they’re looking at a great deal. They look cold and clinical on the page instead of engaging the shopper’s emotions or imagination. This is a job for prose! By writing a paragraph (three or more sentences) or two about the product, you can set the scene and help the shopper realize why their life up to this point has been incomplete without it. It may seem daunting, but after some practice, it will become second nature and even (gasp!) fun.', NULL, 'Jeep Cambodia', 'https://blog.hamrobazaar.com/wp-content/uploads/2019/12/Jeep-emblem.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `saving`
--

CREATE TABLE `saving` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `saving`
--

INSERT INTO `saving` (`id`, `title`, `note`, `amount`, `date`) VALUES
(1, 'From Dad', 'From Khmer New Yeat Gift', 400, '2021-04-08 22:50:36.887586'),
(2, 'From Mom', 'recieved from red pocket', 200, '2021-04-08 22:35:31.076389'),
(3, 'Updated', 'Just update', 5, '2021-04-08 22:49:31.456262');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`shopID`);

--
-- Indexes for table `saving`
--
ALTER TABLE `saving`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `shopID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `saving`
--
ALTER TABLE `saving`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
