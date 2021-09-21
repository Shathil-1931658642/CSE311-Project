-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2021 at 08:07 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_name` varchar(15) NOT NULL,
  `admin_pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_name`, `admin_pass`) VALUES
('WhalterWhite', 'Jesse');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `ID` int(11) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `business_address` varchar(100) NOT NULL,
  `business_city` varchar(20) NOT NULL,
  `business_type` set('Restaurant','Grocery','Bookstore','Hotel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`ID`, `business_name`, `business_address`, `business_city`, `business_type`) VALUES
(1, 'Abul Khayer Bookstores', 'Tegaon', 'Dhaka', 'Bookstore'),
(2, 'TheBookShelfTB', 'Mirpur', 'Dhaka', 'Bookstore'),
(4, 'PickABook', 'TownHall', 'Chattogram', 'Bookstore'),
(5, 'BellPaper', 'TownHall', 'Chattogram', 'Restaurant'),
(6, 'DoodleFood', 'TownHall', 'Chattogram', 'Restaurant');

-- --------------------------------------------------------

--
-- Table structure for table `business_has_items`
--

CREATE TABLE `business_has_items` (
  `ID` int(11) NOT NULL,
  `best_item` varchar(50) NOT NULL,
  `sold_items` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `i_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `business_has_review`
--

CREATE TABLE `business_has_review` (
  `ID` int(11) NOT NULL,
  `b_ID` int(11) NOT NULL,
  `u_r_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business_has_review`
--

INSERT INTO `business_has_review` (`ID`, `b_ID`, `u_r_ID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ID` int(11) NOT NULL,
  `items_total` int(11) NOT NULL,
  `item_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `ID` int(11) NOT NULL,
  `B_ID` int(11) NOT NULL,
  `u_ID` int(11) NOT NULL,
  `t_type` set('COD','ONLINE') DEFAULT NULL,
  `amount` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `user_pass` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_email` varchar(20) NOT NULL,
  `joining_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_type` enum('Reviewers','Sellers') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_pass`, `user_name`, `user_email`, `joining_date`, `user_type`) VALUES
(1, 'abcd', 'Thomas', 'thomas@gmail.com', '2021-09-13 13:36:41', 'Reviewers'),
(2, 'xyz', 'Jerry', 'jerry@gmail.com', '2021-09-13 13:35:02', 'Reviewers'),
(5, 'jan', 'January', 'January@gamil.com', '2021-09-13 13:59:40', NULL),
(6, 'rishteme', 'Kbc', 'kbc@outlook.com', '2021-09-13 15:46:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_review`
--

CREATE TABLE `user_has_review` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `review` text DEFAULT NULL,
  `likes` tinyint(1) DEFAULT NULL,
  `dislikes` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_has_review`
--

INSERT INTO `user_has_review` (`ID`, `user_ID`, `review`, `likes`, `dislikes`) VALUES
(1, 1, 'This Place is Nice!', 5, 0),
(2, 1, 'Yack!', 0, 1),
(3, 5, 'First Comment!', 1, 0),
(4, 6, 'Need more Products!', 5, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `business_has_items`
--
ALTER TABLE `business_has_items`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `b_id` (`b_id`),
  ADD KEY `i_id` (`i_id`);

--
-- Indexes for table `business_has_review`
--
ALTER TABLE `business_has_review`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `b_ID` (`b_ID`),
  ADD KEY `u_r_ID` (`u_r_ID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `B_ID` (`B_ID`),
  ADD KEY `u_ID` (`u_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_has_review`
--
ALTER TABLE `user_has_review`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `business_has_items`
--
ALTER TABLE `business_has_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_has_review`
--
ALTER TABLE `business_has_review`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `business_has_items`
--
ALTER TABLE `business_has_items`
  ADD CONSTRAINT `business_has_items_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `business` (`ID`),
  ADD CONSTRAINT `business_has_items_ibfk_2` FOREIGN KEY (`i_id`) REFERENCES `items` (`ID`);

--
-- Constraints for table `business_has_review`
--
ALTER TABLE `business_has_review`
  ADD CONSTRAINT `business_has_review_ibfk_1` FOREIGN KEY (`b_ID`) REFERENCES `business` (`ID`),
  ADD CONSTRAINT `business_has_review_ibfk_2` FOREIGN KEY (`u_r_ID`) REFERENCES `user_has_review` (`ID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`B_ID`) REFERENCES `business` (`ID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`u_ID`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user_has_review`
--
ALTER TABLE `user_has_review`
  ADD CONSTRAINT `user_has_review_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
