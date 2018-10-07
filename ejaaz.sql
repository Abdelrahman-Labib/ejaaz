-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2018 at 09:57 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ejaaz`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Index', 'fa-bar-chart', '/', NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2018-08-05 18:10:22', '2018-08-05 18:10:22'),
(2, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-05 18:13:23', '2018-08-05 18:13:23'),
(3, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2018-08-05 18:13:25', '2018-08-05 18:13:25'),
(4, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2018-08-05 18:15:17', '2018-08-05 18:15:17'),
(5, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":\"karim\",\"email\":\"karim.elbadry2@gmail.com\",\"password\":\"karim2010\",\"type\":\"2\",\"country\":\"Egypt\",\"city\":\"Cairo\",\"address\":\"asdfasdf\",\"phone\":\"54645645465\",\"_token\":\"5BJEQWiphEsJZi80kwCuc6UkohRAB70jQuMGeyjP\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2018-08-05 18:16:09', '2018-08-05 18:16:09'),
(6, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2018-08-05 18:16:09', '2018-08-05 18:16:09'),
(7, 1, 'admin', 'GET', '10.5.50.51', '[]', '2018-08-23 08:16:01', '2018-08-23 08:16:01'),
(8, 1, 'admin/courses', 'GET', '10.5.50.51', '[]', '2018-08-23 08:32:29', '2018-08-23 08:32:29'),
(9, 1, 'admin/courses/create', 'GET', '10.5.50.51', '{\"_pjax\":\"#pjax-container\"}', '2018-08-23 08:32:37', '2018-08-23 08:32:37'),
(10, 1, 'admin/courses', 'POST', '10.5.50.51', '{\"Title\":\"Course1\",\"user_id\":\"1\",\"category_id\":\"1\",\"type\":\"2\",\"Description\":\"asdfasdf\",\"address\":\"asdfs\",\"price\":\"23.00\",\"_token\":\"eF9eWxJerMjIOxULOiTif5UBTLb1axAlQmrPi6SX\",\"_previous_\":\"http:\\/\\/10.5.50.51\\/admin\\/courses\"}', '2018-08-23 08:33:05', '2018-08-23 08:33:05'),
(11, 1, 'admin/courses/create', 'GET', '10.5.50.51', '[]', '2018-08-23 08:33:09', '2018-08-23 08:33:09'),
(12, 1, 'admin/courses', 'POST', '10.5.50.51', '{\"Title\":\"Course1\",\"user_id\":\"1\",\"category_id\":\"1\",\"type\":\"2\",\"Description\":\"asdfasdf\",\"address\":\"asdfs\",\"price\":\"23.00\",\"_token\":\"eF9eWxJerMjIOxULOiTif5UBTLb1axAlQmrPi6SX\"}', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(13, 1, 'admin/courses', 'GET', '10.5.50.51', '[]', '2018-08-23 08:33:38', '2018-08-23 08:33:38'),
(14, 1, 'admin', 'GET', '10.5.50.76', '[]', '2018-08-26 08:22:18', '2018-08-26 08:22:18'),
(15, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 08:32:21', '2018-08-26 08:32:21'),
(16, 1, 'admin/courses/1/edit', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\"}', '2018-08-26 08:35:46', '2018-08-26 08:35:46'),
(17, 1, 'admin/courses/1', 'PUT', '10.5.50.76', '{\"Title\":null,\"user_id\":\"1\",\"category_id\":\"1\",\"type\":\"2\",\"Description\":null,\"address\":\"asdfs\",\"price\":\"23.00\",\"_token\":\"NPEkT6CZd813SttFKA2khDqLkSt9f5d8KjUuCqyO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/10.5.50.76\\/admin\\/courses\"}', '2018-08-26 08:36:19', '2018-08-26 08:36:19'),
(18, 1, 'admin/courses/1/edit', 'GET', '10.5.50.76', '[]', '2018-08-26 08:36:19', '2018-08-26 08:36:19'),
(19, 1, 'admin/courses/1', 'PUT', '10.5.50.76', '{\"Title\":\"Title1\",\"user_id\":\"1\",\"category_id\":\"1\",\"type\":\"2\",\"Description\":\"asdf\",\"address\":\"asdfs\",\"price\":\"23.00\",\"_token\":\"NPEkT6CZd813SttFKA2khDqLkSt9f5d8KjUuCqyO\",\"_method\":\"PUT\"}', '2018-08-26 08:36:34', '2018-08-26 08:36:34'),
(20, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 08:36:34', '2018-08-26 08:36:34'),
(21, 1, 'admin/courses/1/edit', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\"}', '2018-08-26 08:36:39', '2018-08-26 08:36:39'),
(22, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\"}', '2018-08-26 08:36:45', '2018-08-26 08:36:45'),
(23, 1, 'admin/courses/1/edit', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\"}', '2018-08-26 08:37:38', '2018-08-26 08:37:38'),
(24, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\"}', '2018-08-26 08:37:40', '2018-08-26 08:37:40'),
(25, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 08:39:00', '2018-08-26 08:39:00'),
(26, 1, 'admin/courses/1/edit', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\"}', '2018-08-26 08:39:36', '2018-08-26 08:39:36'),
(27, 1, 'admin/courses/1', 'PUT', '10.5.50.76', '{\"title\":\"Title1\",\"user_id\":\"1\",\"category_id\":\"1\",\"type\":\"2\",\"Description\":null,\"address\":\"asdfs\",\"price\":\"23.00\",\"_token\":\"NPEkT6CZd813SttFKA2khDqLkSt9f5d8KjUuCqyO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/10.5.50.76\\/admin\\/courses\"}', '2018-08-26 08:39:44', '2018-08-26 08:39:44'),
(28, 1, 'admin/courses/1/edit', 'GET', '10.5.50.76', '[]', '2018-08-26 08:39:45', '2018-08-26 08:39:45'),
(29, 1, 'admin/courses/1/edit', 'GET', '10.5.50.76', '[]', '2018-08-26 08:40:05', '2018-08-26 08:40:05'),
(30, 1, 'admin/courses/1', 'PUT', '10.5.50.76', '{\"title\":\"Title1\",\"user_id\":\"1\",\"category_id\":\"1\",\"type\":\"2\",\"description\":\"asdf\",\"address\":\"asdfs\",\"price\":\"23.00\",\"_token\":\"NPEkT6CZd813SttFKA2khDqLkSt9f5d8KjUuCqyO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/10.5.50.76\\/admin\\/courses\"}', '2018-08-26 08:40:13', '2018-08-26 08:40:13'),
(31, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 08:40:13', '2018-08-26 08:40:13'),
(32, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 08:42:41', '2018-08-26 08:42:41'),
(33, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 08:42:52', '2018-08-26 08:42:52'),
(34, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 08:43:50', '2018-08-26 08:43:50'),
(35, 1, 'admin/users', 'GET', '10.5.50.76', '[]', '2018-08-26 08:47:13', '2018-08-26 08:47:13'),
(36, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 12:54:45', '2018-08-26 12:54:45'),
(37, 1, 'admin/courses/1/edit', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\"}', '2018-08-26 12:54:51', '2018-08-26 12:54:51'),
(38, 1, 'admin/courses/1', 'PUT', '10.5.50.76', '{\"title\":\"Title1\",\"user_id\":\"1\",\"category_id\":\"1\",\"type\":\"2\",\"description\":\"asdf\",\"address\":\"asdfs\",\"price\":\"23.00\",\"_token\":\"oZN19KlPCyVv7LY8XRai9pVArXQBBP4megKlG78k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/10.5.50.76\\/admin\\/courses\"}', '2018-08-26 12:55:01', '2018-08-26 12:55:01'),
(39, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 12:55:01', '2018-08-26 12:55:01'),
(40, 1, 'admin/courses', 'GET', '10.5.50.76', '[]', '2018-08-26 12:56:24', '2018-08-26 12:56:24'),
(41, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\"}', '2018-08-26 12:58:46', '2018-08-26 12:58:46'),
(42, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2018-08-26 12:58:50', '2018-08-26 12:58:50'),
(43, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\"}', '2018-08-26 12:58:54', '2018-08-26 12:58:54'),
(44, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"30\"}', '2018-08-26 12:58:59', '2018-08-26 12:58:59'),
(45, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"30\"}', '2018-08-26 12:58:59', '2018-08-26 12:58:59'),
(46, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\"}', '2018-08-26 12:59:13', '2018-08-26 12:59:13'),
(47, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\"}', '2018-08-26 12:59:27', '2018-08-26 12:59:27'),
(48, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\"}', '2018-08-26 13:00:14', '2018-08-26 13:00:14'),
(49, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\",\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2018-08-26 13:00:18', '2018-08-26 13:00:18'),
(50, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\",\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2018-08-26 13:01:01', '2018-08-26 13:01:01'),
(51, 1, 'admin/courses/31', 'DELETE', '10.5.50.76', '{\"_method\":\"delete\",\"_token\":\"oZN19KlPCyVv7LY8XRai9pVArXQBBP4megKlG78k\"}', '2018-08-26 13:01:25', '2018-08-26 13:01:25'),
(52, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\",\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2018-08-26 13:01:25', '2018-08-26 13:01:25'),
(53, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\",\"page\":\"2\"}', '2018-08-26 13:01:27', '2018-08-26 13:01:27'),
(54, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\",\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2018-08-26 13:01:58', '2018-08-26 13:01:58'),
(55, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\",\"page\":\"2\"}', '2018-08-26 13:02:00', '2018-08-26 13:02:00'),
(56, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\",\"page\":\"2\"}', '2018-08-26 13:02:50', '2018-08-26 13:02:50'),
(57, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\",\"page\":\"1\",\"_pjax\":\"#pjax-container\"}', '2018-08-26 13:02:55', '2018-08-26 13:02:55'),
(58, 1, 'admin/courses', 'GET', '10.5.50.76', '{\"per_page\":\"30\",\"page\":\"1\"}', '2018-08-26 13:03:51', '2018-08-26 13:03:51'),
(59, 1, 'admin/users/1/edit', 'GET', '10.5.50.76', '[]', '2018-08-26 17:20:18', '2018-08-26 17:20:18'),
(60, 1, 'admin/users/1', 'PUT', '10.5.50.76', '{\"name\":\"karim\",\"email\":\"karim.elbadry2@gmail.com\",\"password\":null,\"type\":\"2\",\"country\":\"Egypt\",\"city\":\"Cairo\",\"address\":\"asdfasdf\",\"phone\":\"54645645465\",\"education\":{\"new_1\":{\"name\":\"sdf\",\"institution\":\"dfvbsd\",\"start_date\":\"2018-08-29\",\"end_date\":\"2018-08-16\",\"description\":\"asdfasdf\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"S6AftEnRuWbdayjN0TUGuTm3lDNoPgWMBPfInWr0\",\"_method\":\"PUT\"}', '2018-08-26 17:20:37', '2018-08-26 17:20:37'),
(61, 1, 'admin/users', 'GET', '10.5.50.76', '[]', '2018-08-26 17:20:38', '2018-08-26 17:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2018-08-05 18:09:49', '2018-08-05 18:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$ThCCnIad/TaoOfN5ccngSuGl7eDwmdv1SNDzRYRiJcCjQJgrUpiFi', 'Administrator', NULL, NULL, '2018-08-05 18:09:49', '2018-08-05 18:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(2, 1, 2, NULL, NULL),
(3, 1, 6, NULL, NULL),
(4, 1, 18, NULL, NULL),
(5, 1, 17, NULL, NULL),
(6, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Development', '', NULL, NULL, NULL),
(2, 'Music', '', NULL, NULL, NULL),
(3, 'Game Development', '', NULL, NULL, NULL),
(4, 'IT', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `received_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `course_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'hiii', '2018-08-23 08:44:11', '2018-08-23 08:44:11'),
(2, 1, 1, 'hiii', '2018-08-23 08:47:00', '2018-08-23 08:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `expire_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/default_course.png',
  `video` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `category_id`, `type`, `title`, `img`, `video`, `description`, `price`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'Full sgf t kasdfjlksad  lkds jflka klsdfj lkadjf ksa;ld jfklasdj fklasjd klfj klsadj klf', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-26 12:55:01'),
