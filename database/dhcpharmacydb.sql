-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 28, 2025 at 05:30 AM
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
-- Database: `dhcpharmacydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `github_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `role` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `facebook_id`, `google_id`, `github_id`, `password`, `photo`, `phone`, `address`, `dob`, `branch_id`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Shamim', 'valobashi.tumake9999@gmail.com', NULL, NULL, NULL, '$2y$12$luVtfd.rmtn8WXN9gW56Wu4lnaBntoyLEtDAEbM3SYWjR0FF32uCa', NULL, NULL, NULL, NULL, 0, 1, 1, '2025-12-26 17:26:28', '2025-12-26 17:26:28'),
(2, 'xyz', 'dhcpharmacy022@gmail.com', NULL, NULL, NULL, '$2y$12$gd5vRmcySAzG56VTy60Yku.cDvJw8FOMHYaozrULkxiCWn2CWtk9e', NULL, NULL, NULL, NULL, 0, 1, 1, '2025-12-26 17:30:02', '2025-12-26 17:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Square', 'Square Pharmaceuticals Ltd.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(2, 'Incepta', 'Incepta Pharmaceuticals Ltd.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(3, 'Beximco', 'Beximco Pharmaceuticals Ltd.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(4, 'ACME', 'ACME Laboratories Ltd.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(5, 'Opsonin', 'Opsonin Pharma Ltd.', '2025-12-27 04:56:39', '2025-12-27 04:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `unit_price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `exp_date` date NOT NULL,
  `mfg_date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `reg`, `date`, `user_id`, `medicine_id`, `qty`, `unit_price`, `total_price`, `exp_date`, `mfg_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 20251227010001, '2025-12-27', 1, 10, 1, 41, 41, '2026-10-17', '2025-01-25', '1', '2025-12-27 04:58:55', '2025-12-27 04:58:55'),
(2, 20251227010001, '2025-12-27', 1, 25, 1, 25, 25, '2026-12-27', '2025-11-27', '1', '2025-12-27 04:58:56', '2025-12-27 04:58:56'),
(3, 20251227010001, '2025-12-27', 1, 3, 1, 5, 5, '2026-12-27', '2025-11-27', '1', '2025-12-27 04:58:57', '2025-12-27 04:58:57'),
(4, 20251227010001, '2025-12-27', 1, 14, 1, 5, 5, '2026-12-27', '2025-08-27', '1', '2025-12-27 04:58:58', '2025-12-27 04:58:58'),
(5, 20251227010001, '2025-12-27', 1, 6, 1, 20, 20, '2027-01-16', '2025-06-19', '1', '2025-12-27 04:59:00', '2025-12-27 04:59:00'),
(6, 20251227010001, '2025-12-27', 1, 9, 1, 43, 43, '2026-06-19', '2025-05-13', '1', '2025-12-27 04:59:02', '2025-12-27 04:59:02'),
(7, 20251227010001, '2025-12-27', 1, 8, 1, 40, 40, '2026-05-17', '2025-02-25', '1', '2025-12-27 04:59:02', '2025-12-27 04:59:02'),
(8, 20251227010001, '2025-12-27', 1, 7, 1, 29, 29, '2026-06-25', '2025-05-25', '1', '2025-12-27 04:59:03', '2025-12-27 04:59:03'),
(9, 20251227010002, '2025-12-27', 1, 10, 3, 41, 123, '2026-10-17', '2025-01-25', '1', '2025-12-27 05:09:58', '2025-12-27 05:10:13'),
(10, 20251227010002, '2025-12-27', 1, 25, 3, 25, 75, '2026-12-27', '2025-11-27', '1', '2025-12-27 05:09:58', '2025-12-27 05:10:12'),
(11, 20251227010002, '2025-12-27', 1, 3, 4, 5, 20, '2026-12-27', '2025-11-27', '1', '2025-12-27 05:09:59', '2025-12-27 05:10:11'),
(12, 20251227010002, '2025-12-27', 1, 14, 3, 5, 15, '2026-12-27', '2025-08-27', '1', '2025-12-27 05:09:59', '2025-12-27 05:10:15'),
(13, 20251227010002, '2025-12-27', 1, 6, 3, 20, 60, '2027-01-16', '2025-06-19', '1', '2025-12-27 05:10:00', '2025-12-27 05:10:16'),
(14, 20251227010002, '2025-12-27', 1, 7, 3, 29, 87, '2026-06-25', '2025-05-25', '1', '2025-12-27 05:10:00', '2025-12-27 05:10:17'),
(15, 20251227010002, '2025-12-27', 1, 8, 3, 40, 120, '2026-05-17', '2025-02-25', '1', '2025-12-27 05:10:01', '2025-12-27 05:10:19'),
(16, 20251227010002, '2025-12-27', 1, 9, 3, 43, 129, '2026-06-19', '2025-05-13', '1', '2025-12-27 05:10:01', '2025-12-27 05:10:18'),
(17, 20251227010003, '2025-12-27', 1, 10, 1, 41, 41, '2026-10-17', '2025-01-25', '1', '2025-12-27 05:22:40', '2025-12-27 05:22:40'),
(18, 20251227010003, '2025-12-27', 1, 25, 1, 25, 25, '2026-12-27', '2025-11-27', '1', '2025-12-27 05:22:41', '2025-12-27 05:22:41'),
(19, 20251227010003, '2025-12-27', 1, 3, 1, 5, 5, '2026-12-27', '2025-11-27', '1', '2025-12-27 05:22:41', '2025-12-27 05:22:41'),
(20, 20251227010003, '2025-12-27', 1, 14, 1, 5, 5, '2026-12-27', '2025-08-27', '1', '2025-12-27 05:22:41', '2025-12-27 05:22:41'),
(21, 20251227010003, '2025-12-27', 1, 6, 1, 20, 20, '2027-01-16', '2025-06-19', '1', '2025-12-27 05:22:42', '2025-12-27 05:22:42'),
(22, 20251227010003, '2025-12-27', 1, 7, 1, 29, 29, '2026-06-25', '2025-05-25', '1', '2025-12-27 05:22:43', '2025-12-27 05:22:43'),
(23, 20251227010003, '2025-12-27', 1, 8, 1, 40, 40, '2026-05-17', '2025-02-25', '1', '2025-12-27 05:22:43', '2025-12-27 05:22:43'),
(24, 20251227010003, '2025-12-27', 1, 9, 1, 43, 43, '2026-06-19', '2025-05-13', '1', '2025-12-27 05:22:44', '2025-12-27 05:22:44'),
(25, 20251227010003, '2025-12-27', 1, 12, 1, 15, 15, '2027-12-27', '2025-09-27', '1', '2025-12-27 05:22:46', '2025-12-27 05:22:46'),
(26, 20251227010003, '2025-12-27', 1, 15, 1, 20, 20, '2027-12-27', '2025-09-27', '1', '2025-12-27 05:22:47', '2025-12-27 05:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Tablet', 'Oral solid medication', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(2, 'Capsule', 'Gelatin-coated oral medication', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(3, 'Syrup', 'Liquid medication for oral use', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(4, 'Injection', 'Medication administered via injection', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(5, 'Ointment', 'Topical application medication', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(6, 'Drops', 'For eye, ear, or nasal use', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(7, 'Inhaler', 'Used for respiratory issues', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(8, 'Powder', 'Granular form for oral or suspension use', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(9, 'Suppository', 'Medication inserted into rectum or vagina', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(10, 'Lotion', 'Liquid medication for skin application', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(11, 'Spray', 'Aerosol or pump spray medication', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(12, 'Gel', 'Semi-solid medication for topical use', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(13, 'Sachet', 'Single-dose powder or liquid packs', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(14, 'IV Fluid', 'Intravenous fluids like saline or glucose', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(15, 'Vaccine', 'For immunization purposes', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(16, 'Herbal', 'Plant-based or natural medicine', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(17, 'Homeopathic', 'Alternative medicine system', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(18, 'Others', 'Other categories not listed above', '2025-12-27 04:56:39', '2025-12-27 04:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `email`, `phone`, `website`, `created_at`, `updated_at`) VALUES
(1, 'Doctors Health care & pharmacy', 'Baniachal,khalpar,Narsingdi sadar,Narsingdi.', 'dhcpharmacy022@gmail.com', '01700000000', 'www.dhcpharmacy.shop', '2025-12-27 05:27:16', '2025-12-27 05:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `excategories`
--

CREATE TABLE `excategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `excategories`
--

INSERT INTO `excategories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Utilitie', '2025-12-27 05:28:20', '2025-12-27 05:28:20'),
(2, 'Equipment', '2025-12-27 05:28:22', '2025-12-27 05:28:22'),
(3, 'Maintenance', '2025-12-27 05:28:26', '2025-12-27 05:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `catId` bigint(20) UNSIGNED NOT NULL,
  `subcatId` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `remark` text NOT NULL DEFAULT 'N/A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `catId`, `subcatId`, `userId`, `date`, `amount`, `remark`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-12-27', 600, 'N/A', '2025-12-27 05:28:53', '2025-12-27 05:28:59'),
(2, 1, 1, 1, '2025-12-27', 5500, 'N/A', '2025-12-27 05:35:06', '2025-12-27 05:35:06'),
(3, 2, 2, 1, '2025-12-27', 150, 'N/A', '2025-12-27 05:35:16', '2025-12-27 05:35:16'),
(4, 3, 3, 1, '2025-12-27', 1200, 'N/A', '2025-12-27 05:35:22', '2025-12-27 05:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(22, '2014_10_12_000000_create_users_table', 1),
(23, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(24, '2014_10_12_100000_create_password_resets_table', 1),
(25, '2019_08_19_000000_create_failed_jobs_table', 1),
(26, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(27, '2025_07_22_075738_create_categories_table', 1),
(28, '2025_07_22_075752_create_brands_table', 1),
(29, '2025_07_22_075753_create_products_table', 1),
(30, '2025_07_22_115538_create_stocks_table', 1),
(31, '2025_07_22_121128_create_payment_methods_table', 1),
(32, '2025_07_22_121129_create_admins_table', 1),
(33, '2025_07_22_121130_create_carts_table', 1),
(34, '2025_07_22_121131_create_orders_table', 1),
(35, '2025_07_24_051759_create_purchasecarts_table', 1),
(36, '2025_07_27_044159_create_suppliers_table', 1),
(37, '2025_07_27_044160_create_purchaseorders_table', 1),
(38, '2025_07_27_081722_create_purchasereturns_table', 1),
(39, '2025_07_27_105121_create_purchasereturnorders_table', 1),
(40, '2025_08_01_062928_create_excategories_table', 1),
(41, '2025_08_01_062948_create_subexcategories_table', 1),
(42, '2025_08_01_091727_create_expenses_table', 1),
(43, '2025_08_02_051037_create_companies_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reg` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `vat` decimal(12,2) DEFAULT NULL,
  `payable` decimal(12,2) DEFAULT NULL,
  `pay` decimal(12,2) DEFAULT NULL,
  `due` decimal(12,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `paymentMethod` bigint(20) UNSIGNED NOT NULL,
  `customerName` varchar(255) NOT NULL DEFAULT '0',
  `customerPhone` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date`, `user_id`, `reg`, `total`, `discount`, `vat`, `payable`, `pay`, `due`, `status`, `paymentMethod`, `customerName`, `customerPhone`, `created_at`, `updated_at`) VALUES
(1, '2025-12-27', 1, 20251227010001, 208.00, 0.00, 0.00, 208.00, 208.00, 0.00, 1, 1, '0', 0, '2025-12-27 05:07:45', '2025-12-27 05:22:13'),
(2, '2025-12-27', 1, 20251227010002, 629.00, 0.00, 0.00, 629.00, 600.00, 29.00, 3, 2, 'Shamim Hossain', 1762164746, '2025-12-27 05:10:35', '2025-12-27 05:10:35'),
(3, '2025-12-27', 1, 20251227010003, 243.00, 0.00, 0.00, 243.00, 243.00, 0.00, 2, 1, '0', 0, '2025-12-27 05:22:52', '2025-12-27 05:22:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 'Cash Payment', 1, '2025-11-07 22:24:57', '2025-11-07 22:24:57'),
(2, 'Credit Card', 'Pay via credit/debit card', 1, '2025-11-07 22:24:57', '2025-11-07 22:24:57'),
(3, 'Bkash', 'Mobile banking payment', 1, '2025-11-07 22:24:57', '2025-11-07 22:24:57'),
(4, 'Nagad', 'Mobile banking payment', 1, '2025-11-07 22:24:57', '2025-11-07 22:24:57'),
(5, 'Rocket', 'Mobile banking payment', 1, '2025-11-07 22:24:57', '2025-11-07 22:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `genericName` varchar(255) DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_price` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `manufacture_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `genericName`, `brand_id`, `category_id`, `purchase_price`, `price`, `stock`, `manufacture_date`, `expiry_date`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Napa', 'Paracetamol', 1, 1, 3, 5, 120, '2025-09-27', '2026-12-27', 'Used for fever and mild pain relief', '2025-12-27 04:56:39', '2025-12-27 06:04:14'),
(2, 'Nurofen', 'Ibuprofen', 2, 1, 1, 2, 91, '2025-10-27', '2027-12-27', 'Pain, inflammation, and fever relief', '2025-12-27 04:56:39', '2025-12-27 06:04:16'),
(3, 'Amoxil', 'Amoxicillin', 3, 2, 3, 5, 60, '2025-11-27', '2026-12-27', 'Antibiotic for bacterial infections', '2025-12-27 04:56:39', '2025-12-27 05:25:58'),
(4, 'Azimax', 'Azithromycin', 3, 2, 15, 20, 50, '2025-08-27', '2027-08-27', 'Used to treat various infections', '2025-12-27 04:56:39', '2025-12-27 05:26:00'),
(5, 'Glucophage', 'Metformin', 4, 3, 2, 3, 80, '2025-11-27', '2027-12-27', 'Used for Type 2 diabetes management', '2025-12-27 04:56:39', '2025-12-27 05:26:02'),
(6, 'Why', 'Recent', 3, 1, 15, 20, 156, '2025-06-19', '2027-01-16', 'Everybody wind because new throw box read.', '2025-12-27 04:56:39', '2025-12-27 06:04:18'),
(7, 'See', 'Wife', 1, 2, 22, 29, 176, '2025-05-25', '2026-06-25', 'Artist church professor but interview see hard word.', '2025-12-27 04:56:39', '2025-12-27 05:26:07'),
(8, 'Ask', 'Detail', 2, 4, 30, 40, 39, '2025-02-25', '2026-05-17', 'Less time nothing reflect any.', '2025-12-27 04:56:39', '2025-12-27 05:26:09'),
(9, 'Admit', 'Research', 5, 2, 30, 43, 154, '2025-05-13', '2026-06-19', 'High tough nation they actually.', '2025-12-27 04:56:39', '2025-12-27 05:26:12'),
(10, 'Human', 'Painting', 2, 2, 35, 41, 71, '2025-01-25', '2026-10-17', 'Challenge either case fill idea receive.', '2025-12-27 04:56:39', '2025-12-27 05:22:40'),
(11, 'Flagyl', 'Metronidazole', 1, 1, 6, 10, 100, '2025-10-27', '2026-12-27', 'Used to treat bacterial infections.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(12, 'Nexium', 'Esomeprazole', 2, 2, 10, 15, 79, '2025-09-27', '2027-12-27', 'Used to reduce stomach acid.', '2025-12-27 04:56:39', '2025-12-27 05:22:46'),
(13, 'Advil', 'Ibuprofen', 3, 1, 5, 8, 120, '2025-11-27', '2026-12-27', 'Pain and fever relief.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(14, 'Tylenol', 'Paracetamol', 1, 1, 3, 5, 146, '2025-08-27', '2026-12-27', 'Fever and mild pain relief.', '2025-12-27 04:56:39', '2025-12-27 05:22:41'),
(15, 'Zithromax', 'Azithromycin', 4, 2, 15, 20, 59, '2025-09-27', '2027-12-27', 'Antibiotic for infections.', '2025-12-27 04:56:39', '2025-12-27 05:22:47'),
(16, 'Ventolin', 'Salbutamol', 5, 3, 65, 90, 40, '2025-10-27', '2028-12-27', 'Used to relieve asthma symptoms.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(17, 'Claritin', 'Loratadine', 3, 1, 5, 7, 110, '2025-11-27', '2027-12-27', 'Non-drowsy allergy relief.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(18, 'Augmentin', 'Amoxicillin + Clavulanic Acid', 4, 2, 17, 25, 70, '2025-09-27', '2027-12-27', 'Broad-spectrum antibiotic.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(19, 'Prozac', 'Fluoxetine', 1, 1, 12, 18, 55, '2025-08-27', '2028-12-27', 'Used to treat depression.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(20, 'Lipitor', 'Atorvastatin', 2, 1, 15, 22, 75, '2025-10-27', '2027-12-27', 'Used to lower cholesterol.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(21, 'Xanax', 'Alprazolam', 3, 1, 20, 30, 45, '2025-11-27', '2027-12-27', 'Used for anxiety disorders.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(22, 'Lasix', 'Furosemide', 1, 1, 10, 12, 90, '2025-07-27', '2027-12-27', 'Diuretic for fluid retention.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(23, 'Synthroid', 'Levothyroxine', 2, 1, 13, 17, 60, '2025-09-27', '2028-12-27', 'Used for thyroid hormone replacement.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(24, 'Coumadin', 'Warfarin', 3, 1, 11, 20, 50, '2025-10-27', '2027-12-27', 'Blood thinner to prevent clots.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(25, 'Ambien', 'Zolpidem', 4, 1, 14, 25, 36, '2025-11-27', '2026-12-27', 'Used for short-term insomnia.', '2025-12-27 04:56:39', '2025-12-27 05:22:41'),
(26, 'Diflucan', 'Fluconazole', 5, 2, 21, 30, 70, '2025-08-27', '2027-12-27', 'Antifungal medication.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(27, 'Motrin', 'Ibuprofen', 1, 1, 5, 9, 130, '2025-09-27', '2026-12-27', 'Pain relief and anti-inflammatory.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(28, 'Plavix', 'Clopidogrel', 2, 1, 23, 28, 60, '2025-10-27', '2028-12-27', 'Prevents blood clots.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(29, 'Zoloft', 'Sertraline', 3, 1, 15, 22, 50, '2025-11-27', '2027-12-27', 'Used for depression and anxiety.', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(30, 'Keflex', 'Cephalexin', 4, 2, 13, 18, 80, '2025-10-27', '2027-12-27', 'Antibiotic for infections.', '2025-12-27 04:56:39', '2025-12-27 04:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchasecarts`
--

CREATE TABLE `purchasecarts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chalan_reg` bigint(20) UNSIGNED DEFAULT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `order_qty` int(11) NOT NULL DEFAULT 1,
  `delivery_qty` int(11) NOT NULL DEFAULT 0,
  `return_qty` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `remark` varchar(255) DEFAULT NULL,
  `purchase_price` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total_purchase_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasecarts`
--

INSERT INTO `purchasecarts` (`id`, `date`, `user_id`, `chalan_reg`, `medicine_id`, `order_qty`, `delivery_qty`, `return_qty`, `status`, `remark`, `purchase_price`, `price`, `total_purchase_price`, `created_at`, `updated_at`) VALUES
(1, '2025-12-27', 1, 20251227010001, 1, 1, 10, 0, 1, 'Ordered', 3, 5, NULL, '2025-12-27 05:24:55', '2025-12-27 05:25:47'),
(2, '2025-12-27', 1, 20251227010001, 2, 1, 1, 0, 1, 'Ordered', 1, 2, NULL, '2025-12-27 05:24:56', '2025-12-27 05:25:52'),
(3, '2025-12-27', 1, 20251227010001, 3, 1, 15, 0, 1, 'Ordered', 3, 5, NULL, '2025-12-27 05:24:56', '2025-12-27 05:25:58'),
(4, '2025-12-27', 1, 20251227010001, 4, 1, 10, 0, 1, 'Ordered', 15, 20, NULL, '2025-12-27 05:24:56', '2025-12-27 05:26:00'),
(5, '2025-12-27', 1, 20251227010001, 5, 1, 10, 0, 1, 'Ordered', 2, 3, NULL, '2025-12-27 05:24:57', '2025-12-27 05:26:02'),
(6, '2025-12-27', 1, 20251227010001, 6, 1, 10, 0, 1, 'Ordered', 15, 20, NULL, '2025-12-27 05:24:57', '2025-12-27 05:26:04'),
(7, '2025-12-27', 1, 20251227010001, 7, 1, 10, 0, 1, 'Ordered', 22, 29, NULL, '2025-12-27 05:24:58', '2025-12-27 05:26:07'),
(8, '2025-12-27', 1, 20251227010001, 8, 1, 10, 0, 1, 'Ordered', 30, 40, NULL, '2025-12-27 05:24:58', '2025-12-27 05:26:09'),
(9, '2025-12-27', 1, 20251227010001, 9, 1, 10, 0, 1, 'Ordered', 30, 43, NULL, '2025-12-27 05:24:59', '2025-12-27 05:26:12'),
(10, '2025-12-27', 1, 20251227010002, 1, 1, 10, 0, 1, 'Ordered', 3, 5, NULL, '2025-12-27 05:56:13', '2025-12-27 06:04:14'),
(11, '2025-12-27', 1, 20251227010002, 2, 1, 10, 0, 1, 'Ordered', 1, 2, NULL, '2025-12-27 05:56:14', '2025-12-27 06:04:16'),
(12, '2025-12-27', 1, 20251227010002, 6, 1, 10, 0, 1, 'Ordered', 15, 20, NULL, '2025-12-27 05:56:16', '2025-12-27 06:04:18'),
(13, '2025-12-27', 1, 20251227010003, 1, 1, 0, 0, 1, 'Ordered', 3, 5, NULL, '2025-12-27 06:04:41', '2025-12-27 06:04:41'),
(14, '2025-12-27', 1, 20251227010003, 2, 1, 0, 0, 1, 'Ordered', 1, 2, NULL, '2025-12-27 06:04:41', '2025-12-27 06:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorders`
--

CREATE TABLE `purchaseorders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_date` date NOT NULL,
  `delivary_date` date DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `chalan_reg` bigint(20) UNSIGNED NOT NULL,
  `total` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` bigint(20) UNSIGNED DEFAULT NULL,
  `vat` bigint(20) UNSIGNED DEFAULT NULL,
  `payable` bigint(20) UNSIGNED DEFAULT NULL,
  `pay` bigint(20) UNSIGNED DEFAULT NULL,
  `due` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchaseorders`
--

INSERT INTO `purchaseorders` (`id`, `order_date`, `delivary_date`, `user_id`, `supplier_id`, `chalan_reg`, `total`, `discount`, `vat`, `payable`, `pay`, `due`, `status`, `created_at`, `updated_at`) VALUES
(1, '2025-12-27', '2025-12-27', 1, 3, 20251227010001, 1216, 16, 0, 1200, 1200, 0, 4, '2025-12-27 05:25:18', '2025-12-27 05:26:36'),
(3, '2025-12-27', '2025-12-27', 1, 1, 20251227010002, 190, 0, 0, 190, 190, 0, 4, '2025-12-27 06:04:02', '2025-12-27 06:04:32'),
(4, '2025-12-27', NULL, 1, 2, 20251227010003, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-12-27 06:04:44', '2025-12-27 06:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `purchasereturnorders`
--

CREATE TABLE `purchasereturnorders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_date` date DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `chalan_reg` bigint(20) UNSIGNED NOT NULL,
  `total` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` bigint(20) UNSIGNED DEFAULT NULL,
  `vat` bigint(20) UNSIGNED DEFAULT NULL,
  `payable` bigint(20) UNSIGNED DEFAULT NULL,
  `pay` bigint(20) UNSIGNED DEFAULT NULL,
  `due` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchasereturns`
--

CREATE TABLE `purchasereturns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chalan_reg` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_price` int(11) NOT NULL,
  `return_qty` int(11) NOT NULL,
  `return_date` date NOT NULL DEFAULT '2025-12-27',
  `reason` text NOT NULL DEFAULT 'N/A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `stockIn` int(11) NOT NULL DEFAULT 0,
  `stockOut` int(11) NOT NULL DEFAULT 0,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `reg`, `date`, `medicine_id`, `stockIn`, `stockOut`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, 20251227010001, '2025-12-27', 10, 0, 1, 'Sale', 2, '2025-12-27 04:58:55', '2025-12-27 05:22:13'),
(2, 20251227010001, '2025-12-27', 25, 0, 1, 'Sale', 2, '2025-12-27 04:58:56', '2025-12-27 05:22:13'),
(3, 20251227010001, '2025-12-27', 3, 0, 1, 'Sale', 2, '2025-12-27 04:58:57', '2025-12-27 05:22:13'),
(4, 20251227010001, '2025-12-27', 14, 0, 1, 'Sale', 2, '2025-12-27 04:58:58', '2025-12-27 05:22:13'),
(5, 20251227010001, '2025-12-27', 6, 0, 1, 'Sale', 2, '2025-12-27 04:59:00', '2025-12-27 05:22:13'),
(6, 20251227010001, '2025-12-27', 9, 0, 1, 'Sale', 2, '2025-12-27 04:59:02', '2025-12-27 05:22:13'),
(7, 20251227010001, '2025-12-27', 8, 0, 1, 'Sale', 2, '2025-12-27 04:59:02', '2025-12-27 05:22:13'),
(8, 20251227010001, '2025-12-27', 7, 0, 1, 'Sale', 2, '2025-12-27 04:59:03', '2025-12-27 05:22:13'),
(9, 20251227010002, '2025-12-27', 10, 0, 3, 'Sale', 1, '2025-12-27 05:09:58', '2025-12-27 05:10:13'),
(10, 20251227010002, '2025-12-27', 25, 0, 3, 'Sale', 1, '2025-12-27 05:09:58', '2025-12-27 05:10:12'),
(11, 20251227010002, '2025-12-27', 3, 0, 4, 'Sale', 1, '2025-12-27 05:09:59', '2025-12-27 05:10:11'),
(12, 20251227010002, '2025-12-27', 14, 0, 3, 'Sale', 1, '2025-12-27 05:09:59', '2025-12-27 05:10:15'),
(13, 20251227010002, '2025-12-27', 6, 0, 3, 'Sale', 1, '2025-12-27 05:10:00', '2025-12-27 05:10:16'),
(14, 20251227010002, '2025-12-27', 7, 0, 3, 'Sale', 1, '2025-12-27 05:10:00', '2025-12-27 05:10:17'),
(15, 20251227010002, '2025-12-27', 8, 0, 3, 'Sale', 1, '2025-12-27 05:10:01', '2025-12-27 05:10:19'),
(16, 20251227010002, '2025-12-27', 9, 0, 3, 'Sale', 1, '2025-12-27 05:10:01', '2025-12-27 05:10:18'),
(17, 20251227010003, '2025-12-27', 10, 0, 1, 'Sale', 1, '2025-12-27 05:22:40', '2025-12-27 05:22:40'),
(18, 20251227010003, '2025-12-27', 25, 0, 1, 'Sale', 1, '2025-12-27 05:22:41', '2025-12-27 05:22:41'),
(19, 20251227010003, '2025-12-27', 3, 0, 1, 'Sale', 1, '2025-12-27 05:22:41', '2025-12-27 05:22:41'),
(20, 20251227010003, '2025-12-27', 14, 0, 1, 'Sale', 1, '2025-12-27 05:22:41', '2025-12-27 05:22:41'),
(21, 20251227010003, '2025-12-27', 6, 0, 1, 'Sale', 1, '2025-12-27 05:22:42', '2025-12-27 05:22:42'),
(22, 20251227010003, '2025-12-27', 7, 0, 1, 'Sale', 1, '2025-12-27 05:22:43', '2025-12-27 05:22:43'),
(23, 20251227010003, '2025-12-27', 8, 0, 1, 'Sale', 1, '2025-12-27 05:22:43', '2025-12-27 05:22:43'),
(24, 20251227010003, '2025-12-27', 9, 0, 1, 'Sale', 1, '2025-12-27 05:22:44', '2025-12-27 05:22:44'),
(25, 20251227010003, '2025-12-27', 12, 0, 1, 'Sale', 1, '2025-12-27 05:22:46', '2025-12-27 05:22:46'),
(26, 20251227010003, '2025-12-27', 15, 0, 1, 'Sale', 1, '2025-12-27 05:22:47', '2025-12-27 05:22:47'),
(27, 20251227010001, '2025-12-27', 1, 10, 0, 'Purchase', 0, '2025-12-27 05:25:47', '2025-12-27 05:25:47'),
(28, 20251227010001, '2025-12-27', 2, 1, 0, 'Purchase', 0, '2025-12-27 05:25:52', '2025-12-27 05:25:52'),
(29, 20251227010001, '2025-12-27', 3, 15, 0, 'Purchase', 0, '2025-12-27 05:25:58', '2025-12-27 05:25:58'),
(30, 20251227010001, '2025-12-27', 4, 10, 0, 'Purchase', 0, '2025-12-27 05:26:00', '2025-12-27 05:26:00'),
(31, 20251227010001, '2025-12-27', 5, 10, 0, 'Purchase', 0, '2025-12-27 05:26:02', '2025-12-27 05:26:02'),
(32, 20251227010001, '2025-12-27', 6, 10, 0, 'Purchase', 0, '2025-12-27 05:26:04', '2025-12-27 05:26:04'),
(33, 20251227010001, '2025-12-27', 7, 10, 0, 'Purchase', 0, '2025-12-27 05:26:07', '2025-12-27 05:26:07'),
(34, 20251227010001, '2025-12-27', 8, 10, 0, 'Purchase', 0, '2025-12-27 05:26:09', '2025-12-27 05:26:09'),
(35, 20251227010001, '2025-12-27', 9, 10, 0, 'Purchase', 0, '2025-12-27 05:26:12', '2025-12-27 05:26:12'),
(36, 20251227010002, '2025-12-27', 1, 10, 0, 'Purchase', 0, '2025-12-27 06:04:14', '2025-12-27 06:04:14'),
(37, 20251227010002, '2025-12-27', 2, 10, 0, 'Purchase', 0, '2025-12-27 06:04:16', '2025-12-27 06:04:16'),
(38, 20251227010002, '2025-12-27', 6, 10, 0, 'Purchase', 0, '2025-12-27 06:04:18', '2025-12-27 06:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `subexcategories`
--

CREATE TABLE `subexcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ex_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subexcategories`
--

INSERT INTO `subexcategories` (`id`, `ex_category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Electricity', '2025-12-27 05:28:30', '2025-12-27 05:28:30'),
(2, 2, 'Cleaning', '2025-12-27 05:28:35', '2025-12-27 05:28:35'),
(3, 3, 'Electricit', '2025-12-27 05:28:45', '2025-12-27 05:28:45');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact_person`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'ACI Pharmaceuticals', 'Mr. Kamal', 1712345678, 'aci@example.com', 'Tejgaon, Dhaka', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(2, 'Square Pharmaceuticals', 'Mrs. Jahanara', 1876543210, 'square@example.com', 'Mohakhali, Dhaka', '2025-12-27 04:56:39', '2025-12-27 04:56:39'),
(3, 'Beximco Pharma', 'Mr. Rahman', 1911223344, 'beximco@example.com', 'Dhanmondi, Dhaka', '2025-12-27 04:56:39', '2025-12-27 04:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`);

--
-- Indexes for table `excategories`
--
ALTER TABLE `excategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `excategories_name_unique` (`name`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_catid_foreign` (`catId`),
  ADD KEY `expenses_subcatid_foreign` (`subcatId`),
  ADD KEY `expenses_userid_foreign` (`userId`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
  ADD UNIQUE KEY `orders_reg_unique` (`reg`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_paymentmethod_foreign` (`paymentMethod`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_name_unique` (`name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `purchasecarts`
--
ALTER TABLE `purchasecarts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchaseorders_chalan_reg_unique` (`chalan_reg`),
  ADD KEY `purchaseorders_user_id_foreign` (`user_id`),
  ADD KEY `purchaseorders_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchasereturnorders`
--
ALTER TABLE `purchasereturnorders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchasereturnorders_chalan_reg_unique` (`chalan_reg`),
  ADD KEY `purchasereturnorders_user_id_foreign` (`user_id`),
  ADD KEY `purchasereturnorders_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchasereturns`
--
ALTER TABLE `purchasereturns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchasereturns_product_id_foreign` (`product_id`),
  ADD KEY `purchasereturns_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `subexcategories`
--
ALTER TABLE `subexcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subexcategories_ex_category_id_foreign` (`ex_category_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `excategories`
--
ALTER TABLE `excategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `purchasecarts`
--
ALTER TABLE `purchasecarts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchasereturnorders`
--
ALTER TABLE `purchasereturnorders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchasereturns`
--
ALTER TABLE `purchasereturns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `subexcategories`
--
ALTER TABLE `subexcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_catid_foreign` FOREIGN KEY (`catId`) REFERENCES `excategories` (`id`),
  ADD CONSTRAINT `expenses_subcatid_foreign` FOREIGN KEY (`subcatId`) REFERENCES `subexcategories` (`id`),
  ADD CONSTRAINT `expenses_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `admins` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_paymentmethod_foreign` FOREIGN KEY (`paymentMethod`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  ADD CONSTRAINT `purchaseorders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `purchaseorders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `purchasereturnorders`
--
ALTER TABLE `purchasereturnorders`
  ADD CONSTRAINT `purchasereturnorders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `purchasereturnorders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `purchasereturns`
--
ALTER TABLE `purchasereturns`
  ADD CONSTRAINT `purchasereturns_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchasereturns_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `subexcategories`
--
ALTER TABLE `subexcategories`
  ADD CONSTRAINT `subexcategories_ex_category_id_foreign` FOREIGN KEY (`ex_category_id`) REFERENCES `excategories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
