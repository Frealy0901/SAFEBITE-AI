-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2026 at 07:01 PM
-- Server version: 12.0.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `risk_level` varchar(10) DEFAULT NULL,
  `risk_score` int(11) DEFAULT NULL,
  `reference_source` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `name`, `risk_level`, `risk_score`, `reference_source`, `notes`) VALUES
(1, 'Chili', 'Low', 1, 'WHO Food Safety Guidelines', 'Natural ingredient commonly safe'),
(2, 'MSG', 'Medium', 2, 'FAO Food Additives Report', 'May cause sensitivity in excessive amounts'),
(3, 'Artificial Coloring', 'High', 3, 'EFSA Food Additive Review', 'Some variants linked to hyperactivity risk'),
(4, 'Cooking Oil', 'Medium', 2, 'WHO Nutrition Report', 'Risk increases if reused multiple times'),
(5, 'Sugar', 'Medium', 2, 'WHO Sugar Intake Guideline', 'High intake linked to obesity and diabetes'),
(6, 'Salt', 'Medium', 2, 'WHO Sodium Intake Guideline', 'Excessive use increases blood pressure'),
(7, 'Preservative Sodium Benzoate', 'Medium', 2, 'EFSA Preservative Assessment', 'Safe within regulated limits'),
(8, 'Aspartame', 'Medium', 2, 'WHO JECFA Evaluation', 'Safe within acceptable daily intake'),
(9, 'Borax', 'High', 3, 'WHO Toxic Substances Report', 'Not approved for food use'),
(10, 'Formalin', 'High', 3, 'WHO Chemical Safety Report', 'Toxic and illegal in food products'),
(11, 'Turmeric', 'Low', 1, 'WHO Herbal Safety Review', 'Natural spice with low risk'),
(12, 'Garlic', 'Low', 1, 'WHO Herbal Safety Review', 'Natural ingredient with health benefits');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`) VALUES
(1, 'Spicy Noodles Level 5'),
(2, 'Sweet Iced Tea'),
(3, 'Apple Juice'),
(4, 'Nasi Rendang'),
(5, 'Fried Chicken Street Style'),
(6, 'Herbal Tea'),
(7, 'Beef Burger'),
(8, 'Cheese Pizza'),
(9, 'Instant Ramen Curry'),
(10, 'Chocolate Milk'),
(11, 'Strawberry Milkshake'),
(12, 'Fried Rice Special'),
(13, 'Grilled Chicken'),
(14, 'Spicy Sausage'),
(15, 'Canned Sardines'),
(16, 'Energy Drink X'),
(17, 'Potato Chips'),
(18, 'Salted Peanuts'),
(19, 'BBQ Chicken Wings'),
(20, 'Vanilla Ice Cream'),
(21, 'Chocolate Donut'),
(22, 'Coconut Water'),
(23, 'Green Tea Bottle'),
(24, 'Cola Drink'),
(25, 'Lemon Tea'),
(26, 'Chicken Nugget'),
(27, 'Hotdog Classic'),
(28, 'Spicy Tofu'),
(29, 'Tempeh Fried'),
(30, 'Bakso Street'),
(31, 'Sate Ayam'),
(32, 'Mie Goreng Pedas'),
(33, 'Iced Coffee Milk'),
(34, 'Caramel Latte'),
(35, 'Banana Smoothie'),
(36, 'Pineapple Juice'),
(37, 'Orange Juice'),
(38, 'Milk Tea Boba'),
(39, 'Spicy Meatball'),
(40, 'Crispy Shrimp'),
(41, 'Seafood Soup'),
(42, 'Beef Steak'),
(43, 'Chicken Katsu'),
(44, 'Tuna Sandwich'),
(45, 'Mayonnaise Salad'),
(46, 'Fried Fish Crispy'),
(47, 'Organic Turmeric Drink'),
(48, 'Garlic Herbal Soup'),
(49, 'Natural Chili Paste'),
(50, 'Traditional Spice Mix'),
(51, 'Healthy Herbal Broth'),
(52, 'Fresh Garlic Juice'),
(53, 'Turmeric Wellness Tea'),
(54, 'Homemade Chili Sauce'),
(55, 'Village Herbal Tonic'),
(56, 'Natural Spice Extract'),
(57, 'Street Meatball Extreme'),
(58, 'Illegal Preserved Noodles'),
(59, 'Toxic Sausage Mix'),
(60, 'Extreme Color Snack'),
(61, 'Black Market Dumpling'),
(62, 'Super Spicy Illegal Soup'),
(63, 'Unknown Street Kebab'),
(64, 'Suspicious Fried Rice'),
(65, 'Overcolored Candy'),
(66, 'Synthetic Meat Pack');

-- --------------------------------------------------------

--
-- Table structure for table `product_ingredients`
--

CREATE TABLE `product_ingredients` (
  `product_id` int(11) DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `product_ingredients`
--

INSERT INTO `product_ingredients` (`product_id`, `ingredient_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(3, 5),
(3, 12),
(4, 4),
(4, 6),
(4, 11),
(4, 2),
(5, 4),
(5, 6),
(5, 3),
(5, 2),
(6, 11),
(6, 12),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(7, 6),
(8, 6),
(9, 6),
(10, 6),
(11, 6),
(12, 6),
(13, 6),
(14, 6),
(15, 6),
(16, 6),
(17, 6),
(18, 6),
(19, 6),
(20, 6),
(21, 6),
(22, 6),
(23, 6),
(24, 6),
(25, 6),
(26, 6),
(27, 6),
(28, 6),
(29, 6),
(30, 6),
(31, 6),
(32, 6),
(33, 6),
(34, 6),
(35, 6),
(36, 6),
(37, 6),
(38, 6),
(39, 6),
(40, 6),
(41, 6),
(42, 6),
(43, 6),
(44, 6),
(45, 6),
(46, 6),
(2, 5),
(3, 5),
(6, 5),
(10, 5),
(11, 5),
(12, 5),
(16, 5),
(20, 5),
(23, 5),
(24, 5),
(25, 5),
(33, 5),
(34, 5),
(36, 5),
(37, 5),
(38, 5),
(42, 5),
(20, 9),
(25, 9),
(30, 9),
(35, 9),
(40, 9),
(22, 10),
(33, 10),
(47, 11),
(47, 12),
(48, 12),
(48, 11),
(49, 1),
(49, 11),
(50, 11),
(50, 1),
(51, 11),
(51, 12),
(52, 12),
(53, 11),
(54, 1),
(55, 11),
(55, 12),
(56, 1),
(56, 11),
(57, 9),
(57, 10),
(57, 2),
(58, 9),
(58, 3),
(58, 4),
(59, 10),
(59, 3),
(59, 2),
(60, 9),
(60, 3),
(61, 10),
(61, 2),
(62, 9),
(62, 10),
(63, 9),
(63, 4),
(64, 10),
(64, 3),
(65, 9),
(65, 3),
(66, 10),
(66, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_ingredients`
--
ALTER TABLE `product_ingredients`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_ingredients`
--
ALTER TABLE `product_ingredients`
  ADD CONSTRAINT `product_ingredients_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
