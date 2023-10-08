-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2023 at 09:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodpenguin`
--

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `food_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `loc_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`loc_id`, `name`) VALUES
(2, 'โรงอาหารA คณะวิศวกรรมศาสตร์'),
(3, 'โรงอาหารพระเทพ ตึกเรียนรวม');

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE `market` (
  `market_id` int(11) NOT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `market`
--

INSERT INTO `market` (`market_id`, `loc_id`, `name`) VALUES
(1, 2, 'ร้านโหวงเฮ้งข้าวมันไก่'),
(2, 2, 'ร้านเจ๊พร รสเด็ด'),
(3, 2, 'ร้านน้ำก๊อตซิล่า'),
(4, 2, 'ร้านฮาลาลฟู้ด'),
(5, 2, 'ร้านก๋วยเตี๋ยวต้องโดน'),
(6, 2, 'ร้าน HEALTI PLUS'),
(7, 2, 'ร้าน A7'),
(8, 2, 'ร้านยูกิ'),
(9, 2, 'ร้านครัวป้าต๊อ'),
(10, 2, 'ร้านโชริ'),
(11, 2, 'ร้านครัวธนโรจน์'),
(12, 2, 'ร้านบุปผา'),
(13, 3, 'ร้านเทคโนฯ อินเตอร์'),
(14, 3, 'ร้านมามา ก๋วยเตี๋ยวเรือ'),
(15, 3, 'ร้านณรงค์ ข้าวมันไก่'),
(16, 3, 'ร้านไอ-เย็น'),
(17, 3, 'ร้านอิดรีส'),
(18, 3, 'ร้านป้าศรี ส้มตำ'),
(19, 3, 'ร้านบิลเลี่ยน');

-- --------------------------------------------------------

--
-- Table structure for table `order_post`
--

CREATE TABLE `order_post` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `market_id` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `process_food`
--

CREATE TABLE `process_food` (
  `food_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `finish` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `process_order`
--

