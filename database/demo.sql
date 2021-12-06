-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 06 Gru 2021, 13:22
-- Wersja serwera: 10.5.12-MariaDB-0+deb11u1
-- Wersja PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `demo`
--
CREATE DATABASE IF NOT EXISTS `demo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `demo`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addons`
--

DROP TABLE IF EXISTS `addons`;
CREATE TABLE IF NOT EXISTS `addons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `addons`
--

TRUNCATE TABLE `addons`;
--
-- Zrzut danych tabeli `addons`
--

INSERT INTO `addons` (`id`, `name`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sos ostry', '2.00', NULL, NULL, NULL),
(2, 'Baranina', '1.20', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_addon_group`
--

DROP TABLE IF EXISTS `addon_addon_group`;
CREATE TABLE IF NOT EXISTS `addon_addon_group` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `addon_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `addon_group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_addon_group_addon_id_index` (`addon_id`),
  KEY `addon_addon_group_addon_group_id_index` (`addon_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `addon_addon_group`
--

TRUNCATE TABLE `addon_addon_group`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_cart_variant`
--

DROP TABLE IF EXISTS `addon_cart_variant`;
CREATE TABLE IF NOT EXISTS `addon_cart_variant` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `addon_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_variant_addons_cart_variant_id_addon_id_unique` (`cart_id`,`addon_id`),
  KEY `cart_variant_addons_addon_id_foreign` (`addon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `addon_cart_variant`
--

TRUNCATE TABLE `addon_cart_variant`;
--
-- Zrzut danych tabeli `addon_cart_variant`
--

