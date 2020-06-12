-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2020 at 11:43 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_app`
--
CREATE DATABASE IF NOT EXISTS `ecommerce_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ecommerce_app`;

-- --------------------------------------------------------

--
-- Table structure for table `app_categories`
--

CREATE TABLE `app_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_categories`
--

INSERT INTO `app_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Laptops', 'laptops', NULL, NULL),
(2, 'TVs', 'TVs', NULL, NULL),
(3, 'Watches', 'watches', NULL, NULL),
(4, 'Shoes', 'shoes', NULL, NULL),
(5, 'All Electronics', 'all-electronics', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-06-04 14:02:12', '2020-06-04 14:02:12'),
(2, 2, 1, '2020-06-04 14:02:13', '2020-06-04 14:02:13'),
(3, 3, 1, '2020-06-04 14:02:13', '2020-06-04 14:02:13'),
(4, 4, 1, '2020-06-04 14:02:13', '2020-06-04 14:02:13'),
(5, 5, 1, '2020-06-04 14:02:13', '2020-06-04 14:02:13'),
(6, 6, 1, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(7, 7, 1, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(8, 8, 1, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(9, 9, 1, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(10, 10, 1, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(11, 11, 1, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(12, 12, 1, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(13, 13, 1, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(14, 14, 1, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(15, 15, 1, '2020-06-04 14:02:15', '2020-06-04 14:02:15'),
(16, 16, 1, '2020-06-04 14:02:15', '2020-06-04 14:02:15'),
(17, 17, 1, '2020-06-04 14:02:15', '2020-06-04 14:02:15'),
(18, 18, 1, '2020-06-04 14:02:15', '2020-06-04 14:02:15'),
(19, 19, 1, '2020-06-04 14:02:15', '2020-06-04 14:02:15'),
(20, 20, 1, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(21, 21, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(22, 22, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(23, 23, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(24, 24, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(25, 25, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(26, 26, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(27, 27, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(28, 28, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(29, 29, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(30, 30, 2, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(31, 31, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(32, 32, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(33, 33, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(34, 34, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(35, 35, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(36, 36, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(37, 37, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(38, 38, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(39, 39, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(40, 40, 2, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(41, 41, 4, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(42, 42, 4, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(43, 43, 4, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(44, 44, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(45, 45, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(46, 46, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(47, 47, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(48, 48, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(49, 49, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(50, 50, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(51, 51, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(52, 52, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(53, 53, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(54, 54, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(55, 55, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(56, 56, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(57, 57, 4, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(58, 58, 4, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(59, 59, 4, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(60, 60, 4, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(61, 61, 3, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(62, 62, 3, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(63, 63, 3, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(64, 64, 3, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(65, 65, 3, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(66, 66, 3, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(67, 67, 3, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(68, 68, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(69, 69, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(70, 70, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(71, 71, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(72, 72, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(73, 73, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(74, 74, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(75, 75, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(76, 76, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(77, 77, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(78, 78, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(79, 79, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(80, 80, 3, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(81, 1, 5, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(82, 2, 5, '2020-06-04 14:02:21', '2020-06-04 14:02:21'),
(83, 10, 5, '2020-06-04 14:02:21', '2020-06-04 14:02:21'),
(84, 15, 5, '2020-06-04 14:02:21', '2020-06-04 14:02:21'),
(85, 25, 5, '2020-06-04 14:02:21', '2020-06-04 14:02:21'),
(86, 30, 5, '2020-06-04 14:02:21', '2020-06-04 14:02:21'),
(87, 35, 5, '2020-06-04 14:02:21', '2020-06-04 14:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `percent_off`, `created_at`, `updated_at`) VALUES
(1, 'fixed123', 'fixed', 30, NULL, '2020-06-04 14:02:21', '2020-06-04 14:02:21'),
(2, 'percent123', 'percent', NULL, 25, '2020-06-04 14:02:21', '2020-06-04 14:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, '{}', 1),
(23, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
(26, 4, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 5),
(27, 5, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, '{}', 1),
(28, 5, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 2),
(29, 5, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"fixed\",\"options\":{\"fixed\":\"Fixed\",\"percent\":\"Percent off\"}}', 3),
(30, 5, 'value', 'number', 'Value', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 4),
(31, 5, 'percent_off', 'number', 'Percent Off', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 5),
(32, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(33, 5, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 7),
(34, 6, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 0, '{}', 1),
(35, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(36, 6, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{}', 3),
(37, 6, 'details', 'text', 'Details', 0, 1, 1, 1, 1, 1, '{}', 4),
(38, 6, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(39, 6, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '{}', 6),
(40, 6, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 7),
(41, 6, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{}', 8),
(42, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 9),
(43, 6, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 10),
(44, 6, 'product_belongstomany_app_category_relationship', 'relationship', 'app_categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"app_categories\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"category_product\",\"pivot\":\"1\",\"taggable\":\"on\"}', 11),
(45, 7, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(46, 7, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(47, 7, 'billing_email', 'text', 'Billing Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(48, 7, 'billing_name', 'text', 'Billing Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(49, 7, 'billing_address', 'text', 'Billing Address', 1, 1, 1, 1, 1, 1, '{}', 5),
(50, 7, 'billing_city', 'text', 'Billing City', 1, 1, 1, 1, 1, 1, '{}', 6),
(51, 7, 'billing_province', 'text', 'Billing Province', 1, 1, 1, 1, 1, 1, '{}', 7),
(52, 7, 'billing_phone', 'text', 'Billing Phone', 1, 1, 1, 1, 1, 1, '{}', 8),
(53, 7, 'billing_name_on_card', 'text', 'Name On Card', 1, 1, 1, 1, 1, 1, '{}', 9),
(54, 7, 'billing_discount', 'number', 'Billing Discount', 1, 1, 1, 1, 1, 1, '{}', 10),
(55, 7, 'billing_discount_code', 'text', 'Billing Discount Code', 0, 1, 1, 1, 1, 1, '{}', 11),
(56, 7, 'billing_subtotal', 'number', 'Billing Subtotal', 1, 1, 1, 1, 1, 1, '{}', 12),
(57, 7, 'billing_tax', 'number', 'Billing Tax', 1, 1, 1, 1, 1, 1, '{}', 13),
(58, 7, 'billing_total', 'number', 'Billing Total', 1, 1, 1, 1, 1, 1, '{}', 14),
(59, 7, 'payment_gateway', 'text', 'Payment Gateway', 1, 1, 1, 1, 1, 1, '{}', 15),
(60, 7, 'shipped', 'checkbox', 'Shipped', 1, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 16),
(61, 7, 'error', 'text', 'Error', 0, 1, 1, 1, 1, 1, '{}', 17),
(62, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 18),
(63, 7, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 1, '{}', 19),
(64, 7, 'order_belongstomany_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"order_product\",\"pivot\":\"1\",\"taggable\":\"on\"}', 20),
(65, 7, 'order_belongsto_user_relationship', 'relationship', 'user', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"app_categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 21);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-06-04 14:09:47', '2020-06-04 14:09:47'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-06-04 14:09:47', '2020-06-04 14:09:47'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-06-04 14:09:47', '2020-06-04 14:09:47'),
(4, 'app_categories', 'app-categories', 'App Category', 'App Categories', 'voyager-categories', 'App\\Category', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-04 14:14:41', '2020-06-04 14:14:41'),
(5, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-dollar', 'App\\Coupon', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-04 14:19:11', '2020-06-04 14:32:27'),
(6, 'products', 'products', 'Product', 'Products', 'voyager-folder', 'App\\Product', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-04 14:23:14', '2020-06-04 14:47:03'),
(7, 'orders', 'orders', 'Order', 'Orders', 'voyager-documentation', 'App\\Order', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-10 17:57:27', '2020-06-10 18:19:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-06-04 14:09:48', '2020-06-04 14:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-06-04 14:09:48', '2020-06-04 14:09:48', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2020-06-04 14:09:48', '2020-06-10 18:11:17', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 7, '2020-06-04 14:09:49', '2020-06-10 18:11:17', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 6, '2020-06-04 14:09:49', '2020-06-10 18:11:17', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-06-04 14:09:49', '2020-06-10 18:11:17', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-06-04 14:09:49', '2020-06-04 14:33:17', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-06-04 14:09:49', '2020-06-04 14:33:17', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-06-04 14:09:49', '2020-06-04 14:33:17', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-06-04 14:09:49', '2020-06-04 14:33:17', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2020-06-04 14:09:49', '2020-06-10 18:11:17', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-06-04 14:09:51', '2020-06-04 14:33:18', 'voyager.hooks', NULL),
(12, 1, 'App Categories', '', '_self', 'voyager-categories', NULL, NULL, 3, '2020-06-04 14:14:42', '2020-06-10 18:11:17', 'voyager.app-categories.index', NULL),
(13, 1, 'Coupons', '', '_self', 'voyager-dollar', NULL, NULL, 5, '2020-06-04 14:19:11', '2020-06-10 18:11:17', 'voyager.coupons.index', NULL),
(14, 1, 'Products', '', '_self', 'voyager-folder', NULL, NULL, 4, '2020-06-04 14:23:15', '2020-06-10 18:11:17', 'voyager.products.index', NULL),
(15, 1, 'Orders', '', '_self', 'voyager-documentation', NULL, NULL, 2, '2020-06-10 17:57:28', '2020-06-10 18:11:17', 'voyager.orders.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2020_05_12_155228_create_products_table', 1),
(29, '2020_06_01_114812_create_app_categories_table', 1),
(30, '2020_06_01_123544_create_category_product_table', 1),
(31, '2020_06_01_194647_create_coupons_table', 1),
(32, '2020_06_09_121919_create_orders_table', 2),
(33, '2020_06_09_150657_create_order_product_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_name_on_card` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_discount` int(11) NOT NULL DEFAULT '0',
  `billing_discount_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_subtotal` float NOT NULL,
  `billing_tax` float NOT NULL,
  `billing_total` float NOT NULL,
  `payment_gateway` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT '0',
  `error` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `billing_email`, `billing_name`, `billing_address`, `billing_city`, `billing_province`, `billing_phone`, `billing_name_on_card`, `billing_discount`, `billing_discount_code`, `billing_subtotal`, `billing_tax`, `billing_total`, `payment_gateway`, `shipped`, `error`, `created_at`, `updated_at`) VALUES
(2, 1, 'samy@email.com', 'Kamal', '11 wael, srour st', 'Sharijah', 'Sharijah', '01025687556', 'Samy Muhammad', 0, NULL, 6802, 952, 7754, 'stripe', 0, NULL, '2020-06-10 10:37:26', '2020-06-10 10:37:26'),
(3, 1, 'samy@email.com', 'Ali', '11 wael, srour st', 'foo', 'Daqahlia', '01025687556', 'Qabil Saad', 20, 'percent123', 59, 8, 67, 'stripe', 0, NULL, '2020-06-10 10:43:20', '2020-06-10 10:43:20'),
(4, 1, 'samy@email.com', 'Cool Name', '22 cool st', 'myCity', 'Safa', '01025687556', 'Cool Name', 0, NULL, 99, 14, 113, 'stripe', 0, 'Your card has expired.', '2020-06-10 10:56:16', '2020-06-10 10:56:16'),
(5, 1, 'samy@email.com', 'Kamal', '11 wael, srour st', 'Sharijah', 'Daqahlia', '01025687556', 'Qabil Ma7roos', 30, 'fixed123', 69, 10, 79, 'stripe', 0, NULL, '2020-06-10 10:58:43', '2020-06-10 10:58:43'),
(6, 1, 'samy@email.com', 'Dandy', '11 Hassan, Adel st', 'myCity', 'Daqahlia', '01025687556', 'Ali Ali', 0, NULL, 771, 107.94, 878.94, 'stripe', 0, NULL, '2020-06-10 19:34:47', '2020-06-10 19:34:47'),
(7, 2, 'ahmed@email.com', 'Ahmed', '11 Hassan, Adel st', 'Mit Ghamr', 'Alexandria', '01025687556', 'Ahmed Ibrahim', 0, NULL, 2268, 317.52, 2585.52, 'stripe', 0, NULL, '2020-06-11 09:33:16', '2020-06-11 09:33:16'),
(8, 2, 'ahmed@email.com', 'Ahmed', '11 Hassan, Adel st', 'Mit Ghamr', 'Alexandria', '01025687556', 'Ahmed Ibrahim', 0, NULL, 2268, 317.52, 2585.52, 'stripe', 0, NULL, '2020-06-11 09:35:28', '2020-06-11 09:35:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 2, '2020-06-10 10:37:26', '2020-06-10 10:37:26'),
(2, 2, 69, 3, '2020-06-10 10:37:26', '2020-06-10 10:37:26'),
(3, 2, 24, 1, '2020-06-10 10:37:26', '2020-06-10 10:37:26'),
(4, 3, 54, 1, '2020-06-10 10:43:20', '2020-06-10 10:43:20'),
(5, 4, 69, 1, '2020-06-10 10:56:16', '2020-06-10 10:56:16'),
(6, 5, 69, 1, '2020-06-10 10:58:43', '2020-06-10 10:58:43'),
(7, 6, 26, 1, '2020-06-10 19:34:48', '2020-06-10 19:34:48'),
(8, 7, 80, 1, '2020-06-11 09:33:17', '2020-06-11 09:33:17'),
(9, 7, 6, 1, '2020-06-11 09:33:17', '2020-06-11 09:33:17'),
(10, 8, 80, 1, '2020-06-11 09:35:28', '2020-06-11 09:35:28'),
(11, 8, 6, 1, '2020-06-11 09:35:29', '2020-06-11 09:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(2, 'browse_bread', NULL, '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(3, 'browse_database', NULL, '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(4, 'browse_media', NULL, '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(5, 'browse_compass', NULL, '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(6, 'browse_menus', 'menus', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(7, 'read_menus', 'menus', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(8, 'edit_menus', 'menus', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(9, 'add_menus', 'menus', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(10, 'delete_menus', 'menus', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(11, 'browse_roles', 'roles', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(12, 'read_roles', 'roles', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(13, 'edit_roles', 'roles', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(14, 'add_roles', 'roles', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(15, 'delete_roles', 'roles', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(16, 'browse_users', 'users', '2020-06-04 14:09:49', '2020-06-04 14:09:49'),
(17, 'read_users', 'users', '2020-06-04 14:09:50', '2020-06-04 14:09:50'),
(18, 'edit_users', 'users', '2020-06-04 14:09:50', '2020-06-04 14:09:50'),
(19, 'add_users', 'users', '2020-06-04 14:09:50', '2020-06-04 14:09:50'),
(20, 'delete_users', 'users', '2020-06-04 14:09:50', '2020-06-04 14:09:50'),
(21, 'browse_settings', 'settings', '2020-06-04 14:09:50', '2020-06-04 14:09:50'),
(22, 'read_settings', 'settings', '2020-06-04 14:09:50', '2020-06-04 14:09:50'),
(23, 'edit_settings', 'settings', '2020-06-04 14:09:50', '2020-06-04 14:09:50'),
(24, 'add_settings', 'settings', '2020-06-04 14:09:50', '2020-06-04 14:09:50'),
(25, 'delete_settings', 'settings', '2020-06-04 14:09:50', '2020-06-04 14:09:50'),
(26, 'browse_hooks', NULL, '2020-06-04 14:09:52', '2020-06-04 14:09:52'),
(27, 'browse_app_categories', 'app_categories', '2020-06-04 14:14:42', '2020-06-04 14:14:42'),
(28, 'read_app_categories', 'app_categories', '2020-06-04 14:14:42', '2020-06-04 14:14:42'),
(29, 'edit_app_categories', 'app_categories', '2020-06-04 14:14:42', '2020-06-04 14:14:42'),
(30, 'add_app_categories', 'app_categories', '2020-06-04 14:14:42', '2020-06-04 14:14:42'),
(31, 'delete_app_categories', 'app_categories', '2020-06-04 14:14:42', '2020-06-04 14:14:42'),
(32, 'browse_coupons', 'coupons', '2020-06-04 14:19:11', '2020-06-04 14:19:11'),
(33, 'read_coupons', 'coupons', '2020-06-04 14:19:11', '2020-06-04 14:19:11'),
(34, 'edit_coupons', 'coupons', '2020-06-04 14:19:11', '2020-06-04 14:19:11'),
(35, 'add_coupons', 'coupons', '2020-06-04 14:19:11', '2020-06-04 14:19:11'),
(36, 'delete_coupons', 'coupons', '2020-06-04 14:19:11', '2020-06-04 14:19:11'),
(37, 'browse_products', 'products', '2020-06-04 14:23:14', '2020-06-04 14:23:14'),
(38, 'read_products', 'products', '2020-06-04 14:23:14', '2020-06-04 14:23:14'),
(39, 'edit_products', 'products', '2020-06-04 14:23:14', '2020-06-04 14:23:14'),
(40, 'add_products', 'products', '2020-06-04 14:23:14', '2020-06-04 14:23:14'),
(41, 'delete_products', 'products', '2020-06-04 14:23:14', '2020-06-04 14:23:14'),
(42, 'browse_orders', 'orders', '2020-06-10 17:57:27', '2020-06-10 17:57:27'),
(43, 'read_orders', 'orders', '2020-06-10 17:57:27', '2020-06-10 17:57:27'),
(44, 'edit_orders', 'orders', '2020-06-10 17:57:27', '2020-06-10 17:57:27'),
(45, 'add_orders', 'orders', '2020-06-10 17:57:27', '2020-06-10 17:57:27'),
(46, 'delete_orders', 'orders', '2020-06-10 17:57:27', '2020-06-10 17:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `description`, `image`, `featured`, `created_at`, `updated_at`) VALUES
(1, 'Laptop1', 'Laptop1', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 16-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1629, '<p>Keyboard Languages : English Touch screen : No Usage : Multi Memory Technology : LPDDR3 Screen Size Range : 13 - 13.9 Inch Display Size (Inch) : 13.3 Inch External Product ID Type : UPC-A Optical Drive Type : Without Optical Drive Number of Processor Core : Dual Core RAM Type : ddr_sdram RAM Size : 8 GB Operating System Type : Mac Processor Family : Intel 8th Generation Core i5</p>', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:12', '2020-06-04 14:48:06'),
(2, 'Laptop2', 'Laptop2', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 17-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 2836, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:12', '2020-06-04 14:02:12'),
(3, 'Laptop3', 'Laptop3', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 14-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1502, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:13', '2020-06-04 14:02:13'),
(4, 'Laptop4', 'Laptop4', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 14-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 2432, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:13', '2020-06-04 14:02:13'),
(5, 'Laptop5', 'Laptop5', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 17-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1479, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:13', '2020-06-04 14:02:13'),
(6, 'Laptop6', 'Laptop6', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 13-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 2169, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(7, 'Laptop7', 'Laptop7', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 18-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 2661, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(8, 'Laptop8', 'Laptop8', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 13-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 2694, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(9, 'Laptop9', 'Laptop9', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 15-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 2772, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(10, 'Laptop10', 'Laptop10', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 17-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 2250, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(11, 'Laptop11', 'Laptop11', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 16-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1808, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(12, 'Laptop12', 'Laptop12', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 19-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 2230, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(13, 'Laptop13', 'Laptop13', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 16-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1347, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(14, 'Laptop14', 'Laptop14', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 18-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1779, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(15, 'Laptop15', 'Laptop15', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 14-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1486, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:14', '2020-06-04 14:02:14'),
(16, 'Laptop16', 'Laptop16', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 16-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1707, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:15', '2020-06-04 14:02:15'),
(17, 'Laptop17', 'Laptop17', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 17-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 2680, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:15', '2020-06-04 14:02:15'),
(18, 'Laptop18', 'Laptop18', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 18-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1984, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:15', '2020-06-04 14:02:15'),
(19, 'Laptop19', 'Laptop19', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 15-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1657, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:15', '2020-06-04 14:02:15'),
(20, 'Laptop20', 'Laptop20', 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, 19-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version', 1671, 'Keyboard Languages : English\n                                    Touch screen : No\n                                    Usage : Multi\n                                    Memory Technology : LPDDR3\n                                    Screen Size Range : 13 - 13.9 Inch\n                                    Display Size (Inch) : 13.3 Inch\n                                    External Product ID Type : UPC-A\n                                    Optical Drive Type : Without Optical Drive\n                                    Number of Processor Core : Dual Core\n                                    RAM Type : ddr_sdram\n                                    RAM Size : 8 GB\n                                    Operating System Type : Mac\n                                    Processor Family : Intel 8th Generation Core i5', 'products/June2020/IbwtolMb4Xkvsxv3CcGg.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(21, 'TV1', 'TV1', 'Samsung 43 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 555, '<p>Picture Engine: UHD Engine Motion Rate: 100 PQI (Picture Quality Index): 1400 HDR (High Dynamic Range): HDR HDR 10+: Yes HLG (Hybrid Log Gamma): Yes Contrast: Mega Contrast Color: PurColor Micro Dimming: UHD Dimming Contrast Enhancer: Yes Auto Motion Plus: Yes Film Mode: Yes Natural Mode Support: Yes</p>', 'products\\June2020\\Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 18:52:26'),
(22, 'TV2', 'TV2', 'Samsung 57 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 628, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(23, 'TV3', 'TV3', 'Samsung 33 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 844, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(24, 'TV4', 'TV4', 'Samsung 54 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 833, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(25, 'TV5', 'TV5', 'Samsung 63 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 605, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(26, 'TV6', 'TV6', 'Samsung 33 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 771, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(27, 'TV7', 'TV7', 'Samsung 50 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 762, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(28, 'TV8', 'TV8', 'Samsung 33 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 507, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(29, 'TV9', 'TV9', 'Samsung 35 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 965, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(30, 'TV10', 'TV10', 'Samsung 52 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 860, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(31, 'TV11', 'TV11', 'Samsung 39 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 660, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:16', '2020-06-04 14:02:16'),
(32, 'TV12', 'TV12', 'Samsung 41 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 645, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(33, 'TV13', 'TV13', 'Samsung 59 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 801, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(34, 'TV14', 'TV14', 'Samsung 42 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 853, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(35, 'TV15', 'TV15', 'Samsung 35 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 831, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(36, 'TV16', 'TV16', 'Samsung 50 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 691, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(37, 'TV17', 'TV17', 'Samsung 41 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 833, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(38, 'TV18', 'TV18', 'Samsung 64 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 513, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(39, 'TV19', 'TV19', 'Samsung 45 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 662, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(40, 'TV20', 'TV20', 'Samsung 51 Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black', 600, 'Picture Engine: UHD Engine\n                                    Motion Rate: 100\n                                    PQI (Picture Quality Index): 1400\n                                    HDR (High Dynamic Range): HDR\n                                    HDR 10+: Yes\n                                    HLG (Hybrid Log Gamma): Yes\n                                    Contrast: Mega Contrast\n                                    Color: PurColor\n                                    Micro Dimming: UHD Dimming\n                                    Contrast Enhancer: Yes\n                                    Auto Motion Plus: Yes\n                                    Film Mode: Yes\n                                    Natural Mode Support: Yes', 'products/June2020/Y84ds6uhFcDVE0m0iFvo.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(41, 'Shoes1', 'Shoes1', 'SPORT Fashion Sneakers For Men - Gray', 80, '<p>Color : White &amp; Red Material : Mixed Size : 45 EU Targeted Group : Men Style : Fashion Sneakers Occasion : Casual Shoe</p>', 'products\\June2020\\ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 18:58:00'),
(42, 'Shoes2', 'Shoes2', 'SPORT Fashion Sneakers For Men - Gray', 68, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(43, 'Shoes3', 'Shoes3', 'SPORT Fashion Sneakers For Men - Gray', 79, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:17', '2020-06-04 14:02:17'),
(44, 'Shoes4', 'Shoes4', 'SPORT Fashion Sneakers For Men - Gray', 100, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(45, 'Shoes5', 'Shoes5', 'SPORT Fashion Sneakers For Men - Gray', 89, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(46, 'Shoes6', 'Shoes6', 'SPORT Fashion Sneakers For Men - Gray', 89, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(47, 'Shoes7', 'Shoes7', 'SPORT Fashion Sneakers For Men - Gray', 83, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(48, 'Shoes8', 'Shoes8', 'SPORT Fashion Sneakers For Men - Gray', 91, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(49, 'Shoes9', 'Shoes9', 'SPORT Fashion Sneakers For Men - Gray', 85, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(50, 'Shoes10', 'Shoes10', 'SPORT Fashion Sneakers For Men - Gray', 84, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(51, 'Shoes11', 'Shoes11', 'SPORT Fashion Sneakers For Men - Gray', 81, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(52, 'Shoes12', 'Shoes12', 'SPORT Fashion Sneakers For Men - Gray', 75, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(53, 'Shoes13', 'Shoes13', 'SPORT Fashion Sneakers For Men - Gray', 65, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(54, 'Shoes14', 'Shoes14', 'SPORT Fashion Sneakers For Men - Gray', 78, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(55, 'Shoes15', 'Shoes15', 'SPORT Fashion Sneakers For Men - Gray', 71, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(56, 'Shoes16', 'Shoes16', 'SPORT Fashion Sneakers For Men - Gray', 85, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(57, 'Shoes17', 'Shoes17', 'SPORT Fashion Sneakers For Men - Gray', 62, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:18', '2020-06-04 14:02:18'),
(58, 'Shoes18', 'Shoes18', 'SPORT Fashion Sneakers For Men - Gray', 82, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(59, 'Shoes19', 'Shoes19', 'SPORT Fashion Sneakers For Men - Gray', 93, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19');
INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `description`, `image`, `featured`, `created_at`, `updated_at`) VALUES
(60, 'Shoes20', 'Shoes20', 'SPORT Fashion Sneakers For Men - Gray', 87, 'Color : White & Red\n                                    Material : Mixed\n                                    Size : 45 EU\n                                    Targeted Group : Men\n                                    Style : Fashion Sneakers\n                                    Occasion : Casual Shoe', 'products/June2020/ecLT6VqmUvM2o5UiCc9u.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(61, 'Watch1', 'Watch1', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, '<p>Brand: Casio Model Number: W-735H-2AV Watch Type: Sport Watch Watch Shape: Round Movement: Quartz Display Type: Digital Dial Color: Black Dial Window Material: Resin Case Material: Resin Case Diameter: 51.4 mm Case Thickness: 16.1 mm Band Material: Resin</p>', 'products\\June2020\\6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 19:35:57'),
(62, 'Watch2', 'Watch2', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(63, 'Watch3', 'Watch3', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(64, 'Watch4', 'Watch4', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(65, 'Watch5', 'Watch5', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(66, 'Watch6', 'Watch6', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(67, 'Watch7', 'Watch7', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(68, 'Watch8', 'Watch8', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:19', '2020-06-04 14:02:19'),
(69, 'Watch9', 'Watch9', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(70, 'Watch10', 'Watch10', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(71, 'Watch11', 'Watch11', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(72, 'Watch12', 'Watch12', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(73, 'Watch13', 'Watch13', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(74, 'Watch14', 'Watch14', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(75, 'Watch15', 'Watch15', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(76, 'Watch16', 'Watch16', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(77, 'Watch17', 'Watch17', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(78, 'Watch18', 'Watch18', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(79, 'Watch19', 'Watch19', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20'),
(80, 'Watch20', 'Watch20', 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz', 99, 'Brand: Casio\n                                    Model Number: W-735H-2AV\n                                    Watch Type: Sport Watch\n                                    Watch Shape: Round\n                                    Movement: Quartz\n                                    Display Type: Digital\n                                    Dial Color: Black\n                                    Dial Window Material: Resin\n                                    Case Material: Resin\n                                    Case Diameter: 51.4 mm\n                                    Case Thickness: 16.1 mm\n                                    Band Material: Resin', 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg', 0, '2020-06-04 14:02:20', '2020-06-04 14:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-06-04 14:03:55', '2020-06-04 14:03:55'),
(2, 'user', 'Normal User', '2020-06-04 14:09:49', '2020-06-04 14:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Laravel E-commerce', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'An E-commerce Application made with Laravel', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\June2020\\eBtoqpU2WklWY6QmFbfx.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', NULL, '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Laravel E-commerce App', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Samy', 'samy@email.com', 'users/default.png', NULL, '$2y$10$8LSON1lJnQl7v9jR4v8..OJ4wLMlsoK12zm23bXnwS5H1Wwfi0oHO', 'yJdSfl7yv7EGtNg0p7myFvTtw3WEfshDQ41WJjSCN9anRkyFimHtYqhc3rqW', NULL, '2020-06-04 14:03:55', '2020-06-04 14:03:55'),
(2, 2, 'Ahmed', 'ahmed@email.com', 'users/default.png', NULL, '$2y$10$cvsOSlAFqVeFw0JeCkFPyepr0ALWVT9Pd4NxG/60chBLqw0fkMogO', NULL, NULL, '2020-06-11 09:31:00', '2020-06-11 09:31:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_categories`
--
ALTER TABLE `app_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_categories_name_unique` (`name`),
  ADD UNIQUE KEY `app_categories_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_categories`
--
ALTER TABLE `app_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `app_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
