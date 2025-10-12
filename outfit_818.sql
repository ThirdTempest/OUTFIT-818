-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2025 at 03:32 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `outfit_818`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_424f74a6a7ed4d4ed4761507ebcd209a6ef0937b', 'i:2;', 1752671489),
('laravel_cache_424f74a6a7ed4d4ed4761507ebcd209a6ef0937b:timer', 'i:1752671489;', 1752671489);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carousels`
--

CREATE TABLE `carousels` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `image_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `button_link` varchar(2048) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousels`
--

INSERT INTO `carousels` (`id`, `title`, `description`, `image_path`, `button_text`, `button_link`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Summer Shorts', 'Summer Shorts', 'carousels/bOWJEdNVQotyCEEdbSwQuDmIokKAsFpCjwCV1S2T.jpg', 'Shop Now!!', 'https://www.youtube.com/', 1, '2025-07-10 02:41:45', '2025-07-10 04:13:53'),
(2, 'Summer Shorts', 'Summer Shorts', 'carousels/xSHzrbiSXA6czb95A5yTfVninanERscMDdL5yJFi.jpg', 'Shop Now!!', 'https://www.youtube.com/', 1, '2025-07-10 02:41:54', '2025-07-10 04:13:47'),
(3, 'Summer Shorts', 'Summer Shorts', 'carousels/9dum509zZ9oGXIfkDxMNuhLcHpEPRGIxI0GiT6Bs.jpg', 'Shop Now!!', 'https://www.youtube.com/', 1, '2025-07-10 02:42:05', '2025-07-10 04:13:40'),
(4, 'Pink Hoodie', 'Pinky Hoodie is here!', 'carousels/eDNhpBljm6UjCbHl1pLY0gRFEnQKCxUrf6ZBoAxj.jpg', 'Shop Now!', 'https://www.youtube.com/', 1, '2025-07-11 12:01:01', '2025-07-11 12:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `size` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Men', 'men', 'categories/2eQmFwucA2DiCohvglDwHKS3arV6YmyEBnfBHr8s.jpg', 'active', '2025-07-10 02:36:01', '2025-07-10 02:36:01'),
(2, 'Women', 'women', 'categories/cJVw5TNeuRg6dbNKcJDxywNOpcQesO33ReHDMpYe.jpg', 'active', '2025-07-10 02:36:09', '2025-07-10 02:36:09'),
(3, 'Kids', 'kids', 'categories/jyCdz4ab0KEFc5VPoSKQ8x9XupBLwCNbmzaKYQmT.jpg', 'active', '2025-07-10 02:36:17', '2025-07-10 06:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `featured_products`
--

CREATE TABLE `featured_products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discounted_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `image_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `button_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `featured_products`
--

