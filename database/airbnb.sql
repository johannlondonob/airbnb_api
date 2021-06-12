-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2021 at 10:56 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airbnb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_property` int(11) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `guests` int(11) NOT NULL,
  `vehicle` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `booked` varchar(1) NOT NULL DEFAULT 'S',
  `active` varchar(1) NOT NULL DEFAULT 'S',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `id_user`, `id_property`, `check_in`, `check_out`, `guests`, `vehicle`, `children`, `booked`, `active`, `created_at`, `updated_at`) VALUES
(3, 8, 32, '2021-06-12 11:21:01', '2021-06-14 11:21:01', 2, 1, 1, 'S', 'S', '2021-06-05 11:21:57', '2021-06-05 11:21:57'),
(7, 11, 1, '2021-06-11 00:00:00', '2021-06-19 00:00:00', 1, 1, 0, 'N', 'S', '2021-06-11 23:00:26', '2021-06-11 23:10:15'),
(10, 6, 1, '2021-06-20 00:00:00', '2021-06-22 00:00:00', 3, 0, 3, 'N', 'S', '2021-06-11 23:04:28', '2021-06-12 03:49:01'),
(11, 11, 7, '2021-06-15 00:00:00', '2021-06-20 00:00:00', 2, 1, 0, 'S', 'S', '2021-06-11 23:06:49', '2021-06-11 23:06:49'),
(13, 11, 9, '2021-06-11 00:00:00', '2021-06-23 00:00:00', 1, 1, 0, 'S', 'S', '2021-06-11 23:09:27', '2021-06-11 23:09:27'),
(15, 6, 4, '2021-06-12 00:00:00', '2021-06-14 00:00:00', 3, 1, 2, 'S', 'S', '2021-06-12 02:43:03', '2021-06-12 02:43:03'),
(16, 6, 15, '2021-06-14 00:00:00', '2021-06-16 00:00:00', 2, 1, 0, 'S', 'S', '2021-06-12 03:48:08', '2021-06-12 03:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `id_document_type` int(11) NOT NULL,
  `document_type` varchar(3) NOT NULL,
  `document` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `document_is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`id_document_type`, `document_type`, `document`, `created_at`, `updated_at`, `document_is_active`) VALUES