(2, 1, 1, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(3, 1, 1, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(4, 1, 1, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(5, 1, 1, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(6, 1, 1, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(7, 1, 1, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(8, 1, 1, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(9, 1, 2, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(10, 1, 2, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(11, 1, 1, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(12, 1, 2, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(13, 1, 2, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(14, 1, 2, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(15, 1, 2, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(16, 1, 2, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(17, 1, 3, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(18, 1, 3, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(19, 1, 3, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(20, 1, 3, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(21, 1, 3, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(22, 1, 4, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(23, 1, 4, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(24, 1, 4, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(25, 1, 4, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(26, 1, 4, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(27, 1, 3, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(28, 1, 1, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(29, 1, 2, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(30, 1, 4, 2, 'Course1', 'images/IMG_8953.jpg', 'files/IMG_8953.jpg', 'asdfasdf', '23', 'asdfs', '2018-08-23 08:33:37', '2018-08-23 08:33:37'),
(32, 1, 1, 1, 'sdf', 'images/IMG_8953.jpg', 'sdf', 'sdf', '234', NULL, '2018-08-26 12:47:36', '2018-08-26 12:47:36'),
(33, 1, 4, 1, 'asdfasdfxcvxcvxc', 'images/IMG_8953.jpg', 'C:\\xampp\\tmp\\php93BD.tmp', 'bnmbnmnbm', '234', NULL, '2018-08-26 12:49:51', '2018-08-26 12:49:51'),
(34, 1, 4, 1, 'asdfasdfxcvxcvxc', 'images/IMG_8953.jpg', 'public/images/wN9ImyoWtXfEaufxj0BDUK8is8pK68NwbHqTcz3B.jpeg', 'bnmbnmnbm', '234', NULL, '2018-08-26 12:50:14', '2018-08-26 12:50:14'),
(35, 1, 1, 1, 'course121', 'images/IMG_8953.jpg', 'public/images/jiMiykcpbFjzfDrfke9lFd0zNjIEqwR5uAg5RmOu.jpeg', 'sdfgs', '34', NULL, '2018-08-26 12:52:30', '2018-08-26 12:52:30'),
(36, 1, 4, 1, 'course2', 'images/IMG_8953.jpg', 'public/images/srBR5mVxIgXymo4swl3GIJkSkSsNSFmS7pRHyRGC.jpeg', 'xvcbxcvbcx', '43', NULL, '2018-08-26 12:58:06', '2018-08-26 12:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `course_tags`
--

CREATE TABLE `course_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `user_id`, `name`, `institution`, `start_date`, `end_date`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'sdf', 'dfvbsd', '2018-08-29', '2018-08-16', 'asdfasdf', '2018-08-26 17:20:38', '2018-08-26 17:20:38'),
(2, 1, 'this.state.name', 'this.state.institution', '2018-08-16', '2018-08-16', 'sadf', '2018-08-26 17:21:01', '2018-08-26 17:21:01'),
(3, 1, 'this.state.name', 'this.state.institution', '2018-08-24', '2018-08-24', 'sadf', '2018-08-26 17:38:23', '2018-08-26 17:38:23'),
(4, 1, 'aslkdfklasdflks', 'fdgsdfgsdf', '0020-07-08', '0019-03-08', 'asdfas', '2018-08-26 17:53:54', '2018-08-26 17:53:54');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `course_id`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `joint_courses`
--

CREATE TABLE `joint_courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `joint_courses`
--

INSERT INTO `joint_courses` (`id`, `course_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL);

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
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2018_07_30_165700_create_courses_table', 1),
(5, '2018_07_30_165816_create_categories_table', 1),
(6, '2018_07_30_165831_create_tags_table', 1),
(7, '2018_07_30_165855_create_videos_table', 1),
(8, '2018_07_30_165928_create_comments_table', 1),
(9, '2018_07_30_165942_create_reviews_table', 1),
(10, '2018_07_30_170042_create_payments_table', 1),
(11, '2018_07_30_170053_create_settings_table', 1),
(12, '2018_07_30_170305_create_coupons_table', 1),
(13, '2018_07_30_170329_create_notifications_table', 1),
(14, '2018_07_30_170343_create_favorites_table', 1),
(15, '2018_07_30_171010_create_certificates_table', 1),
(16, '2018_07_30_171134_create_education_table', 1),
(17, '2018_07_30_171225_create_jobs_table', 1),
(18, '2018_07_30_223313_create_joint_courses_table', 1),
(19, '2018_07_30_224454_create_course_tags_table', 1),
(20, '2018_08_26_161230_create_carts_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `screen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('karim.elbadry2@gmail.com', '$2y$10$veoBdMKHQU7ibfYCUaz0bu0ed7eQgHuB9ifW92/YCQSFOwK3jvloG', '2018-08-06 18:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/default.png',
  `status` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `type`, `country`, `city`, `address`, `phone`, `img`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, 'karim', 'karim.elbadry2@gmail.com', '$2y$10$5CTy6fntT8BCRwNJ5WSI..biXiTd/kstvES/vfFBGWW95NTDTYNzW', NULL, 2, 'Egypt', 'Cairo', 'asdfasdf', '54645645465', 'images/default.png', 1, 1, '2018-08-05 18:16:09', '2018-08-05 18:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_tags`
--
ALTER TABLE `course_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joint_courses`
--
ALTER TABLE `joint_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `course_tags`
--
ALTER TABLE `course_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `joint_courses`
--
ALTER TABLE `joint_courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
