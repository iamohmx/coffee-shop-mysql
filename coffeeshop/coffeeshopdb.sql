-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2024 at 07:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffeeshopdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `created_at`, `updated_at`) VALUES
(1, 'กาแฟ', '2024-09-25 04:18:29', '2024-09-25 04:18:29'),
(2, 'ลาเต้', '2024-09-25 04:18:29', '2024-09-25 04:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `order_qty` int(11) NOT NULL,
  `order_status` enum('Pending','Processing','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `order_slip` varchar(200) NOT NULL,
  `ordertime` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `pro_price` decimal(6,2) NOT NULL,
  `pro_desc` text NOT NULL,
  `pro_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `cat_id`, `pro_name`, `pro_price`, `pro_desc`, `pro_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'coffee 1', 150.02, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/00.png', '2024-09-25 04:27:21', '2024-09-25 05:05:06'),
(2, 2, 'latte 2', 90.02, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/11.jpg', '2024-09-25 04:27:21', '2024-09-25 05:05:06'),
(3, 2, 'latte 3', 80.02, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/22.jpg', '2024-09-25 04:27:21', '2024-09-25 05:05:06'),
(4, 2, 'latte 4', 150.02, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/33.jpg', '2024-09-25 04:27:21', '2024-09-25 05:05:06'),
(5, 2, 'latte 5', 250.02, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/44.jpg', '2024-09-25 04:27:21', '2024-09-25 05:05:06'),
(6, 1, 'coffee 6', 50.02, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/55.jpg', '2024-09-25 04:27:21', '2024-09-25 05:05:06'),
(7, 2, 'latte 7', 60.02, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/66.jpg', '2024-09-25 04:27:21', '2024-09-25 05:05:06'),
(8, 1, 'coffee 8', 90.02, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/77.jpg', '2024-09-25 04:27:21', '2024-09-25 05:05:06'),
(9, 1, 'coffee 9', 60.02, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/88.jpg', '2024-09-25 04:27:21', '2024-09-25 05:05:06'),
(10, 1, 'coffee 10', 50.00, 'อร่อยชิบหาย ชิบหายแล้วเหลือแต่อร่อย', 'images/99.png', '2024-09-25 04:27:21', '2024-09-25 05:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-09-18 03:31:33', '2024-09-18 03:31:33'),
(2, 'user', '2024-09-18 03:31:33', '2024-09-18 03:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `login_status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `username`, `password`, `firstname`, `lastname`, `login_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'pachara', 'af530b22abcf367ede5d9b0e4eb3541d', 'Pachara', 'Detkhon', 1, '2024-09-18 03:37:29', '2024-09-18 03:37:29'),
(2, 2, 'pattaraporn', 'af530b22abcf367ede5d9b0e4eb3541d', 'Pattaraporn', 'EkSiri', 1, '2024-09-18 03:37:29', '2024-09-18 03:37:29'),
(3, 2, 'test', '81dc9bdb52d04dc20036dbd8313ed055', 'Pachara', 'Detkhon', 1, '2024-10-02 02:37:54', '2024-10-02 02:37:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `pro_cat_fk` (`cat_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_role_fk` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `pro_cat_fk` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_role_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