INSERT INTO `featured_products` (`id`, `title`, `tagline`, `description`, `original_price`, `discounted_price`, `image_path`, `is_active`, `button_text`, `button_link`, `created_at`, `updated_at`) VALUES
(4, 'Summer Shorts', 'Summer Shorts', 'Summer Shorts', 5000.00, 3500.00, 'featured/sbqLksW6sSeqKKjq0t5eJ9jEpFTiQW1ERDCvj8nY.jpg', 1, 'Shop Now!!', 'https://www.youtube.com/', '2025-07-15 14:00:02', '2025-07-15 14:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_07_09_164020_create_sessions_table', 1),
(2, '2025_07_09_164402_create_categories_table', 2),
(3, '2025_07_09_164444_create_products_table', 2),
(4, '2025_07_09_164501_create_carousels_table', 2),
(5, '2025_07_09_164516_create_featured_products_table', 2),
(6, '2025_07_09_164540_create_new_arrivals_table', 2),
(7, '2025_07_11_170823_create_cache_table', 3),
(8, '2025_07_12_125903_create_jobs_table', 4),
(9, '2025_07_15_174721_create_password_reset_tokens_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `new_arrivals`
--

CREATE TABLE `new_arrivals` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `new_arrivals`
--

INSERT INTO `new_arrivals` (`id`, `name`, `description`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Summer Shorts', 'Summer Shorts', 2000.00, 'new_arrivals/XzOdkAIpFnwdxI7N35EjtwPp12zsw0qNkjeXlYbV.jpg', 'active', '2025-07-10 02:33:21', '2025-07-10 02:33:21'),
(2, 'Thunder Hoodie', 'Thunder Hoodie', 5000.00, 'new_arrivals/1teEGicDJwK29SWeWjfRjqDcmHBzHvDG6ikGnVVP.jpg', 'active', '2025-07-10 02:34:42', '2025-07-10 02:34:54'),
(3, 'Thunder Hoodie', 'Thunder Hoodie', 5000.00, 'new_arrivals/goAC91wyiMpPjm0QvezkCN4Tr0CCaxCsvTVMw0EY.jpg', 'active', '2025-07-10 02:35:09', '2025-07-10 02:35:09'),
(4, 'Thunder Hoodie', 'Thunder Hoodie', 2500.00, 'new_arrivals/P7H2zMDXcUUoNJzKTpOZO4xND4TFUjIF0PBiFs1H.jpg', 'active', '2025-07-10 02:35:20', '2025-07-10 02:35:20'),
(5, 'Summer Shorts', 'Summer Shorts', 6000.00, 'new_arrivals/w5GopOEEFECisJg2DA51XpsfRWiUyH9zjVQWfv2i.jpg', 'active', '2025-07-10 02:35:33', '2025-07-15 14:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `zip` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_id`, `total_amount`, `status`, `name`, `email`, `phone`, `city`, `state`, `zip`, `address`, `created_at`, `updated_at`) VALUES
(1, 17, 'ORDER_68734dc59f8ba', 2000.00, 'paid', 'John', 'demo@gmail.com', '9925099250', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-13 00:40:13', '2025-07-13 00:40:45'),
(2, 17, 'ORDER_68734f61210a5', 2000.00, 'paid', 'John', 'demo@gmail.com', '1234567890', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-13 00:47:05', '2025-07-13 00:50:31'),
(3, 17, 'ORDER_687350a5d021d', 4500.00, 'paid', 'John', 'demo@gmail.com', '9925099250', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-13 06:22:29', '2025-07-13 06:22:45'),
(4, 17, 'ORDER_68735d74e7bae', 2000.00, 'paid', 'John', 'jainillathigara18@gmail.com', '9925099250', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-13 07:17:08', '2025-07-13 07:17:25'),
(5, 17, 'ORDER_687366781b43a', 4500.00, 'paid', 'John', 'demo@gmail.com', '9925099250', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-13 07:55:36', '2025-07-13 07:55:54'),
(6, 19, 'ORDER_6877a69abbdc6', 2000.00, 'paid', 'John', 'jainillathigara18@gmail.com', '9925099250', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-16 13:18:18', '2025-07-16 13:18:47'),
(9, 19, 'ORDER_6877bd88eefaa', 7500.00, 'paid', 'John', 'jainillathigara18@gmail.com', '9925099250', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-16 14:56:08', '2025-07-16 14:56:25'),
(10, 19, 'ORDER_6877be0c7fc55', 5500.00, 'paid', 'John', 'jainillathigara18@gmail.com', '9925099250', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-16 14:58:20', '2025-07-16 14:58:34'),
(11, 19, 'ORDER_6878d948a15b9', 5000.00, 'paid', 'John', 'jainillathigara18@gmail.com', '9925099250', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-17 11:06:48', '2025-07-17 11:07:21'),
(12, 19, 'ORDER_6878dd44069d8', 12500.00, 'paid', 'John', 'jainillathigara18@gmail.com', '9925099250', 'Rajkot', 'Gujarat', '360001', 'Hey', '2025-07-17 11:23:48', '2025-07-17 11:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `size`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Summer Shorts', 'M', 1, 2000.00, '2025-07-13 00:40:13', '2025-07-13 00:40:13'),
(2, 2, 1, 'Summer Shorts', 'M', 1, 2000.00, '2025-07-13 00:47:05', '2025-07-13 00:47:05'),
(3, 3, 2, 'Thunder Hoodie', 'M', 1, 4500.00, '2025-07-13 06:22:29', '2025-07-13 06:22:29'),
(4, 4, 1, 'Summer Shorts', 'L', 1, 2000.00, '2025-07-13 07:17:08', '2025-07-13 07:17:08'),
(5, 5, 2, 'Thunder Hoodie', 'M', 1, 4500.00, '2025-07-13 07:55:36', '2025-07-13 07:55:36'),
(6, 6, 1, 'Summer Shorts', 'M', 1, 2000.00, '2025-07-16 13:18:18', '2025-07-16 13:18:18'),
(11, 9, 260, 'Women Hoodie', 'M', 1, 5500.00, '2025-07-16 14:56:08', '2025-07-16 14:56:08'),
(12, 9, 257, 'Women Hoodie', 'M', 1, 2000.00, '2025-07-16 14:56:08', '2025-07-16 14:56:08'),
(13, 10, 260, 'Women Hoodie', 'M', 1, 5500.00, '2025-07-16 14:58:20', '2025-07-16 14:58:20'),
(14, 11, 1021, 'LightSlateGray Jacket Student', 'M', 2, 2500.00, '2025-07-17 11:06:48', '2025-07-17 11:06:48'),
(15, 12, 1021, 'LightSlateGray Jacket Student', 'M', 5, 2500.00, '2025-07-17 11:23:48', '2025-07-17 11:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image_2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_3` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_4` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `description`, `image`, `image_2`, `image_3`, `image_4`, `status`, `created_at`, `updated_at`) VALUES
(1019, 'Summer Shorts', 1, 'Enjoy the summer with these shorts', 'products/VKsVRvCW5OdNpDNZRc16k3WpaFrFG5FfE2AF5j6X.jpg', 'products/NULL', 'products/NULL', 'products/NULL', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1020, 'Thunder Hoodie', 2, 'Amazing Product. Thunder Product for real.', 'products/hIPAnkoU3CTFclfUUdlkq9DiF7NX3NR3i2xbu8HR.jpg', 'products/ulP1mhx5qXh88wHcMzNdANnVz1ogl1W2BBh6gOUx.jpg', 'products/NULL', 'products/NULL', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1021, 'LightSlateGray Jacket Student', 1, 'Interesting recently about Democrat fill study. Policy today recently north choose.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1022, 'Wheat Hoodie As', 2, 'Team lawyer say information each ready class.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1023, 'Gold Shirt Material', 3, 'Onto since Mr degree truth science. Pm research open world. Along scientist democratic wife including local. Sister born where huge something.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1024, 'DarkSlateBlue T-Shirt Respond', 1, 'Police offer its person worker issue finish. Rate eat model tonight pull.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1025, 'Chartreuse Blazer Adult', 2, 'Skill compare phone only opportunity full. Compare white against between take play. Sit page news small station.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1026, 'MediumAquaMarine T-Shirt Name', 3, 'Receive whatever here establish health fire medical entire. Place face think bit spend project.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1027, 'Black Blazer Red', 1, 'Sound old trial each already. Anything consumer argue save door.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1028, 'RoyalBlue Jacket Star', 2, 'Practice Mrs lead fine try light. Actually history begin eight truth. Five several forget table go three.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1029, 'Khaki Sweater Owner', 3, 'Hard then dream grow me most hear sense. Learn simply direction risk.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1030, 'HotPink Dresse Upon', 1, 'Deal carry happen line money prevent TV.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1031, 'Fuchsia Sweater We', 2, 'Current wind yard couple within suggest it condition. People sure here once know who than future. Factor hear dream according.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1032, 'White Hoodie Campaign', 3, 'Bar hair knowledge baby family management. Worry evidence quality throughout now music.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1033, 'NavajoWhite Sweater Strong', 1, 'Data somebody test lay hospital try. Too know modern paper agree store than. Itself song year arm race start owner.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1034, 'Cornsilk Sweater Source', 2, 'Page outside member. Lead throughout either. Last might pattern.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1035, 'DarkTurquoise Dresse Visit', 3, 'Need catch painting hotel discussion owner. Test east thing job hope. Within black ten they likely no.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1036, 'Snow T-Shirt Force', 1, 'Now try us myself store only.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1037, 'DarkOrchid Shirt Debate', 2, 'Safe each politics can evidence huge machine. Good respond total. Trade measure fill bag. Enjoy theory yet opportunity what surface.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1038, 'LemonChiffon T-Shirt Deep', 3, 'Religious teach outside stand final. Resource crime full dream less where number reduce. Tough black act red.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1039, 'Cyan Jean Yourself', 1, 'Effect when foreign rule rate risk. Stuff worker item more agency first now.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1040, 'MediumSpringGreen Short Ball', 2, 'Animal fine after final term allow. Movement Republican measure onto. Could none Mr prepare organization man interesting. Peace example region however.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1041, 'PaleVioletRed Blazer Son', 3, 'Million region subject effect pull much. Cell strategy reflect child.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1042, 'SaddleBrown Sweater Put', 1, 'Less before collection message. Become people debate help. For study trade data several together idea.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1043, 'SteelBlue Dresse Camera', 2, 'Discuss Mrs bit officer pattern respond. Any couple weight sit. Bed impact discuss use though order.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1044, 'DarkGreen T-Shirt Positive', 3, 'Fly join present. Skill police other.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1045, 'DarkSalmon Dresse Into', 1, 'South ground change leg. Open baby south these.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1046, 'Chartreuse Dresse Feel', 2, 'Ability speak blue have agent. Way week by system. Body you study something management Congress during.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1047, 'DarkSlateBlue Dresse Soon', 3, 'Bag eat number remain.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1048, 'DarkMagenta Dresse Attack', 1, 'Worker good avoid itself.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1049, 'Gainsboro Skirt Next', 2, 'Recently ever goal. Position skin war college. Here run forward mean reason business as. Degree article tree teach.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1050, 'Turquoise Skirt Language', 3, 'As total position once prepare air. Employee relate step this process.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1051, 'Thistle Short Provide', 1, 'To here political finish air. House man parent matter much often game.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1052, 'DarkTurquoise Jean Week', 2, 'Top can describe about whom best present. In only character type rule cell technology.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1053, 'DarkGreen Skirt Fly', 3, 'Long happen sometimes past medical. Third alone not court majority camera born.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1054, 'Coral Blazer Dinner', 1, 'Like our still item other significant production blue.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1055, 'PaleGreen Jean Station', 2, 'Kind shake notice stock. Friend happen write move. Those from kid great policy pretty capital traditional. White hospital follow parent whole chair choice.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1056, 'HoneyDew T-Shirt Citizen', 3, 'To both much dinner effect him. Rich expect plan laugh. Tax where position provide arm behavior meet.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1057, 'YellowGreen Blazer Land', 1, 'Perform sometimes argue. What majority thousand really. Deal between what herself agreement.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1058, 'DarkOliveGreen Skirt Political', 2, 'Research article relationship generation thought. Bring keep born goal return thank herself.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1059, 'PaleVioletRed Jacket National', 3, 'Mrs still fast. Approach fast example good relationship beyond recent your. Rather summer those performance adult.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1060, 'DarkOliveGreen T-Shirt Performance', 1, 'Go computer movie two. Amount black program you finally.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1061, 'YellowGreen T-Shirt Plant', 2, 'Professor total peace for commercial character. Ten edge city wide cause can student.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1062, 'LightCoral T-Shirt Stuff', 3, 'Five under provide. Issue half TV happen look hope. Source inside thank call successful office official. Citizen short consumer job in save.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1063, 'MediumOrchid Jacket Soldier', 1, 'Already especially hundred. Start use condition. Stand pattern dark small institution.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1064, 'Moccasin Shirt Step', 2, 'Born continue trip former hair. When minute security shoulder speech information year prevent.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1065, 'GoldenRod Short Trip', 3, 'Also my adult us chair. Doctor good long newspaper. Attack require book street charge practice.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1066, 'Lime T-Shirt Particular', 1, 'Admit industry family reveal human. Growth thank even produce easy. Occur theory worry so.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1067, 'PaleGreen Hoodie Let', 2, 'Suffer past base himself society shoulder. Church state prevent phone. Section forget economic there receive level.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1068, 'DarkSlateBlue Hoodie And', 3, 'Example brother time us agreement enjoy. Job talk pull story star drive behavior. Situation teacher difference amount paper.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1069, 'Green Shirt All', 1, 'Movie college beautiful situation meeting particularly teacher carry. Deal road call before share five race property. Need from possible TV reason someone nearly everyone.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1070, 'SaddleBrown Jacket Whatever', 2, 'Add someone nation field serious. Remain generation customer air can manager. Radio successful growth seven beat lose. Despite lead language two point receive agreement.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1071, 'SandyBrown Jacket Including', 3, 'Sea radio above reduce catch present back forget. Fact new during body.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1072, 'Orchid Jean Prevent', 1, 'Sign quality yes artist month. Also lose middle thousand. Remain question tough enjoy thing middle.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1073, 'DarkGoldenRod Hoodie Hot', 2, 'Investment technology create language yard shoulder expert movement.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1074, 'PaleVioletRed Jacket Bad', 3, 'Program pay policy especially woman represent result. Peace painting wait near act.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1075, 'Coral Jacket Must', 1, 'Position cold hundred style. About agree class ground.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1076, 'DarkGoldenRod Short Price', 2, 'Thought race less ten role. Happen middle thank article near.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1077, 'Red Skirt Agree', 3, 'End human establish charge. Suddenly past play trial think. Add family budget short leader lay green. Water dog will career.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1078, 'Cornsilk Sweater Per', 1, 'Toward science million cause. Enough generation discover environment order.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1079, 'MediumSpringGreen T-Shirt Interview', 2, 'Under special open worker information as explain. Full attention minute again.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1080, 'OliveDrab Short Foot', 3, 'Group however career style. Address edge reason stop day. Allow loss lay song.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1081, 'White Blazer Seven', 1, 'Worker go relationship boy third. Physical continue return believe. Third piece interesting this imagine large.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1082, 'SkyBlue Short Relate', 2, 'Instead challenge protect since sign ask business. Structure gas current region property yourself.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1083, 'Navy Hoodie Billion', 3, 'Majority service other. Almost open month entire. Ability stage nature court total develop several research.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1084, 'DarkGreen Skirt Themselves', 1, 'Question operation building feeling she. Them after employee share really once institution media.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1085, 'Pink Blazer Stock', 2, 'Major lead great. Address five plant player step member. Decide her a lose throw over.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1086, 'Salmon Dresse Star', 3, 'End accept then customer hundred. Bag tell through audience. Plant fast follow officer hair.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1087, 'DarkRed Jacket Painting', 1, 'Prevent more which adult build. Late human even. Billion blue discussion them.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1088, 'White T-Shirt Follow', 2, 'Information media child myself play wall win. When concern clearly cultural cut must. Effect section visit.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1089, 'MediumBlue Short Court', 3, 'Call movie quickly number around. Book style set black hold. My large tree.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1090, 'Yellow Jean Dog', 1, 'Hospital skill successful art those office too. Capital stage actually west.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1091, 'Indigo Dresse Herself', 2, 'Country total policy attorney itself unit. Strong realize high computer.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1092, 'LightSkyBlue Jacket Church', 3, 'Commercial difficult time appear lot free. Only see carry threat toward civil. Task sing thus group others statement.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1093, 'DarkTurquoise Sweater Pm', 1, 'Represent history special billion term. Figure wait conference center once thought tend.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1094, 'BurlyWood Dresse Dream', 2, 'Newspaper change against participant sound. Modern pass pull.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1095, 'DeepPink Shirt Help', 3, 'It opportunity feeling dog feel happy dream a. Ever us house fight nor table. Culture store experience class scientist wall help.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1096, 'MediumSlateBlue Shirt Son', 1, 'Organization someone analysis second system listen. Once money than thus glass. Miss analysis his talk get magazine institution.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1097, 'Magenta Hoodie Type', 2, 'Brother add church case tonight.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1098, 'SeaGreen Dresse Future', 3, 'Fine key role really something rate. Brother medical these whom. Truth world challenge range against accept.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1099, 'FloralWhite Dresse Management', 1, 'Common one too force focus world bit. Paper education reflect source girl same medical. Worry sit fact pattern through your.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1100, 'SandyBrown Jean There', 2, 'Break show yeah sister. Player consumer car land wide alone red every. Pattern design reduce.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1101, 'DarkOrange T-Shirt Task', 3, 'Let it oil reflect. Pick trip many summer fast score then.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1102, 'MintCream Jacket Minute', 1, 'Middle perhaps wonder six. Keep environment recently use character. Only hundred effort through within.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1103, 'Gray Jacket Growth', 2, 'Organization security plant here audience. Quality situation manager important phone. Church born never most seem.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1104, 'AliceBlue Jacket Real', 3, 'Security leg Mr chance. Relationship event agency reveal themselves maybe. Again star attorney face. Event involve two person.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1105, 'Yellow Sweater Eye', 1, 'Reveal college behavior win big college part. Realize rock baby because. Here simply hand learn amount either reveal.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1106, 'RosyBrown Jean Knowledge', 2, 'Somebody a language after.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1107, 'Orchid Blazer Strategy', 3, 'Read start attention feeling fast middle. Write pass but song. Experience type in some line score hand. Analysis help you visit.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1108, 'RoyalBlue Sweater Institution', 1, 'These newspaper how tree yes kitchen. Detail bill nor tree physical produce. Offer one shoulder personal mean end.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1109, 'MediumSpringGreen Hoodie House', 2, 'Drop arrive note PM. Surface peace store group table despite.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1110, 'MediumAquaMarine Dresse Something', 3, 'Case exist expect president six use nor. Interest final value. Raise week goal different. Staff move involve hair space director.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1111, 'Cornsilk Short Market', 1, 'At part those possible design. Rule ago ahead. Garden business green possible environmental marriage partner serve.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1112, 'DarkOliveGreen Shirt Follow', 2, 'Network method improve impact. Discover individual leader six laugh word big.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1113, 'Peru Jacket Listen', 3, 'This sure heavy five. Evidence mouth apply reach thousand state attorney foot. Physical person involve special bring.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1114, 'PaleVioletRed Dresse Buy', 1, 'Instead old must base. Suggest truth easy human oil particularly play. Suddenly those town fear. Organization Mr president whose draw.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1115, 'LightGoldenRodYellow Shirt Hospital', 2, 'However authority fear civil surface yet career. Size professor may million candidate class.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1116, 'Fuchsia Skirt Ground', 3, 'Improve what movement until improve. Get former almost fact toward.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1117, 'Indigo Skirt Maybe', 1, 'International behavior development difficult memory focus take doctor. Part red total around almost sit. After challenge myself read professor.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1118, 'FireBrick Sweater Back', 2, 'Ball piece may. Space push table require child likely stop.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1119, 'LightSalmon Short Quite', 3, 'Evening section song politics start. Themselves soldier approach.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1120, 'MediumBlue Shirt American', 1, 'Smile response political themselves. Old seek any rate choice. Just consider rate other today behind matter.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1121, 'Indigo Jean True', 2, 'Concern partner capital production. Politics brother four early. Author want store action.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1122, 'DarkKhaki Short Bed', 3, 'Right nation three walk social hit information. Work computer tree material anyone official fly show.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1123, 'DarkSalmon Shirt Imagine', 1, 'Machine visit consumer discussion people good bit. Better section center truth town.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1124, 'SteelBlue Short American', 2, 'Above space compare by. Hospital about both single often. Better bad appear rate.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1125, 'YellowGreen Blazer Before', 3, 'Something whom health clearly manager recently almost. None modern each no.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1126, 'Pink T-Shirt Scientist', 1, 'Page result beautiful treatment prevent society. Think brother item owner gun become. Necessary like pull form. Baby probably key say major oil.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1127, 'Azure Shirt North', 2, 'Economic role husband. Student unit base chair.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1128, 'RoyalBlue Jacket Win', 3, 'Style age daughter movement travel mention indeed. Believe stock practice value rather top.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1129, 'Violet Sweater Would', 1, 'Full central executive often evidence industry chance. For trip response plant arm. Inside appear off season no standard subject.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1130, 'MediumSpringGreen Shirt Indicate', 2, 'Begin economic food probably she clear. International those floor about nature. Politics race power natural wish answer whose. Generation worry return live.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1131, 'Moccasin Dresse Eat', 3, 'Join believe similar party everyone. Leader wind behavior girl among.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1132, 'GreenYellow Short Forget', 1, 'Society tree star usually use serve either ground. Understand history space large risk car.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1133, 'DimGray Blazer Through', 2, 'Meeting environment decision teacher piece.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1134, 'Khaki Jacket Brother', 3, 'Financial physical scene power skill concern. Name continue quickly offer picture market.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1135, 'RoyalBlue Hoodie Cultural', 1, 'National land as company door. Various boy open you within purpose material sound. Early identify financial each would bag.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1136, 'LightCoral Short Senior', 2, 'Box yourself class attention. Discover either attack color glass before.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1137, 'Green Jean Probably', 3, 'Human stay upon save behind. Model major store way common. According others family shake seek.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1138, 'FireBrick T-Shirt Who', 1, 'Future need strong. Public bill oil wrong although nice executive. Cause television sport find.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1139, 'LightPink Blazer Student', 2, 'Section fly fly our itself somebody summer. Strong film end billion parent hope stock attack.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1140, 'DeepSkyBlue Blazer Song', 3, 'Step give half politics. Specific live sell various could newspaper.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1141, 'DeepSkyBlue Blazer House', 1, 'Stuff speech state smile imagine. Show read opportunity continue. Serve mind gas leave attorney.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1142, 'YellowGreen Jacket Expert', 2, 'Home act my. Attack while hair president meet community. Candidate situation official guess.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1143, 'WhiteSmoke Blazer Field', 3, 'Be difference personal brother bad sign a marriage. Stuff tax result including.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1144, 'CadetBlue Sweater Visit', 1, 'Manager require media most. Benefit anything situation quite word order food. Sense force individual always medical size.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1145, 'LawnGreen Blazer See', 2, 'Understand live image. However art source success top place. Cultural future for.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1146, 'DimGray Skirt Someone', 3, 'Fire statement it attorney computer because shoulder. Effort shake heavy southern.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1147, 'DarkViolet Shirt Happy', 1, 'Movie memory admit into. Entire theory than. Generation traditional almost write form own.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1148, 'Purple Hoodie Standard', 2, 'Door future cold rather director black money. Food radio quickly above box hour direction. View discussion discuss our every sound.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1149, 'DarkGreen Shirt Thus', 3, 'Necessary evening skin side card color quality. Simple begin special almost law. Which young their red physical key report.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1150, 'PaleTurquoise Skirt None', 1, 'Trial state popular baby south culture. Billion able all investment. Discussion benefit popular cost.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1151, 'DarkOrange Skirt Represent', 2, 'I artist since though. Whole buy since after. Head worker hit board. Themselves may evidence two four ok specific.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1152, 'LightYellow T-Shirt Camera', 3, 'Level soon stop father push campaign. Strong represent fight fight several particularly. Store discover fact radio have view.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1153, 'DarkSlateGray Sweater Commercial', 1, 'Create buy how bad fact drive. Democrat design campaign amount election hospital performance suggest. Remain your fall box short way word.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1154, 'SandyBrown Hoodie Inside', 2, 'Similar base our level last degree. His major court leader person tough. Because including world.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1155, 'DarkMagenta Dresse Time', 3, 'Garden save radio Republican mention I candidate. Your magazine ago more television.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1156, 'MediumSpringGreen Hoodie Democrat', 1, 'Realize then next truth thus town.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1157, 'LightPink Short Hard', 2, 'Night single director their international report. Up simple major pay their through.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1158, 'Azure Blazer Real', 3, 'His general memory life size team that. Close pattern it own in appear may. Difference particular girl manage for.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1159, 'FireBrick Jean Expect', 1, 'Affect figure beat people decide soldier. Source natural area push.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1160, 'DarkSeaGreen Skirt Although', 2, 'Bad be but south during catch event. Recognize enough talk edge director least always. Model us at artist lawyer deep.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1161, 'LightSteelBlue Dresse Any', 3, 'Also year thus discuss. Station account take. Wish inside receive usually stage contain out.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1162, 'Snow Short Upon', 1, 'But brother husband election dog stuff. Entire we four design concern.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1163, 'CadetBlue Skirt Political', 2, 'Evidence wall site mouth hope include. Discuss still child interesting figure owner seat force. Candidate oil should us open.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1164, 'DarkCyan Skirt Make', 3, 'I training listen born simple chair. Newspaper minute billion.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1165, 'MediumSlateBlue Sweater Young', 1, 'Want get foot hand magazine.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1166, 'SteelBlue Blazer Focus', 2, 'Understand man staff among however anything. Amount recognize rich magazine. If form realize technology tonight help music.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1167, 'AntiqueWhite Skirt Analysis', 3, 'Range this compare TV. Others increase customer our reveal.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1168, 'LightGray Jacket Pattern', 1, 'Seem occur language power article right. Develop leg believe back television.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1169, 'RosyBrown Shirt Allow', 2, 'Role sound perhaps could lawyer. Painting happy offer PM off glass. Thought share treatment. Teach more moment agent.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1170, 'Ivory Hoodie East', 3, 'Sing laugh nice two firm race may. Newspaper there best treat word.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1171, 'SpringGreen Hoodie Chance', 1, 'Save scene adult light after. Summer conference base write line into win. Behavior ability represent hundred keep. Animal resource him story whom fish.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1172, 'Maroon T-Shirt Dark', 2, 'Significant nothing season whom western face stop. Past change even cut tough evidence either. Represent shoulder always discover teacher miss talk.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1173, 'Fuchsia Sweater First', 3, 'Experience market side open. Turn until believe attorney carry law.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1174, 'Sienna Jacket Get', 1, 'Agree offer she hair Congress. Election others specific police. Minute leave fire bring social life.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1175, 'Coral Skirt Official', 2, 'Buy drug authority minute often drive. With several recent situation able floor firm.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1176, 'GreenYellow Jean Decision', 3, 'Course writer news book president environmental compare treat. Four interesting how and. Size best chance.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1177, 'DarkOrchid Blazer Everything', 1, 'Soon real security north. Health collection eat offer from whole morning. Wear former modern edge six huge. Majority here doctor value care spring front.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1178, 'Khaki Jacket Edge', 2, 'Of report your write nothing. Rule say state wonder or hold conference. Carry woman dinner world. Smile speech seven hundred hair feeling begin part.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1179, 'MediumAquaMarine Blazer New', 3, 'Stop serious seem work outside value drop. Adult throughout every front report season economy. Try join exist hundred fight.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1180, 'SteelBlue Short Turn', 1, 'Sport score ready fight these town. Pretty main enter attention law Mr.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1181, 'Olive Hoodie Administration', 2, 'Sport administration specific family bad parent.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1182, 'SteelBlue Sweater Animal', 3, 'Difference down song raise start national. Capital later popular piece church door within.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1183, 'DarkSlateBlue Dresse East', 1, 'Behind task relate city carry. Popular east staff real government. Bed together have. Join after girl sport speak.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1184, 'Chocolate Blazer Forward', 2, 'Special wear process two could standard among. Follow window window these.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1185, 'FireBrick Short Chair', 3, 'Upon seek figure describe exactly before effect parent.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1186, 'HotPink Hoodie Behavior', 1, 'Third war fine near that training seat. Goal stay executive rate physical class rest. Occur message serve military.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1187, 'Plum Skirt Push', 2, 'Ask perform artist red.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51');
INSERT INTO `products` (`id`, `name`, `category_id`, `description`, `image`, `image_2`, `image_3`, `image_4`, `status`, `created_at`, `updated_at`) VALUES
(1188, 'Wheat Jacket Natural', 3, 'Glass brother natural modern hope. Data they professional worker three either. Study you take.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1189, 'CadetBlue Jean Discussion', 1, 'Game billion plan pattern card able. Director store require remember fish government carry. Different somebody ask book bad.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1190, 'LightSkyBlue Sweater Pull', 2, 'Trial hold century family. Under maintain senior return instead on sister. Cold service wear. Effort ahead debate reveal.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1191, 'DarkSeaGreen T-Shirt Each', 3, 'Up chair conference me red sing meet. Happen total baby least deep produce grow nearly.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1192, 'PaleGoldenRod Blazer Discover', 1, 'Economy she once lay speech glass its successful. Decision action could other have school. Thus want leader start Congress through significant.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1193, 'Pink Hoodie Force', 2, 'Form civil wind. Newspaper present certain evening price feeling mission nearly.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1194, 'Silver Jacket Social', 3, 'Detail key finish none. Wife officer alone between.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1195, 'Tan Blazer Explain', 1, 'Subject strong chair play drop home. Treat end attorney range friend public future. Foreign show question according own join financial small.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1196, 'DarkSlateGray Short History', 2, 'Address return event my tonight apply baby. Trouble bit keep something. Friend because environmental less beyond idea.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1197, 'DarkGreen Dresse Effort', 3, 'Name music already this also continue. Drug should energy speech fly. Information energy month bit tell anyone place. Building late herself stage nature whose down.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1198, 'DarkMagenta Hoodie Citizen', 1, 'Adult hair apply market answer commercial picture edge. Computer nature unit close already. Herself move rise financial argue wife job success.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1199, 'Salmon Hoodie Treat', 2, 'Build clearly nor treat animal newspaper. Seven brother black. Phone certainly address from clearly. West east still.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1200, 'MidnightBlue Short Huge', 3, 'Day participant upon beyond think. Painting he however say.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1201, 'Bisque Jean Blood', 1, 'Wind leg list send five play message assume. Off big administration bag so want. Plan charge expert include after very.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1202, 'BlueViolet Skirt Become', 2, 'Old stock almost color. Increase long area walk magazine piece who short. Term your yard skin.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1203, 'Crimson Jean Might', 3, 'Local boy structure single both those half. Type evening land themselves he walk. Still movement education right born.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1204, 'ForestGreen Jacket But', 1, 'Wide campaign action poor. Energy parent raise citizen yard seven better year.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1205, 'MediumPurple Dresse Learn', 2, 'That those station how. Glass matter really against. Pay value involve loss language.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1206, 'Navy Hoodie Finally', 3, 'Box general use second listen great. Look own seek new know scientist. Show among fine charge may see actually expect.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1207, 'Pink Blazer Oil', 1, 'Manage forward raise everybody control small from former. Sound hot continue second agency measure. Professional administration even. Themselves door everything write reflect.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1208, 'GreenYellow Sweater In', 2, 'Catch party pull mention let friend. Building he Republican fast bill future. Involve land recognize join voice certain big particularly.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1209, 'Sienna Short Role', 3, 'Election minute computer happy four another. Clear article station different shoulder.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1210, 'RosyBrown Shirt Them', 1, 'Organization though less really above. Year order executive minute. Yes space life partner in.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1211, 'IndianRed Short Physical', 2, 'For politics activity attention walk subject professional.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1212, 'LightGreen Blazer General', 3, 'Heart green woman recently explain laugh eye. Education contain use yet amount. First discussion care mention he.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1213, 'MediumSeaGreen Blazer Movement', 1, 'Run along family contain food three reason.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1214, 'MediumBlue Jacket Heart', 2, 'Try like bad question difference many minute teacher. Back debate sing pretty part away sport. Option low subject. Section year standard identify cover partner central.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1215, 'Silver Dresse Fear', 3, 'Edge standard window consumer despite heart. Late senior course body.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1216, 'Indigo Shirt Either', 1, 'President animal and necessary certainly card adult structure.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1217, 'Green Jacket Institution', 2, 'Traditional remember lot night foreign history. Arrive think cultural project very war product.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1218, 'DarkOrchid Hoodie Night', 3, 'Quickly imagine until individual executive also. Raise environmental crime ok then.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1219, 'DarkRed T-Shirt Offer', 1, 'Write fall economic. Reach sometimes safe important lay huge. Federal mission throw give above majority will society.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1220, 'SteelBlue Blazer Sure', 2, 'Nothing else difficult best. Wish create world least total better. Them yourself back yourself method election play campaign.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1221, 'Orange Sweater Worker', 3, 'Suffer edge rule spend seem site find speak. Billion two property body lead no staff. Occur professor while culture.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1222, 'LightCoral Dresse Plant', 1, 'Sea on far fine president. Yeah likely major process involve hand. Film lot dinner check rock.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1223, 'SaddleBrown Jean First', 2, 'Yourself cell reduce send. Difficult fire break space.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1224, 'LightGray Skirt Watch', 3, 'Likely old deal recently imagine sure short son.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1225, 'ForestGreen Jacket Per', 1, 'Help argue often young before standard investment. Shake develop home.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1226, 'MediumSeaGreen T-Shirt This', 2, 'Laugh goal interview fly never sound lay fight. Ready yeah resource over participant understand certain scene.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1227, 'FireBrick Hoodie After', 3, 'System build management until page try section. Dinner change else.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1228, 'RoyalBlue Skirt Research', 1, 'Nation make education machine. Edge hair store interest stage old agency difference. Toward my away I.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1229, 'DarkSlateBlue T-Shirt Whatever', 2, 'Theory something factor east choice either. Simply make plan chance.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1230, 'LightYellow Jean Realize', 3, 'Who somebody remember film participant another data. Me say employee office. Any while near remain act professional. Deal dog keep.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1231, 'MediumSpringGreen Jacket Once', 1, 'Simple American can like glass ground. Join report price sort.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1232, 'PaleTurquoise Short Carry', 2, 'So painting large. Power decide whatever art gas own over. Painting speech soon determine end compare marriage best.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1233, 'DeepSkyBlue Hoodie Treat', 3, 'Assume seven manager always our box best. You occur about court happy more. Speak least explain positive PM specific.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1234, 'DarkCyan Sweater Into', 1, 'Audience whether read key pretty still true. Fear record would draw body responsibility. Alone boy because form summer accept use.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1235, 'DarkGoldenRod Dresse She', 2, 'History lay son strong smile next always. Accept choose bed though. Data yeah they important.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1236, 'Lime Short Guy', 3, 'Report risk environmental. Drive suddenly follow perhaps though yeah.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1237, 'AliceBlue T-Shirt Fast', 1, 'Quickly nature key door show fear American. Interview magazine far none nice after factor.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1238, 'Cornsilk Shirt Mrs', 2, 'Single minute cup time bank agency. Military hold meet require difference question you. Real reach economic art language day woman modern.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1239, 'ForestGreen Skirt Skin', 3, 'Career form listen compare prevent environment entire. Four marriage perform more particularly. Eat improve natural major. Arrive sport big key.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1240, 'Green Jacket Lot', 1, 'Owner machine hour apply court. Center word sense bed develop suddenly. Bad upon sometimes why nothing term spring establish.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1241, 'DeepSkyBlue Dresse Majority', 2, 'Market member individual share Congress pretty. Laugh sister available. Pull specific special television.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1242, 'Turquoise T-Shirt Sit', 3, 'Situation role Mrs quite crime. Indicate yet see my.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1243, 'FireBrick Skirt Health', 1, 'Control majority individual decade may. Back special per million pattern few.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1244, 'DarkGreen Jean Great', 2, 'At anything though would difficult need. Return debate some remember between same inside. Reduce rather enjoy baby direction subject.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1245, 'DarkBlue Skirt Leg', 3, 'Bill point how health over while. On television television. College range full should.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1246, 'DarkOliveGreen Blazer Certain', 1, 'Learn guess pass include poor television old.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1247, 'Crimson Sweater Six', 2, 'Carry myself western Republican brother really. Society close make it especially or accept. Cultural protect win view certain suddenly talk hit.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1248, 'Beige Dresse Available', 3, 'Simply pattern Congress. Despite defense support many.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1249, 'DarkTurquoise Hoodie Consumer', 1, 'Board me realize sign commercial most opportunity. Never forward plan create site glass treatment he. Tree look own task heavy behavior enjoy most.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1250, 'OldLace Sweater Food', 2, 'Realize face beyond party if firm affect. Forward some look morning concern. Produce weight fish us.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1251, 'MintCream Shirt Prove', 3, 'Student lead nation. Themselves world project range. Teacher economic bed with eat fire stock.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1252, 'Ivory Sweater Table', 1, 'Single hold per new public investment medical trip. Key available face wife.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1253, 'MediumBlue Hoodie Water', 2, 'Continue history pass through. Mention walk if. Quickly save machine respond.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1254, 'FloralWhite Skirt Should', 3, 'Whether family PM site purpose.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1255, 'SpringGreen T-Shirt Figure', 1, 'To pull weight share keep direction often show. Kid trade win town number. Allow professional need mother affect oil success.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1256, 'Navy Blazer Page', 2, 'Within Republican machine. Court one suddenly finally share part computer.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1257, 'ForestGreen T-Shirt Today', 3, 'Trip seven sell region forward least goal him. Truth situation mean politics believe.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1258, 'MintCream Jean Serve', 1, 'Worry song economy dog. View pull discover color.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1259, 'LightCoral Blazer Ten', 2, 'Serve personal support often fear. Party people decision player north plan.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1260, 'Snow Blazer Responsibility', 3, 'Fall onto happen tax feel soldier new man. Represent structure weight teacher walk enough now. Song news simply inside if.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1261, 'Beige Short Guess', 1, 'Contain against blue through never detail book about. Expert teach treatment join surface another research. Middle between consumer marriage.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1262, 'Thistle Shirt Point', 2, 'Find now space appear allow.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1263, 'Sienna T-Shirt Yard', 3, 'Total term discuss participant. Bed night knowledge respond message. Reason painting star movie put.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1264, 'Salmon Shirt Name', 1, 'Analysis stand strong top. True over though production mean. Support computer able away.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1265, 'LightGoldenRodYellow Hoodie Compare', 2, 'Another know seat thus. Sense piece sense may computer. Knowledge better until evening.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1266, 'Chartreuse T-Shirt Last', 3, 'Measure responsibility exist style. Source her difference each happen whole north.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1267, 'Peru Dresse Son', 1, 'Fly sign what consider natural understand. Statement eat break reduce.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1268, 'BlueViolet Skirt Even', 2, 'Defense two artist available TV again woman. Early simply job very parent carry.', 'products/carousel_2.jpeg', 'products/Image_1.jpg', 'products/carousel_3.jpg', 'products/carousel_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1269, 'DarkSalmon Jean Major', 3, 'Travel social doctor. Manager art study would. Serious use security piece agreement under. Plan environment room pressure compare.', 'products/carousel_3.jpg', 'products/carousel_2.jpeg', 'products/carousel_1.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51'),
(1270, 'LightSkyBlue Blazer Use', 1, 'Medical federal every else day anything in. Model change analysis prepare price decision civil.', 'products/carousel_1.jpg', 'products/carousel_2.jpeg', 'products/carousel_3.jpg', 'products/Image_1.jpg', 'active', '2025-07-17 11:02:51', '2025-07-17 11:02:51');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `size` enum('S','M','L','XL') COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `size`, `price`, `created_at`, `updated_at`, `stock`) VALUES
(3061, 1019, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3062, 1019, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3063, 1019, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3064, 1019, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3065, 1020, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3066, 1020, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3067, 1020, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3068, 1020, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3069, 1021, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3070, 1021, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:24:04', 193),
(3071, 1021, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3072, 1021, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3073, 1022, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3074, 1022, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3075, 1022, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3076, 1022, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3077, 1023, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3078, 1023, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3079, 1023, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3080, 1023, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3081, 1024, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3082, 1024, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3083, 1024, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3084, 1024, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3085, 1025, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3086, 1025, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3087, 1025, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3088, 1025, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3089, 1026, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3090, 1026, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3091, 1026, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3092, 1026, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3093, 1027, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3094, 1027, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3095, 1027, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3096, 1027, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3097, 1028, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3098, 1028, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3099, 1028, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3100, 1028, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3101, 1029, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3102, 1029, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3103, 1029, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3104, 1029, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3105, 1030, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3106, 1030, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3107, 1030, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3108, 1030, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3109, 1031, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3110, 1031, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3111, 1031, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3112, 1031, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3113, 1032, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3114, 1032, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3115, 1032, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3116, 1032, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3117, 1033, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3118, 1033, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3119, 1033, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3120, 1033, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3121, 1034, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3122, 1034, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3123, 1034, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3124, 1034, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3125, 1035, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3126, 1035, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3127, 1035, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3128, 1035, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3129, 1036, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3130, 1036, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3131, 1036, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3132, 1036, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3133, 1037, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3134, 1037, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3135, 1037, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3136, 1037, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3137, 1038, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3138, 1038, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3139, 1038, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3140, 1038, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3141, 1039, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3142, 1039, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3143, 1039, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3144, 1039, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3145, 1040, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3146, 1040, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3147, 1040, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3148, 1040, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3149, 1041, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3150, 1041, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3151, 1041, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3152, 1041, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3153, 1042, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3154, 1042, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3155, 1042, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3156, 1042, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3157, 1043, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3158, 1043, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3159, 1043, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3160, 1043, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3161, 1044, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3162, 1044, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3163, 1044, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3164, 1044, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3165, 1045, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3166, 1045, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3167, 1045, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3168, 1045, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3169, 1046, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3170, 1046, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3171, 1046, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3172, 1046, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3173, 1047, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3174, 1047, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3175, 1047, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3176, 1047, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3177, 1048, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3178, 1048, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3179, 1048, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3180, 1048, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3181, 1049, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3182, 1049, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3183, 1049, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3184, 1049, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3185, 1050, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3186, 1050, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3187, 1050, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3188, 1050, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3189, 1051, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3190, 1051, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3191, 1051, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3192, 1051, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3193, 1052, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3194, 1052, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3195, 1052, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3196, 1052, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3197, 1053, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3198, 1053, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3199, 1053, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3200, 1053, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3201, 1054, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3202, 1054, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3203, 1054, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3204, 1054, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3205, 1055, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3206, 1055, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3207, 1055, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3208, 1055, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3209, 1056, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3210, 1056, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3211, 1056, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3212, 1056, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3213, 1057, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3214, 1057, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3215, 1057, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3216, 1057, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3217, 1058, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3218, 1058, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3219, 1058, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3220, 1058, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3221, 1059, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3222, 1059, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3223, 1059, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3224, 1059, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3225, 1060, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3226, 1060, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3227, 1060, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3228, 1060, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3229, 1061, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3230, 1061, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3231, 1061, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3232, 1061, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3233, 1062, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3234, 1062, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3235, 1062, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3236, 1062, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3237, 1063, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3238, 1063, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3239, 1063, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3240, 1063, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3241, 1064, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3242, 1064, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3243, 1064, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3244, 1064, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3245, 1065, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3246, 1065, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3247, 1065, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3248, 1065, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3249, 1066, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3250, 1066, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3251, 1066, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3252, 1066, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3253, 1067, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3254, 1067, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3255, 1067, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3256, 1067, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3257, 1068, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3258, 1068, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3259, 1068, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3260, 1068, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3261, 1069, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3262, 1069, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3263, 1069, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3264, 1069, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3265, 1070, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3266, 1070, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3267, 1070, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3268, 1070, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3269, 1071, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3270, 1071, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3271, 1071, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3272, 1071, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3273, 1072, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3274, 1072, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3275, 1072, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3276, 1072, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3277, 1073, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3278, 1073, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3279, 1073, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3280, 1073, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3281, 1074, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3282, 1074, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3283, 1074, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3284, 1074, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3285, 1075, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3286, 1075, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3287, 1075, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3288, 1075, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3289, 1076, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3290, 1076, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3291, 1076, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3292, 1076, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3293, 1077, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3294, 1077, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3295, 1077, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3296, 1077, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3297, 1078, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3298, 1078, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3299, 1078, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3300, 1078, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3301, 1079, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3302, 1079, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3303, 1079, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3304, 1079, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3305, 1080, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3306, 1080, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3307, 1080, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3308, 1080, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3309, 1081, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3310, 1081, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3311, 1081, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3312, 1081, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3313, 1082, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3314, 1082, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3315, 1082, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3316, 1082, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3317, 1083, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3318, 1083, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3319, 1083, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3320, 1083, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3321, 1084, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3322, 1084, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3323, 1084, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3324, 1084, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3325, 1085, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3326, 1085, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3327, 1085, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3328, 1085, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3329, 1086, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3330, 1086, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3331, 1086, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3332, 1086, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3333, 1087, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3334, 1087, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3335, 1087, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3336, 1087, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3337, 1088, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3338, 1088, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3339, 1088, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3340, 1088, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3341, 1089, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3342, 1089, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3343, 1089, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3344, 1089, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3345, 1090, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3346, 1090, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3347, 1090, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3348, 1090, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3349, 1091, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3350, 1091, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3351, 1091, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3352, 1091, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3353, 1092, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3354, 1092, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3355, 1092, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3356, 1092, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3357, 1093, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3358, 1093, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3359, 1093, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3360, 1093, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3361, 1094, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3362, 1094, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3363, 1094, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3364, 1094, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3365, 1095, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3366, 1095, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3367, 1095, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3368, 1095, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3369, 1096, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3370, 1096, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3371, 1096, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3372, 1096, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3373, 1097, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3374, 1097, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3375, 1097, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3376, 1097, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3377, 1098, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3378, 1098, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3379, 1098, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3380, 1098, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3381, 1099, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3382, 1099, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3383, 1099, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3384, 1099, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3385, 1100, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3386, 1100, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3387, 1100, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3388, 1100, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3389, 1101, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3390, 1101, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3391, 1101, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3392, 1101, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3393, 1102, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3394, 1102, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3395, 1102, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3396, 1102, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3397, 1103, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3398, 1103, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3399, 1103, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3400, 1103, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3401, 1104, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3402, 1104, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3403, 1104, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3404, 1104, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3405, 1105, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3406, 1105, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3407, 1105, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3408, 1105, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3409, 1106, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3410, 1106, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3411, 1106, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3412, 1106, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3413, 1107, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3414, 1107, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3415, 1107, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3416, 1107, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3417, 1108, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3418, 1108, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3419, 1108, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3420, 1108, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3421, 1109, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3422, 1109, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3423, 1109, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3424, 1109, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3425, 1110, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3426, 1110, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3427, 1110, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3428, 1110, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3429, 1111, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3430, 1111, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3431, 1111, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3432, 1111, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3433, 1112, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3434, 1112, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3435, 1112, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3436, 1112, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3437, 1113, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3438, 1113, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3439, 1113, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3440, 1113, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3441, 1114, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3442, 1114, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3443, 1114, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3444, 1114, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3445, 1115, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3446, 1115, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3447, 1115, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3448, 1115, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3449, 1116, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3450, 1116, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3451, 1116, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3452, 1116, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3453, 1117, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3454, 1117, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3455, 1117, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3456, 1117, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3457, 1118, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3458, 1118, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3459, 1118, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3460, 1118, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3461, 1119, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3462, 1119, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3463, 1119, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3464, 1119, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3465, 1120, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3466, 1120, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3467, 1120, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3468, 1120, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3469, 1121, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3470, 1121, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3471, 1121, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3472, 1121, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3473, 1122, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3474, 1122, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3475, 1122, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3476, 1122, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3477, 1123, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3478, 1123, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3479, 1123, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3480, 1123, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3481, 1124, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3482, 1124, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3483, 1124, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3484, 1124, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3485, 1125, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3486, 1125, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3487, 1125, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3488, 1125, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3489, 1126, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3490, 1126, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3491, 1126, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3492, 1126, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3493, 1127, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3494, 1127, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3495, 1127, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3496, 1127, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3497, 1128, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3498, 1128, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3499, 1128, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3500, 1128, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3501, 1129, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3502, 1129, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3503, 1129, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3504, 1129, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3505, 1130, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3506, 1130, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3507, 1130, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3508, 1130, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3509, 1131, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3510, 1131, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3511, 1131, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3512, 1131, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3513, 1132, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3514, 1132, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3515, 1132, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3516, 1132, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3517, 1133, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3518, 1133, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3519, 1133, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3520, 1133, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3521, 1134, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3522, 1134, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3523, 1134, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3524, 1134, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3525, 1135, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3526, 1135, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3527, 1135, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3528, 1135, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3529, 1136, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3530, 1136, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3531, 1136, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3532, 1136, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3533, 1137, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3534, 1137, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3535, 1137, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3536, 1137, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3537, 1138, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3538, 1138, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3539, 1138, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3540, 1138, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3541, 1139, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3542, 1139, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3543, 1139, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3544, 1139, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3545, 1140, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3546, 1140, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3547, 1140, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3548, 1140, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3549, 1141, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3550, 1141, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3551, 1141, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3552, 1141, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3553, 1142, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3554, 1142, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3555, 1142, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3556, 1142, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3557, 1143, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3558, 1143, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3559, 1143, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3560, 1143, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3561, 1144, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3562, 1144, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3563, 1144, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3564, 1144, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3565, 1145, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3566, 1145, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3567, 1145, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3568, 1145, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3569, 1146, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3570, 1146, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3571, 1146, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3572, 1146, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3573, 1147, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3574, 1147, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3575, 1147, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3576, 1147, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3577, 1148, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3578, 1148, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3579, 1148, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3580, 1148, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3581, 1149, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3582, 1149, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3583, 1149, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3584, 1149, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3585, 1150, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3586, 1150, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3587, 1150, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3588, 1150, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3589, 1151, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3590, 1151, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3591, 1151, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3592, 1151, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3593, 1152, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3594, 1152, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3595, 1152, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3596, 1152, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3597, 1153, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3598, 1153, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3599, 1153, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3600, 1153, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3601, 1154, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3602, 1154, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3603, 1154, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3604, 1154, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3605, 1155, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3606, 1155, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3607, 1155, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3608, 1155, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3609, 1156, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3610, 1156, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3611, 1156, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3612, 1156, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3613, 1157, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3614, 1157, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3615, 1157, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3616, 1157, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3617, 1158, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3618, 1158, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3619, 1158, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3620, 1158, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3621, 1159, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3622, 1159, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3623, 1159, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3624, 1159, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3625, 1160, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3626, 1160, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3627, 1160, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3628, 1160, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3629, 1161, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3630, 1161, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3631, 1161, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3632, 1161, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3633, 1162, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3634, 1162, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3635, 1162, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3636, 1162, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3637, 1163, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3638, 1163, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3639, 1163, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3640, 1163, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3641, 1164, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3642, 1164, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3643, 1164, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3644, 1164, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3645, 1165, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3646, 1165, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3647, 1165, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3648, 1165, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3649, 1166, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3650, 1166, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3651, 1166, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3652, 1166, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3653, 1167, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3654, 1167, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3655, 1167, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3656, 1167, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3657, 1168, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3658, 1168, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3659, 1168, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3660, 1168, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3661, 1169, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3662, 1169, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3663, 1169, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3664, 1169, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3665, 1170, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3666, 1170, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3667, 1170, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3668, 1170, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3669, 1171, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3670, 1171, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3671, 1171, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3672, 1171, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3673, 1172, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3674, 1172, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3675, 1172, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3676, 1172, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3677, 1173, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3678, 1173, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3679, 1173, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3680, 1173, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3681, 1174, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3682, 1174, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3683, 1174, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3684, 1174, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3685, 1175, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3686, 1175, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3687, 1175, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3688, 1175, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3689, 1176, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3690, 1176, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3691, 1176, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3692, 1176, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3693, 1177, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3694, 1177, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3695, 1177, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3696, 1177, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3697, 1178, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3698, 1178, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3699, 1178, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3700, 1178, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3701, 1179, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3702, 1179, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3703, 1179, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3704, 1179, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3705, 1180, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150);
INSERT INTO `product_sizes` (`id`, `product_id`, `size`, `price`, `created_at`, `updated_at`, `stock`) VALUES
(3706, 1180, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3707, 1180, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3708, 1180, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3709, 1181, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3710, 1181, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3711, 1181, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3712, 1181, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3713, 1182, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3714, 1182, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3715, 1182, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3716, 1182, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3717, 1183, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3718, 1183, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3719, 1183, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3720, 1183, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3721, 1184, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3722, 1184, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3723, 1184, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3724, 1184, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3725, 1185, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3726, 1185, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3727, 1185, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3728, 1185, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3729, 1186, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3730, 1186, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3731, 1186, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3732, 1186, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3733, 1187, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3734, 1187, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3735, 1187, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3736, 1187, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3737, 1188, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3738, 1188, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3739, 1188, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3740, 1188, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3741, 1189, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3742, 1189, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3743, 1189, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3744, 1189, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3745, 1190, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3746, 1190, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3747, 1190, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3748, 1190, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3749, 1191, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3750, 1191, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3751, 1191, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3752, 1191, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3753, 1192, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3754, 1192, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3755, 1192, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3756, 1192, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3757, 1193, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3758, 1193, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3759, 1193, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3760, 1193, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3761, 1194, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3762, 1194, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3763, 1194, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3764, 1194, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3765, 1195, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3766, 1195, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3767, 1195, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3768, 1195, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3769, 1196, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3770, 1196, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3771, 1196, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3772, 1196, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3773, 1197, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3774, 1197, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3775, 1197, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3776, 1197, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3777, 1198, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3778, 1198, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3779, 1198, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3780, 1198, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3781, 1199, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3782, 1199, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3783, 1199, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3784, 1199, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3785, 1200, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3786, 1200, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3787, 1200, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3788, 1200, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3789, 1201, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3790, 1201, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3791, 1201, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3792, 1201, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3793, 1202, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3794, 1202, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3795, 1202, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3796, 1202, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3797, 1203, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3798, 1203, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3799, 1203, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3800, 1203, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3801, 1204, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3802, 1204, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3803, 1204, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3804, 1204, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3805, 1205, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3806, 1205, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3807, 1205, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3808, 1205, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3809, 1206, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3810, 1206, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3811, 1206, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3812, 1206, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3813, 1207, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3814, 1207, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3815, 1207, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3816, 1207, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3817, 1208, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3818, 1208, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3819, 1208, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3820, 1208, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3821, 1209, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3822, 1209, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3823, 1209, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3824, 1209, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3825, 1210, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3826, 1210, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3827, 1210, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3828, 1210, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3829, 1211, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3830, 1211, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3831, 1211, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3832, 1211, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3833, 1212, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3834, 1212, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3835, 1212, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3836, 1212, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3837, 1213, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3838, 1213, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3839, 1213, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3840, 1213, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3841, 1214, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3842, 1214, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3843, 1214, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3844, 1214, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3845, 1215, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3846, 1215, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3847, 1215, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3848, 1215, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3849, 1216, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3850, 1216, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3851, 1216, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3852, 1216, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3853, 1217, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3854, 1217, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3855, 1217, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3856, 1217, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3857, 1218, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3858, 1218, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3859, 1218, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3860, 1218, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3861, 1219, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3862, 1219, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3863, 1219, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3864, 1219, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3865, 1220, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3866, 1220, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3867, 1220, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3868, 1220, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3869, 1221, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3870, 1221, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3871, 1221, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3872, 1221, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3873, 1222, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3874, 1222, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3875, 1222, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3876, 1222, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3877, 1223, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3878, 1223, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3879, 1223, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3880, 1223, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3881, 1224, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3882, 1224, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3883, 1224, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3884, 1224, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3885, 1225, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3886, 1225, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3887, 1225, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3888, 1225, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3889, 1226, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3890, 1226, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3891, 1226, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3892, 1226, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3893, 1227, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3894, 1227, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3895, 1227, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3896, 1227, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3897, 1228, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3898, 1228, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3899, 1228, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3900, 1228, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3901, 1229, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3902, 1229, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3903, 1229, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3904, 1229, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3905, 1230, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3906, 1230, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3907, 1230, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3908, 1230, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3909, 1231, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3910, 1231, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3911, 1231, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3912, 1231, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3913, 1232, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3914, 1232, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3915, 1232, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3916, 1232, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3917, 1233, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3918, 1233, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3919, 1233, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3920, 1233, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3921, 1234, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3922, 1234, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3923, 1234, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3924, 1234, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3925, 1235, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3926, 1235, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3927, 1235, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3928, 1235, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3929, 1236, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3930, 1236, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3931, 1236, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3932, 1236, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3933, 1237, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3934, 1237, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3935, 1237, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3936, 1237, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3937, 1238, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3938, 1238, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3939, 1238, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3940, 1238, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3941, 1239, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3942, 1239, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3943, 1239, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3944, 1239, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3945, 1240, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3946, 1240, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3947, 1240, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3948, 1240, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3949, 1241, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(3950, 1241, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3951, 1241, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3952, 1241, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3953, 1242, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(3954, 1242, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3955, 1242, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3956, 1242, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3957, 1243, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(3958, 1243, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3959, 1243, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3960, 1243, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3961, 1244, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(3962, 1244, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3963, 1244, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3964, 1244, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3965, 1245, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(3966, 1245, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3967, 1245, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3968, 1245, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3969, 1246, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(3970, 1246, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3971, 1246, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3972, 1246, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3973, 1247, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(3974, 1247, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3975, 1247, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3976, 1247, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3977, 1248, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(3978, 1248, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3979, 1248, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(3980, 1248, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3981, 1249, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(3982, 1249, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(3983, 1249, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(3984, 1249, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3985, 1250, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(3986, 1250, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3987, 1250, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(3988, 1250, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3989, 1251, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(3990, 1251, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3991, 1251, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(3992, 1251, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3993, 1252, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(3994, 1252, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(3995, 1252, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(3996, 1252, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(3997, 1253, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(3998, 1253, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(3999, 1253, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(4000, 1253, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(4001, 1254, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(4002, 1254, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(4003, 1254, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(4004, 1254, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(4005, 1255, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(4006, 1255, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(4007, 1255, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(4008, 1255, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(4009, 1256, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(4010, 1256, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(4011, 1256, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(4012, 1256, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(4013, 1257, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(4014, 1257, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(4015, 1257, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 350),
(4016, 1257, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(4017, 1258, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(4018, 1258, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(4019, 1258, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 400),
(4020, 1258, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(4021, 1259, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(4022, 1259, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(4023, 1259, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 450),
(4024, 1259, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(4025, 1260, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(4026, 1260, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(4027, 1260, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 500),
(4028, 1260, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(4029, 1261, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(4030, 1261, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(4031, 1261, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 550),
(4032, 1261, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(4033, 1262, 'S', 1000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(4034, 1262, 'M', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(4035, 1262, 'L', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 600),
(4036, 1262, 'XL', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(4037, 1263, 'S', 1500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(4038, 1263, 'M', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(4039, 1263, 'L', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 650),
(4040, 1263, 'XL', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(4041, 1264, 'S', 2000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(4042, 1264, 'M', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(4043, 1264, 'L', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 700),
(4044, 1264, 'XL', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(4045, 1265, 'S', 2500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 50),
(4046, 1265, 'M', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(4047, 1265, 'L', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 750),
(4048, 1265, 'XL', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(4049, 1266, 'S', 3000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 100),
(4050, 1266, 'M', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(4051, 1266, 'L', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 800),
(4052, 1266, 'XL', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(4053, 1267, 'S', 3500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 150),
(4054, 1267, 'M', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(4055, 1267, 'L', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 850),
(4056, 1267, 'XL', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(4057, 1268, 'S', 4000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 200),
(4058, 1268, 'M', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(4059, 1268, 'L', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 900),
(4060, 1268, 'XL', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(4061, 1269, 'S', 4500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 250),
(4062, 1269, 'M', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050),
(4063, 1269, 'L', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 950),
(4064, 1269, 'XL', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(4065, 1270, 'S', 5000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 300),
(4066, 1270, 'M', 5500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1100),
(4067, 1270, 'L', 6000.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1000),
(4068, 1270, 'XL', 6500.00, '2025-07-17 11:02:51', '2025-07-17 11:02:51', 1050);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('llHlm1VMQkZGk197RkaXFudJhMj3XsJevDaXW0lG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWtsMEtlRlRuWXV6RVUwWmFmd21Ud2Q0OWljeElEblNNTTU3bzdYbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vb3V0Zml0LTgxOC50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1760239101),
('wdUimNjKgDA5WqqrBfDXzgJIaKiAzGnEc7ssNwGC', 22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicjU0b2NWOEZIaG02Q2J3YXZERFFKcHI2QWF6U1M0R3ozc1VVck5NcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vb3V0Zml0LTgxOC50ZXN0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjI7fQ==', 1760239818);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_code` varchar(6) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `user_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_general_ci,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `otp_code`, `is_verified`, `user_type`, `phone`, `profile_picture`, `address`, `dob`, `gender`) VALUES
(21, 'panda cord', 'dccord3@gmail.com', '2025-10-10 11:35:15', '$2y$12$mzj/0irJ5hdwtjheSCfVq.oHRPRgBnlQPRxyIZY9oVcJOCibOQV/i', NULL, '2025-10-10 11:34:42', '2025-10-10 11:35:15', NULL, 1, 'user', '9878787878', NULL, 'address', '2025-02-01', 'male'),
(22, 'Admin', 'team.818x@gmail.com', '2025-10-12 03:29:53', '$2y$12$JyHZKpSMqCCGlGJgNFVBjOFTEpvZ8HzDy.KSzL.9kukXOuTgRxg56', NULL, '2025-10-12 03:29:22', '2025-10-12 03:29:53', NULL, 1, 'admin', '3434222345', NULL, 'team.818x@address', '2007-04-06', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carousels`
--
ALTER TABLE `carousels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `featured_products`
--
ALTER TABLE `featured_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_arrivals`
--
ALTER TABLE `new_arrivals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD KEY `email` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carousels`
--
ALTER TABLE `carousels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `featured_products`
--
ALTER TABLE `featured_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `new_arrivals`
--
ALTER TABLE `new_arrivals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1271;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4069;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
