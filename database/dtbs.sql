-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: sql304.infinityfree.com
-- Thời gian đã tạo: Th5 31, 2026 lúc 03:32 AM
-- Phiên bản máy phục vụ: 11.4.11-MariaDB
-- Phiên bản PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `if0_42044394_phonezone`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `ho_ten` varchar(150) NOT NULL,
  `email` varchar(180) NOT NULL,
  `mat_khau` varchar(255) NOT NULL COMMENT 'bcrypt hash',
  `vai_tro` enum('superadmin','admin','nhan_vien') NOT NULL DEFAULT 'nhan_vien',
  `avatar` varchar(255) DEFAULT NULL,
  `trang_thai` tinyint(1) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `ho_ten`, `email`, `mat_khau`, `vai_tro`, `avatar`, `trang_thai`, `last_login`, `created_at`) VALUES
(1, 'Super Admin', 'admin@phonezone.vn', '$2y$10$rTLGRR9v8LpXf7Kmrh4RDOKdbgkg9WQopG7fQMrckMmLErfyATCEa', 'superadmin', NULL, 1, '2026-05-30 23:26:08', '2026-05-28 21:52:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `tieu_de` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(500) DEFAULT NULL,
  `hinh_anh` varchar(255) NOT NULL,
  `url_link` varchar(255) DEFAULT NULL,
  `vi_tri` enum('hero','popup','sidebar','footer') NOT NULL DEFAULT 'hero',
  `thu_tu` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `an_hien` tinyint(1) NOT NULL DEFAULT 1,
  `bat_dau` datetime DEFAULT NULL,
  `ket_thuc` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bien_the_san_pham`
--

CREATE TABLE `bien_the_san_pham` (
  `id` int(10) UNSIGNED NOT NULL,
  `san_pham_id` int(10) UNSIGNED NOT NULL,
  `mau_sac` varchar(80) NOT NULL COMMENT 'VD: Titan Đen',
  `dung_luong` varchar(80) NOT NULL COMMENT 'VD: 256GB',
  `sku` varchar(120) NOT NULL COMMENT 'APL-IP15PM-256-BLK',
  `gia_ban` bigint(20) UNSIGNED NOT NULL COMMENT 'Đơn vị: VNĐ',
  `gia_khuyen_mai` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'NULL nếu không KM',
  `ton_kho` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `hinh_anh` varchar(255) DEFAULT NULL COMMENT 'Ảnh riêng theo màu',
  `an_hien` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bien_the_san_pham`
--

INSERT INTO `bien_the_san_pham` (`id`, `san_pham_id`, `mau_sac`, `dung_luong`, `sku`, `gia_ban`, `gia_khuyen_mai`, `ton_kho`, `hinh_anh`, `an_hien`) VALUES
(12, 2, 'Titan Xanh', '512GB', 'IP15PM-512-TX', 39990000, 38990000, 10, 'iphone15promax-blue.jpg', 1),
(13, 3, 'Titan Đen', '128GB', 'IP15P-128-TD', 29990000, 28990000, 12, 'iphone15pro-black.jpg', 1),
(34, 27, 'Xám', '256GB', 'RM12PP-256-GRY', 11990000, 11490000, 14, 'realme12proplus-gray.jpg', 1),
(35, 15, 'Mint', '128GB', 'S23FE-128-MNT', 14990000, 13990000, 14, NULL, 1),
(36, 16, 'Xanh Navy', '256GB', 'A55-256-NAVY', 10990000, 9990000, 17, NULL, 1),
(38, 17, 'Vàng', '128GB', 'A35-128-YLW', 8990000, 8490000, 18, NULL, 1),
(39, 18, 'Đen', '512GB', 'XM14T-512-BLK', 16990000, 15990000, 12, NULL, 1),
(40, 21, 'Vàng', '256GB', 'POCOX6P-256-YLW', 9990000, 9490000, 13, NULL, 1),
(41, 19, 'Tím', '256GB', 'RN13P-256-PUR', 10990000, 10490000, 17, NULL, 1),
(45, 12, 'Đen', '256GB', 'S24PLUS-256-BLK', 25990000, 24990000, 10, NULL, 1),
(51, 10, 'Đen', '128GB', 'IP14-128-BLK', 19990000, 18990000, 9, NULL, 1),
(54, 23, 'Bạc', '512GB', 'RENO12PRO-512-SL', 18990000, 17990000, 9, NULL, 1),
(55, 24, 'Hồng', '256GB', 'RENO12-256-PNK', 13990000, 13490000, 11, NULL, 1),
(56, 25, 'Tím', '512GB', 'V40-512-PUR', 14990000, 14490000, 10, NULL, 1),
(57, 26, 'Đỏ', '256GB', 'V30-256-RED', 10990000, 10490000, 15, NULL, 1),
(58, 22, 'Đen', '128GB', 'POCOM6P-128-BLK', 5490000, 4990000, 20, NULL, 1),
(59, 8, 'Bạc', '128GB', 'IP14P-128-SL', 24990000, 23990000, 9, NULL, 1),
(60, 9, 'Xanh Dương', '128GB', 'IP14PLUS-128-BLU', 21990000, 20990000, 7, NULL, 1),
(61, 13, 'Xanh Lá', '256GB', 'S23U-256-GRN', 26990000, 25990000, 6, NULL, 1),
(62, 20, 'Xanh', '128GB', 'RN13-128-BLU', 5990000, 5490000, 25, NULL, 1),
(63, 28, 'dd', 'dđ', '-260529-656', 2300, 1200, 0, NULL, 1),
(64, 7, 'Tím Deep Purple', '128GB', 'IP14PM-128-PR', 27990000, 26990000, 28, NULL, 1),
(65, 14, 'Kem', '256GB', 'S23PLUS-256-CRE', 21990000, 20990000, 10, NULL, 1),
(66, 1, 'Titan Đen', '256GB', 'IP15PM-256-BLK', 34990000, 33990000, 15, NULL, 1),
(67, 1, 'Titan Trắng', '256GB', 'IP15PM-256-WHT', 34990000, 33990000, 12, NULL, 1),
(68, 1, 'Titan Tự Nhiên', '512GB', 'IP15PM-512-NAT', 39990000, 38990000, 8, NULL, 1),
(69, 1, 'Titan Xanh', '1TB', 'IP15PM-1TB-BLU', 46990000, NULL, 5, NULL, 1),
(70, 2, 'Titan Đen', '256GB', 'S24U-256-BLK', 31990000, 29990000, 12, NULL, 1),
(71, 2, 'Titan Xám', '256GB', 'S24U-256-GRY', 31990000, 29990000, 10, NULL, 1),
(72, 2, 'Titan Vàng', '512GB', 'S24U-512-GLD', 36990000, 34990000, 7, NULL, 1),
(73, 3, 'Trắng', '512GB', 'XM14U-512-WHT', 25990000, 24990000, 10, NULL, 1),
(74, 3, 'Đen', '256GB', 'XM14U-256-BLK', 22990000, 21990000, 15, NULL, 1),
(75, 7, 'Vàng', '128GB', 'IP14P-128-GLD', 27990000, 26990000, 10, NULL, 1),
(76, 7, 'Bạc', '256GB', 'IP14P-256-SLV', 30990000, 28990000, 8, NULL, 1),
(77, 7, 'Đen Không Gian', '256GB', 'IP14P-256-BLK', 30990000, 28990000, 9, NULL, 1),
(78, 8, 'Đỏ', '128GB', 'IP14PL-128-RED', 24990000, 23990000, 8, NULL, 1),
(79, 8, 'Tím', '256GB', 'IP14PL-256-PUR', 27990000, 25990000, 6, NULL, 1),
(80, 8, 'Đen Giữa Đêm', '256GB', 'IP14PL-256-MID', 27990000, 25990000, 7, NULL, 1),
(81, 9, 'Hồng', '128GB', 'IP13-128-PNK', 21990000, 20990000, 12, NULL, 1),
(82, 9, 'Xanh Lá', '256GB', 'IP13-256-GRN', 24990000, 22990000, 8, NULL, 1),
(83, 9, 'Trắng', '128GB', 'IP13-128-WHT', 21990000, 20990000, 10, NULL, 1),
(84, 10, 'Trắng', '64GB', 'IP12MN-64-WHT', 13990000, 12990000, 10, NULL, 1),
(85, 10, 'Đỏ Product Red', '128GB', 'IP12MN-128-RED', 15990000, 14490000, 8, NULL, 1),
(86, 10, 'Xanh Dương', '64GB', 'IP12MN-64-BLU', 13990000, 12990000, 9, NULL, 1),
(90, 12, 'Kem', '128GB', 'S23FE-128-CRM', 14990000, 13490000, 12, NULL, 1),
(91, 12, 'Tím', '256GB', 'S23FE-256-PUR', 16990000, 15490000, 8, NULL, 1),
(92, 12, 'Xanh Lá', '128GB', 'S23FE-128-GRN', 14990000, 13490000, 10, NULL, 1),
(93, 13, 'Xanh Navy', '128GB', 'A55-128-NAVY', 9990000, 9490000, 15, NULL, 1),
(94, 13, 'Vàng Chanh', '256GB', 'A55-256-YLW', 10990000, 9990000, 10, NULL, 1),
(95, 13, 'Tím', '128GB', 'A55-128-PUR', 9990000, 9490000, 12, NULL, 1),
(96, 14, 'Xanh Mint', '256GB', 'ZFLIP5-256-MNT', 21990000, 20990000, 8, NULL, 1),
(97, 14, 'Tím Lavender', '512GB', 'ZFLIP5-512-LAV', 24990000, 22990000, 5, NULL, 1),
(98, 14, 'Đen Graphite', '256GB', 'ZFLIP5-256-BLK', 21990000, 20990000, 7, NULL, 1),
(99, 15, 'Đen Alpine', '256GB', 'XM13TP-256-BLK', 16990000, 15990000, 10, NULL, 1),
(100, 15, 'Trắng Meadow', '512GB', 'XM13TP-512-WHT', 19990000, 18490000, 7, NULL, 1),
(101, 16, 'Tím Lavender', '128GB', 'RN13P-128-LAV', 8990000, 8490000, 18, NULL, 1),
(102, 16, 'Đen Midnight', '256GB', 'RN13P-256-BLK', 10990000, 10490000, 12, NULL, 1),
(103, 16, 'Trắng Arctic', '128GB', 'RN13P-128-WHT', 8990000, 8490000, 15, NULL, 1),
(104, 17, 'Xám', '256GB', 'POCOX6P-256-GRY', 10990000, 10490000, 10, NULL, 1),
(105, 17, 'Đen', '512GB', 'POCOX6P-512-BLK', 12990000, 11990000, 7, NULL, 1),
(106, 18, 'Xanh Navy', '128GB', 'RM13C-128-NAVY', 3990000, 3690000, 25, NULL, 1),
(107, 18, 'Tím Clover', '256GB', 'RM13C-256-PUR', 4490000, 4190000, 18, NULL, 1),
(108, 19, 'Đen', '256GB', 'FX6P-256-BLK', 21990000, 20490000, 10, NULL, 1),
(109, 19, 'Nâu Da', '512GB', 'FX6P-512-BRN', 24990000, 23490000, 6, NULL, 1),
(110, 20, 'Vàng Ánh Kim', '256GB', 'RN11F-256-GLD', 8990000, 8490000, 14, NULL, 1),
(111, 20, 'Đen', '128GB', 'RN11F-128-BLK', 7990000, 7490000, 18, NULL, 1),
(112, 21, 'Xanh Dương', '256GB', 'A79-256-BLU', 6990000, 6490000, 20, NULL, 1),
(113, 21, 'Đen', '128GB', 'A79-128-BLK', 5990000, 5490000, 22, NULL, 1),
(114, 22, 'Trắng', '512GB', 'VX100P-512-WHT', 24990000, 23490000, 8, NULL, 1),
(115, 22, 'Xanh', '256GB', 'VX100P-256-BLU', 21990000, 20490000, 10, NULL, 1),
(116, 23, 'Hồng', '256GB', 'V30-256-PNK', 10990000, 10490000, 12, NULL, 1),
(117, 23, 'Đen', '256GB', 'V30-256-BLK', 10990000, 10490000, 10, NULL, 1),
(118, 24, 'Đen', '128GB', 'Y100-128-BLK', 6990000, 6490000, 20, NULL, 1),
(119, 24, 'Xanh', '256GB', 'Y100-256-BLU', 7490000, 6990000, 15, NULL, 1),
(120, 25, 'Trắng', '256GB', 'GT5P-256-WHT', 16990000, 15990000, 12, NULL, 1),
(121, 25, 'Đen', '1TB', 'GT5P-1TB-BLK', 22990000, NULL, 4, NULL, 1),
(122, 26, 'Xanh Dương', '256GB', 'RM12PP-256-BLU', 11990000, 11490000, 12, NULL, 1),
(123, 26, 'Beige', '512GB', 'RM12PP-512-BEI', 13990000, 13490000, 7, NULL, 1),
(124, 27, 'Xanh Đại Dương', '128GB', 'C67-128-OCN', 4490000, 4190000, 22, NULL, 1),
(125, 27, 'Đen', '256GB', 'C67-256-BLK', 4990000, 4690000, 18, NULL, 1),
(126, 30, 'Đen', '128GB', 'IP15-128-BLK', 22990000, 21990000, 20, NULL, 1),
(127, 30, 'Vàng', '128GB', 'IP15-128-YLW', 22990000, 21990000, 18, NULL, 1),
(128, 30, 'Hồng', '128GB', 'IP15-128-PNK', 22990000, 21990000, 15, NULL, 1),
(129, 30, 'Xanh', '128GB', 'IP15-128-BLU', 22990000, 21990000, 12, NULL, 1),
(130, 30, 'Đen', '256GB', 'IP15-256-BLK', 26990000, 25490000, 10, NULL, 1),
(131, 30, 'Vàng', '256GB', 'IP15-256-YLW', 26990000, 25490000, 8, NULL, 1),
(132, 30, 'Hồng', '512GB', 'IP15-512-PNK', 32990000, NULL, 5, NULL, 1),
(133, 31, 'Đen', '128GB', 'IP15PL-128-BLK', 26990000, 25490000, 15, NULL, 1),
(134, 31, 'Vàng', '128GB', 'IP15PL-128-YLW', 26990000, 25490000, 12, NULL, 1),
(135, 31, 'Hồng', '128GB', 'IP15PL-128-PNK', 26990000, 25490000, 10, NULL, 1),
(136, 31, 'Xanh', '256GB', 'IP15PL-256-BLU', 30990000, 29490000, 8, NULL, 1),
(137, 31, 'Đen', '256GB', 'IP15PL-256-BLK', 30990000, 29490000, 7, NULL, 1),
(138, 32, 'Titan Đen', '256GB', 'IP15P-256-TBKL', 29990000, 28490000, 15, NULL, 1),
(139, 32, 'Titan Trắng', '256GB', 'IP15P-256-TWHT', 29990000, 28490000, 12, NULL, 1),
(140, 32, 'Titan Xanh', '256GB', 'IP15P-256-TBLU', 29990000, 28490000, 10, NULL, 1),
(141, 32, 'Titan Tự Nhiên', '512GB', 'IP15P-512-TNAT', 34990000, 33490000, 7, NULL, 1),
(142, 32, 'Titan Đen', '1TB', 'IP15P-1TB-TBLK', 40990000, NULL, 3, NULL, 1),
(143, 33, 'Titan Đen', '256GB', 'IP15PM-256-TBLK', 34990000, 33490000, 12, NULL, 1),
(144, 33, 'Titan Trắng', '256GB', 'IP15PM-256-TWHT', 34990000, 33490000, 10, NULL, 1),
(145, 33, 'Titan Tự Nhiên', '512GB', 'IP15PM-512-TNAT', 39990000, 38490000, 8, NULL, 1),
(146, 33, 'Titan Xanh', '512GB', 'IP15PM-512-TBLU', 39990000, 38490000, 7, NULL, 1),
(147, 33, 'Titan Đen', '1TB', 'IP15PM-1TB-TBLK', 46990000, NULL, 4, NULL, 1),
(148, 34, 'Đen', '128GB', 'IP16-128-BLK', 27990000, 26990000, 20, NULL, 1),
(149, 34, 'Trắng', '128GB', 'IP16-128-WHT', 27990000, 26990000, 18, NULL, 1),
(150, 34, 'Xanh Mòng Két', '128GB', 'IP16-128-TEL', 27990000, 26990000, 15, NULL, 1),
(151, 34, 'Hồng', '128GB', 'IP16-128-PNK', 27990000, 26990000, 12, NULL, 1),
(152, 34, 'Đen', '256GB', 'IP16-256-BLK', 31990000, 30490000, 10, NULL, 1),
(153, 34, 'Trắng', '256GB', 'IP16-256-WHT', 31990000, 30490000, 8, NULL, 1),
(154, 34, 'Tím', '512GB', 'IP16-512-PUR', 37990000, NULL, 5, NULL, 1),
(155, 35, 'Đen', '128GB', 'IP16PL-128-BLK', 31990000, 30490000, 15, NULL, 1),
(156, 35, 'Trắng', '128GB', 'IP16PL-128-WHT', 31990000, 30490000, 12, NULL, 1),
(157, 35, 'Xanh Mòng Két', '256GB', 'IP16PL-256-TEL', 35990000, 34490000, 8, NULL, 1),
(158, 35, 'Hồng', '256GB', 'IP16PL-256-PNK', 35990000, 34490000, 7, NULL, 1),
(159, 35, 'Đen', '512GB', 'IP16PL-512-BLK', 41990000, NULL, 4, NULL, 1),
(160, 36, 'Titan Đen', '256GB', 'IP16P-256-TBLK', 34990000, 33490000, 15, NULL, 1),
(161, 36, 'Titan Trắng', '256GB', 'IP16P-256-TWHT', 34990000, 33490000, 12, NULL, 1),
(162, 36, 'Titan Sa Mạc', '256GB', 'IP16P-256-TDES', 34990000, 33490000, 10, NULL, 1),
(163, 36, 'Titan Tự Nhiên', '512GB', 'IP16P-512-TNAT', 39990000, 38490000, 8, NULL, 1),
(164, 36, 'Titan Đen', '1TB', 'IP16P-1TB-TBLK', 45990000, NULL, 3, NULL, 1),
(165, 37, 'Titan Đen', '256GB', 'IP16PM-256-TBLK', 39990000, 38490000, 15, NULL, 1),
(166, 37, 'Titan Trắng', '256GB', 'IP16PM-256-TWHT', 39990000, 38490000, 12, NULL, 1),
(167, 37, 'Titan Sa Mạc', '256GB', 'IP16PM-256-TDES', 39990000, 38490000, 10, NULL, 1),
(168, 37, 'Titan Tự Nhiên', '512GB', 'IP16PM-512-TNAT', 45990000, 44490000, 8, NULL, 1),
(169, 37, 'Titan Đen', '1TB', 'IP16PM-1TB-TBLK', 52990000, NULL, 4, NULL, 1),
(170, 38, 'Đen', '128GB', 'IP17-128-BLK', 32990000, 31490000, 20, NULL, 1),
(171, 38, 'Trắng', '128GB', 'IP17-128-WHT', 32990000, 31490000, 17, NULL, 1),
(172, 38, 'Xanh Dương', '128GB', 'IP17-128-BLU', 32990000, 31490000, 15, NULL, 1),
(173, 38, 'Đỏ', '128GB', 'IP17-128-RED', 32990000, 31490000, 12, NULL, 1),
(174, 38, 'Đen', '256GB', 'IP17-256-BLK', 36990000, 35490000, 10, NULL, 1),
(175, 38, 'Trắng', '512GB', 'IP17-512-WHT', 43990000, NULL, 5, NULL, 1),
(176, 39, 'Đen', '128GB', 'IP17AIR-128-BLK', 30990000, 29490000, 20, NULL, 1),
(177, 39, 'Trắng', '128GB', 'IP17AIR-128-WHT', 30990000, 29490000, 18, NULL, 1),
(178, 39, 'Xanh Mòng Két', '128GB', 'IP17AIR-128-TEL', 30990000, 29490000, 15, NULL, 1),
(179, 39, 'Hồng', '256GB', 'IP17AIR-256-PNK', 34990000, 33490000, 10, NULL, 1),
(180, 39, 'Đen', '256GB', 'IP17AIR-256-BLK', 34990000, 33490000, 8, NULL, 1),
(181, 40, 'Titan Đen', '256GB', 'IP17P-256-TBLK', 40990000, 39490000, 15, NULL, 1),
(182, 40, 'Titan Trắng', '256GB', 'IP17P-256-TWHT', 40990000, 39490000, 12, NULL, 1),
(183, 40, 'Titan Xanh', '256GB', 'IP17P-256-TBLU', 40990000, 39490000, 10, NULL, 1),
(184, 40, 'Titan Sa Mạc', '512GB', 'IP17P-512-TDES', 46990000, 45490000, 7, NULL, 1),
(185, 40, 'Titan Đen', '1TB', 'IP17P-1TB-TBLK', 53990000, NULL, 3, NULL, 1),
(186, 41, 'Titan Đen', '256GB', 'IP17PM-256-TBLK', 46990000, 45490000, 15, NULL, 1),
(187, 41, 'Titan Trắng', '256GB', 'IP17PM-256-TWHT', 46990000, 45490000, 12, NULL, 1),
(188, 41, 'Titan Sa Mạc', '512GB', 'IP17PM-512-TDES', 52990000, 50990000, 8, NULL, 1),
(189, 41, 'Titan Tự Nhiên', '512GB', 'IP17PM-512-TNAT', 52990000, 50990000, 7, NULL, 1),
(190, 41, 'Titan Đen', '1TB', 'IP17PM-1TB-TBLK', 59990000, NULL, 4, NULL, 1),
(191, 11, 'Kem', '256GB', 'S23U-256-CRM', 26990000, 25990000, 9, NULL, 1),
(192, 11, 'Titan Gray', '256GB', 'S24U-256-GR', 31990000, 30990000, 11, NULL, 1),
(193, 11, 'Xanh Lá', '512GB', 'S23U-512-GRN', 31990000, 29990000, 12, NULL, 1),
(194, 11, 'Đen', '512GB', 'S23U-512-BLK', 31990000, 29990000, 7, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cai_dat`
--

CREATE TABLE `cai_dat` (
  `khoa` varchar(100) NOT NULL,
  `gia_tri` text DEFAULT NULL,
  `nhom` varchar(50) NOT NULL DEFAULT 'chung'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cai_dat`
--

INSERT INTO `cai_dat` (`khoa`, `gia_tri`, `nhom`) VALUES
('dia_chi', 'Hà Nội, Việt Nam', 'chung'),
('email_lien_he', 'info@phonezone.vn', 'chung'),
('hotline', '1900 6789', 'chung'),
('mien_phi_ship_tu', '1000000', 'van_chuyen'),
('phi_ship_mac_dinh', '30000', 'van_chuyen'),
('slogan', 'Thiên đường điện thoại', 'chung'),
('ten_cua_hang', 'PhoneZone', 'chung'),
('thue_vat', '0', 'thanh_toan'),
('tien_te', 'VND', 'thanh_toan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id` int(10) UNSIGNED NOT NULL,
  `don_hang_id` int(10) UNSIGNED NOT NULL,
  `bien_the_id` int(10) UNSIGNED DEFAULT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `mau_sac` varchar(80) DEFAULT NULL,
  `dung_luong` varchar(80) DEFAULT NULL,
  `sku` varchar(120) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `don_gia` bigint(20) UNSIGNED NOT NULL,
  `so_luong` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `thanh_tien` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id`, `don_hang_id`, `bien_the_id`, `ten_san_pham`, `mau_sac`, `dung_luong`, `sku`, `hinh_anh`, `don_gia`, `so_luong`, `thanh_tien`) VALUES
(55, 1, NULL, 'iPhone 15 Pro Max 256GB', 'Titan Đen', '256GB', 'APL-IP15PM-256-BLK', 'iphone15promax-black.jpg', 33990000, 1, 33990000),
(56, 2, 12, 'iPhone 15 Pro Max 256GB', 'Titan Tự Nhiên', '256GB', 'IP15PM-256-TTN', 'iphone15promax-natural.jpg', 34990000, 1, 34990000),
(57, 3, 13, 'Samsung Galaxy S24 Ultra 256GB', 'Titan Gray', '256GB', 'S24U-256-GR', 's24ultra-gray.jpg', 30990000, 1, 30990000),
(58, 4, NULL, 'OPPO Reno 12 256GB', 'Hồng', '256GB', 'RENO12-256-PNK', 'reno12-pink.jpg', 13490000, 1, 13490000),
(59, 5, NULL, 'ROG Phone 8 256GB', 'Đen', '256GB', 'ROG8-256-BLK', 'rog8-black.jpg', 24990000, 1, 24990000),
(60, 6, NULL, 'iPhone 15 128GB', 'Đen', '128GB', 'APL-IP15-128-BLK', 'iphone15-black.jpg', 21990000, 1, 21990000),
(61, 7, NULL, 'iPhone 15 128GB', 'Hồng', '128GB', 'APL-IP15-128-PNK', 'iphone15-pink.jpg', 21990000, 1, 21990000),
(62, 8, NULL, 'iPhone 15 128GB', 'Xanh Lá', '128GB', 'APL-IP15-128-GRN', 'iphone15-green.jpg', 21990000, 1, 21990000),
(63, 9, NULL, 'iPhone 15 128GB', 'Xanh Dương', '128GB', 'APL-IP15-128-BLU', 'iphone15-blue.jpg', 21990000, 1, 21990000),
(64, 10, NULL, 'iPhone 15 128GB', 'Vàng', '128GB', 'APL-IP15-128-YLL', 'iphone15-yellow.jpg', 21990000, 1, 21990000),
(65, 11, NULL, 'Samsung Galaxy S24 128GB', 'Xám', '128GB', 'SS-S24-128-GR', 's24-gray.jpg', 19990000, 1, 19990000),
(66, 12, NULL, 'Samsung Galaxy S24 128GB', 'Đen', '128GB', 'SS-S24-128-BLK', 's24-black.jpg', 19990000, 1, 19990000),
(67, 13, NULL, 'Samsung Galaxy S24 128GB', 'Tím', '128GB', 'SS-S24-128-VLT', 's24-violet.jpg', 19990000, 1, 19990000),
(68, 14, NULL, 'Samsung Galaxy S24 128GB', 'Vàng', '128GB', 'SS-S24-128-YLL', 's24-yellow.jpg', 19990000, 1, 19990000),
(69, 14, NULL, 'iPhone 15 256GB', 'Đen', '256GB', 'APL-IP15-256-BLK', 'iphone15-black.jpg', 24990000, 1, 24990000),
(70, 15, 51, 'iPhone 12 Mini', 'Đen', '128GB', 'IP14-128-BLK', 'products/img_6a192c919353b9.14864688.jpg', 18990000, 1, 18990000),
(71, 15, NULL, 'iPhone 14 Pro 256GB', 'Tím Deep Purple', '128GB', 'IP14PM-128-PR', 'products/img_6a192c2b9b8361.78846331.jpg', 26990000, 3, 80970000),
(72, 16, 36, 'Redmi Note 13 Pro', 'Xanh Navy', '256GB', 'A55-256-NAVY', 'products/img_6a192a98ccec87.71104891.jpg', 9990000, 3, 29970000),
(73, 17, 58, 'Vivo X100 Pro', 'Đen', '128GB', 'POCOM6P-128-BLK', 'products/img_6a192cd51410f9.28063444.png', 4990000, 1, 4990000),
(74, 18, 58, 'Vivo X100 Pro', 'Đen', '128GB', 'POCOM6P-128-BLK', 'products/img_6a192cd51410f9.28063444.png', 4990000, 1, 4990000),
(75, 18, 64, 'iPhone 14 Pro 256GB', 'Tím Deep Purple', '128GB', 'IP14PM-128-PR', 'products/img_6a192c2b9b8361.78846331.jpg', 26990000, 1, 26990000),
(76, 19, 58, 'Vivo X100 Pro', 'Đen', '128GB', 'POCOM6P-128-BLK', 'products/img_6a192cd51410f9.28063444.png', 4990000, 1, 4990000),
(78, 50, 171, 'iPhone 17 128GB', 'Trắng', '128GB', 'IP17-128-WHT', 'https://tse3.mm.bing.net/th/id/OIP.jbMbydyGgXj4FxjBjD4UCwHaKX?r=0&w=768&h=1075&rs=1&pid=ImgDetMain&o=7&rm=3', 31490000, 1, 31490000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia`
--

CREATE TABLE `danh_gia` (
  `id` int(10) UNSIGNED NOT NULL,
  `san_pham_id` int(10) UNSIGNED NOT NULL,
  `khach_hang_id` int(10) UNSIGNED DEFAULT NULL,
  `don_hang_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Xác thực đã mua',
  `ho_ten` varchar(150) NOT NULL COMMENT 'Snapshot tên',
  `so_sao` tinyint(3) UNSIGNED NOT NULL COMMENT '1-5',
  `tieu_de` varchar(255) DEFAULT NULL,
  `noi_dung` text DEFAULT NULL,
  `trang_thai` enum('cho_duyet','da_duyet','an') NOT NULL DEFAULT 'cho_duyet',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_gia`
--

INSERT INTO `danh_gia` (`id`, `san_pham_id`, `khach_hang_id`, `don_hang_id`, `ho_ten`, `so_sao`, `tieu_de`, `noi_dung`, `trang_thai`, `created_at`) VALUES
(23, 2, NULL, NULL, 'Lê Hoàng Nam', 5, 'Bản 512GB rất thoải mái', 'Lưu video và game không lo đầy bộ nhớ.', 'da_duyet', '2025-05-03 14:00:00'),
(24, 3, NULL, NULL, 'Phạm Đức Anh', 5, 'Hiệu năng tốt', 'iPhone 15 Pro nhỏ gọn nhưng rất mạnh.', 'da_duyet', '2025-05-04 08:40:00'),
(25, 7, NULL, NULL, 'Đặng Hải Đăng', 4, 'Pin ổn', 'iPhone 14 Pro Max vẫn dùng rất ngon ở thời điểm này.', 'da_duyet', '2025-05-05 11:30:00'),
(26, 8, NULL, NULL, 'Võ Minh Hiếu', 5, 'Màn hình đẹp', 'iPhone 14 Pro hiển thị cực sắc nét.', 'da_duyet', '2025-05-06 13:10:00'),
(27, 9, NULL, NULL, 'Nguyễn Khánh', 4, 'Loa to', 'iPhone 14 Plus xem phim và nghe nhạc rất thích.', 'da_duyet', '2025-05-07 15:45:00'),
(28, 10, NULL, NULL, 'Lý Thành Công', 5, 'Ổn định', 'iPhone 14 dùng hằng ngày rất mượt.', 'da_duyet', '2025-05-08 17:20:00'),
(29, 11, NULL, NULL, 'Bùi Trung Kiên', 5, 'Zoom cực đỉnh', 'S24 Ultra chụp zoom xa cực nét.', 'da_duyet', '2025-05-09 12:00:00'),
(30, 12, NULL, NULL, 'Hoàng Nhật Minh', 4, 'Thiết kế đẹp', 'S24 Plus cầm chắc tay và màn đẹp.', 'da_duyet', '2025-05-10 18:25:00'),
(31, 13, NULL, NULL, 'Phan Văn Tài', 5, 'Gaming mạnh', 'S23 Ultra chơi game rất mượt.', 'da_duyet', '2025-05-11 20:15:00'),
(32, 14, NULL, NULL, 'Đỗ Gia Huy', 4, 'Máy ổn', 'S23 Plus pin khá tốt và hiệu năng cao.', 'da_duyet', '2025-05-12 09:50:00'),
(33, 15, NULL, NULL, 'Trịnh Văn Nam', 4, 'Đáng mua', 'S23 FE phù hợp trong tầm giá.', 'da_duyet', '2025-05-13 10:05:00'),
(34, 16, NULL, NULL, 'Ngô Thành Đạt', 5, 'Pin trâu', 'Galaxy A55 dùng cả ngày không lo hết pin.', 'da_duyet', '2025-05-14 16:30:00'),
(35, 17, NULL, NULL, 'Lê Minh Tuấn', 4, 'Màn hình đẹp', 'A35 hiển thị màu sắc khá tốt.', 'da_duyet', '2025-05-15 14:40:00'),
(36, 18, NULL, NULL, 'Nguyễn Hải Long', 5, 'Camera đẹp', 'Xiaomi 14T chụp chân dung rất ổn.', 'da_duyet', '2025-05-16 11:11:00'),
(37, 19, NULL, NULL, 'Đinh Quang Huy', 5, 'Cấu hình ngon', 'Redmi Note 13 Pro+ chiến game tốt.', 'da_duyet', '2025-05-17 08:45:00'),
(38, 20, NULL, NULL, 'Phạm Nhật Duy', 4, 'Giá hợp lý', 'Redmi Note 13 phù hợp học sinh sinh viên.', 'da_duyet', '2025-05-18 19:10:00'),
(39, 21, NULL, NULL, 'Trần Quốc Việt', 5, 'Gaming cực tốt', 'POCO X6 Pro hiệu năng rất mạnh.', 'da_duyet', '2025-05-19 21:00:00'),
(40, 22, NULL, NULL, 'Vũ Minh Khang', 4, 'Máy ổn định', 'POCO M6 Pro dùng cơ bản rất tốt.', 'da_duyet', '2025-05-20 13:33:00'),
(41, 23, NULL, NULL, 'Nguyễn Đức Thành', 5, 'Camera đẹp', 'OPPO Reno 12 Pro selfie rất đẹp.', 'da_duyet', '2025-05-21 09:00:00'),
(42, 24, NULL, NULL, 'Phạm Gia Bảo', 4, 'Thiết kế đẹp', 'Reno 12 cầm nhẹ và sang.', 'da_duyet', '2025-05-22 10:45:00'),
(43, 25, NULL, NULL, 'Lê Quang Huy', 5, 'Pin tốt', 'Vivo V40 dùng pin rất trâu.', 'da_duyet', '2025-05-23 16:20:00'),
(44, 26, NULL, NULL, 'Trần Minh Nhật', 4, 'Màn đẹp', 'Vivo V30 hiển thị rất sắc nét.', 'da_duyet', '2025-05-24 12:10:00'),
(45, 27, NULL, NULL, 'Hoàng Quốc Anh', 5, 'Chụp zoom đẹp', 'Realme 12 Pro+ chụp xa khá ấn tượng.', 'da_duyet', '2025-05-25 18:40:00'),
(46, 1, 1, NULL, 'Nguyễn Minh Quân', 5, 'Đỉnh của đỉnh, xứng đáng từng đồng', 'Mình dùng iPhone 15 Pro Max được 3 tháng rồi, máy cực kỳ mượt mà, chip A17 Pro xử lý mọi tác vụ không một chút lag. Camera chụp ảnh đêm đẹp hơn hẳn đời trước, tele 5x rất thực dụng khi đi du lịch. Khung Titanium nhẹ hơn mà lại cứng cáp hơn. Rất hài lòng!', 'da_duyet', '2026-01-15 09:00:00'),
(47, 1, 2, NULL, 'Trần Quốc Bảo', 5, 'Máy đẹp, hiệu năng siêu mạnh', 'Chuyển từ Samsung sang iPhone 15 Pro Max và không hối hận. iOS mượt mà, Face ID nhanh, màn hình 120Hz đẹp sắc nét. Pin dùng cả ngày thoải mái. Giá cao nhưng xứng đáng!', 'da_duyet', '2026-01-20 14:00:00'),
(48, 1, 3, NULL, 'Lê Hoàng Nam', 4, 'Rất tốt nhưng giá hơi cao', 'Camera quay video 4K siêu mượt, Dynamic Island tiện dụng hơn mình nghĩ. Chỉ tiếc giá hơi đắt và không có sạc nhanh trong hộp. Nhìn chung vẫn là máy đáng mua nhất năm.', 'da_duyet', '2026-02-10 10:00:00'),
(49, 30, 13, NULL, 'Nguyễn Thị Lan', 5, 'iPhone 15 quá tuyệt vời', 'Mình mua iPhone 15 bản thường và rất hài lòng. Cổng USB-C tiện hơn Lightning nhiều, Dynamic Island đẹp và tiện. Camera 48MP chụp ảnh rõ nét. Chip A16 dùng mượt mà cho mọi tác vụ hàng ngày.', 'da_duyet', '2026-05-05 10:00:00'),
(50, 30, 14, NULL, 'Trần Văn Hùng', 4, 'Máy tốt, đáng mua tầm giá', 'Đây là iPhone đầu tiên của mình và không thất vọng. Màn hình đẹp, camera chụp tốt trong điều kiện đủ sáng. Pin dùng được khoảng 1 ngày. Chuyển khoản nhanh qua ứng dụng rất tiện.', 'da_duyet', '2026-05-08 14:00:00'),
(51, 30, 15, NULL, 'Lê Thị Mai', 5, 'Màu hồng cực xinh, dùng quá thích', 'Mình chọn màu hồng và nó đẹp hơn ngoài đời thực nhiều! Máy nhẹ nhàng cầm vừa tay. Camera selfie 12MP chụp ảnh selfie đẹp tự nhiên. Rất hài lòng với lựa chọn này.', 'da_duyet', '2026-05-10 09:00:00'),
(52, 31, 16, NULL, 'Phạm Minh Tuấn', 5, 'Màn hình lớn, pin trâu cực kỳ', 'iPhone 15 Plus là lựa chọn hoàn hảo cho người thích màn hình lớn mà không cần bản Pro. Pin dùng gần 2 ngày, màn hình 6.7 inch xem phim tuyệt vời. Cổng USB-C sạc nhanh hơn nhiều.', 'da_duyet', '2026-05-06 11:00:00'),
(53, 31, 17, NULL, 'Hoàng Thị Thu', 4, 'Pin khỏe nhất mình từng dùng', 'Mình chuyển từ iPhone 12 lên 15 Plus, khác biệt rõ rệt về pin. Trước dùng 1 ngày phải sạc, giờ dùng thoải mái sang ngày hôm sau. Dynamic Island hay hơn notch cũ nhiều.', 'da_duyet', '2026-05-09 15:00:00'),
(54, 32, 18, NULL, 'Vũ Đức Mạnh', 5, 'Pro xứng tầm, camera xuất sắc', 'Mình là nhiếp ảnh nghiệp dư và iPhone 15 Pro là máy ảnh tốt nhất mình từng có. Tele 3x zoom quang học rất sắc, chụp đêm với sensor lớn hơn rõ ràng tốt hơn bản thường. Khung Titanium sang trọng.', 'da_duyet', '2026-05-07 10:00:00'),
(55, 32, 19, NULL, 'Đặng Thị Hương', 5, 'Nút Action cực kỳ tiện dụng', 'Nút Action mình set để bật tắt im lặng và điều chỉnh camera, tiết kiệm thời gian rất nhiều. USB-C 3.0 transfer file nhanh hơn hẳn. Máy nhẹ hơn đáng kể so với Pro Max.', 'da_duyet', '2026-05-11 14:00:00'),
(56, 32, 20, NULL, 'Ngô Văn Đức', 4, 'Tốt nhưng pin hơi ngắn hơn Plus', 'Mọi thứ đều hoàn hảo: màn hình 120Hz đẹp, chip A17 Pro mạnh, camera chuyên nghiệp. Chỉ có điều pin không được lâu bằng bản Plus do màn nhỏ hơn. Chấp nhận được với hiệu năng như vậy.', 'da_duyet', '2026-05-14 09:00:00'),
(57, 33, 21, NULL, 'Bùi Thị Ngọc', 5, 'Tele 5x là điểm cộng lớn nhất', 'Mình mua Pro Max chủ yếu vì tele 5x và không hối hận. Chụp xa mà vẫn nét, zoom vào mặt người ở xa rất chi tiết. Màn hình lớn 6.7 inch xem phim, chơi game đỉnh. Pin cả ngày dùng thoải mái.', 'da_duyet', '2026-05-09 11:00:00'),
(58, 33, 22, NULL, 'Đinh Văn Khoa', 5, 'Flagship xứng tầm giá tiền', 'Đây là điện thoại đắt nhất mình từng mua nhưng cũng tốt nhất. Mọi thứ đều premium từ thiết kế đến hiệu năng. Titanium nhẹ hơn thép không gỉ của đời trước khá rõ. Rất recommend!', 'da_duyet', '2026-05-12 16:00:00'),
(59, 34, 1, NULL, 'Nguyễn Minh Quân', 5, 'Camera Control thay đổi cách chụp ảnh', 'Nút Camera Control trên iPhone 16 quá tiện! Có thể zoom, chỉnh exposure, bấm chụp mà không cần nhìn màn hình. Apple Intelligence dịch văn bản và tóm tắt email rất thực dụng.', 'da_duyet', '2026-05-13 10:00:00'),
(60, 34, 13, NULL, 'Nguyễn Thị Lan', 4, 'Nâng cấp đáng giá từ iPhone 14', 'Chip A18 chạy mượt hơn rõ rệt, đặc biệt khi xử lý AI. Camera chụp đẹp hơn 14 trong mọi điều kiện. WiFi 7 kết nối nhanh hơn. Nhìn chung là bản nâng cấp toàn diện và đáng đồng tiền.', 'da_duyet', '2026-05-16 14:00:00'),
(61, 34, 14, NULL, 'Trần Văn Hùng', 5, 'AI thực sự hữu ích trong công việc', 'Apple Intelligence giúp mình viết email nhanh hơn, tóm tắt văn bản dài rất hay. Photo app tìm ảnh theo mô tả ngôn ngữ tự nhiên cực tiện. Đây là tương lai của smartphone.', 'da_duyet', '2026-05-19 09:00:00'),
(62, 35, 15, NULL, 'Lê Thị Mai', 5, 'Pin dùng 2 ngày không cần sạc', 'Mình dùng 16 Plus được 1 tuần, pin khỏe hơn kỳ vọng. Dùng mạng xã hội, xem video, chụp ảnh cả ngày vẫn còn khoảng 30%. Màn hình lớn xem phim quá đã. Rất hài lòng!', 'da_duyet', '2026-05-15 11:00:00'),
(63, 35, 16, NULL, 'Phạm Minh Tuấn', 4, 'Lựa chọn hoàn hảo cho người thích màn lớn', '16 Plus là phiên bản hoàn thiện hơn 15 Plus về mọi mặt. Camera Control thêm vào rất tiện, AI gợi ý thông minh. Chỉ tiếc vẫn là màn 60Hz ở đời Pro.', 'da_duyet', '2026-05-18 15:00:00'),
(64, 36, 17, NULL, 'Hoàng Thị Thu', 5, 'Màn hình lớn hơn, trải nghiệm tốt hơn hẳn', '16 Pro màn lớn hơn 15 Pro thấy rõ, cầm thoải mái hơn mà vẫn compact. Camera 48MP siêu rộng mới chụp kiến trúc và phong cảnh đẹp hơn nhiều. Quay 4K 120fps mượt không tưởng.', 'da_duyet', '2026-05-10 10:00:00'),
(65, 36, 18, NULL, 'Vũ Đức Mạnh', 5, 'Nhiếp ảnh gia sẽ yêu máy này', 'Ba camera đều 48MP là điểm khác biệt lớn nhất. Ảnh siêu rộng giờ cũng sắc nét như ảnh chính. Log video mới tên Apple Log cho hậu kỳ rất linh hoạt. Đáng để nâng cấp từ 15 Pro.', 'da_duyet', '2026-05-13 14:00:00'),
(66, 36, 19, NULL, 'Đặng Thị Hương', 4, 'Pro xứng đáng nhưng giá hơi cao', 'Hiệu năng tuyệt vời với A18 Pro, màn hình đẹp sắc nét với Always-On thực dụng. Camera Control sau 1 tuần thấy quen và tiện. Giá hơi cao so với bản 15 Pro nhưng nhiều cải tiến thực chất.', 'da_duyet', '2026-05-17 09:00:00'),
(67, 37, 20, NULL, 'Ngô Văn Đức', 5, 'Màn hình 6.9 inch xem phim như rạp chiếu', '16 Pro Max có màn hình to nhất iPhone từ trước đến nay và trải nghiệm xem phim HDR đỉnh thật sự. Pin 33 giờ là con số ấn tượng, mình dùng 2 ngày thoải mái. Camera tele 5x sắc bén.', 'da_duyet', '2026-05-11 11:00:00'),
(68, 37, 21, NULL, 'Bùi Thị Ngọc', 5, 'Đỉnh của Apple, không có gì để chê', 'Từ thiết kế Titanium cao cấp đến hiệu năng A18 Pro, từ camera 3x48MP đến màn hình ProMotion Always-On, mọi thứ đều hoàn hảo. Đắt nhưng xứng đáng cho người cần smartphone tốt nhất.', 'da_duyet', '2026-05-14 16:00:00'),
(69, 37, 22, NULL, 'Đinh Văn Khoa', 4, 'Tuyệt vời nhưng hơi nặng', 'Máy nặng hơn 16 Pro một chút do màn lớn pin lớn hơn. Nhưng bù lại pin dùng siêu lâu và màn hình rộng rãi. Camera tele 5x sắc nét trong mọi điều kiện ánh sáng. Recommend!', 'da_duyet', '2026-05-20 10:00:00'),
(70, 38, 1, NULL, 'Nguyễn Minh Quân', 5, 'iPhone 17 là bước nhảy vọt thực sự', 'Thiết kế mỏng nhẹ hơn rõ rệt, cầm trên tay thấy khác biệt ngay. Camera trước 24MP chụp selfie đẹp vượt trội các đời trước. Apple Intelligence 2 thông minh hơn nhiều, dịch đồng thời real-time đỉnh.', 'da_duyet', '2026-05-16 09:00:00'),
(71, 38, 13, NULL, 'Nguyễn Thị Lan', 5, 'Thiết kế mới đẹp hơn hẳn', 'Màu xanh dương của 17 đẹp lắm, nhìn sang hơn các đời trước. Máy mỏng nhẹ cầm rất thoải mái kể cả dùng một tay. Chip A19 siêu mạnh chơi game nặng không nóng máy.', 'da_duyet', '2026-05-19 14:00:00'),
(72, 38, 14, NULL, 'Trần Văn Hùng', 4, 'Nâng cấp đáng giá so với 16', 'Camera trước 24MP là điểm cộng lớn nhất với mình vì hay gọi video call. Thiết kế mới lạ hơn, Apple Intelligence 2 thực dụng hơn. Nên nâng cấp nếu đang dùng iPhone 14 trở xuống.', 'da_duyet', '2026-05-22 11:00:00'),
(73, 39, 15, NULL, 'Lê Thị Mai', 5, 'Siêu mỏng siêu nhẹ, mê quá!', 'iPhone 17 Air chỉ 5.5mm mỏng mà cầm lên thấy ngay sự khác biệt. Máy nhẹ đến mức gần như không cảm giác trong túi. Màn hình 120Hz ProMotion mượt mà. Đây là iPhone dành cho người yêu thiết kế.', 'da_duyet', '2026-05-18 10:00:00'),
(74, 39, 16, NULL, 'Phạm Minh Tuấn', 4, 'Mỏng nhất lịch sử nhưng pin hơi ít', 'Air mỏng đẹp thật nhưng pin 3600mAh hơi ít hơn các bản khác. Mình dùng cả ngày vừa đủ nếu không dùng nhiều. Bù lại thiết kế đẹp không đối thủ và nhẹ vô cùng. Phù hợp bạn dùng nhẹ nhàng.', 'da_duyet', '2026-05-21 15:00:00'),
(75, 39, 17, NULL, 'Hoàng Thị Thu', 5, 'Thay thế hoàn hảo cho Plus', 'Air thay Plus nhưng lại mỏng hơn và màn 120Hz. Đổi lại camera chỉ 1 ống nhưng 48MP chụp vẫn đẹp. Form factor mỏng nhẹ này là tương lai của smartphone cao cấp.', 'da_duyet', '2026-05-24 09:00:00'),
(76, 40, 18, NULL, 'Vũ Đức Mạnh', 5, '3 camera 48MP là chuẩn mực mới', 'Lần đầu tiên cả 3 camera đều 48MP và sự khác biệt rõ ràng. Ảnh siêu rộng giờ nét và chi tiết như ảnh chính. RAM 12GB chạy nhiều app cùng lúc không lag. A19 Pro siêu mạnh.', 'da_duyet', '2026-05-20 11:00:00'),
(77, 40, 19, NULL, 'Đặng Thị Hương', 5, 'Pro thực sự đáng tiền', 'Từ RAM 12GB đến 3 camera 48MP đến chip A19 Pro mới nhất, đây là smartphone mạnh nhất mình từng dùng. Apple Intelligence 2 Pro thông minh vượt trội, hỗ trợ công việc rất tốt.', 'da_duyet', '2026-05-23 14:00:00'),
(78, 40, 20, NULL, 'Ngô Văn Đức', 4, 'Tốt nhưng camera tele chỉ 5x', 'Mọi thứ đều tuyệt vời: màn hình Always-On đẹp, camera xuất sắc, hiệu năng đỉnh. Chỉ muốn tele mạnh hơn 5x như Pro Max. Nhưng nhìn chung là upgrade đáng giá từ 16 Pro.', 'da_duyet', '2026-05-26 10:00:00'),
(79, 41, 21, NULL, 'Bùi Thị Ngọc', 5, 'Tele 10x lần đầu trên iPhone, đỉnh thật!', 'Cuối cùng iPhone cũng có tele 10x và nó xuất sắc hơn kỳ vọng. Zoom xa mà vẫn giữ được chi tiết không ngờ. Pin 35 giờ là kỷ lục, dùng 2 ngày thoải mái. Đây là iPhone tốt nhất mọi thời đại.', 'da_duyet', '2026-05-22 09:00:00'),
(80, 41, 22, NULL, 'Đinh Văn Khoa', 5, 'Flagship tốt nhất thị trường không bàn cãi', '17 Pro Max vượt qua tất cả đối thủ Android ở mọi tiêu chí: thiết kế, hiệu năng, camera, pin, AI. Tele 10x là game changer thực sự. Giá cao nhưng xứng đáng từng đồng.', 'da_duyet', '2026-05-25 16:00:00'),
(81, 41, 1, NULL, 'Nguyễn Minh Quân', 4, 'Tốt nhất nhưng hơi nặng và đắt', '17 Pro Max thực sự là đỉnh của đỉnh về công nghệ. Tele 10x zoom xa không tưởng, pin 35 giờ siêu trâu. Nhưng máy khá nặng và giá cao. Nếu không quan tâm tele 10x thì 17 Pro đủ dùng rồi.', 'da_duyet', '2026-05-28 11:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten` varchar(100) NOT NULL COMMENT 'VD: iPhone, Samsung Galaxy, Xiaomi',
  `slug` varchar(120) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `thu_tu` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `an_hien` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `ten`, `slug`, `mo_ta`, `hinh_anh`, `thu_tu`, `an_hien`, `created_at`) VALUES
(1, 'iPhone', 'iphone', NULL, NULL, 1, 1, '2026-05-28 21:52:40'),
(2, 'Samsung Galaxy', 'samsung-galaxy', NULL, NULL, 2, 1, '2026-05-28 21:52:40'),
(3, 'Xiaomi', 'xiaomi', NULL, NULL, 3, 1, '2026-05-28 21:52:40'),
(4, 'OPPO', 'oppo', NULL, NULL, 4, 1, '2026-05-28 21:52:40'),
(5, 'Vivo', 'vivo', NULL, NULL, 5, 1, '2026-05-28 21:52:40'),
(6, 'Realme', 'realme', NULL, NULL, 6, 1, '2026-05-28 21:52:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dia_chi_khach_hang`
--

CREATE TABLE `dia_chi_khach_hang` (
  `id` int(10) UNSIGNED NOT NULL,
  `khach_hang_id` int(10) UNSIGNED NOT NULL,
  `ho_ten` varchar(150) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `tinh_thanh` varchar(100) NOT NULL,
  `quan_huyen` varchar(100) NOT NULL,
  `phuong_xa` varchar(100) NOT NULL,
  `so_nha_duong` varchar(255) NOT NULL,
  `la_mac_dinh` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dia_chi_khach_hang`
--

INSERT INTO `dia_chi_khach_hang` (`id`, `khach_hang_id`, `ho_ten`, `so_dien_thoai`, `tinh_thanh`, `quan_huyen`, `phuong_xa`, `so_nha_duong`, `la_mac_dinh`) VALUES
(1, 11, 'TRINH THI HOA', '0364663178', 'Hà Nội', 'Hoàng Mai', 'Vĩnh Hưng', '5 thanh đàm', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id` int(10) UNSIGNED NOT NULL,
  `ma_don` varchar(30) NOT NULL COMMENT 'ORD-20250510-001',
  `khach_hang_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'NULL nếu khách vãng lai',
  `ten_nguoi_nhan` varchar(150) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `tinh_thanh` varchar(100) NOT NULL,
  `quan_huyen` varchar(100) NOT NULL,
  `phuong_xa` varchar(100) NOT NULL,
  `so_nha_duong` varchar(255) NOT NULL,
  `ghi_chu` text DEFAULT NULL,
  `tam_tinh` bigint(20) UNSIGNED NOT NULL COMMENT 'Trước KM + ship',
  `giam_gia` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `phi_van_chuyen` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tong_tien` bigint(20) UNSIGNED NOT NULL COMMENT 'Thực thanh toán',
  `ma_giam_gia_id` int(10) UNSIGNED DEFAULT NULL,
  `phuong_thuc_tt` enum('cod','chuyen_khoan','momo','vnpay','zalopay') NOT NULL DEFAULT 'cod',
  `trang_thai_tt` enum('chua_tt','da_tt','hoan_tien') NOT NULL DEFAULT 'chua_tt',
  `ma_giao_dich` varchar(100) DEFAULT NULL COMMENT 'Mã GD từ cổng thanh toán',
  `trang_thai` enum('cho_xac_nhan','da_xac_nhan','dang_dong_hang','dang_giao','da_giao','da_huy','hoan_hang') NOT NULL DEFAULT 'cho_xac_nhan',
  `ma_van_don` varchar(100) DEFAULT NULL,
  `don_vi_van_chuyen` varchar(100) DEFAULT NULL,
  `ngay_du_kien_giao` date DEFAULT NULL,
  `ngay_giao_thuc` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`id`, `ma_don`, `khach_hang_id`, `ten_nguoi_nhan`, `so_dien_thoai`, `tinh_thanh`, `quan_huyen`, `phuong_xa`, `so_nha_duong`, `ghi_chu`, `tam_tinh`, `giam_gia`, `phi_van_chuyen`, `tong_tien`, `ma_giam_gia_id`, `phuong_thuc_tt`, `trang_thai_tt`, `ma_giao_dich`, `trang_thai`, `ma_van_don`, `don_vi_van_chuyen`, `ngay_du_kien_giao`, `ngay_giao_thuc`, `created_at`, `updated_at`) VALUES
(1, 'ORD-20250510-002', 2, 'Trần Quốc Bảo', '0978123456', 'Hà Nội', 'Đống Đa', 'Láng Hạ', '88 Huỳnh Thúc Kháng', NULL, 21990000, 200000, 30000, 21820000, 2, 'momo', 'da_tt', NULL, 'dang_giao', NULL, NULL, NULL, NULL, '2025-05-10 09:00:00', '2026-05-28 22:13:13'),
(2, 'ORD-20250510-003', 3, 'Lê Hoàng Nam', '0965234789', 'Hà Nội', 'Hai Bà Trưng', 'Bạch Mai', '45 Minh Khai', NULL, 17990000, 0, 30000, 18020000, NULL, 'cod', 'chua_tt', NULL, 'da_huy', NULL, NULL, NULL, NULL, '2025-05-10 10:15:00', '2026-05-30 17:56:48'),
(3, 'ORD-20250510-004', 4, 'Phạm Đức Anh', '0934567891', 'Hà Nội', 'Thanh Xuân', 'Nhân Chính', '120 Nguyễn Trãi', NULL, 27990000, 500000, 0, 27490000, 1, 'vnpay', 'da_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-11 14:30:00', '2026-05-30 23:45:00'),
(4, 'ORD-20250510-005', 5, 'Đặng Hải Đăng', '0912345678', 'Hà Nội', 'Hoàng Mai', 'Định Công', '56 Giải Phóng', NULL, 10990000, 0, 30000, 11020000, NULL, 'cod', 'chua_tt', NULL, 'dang_dong_hang', NULL, NULL, NULL, NULL, '2025-05-11 16:00:00', '2026-05-28 22:13:13'),
(5, 'ORD-20250510-006', 6, 'Võ Minh Hiếu', '0981122334', 'Hà Nội', 'Nam Từ Liêm', 'Mỹ Đình 1', '33 Hàm Nghi', NULL, 16990000, 200000, 30000, 16820000, 2, 'zalopay', 'da_tt', NULL, 'da_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-12 08:20:00', '2026-05-28 22:13:13'),
(6, 'ORD-20250510-007', 7, 'Nguyễn Khánh', '0977445566', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Đỉnh', '78 Phạm Văn Đồng', NULL, 8990000, 0, 30000, 9020000, NULL, 'cod', 'chua_tt', NULL, 'cho_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-12 10:45:00', '2026-05-28 22:13:13'),
(7, 'ORD-20250510-008', 8, 'Lý Thành Công', '0944556677', 'Hà Nội', 'Long Biên', 'Ngọc Lâm', '11 Nguyễn Văn Cừ', NULL, 23990000, 500000, 0, 23490000, 1, 'momo', 'da_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-13 13:15:00', '2026-05-28 22:13:13'),
(8, 'ORD-20250510-009', 9, 'Bùi Trung Kiên', '0922334455', 'Hà Nội', 'Hà Đông', 'Mộ Lao', '99 Trần Phú', NULL, 7990000, 0, 30000, 8020000, NULL, 'cod', 'chua_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-13 15:00:00', '2026-05-30 17:55:56'),
(9, 'ORD-20250510-010', 10, 'Hoàng Nhật Minh', '0909888777', 'Hà Nội', 'Ba Đình', 'Kim Mã', '66 Đội Cấn', NULL, 24990000, 500000, 0, 24490000, 1, 'vnpay', 'da_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-14 11:40:00', '2026-05-28 22:13:13'),
(10, 'ORD-20250510-011', 1, 'Nguyễn Minh Quân', '0987654321', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '12 Trần Thái Tông', NULL, 15990000, 200000, 30000, 15720000, 2, 'cod', 'chua_tt', NULL, 'da_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-14 18:20:00', '2026-05-28 22:13:13'),
(11, 'ORD-20250510-012', 2, 'Trần Quốc Bảo', '0978123456', 'Hà Nội', 'Đống Đa', 'Láng Hạ', '88 Huỳnh Thúc Kháng', NULL, 11990000, 0, 30000, 12020000, NULL, 'momo', 'da_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-15 09:50:00', '2026-05-28 22:13:13'),
(12, 'ORD-20250510-013', 3, 'Lê Hoàng Nam', '0965234789', 'Hà Nội', 'Hai Bà Trưng', 'Bạch Mai', '45 Minh Khai', NULL, 4990000, 0, 30000, 5020000, NULL, 'cod', 'chua_tt', NULL, 'cho_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-15 12:10:00', '2026-05-28 22:13:13'),
(13, 'ORD-20250510-014', 4, 'Phạm Đức Anh', '0934567891', 'Hà Nội', 'Thanh Xuân', 'Nhân Chính', '120 Nguyễn Trãi', NULL, 22990000, 500000, 0, 22490000, 1, 'zalopay', 'da_tt', NULL, 'dang_giao', NULL, NULL, NULL, NULL, '2025-05-16 08:00:00', '2026-05-28 22:13:13'),
(14, 'ORD-20250510-015', 5, 'Đặng Hải Đăng', '0912345678', 'Hà Nội', 'Hoàng Mai', 'Định Công', '56 Giải Phóng', NULL, 10990000, 200000, 30000, 10720000, 2, 'cod', 'chua_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-16 16:45:00', '2026-05-28 23:44:19'),
(15, 'ORD-20260529-32503', 11, 'trinh thi hoa', '0364663178', 'ha noi', 'hai ba trung', 'vinhhung', '5 thanh dam', '', 99960000, 4000000, 0, 99960000, NULL, 'momo', 'chua_tt', NULL, 'da_xac_nhan', NULL, NULL, NULL, NULL, '2026-05-28 23:18:44', '2026-05-28 23:19:03'),
(16, 'ORD-20260530-85F73', 11, 'trinh thi hoa', '0364663178', 'ha noi', 'vinh hung', 'vinh hung', '5 thanh dam', '', 29970000, 3000000, 0, 29970000, NULL, 'momo', 'chua_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2026-05-30 05:29:32', '2026-05-30 17:56:14'),
(17, 'ORD-20260531-C5349', 11, 'nguyen van a', '0364663178', 'ha noi', 'hoang mai', 'vinh hung', '5 thanh dam', '', 4990000, 500000, 0, 4990000, NULL, 'cod', 'chua_tt', NULL, 'da_huy', NULL, NULL, NULL, NULL, '2026-05-30 19:09:11', '2026-05-30 19:10:19'),
(18, 'ORD-20260531-B73D9', 11, 'TRINH THI HOA', '0364663178', 'Hà Nội', 'Hoàng Mai', 'Vĩnh Hưng', '5 thanh đàm', '', 31980000, 1500000, 0, 31980000, NULL, 'momo', 'chua_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2026-05-30 23:29:29', '2026-05-30 23:30:00'),
(19, 'ORD-20260531-C2EDF', 11, 'TRINH THI HOA', '0364663178', 'Hà Nội', 'Hoàng Mai', 'Vĩnh Hưng', '5 thanh đàm', '', 4990000, 500000, 0, 4990000, NULL, 'cod', 'chua_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2026-05-30 23:43:03', '2026-05-30 23:43:26'),
(20, 'DH20260501', 13, 'Nguyễn Thị Lan', '0912111222', 'Hà Nội', 'Đống Đa', 'Láng Hạ', '15 Chùa Láng', NULL, 27990000, 0, 0, 27990000, NULL, 'momo', 'da_tt', 'MOMO26050100001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-01 09:15:00', '2026-05-31 00:12:28'),
(21, 'DH20260502', 14, 'Trần Văn Hùng', '0923222333', 'TP HCM', 'Quận 3', 'Võ Thị Sáu', '22 Nguyễn Đình Chiểu', NULL, 34990000, 1000000, 0, 33990000, NULL, 'momo', 'da_tt', 'MOMO26050200001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-02 10:30:00', '2026-05-31 00:12:28'),
(22, 'DH20260503', 15, 'Lê Thị Mai', '0934333444', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '88 Trần Thái Tông', NULL, 22990000, 0, 0, 22990000, NULL, 'momo', 'da_tt', 'MOMO26050300001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-03 14:00:00', '2026-05-31 00:12:28'),
(23, 'DH20260504', 1, 'Nguyễn Minh Quân', '0987654321', 'Hà Nội', 'Hai Bà Trưng', 'Bách Khoa', '123 Phố Huế', NULL, 39990000, 2000000, 0, 37990000, NULL, 'momo', 'da_tt', 'MOMO26050400001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-04 11:00:00', '2026-05-31 00:12:28'),
(24, 'DH20260505', 16, 'Phạm Minh Tuấn', '0945444555', 'Đà Nẵng', 'Hải Châu', 'Hải Châu 1', '50 Trần Phú', NULL, 45990000, 0, 0, 45990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26050500001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-05 08:30:00', '2026-05-31 00:12:28'),
(25, 'DH20260506', 17, 'Hoàng Thị Thu', '0956555666', 'Hà Nội', 'Ba Đình', 'Điện Biên', '8 Hoàng Diệu', NULL, 31990000, 0, 0, 31990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26050600001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-06 13:00:00', '2026-05-31 00:12:28'),
(26, 'DH20260507', 18, 'Vũ Đức Mạnh', '0967666777', 'Hải Phòng', 'Lê Chân', 'Cầu Đất', '30 Tô Hiệu', NULL, 52990000, 3000000, 0, 49990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26050700001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-07 15:30:00', '2026-05-31 00:12:28'),
(27, 'DH20260508', 2, 'Trần Quốc Bảo', '0978123456', 'Hà Nội', 'Hoàng Mai', 'Vĩnh Hưng', '99 Lĩnh Nam', NULL, 29990000, 0, 0, 29990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26050800001', 'dang_giao', NULL, NULL, NULL, NULL, '2026-05-08 09:00:00', '2026-05-31 00:12:28'),
(28, 'DH20260509', 19, 'Đặng Thị Hương', '0978777888', 'Hà Nội', 'Thanh Xuân', 'Khương Đình', '45 Nguyễn Trãi', NULL, 46990000, 0, 0, 46990000, NULL, 'vnpay', 'da_tt', 'VNPAY26050900001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-09 10:00:00', '2026-05-31 00:12:28'),
(29, 'DH20260510', 20, 'Ngô Văn Đức', '0989888999', 'Cần Thơ', 'Ninh Kiều', 'An Hòa', '10 Mậu Thân', NULL, 40990000, 2000000, 0, 38990000, NULL, 'vnpay', 'da_tt', 'VNPAY26051000001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-10 14:30:00', '2026-05-31 00:12:28'),
(30, 'DH20260511', 21, 'Bùi Thị Ngọc', '0901999000', 'Hà Nội', 'Tây Hồ', 'Xuân La', '120 Lạc Long Quân', NULL, 34990000, 0, 0, 34990000, NULL, 'vnpay', 'da_tt', 'VNPAY26051100001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-11 11:00:00', '2026-05-31 00:12:28'),
(31, 'DH20260512', 3, 'Lê Hoàng Nam', '0965234789', 'TP HCM', 'Quận 1', 'Bến Nghé', '5 Lê Lợi', NULL, 27990000, 0, 0, 27990000, NULL, 'vnpay', 'da_tt', 'VNPAY26051200001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-12 09:30:00', '2026-05-31 00:12:28'),
(32, 'DH20260513', 22, 'Đinh Văn Khoa', '0912000111', 'Hà Nội', 'Long Biên', 'Giang Biên', '88 Ngô Gia Tự', NULL, 52990000, 0, 0, 52990000, NULL, 'vnpay', 'da_tt', 'VNPAY26051300001', 'dang_giao', NULL, NULL, NULL, NULL, '2026-05-13 16:00:00', '2026-05-31 00:12:28'),
(33, 'DH20260514', 4, 'Phạm Đức Anh', '0934567891', 'Hà Nội', 'Nam Từ Liêm', 'Phú Đô', '22 Mễ Trì', NULL, 39990000, 1000000, 0, 38990000, NULL, 'zalopay', 'da_tt', 'ZALO26051400001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-14 10:00:00', '2026-05-31 00:12:28'),
(34, 'DH20260515', 13, 'Nguyễn Thị Lan', '0912111222', 'Hà Nội', 'Đống Đa', 'Láng Hạ', '15 Chùa Láng', NULL, 31990000, 0, 0, 31990000, NULL, 'zalopay', 'da_tt', 'ZALO26051500001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-15 13:30:00', '2026-05-31 00:12:28'),
(35, 'DH20260516', 5, 'Đặng Hải Đăng', '0912345678', 'Hà Nội', 'Hoàn Kiếm', 'Hàng Bài', '3 Đinh Tiên Hoàng', NULL, 45990000, 2000000, 0, 43990000, NULL, 'zalopay', 'da_tt', 'ZALO26051600001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-16 09:00:00', '2026-05-31 00:12:28'),
(36, 'DH20260517', 14, 'Trần Văn Hùng', '0923222333', 'TP HCM', 'Quận 3', 'Võ Thị Sáu', '22 Nguyễn Đình Chiểu', NULL, 22990000, 0, 0, 22990000, NULL, 'momo', 'da_tt', 'MOMO26051700001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-17 14:00:00', '2026-05-31 00:12:28'),
(37, 'DH20260518', 6, 'Võ Minh Hiếu', '0981122334', 'TP HCM', 'Bình Thạnh', 'Phường 25', '45 Xô Viết Nghệ Tĩnh', NULL, 40990000, 0, 0, 40990000, NULL, 'momo', 'da_tt', 'MOMO26051800001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-18 10:30:00', '2026-05-31 00:12:28'),
(38, 'DH20260519', 15, 'Lê Thị Mai', '0934333444', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '88 Trần Thái Tông', NULL, 46990000, 3000000, 0, 43990000, NULL, 'momo', 'da_tt', 'MOMO26051900001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-19 11:00:00', '2026-05-31 00:12:28'),
(39, 'DH20260520', 16, 'Phạm Minh Tuấn', '0945444555', 'Đà Nẵng', 'Hải Châu', 'Hải Châu 1', '50 Trần Phú', NULL, 29990000, 0, 0, 29990000, NULL, 'vnpay', 'da_tt', 'VNPAY26052000001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-20 08:00:00', '2026-05-31 00:12:28'),
(40, 'DH20260521', 7, 'Nguyễn Khánh', '0977445566', 'Hà Nội', 'Đống Đa', 'Khâm Thiên', '10 Khâm Thiên', NULL, 34990000, 0, 0, 34990000, NULL, 'vnpay', 'da_tt', 'VNPAY26052100001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-21 15:00:00', '2026-05-31 00:12:28'),
(41, 'DH20260522', 17, 'Hoàng Thị Thu', '0956555666', 'Hà Nội', 'Ba Đình', 'Điện Biên', '8 Hoàng Diệu', NULL, 39990000, 2000000, 0, 37990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26052200001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-22 09:30:00', '2026-05-31 00:12:28'),
(42, 'DH20260523', 8, 'Lý Thành Công', '0944556677', 'Hà Nội', 'Cầu Giấy', 'Nghĩa Tân', '15 Hoàng Quốc Việt', NULL, 52990000, 0, 0, 52990000, NULL, 'vnpay', 'da_tt', 'VNPAY26052300001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-23 13:00:00', '2026-05-31 00:12:28'),
(43, 'DH20260524', 18, 'Vũ Đức Mạnh', '0967666777', 'Hải Phòng', 'Lê Chân', 'Cầu Đất', '30 Tô Hiệu', NULL, 27990000, 0, 0, 27990000, NULL, 'zalopay', 'da_tt', 'ZALO26052400001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-24 10:00:00', '2026-05-31 00:12:28'),
(44, 'DH20260525', 9, 'Bùi Trung Kiên', '0922334455', 'Hà Nội', 'Thanh Trì', 'Ngũ Hiệp', '55 Ngọc Hồi', NULL, 31990000, 1000000, 0, 30990000, NULL, 'momo', 'da_tt', 'MOMO26052500001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-25 14:30:00', '2026-05-31 00:12:28'),
(45, 'DH20260526', 19, 'Đặng Thị Hương', '0978777888', 'Hà Nội', 'Thanh Xuân', 'Khương Đình', '45 Nguyễn Trãi', NULL, 40990000, 0, 0, 40990000, NULL, 'vnpay', 'da_tt', 'VNPAY26052600001', 'dang_giao', NULL, NULL, NULL, NULL, '2026-05-26 11:00:00', '2026-05-31 00:12:28'),
(46, 'DH20260527', 10, 'Hoàng Nhật Minh', '0909888777', 'Hà Nội', 'Gia Lâm', 'Trâu Quỳ', '5 Nguyễn Văn Cừ', NULL, 22990000, 0, 0, 22990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26052700001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-27 09:00:00', '2026-05-31 00:12:28'),
(47, 'DH20260528', 20, 'Ngô Văn Đức', '0989888999', 'Cần Thơ', 'Ninh Kiều', 'An Hòa', '10 Mậu Thân', NULL, 45990000, 2000000, 0, 43990000, NULL, 'momo', 'da_tt', 'MOMO26052800001', 'da_giao', NULL, NULL, NULL, NULL, '2026-05-28 10:30:00', '2026-05-31 00:12:28'),
(48, 'DH20260529', 21, 'Bùi Thị Ngọc', '0901999000', 'Hà Nội', 'Tây Hồ', 'Xuân La', '120 Lạc Long Quân', NULL, 34990000, 0, 0, 34990000, NULL, 'zalopay', 'da_tt', 'ZALO26052900001', 'da_xac_nhan', NULL, NULL, NULL, NULL, '2026-05-29 14:00:00', '2026-05-31 00:12:28'),
(49, 'DH20260530', 22, 'Đinh Văn Khoa', '0912000111', 'Hà Nội', 'Long Biên', 'Giang Biên', '88 Ngô Gia Tự', NULL, 39990000, 0, 0, 39990000, NULL, 'vnpay', 'da_tt', 'VNPAY26053000001', 'cho_xac_nhan', NULL, NULL, NULL, NULL, '2026-05-30 16:00:00', '2026-05-31 00:12:28'),
(50, 'ORD-20260531-35276', 11, 'TRINH THI HOA', '0364663178', 'Hà Nội', 'Hoàng Mai', 'Vĩnh Hưng', '5 thanh đàm', '', 31490000, 1500000, 0, 31490000, NULL, 'chuyen_khoan', 'chua_tt', NULL, 'dang_dong_hang', NULL, NULL, NULL, NULL, '2026-05-31 14:22:16', '2026-05-31 14:22:31'),
(84, 'DH20260101B', 1, 'Nguyễn Minh Quân', '0987654321', 'Hà Nội', 'Hai Bà Trưng', 'Bách Khoa', '123 Phố Huế', NULL, 33990000, 0, 0, 33990000, NULL, 'momo', 'da_tt', 'MOMO26010100002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-03 09:15:00', '2026-05-31 00:27:38'),
(85, 'DH20260102B', 2, 'Trần Quốc Bảo', '0978123456', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '45 Trần Thái Tông', NULL, 29990000, 1000000, 0, 28990000, NULL, 'vnpay', 'da_tt', 'VNPAY26010200002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-05 10:30:00', '2026-05-31 00:27:38'),
(86, 'DH20260103B', 3, 'Lê Hoàng Nam', '0965234789', 'TP HCM', 'Quận 1', 'Bến Nghé', '10 Lê Lợi', NULL, 45990000, 0, 0, 45990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26010300002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-08 14:00:00', '2026-05-31 00:27:38'),
(87, 'DH20260104B', 4, 'Phạm Đức Anh', '0934567891', 'Đà Nẵng', 'Hải Châu', 'Hải Châu 1', '88 Trần Phú', NULL, 21990000, 0, 0, 21990000, NULL, 'momo', 'da_tt', 'MOMO26010400002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-10 11:00:00', '2026-05-31 00:27:38'),
(88, 'DH20260105B', 5, 'Đặng Hải Đăng', '0912345678', 'Hà Nội', 'Đống Đa', 'Láng Hạ', '67 Chùa Láng', NULL, 39990000, 2000000, 0, 37990000, NULL, 'zalopay', 'da_tt', 'ZALO26010500002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-12 08:30:00', '2026-05-31 00:27:38'),
(89, 'DH20260106B', 6, 'Võ Minh Hiếu', '0981122334', 'Hà Nội', 'Ba Đình', 'Điện Biên', '1 Hoàng Diệu', NULL, 27990000, 0, 0, 27990000, NULL, 'vnpay', 'da_tt', 'VNPAY26010600002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-15 13:00:00', '2026-05-31 00:27:38'),
(90, 'DH20260107B', 7, 'Nguyễn Khánh', '0977445566', 'Hải Phòng', 'Hồng Bàng', 'Hoàng Văn Thụ', '22 Điện Biên Phủ', NULL, 34990000, 0, 0, 34990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26010700002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-18 15:30:00', '2026-05-31 00:27:38'),
(91, 'DH20260108B', 8, 'Lý Thành Công', '0944556677', 'Hà Nội', 'Thanh Xuân', 'Khương Đình', '33 Nguyễn Trãi', NULL, 52990000, 3000000, 0, 49990000, NULL, 'momo', 'da_tt', 'MOMO26010800002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-20 09:30:00', '2026-05-31 00:27:38'),
(92, 'DH20260109B', 9, 'Bùi Trung Kiên', '0922334455', 'Hà Nội', 'Hoàng Mai', 'Vĩnh Hưng', '99 Lĩnh Nam', NULL, 46990000, 0, 0, 46990000, NULL, 'vnpay', 'da_tt', 'VNPAY26010900002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-22 14:30:00', '2026-05-31 00:27:38'),
(93, 'DH20260110B', 10, 'Hoàng Nhật Minh', '0909888777', 'Cần Thơ', 'Ninh Kiều', 'An Hòa', '5 Mậu Thân', NULL, 22990000, 0, 0, 22990000, NULL, 'zalopay', 'da_tt', 'ZALO26011000002', 'da_giao', NULL, NULL, NULL, NULL, '2026-01-25 10:00:00', '2026-05-31 00:27:38'),
(94, 'DH20260201B', 1, 'Nguyễn Minh Quân', '0987654321', 'Hà Nội', 'Hai Bà Trưng', 'Bách Khoa', '123 Phố Huế', NULL, 39990000, 0, 0, 39990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26020100002', 'da_giao', NULL, NULL, NULL, NULL, '2026-02-03 09:00:00', '2026-05-31 00:27:38'),
(95, 'DH20260202B', 2, 'Trần Quốc Bảo', '0978123456', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '45 Trần Thái Tông', NULL, 31990000, 0, 0, 31990000, NULL, 'momo', 'da_tt', 'MOMO26020200002', 'da_giao', NULL, NULL, NULL, NULL, '2026-02-05 14:00:00', '2026-05-31 00:27:38'),
(96, 'DH20260203B', 3, 'Lê Hoàng Nam', '0965234789', 'TP HCM', 'Quận 1', 'Bến Nghé', '10 Lê Lợi', NULL, 27990000, 1000000, 0, 26990000, NULL, 'vnpay', 'da_tt', 'VNPAY26020300002', 'da_giao', NULL, NULL, NULL, NULL, '2026-02-08 10:30:00', '2026-05-31 00:27:38'),
(97, 'DH20260204B', 4, 'Phạm Đức Anh', '0934567891', 'Đà Nẵng', 'Hải Châu', 'Hải Châu 1', '88 Trần Phú', NULL, 46990000, 0, 0, 46990000, NULL, 'zalopay', 'da_tt', 'ZALO26020400002', 'da_giao', NULL, NULL, NULL, NULL, '2026-02-10 11:00:00', '2026-05-31 00:27:38'),
(98, 'DH20260205B', 5, 'Đặng Hải Đăng', '0912345678', 'Hà Nội', 'Đống Đa', 'Láng Hạ', '67 Chùa Láng', NULL, 34990000, 2000000, 0, 32990000, NULL, 'momo', 'da_tt', 'MOMO26020500002', 'da_giao', NULL, NULL, NULL, NULL, '2026-02-14 08:30:00', '2026-05-31 00:27:38'),
(99, 'DH20260206B', 6, 'Võ Minh Hiếu', '0981122334', 'Hà Nội', 'Ba Đình', 'Điện Biên', '1 Hoàng Diệu', NULL, 52990000, 0, 0, 52990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26020600002', 'da_giao', NULL, NULL, NULL, NULL, '2026-02-18 13:00:00', '2026-05-31 00:27:38'),
(100, 'DH20260207B', 7, 'Nguyễn Khánh', '0977445566', 'Hải Phòng', 'Hồng Bàng', 'Hoàng Văn Thụ', '22 Điện Biên Phủ', NULL, 22990000, 0, 0, 22990000, NULL, 'vnpay', 'da_tt', 'VNPAY26020700002', 'da_giao', NULL, NULL, NULL, NULL, '2026-02-20 15:30:00', '2026-05-31 00:27:38'),
(101, 'DH20260208B', 8, 'Lý Thành Công', '0944556677', 'Hà Nội', 'Thanh Xuân', 'Khương Đình', '33 Nguyễn Trãi', NULL, 29990000, 0, 0, 29990000, NULL, 'zalopay', 'da_tt', 'ZALO26020800002', 'da_giao', NULL, NULL, NULL, NULL, '2026-02-24 09:30:00', '2026-05-31 00:27:38'),
(102, 'DH20260301B', 9, 'Bùi Trung Kiên', '0922334455', 'Hà Nội', 'Hoàng Mai', 'Vĩnh Hưng', '99 Lĩnh Nam', NULL, 39990000, 0, 0, 39990000, NULL, 'vnpay', 'da_tt', 'VNPAY26030100002', 'da_giao', NULL, NULL, NULL, NULL, '2026-03-03 09:00:00', '2026-05-31 00:27:38'),
(103, 'DH20260302B', 10, 'Hoàng Nhật Minh', '0909888777', 'Cần Thơ', 'Ninh Kiều', 'An Hòa', '5 Mậu Thân', NULL, 46990000, 2000000, 0, 44990000, NULL, 'momo', 'da_tt', 'MOMO26030200002', 'da_giao', NULL, NULL, NULL, NULL, '2026-03-07 14:00:00', '2026-05-31 00:27:38'),
(104, 'DH20260303B', 1, 'Nguyễn Minh Quân', '0987654321', 'Hà Nội', 'Hai Bà Trưng', 'Bách Khoa', '123 Phố Huế', NULL, 31990000, 0, 0, 31990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26030300002', 'da_giao', NULL, NULL, NULL, NULL, '2026-03-10 10:30:00', '2026-05-31 00:27:38'),
(105, 'DH20260304B', 2, 'Trần Quốc Bảo', '0978123456', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '45 Trần Thái Tông', NULL, 52990000, 3000000, 0, 49990000, NULL, 'zalopay', 'da_tt', 'ZALO26030400002', 'da_giao', NULL, NULL, NULL, NULL, '2026-03-14 11:00:00', '2026-05-31 00:27:38'),
(106, 'DH20260305B', 3, 'Lê Hoàng Nam', '0965234789', 'TP HCM', 'Quận 1', 'Bến Nghé', '10 Lê Lợi', NULL, 27990000, 0, 0, 27990000, NULL, 'vnpay', 'da_tt', 'VNPAY26030500002', 'da_giao', NULL, NULL, NULL, NULL, '2026-03-18 08:30:00', '2026-05-31 00:27:38'),
(107, 'DH20260306B', 4, 'Phạm Đức Anh', '0934567891', 'Đà Nẵng', 'Hải Châu', 'Hải Châu 1', '88 Trần Phú', NULL, 34990000, 0, 0, 34990000, NULL, 'momo', 'da_tt', 'MOMO26030600002', 'da_giao', NULL, NULL, NULL, NULL, '2026-03-22 13:00:00', '2026-05-31 00:27:38'),
(108, 'DH20260307B', 5, 'Đặng Hải Đăng', '0912345678', 'Hà Nội', 'Đống Đa', 'Láng Hạ', '67 Chùa Láng', NULL, 22990000, 1000000, 0, 21990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26030700002', 'da_giao', NULL, NULL, NULL, NULL, '2026-03-26 15:30:00', '2026-05-31 00:27:38'),
(109, 'DH20260308B', 6, 'Võ Minh Hiếu', '0981122334', 'Hà Nội', 'Ba Đình', 'Điện Biên', '1 Hoàng Diệu', NULL, 45990000, 0, 0, 45990000, NULL, 'vnpay', 'da_tt', 'VNPAY26030800002', 'da_giao', NULL, NULL, NULL, NULL, '2026-03-29 09:30:00', '2026-05-31 00:27:38'),
(110, 'DH20260401B', 7, 'Nguyễn Khánh', '0977445566', 'Hải Phòng', 'Hồng Bàng', 'Hoàng Văn Thụ', '22 Điện Biên Phủ', NULL, 46990000, 0, 0, 46990000, NULL, 'momo', 'da_tt', 'MOMO26040100002', 'da_giao', NULL, NULL, NULL, NULL, '2026-04-02 09:00:00', '2026-05-31 00:27:38'),
(111, 'DH20260402B', 8, 'Lý Thành Công', '0944556677', 'Hà Nội', 'Thanh Xuân', 'Khương Đình', '33 Nguyễn Trãi', NULL, 39990000, 2000000, 0, 37990000, NULL, 'vnpay', 'da_tt', 'VNPAY26040200002', 'da_giao', NULL, NULL, NULL, NULL, '2026-04-06 14:00:00', '2026-05-31 00:27:38'),
(112, 'DH20260403B', 9, 'Bùi Trung Kiên', '0922334455', 'Hà Nội', 'Hoàng Mai', 'Vĩnh Hưng', '99 Lĩnh Nam', NULL, 29990000, 0, 0, 29990000, NULL, 'zalopay', 'da_tt', 'ZALO26040300002', 'da_giao', NULL, NULL, NULL, NULL, '2026-04-10 10:30:00', '2026-05-31 00:27:38'),
(113, 'DH20260404B', 10, 'Hoàng Nhật Minh', '0909888777', 'Cần Thơ', 'Ninh Kiều', 'An Hòa', '5 Mậu Thân', NULL, 52990000, 0, 0, 52990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26040400002', 'da_giao', NULL, NULL, NULL, NULL, '2026-04-14 11:00:00', '2026-05-31 00:27:38'),
(114, 'DH20260405B', 1, 'Nguyễn Minh Quân', '0987654321', 'Hà Nội', 'Hai Bà Trưng', 'Bách Khoa', '123 Phố Huế', NULL, 34990000, 1000000, 0, 33990000, NULL, 'momo', 'da_tt', 'MOMO26040500002', 'da_giao', NULL, NULL, NULL, NULL, '2026-04-18 08:30:00', '2026-05-31 00:27:38'),
(115, 'DH20260406B', 2, 'Trần Quốc Bảo', '0978123456', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '45 Trần Thái Tông', NULL, 27990000, 0, 0, 27990000, NULL, 'vnpay', 'da_tt', 'VNPAY26040600002', 'da_giao', NULL, NULL, NULL, NULL, '2026-04-22 13:00:00', '2026-05-31 00:27:38'),
(116, 'DH20260407B', 3, 'Lê Hoàng Nam', '0965234789', 'TP HCM', 'Quận 1', 'Bến Nghé', '10 Lê Lợi', NULL, 45990000, 2000000, 0, 43990000, NULL, 'zalopay', 'da_tt', 'ZALO26040700002', 'da_giao', NULL, NULL, NULL, NULL, '2026-04-26 15:30:00', '2026-05-31 00:27:38'),
(117, 'DH20260408B', 4, 'Phạm Đức Anh', '0934567891', 'Đà Nẵng', 'Hải Châu', 'Hải Châu 1', '88 Trần Phú', NULL, 31990000, 0, 0, 31990000, NULL, 'chuyen_khoan', 'da_tt', 'CK26040800002', 'da_giao', NULL, NULL, NULL, NULL, '2026-04-29 09:30:00', '2026-05-31 00:27:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` int(10) UNSIGNED NOT NULL,
  `khach_hang_id` int(10) UNSIGNED NOT NULL,
  `bien_the_id` int(10) UNSIGNED NOT NULL,
  `so_luong` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `gio_hang`
--

INSERT INTO `gio_hang` (`id`, `khach_hang_id`, `bien_the_id`, `so_luong`, `created_at`, `updated_at`) VALUES
(4, 12, 51, 1, '2026-05-30 17:47:57', '2026-05-30 17:47:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hang_san_xuat`
--

CREATE TABLE `hang_san_xuat` (
  `id` int(10) UNSIGNED NOT NULL,
  `ten` varchar(100) NOT NULL COMMENT 'Apple, Samsung, Xiaomi, OPPO...',
  `slug` varchar(120) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `quoc_gia` varchar(100) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `an_hien` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hang_san_xuat`
--

INSERT INTO `hang_san_xuat` (`id`, `ten`, `slug`, `logo`, `quoc_gia`, `mo_ta`, `an_hien`) VALUES
(1, 'Apple', 'apple', NULL, 'Hoa Kỳ', NULL, 1),
(2, 'Samsung', 'samsung', NULL, 'Hàn Quốc', NULL, 1),
(3, 'Xiaomi', 'xiaomi', NULL, 'Trung Quốc', NULL, 1),
(4, 'OPPO', 'oppo', NULL, 'Trung Quốc', NULL, 1),
(5, 'Vivo', 'vivo', NULL, 'Trung Quốc', NULL, 1),
(6, 'Realme', 'realme', NULL, 'Trung Quốc', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinh_anh_san_pham`
--

CREATE TABLE `hinh_anh_san_pham` (
  `id` int(10) UNSIGNED NOT NULL,
  `san_pham_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `thu_tu` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `la_hinh_chinh` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `id` int(10) UNSIGNED NOT NULL,
  `ho_ten` varchar(150) NOT NULL,
  `email` varchar(180) NOT NULL,
  `mat_khau` varchar(255) NOT NULL COMMENT 'bcrypt hash',
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `gioi_tinh` enum('nam','nu','khac') DEFAULT 'khac',
  `ngay_sinh` date DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `trang_thai` enum('hoat_dong','bi_khoa') NOT NULL DEFAULT 'hoat_dong',
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khach_hang`
--

INSERT INTO `khach_hang` (`id`, `ho_ten`, `email`, `mat_khau`, `so_dien_thoai`, `gioi_tinh`, `ngay_sinh`, `avatar`, `trang_thai`, `email_verified`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Minh Quân', 'quan1@gmail.com', '$2y$10$abc123', '0987654321', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-01-05 08:30:00', '2026-05-31 00:31:25'),
(2, 'Trần Quốc Bảo', 'bao2@gmail.com', '$2y$10$abc123', '0978123456', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-01-12 09:00:00', '2026-05-31 00:31:25'),
(3, 'Lê Hoàng Nam', 'nam3@gmail.com', '$2y$10$abc123', '0965234789', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-01-20 10:00:00', '2026-05-31 00:31:25'),
(4, 'Phạm Đức Anh', 'anh4@gmail.com', '$2y$10$abc123', '0934567891', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-02-03 08:00:00', '2026-05-31 00:31:25'),
(5, 'Đặng Hải Đăng', 'dang5@gmail.com', '$2y$10$abc123', '0912345678', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-02-14 09:30:00', '2026-05-31 00:31:25'),
(6, 'Võ Minh Hiếu', 'hieu6@gmail.com', '$2y$10$abc123', '0981122334', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-02-22 11:00:00', '2026-05-31 00:31:25'),
(7, 'Nguyễn Khánh', 'khanh7@gmail.com', '$2y$10$abc123', '0977445566', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-03-05 08:00:00', '2026-05-31 00:31:25'),
(8, 'Lý Thành Công', 'cong8@gmail.com', '$2y$10$abc123', '0944556677', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-03-15 10:00:00', '2026-05-31 00:31:25'),
(9, 'Bùi Trung Kiên', 'kien9@gmail.com', '$2y$10$abc123', '0922334455', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-03-25 09:00:00', '2026-05-31 00:31:25'),
(10, 'Hoàng Nhật Minh', 'minh10@gmail.com', '$2y$10$abc123', '0909888777', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-04-08 08:30:00', '2026-05-31 00:31:25'),
(11, 'TRINH THI HOA', 'hoa123@gmail.com', '$2y$12$RavPv6FbDox/pGgYOqrDees.4ZPJZMSDKV1EN.ffmU19Dr6xaUsvm', '0364663178', 'khac', '2004-02-13', 'avatars/img_6a1ba42c2f2100.65263563.gif', 'hoat_dong', 0, NULL, '2026-05-28 23:15:21', '2026-05-30 19:59:56'),
(12, 'Hoà', 'hoa@gmail.com', '$2y$12$t0Izr652xjFTEuPt/QNYU.cd5K3InoM3HeCaFq.h.W80lFZLB8jge', '0364663178', 'khac', '2004-02-13', 'avatars/img_6a1b8658c6dd09.11140062.gif', 'hoat_dong', 0, NULL, '2026-05-30 17:46:29', '2026-05-30 17:52:40'),
(13, 'Nguyễn Thị Lan', 'lan13@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0912111222', 'nu', '1998-03-15', NULL, 'hoat_dong', 1, NULL, '2026-05-01 08:00:00', '2026-05-31 00:12:28'),
(14, 'Trần Văn Hùng', 'hung14@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0923222333', 'nam', '1995-07-20', NULL, 'hoat_dong', 1, NULL, '2026-05-02 09:00:00', '2026-05-31 00:12:28'),
(15, 'Lê Thị Mai', 'mai15@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0934333444', 'nu', '2000-11-05', NULL, 'hoat_dong', 1, NULL, '2026-05-03 10:00:00', '2026-05-31 00:12:28'),
(16, 'Phạm Minh Tuấn', 'tuan16@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0945444555', 'nam', '1993-04-25', NULL, 'hoat_dong', 1, NULL, '2026-05-05 11:00:00', '2026-05-31 00:12:28'),
(17, 'Hoàng Thị Thu', 'thu17@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0956555666', 'nu', '2001-09-10', NULL, 'hoat_dong', 1, NULL, '2026-05-07 08:30:00', '2026-05-31 00:12:28'),
(18, 'Vũ Đức Mạnh', 'manh18@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0967666777', 'nam', '1997-01-30', NULL, 'hoat_dong', 1, NULL, '2026-05-09 14:00:00', '2026-05-31 00:12:28'),
(19, 'Đặng Thị Hương', 'huong19@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0978777888', 'nu', '1999-06-18', NULL, 'hoat_dong', 1, NULL, '2026-05-11 10:30:00', '2026-05-31 00:12:28'),
(20, 'Ngô Văn Đức', 'duc20@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0989888999', 'nam', '1996-12-22', NULL, 'hoat_dong', 1, NULL, '2026-05-13 09:00:00', '2026-05-31 00:12:28'),
(21, 'Bùi Thị Ngọc', 'ngoc21@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0901999000', 'nu', '2002-08-14', NULL, 'hoat_dong', 1, NULL, '2026-05-15 15:00:00', '2026-05-31 00:12:28'),
(22, 'Đinh Văn Khoa', 'khoa22@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0912000111', 'nam', '1994-05-03', NULL, 'hoat_dong', 1, NULL, '2026-05-17 11:00:00', '2026-05-31 00:12:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lich_su_don_hang`
--

CREATE TABLE `lich_su_don_hang` (
  `id` int(10) UNSIGNED NOT NULL,
  `don_hang_id` int(10) UNSIGNED NOT NULL,
  `trang_thai` varchar(50) NOT NULL,
  `ghi_chu` text DEFAULT NULL,
  `nguoi_thuc_hien` varchar(100) DEFAULT NULL COMMENT 'Admin name hoặc system',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lich_su_don_hang`
--

INSERT INTO `lich_su_don_hang` (`id`, `don_hang_id`, `trang_thai`, `ghi_chu`, `nguoi_thuc_hien`, `created_at`) VALUES
(1, 1, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-10 08:00:00'),
(2, 1, 'da_xac_nhan', 'Đã xác nhận đơn hàng', 'Admin', '2025-05-10 08:15:00'),
(3, 2, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-10 09:10:00'),
(4, 2, 'da_xac_nhan', 'Đã xác nhận đơn hàng', 'Admin', '2025-05-10 09:25:00'),
(5, 3, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-10 10:00:00'),
(6, 4, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-10 10:40:00'),
(7, 4, 'da_xac_nhan', 'Đã xác nhận đơn hàng', 'Admin', '2025-05-10 10:55:00'),
(8, 5, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-10 11:20:00'),
(9, 5, 'dang_giao', 'Đơn hàng đang được giao', 'Admin', '2025-05-10 13:00:00'),
(10, 5, 'da_giao', 'Đã giao hàng thành công', 'Admin', '2025-05-11 09:30:00'),
(11, 6, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-11 08:45:00'),
(12, 7, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-11 09:15:00'),
(13, 8, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-11 10:05:00'),
(14, 8, 'da_huy', 'Khách hàng yêu cầu hủy đơn', 'Admin', '2025-05-11 10:45:00'),
(15, 9, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-11 11:30:00'),
(16, 10, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-11 12:15:00'),
(17, 11, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-11 13:00:00'),
(18, 11, 'da_xac_nhan', 'Đã xác nhận đơn hàng', 'Admin', '2025-05-11 13:20:00'),
(19, 12, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-11 14:10:00'),
(20, 13, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-11 15:25:00'),
(21, 14, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2025-05-11 16:40:00'),
(22, 14, 'da_xac_nhan', 'Đã xác nhận đơn hàng', 'Admin', '2025-05-11 17:00:00'),
(23, 15, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2026-05-28 23:18:44'),
(24, 15, 'da_xac_nhan', '', 'Super Admin', '2026-05-28 23:19:03'),
(25, 14, 'hoan_hang', '', 'Super Admin', '2026-05-28 23:44:09'),
(26, 14, 'hoan_hang', '', 'Super Admin', '2026-05-28 23:44:13'),
(27, 14, 'da_giao', '', 'Super Admin', '2026-05-28 23:44:19'),
(28, 16, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2026-05-30 05:29:32'),
(29, 8, 'da_giao', '', 'Super Admin', '2026-05-30 17:55:56'),
(30, 16, 'da_giao', '', 'Super Admin', '2026-05-30 17:56:14'),
(31, 2, 'da_huy', '', 'Super Admin', '2026-05-30 17:56:48'),
(32, 17, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2026-05-30 19:09:11'),
(33, 18, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2026-05-30 23:29:29'),
(34, 18, 'da_giao', '', 'Super Admin', '2026-05-30 23:30:00'),
(35, 19, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2026-05-30 23:43:03'),
(36, 19, 'da_xac_nhan', '', 'Super Admin', '2026-05-30 23:43:17'),
(37, 19, 'dang_dong_hang', '', 'Super Admin', '2026-05-30 23:43:20'),
(38, 19, 'dang_giao', '', 'Super Admin', '2026-05-30 23:43:23'),
(39, 19, 'da_giao', '', 'Super Admin', '2026-05-30 23:43:26'),
(40, 3, 'da_giao', '', 'Super Admin', '2026-05-30 23:45:00'),
(41, 50, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2026-05-31 14:22:16'),
(42, 50, 'dang_dong_hang', '', 'Super Admin', '2026-05-31 14:22:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ma_giam_gia`
--

CREATE TABLE `ma_giam_gia` (
  `id` int(10) UNSIGNED NOT NULL,
  `ma` varchar(50) NOT NULL,
  `ten` varchar(150) DEFAULT NULL,
  `loai` enum('phan_tram','co_dinh') NOT NULL DEFAULT 'phan_tram',
  `gia_tri` decimal(12,2) NOT NULL COMMENT '% hoặc số tiền cố định',
  `giam_toi_da` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Giảm tối đa (cho loại %)',
  `don_hang_toi_thieu` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `so_luong_tong` int(10) UNSIGNED DEFAULT NULL COMMENT 'NULL = không giới hạn',
  `so_luong_da_dung` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gioi_han_moi_kh` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `bat_dau` datetime DEFAULT NULL,
  `ket_thuc` datetime DEFAULT NULL,
  `an_hien` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ma_giam_gia`
--

INSERT INTO `ma_giam_gia` (`id`, `ma`, `ten`, `loai`, `gia_tri`, `giam_toi_da`, `don_hang_toi_thieu`, `so_luong_tong`, `so_luong_da_dung`, `gioi_han_moi_kh`, `bat_dau`, `ket_thuc`, `an_hien`, `created_at`) VALUES
(1, 'WELCOME10', 'Giảm 10% chào mừng', 'phan_tram', '10.00', 500000, 1000000, 1000, 0, 1, NULL, '2025-12-31 23:59:59', 1, '2026-05-28 21:52:40'),
(2, 'FLASH500K', 'Flash sale giảm 500K', 'co_dinh', '500000.00', NULL, 5000000, 200, 0, 1, NULL, '2025-06-30 23:59:59', 1, '2026-05-28 21:52:40'),
(3, 'PHONEZONE5', 'Ưu đãi 5% mọi đơn', 'phan_tram', '5.00', 300000, 500000, NULL, 0, 1, NULL, '2025-12-31 23:59:59', 1, '2026-05-28 21:52:40'),
(4, 'SALE10', 'Giảm 10% tối đa 500K', 'phan_tram', '10.00', 500000, 5000000, 100, 0, 1, '2025-01-01 00:00:00', '2025-12-31 23:59:59', 1, '2026-05-28 22:12:51'),
(5, 'GIAM200K', 'Giảm trực tiếp 200K', 'co_dinh', '200000.00', NULL, 3000000, 50, 0, 1, '2025-01-01 00:00:00', '2025-12-31 23:59:59', 1, '2026-05-28 22:12:51'),
(6, 'FREESHIP', 'Miễn phí vận chuyển', 'co_dinh', '30000.00', NULL, 1000000, NULL, 0, 2, '2025-01-01 00:00:00', '2025-12-31 23:59:59', 1, '2026-05-28 22:12:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhat_ky_admin`
--

CREATE TABLE `nhat_ky_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `hanh_dong` varchar(100) NOT NULL COMMENT 'create_product, update_order...',
  `doi_tuong` varchar(50) DEFAULT NULL COMMENT 'san_pham, don_hang...',
  `doi_tuong_id` int(10) UNSIGNED DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id` int(10) UNSIGNED NOT NULL,
  `danh_muc_id` int(10) UNSIGNED NOT NULL,
  `hang_id` int(10) UNSIGNED NOT NULL,
  `ten` varchar(255) NOT NULL,
  `slug` varchar(280) NOT NULL,
  `mo_ta_ngan` varchar(500) DEFAULT NULL,
  `mo_ta_chi_tiet` longtext DEFAULT NULL,
  `hinh_chinh` varchar(255) DEFAULT NULL,
  `noi_bat` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Hiển thị trang chủ',
  `ban_chay` tinyint(1) NOT NULL DEFAULT 0,
  `an_hien` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` varchar(500) DEFAULT NULL,
  `luot_xem` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id`, `danh_muc_id`, `hang_id`, `ten`, `slug`, `mo_ta_ngan`, `mo_ta_chi_tiet`, `hinh_chinh`, `noi_bat`, `ban_chay`, `an_hien`, `meta_title`, `meta_desc`, `luot_xem`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'iPhone 15 Pro Max 256GB - Chính hãng VN/A', 'iphone-15-pro-max-256gb-chinh-hang', 'Smartphone cao cấp nhất của Apple năm 2024 với chip A17 Pro, camera 48MP và màn hình 6.7 inch ProMotion 120Hz.', 'iPhone 15 Pro Max là chiếc điện thoại flagship cao cấp nhất của Apple, được trang bị chip A17 Pro tiên tiến nhất được sản xuất trên tiến trình 3nm, mang lại hiệu năng vượt trội cùng khả năng tiết kiệm pin tốt hơn.', 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llmyzv0274589d', 1, 1, 1, 'iPhone 15 Pro Max 256GB Chính Hãng | PhoneZone', 'Mua iPhone 15 Pro Max 256GB chính hãng tại PhoneZone. Giá tốt nhất, bảo hành 12 tháng.', 856, '2026-01-05 08:00:00', '2026-05-31 00:24:22'),
(2, 2, 2, 'Samsung Galaxy S24 Ultra 256GB – Chính hãng', 'samsung-galaxy-s24-ultra-256gb', 'Flagship Android cao cấp của Samsung với bút S Pen tích hợp và AI Galaxy.', 'Samsung Galaxy S24 Ultra mang đến trải nghiệm smartphone cao cấp nhất với chip Snapdragon 8 Gen 3, camera 200MP và tích hợp S Pen.', 'https://cdn-v2.didongviet.vn/files/products/2024/0/18/1/1705512988961_samsung_galaxy_s24_ultra_den_didongviet.png', 1, 1, 1, 'Samsung Galaxy S24 Ultra 256GB | PhoneZone', 'Mua Samsung Galaxy S24 Ultra chính hãng tại PhoneZone.', 934, '2026-01-08 09:00:00', '2026-05-31 00:24:22'),
(3, 3, 3, 'Xiaomi 14 Ultra 512GB – Chính hãng', 'xiaomi-14-ultra-512gb', 'Flagship Xiaomi với hệ thống camera Leica và chip Snapdragon 8 Gen 3.', 'Xiaomi 14 Ultra là đỉnh cao công nghệ của Xiaomi với camera đồng phát triển cùng Leica, chip Snapdragon 8 Gen 3 và màn hình AMOLED 6.73 inch.', NULL, 1, 0, 1, 'Xiaomi 14 Ultra 512GB | PhoneZone', 'Mua Xiaomi 14 Ultra chính hãng tại PhoneZone.', 687, '2026-01-15 09:00:00', '2026-05-31 00:24:22'),
(7, 1, 1, 'iPhone 14 Pro 256GB', 'iphone-14-pro-256gb', 'iPhone cao cấp màn 120Hz', 'iPhone 14 Pro sở hữu Dynamic Island và chip A16 Bionic.', 'products/img_6a192c2b9b8361.78846331.jpg', 1, 1, 1, 'iPhone 14 Pro Chính Hãng', 'Mua iPhone 14 Pro giá tốt.', 743, '2025-11-10 09:00:00', '2026-05-31 00:24:22'),
(8, 1, 1, 'iPhone 14 Plus 128GB', 'iphone-14-plus-128gb', 'iPhone màn lớn pin khỏe', 'iPhone 14 Plus có màn hình lớn và pin cực tốt.', 'products/img_6a192c53cf2172.67663386.jpeg', 1, 1, 1, 'iPhone 14 Plus', 'iPhone 14 Plus chính hãng.', 612, '2025-11-15 09:00:00', '2026-05-31 00:24:22'),
(9, 1, 1, 'iPhone 13 128GB', 'iphone-13-128gb', 'iPhone hiệu năng ổn định', 'iPhone 13 phù hợp chơi game và chụp ảnh.', 'products/img_6a192c73b40003.16588058.jpg', 1, 1, 1, 'iPhone 13', 'iPhone 13 giá tốt.', 534, '2025-10-20 10:00:00', '2026-05-31 00:24:22'),
(10, 1, 1, 'iPhone 12 Mini', 'iphone-12-mini', 'iPhone nhỏ gọn', 'iPhone 12 Mini dành cho người thích máy nhỏ.', 'products/img_6a192c919353b9.14864688.jpg', 0, 0, 1, 'iPhone 12 Mini', 'iPhone nhỏ gọn hiệu năng cao.', 287, '2025-09-12 10:00:00', '2026-05-31 00:24:22'),
(11, 1, 2, 'Samsung Galaxy S23 Ultra', 'samsung-galaxy-s23-ultra', 'Flagship Samsung cao cấp', 'S23 Ultra có camera zoom mạnh và bút S-Pen.', 'products/img_6a192cb609d263.82881506.webp', 1, 1, 1, 'Samsung Galaxy S23 Ultra', 'Galaxy S23 Ultra chính hãng.', 756, '2025-12-05 09:00:00', '2026-05-31 00:24:22'),
(12, 1, 2, 'Samsung Galaxy S23 FE', 'samsung-galaxy-s23-fe', 'Flagship giá dễ tiếp cận', 'S23 FE hiệu năng mạnh camera đẹp.', 'products/img_6a192ba3b23ab9.35968836.jpg', 1, 1, 1, 'Samsung Galaxy S23 FE', 'Samsung S23 FE giá tốt.', 623, '2025-12-08 09:00:00', '2026-05-31 00:24:22'),
(13, 1, 2, 'Samsung Galaxy A55 5G', 'samsung-galaxy-a55-5g', 'Tầm trung pin khỏe', 'Galaxy A55 có màn hình AMOLED đẹp.', 'products/img_6a192b76ec4432.49104645.webp', 1, 1, 1, 'Galaxy A55 5G', 'Samsung A55 chính hãng.', 445, '2026-02-10 10:00:00', '2026-05-31 00:24:22'),
(14, 1, 2, 'Samsung Galaxy Z Flip5', 'samsung-galaxy-z-flip5', 'Điện thoại gập thời trang', 'Galaxy Z Flip5 thiết kế hiện đại.', 'products/img_6a192b88333aa8.90741551.jpg', 1, 0, 1, 'Galaxy Z Flip5', 'Điện thoại Samsung gập.', 512, '2025-11-20 10:00:00', '2026-05-31 00:24:22'),
(15, 1, 3, 'Xiaomi 13T Pro', 'xiaomi-13t-pro', 'Camera Leica cao cấp', 'Xiaomi 13T Pro hiệu năng mạnh sạc siêu nhanh.', 'products/img_6a192a782daae4.93224543.webp', 1, 1, 1, 'Xiaomi 13T Pro', 'Điện thoại Xiaomi cao cấp.', 543, '2025-12-01 09:00:00', '2026-05-31 00:24:22'),
(16, 1, 3, 'Redmi Note 13 Pro', 'redmi-note-13-pro', 'Giá rẻ cấu hình mạnh', 'Redmi Note 13 Pro phù hợp học sinh sinh viên.', 'products/img_6a192a98ccec87.71104891.jpg', 0, 1, 1, 'Redmi Note 13 Pro', 'Redmi Note 13 Pro giá tốt.', 412, '2026-01-20 10:00:00', '2026-05-31 00:24:22'),
(17, 1, 3, 'POCO X6 Pro', 'poco-x6-pro', 'Gaming phone giá tốt', 'POCO X6 Pro hiệu năng mạnh cho game thủ.', 'products/img_6a192ac855f836.90812525.webp', 0, 1, 1, 'POCO X6 Pro', 'POCO X6 Pro cấu hình mạnh.', 389, '2026-02-05 10:00:00', '2026-05-31 00:24:22'),
(18, 1, 3, 'Redmi 13C', 'redmi-13c', 'Điện thoại phổ thông', 'Redmi 13C pin khỏe giá rẻ.', 'products/img_6a192b0a6ce547.34400176.png', 0, 0, 1, 'Redmi 13C', 'Xiaomi Redmi giá rẻ.', 198, '2025-11-25 10:00:00', '2026-05-31 00:24:22'),
(19, 1, 4, 'OPPO Find X6 Pro', 'oppo-find-x6-pro', 'Flagship camera đẹp', 'Find X6 Pro có camera Hasselblad cao cấp.', 'products/img_6a192b4251a046.44013849.webp', 1, 1, 1, 'OPPO Find X6 Pro', 'OPPO flagship chính hãng.', 478, '2025-12-10 09:00:00', '2026-05-31 00:24:22'),
(20, 1, 4, 'OPPO Reno11 F', 'oppo-reno11-f', 'Thiết kế đẹp selfie tốt', 'Reno11 F phù hợp giới trẻ.', 'products/img_6a192b54bbae27.62396641.webp', 0, 1, 1, 'OPPO Reno11 F', 'OPPO Reno11 F giá tốt.', 334, '2026-02-20 10:00:00', '2026-05-31 00:24:22'),
(21, 1, 4, 'OPPO A79 5G', 'oppo-a79-5g', 'Pin khỏe sạc nhanh', 'OPPO A79 đáp ứng tốt nhu cầu cơ bản.', 'products/img_6a192b28b0b247.15985983.webp', 0, 0, 1, 'OPPO A79 5G', 'Điện thoại OPPO giá rẻ.', 212, '2026-03-01 10:00:00', '2026-05-31 00:24:22'),
(22, 5, 5, 'Vivo X100 Pro', 'vivo-x100-pro', 'Camera Zeiss flagship', 'Vivo X100 Pro chụp ảnh chuyên nghiệp.', 'products/img_6a192cd51410f9.28063444.png', 1, 1, 1, 'Vivo X100 Pro', 'Vivo flagship cao cấp.', 567, '2026-01-25 09:00:00', '2026-05-31 00:24:22'),
(23, 5, 5, 'Vivo V30 5G', 'vivo-v30-5g', 'Thiết kế mỏng nhẹ', 'Vivo V30 nổi bật với camera selfie.', 'products/img_6a192cfe335812.64405919.webp', 0, 1, 1, 'Vivo V30 5G', 'Vivo V30 chính hãng.', 289, '2026-02-28 10:00:00', '2026-05-31 00:24:22'),
(24, 5, 5, 'Vivo Y100', 'vivo-y100', 'Pin lớn giá hợp lý', 'Vivo Y100 phù hợp nhu cầu cơ bản.', 'products/img_6a192d251d21f9.05448826.webp', 0, 0, 1, 'Vivo Y100', 'Điện thoại Vivo giá tốt.', 167, '2026-03-10 10:00:00', '2026-05-31 00:24:22'),
(25, 6, 6, 'Realme GT5 Pro', 'realme-gt5-pro', 'Gaming phone mạnh mẽ', 'Realme GT5 Pro dùng chip Snapdragon cao cấp.', 'products/img_6a192d552593b4.87879431.jpg', 1, 1, 1, 'Realme GT5 Pro', 'Điện thoại Realme gaming.', 423, '2025-12-15 09:00:00', '2026-05-31 00:24:22'),
(26, 6, 6, 'Realme 12 Pro Plus', 'realme-12-pro-plus', 'Camera zoom đẹp', 'Realme 12 Pro Plus có camera tiềm vọng.', 'products/img_6a192d8237e350.65681354.jpg', 0, 1, 1, 'Realme 12 Pro Plus', 'Realme camera đẹp.', 312, '2026-02-01 10:00:00', '2026-05-31 00:24:22'),
(27, 1, 6, 'Realme C67', 'realme-c67', 'Điện thoại giá rẻ', 'Realme C67 pin khỏe cho học sinh sinh viên.', 'c67.jpg', 0, 0, 1, 'Realme C67', 'Realme C67 giá tốt.', 187, '2026-03-05 10:00:00', '2026-05-31 00:24:22'),
(28, 1, 1, 'SDSadsa', 'sdsadsasdsd', 'dsdsdsds', 'dsdssdsdsđs', 'products/img_6a193606eca569.99772796.jpeg', 0, 0, 0, '', '', 0, '2026-05-28 23:45:27', '2026-05-28 23:45:50'),
(30, 1, 1, 'iPhone 15 128GB', 'iphone-15-128gb', 'iPhone 15 với chip A16 Bionic, camera 48MP và cổng USB-C.', 'iPhone 15 là bước nâng cấp đáng kể với chip A16 Bionic mạnh mẽ, camera chính 48MP, Dynamic Island và cổng USB-C tiện lợi. Màn hình Super Retina XDR 6.1 inch sắc nét.', 'https://media.ldlc.com/r1600/ld/products/00/06/06/40/LD0006064014.jpg', 1, 1, 1, 'iPhone 15 128GB Chính Hãng | PhoneZone', 'Mua iPhone 15 128GB chính hãng giá tốt tại PhoneZone.', 924, '2026-01-10 08:00:00', '2026-05-31 00:24:22'),
(31, 1, 1, 'iPhone 15 Plus 128GB', 'iphone-15-plus-128gb', 'iPhone 15 Plus màn hình lớn 6.7 inch, pin siêu trâu.', 'iPhone 15 Plus sở hữu màn hình Super Retina XDR 6.7 inch rộng lớn, chip A16 Bionic, camera 48MP và dung lượng pin khổng lồ cho thời gian sử dụng lên đến 26 giờ.', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6525/6525391_sd.jpg', 1, 0, 1, 'iPhone 15 Plus 128GB Chính Hãng | PhoneZone', 'Mua iPhone 15 Plus 128GB chính hãng tại PhoneZone.', 678, '2026-01-10 08:30:00', '2026-05-31 00:24:22'),
(32, 1, 1, 'iPhone 15 Pro 256GB', 'iphone-15-pro-256gb', 'iPhone 15 Pro khung Titan, chip A17 Pro, camera 48MP tele 3x.', 'iPhone 15 Pro được trang bị chip A17 Pro tiên tiến trên tiến trình 3nm, khung Titanium cao cấp nhẹ bền, hệ thống camera chuyên nghiệp với tele 3x và Dynamic Island.', 'https://down-tw.img.susercontent.com/file/tw-11134207-7r990-ludbethbuqk9a8', 1, 1, 1, 'iPhone 15 Pro 256GB Chính Hãng | PhoneZone', 'Mua iPhone 15 Pro 256GB chính hãng tại PhoneZone.', 1043, '2026-01-12 09:00:00', '2026-05-31 00:24:22'),
(33, 1, 1, 'iPhone 15 Pro Max 512GB', 'iphone-15-pro-max-512gb', 'iPhone 15 Pro Max tele 5x, màn hình 6.7 inch ProMotion 120Hz.', 'iPhone 15 Pro Max là đỉnh cao công nghệ của Apple năm 2024 với chip A17 Pro 3nm, camera tele 5x zoom quang học, màn hình 6.7 inch Super Retina XDR 120Hz và khung Titanium.', 'https://tse2.mm.bing.net/th/id/OIP.QQ_AhWpil9Da-IVorp_uegHaJM?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', 1, 1, 1, 'iPhone 15 Pro Max 512GB Chính Hãng | PhoneZone', 'Mua iPhone 15 Pro Max 512GB chính hãng tại PhoneZone.', 1287, '2026-01-12 09:30:00', '2026-05-31 00:24:22'),
(34, 1, 1, 'iPhone 16 128GB', 'iphone-16-128gb', 'iPhone 16 với chip A18, Camera Control và AI Apple Intelligence.', 'iPhone 16 mang đến trải nghiệm hoàn toàn mới với chip A18 mạnh mẽ, nút Camera Control tiện lợi, Apple Intelligence AI tích hợp sâu và camera 48MP cải tiến.', 'https://m.media-amazon.com/images/I/71CSc3M2AGL.jpg', 1, 1, 1, 'iPhone 16 128GB Chính Hãng | PhoneZone', 'Mua iPhone 16 128GB chính hãng tại PhoneZone.', 1456, '2026-02-15 08:00:00', '2026-05-31 00:24:22'),
(35, 1, 1, 'iPhone 16 Plus 128GB', 'iphone-16-plus-128gb', 'iPhone 16 Plus màn hình lớn với Camera Control và Apple Intelligence.', 'iPhone 16 Plus kết hợp màn hình lớn 6.7 inch với sức mạnh chip A18, Camera Control sáng tạo và Apple Intelligence giúp tối ưu hóa mọi tác vụ hàng ngày.', 'https://tse2.mm.bing.net/th/id/OIP._WWjB1WhCqq9LLXHPZm0pQHaHa?r=0&w=1000&h=1000&rs=1&pid=ImgDetMain&o=7&rm=3', 1, 0, 1, 'iPhone 16 Plus 128GB Chính Hãng | PhoneZone', 'Mua iPhone 16 Plus 128GB chính hãng tại PhoneZone.', 987, '2026-02-15 08:30:00', '2026-05-31 00:24:22'),
(36, 1, 1, 'iPhone 16 Pro 256GB', 'iphone-16-pro-256gb', 'iPhone 16 Pro chip A18 Pro, màn hình 6.3 inch lớn hơn, camera 48MP 5x.', 'iPhone 16 Pro nâng cấp màn hình lên 6.3 inch, chip A18 Pro vượt trội, camera tele 5x zoom quang học và hỗ trợ ghi video 4K 120fps chuyên nghiệp.', 'https://www.apple.com/newsroom/images/2024/09/apple-debuts-iphone-16-pro-and-iphone-16-pro-max/article/Apple-iPhone-16-Pro-hero-geo-240909_inline.jpg.large_2x.jpg', 1, 1, 1, 'iPhone 16 Pro 256GB Chính Hãng | PhoneZone', 'Mua iPhone 16 Pro 256GB chính hãng tại PhoneZone.', 1678, '2026-02-18 09:00:00', '2026-05-31 00:24:22'),
(37, 1, 1, 'iPhone 16 Pro Max 256GB', 'iphone-16-pro-max-256gb', 'iPhone 16 Pro Max màn hình 6.9 inch, chip A18 Pro, pin 33 giờ.', 'iPhone 16 Pro Max là smartphone đỉnh cao nhất của Apple với màn hình khổng lồ 6.9 inch, chip A18 Pro 3nm, thời lượng pin lên đến 33 giờ và hệ thống camera tele 5x siêu nét.', 'https://r3new.com/cdn/shop/files/1_1e046e3b-89fb-4d58-84d3-9676b528b72c.jpg?v=1755696628', 1, 1, 1, 'iPhone 16 Pro Max 256GB Chính Hãng | PhoneZone', 'Mua iPhone 16 Pro Max 256GB chính hãng tại PhoneZone.', 2134, '2026-02-18 09:30:00', '2026-05-31 00:24:22'),
(38, 1, 1, 'iPhone 17 128GB', 'iphone-17-128gb', 'iPhone 17 thiết kế mỏng nhẹ hoàn toàn mới, chip A19 Bionic.', 'iPhone 17 ra mắt với thiết kế đột phá mỏng hơn và nhẹ hơn bao giờ hết, chip A19 Bionic thế hệ mới, camera trước 24MP và Apple Intelligence thế hệ 2 thông minh hơn.', 'https://tse3.mm.bing.net/th/id/OIP.jbMbydyGgXj4FxjBjD4UCwHaKX?r=0&w=768&h=1075&rs=1&pid=ImgDetMain&o=7&rm=3', 1, 1, 1, 'iPhone 17 128GB Chính Hãng | PhoneZone', 'Mua iPhone 17 128GB chính hãng tại PhoneZone.', 1824, '2026-03-20 08:00:00', '2026-05-31 00:24:22'),
(39, 1, 1, 'iPhone 17 Air 128GB', 'iphone-17-air-128gb', 'iPhone 17 Air siêu mỏng 5.5mm, thay thế dòng Plus.', 'iPhone 17 Air là mẫu iPhone mỏng nhất lịch sử chỉ 5.5mm, màn hình 6.6 inch tràn viền, chip A19 Bionic và thiết kế khung nhôm cao cấp. Dòng sản phẩm thay thế cho iPhone Plus.', 'https://images.hindustantimes.com/tech/htmobile4/apple-iPhone-17-air/heroimage/iphone-air-1.jpg', 1, 1, 1, 'iPhone 17 Air 128GB Chính Hãng | PhoneZone', 'Mua iPhone 17 Air 128GB chính hãng tại PhoneZone.', 1534, '2026-03-20 08:30:00', '2026-05-31 00:24:22'),
(40, 1, 1, 'iPhone 17 Pro 256GB', 'iphone-17-pro-256gb', 'iPhone 17 Pro chip A19 Pro, camera sau 48MP + tele 5x cải tiến.', 'iPhone 17 Pro trang bị chip A19 Pro tiên tiến nhất, hệ thống camera được cải tiến toàn diện với khả năng chụp ảnh thiên văn học, màn hình ProMotion 120Hz Always-On.', 'https://www.pricerunner.se/product/3239000223/Apple-iPhone-17-256GB-Black.jpg', 1, 1, 1, 'iPhone 17 Pro 256GB Chính Hãng | PhoneZone', 'Mua iPhone 17 Pro 256GB chính hãng tại PhoneZone.', 2045, '2026-03-25 09:00:00', '2026-05-31 00:24:22'),
(41, 1, 1, 'iPhone 17 Pro Max 256GB', 'iphone-17-pro-max-256gb', 'iPhone 17 Pro Max đỉnh cao nhất 2025, chip A19 Pro, camera tele 10x.', 'iPhone 17 Pro Max là chiếc smartphone cao cấp nhất của Apple năm 2025 với chip A19 Pro, camera tele 10x zoom quang học lần đầu xuất hiện trên iPhone, màn hình 6.9 inch và pin 35 giờ kỷ lục.', 'https://cdn.comverseglobal.com/alfa/products/product_images/17-pro-max_031025191224779097.jpeg', 1, 1, 1, 'iPhone 17 Pro Max 256GB Chính Hãng | PhoneZone', 'Mua iPhone 17 Pro Max 256GB chính hãng tại PhoneZone.', 2876, '2026-03-25 09:30:00', '2026-05-31 00:24:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_so_ky_thuat`
--

CREATE TABLE `thong_so_ky_thuat` (
  `id` int(10) UNSIGNED NOT NULL,
  `san_pham_id` int(10) UNSIGNED NOT NULL,
  `ten_thong_so` varchar(150) NOT NULL COMMENT 'VD: Màn hình, RAM, Pin...',
  `gia_tri` varchar(500) NOT NULL COMMENT 'VD: 6.7 inch OLED 120Hz',
  `thu_tu` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thong_so_ky_thuat`
--

INSERT INTO `thong_so_ky_thuat` (`id`, `san_pham_id`, `ten_thong_so`, `gia_tri`, `thu_tu`) VALUES
(11, 2, 'Màn hình', '6.8 inch Dynamic AMOLED 2X, 120Hz', 1),
(12, 2, 'Chip xử lý', 'Snapdragon 8 Gen 3 (4nm)', 2),
(13, 2, 'RAM', '12GB', 3),
(14, 2, 'Bộ nhớ trong', '256GB', 4),
(15, 2, 'Camera sau', '200MP (chính) + 50MP (tele 5x) + 10MP (tele 3x) + 12MP (siêu rộng)', 5),
(16, 2, 'Camera trước', '12MP', 6),
(17, 2, 'Pin', '5000 mAh, sạc 45W, sạc không dây 15W', 7),
(18, 2, 'Hệ điều hành', 'Android 14, One UI 6.1', 8),
(19, 2, 'Kết nối', '5G, WiFi 7, Bluetooth 5.3, NFC, USB-C 3.2', 9),
(20, 2, 'Đặc biệt', 'Bút S Pen tích hợp, Titanium Frame, IP68', 10),
(21, 3, 'Màn hình', '6.73 inch LTPO AMOLED, 120Hz', 1),
(22, 3, 'Chip xử lý', 'Snapdragon 8 Gen 3 (4nm)', 2),
(23, 3, 'RAM', '16GB', 3),
(24, 3, 'Bộ nhớ trong', '512GB', 4),
(25, 3, 'Camera sau', '50MP Leica (chính) + 50MP (tele 5x) + 50MP (tele 3.2x) + 50MP (siêu rộng)', 5),
(26, 3, 'Camera trước', '32MP', 6),
(27, 3, 'Pin', '5000 mAh, sạc có dây 90W, không dây 80W', 7),
(28, 3, 'Hệ điều hành', 'Android 14, HyperOS', 8),
(29, 3, 'Kết nối', '5G, WiFi 7, Bluetooth 5.4, NFC, USB-C 3.2', 9),
(30, 3, 'Đặc biệt', 'Camera đồng phát triển Leica, IP68', 10),
(41, 8, 'Màn hình', '6.7 inch Super Retina XDR OLED, 60Hz', 1),
(42, 8, 'Chip xử lý', 'Apple A15 Bionic (5nm)', 2),
(43, 8, 'RAM', '6GB', 3),
(44, 8, 'Bộ nhớ trong', '128GB', 4),
(45, 8, 'Camera sau', '12MP (chính) + 12MP (siêu rộng)', 5),
(46, 8, 'Camera trước', '12MP TrueDepth', 6),
(47, 8, 'Pin', '4323 mAh, sạc 20W', 7),
(48, 8, 'Hệ điều hành', 'iOS 17', 8),
(49, 8, 'Kết nối', '5G, WiFi 6, Bluetooth 5.3, NFC, Lightning', 9),
(50, 8, 'Đặc biệt', 'Màn hình lớn, pin trâu nhất dòng iPhone 14, IP68', 10),
(51, 9, 'Màn hình', '6.1 inch Super Retina XDR OLED, 60Hz', 1),
(52, 9, 'Chip xử lý', 'Apple A15 Bionic (5nm)', 2),
(53, 9, 'RAM', '4GB', 3),
(54, 9, 'Bộ nhớ trong', '128GB', 4),
(55, 9, 'Camera sau', '12MP (chính) + 12MP (siêu rộng)', 5),
(56, 9, 'Camera trước', '12MP TrueDepth', 6),
(57, 9, 'Pin', '3227 mAh, sạc 20W', 7),
(58, 9, 'Hệ điều hành', 'iOS 17', 8),
(59, 9, 'Kết nối', '5G, WiFi 6, Bluetooth 5.0, NFC, Lightning', 9),
(60, 9, 'Đặc biệt', 'Cinematic Mode, IP68', 10),
(61, 10, 'Màn hình', '5.4 inch Super Retina XDR OLED, 60Hz', 1),
(62, 10, 'Chip xử lý', 'Apple A14 Bionic (5nm)', 2),
(63, 10, 'RAM', '4GB', 3),
(64, 10, 'Bộ nhớ trong', '64GB / 128GB / 256GB', 4),
(65, 10, 'Camera sau', '12MP (chính) + 12MP (siêu rộng)', 5),
(66, 10, 'Camera trước', '12MP TrueDepth', 6),
(67, 10, 'Pin', '2227 mAh, sạc 20W, MagSafe 12W', 7),
(68, 10, 'Hệ điều hành', 'iOS 17', 8),
(69, 10, 'Kết nối', '5G, WiFi 6, Bluetooth 5.0, NFC, Lightning', 9),
(70, 10, 'Đặc biệt', 'Nhỏ gọn nhất dòng iPhone, IP68', 10),
(81, 12, 'Màn hình', '6.4 inch Dynamic AMOLED 2X, 120Hz', 1),
(82, 12, 'Chip xử lý', 'Snapdragon 8 Gen 1 (4nm)', 2),
(83, 12, 'RAM', '8GB', 3),
(84, 12, 'Bộ nhớ trong', '128GB / 256GB', 4),
(85, 12, 'Camera sau', '50MP (chính) + 8MP (tele 3x) + 12MP (siêu rộng)', 5),
(86, 12, 'Camera trước', '10MP', 6),
(87, 12, 'Pin', '4500 mAh, sạc 25W', 7),
(88, 12, 'Hệ điều hành', 'Android 13, One UI 5.1', 8),
(89, 12, 'Kết nối', '5G, WiFi 6, Bluetooth 5.1, NFC, USB-C', 9),
(90, 12, 'Đặc biệt', 'IP68, Gorilla Glass 5', 10),
(91, 13, 'Màn hình', '6.6 inch Super AMOLED, 120Hz', 1),
(92, 13, 'Chip xử lý', 'Exynos 1480 (4nm)', 2),
(93, 13, 'RAM', '8GB / 12GB', 3),
(94, 13, 'Bộ nhớ trong', '128GB / 256GB', 4),
(95, 13, 'Camera sau', '50MP (chính) + 12MP (siêu rộng) + 5MP (macro)', 5),
(96, 13, 'Camera trước', '32MP', 6),
(97, 13, 'Pin', '5000 mAh, sạc 25W', 7),
(98, 13, 'Hệ điều hành', 'Android 14, One UI 6.1', 8),
(99, 13, 'Kết nối', '5G, WiFi 6, Bluetooth 5.3, NFC, USB-C', 9),
(100, 13, 'Đặc biệt', 'IP67, 4 năm cập nhật OS', 10),
(111, 15, 'Màn hình', '6.67 inch AMOLED, 144Hz', 1),
(112, 15, 'Chip xử lý', 'MediaTek Dimensity 9200+ (4nm)', 2),
(113, 15, 'RAM', '12GB', 3),
(114, 15, 'Bộ nhớ trong', '256GB / 512GB', 4),
(115, 15, 'Camera sau', '50MP Leica (chính) + 50MP (tele 2.5x) + 12MP (siêu rộng)', 5),
(116, 15, 'Camera trước', '20MP', 6),
(117, 15, 'Pin', '5000 mAh, sạc 144W', 7),
(118, 15, 'Hệ điều hành', 'Android 13, MIUI 14', 8),
(119, 15, 'Kết nối', '5G, WiFi 6E, Bluetooth 5.4, NFC, USB-C 2.0', 9),
(120, 15, 'Đặc biệt', 'Camera Leica, sạc siêu nhanh 144W, IP68', 10),
(121, 16, 'Màn hình', '6.67 inch AMOLED, 120Hz', 1),
(122, 16, 'Chip xử lý', 'Snapdragon 7s Gen 2 (4nm)', 2),
(123, 16, 'RAM', '8GB / 12GB', 3),
(124, 16, 'Bộ nhớ trong', '128GB / 256GB', 4),
(125, 16, 'Camera sau', '200MP (chính) + 8MP (siêu rộng) + 2MP (macro)', 5),
(126, 16, 'Camera trước', '16MP', 6),
(127, 16, 'Pin', '5100 mAh, sạc 67W', 7),
(128, 16, 'Hệ điều hành', 'Android 13, MIUI 14', 8),
(129, 16, 'Kết nối', '4G/5G, WiFi 5, Bluetooth 5.2, NFC, USB-C', 9),
(130, 16, 'Đặc biệt', 'Camera 200MP, IP54', 10),
(131, 17, 'Màn hình', '6.67 inch AMOLED, 144Hz', 1),
(132, 17, 'Chip xử lý', 'MediaTek Dimensity 8300 Ultra (4nm)', 2),
(133, 17, 'RAM', '8GB / 12GB', 3),
(134, 17, 'Bộ nhớ trong', '256GB / 512GB', 4),
(135, 17, 'Camera sau', '64MP (chính) + 8MP (siêu rộng) + 2MP (macro)', 5),
(136, 17, 'Camera trước', '16MP', 6),
(137, 17, 'Pin', '5000 mAh, sạc 67W', 7),
(138, 17, 'Hệ điều hành', 'Android 14, HyperOS', 8),
(139, 17, 'Kết nối', '5G, WiFi 6, Bluetooth 5.4, NFC, USB-C', 9),
(140, 17, 'Đặc biệt', 'Gaming phone, màn hình 144Hz, IP54', 10),
(141, 18, 'Màn hình', '6.74 inch IPS LCD, 90Hz', 1),
(142, 18, 'Chip xử lý', 'MediaTek Helio G85 (12nm)', 2),
(143, 18, 'RAM', '4GB / 6GB / 8GB', 3),
(144, 18, 'Bộ nhớ trong', '128GB / 256GB', 4),
(145, 18, 'Camera sau', '50MP (chính) + 2MP (độ sâu)', 5),
(146, 18, 'Camera trước', '8MP', 6),
(147, 18, 'Pin', '5000 mAh, sạc 18W', 7),
(148, 18, 'Hệ điều hành', 'Android 13, MIUI 14', 8),
(149, 18, 'Kết nối', '4G, WiFi 5, Bluetooth 5.3, USB-C', 9),
(150, 18, 'Đặc biệt', 'Giá rẻ, pin khỏe, nhận diện khuôn mặt', 10),
(151, 19, 'Màn hình', '6.82 inch LTPO AMOLED, 120Hz', 1),
(152, 19, 'Chip xử lý', 'Snapdragon 8 Gen 2 (4nm)', 2),
(153, 19, 'RAM', '12GB / 16GB', 3),
(154, 19, 'Bộ nhớ trong', '256GB / 512GB', 4),
(155, 19, 'Camera sau', '50MP Hasselblad (chính) + 50MP (tele 6x) + 50MP (siêu rộng)', 5),
(156, 19, 'Camera trước', '32MP', 6),
(157, 19, 'Pin', '5000 mAh, sạc 100W, không dây 30W', 7),
(158, 19, 'Hệ điều hành', 'Android 13, ColorOS 13', 8),
(159, 19, 'Kết nối', '5G, WiFi 7, Bluetooth 5.3, NFC, USB-C 3.1', 9),
(160, 19, 'Đặc biệt', 'Camera Hasselblad, IP68', 10),
(161, 20, 'Màn hình', '6.7 inch AMOLED, 120Hz', 1),
(162, 20, 'Chip xử lý', 'MediaTek Helio G99 (6nm)', 2),
(163, 20, 'RAM', '8GB', 3),
(164, 20, 'Bộ nhớ trong', '256GB', 4),
(165, 20, 'Camera sau', '64MP (chính) + 8MP (siêu rộng) + 2MP (macro)', 5),
(166, 20, 'Camera trước', '32MP', 6),
(167, 20, 'Pin', '5000 mAh, sạc 67W', 7),
(168, 20, 'Hệ điều hành', 'Android 14, ColorOS 14', 8),
(169, 20, 'Kết nối', '4G, WiFi 6, Bluetooth 5.3, NFC, USB-C', 9),
(170, 20, 'Đặc biệt', 'Selfie đẹp, thiết kế thời trang, IP65', 10),
(171, 21, 'Màn hình', '6.72 inch IPS LCD, 90Hz', 1),
(172, 21, 'Chip xử lý', 'MediaTek Dimensity 6020 (7nm)', 2),
(173, 21, 'RAM', '8GB', 3),
(174, 21, 'Bộ nhớ trong', '256GB', 4),
(175, 21, 'Camera sau', '50MP (chính) + 2MP (độ sâu)', 5),
(176, 21, 'Camera trước', '8MP', 6),
(177, 21, 'Pin', '5000 mAh, sạc 33W', 7),
(178, 21, 'Hệ điều hành', 'Android 13, ColorOS 13.1', 8),
(179, 21, 'Kết nối', '5G, WiFi 5, Bluetooth 5.3, USB-C', 9),
(180, 21, 'Đặc biệt', '5G giá tốt, màu sắc thời trang', 10),
(181, 22, 'Màn hình', '6.78 inch LTPO AMOLED, 120Hz', 1),
(182, 22, 'Chip xử lý', 'MediaTek Dimensity 9300 (4nm)', 2),
(183, 22, 'RAM', '16GB', 3),
(184, 22, 'Bộ nhớ trong', '256GB / 512GB', 4),
(185, 22, 'Camera sau', '50MP Zeiss (chính) + 50MP (tele 4.3x) + 50MP (siêu rộng)', 5),
(186, 22, 'Camera trước', '32MP', 6),
(187, 22, 'Pin', '5400 mAh, sạc 120W, không dây 60W', 7),
(188, 22, 'Hệ điều hành', 'Android 14, OriginOS 4', 8),
(189, 22, 'Kết nối', '5G, WiFi 7, Bluetooth 5.4, NFC, USB-C 3.2', 9),
(190, 22, 'Đặc biệt', 'Camera Zeiss, sạc 120W siêu tốc, IP68', 10),
(191, 23, 'Màn hình', '6.78 inch AMOLED, 120Hz', 1),
(192, 23, 'Chip xử lý', 'Snapdragon 7 Gen 3 (4nm)', 2),
(193, 23, 'RAM', '8GB / 12GB', 3),
(194, 23, 'Bộ nhớ trong', '256GB', 4),
(195, 23, 'Camera sau', '50MP Zeiss (chính) + 50MP (siêu rộng) + 2MP (bokeh)', 5),
(196, 23, 'Camera trước', '50MP Zeiss', 6),
(197, 23, 'Pin', '5000 mAh, sạc 80W', 7),
(198, 23, 'Hệ điều hành', 'Android 14, FuntouchOS 14', 8),
(199, 23, 'Kết nối', '5G, WiFi 6, Bluetooth 5.4, NFC, USB-C', 9),
(200, 23, 'Đặc biệt', 'Camera selfie Zeiss 50MP, mỏng nhẹ, IP54', 10),
(201, 24, 'Màn hình', '6.67 inch AMOLED, 120Hz', 1),
(202, 24, 'Chip xử lý', 'Snapdragon 4 Gen 2 (4nm)', 2),
(203, 24, 'RAM', '8GB', 3),
(204, 24, 'Bộ nhớ trong', '128GB / 256GB', 4),
(205, 24, 'Camera sau', '64MP (chính) + 2MP (độ sâu)', 5),
(206, 24, 'Camera trước', '16MP', 6),
(207, 24, 'Pin', '5000 mAh, sạc 44W', 7),
(208, 24, 'Hệ điều hành', 'Android 13, FuntouchOS 13', 8),
(209, 24, 'Kết nối', '5G, WiFi 5, Bluetooth 5.0, USB-C', 9),
(210, 24, 'Đặc biệt', 'Màn AMOLED đẹp, giá hợp lý', 10),
(211, 25, 'Màn hình', '6.78 inch LTPO AMOLED, 144Hz', 1),
(212, 25, 'Chip xử lý', 'Snapdragon 8 Gen 3 (4nm)', 2),
(213, 25, 'RAM', '12GB / 16GB', 3),
(214, 25, 'Bộ nhớ trong', '256GB / 512GB / 1TB', 4),
(215, 25, 'Camera sau', '50MP Sony IMX890 (chính) + 8MP (tele 3x) + 8MP (siêu rộng)', 5),
(216, 25, 'Camera trước', '16MP', 6),
(217, 25, 'Pin', '5400 mAh, sạc 100W, không dây 50W', 7),
(218, 25, 'Hệ điều hành', 'Android 14, realme UI 5.0', 8),
(219, 25, 'Kết nối', '5G, WiFi 7, Bluetooth 5.4, NFC, USB-C 3.2', 9),
(220, 25, 'Đặc biệt', 'Gaming phone, màn 144Hz, IP65', 10),
(221, 26, 'Màn hình', '6.7 inch AMOLED, 120Hz', 1),
(222, 26, 'Chip xử lý', 'Snapdragon 7s Gen 2 (4nm)', 2),
(223, 26, 'RAM', '8GB / 12GB', 3),
(224, 26, 'Bộ nhớ trong', '256GB', 4),
(225, 26, 'Camera sau', '50MP Sony IMX890 (chính) + 64MP (tele tiềm vọng 3x) + 8MP (siêu rộng)', 5),
(226, 26, 'Camera trước', '32MP', 6),
(227, 26, 'Pin', '5000 mAh, sạc 67W', 7),
(228, 26, 'Hệ điều hành', 'Android 14, realme UI 5.0', 8),
(229, 26, 'Kết nối', '5G, WiFi 6, Bluetooth 5.2, NFC, USB-C', 9),
(230, 26, 'Đặc biệt', 'Camera tiềm vọng 3x, IP65', 10),
(231, 27, 'Màn hình', '6.72 inch IPS LCD, 90Hz', 1),
(232, 27, 'Chip xử lý', 'Snapdragon 685 (6nm)', 2),
(233, 27, 'RAM', '6GB / 8GB', 3),
(234, 27, 'Bộ nhớ trong', '128GB / 256GB', 4),
(235, 27, 'Camera sau', '108MP (chính) + 2MP (độ sâu)', 5),
(236, 27, 'Camera trước', '8MP', 6),
(237, 27, 'Pin', '5000 mAh, sạc 33W', 7),
(238, 27, 'Hệ điều hành', 'Android 13, realme UI 5.0', 8),
(239, 27, 'Kết nối', '4G, WiFi 5, Bluetooth 5.0, USB-C', 9),
(240, 27, 'Đặc biệt', 'Camera 108MP, giá sinh viên', 10),
(241, 7, 'Màn hình', '6.1 inch Super Retina XDR OLED, 120Hz ProMotion', 0),
(242, 7, 'Chip xử lý', 'Apple A16 Bionic (4nm)', 1),
(243, 7, 'RAM', '6GB', 2),
(244, 7, 'Bộ nhớ trong', '256GB', 3),
(245, 7, 'Camera sau', '48MP (chính) + 12MP (tele 3x) + 12MP (siêu rộng)', 4),
(246, 7, 'Camera trước', '12MP TrueDepth', 5),
(247, 7, 'Pin', '3200 mAh, sạc 27W', 6),
(248, 7, 'Hệ điều hành', 'iOS 17', 7),
(249, 7, 'Kết nối', '5G, WiFi 6, Bluetooth 5.3, NFC, Lightning', 8),
(250, 7, 'Đặc biệt', 'Dynamic Island, Always-On Display, IP68', 9),
(251, 14, 'Màn hình chính', '6.7 inch Dynamic AMOLED 2X, 120Hz', 0),
(252, 14, 'Màn hình phụ', '3.4 inch Super AMOLED', 1),
(253, 14, 'Chip xử lý', 'Snapdragon 8 Gen 2 (4nm)', 2),
(254, 14, 'RAM', '8GB', 3),
(255, 14, 'Bộ nhớ trong', '256GB / 512GB', 4),
(256, 14, 'Camera sau', '12MP (chính) + 12MP (siêu rộng)', 5),
(257, 14, 'Camera trước', '10MP', 6),
(258, 14, 'Pin', '3700 mAh, sạc 25W', 7),
(259, 14, 'Hệ điều hành', 'Android 13, One UI 5.1', 8),
(260, 14, 'Đặc biệt', 'Điện thoại gập dạng vỏ sò, IPX8', 9),
(261, 30, 'Màn hình', '6.1 inch Super Retina XDR OLED, 60Hz', 1),
(262, 30, 'Chip xử lý', 'Apple A16 Bionic (4nm)', 2),
(263, 30, 'RAM', '6GB', 3),
(264, 30, 'Bộ nhớ trong', '128GB / 256GB / 512GB', 4),
(265, 30, 'Camera sau', '48MP (chính) + 12MP (siêu rộng)', 5),
(266, 30, 'Camera trước', '12MP TrueDepth', 6),
(267, 30, 'Pin', '3877 mAh, sạc 20W, MagSafe 15W', 7),
(268, 30, 'Hệ điều hành', 'iOS 17', 8),
(269, 30, 'Kết nối', '5G, WiFi 6, Bluetooth 5.3, USB-C', 9),
(270, 30, 'Đặc biệt', 'Dynamic Island, IP68, USB-C', 10),
(271, 31, 'Màn hình', '6.7 inch Super Retina XDR OLED, 60Hz', 1),
(272, 31, 'Chip xử lý', 'Apple A16 Bionic (4nm)', 2),
(273, 31, 'RAM', '6GB', 3),
(274, 31, 'Bộ nhớ trong', '128GB / 256GB / 512GB', 4),
(275, 31, 'Camera sau', '48MP (chính) + 12MP (siêu rộng)', 5),
(276, 31, 'Camera trước', '12MP TrueDepth', 6),
(277, 31, 'Pin', '4383 mAh, sạc 20W, MagSafe 15W', 7),
(278, 31, 'Hệ điều hành', 'iOS 17', 8),
(279, 31, 'Kết nối', '5G, WiFi 6, Bluetooth 5.3, USB-C', 9),
(280, 31, 'Đặc biệt', 'Dynamic Island, IP68, pin trâu nhất dòng 15', 10),
(281, 32, 'Màn hình', '6.1 inch Super Retina XDR OLED, 120Hz ProMotion', 1),
(282, 32, 'Chip xử lý', 'Apple A17 Pro (3nm)', 2),
(283, 32, 'RAM', '8GB', 3),
(284, 32, 'Bộ nhớ trong', '256GB / 512GB / 1TB', 4),
(285, 32, 'Camera sau', '48MP (chính) + 12MP (tele 3x) + 12MP (siêu rộng)', 5),
(286, 32, 'Camera trước', '12MP TrueDepth', 6),
(287, 32, 'Pin', '3274 mAh, sạc 27W, MagSafe 15W', 7),
(288, 32, 'Hệ điều hành', 'iOS 17', 8),
(289, 32, 'Kết nối', '5G, WiFi 6E, Bluetooth 5.3, USB-C 3.0', 9),
(290, 32, 'Đặc biệt', 'Titanium, IP68, nút Action, USB-C 3.0', 10),
(291, 33, 'Màn hình', '6.7 inch Super Retina XDR OLED, 120Hz ProMotion', 1),
(292, 33, 'Chip xử lý', 'Apple A17 Pro (3nm)', 2),
(293, 33, 'RAM', '8GB', 3),
(294, 33, 'Bộ nhớ trong', '256GB / 512GB / 1TB', 4),
(295, 33, 'Camera sau', '48MP (chính) + 12MP (tele 5x) + 12MP (siêu rộng)', 5),
(296, 33, 'Camera trước', '12MP TrueDepth', 6),
(297, 33, 'Pin', '4422 mAh, sạc 27W, MagSafe 15W', 7),
(298, 33, 'Hệ điều hành', 'iOS 17', 8),
(299, 33, 'Kết nối', '5G, WiFi 6E, Bluetooth 5.3, USB-C 3.0', 9),
(300, 33, 'Đặc biệt', 'Titanium, IP68, tele 5x, USB-C 3.0', 10),
(301, 34, 'Màn hình', '6.1 inch Super Retina XDR OLED, 60Hz', 1),
(302, 34, 'Chip xử lý', 'Apple A18 (3nm)', 2),
(303, 34, 'RAM', '8GB', 3),
(304, 34, 'Bộ nhớ trong', '128GB / 256GB / 512GB', 4),
(305, 34, 'Camera sau', '48MP (chính) + 12MP (siêu rộng)', 5),
(306, 34, 'Camera trước', '12MP TrueDepth', 6),
(307, 34, 'Pin', '3561 mAh, sạc 25W, MagSafe 25W', 7),
(308, 34, 'Hệ điều hành', 'iOS 18', 8),
(309, 34, 'Kết nối', '5G, WiFi 7, Bluetooth 5.3, USB-C', 9),
(310, 34, 'Đặc biệt', 'Camera Control, Apple Intelligence, IP68', 10),
(311, 35, 'Màn hình', '6.7 inch Super Retina XDR OLED, 60Hz', 1),
(312, 35, 'Chip xử lý', 'Apple A18 (3nm)', 2),
(313, 35, 'RAM', '8GB', 3),
(314, 35, 'Bộ nhớ trong', '128GB / 256GB / 512GB', 4),
(315, 35, 'Camera sau', '48MP (chính) + 12MP (siêu rộng)', 5),
(316, 35, 'Camera trước', '12MP TrueDepth', 6),
(317, 35, 'Pin', '4674 mAh, sạc 25W, MagSafe 25W', 7),
(318, 35, 'Hệ điều hành', 'iOS 18', 8),
(319, 35, 'Kết nối', '5G, WiFi 7, Bluetooth 5.3, USB-C', 9),
(320, 35, 'Đặc biệt', 'Camera Control, Apple Intelligence, pin trâu', 10),
(321, 36, 'Màn hình', '6.3 inch Super Retina XDR OLED, 120Hz ProMotion', 1),
(322, 36, 'Chip xử lý', 'Apple A18 Pro (3nm)', 2),
(323, 36, 'RAM', '8GB', 3),
(324, 36, 'Bộ nhớ trong', '256GB / 512GB / 1TB', 4),
(325, 36, 'Camera sau', '48MP (chính) + 12MP (tele 5x) + 48MP (siêu rộng)', 5),
(326, 36, 'Camera trước', '12MP TrueDepth', 6),
(327, 36, 'Pin', '3582 mAh, sạc 30W, MagSafe 25W', 7),
(328, 36, 'Hệ điều hành', 'iOS 18', 8),
(329, 36, 'Kết nối', '5G, WiFi 7, Bluetooth 5.3, USB-C 3.2', 9),
(330, 36, 'Đặc biệt', 'Titanium, IP68, quay 4K 120fps, Camera Control', 10),
(331, 37, 'Màn hình', '6.9 inch Super Retina XDR OLED, 120Hz ProMotion', 1),
(332, 37, 'Chip xử lý', 'Apple A18 Pro (3nm)', 2),
(333, 37, 'RAM', '8GB', 3),
(334, 37, 'Bộ nhớ trong', '256GB / 512GB / 1TB', 4),
(335, 37, 'Camera sau', '48MP (chính) + 12MP (tele 5x) + 48MP (siêu rộng)', 5),
(336, 37, 'Camera trước', '12MP TrueDepth', 6),
(337, 37, 'Pin', '4685 mAh, sạc 30W, MagSafe 25W', 7),
(338, 37, 'Hệ điều hành', 'iOS 18', 8),
(339, 37, 'Kết nối', '5G, WiFi 7, Bluetooth 5.3, USB-C 3.2', 9),
(340, 37, 'Đặc biệt', 'Titanium, IP68, pin 33h, Camera Control', 10),
(341, 38, 'Màn hình', '6.1 inch Super Retina XDR OLED, 60Hz', 1),
(342, 38, 'Chip xử lý', 'Apple A19 Bionic (3nm)', 2),
(343, 38, 'RAM', '8GB', 3),
(344, 38, 'Bộ nhớ trong', '128GB / 256GB / 512GB', 4),
(345, 38, 'Camera sau', '48MP (chính) + 12MP (siêu rộng)', 5),
(346, 38, 'Camera trước', '24MP TrueDepth', 6),
(347, 38, 'Pin', '3800 mAh, sạc 25W, MagSafe 25W', 7),
(348, 38, 'Hệ điều hành', 'iOS 19', 8),
(349, 38, 'Kết nối', '5G, WiFi 7, Bluetooth 5.4, USB-C', 9),
(350, 38, 'Đặc biệt', 'Thiết kế mỏng mới, Camera 24MP trước, Apple Intelligence 2', 10),
(351, 39, 'Màn hình', '6.6 inch Super Retina XDR OLED, 120Hz ProMotion', 1),
(352, 39, 'Chip xử lý', 'Apple A19 Bionic (3nm)', 2),
(353, 39, 'RAM', '8GB', 3),
(354, 39, 'Bộ nhớ trong', '128GB / 256GB', 4),
(355, 39, 'Camera sau', '48MP (chính)', 5),
(356, 39, 'Camera trước', '24MP TrueDepth', 6),
(357, 39, 'Pin', '3600 mAh, sạc 25W, MagSafe 25W', 7),
(358, 39, 'Hệ điều hành', 'iOS 19', 8),
(359, 39, 'Kết nối', '5G, WiFi 7, Bluetooth 5.4, USB-C', 9),
(360, 39, 'Đặc biệt', 'Mỏng nhất lịch sử 5.5mm, thay thế iPhone Plus', 10),
(361, 40, 'Màn hình', '6.3 inch Super Retina XDR OLED, 120Hz ProMotion Always-On', 1),
(362, 40, 'Chip xử lý', 'Apple A19 Pro (3nm)', 2),
(363, 40, 'RAM', '12GB', 3),
(364, 40, 'Bộ nhớ trong', '256GB / 512GB / 1TB', 4),
(365, 40, 'Camera sau', '48MP (chính) + 48MP (tele 5x) + 48MP (siêu rộng)', 5),
(366, 40, 'Camera trước', '24MP TrueDepth', 6),
(367, 40, 'Pin', '3700 mAh, sạc 30W, MagSafe 30W', 7),
(368, 40, 'Hệ điều hành', 'iOS 19', 8),
(369, 40, 'Kết nối', '5G, WiFi 7, Bluetooth 5.4, USB-C 3.2', 9),
(370, 40, 'Đặc biệt', 'Titanium, IP69, 3 camera 48MP, Apple Intelligence 2 Pro', 10),
(371, 41, 'Màn hình', '6.9 inch Super Retina XDR OLED, 120Hz ProMotion Always-On', 1),
(372, 41, 'Chip xử lý', 'Apple A19 Pro (3nm)', 2),
(373, 41, 'RAM', '12GB', 3),
(374, 41, 'Bộ nhớ trong', '256GB / 512GB / 1TB', 4),
(375, 41, 'Camera sau', '48MP (chính) + 48MP (tele 10x) + 48MP (siêu rộng)', 5),
(376, 41, 'Camera trước', '24MP TrueDepth', 6),
(377, 41, 'Pin', '4900 mAh, sạc 30W, MagSafe 30W', 7),
(378, 41, 'Hệ điều hành', 'iOS 19', 8),
(379, 41, 'Kết nối', '5G, WiFi 7, Bluetooth 5.4, USB-C 3.2', 9),
(380, 41, 'Đặc biệt', 'Titanium, IP69, tele 10x lần đầu, pin 35h kỷ lục', 10),
(381, 11, 'Màn hình', '6.8 inch Dynamic AMOLED 2X, 120Hz', 0),
(382, 11, 'Chip xử lý', 'Snapdragon 8 Gen 2 (4nm)', 1),
(383, 11, 'RAM', '12GB', 2),
(384, 11, 'Bộ nhớ trong', '256GB / 512GB', 3),
(385, 11, 'Camera sau', '200MP (chính) + 10MP (tele 10x) + 10MP (tele 3x) + 12MP (siêu rộng)', 4),
(386, 11, 'Camera trước', '12MP', 5),
(387, 11, 'Pin', '5000 mAh, sạc 45W', 6),
(388, 11, 'Hệ điều hành', 'Android 13, One UI 5.1', 7),
(389, 11, 'Kết nối', '5G, WiFi 6E, Bluetooth 5.3, NFC, USB-C 3.2', 8),
(390, 11, 'Đặc biệt', 'Bút S Pen, IP68', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `yeu_thich`
--

CREATE TABLE `yeu_thich` (
  `id` int(10) UNSIGNED NOT NULL,
  `khach_hang_id` int(10) UNSIGNED NOT NULL,
  `san_pham_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `yeu_thich`
--

INSERT INTO `yeu_thich` (`id`, `khach_hang_id`, `san_pham_id`, `created_at`) VALUES
(1, 11, 16, '2026-05-28 23:17:04'),
(2, 11, 14, '2026-05-28 23:17:06'),
(3, 11, 18, '2026-05-28 23:17:07'),
(4, 12, 10, '2026-05-30 17:48:35'),
(5, 12, 12, '2026-05-30 17:48:45');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bien_the_san_pham`
--
ALTER TABLE `bien_the_san_pham`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `idx_sp` (`san_pham_id`);

--
-- Chỉ mục cho bảng `cai_dat`
--
ALTER TABLE `cai_dat`
  ADD PRIMARY KEY (`khoa`);

--
-- Chỉ mục cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dh` (`don_hang_id`),
  ADD KEY `idx_bt` (`bien_the_id`);

--
-- Chỉ mục cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sp` (`san_pham_id`),
  ADD KEY `idx_kh` (`khach_hang_id`),
  ADD KEY `fk_dg_dh` (`don_hang_id`);

--
-- Chỉ mục cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `dia_chi_khach_hang`
--
ALTER TABLE `dia_chi_khach_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kh` (`khach_hang_id`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ma_don` (`ma_don`),
  ADD KEY `idx_kh` (`khach_hang_id`),
  ADD KEY `idx_ma_don` (`ma_don`),
  ADD KEY `idx_trang_thai` (`trang_thai`),
  ADD KEY `fk_dh_mgg` (`ma_giam_gia_id`);

--
-- Chỉ mục cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_kh_bt` (`khach_hang_id`,`bien_the_id`),
  ADD KEY `fk_gh_bt` (`bien_the_id`);

--
-- Chỉ mục cho bảng `hang_san_xuat`
--
ALTER TABLE `hang_san_xuat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `hinh_anh_san_pham`
--
ALTER TABLE `hinh_anh_san_pham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sp` (`san_pham_id`);

--
-- Chỉ mục cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`);

--
-- Chỉ mục cho bảng `lich_su_don_hang`
--
ALTER TABLE `lich_su_don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dh` (`don_hang_id`);

--
-- Chỉ mục cho bảng `ma_giam_gia`
--
ALTER TABLE `ma_giam_gia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ma` (`ma`);

--
-- Chỉ mục cho bảng `nhat_ky_admin`
--
ALTER TABLE `nhat_ky_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_admin` (`admin_id`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_danh_muc` (`danh_muc_id`),
  ADD KEY `idx_hang` (`hang_id`);

--
-- Chỉ mục cho bảng `thong_so_ky_thuat`
--
ALTER TABLE `thong_so_ky_thuat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sp` (`san_pham_id`);

--
-- Chỉ mục cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_kh_sp` (`khach_hang_id`,`san_pham_id`),
  ADD KEY `fk_yt_sp` (`san_pham_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bien_the_san_pham`
--
ALTER TABLE `bien_the_san_pham`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `dia_chi_khach_hang`
--
ALTER TABLE `dia_chi_khach_hang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `hang_san_xuat`
--
ALTER TABLE `hang_san_xuat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `hinh_anh_san_pham`
--
ALTER TABLE `hinh_anh_san_pham`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `lich_su_don_hang`
--
ALTER TABLE `lich_su_don_hang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `ma_giam_gia`
--
ALTER TABLE `ma_giam_gia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nhat_ky_admin`
--
ALTER TABLE `nhat_ky_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `thong_so_ky_thuat`
--
ALTER TABLE `thong_so_ky_thuat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bien_the_san_pham`
--
ALTER TABLE `bien_the_san_pham`
  ADD CONSTRAINT `fk_bt_sp` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `fk_ctdh_bt` FOREIGN KEY (`bien_the_id`) REFERENCES `bien_the_san_pham` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ctdh_dh` FOREIGN KEY (`don_hang_id`) REFERENCES `don_hang` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD CONSTRAINT `fk_dg_dh` FOREIGN KEY (`don_hang_id`) REFERENCES `don_hang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_dg_kh` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_dg_sp` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `dia_chi_khach_hang`
--
ALTER TABLE `dia_chi_khach_hang`
  ADD CONSTRAINT `fk_dc_kh` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `fk_dh_kh` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_dh_mgg` FOREIGN KEY (`ma_giam_gia_id`) REFERENCES `ma_giam_gia` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `fk_gh_bt` FOREIGN KEY (`bien_the_id`) REFERENCES `bien_the_san_pham` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gh_kh` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hinh_anh_san_pham`
--
ALTER TABLE `hinh_anh_san_pham`
  ADD CONSTRAINT `fk_hinh_sp` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `lich_su_don_hang`
--
ALTER TABLE `lich_su_don_hang`
  ADD CONSTRAINT `fk_ls_dh` FOREIGN KEY (`don_hang_id`) REFERENCES `don_hang` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `nhat_ky_admin`
--
ALTER TABLE `nhat_ky_admin`
  ADD CONSTRAINT `fk_nk_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `fk_sp_danhmuc` FOREIGN KEY (`danh_muc_id`) REFERENCES `danh_muc` (`id`),
  ADD CONSTRAINT `fk_sp_hang` FOREIGN KEY (`hang_id`) REFERENCES `hang_san_xuat` (`id`);

--
-- Các ràng buộc cho bảng `thong_so_ky_thuat`
--
ALTER TABLE `thong_so_ky_thuat`
  ADD CONSTRAINT `fk_tskt_sp` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  ADD CONSTRAINT `fk_yt_kh` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yt_sp` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