INSERT INTO `addon_cart_variant` (`id`, `cart_id`, `addon_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 12, 1, 3, '2021-12-06 09:40:19', '2021-12-06 09:46:44', NULL),
(12, 12, 2, 1, '2021-12-06 09:40:19', '2021-12-06 09:46:44', NULL),
(13, 13, 2, 5, '2021-12-06 09:40:19', '2021-12-06 09:46:44', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_groups`
--

DROP TABLE IF EXISTS `addon_groups`;
CREATE TABLE IF NOT EXISTS `addon_groups` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` enum('S','M','L','XL','XXL','XXXL') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'S',
  `multiple` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `required` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addon_groups_name_size_unique` (`name`,`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `addon_groups`
--

TRUNCATE TABLE `addon_groups`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_group_variant`
--

DROP TABLE IF EXISTS `addon_group_variant`;
CREATE TABLE IF NOT EXISTS `addon_group_variant` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `variant_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `addon_group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_group_variant_variant_id_index` (`variant_id`),
  KEY `addon_group_variant_addon_group_id_index` (`addon_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `addon_group_variant`
--

TRUNCATE TABLE `addon_group_variant`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `about` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `min_order_cost` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `cost` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `free_from` decimal(15,2) UNSIGNED DEFAULT 0.00,
  `on_free_from` tinyint(4) DEFAULT 0,
  `time` int(11) DEFAULT 60,
  `polygon` polygon DEFAULT NULL,
  `sorting` int(11) DEFAULT 0,
  `visible` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areas_name_restaurant_id_unique` (`name`,`restaurant_id`),
  KEY `areas_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `areas`
--

TRUNCATE TABLE `areas`;
--
-- Zrzut danych tabeli `areas`
--

INSERT INTO `areas` (`id`, `restaurant_id`, `name`, `about`, `min_order_cost`, `cost`, `free_from`, `on_free_from`, `time`, `polygon`, `sorting`, `visible`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Mokotów', 'Opis', '22.00', '5.00', '0.00', 0, 60, NULL, 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_area_id_foreign` (`area_id`),
  KEY `carts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `carts`
--

TRUNCATE TABLE `carts`;
--
-- Zrzut danych tabeli `carts`
--

INSERT INTO `carts` (`id`, `area_id`, `user_id`, `ip`, `created_at`, `updated_at`, `deleted_at`) VALUES
('555', NULL, NULL, '', '2021-12-06 07:43:24', '2021-12-06 07:43:24', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cart_variant`
--

DROP TABLE IF EXISTS `cart_variant`;
CREATE TABLE IF NOT EXISTS `cart_variant` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_variants_variant_id_foreign` (`variant_id`),
  KEY `cart_variants_cart_id_foreign` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `cart_variant`
--

TRUNCATE TABLE `cart_variant`;
--
-- Zrzut danych tabeli `cart_variant`
--

INSERT INTO `cart_variant` (`id`, `cart_id`, `variant_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, '555', 1, 3, '2021-12-06 09:40:19', '2021-12-06 09:51:18', NULL),
(13, '555', 2, 2, '2021-12-06 09:40:19', '2021-12-06 09:51:18', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `days`
--

DROP TABLE IF EXISTS `days`;
CREATE TABLE IF NOT EXISTS `days` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number` enum('1','2','3','4','5','6','7','break') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `open` time NOT NULL DEFAULT '00:00:00',
  `close` time NOT NULL DEFAULT '23:00:00',
  `closed` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `days_number_restaurant_id_unique` (`number`,`restaurant_id`),
  KEY `days_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `days`
--

TRUNCATE TABLE `days`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `failed_jobs`
--

TRUNCATE TABLE `failed_jobs`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `migrations`
--

TRUNCATE TABLE `migrations`;
--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '9000_01_01_100001_create_restaurants_table', 1),
(6, '9000_01_01_100002_create_areas_table', 1),
(7, '9000_01_01_100002_create_days_table', 1),
(8, '9000_01_01_100002_create_socials_table', 1),
(9, '9000_01_01_100003_create_addons_table', 1),
(10, '9000_01_01_100004_create_products_table', 1),
(11, '9000_01_01_100005_create_variants_table', 1),
(12, '9000_01_01_100006_create_carts_table', 1),
(13, '9000_01_01_100007_create_addon_groups_table', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `password_resets`
--

TRUNCATE TABLE `password_resets`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `personal_access_tokens`
--

TRUNCATE TABLE `personal_access_tokens`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `products`
--

TRUNCATE TABLE `products`;
--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `about`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pizza hawajska', 'pizza-hawajska', 'Opis', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT '',
  `notify_sms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `visible` tinyint(4) DEFAULT 1,
  `on_delivery` tinyint(4) DEFAULT 1,
  `break` tinyint(4) DEFAULT 0,
  `pay_money` tinyint(4) DEFAULT 1,
  `pay_pickup` tinyint(4) DEFAULT 1,
  `pay_card` tinyint(4) DEFAULT 0,
  `pay_online` tinyint(4) DEFAULT 0,
  `lng` decimal(15,6) DEFAULT 0.000000,
  `lat` decimal(15,6) DEFAULT 0.000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurants_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `restaurants`
--

TRUNCATE TABLE `restaurants`;
--
-- Zrzut danych tabeli `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `city`, `address`, `country`, `mobile`, `email`, `website`, `about`, `notify_sms`, `visible`, `on_delivery`, `break`, `pay_money`, `pay_pickup`, `pay_card`, `pay_online`, `lng`, `lat`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pizzare', 'Warszawa', '', '', '', '', '', '', '', 1, 1, 0, 1, 1, 0, 0, '0.000000', '0.000000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `socials`
--

DROP TABLE IF EXISTS `socials`;
CREATE TABLE IF NOT EXISTS `socials` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socials_name_restaurant_id_unique` (`name`,`restaurant_id`),
  KEY `socials_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `socials`
--

TRUNCATE TABLE `socials`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `users`
--

TRUNCATE TABLE `users`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `variants`
--

DROP TABLE IF EXISTS `variants`;
CREATE TABLE IF NOT EXISTS `variants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `price_sale` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `packaging` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `on_sale` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variants_product_id_size_unique` (`product_id`,`size`),
  KEY `variants_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tabela Truncate przed wstawieniem `variants`
--

TRUNCATE TABLE `variants`;
--
-- Zrzut danych tabeli `variants`
--

INSERT INTO `variants` (`id`, `product_id`, `size`, `price`, `price_sale`, `packaging`, `on_sale`, `sorting`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Mała 15cm', '9.00', '0.00', '1.00', 0, 0, NULL, NULL, NULL),
(2, 1, 'Średnia 25cm', '13.00', '0.00', '2.00', 0, 0, NULL, NULL, NULL);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `addon_addon_group`
--
ALTER TABLE `addon_addon_group`
  ADD CONSTRAINT `addon_addon_group_addon_group_id_foreign` FOREIGN KEY (`addon_group_id`) REFERENCES `addon_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addon_addon_group_addon_id_foreign` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `addon_group_variant`
--
ALTER TABLE `addon_group_variant`
  ADD CONSTRAINT `addon_group_variant_addon_group_id_foreign` FOREIGN KEY (`addon_group_id`) REFERENCES `addon_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addon_group_variant_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `cart_variant`
--
ALTER TABLE `cart_variant`
  ADD CONSTRAINT `cart_variants_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_variants_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `days`
--
ALTER TABLE `days`
  ADD CONSTRAINT `days_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `socials`
--
ALTER TABLE `socials`
  ADD CONSTRAINT `socials_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