(1, 'CC', 'CÉDULA DE CIUDADANÍA', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(2, 'NIT', 'NÚMERO DE IDENTIFICACIÓN TRIBUTARIA', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(3, 'PA', 'PASAPORTE', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(4, 'CE', 'CÉDULA DE EXTRANJERÍA', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(5, 'TI', 'TARJETA DE IDENTIDAD', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1),
(6, 'RC', 'REGISTRO CIVIL', '2020-06-19 00:00:00', '2020-06-19 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id_property` int(11) NOT NULL,
  `property_title` varchar(100) NOT NULL,
  `id_property_type` int(11) NOT NULL,
  `property_address` varchar(100) NOT NULL,
  `property_rooms` tinyint(4) NOT NULL,
  `property_price` float NOT NULL,
  `property_area` varchar(50) NOT NULL,
  `property_description` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `property_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id_property`, `property_title`, `id_property_type`, `property_address`, `property_rooms`, `property_price`, `property_area`, `property_description`, `created_at`, `updated_at`, `property_is_active`, `deleted_at`) VALUES
(1, 'EL ÁNGEL', 1, '873 Locuhi Heights', 3, 203000000, '133', 'EN UNA UBICACIÓN MUY CENTRAL', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(2, 'MI SUEÑO', 2, '1424 Fibwo Road', 5, 120304000, '116', 'jefapipinejicnubacazewwotevoza', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(3, 'BOHEMÍA', 2, '385 Wanoh Heights', 4, 180558000, '120', 'ubobaafucuseboghezcaguscaebboj', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(4, 'EL CÓNDOR', 2, '1631 Giroj Road', 6, 100227000, '146', 'koebespakojsegdozaczakuzascato', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(5, 'LAS MARIANITAS', 5, '566 Cisoha Way', 2, 208402000, '164', 'keledwemocaadiugumogagnivoedea', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(6, 'ALTOS DE ESCOCIA', 3, '564 Pusha Point', 6, 219654000, '233', 'rewihuznokewukerruulobociemuiv', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(7, 'FINCA LA TOSCANA', 2, '1530 Gugtot Terrace', 6, 150000, '102', 'Casa finca con amplios espacios verdes, con senderos y canchas de fútbol, voley y baloncesto. Cuenta con piscina y zonas de descanso. Habitaciones muy cómodas con buena luz natural', '2020-06-19 00:00:00', '2021-05-21 12:11:24', 1, '2021-05-21 12:11:24'),
(8, 'BODEGAS SAN JOSÉ', 4, '269 Obinor Ridge', 3, 229311000, '131', 'avzilopamiliudjiwgarbekmemnojo', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(9, 'LAS ACACIAS', 6, '1431 Duska Square', 3, 107192000, '188', 'ohumahpinosoogjaftaosigukizuwe', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(10, 'PRIMAVERA ALTA', 2, '1216 Igik Point', 2, 117436000, '173', 'sohdovuvfufirfehginelgowirmosa', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(11, 'EL RINCÓNCITO', 2, '817 Daaz Grove', 2, 105730000, '151', 'ririrufedafoevjevajokesumlorum', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(12, 'BENDITA SEAS', 3, '1233 Cimdu Plaza', 5, 116998000, '210', 'oshibbuhkalednegzeluhbikikisaz', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(13, 'BODEGAS ALTAMIRA', 5, '1371 Mozpe Terrace', 6, 207067000, '205', 'latwekkurawovanozafuvajejroazs', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(14, 'CASANARE', 4, '28 Wisnot Square', 5, 136587000, '157', 'mozudaamjewturuefigifaohotiznu', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(15, 'LA SIRENA', 2, '1186 Kovzac Boulevard', 3, 176680000, '149', 'mupelpajnomnaficagidasusevajav', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '2021-06-05 15:47:02'),
(16, 'RÍOS DE AZUL', 3, '1092 Tiste Terrace', 4, 89237900, '242', 'feesugazbaeflumorvetetazafnulu', '2020-06-19 00:00:00', '2021-06-05 15:47:02', 1, '0000-00-00 00:00:00'),
(17, 'LOS REYES II', 1, '1280 Rocsu Grove', 4, 126848000, '184', 'gituzluruvutegizsevekgisjepefw', '2020-06-19 00:00:00', '2021-06-05 15:49:46', 1, '2021-06-05 15:49:46'),
(18, 'SAN BARTOLOMÉ II', 5, '897 Poov Extension', 4, 85199600, '235', 'bupivhalvudhemecvewkasmitamipz', '2020-06-19 00:00:00', '2021-06-05 15:49:46', 1, '2021-06-05 15:49:46'),
(19, 'BLANCOAZUL', 3, '1568 Bebram Extension', 2, 220045000, '213', 'vorosbadhavovofvasdullabigogeg', '2020-06-19 00:00:00', '2021-06-05 15:49:46', 1, '2021-06-05 15:49:46'),
(20, 'SAN IGNACIO', 5, '547 Wacmi Pike', 6, 172392000, '166', 'numnokukebpazwiwevesofazbosuze', '2020-06-19 00:00:00', '2021-06-05 15:49:46', 1, '2021-06-05 15:49:46'),
(21, 'EL PICACHO', 2, '1241 Taiku Place', 6, 241924000, '128', 'naikfekubufocruetusisobkubhudv', '2020-06-19 00:00:00', '2021-06-05 15:49:46', 1, '2021-06-05 15:49:46'),
(22, 'LOS MARTÍNEZ', 1, '409 Mimmiz Square', 3, 107533000, '110', 'gigizasumbulahwigcakupofedotas', '2020-06-19 00:00:00', '2021-06-05 15:49:46', 1, '2021-06-05 15:49:46'),
(23, 'LYON GARZA', 6, '911 Nivjoj Trail', 1, 151577000, '131', 'botirgoltuhjudedujnemupobowidi', '2020-06-19 00:00:00', '2021-06-05 15:49:46', 1, '2021-06-05 15:49:46'),
(24, 'LAS LIBÉLULAS', 4, 'AQUI CUALQUIER DIRECCION', 6, 220000, '120', 'AQUI CUALQUIER DESCRIPCIÓN', '2020-06-19 00:00:00', '2021-06-05 15:49:46', 1, '2021-06-05 15:49:46'),
(25, 'EL SOLAR', 2, '1218 Ibhav Loop', 3, 188961000, '146', 'odwojifniclavardukhaomvortanuh', '2020-06-19 00:00:00', '2021-06-05 15:49:46', 1, '2021-06-05 15:49:46'),
(26, 'Z', 6, '662 Cokibu Street', 6, 229377000, '195', 'hevamjoripzodbuhtobacuozemomil', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(27, 'AA', 6, '1013 Zauji Pike', 4, 125343000, '139', 'zienosimujosigijajrochilsajhan', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(28, 'AB', 1, '714 Hune Loop', 1, 164046000, '201', 'bimifukekoefojoefzenenrobvufpi', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(29, 'AC', 6, '1610 Lelen Road', 4, 84439700, '235', 'wuzafelowiobjejuemolempobebupe', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(30, 'AD', 3, '391 Wewse View', 2, 167619000, '222', 'puirvidikhuhjuredjafufimwimruk', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(31, 'AE', 5, '1720 Webe Way', 4, 155501000, '100', 'dejbefertigcuofkeulbikpesawpec', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(32, 'AF', 6, '1278 Kebrib Grove', 6, 211388000, '119', 'kahogomiwufenecetzaupomatsuugi', '2020-06-19 00:00:00', '2020-06-19 12:28:09', 1, NULL),
(33, 'YA TU SABE', 2, 'CR 58 SUR 4 KLL 22', 4, 30000, '78.7', 'TA TA TA TA TA TA TA TA TA', '2020-06-24 09:38:37', '2020-06-24 09:38:37', 1, NULL),
(34, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 13:47:41', '2020-06-25 13:47:41', 1, NULL),
(35, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 14:40:23', '2020-06-25 14:40:23', 1, NULL),
(36, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 14:41:29', '2020-06-25 14:41:29', 1, NULL),
(37, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 14:45:59', '2020-06-25 14:45:59', 1, NULL),
(38, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 14:46:37', '2020-06-25 14:46:37', 1, NULL),
(39, 'AQUI CUALQUIER TITULO DE LA PROPIEDAD', 6, 'AQUI CUALQUIER DIRECCION', 6, 220000, '120', 'AQUI CUALQUIER DESCRIPCIÓN', '2020-06-25 15:02:34', '2020-06-29 15:43:36', 1, '2020-06-29 15:43:36'),
(40, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 15:53:16', '2020-06-25 15:53:16', 1, NULL),
(41, 'Ja ja nino lerdo', 6, 'Je je kals loe i', 1, 51000, '10', 'jae jañdasdadadade', '2020-06-25 15:54:48', '2020-06-29 11:27:28', 1, '2020-06-29 11:27:28'),
(42, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 15:55:58', '2020-06-25 15:55:58', 1, NULL),
(43, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 15:58:57', '2020-06-25 15:58:57', 1, NULL),
(44, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 16:00:26', '2020-06-25 16:00:26', 1, NULL),
(45, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '-78.7', 'TI TI TITITITIT', '2020-06-25 16:03:54', '2020-06-25 16:03:54', 1, NULL),
(46, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '78.7', 'TI TI TITITITIT', '2020-06-29 11:45:58', '2020-06-29 11:45:58', 1, NULL),
(47, 'YA TU SABE ASDF', 6, 'CR 58 - 9 SUR 4 KLL 22', 2, 31200, '78.7', 'TI TI TITITITIT', '2020-06-29 11:59:40', '2020-06-29 11:59:40', 1, NULL),
(48, 'AQUI CUALQUIER TITULO DE LA PROPIEDAD', 2, 'AQUI CUALQUIER DIRECCION', 4, 49000, '180.5', 'AQUI CUALQUIER DESCRIPCIÓN', '2020-06-29 15:21:27', '2020-06-29 15:21:27', 1, NULL),
(62, 'AMARRAO', 3, 'VEREDA LA FINA', 6, 75000, '227', 'QUÉ EFECTOS TENDRÍA ESA DECLARACIÓN?', '2021-06-11 16:06:34', '2021-06-11 16:06:34', 1, NULL),
(63, 'LA FRANCIA', 1, 'CALI', 3, 55000, '37', 'LA REDADA', '2021-06-11 16:12:59', '2021-06-11 16:12:59', 1, NULL),
(64, 'TONIGHT', 2, 'CR 92 # 43 INT 7', 3, 96000, '48', 'I MEET YOU', '2021-06-11 21:03:43', '2021-06-11 21:03:43', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_type`
--

CREATE TABLE `property_type` (
  `id_property_type` int(11) NOT NULL,
  `property_type` varchar(50) NOT NULL,
  `property_type_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_type`
--

INSERT INTO `property_type` (`id_property_type`, `property_type`, `property_type_is_active`, `created_at`, `updated_at`) VALUES
(1, 'CASA', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(2, 'APARTAMENTO', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(3, 'FINCA', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(4, 'LOCAL COMERCIAL', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(5, 'BODEGA', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00'),
(6, 'APARTA-ESTUDIO', 1, '2020-06-19 00:00:00', '2020-06-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `property_user`
--

CREATE TABLE `property_user` (
  `id_user` int(20) NOT NULL,
  `id_property` int(11) NOT NULL,
  `property_user_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_user`
--

INSERT INTO `property_user` (`id_user`, `id_property`, `property_user_is_active`, `created_at`, `updated_at`) VALUES
(8, 1, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(6, 2, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(6, 3, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(6, 4, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(8, 6, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(6, 7, 1, '2021-05-27 09:57:07', '2021-05-27 09:57:07'),
(7, 8, 1, '2021-05-27 10:32:13', '2021-05-27 10:32:13'),
(7, 9, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(6, 11, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(8, 12, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(8, 13, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(8, 14, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(6, 15, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(7, 17, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(7, 20, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(7, 22, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(7, 23, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(7, 24, 1, '2021-06-05 15:53:26', '2021-06-05 15:53:26'),
(8, 27, 1, '2021-05-27 10:31:41', '2021-05-27 10:31:41'),
(7, 30, 1, '2021-05-27 10:32:13', '2021-05-27 10:32:13'),
(8, 41, 1, '2021-05-27 10:31:41', '2021-05-27 10:31:41'),
(6, 62, 1, '2021-06-11 16:06:34', '2021-06-11 16:06:34'),
(6, 63, 1, '2021-06-11 16:12:59', '2021-06-11 16:12:59'),
(11, 64, 1, '2021-06-11 21:03:43', '2021-06-11 21:03:43');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `user_lastname` varchar(40) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `id_document_type` int(11) NOT NULL,
  `user_identification` varchar(15) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `user_name`, `user_lastname`, `user_email`, `id_document_type`, `user_identification`, `user_password`, `user_is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'JOHAN ALEXANDER', 'LONDOÑO BEDOYA', 'johannlondonob@gmail.com', 1, '1026154301', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:32:24', NULL),
(2, 'DIEGO FERNANDO', 'AGUDELO AGUDELO', 'diegofer199@gmail.com', 1, '1023121454', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(3, 'MARÍA LA DEL BARRIO', 'GARCÍA', 'maribarrio0909@gmail.com', 1, '1029890122', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(4, 'MARLON ALEXIS', 'LONDOÑO BEDOYA', 'marlon1099@hotmail.com', 1, '1021143001', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(5, 'ANDRÉS FELIPE', 'RENDÓN ZAPATA', 'anfe0595@gmail.com', 1, '1026543333', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(6, 'SANTIAGO', 'ARIAS CORREA', 'sac1995@gmail.com', 1, '1023676234', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(7, 'CARLOS STEEVEN', 'JARAMILLO', 'csjaramillo@gmail.com', 1, '80966533', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(8, 'MAYELLI', 'GRISALES', 'mayellimayelli@gmail.com', 1, '1032545330', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(9, 'MARÍA ALEJANDRA', 'CORDERO SILVA', 'corderosilvaale@gmail.com', 1, '1022654996', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(10, 'JENNY', 'ROJAS ROJAS', 'jrojasj@gmail.com', 1, '1025443441', '1234567890', 1, '2020-06-19 00:00:00', '2020-06-22 18:33:00', NULL),
(11, 'JUAN JOSÉ', 'LONDOÑO MONTOYA', 'juanjo@gmail.com', 5, '123456789012345', '12345678', 1, '2020-06-23 15:55:28', '2020-06-23 15:55:28', NULL),
(12, 'LINDAY EDILMA', 'MONCADA ARREDONDO', 'lindayedilma@outlook.com', 1, '57839022', '*12345*1', 1, '2020-06-24 07:50:56', '2020-06-24 07:50:56', NULL),
(13, 'JULIAN ALBERTO', 'GOMEZ BOLANOS', 'julialberto@hotmail.com', 3, 'A943D0S223H1', '*2$88545\\', 1, '2020-06-24 08:11:46', '2020-06-24 08:11:46', NULL),
(18, 'VALENTINA', 'LONDONO MONTOYA', 'valentinalondomontoya@gmail.com', 5, '10294039124', '%9fsf&/as1', 1, '2020-06-24 10:41:45', '2020-06-24 10:41:45', NULL),
(19, 'VALENTINA', 'LONDONO MONTOYA', 'valentinalondomotoya@gmail.com', 1, '1yy0294039124', '%9fsf&/as1', 1, '2020-06-24 15:43:46', '2020-06-24 15:43:46', NULL),
(20, 'VALENTINA', 'LONDONO MONTOYA', 'valentialondomotoya@gmail.com', 1, '1024039124', '%9fsf&/as1', 1, '2020-06-29 11:46:42', '2020-06-29 11:46:42', NULL),
(21, 'AQUI CUALQUIER NOMBRE', 'AQUI CUALQUIER APELLIDO', 'gomezfsd09@gmail.com', 1, '213345345234', 'UAL¡UIER&CLAVE', 1, '2020-06-29 15:13:17', '2020-06-29 15:13:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `identification`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'JOHAN ALEXANDER', 'LONDOÑO BEDOYA', '1026154301', 'jlondono@arketops.com', NULL, '$2y$10$8Ak.Na9cZDw1CgTsPZsODeVHenc2u8b.hZgQ3C38BIRKj/9CbK3S6', NULL, '2021-05-27 00:23:15', '2021-05-27 00:23:15'),
(7, 'PATRICIA MARIA', 'BEDOYA ARENAS', '43687173', 'patri@arenas.com', NULL, '$2y$10$A/4XLgbR5G3yLDHm6NLiYuWAFAsKdm/13MxRUGpza4.O2RWj/04DK', NULL, '2021-05-27 20:27:05', '2021-05-27 20:27:05'),
(8, 'CESAR AUGUSTO', 'LONDOÑO MONCADA', '71982033', 'augusto@moncada.com', NULL, '$2y$10$sePfN5NEZ/HmwnRhquR5uuE.kDGbz8QU8tuO7ylCj16eBRAmO92Zm', NULL, '2021-05-27 20:28:47', '2021-05-27 20:28:47'),
(9, 'ÁNGELA PATRICIA', 'CÓRDOBA ÚSUGA', '1017890121', 'angelausuga@arketops.com', NULL, '$2y$10$4nFBp8QsEsdC26OCdb7n5u/fqZVJaJCRypOJoZxeFmu9DmRXfyKN6', NULL, '2021-06-10 03:42:43', '2021-06-10 03:42:43'),
(10, 'JENNY PAOLA', 'ROJAS PINEDA', '1017899087', 'jennyrojas@arketops.com', NULL, '$2y$10$/i6/He1RY4LAH1h6RygGKup8ANlMBauxC71K1gCWE/GcbazQPZ1JK', NULL, '2021-06-12 01:56:09', '2021-06-12 01:56:09'),
(11, 'ANGIE MILENA', 'TABARES', '1025167889', 'angietabares@arketops.com', NULL, '$2y$10$29zx2Ssk3Hm08pGQy8gETu1wmIZmhZkLqqyYnFlyeMTJeCTusQuYW', NULL, '2021-06-12 02:00:32', '2021-06-12 02:00:32'),
(12, 'QWERTY', 'QWERTY', '10101010101010', 'qwerty@qwerty.com', NULL, '$2y$10$j/E77uf9HYabM3JjcBLiUOypBe9goPG7wD4/s4gKwq6xo2tXmb/Vm', NULL, '2021-06-12 07:13:22', '2021-06-12 07:13:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_user` (`id_user`),
  ADD KEY `booking_property` (`id_property`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`id_document_type`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id_property`),
  ADD KEY `id_property_type` (`id_property_type`);

--
-- Indexes for table `property_type`
--
ALTER TABLE `property_type`
  ADD PRIMARY KEY (`id_property_type`);

--
-- Indexes for table `property_user`
--
ALTER TABLE `property_user`
  ADD UNIQUE KEY `id_property` (`id_property`),
  ADD KEY `property_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `id_document_type` (`id_document_type`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id_document_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id_property` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `property_type`
--
ALTER TABLE `property_type`
  MODIFY `id_property_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `booking_property` FOREIGN KEY (`id_property`) REFERENCES `property` (`id_property`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`id_property_type`) REFERENCES `property_type` (`id_property_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `property_user`
--
ALTER TABLE `property_user`
  ADD CONSTRAINT `property_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `property_user_ibfk_2` FOREIGN KEY (`id_property`) REFERENCES `property` (`id_property`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_document_type`) REFERENCES `document_type` (`id_document_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