CREATE TABLE `process_order` (
  `order_id` int(11) DEFAULT NULL,
  `recvp_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pay_img` varchar(255) DEFAULT NULL,
  `finish` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `process_order`
--

INSERT INTO `process_order` (`order_id`, `recvp_id`, `status`, `pay_img`, `finish`) VALUES
(3, 8, 5, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAgEASABIAAD/4RSBRXhpZgAATU0AKgAAAAgABwESAAMAAAABAAEAAAEaAAUAAAABAAAAYgEbAAUAAAABAAAAagEoAAMAAAABAAIAAAExAAIAAAAUAAAAcgEyAAIAAAAUAAAAhodpAAQAAAABAAAAnAAAAMgAAABIAAAAAQAAAEgAAAABQWRvYmUgUGhvdG9zaG9wIDcuMAAyMDE3OjA4OjAz', 1),
(4, 9, 4, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4QC8RXhpZgAASUkqAAgAAAAGABIBAwABAAAAAQAAABoBBQABAAAAVgAAABsBBQABAAAAXgAAACgBAwABAAAAAgAAABMCAwABAAAAAQAAAGmHBAABAAAAZgAAAAAAAABIAAAAAQAAAEgAAAABAAAABgAAkAcABAAAADAyMTABkQcABAAAAAECAwAAoAcABAAAADAxMDABoAMA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `receive_loc`
--

CREATE TABLE `receive_loc` (
  `recvp_id` int(11) DEFAULT NULL,
  `market_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receive_loc`
--

INSERT INTO `receive_loc` (`recvp_id`, `market_id`) VALUES
(8, 1),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `receive_post`
--

CREATE TABLE `receive_post` (
  `recvp_id` int(11) NOT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `allowJoin` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `pay_img` varchar(255) DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `firstname`, `lastname`, `nickname`, `pay_img`, `profile_img`) VALUES
(1, 'rider', 'rider', 'rider', 'rider', 'rider', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITExYUFBQXFxYYGiAcGhkYGSEfIhwbHx8hICEcGiAeHikhHx8nHyEeKDIuJiosLy8vHyA1OjUuOSkuLywBCgoKDg0OHBAQGzkmHycsLi8uOSwsMiwuLjAuLi4uLi4sLi4uLi4sLCwuLi4uLiwuLi4uLi4uLC4uLiw5Li4sLv/AABEIAQQAwgMBIgACEQEDEQH/', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/7QCEUGhvdG9zaG9wIDMuMAA4QklNBAQAAAAAAGgcAigAYkZCTUQwYTAwMGE2ZjAxMDAwMDljMDMwMDAwNzUwNjAwMDAwZTA3MDAwMDllMDcwMDAwZjMwOTAwMDBhYzBkMDAwMDNmMGUwMDAwZmEwZTAwMDBiYTBmMDAwMDU5MTYwMDAwAP/bAEMABgQFBgUEBgYFBgcHBggK'),
(2, 'admin', 'admin', 'admin', 'admin', 'admin', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITExYUFBQXFxYYGiAcGhkYGSEfIhwbHx8hICEcGiAeHikhHx8nHyEeKDIuJiosLy8vHyA1OjUuOSkuLywBCgoKDg0OHBAQGzkmHycsLi8uOSwsMiwuLjAuLi4uLi4sLi4uLi4sLCwuLi4uLiwuLi4uLi4uLC4uLiw5Li4sLv/AABEIAQQAwgMBIgACEQEDEQH/', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgr/2wBDAQICAgICAgUDAwUKBwYHCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgr/wAARCAF3AXcDASIAAhEB'),
(3, 'user', 'user', 'user', 'user', 'user', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITExYUFBQXFxYYGiAcGhkYGSEfIhwbHx8hICEcGiAeHikhHx8nHyEeKDIuJiosLy8vHyA1OjUuOSkuLywBCgoKDg0OHBAQGzkmHycsLi8uOSwsMiwuLjAuLi4uLi4sLi4uLi4sLCwuLi4uLiwuLi4uLi4uLC4uLiw5Li4sLv/AABEIAQQAwgMBIgACEQEDEQH/', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`market_id`),
  ADD KEY `loc_id` (`loc_id`);

--
-- Indexes for table `order_post`
--
ALTER TABLE `order_post`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `loc_id` (`loc_id`),
  ADD KEY `market_id` (`market_id`);

--
-- Indexes for table `process_food`
--
ALTER TABLE `process_food`
  ADD PRIMARY KEY (`food_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `process_order`
--
ALTER TABLE `process_order`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `recvp_id` (`recvp_id`);

--
-- Indexes for table `receive_loc`
--
ALTER TABLE `receive_loc`
  ADD KEY `recvp_id` (`recvp_id`),
  ADD KEY `market_id` (`market_id`);

--
-- Indexes for table `receive_post`
--
ALTER TABLE `receive_post`
  ADD PRIMARY KEY (`recvp_id`),
  ADD KEY `loc_id` (`loc_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `market`
--
ALTER TABLE `market`
  MODIFY `market_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_post`
--
ALTER TABLE `order_post`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `receive_post`
--
ALTER TABLE `receive_post`
  MODIFY `recvp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_post` (`order_id`);

--
-- Constraints for table `market`
--
ALTER TABLE `market`
  ADD CONSTRAINT `market_ibfk_1` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`);

--
-- Constraints for table `order_post`
--
ALTER TABLE `order_post`
  ADD CONSTRAINT `order_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `order_post_ibfk_2` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`),
  ADD CONSTRAINT `order_post_ibfk_3` FOREIGN KEY (`market_id`) REFERENCES `market` (`market_id`);

--
-- Constraints for table `process_food`
--
ALTER TABLE `process_food`
  ADD CONSTRAINT `process_food_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_post` (`order_id`);

--
-- Constraints for table `process_order`
--
ALTER TABLE `process_order`
  ADD CONSTRAINT `process_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_post` (`order_id`),
  ADD CONSTRAINT `process_order_ibfk_2` FOREIGN KEY (`recvp_id`) REFERENCES `receive_post` (`recvp_id`);

--
-- Constraints for table `receive_loc`
--
ALTER TABLE `receive_loc`
  ADD CONSTRAINT `receive_loc_ibfk_1` FOREIGN KEY (`recvp_id`) REFERENCES `receive_post` (`recvp_id`),
  ADD CONSTRAINT `receive_loc_ibfk_2` FOREIGN KEY (`market_id`) REFERENCES `market` (`market_id`);

--
-- Constraints for table `receive_post`
--
ALTER TABLE `receive_post`
  ADD CONSTRAINT `receive_post_ibfk_1` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`),
  ADD CONSTRAINT `receive_post_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
