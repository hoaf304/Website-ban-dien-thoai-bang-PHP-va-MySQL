-- ============================================================
-- PHONEZONE - DATABASE SCHEMA
-- Tương thích: MySQL 5.7+ / MariaDB 10.3+ (Laragon)
-- Tạo bởi: PhoneZone Setup
-- ============================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `phonezone`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `phonezone`;

-- ============================================================
-- 1. DANH MỤC SẢN PHẨM
-- ============================================================
CREATE TABLE `danh_muc` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ten`         VARCHAR(100) NOT NULL COMMENT 'VD: iPhone, Samsung Galaxy, Xiaomi',
  `slug`        VARCHAR(120) NOT NULL UNIQUE,
  `mo_ta`       TEXT,
  `hinh_anh`    VARCHAR(255),
  `thu_tu`      TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `an_hien`     TINYINT(1) NOT NULL DEFAULT 1,
  `created_at`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 2. HÃNG SẢN XUẤT
-- ============================================================
CREATE TABLE `hang_san_xuat` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ten`         VARCHAR(100) NOT NULL COMMENT 'Apple, Samsung, Xiaomi, OPPO...',
  `slug`        VARCHAR(120) NOT NULL UNIQUE,
  `logo`        VARCHAR(255),
  `quoc_gia`    VARCHAR(100),
  `mo_ta`       TEXT,
  `an_hien`     TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 3. SẢN PHẨM (bảng chính)
-- ============================================================
CREATE TABLE `san_pham` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `danh_muc_id`     INT UNSIGNED NOT NULL,
  `hang_id`         INT UNSIGNED NOT NULL,
  `ten`             VARCHAR(255) NOT NULL,
  `slug`            VARCHAR(280) NOT NULL UNIQUE,
  `mo_ta_ngan`      VARCHAR(500),
  `mo_ta_chi_tiet`  LONGTEXT,
  `hinh_chinh`      VARCHAR(255),
  `noi_bat`         TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Hiển thị trang chủ',
  `ban_chay`        TINYINT(1) NOT NULL DEFAULT 0,
  `an_hien`         TINYINT(1) NOT NULL DEFAULT 1,
  -- SEO
  `meta_title`      VARCHAR(255),
  `meta_desc`       VARCHAR(500),
  `luot_xem`        INT UNSIGNED NOT NULL DEFAULT 0,
  `created_at`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_danh_muc` (`danh_muc_id`),
  KEY `idx_hang` (`hang_id`),
  CONSTRAINT `fk_sp_danhmuc` FOREIGN KEY (`danh_muc_id`) REFERENCES `danh_muc`(`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_sp_hang`    FOREIGN KEY (`hang_id`)     REFERENCES `hang_san_xuat`(`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 4. HÌNH ẢNH SẢN PHẨM (thư viện ảnh)
-- ============================================================
CREATE TABLE `hinh_anh_san_pham` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `san_pham_id` INT UNSIGNED NOT NULL,
  `url`         VARCHAR(255) NOT NULL,
  `alt_text`    VARCHAR(255),
  `thu_tu`      TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `la_hinh_chinh` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_sp` (`san_pham_id`),
  CONSTRAINT `fk_hinh_sp` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 5. THÔNG SỐ KỸ THUẬT
-- ============================================================
CREATE TABLE `thong_so_ky_thuat` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `san_pham_id` INT UNSIGNED NOT NULL,
  `ten_thong_so` VARCHAR(150) NOT NULL COMMENT 'VD: Màn hình, RAM, Pin...',
  `gia_tri`     VARCHAR(500) NOT NULL COMMENT 'VD: 6.7 inch OLED 120Hz',
  `thu_tu`      TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_sp` (`san_pham_id`),
  CONSTRAINT `fk_tskt_sp` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 6. BIẾN THỂ SẢN PHẨM (màu sắc + dung lượng)
-- ============================================================
CREATE TABLE `bien_the_san_pham` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `san_pham_id`     INT UNSIGNED NOT NULL,
  `mau_sac`         VARCHAR(80) NOT NULL COMMENT 'VD: Titan Đen',
  `dung_luong`      VARCHAR(80) NOT NULL COMMENT 'VD: 256GB',
  `sku`             VARCHAR(120) NOT NULL UNIQUE COMMENT 'APL-IP15PM-256-BLK',
  `gia_ban`         BIGINT UNSIGNED NOT NULL COMMENT 'Đơn vị: VNĐ',
  `gia_khuyen_mai`  BIGINT UNSIGNED DEFAULT NULL COMMENT 'NULL nếu không KM',
  `ton_kho`         SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `hinh_anh`        VARCHAR(255) COMMENT 'Ảnh riêng theo màu',
  `an_hien`         TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_sp` (`san_pham_id`),
  CONSTRAINT `fk_bt_sp` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 7. KHÁCH HÀNG
-- ============================================================
CREATE TABLE `khach_hang` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ho_ten`          VARCHAR(150) NOT NULL,
  `email`           VARCHAR(180) NOT NULL UNIQUE,
  `mat_khau`        VARCHAR(255) NOT NULL COMMENT 'bcrypt hash',
  `so_dien_thoai`   VARCHAR(20),
  `gioi_tinh`       ENUM('nam','nu','khac') DEFAULT 'khac',
  `ngay_sinh`       DATE,
  `avatar`          VARCHAR(255),
  `trang_thai`      ENUM('hoat_dong','bi_khoa') NOT NULL DEFAULT 'hoat_dong',
  `email_verified`  TINYINT(1) NOT NULL DEFAULT 0,
  `remember_token`  VARCHAR(100),
  `created_at`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 8. SỔ ĐỊA CHỈ KHÁCH HÀNG
-- ============================================================
CREATE TABLE `dia_chi_khach_hang` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `khach_hang_id`   INT UNSIGNED NOT NULL,
  `ho_ten`          VARCHAR(150) NOT NULL,
  `so_dien_thoai`   VARCHAR(20) NOT NULL,
  `tinh_thanh`      VARCHAR(100) NOT NULL,
  `quan_huyen`      VARCHAR(100) NOT NULL,
  `phuong_xa`       VARCHAR(100) NOT NULL,
  `so_nha_duong`    VARCHAR(255) NOT NULL,
  `la_mac_dinh`     TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_kh` (`khach_hang_id`),
  CONSTRAINT `fk_dc_kh` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 9. MÃ GIẢM GIÁ / COUPON
-- ============================================================
CREATE TABLE `ma_giam_gia` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ma`              VARCHAR(50) NOT NULL UNIQUE,
  `ten`             VARCHAR(150),
  `loai`            ENUM('phan_tram','co_dinh') NOT NULL DEFAULT 'phan_tram',
  `gia_tri`         DECIMAL(12,2) NOT NULL COMMENT '% hoặc số tiền cố định',
  `giam_toi_da`     BIGINT UNSIGNED DEFAULT NULL COMMENT 'Giảm tối đa (cho loại %)',
  `don_hang_toi_thieu` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `so_luong_tong`   INT UNSIGNED DEFAULT NULL COMMENT 'NULL = không giới hạn',
  `so_luong_da_dung` INT UNSIGNED NOT NULL DEFAULT 0,
  `gioi_han_moi_kh` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `bat_dau`         DATETIME,
  `ket_thuc`        DATETIME,
  `an_hien`         TINYINT(1) NOT NULL DEFAULT 1,
  `created_at`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 10. ĐƠN HÀNG
-- ============================================================
CREATE TABLE `don_hang` (
  `id`                  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ma_don`              VARCHAR(30) NOT NULL UNIQUE COMMENT 'ORD-20250510-001',
  `khach_hang_id`       INT UNSIGNED DEFAULT NULL COMMENT 'NULL nếu khách vãng lai',
  -- Thông tin người nhận (snapshot tại thời điểm đặt hàng)
  `ten_nguoi_nhan`      VARCHAR(150) NOT NULL,
  `so_dien_thoai`       VARCHAR(20) NOT NULL,
  `tinh_thanh`          VARCHAR(100) NOT NULL,
  `quan_huyen`          VARCHAR(100) NOT NULL,
  `phuong_xa`           VARCHAR(100) NOT NULL,
  `so_nha_duong`        VARCHAR(255) NOT NULL,
  `ghi_chu`             TEXT,
  -- Tiền bạc
  `tam_tinh`            BIGINT UNSIGNED NOT NULL COMMENT 'Trước KM + ship',
  `giam_gia`            BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `phi_van_chuyen`      INT UNSIGNED NOT NULL DEFAULT 0,
  `tong_tien`           BIGINT UNSIGNED NOT NULL COMMENT 'Thực thanh toán',
  `ma_giam_gia_id`      INT UNSIGNED DEFAULT NULL,
  -- Thanh toán
  `phuong_thuc_tt`      ENUM('cod','chuyen_khoan','momo','vnpay','zalopay') NOT NULL DEFAULT 'cod',
  `trang_thai_tt`       ENUM('chua_tt','da_tt','hoan_tien') NOT NULL DEFAULT 'chua_tt',
  `ma_giao_dich`        VARCHAR(100) COMMENT 'Mã GD từ cổng thanh toán',
  -- Vận chuyển
  `trang_thai`          ENUM('cho_xac_nhan','da_xac_nhan','dang_dong_hang','dang_giao','da_giao','da_huy','hoan_hang') NOT NULL DEFAULT 'cho_xac_nhan',
  `ma_van_don`          VARCHAR(100),
  `don_vi_van_chuyen`   VARCHAR(100),
  `ngay_du_kien_giao`   DATE,
  `ngay_giao_thuc`      DATETIME,
  `created_at`          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_kh`      (`khach_hang_id`),
  KEY `idx_ma_don`  (`ma_don`),
  KEY `idx_trang_thai` (`trang_thai`),
  CONSTRAINT `fk_dh_kh`  FOREIGN KEY (`khach_hang_id`)  REFERENCES `khach_hang`(`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_dh_mgg` FOREIGN KEY (`ma_giam_gia_id`) REFERENCES `ma_giam_gia`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 11. CHI TIẾT ĐƠN HÀNG
-- ============================================================
CREATE TABLE `chi_tiet_don_hang` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `don_hang_id`     INT UNSIGNED NOT NULL,
  `bien_the_id`     INT UNSIGNED DEFAULT NULL,
  -- Snapshot sản phẩm tại thời điểm đặt
  `ten_san_pham`    VARCHAR(255) NOT NULL,
  `mau_sac`         VARCHAR(80),
  `dung_luong`      VARCHAR(80),
  `sku`             VARCHAR(120),
  `hinh_anh`        VARCHAR(255),
  `don_gia`         BIGINT UNSIGNED NOT NULL,
  `so_luong`        SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  `thanh_tien`      BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dh` (`don_hang_id`),
  KEY `idx_bt` (`bien_the_id`),
  CONSTRAINT `fk_ctdh_dh` FOREIGN KEY (`don_hang_id`) REFERENCES `don_hang`(`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ctdh_bt` FOREIGN KEY (`bien_the_id`) REFERENCES `bien_the_san_pham`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 12. LỊCH SỬ TRẠNG THÁI ĐƠN HÀNG
-- ============================================================
CREATE TABLE `lich_su_don_hang` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `don_hang_id` INT UNSIGNED NOT NULL,
  `trang_thai`  VARCHAR(50) NOT NULL,
  `ghi_chu`     TEXT,
  `nguoi_thuc_hien` VARCHAR(100) COMMENT 'Admin name hoặc system',
  `created_at`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_dh` (`don_hang_id`),
  CONSTRAINT `fk_ls_dh` FOREIGN KEY (`don_hang_id`) REFERENCES `don_hang`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 13. GIỎ HÀNG (lưu DB cho user đăng nhập)
-- ============================================================
CREATE TABLE `gio_hang` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `khach_hang_id`   INT UNSIGNED NOT NULL,
  `bien_the_id`     INT UNSIGNED NOT NULL,
  `so_luong`        SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  `created_at`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_kh_bt` (`khach_hang_id`,`bien_the_id`),
  CONSTRAINT `fk_gh_kh` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang`(`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gh_bt` FOREIGN KEY (`bien_the_id`)   REFERENCES `bien_the_san_pham`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 14. SẢN PHẨM YÊU THÍCH
-- ============================================================
CREATE TABLE `yeu_thich` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `khach_hang_id`   INT UNSIGNED NOT NULL,
  `san_pham_id`     INT UNSIGNED NOT NULL,
  `created_at`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_kh_sp` (`khach_hang_id`,`san_pham_id`),
  CONSTRAINT `fk_yt_kh` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang`(`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yt_sp` FOREIGN KEY (`san_pham_id`)   REFERENCES `san_pham`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 15. ĐÁNH GIÁ / BÌNH LUẬN SẢN PHẨM
-- ============================================================
CREATE TABLE `danh_gia` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `san_pham_id`     INT UNSIGNED NOT NULL,
  `khach_hang_id`   INT UNSIGNED DEFAULT NULL,
  `don_hang_id`     INT UNSIGNED DEFAULT NULL COMMENT 'Xác thực đã mua',
  `ho_ten`          VARCHAR(150) NOT NULL COMMENT 'Snapshot tên',
  `so_sao`          TINYINT UNSIGNED NOT NULL COMMENT '1-5',
  `tieu_de`         VARCHAR(255),
  `noi_dung`        TEXT,
  `trang_thai`      ENUM('cho_duyet','da_duyet','an') NOT NULL DEFAULT 'cho_duyet',
  `created_at`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sp` (`san_pham_id`),
  KEY `idx_kh` (`khach_hang_id`),
  CONSTRAINT `fk_dg_sp` FOREIGN KEY (`san_pham_id`)   REFERENCES `san_pham`(`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dg_kh` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang`(`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_dg_dh` FOREIGN KEY (`don_hang_id`)   REFERENCES `don_hang`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 16. BANNER / SLIDE TRANG CHỦ
-- ============================================================
CREATE TABLE `banner` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tieu_de`     VARCHAR(255),
  `mo_ta`       VARCHAR(500),
  `hinh_anh`    VARCHAR(255) NOT NULL,
  `url_link`    VARCHAR(255),
  `vi_tri`      ENUM('hero','popup','sidebar','footer') NOT NULL DEFAULT 'hero',
  `thu_tu`      TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `an_hien`     TINYINT(1) NOT NULL DEFAULT 1,
  `bat_dau`     DATETIME,
  `ket_thuc`    DATETIME,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 17. TÀI KHOẢN ADMIN
-- ============================================================
CREATE TABLE `admin` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ho_ten`      VARCHAR(150) NOT NULL,
  `email`       VARCHAR(180) NOT NULL UNIQUE,
  `mat_khau`    VARCHAR(255) NOT NULL COMMENT 'bcrypt hash',
  `vai_tro`     ENUM('superadmin','admin','nhan_vien') NOT NULL DEFAULT 'nhan_vien',
  `avatar`      VARCHAR(255),
  `trang_thai`  TINYINT(1) NOT NULL DEFAULT 1,
  `last_login`  DATETIME,
  `created_at`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 18. CÀI ĐẶT HỆ THỐNG
-- ============================================================
CREATE TABLE `cai_dat` (
  `khoa`    VARCHAR(100) NOT NULL,
  `gia_tri` TEXT,
  `nhom`    VARCHAR(50) NOT NULL DEFAULT 'chung',
  PRIMARY KEY (`khoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 19. NHẬT KÝ HOẠT ĐỘNG ADMIN
-- ============================================================
CREATE TABLE `nhat_ky_admin` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id`    INT UNSIGNED DEFAULT NULL,
  `hanh_dong`   VARCHAR(100) NOT NULL COMMENT 'create_product, update_order...',
  `doi_tuong`   VARCHAR(50) COMMENT 'san_pham, don_hang...',
  `doi_tuong_id` INT UNSIGNED,
  `mo_ta`       TEXT,
  `ip`          VARCHAR(45),
  `created_at`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_admin` (`admin_id`),
  CONSTRAINT `fk_nk_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- DỮ LIỆU MẪU
-- ============================================================

-- Admin mặc định (password: Admin@123)
INSERT INTO `admin` (`ho_ten`,`email`,`mat_khau`,`vai_tro`) VALUES
('Super Admin','admin@phonezone.vn','$2y$10$rTLGRR9v8LpXf7Kmrh4RDOKdbgkg9WQopG7fQMrckMmLErfyATCEa','superadmin');

-- Danh mục
INSERT INTO `danh_muc` (`ten`,`slug`,`thu_tu`) VALUES
('iPhone',       'iphone',        1),
('Samsung Galaxy','samsung-galaxy',2),
('Xiaomi',       'xiaomi',        3),
('OPPO',         'oppo',          4),
('Vivo',         'vivo',          5),
('Realme',       'realme',        6);

-- Hãng sản xuất
INSERT INTO `hang_san_xuat` (`ten`,`slug`,`quoc_gia`) VALUES
('Apple',   'apple',   'Hoa Kỳ'),
('Samsung', 'samsung', 'Hàn Quốc'),
('Xiaomi',  'xiaomi',  'Trung Quốc'),
('OPPO',    'oppo',    'Trung Quốc'),
('Vivo',    'vivo',    'Trung Quốc'),
('Realme',  'realme',  'Trung Quốc');

-- Sản phẩm mẫu: iPhone 15 Pro Max
INSERT INTO `san_pham`
  (`danh_muc_id`,`hang_id`,`ten`,`slug`,`mo_ta_ngan`,`mo_ta_chi_tiet`,`noi_bat`,`ban_chay`,`meta_title`,`meta_desc`)
VALUES
(1, 1,
 'iPhone 15 Pro Max 256GB – Chính hãng VN/A',
 'iphone-15-pro-max-256gb-chinh-hang',
 'Smartphone cao cấp nhất của Apple năm 2024 với chip A17 Pro, camera 48MP và màn hình 6.7 inch ProMotion 120Hz.',
 'iPhone 15 Pro Max là chiếc điện thoại flagship cao cấp nhất của Apple, được trang bị chip A17 Pro tiên tiến nhất được sản xuất trên tiến trình 3nm, mang lại hiệu năng vượt trội cùng khả năng tiết kiệm pin tốt hơn.',
 1, 1,
 'iPhone 15 Pro Max 256GB Chính Hãng | PhoneZone',
 'Mua iPhone 15 Pro Max 256GB chính hãng tại PhoneZone. Giá tốt nhất, bảo hành 12 tháng.'
),
(2, 2,
 'Samsung Galaxy S24 Ultra 256GB – Chính hãng',
 'samsung-galaxy-s24-ultra-256gb',
 'Flagship Android cao cấp của Samsung với bút S Pen tích hợp và AI Galaxy.',
 'Samsung Galaxy S24 Ultra mang đến trải nghiệm smartphone cao cấp nhất với chip Snapdragon 8 Gen 3, camera 200MP và tích hợp S Pen.',
 1, 1,
 'Samsung Galaxy S24 Ultra 256GB | PhoneZone',
 'Mua Samsung Galaxy S24 Ultra chính hãng tại PhoneZone.'
),
(3, 3,
 'Xiaomi 14 Ultra 512GB – Chính hãng',
 'xiaomi-14-ultra-512gb',
 'Flagship Xiaomi với hệ thống camera Leica và chip Snapdragon 8 Gen 3.',
 'Xiaomi 14 Ultra là đỉnh cao công nghệ của Xiaomi với camera đồng phát triển cùng Leica, chip Snapdragon 8 Gen 3 và màn hình AMOLED 6.73 inch.',
 1, 0,
 'Xiaomi 14 Ultra 512GB | PhoneZone',
 'Mua Xiaomi 14 Ultra chính hãng tại PhoneZone.'
);

-- Biến thể sản phẩm
INSERT INTO `bien_the_san_pham` (`id`, `san_pham_id`, `mau_sac`, `dung_luong`, `sku`, `gia_ban`, `gia_khuyen_mai`, `ton_kho`, `hinh_anh`, `an_hien`) VALUES
(1, 1, 'Titan Đen', '256GB', 'APL-IP15PM-256-BLK', 36990000, 28990000, 49, NULL, 1),
(2, 1, 'Titan Trắng', '256GB', 'APL-IP15PM-256-WHT', 36990000, 28990000, 35, NULL, 1),
(3, 1, 'Titan Đen', '512GB', 'APL-IP15PM-512-BLK', 43990000, NULL, 20, NULL, 1),
(4, 1, 'Titan Trắng', '512GB', 'APL-IP15PM-512-WHT', 43990000, NULL, 14, NULL, 1),
(5, 1, 'Titan Đen', '1TB', 'APL-IP15PM-1TB-BLK', 52990000, NULL, 10, NULL, 1),
(6, 2, 'Titanium Black', '256GB', 'SAM-S24U-256-BLK', 25490000, NULL, 40, NULL, 1),
(7, 2, 'Titanium Gray', '256GB', 'SAM-S24U-256-GRY', 25490000, NULL, 30, NULL, 1),
(8, 2, 'Titanium Black', '512GB', 'SAM-S24U-512-BLK', 29990000, NULL, 20, NULL, 1),
(9, 3, 'Đen Huyền', '512GB', 'XMI-14U-512-BLK', 22990000, 19990000, 25, NULL, 1),
(10, 3, 'Trắng Titan', '512GB', 'XMI-14U-512-WHT', 22990000, 19990000, 20, NULL, 1),
(38, 9, 'Titan Đen', '256GB', 'APL-IP14P-256-BLK', 28990000, 27990000, 15, 'iphone14pro-black.jpg', 1),
(39, 9, 'Titan Trắng', '512GB', 'APL-IP14P-512-WHT', 31990000, 30990000, 10, 'iphone14pro-white.jpg', 1),
(40, 10, 'Xanh Dương', '128GB', 'APL-IP14PL-128-BLU', 21990000, 20990000, 12, 'iphone14plus-blue.jpg', 1),
(41, 10, 'Đen', '256GB', 'APL-IP14PL-256-BLK', 24990000, NULL, 8, 'iphone14plus-black.jpg', 1),
(42, 11, 'Hồng', '128GB', 'APL-IP13-128-PNK', 17990000, 16990000, 20, 'iphone13-pink.jpg', 1),
(43, 11, 'Đen', '256GB', 'APL-IP13-256-BLK', 20990000, NULL, 14, 'iphone13-black.jpg', 1),
(44, 12, 'Tím', '64GB', 'APL-IP12M-64-PUR', 10990000, 9990000, 9, 'iphone12mini-purple.jpg', 1),
(45, 13, 'Đen', '256GB', 'SS-S23U-256-BLK', 27990000, 26990000, 11, 's23ultra-black.jpg', 1),
(46, 13, 'Xanh Lá', '512GB', 'SS-S23U-512-GRN', 31990000, NULL, 6, 's23ultra-green.jpg', 1),
(53, 20, 'Đen', '128GB', 'XM-R13C-128-BLK', 3490000, NULL, 30, 'redmi13c-black.jpg', 1),
(56, 23, 'Tím', '128GB', 'OP-A79-128-PUR', 5990000, NULL, 16, 'a79-purple.jpg', 1),
(57, 24, 'Đen', '512GB', 'VV-X100P-512-BLK', 24990000, 23990000, 9, 'x100pro-black.jpg', 1),
(58, 25, 'Đỏ', '256GB', 'VV-V30-256-RED', 10990000, 10490000, 13, 'v30-red.jpg', 1),
(59, 26, 'Xanh', '128GB', 'VV-Y100-128-BLU', 5990000, NULL, 28, 'y100-blue.jpg', 1),
(60, 27, 'Cam', '512GB', 'RM-GT5P-512-ORG', 15990000, 14990000, 10, 'gt5pro-orange.jpg', 1),
(61, 28, 'Xám', '256GB', 'RM-12PP-256-GRY', 11990000, 11490000, 14, '12proplus-gray.jpg', 1),
(62, 29, 'Đen', '128GB', 'RM-C67-128-BLK', 4990000, 4590000, 18, 'c67-black.jpg', 1),
(63, 14, 'Kem', '128GB', 'SS-S23FE-128-CRE', 14990000, 13990000, 16, NULL, 1),
(64, 15, 'Xanh Navy', '256GB', 'SS-A55-256-NAVY', 10990000, 9990000, 25, NULL, 1),
(65, 16, 'Tím', '256GB', 'SS-ZF5-256-PUR', 22990000, 21990000, 7, NULL, 1),
(66, 17, 'Đen', '512GB', 'XM-13TP-512-BLK', 16990000, 15990000, 18, NULL, 1),
(67, 18, 'Xanh', '256GB', 'XM-RN13P-256-BLU', 8990000, 8490000, 22, NULL, 1),
(68, 19, 'Vàng', '256GB', 'POCO-X6P-256-YLW', 9990000, 9490000, 19, NULL, 1),
(69, 21, 'Nâu', '256GB', 'OP-FX6P-256-BRN', 23990000, 22990000, 5, NULL, 1),
(70, 22, 'Xanh Lá', '256GB', 'OP-R11F-256-GRN', 7990000, 7490000, 21, NULL, 1);


-- Thông số kỹ thuật iPhone 15 Pro Max
INSERT INTO `thong_so_ky_thuat` (`san_pham_id`,`ten_thong_so`,`gia_tri`,`thu_tu`) VALUES
(1,'Màn hình',   '6.7 inch Super Retina XDR OLED, 120Hz ProMotion',1),
(1,'Chip',       'A17 Pro (3nm)',2),
(1,'RAM',        '8GB',3),
(1,'Camera sau', '48MP + 12MP + 12MP (Telephoto 5x)',4),
(1,'Camera trước','12MP TrueDepth',5),
(1,'Pin',        '4422mAh, sạc nhanh 27W',6),
(1,'Hệ điều hành','iOS 17',7),
(1,'Kết nối',   'Wi-Fi 6E, Bluetooth 5.3, NFC, USB-C 3.0',8),
(1,'Chất liệu', 'Titan cấp độ hàng không vũ trụ + Kính Ceramic Shield',9),
(1,'Kháng nước','IP68 (6m trong 30 phút)',10);

-- Mã giảm giá mẫu
INSERT INTO `ma_giam_gia` (`ma`,`ten`,`loai`,`gia_tri`,`giam_toi_da`,`don_hang_toi_thieu`,`so_luong_tong`,`ket_thuc`) VALUES
('WELCOME10','Giảm 10% chào mừng','phan_tram',10.00,500000,   1000000,  1000,'2025-12-31 23:59:59'),
('FLASH500K', 'Flash sale giảm 500K', 'co_dinh',  500000.00,NULL,5000000,  200, '2025-06-30 23:59:59'),
('PHONEZONE5','Ưu đãi 5% mọi đơn',  'phan_tram',5.00,  300000,  500000,   NULL,'2025-12-31 23:59:59');

-- Cài đặt hệ thống
INSERT INTO `cai_dat` (`khoa`,`gia_tri`,`nhom`) VALUES
('ten_cua_hang',  'PhoneZone',              'chung'),
('slogan',        'Thiên đường điện thoại', 'chung'),
('email_lien_he', 'info@phonezone.vn',      'chung'),
('hotline',       '1900 6789',              'chung'),
('dia_chi',       'Hà Nội, Việt Nam',       'chung'),
('phi_ship_mac_dinh','30000',               'van_chuyen'),
('mien_phi_ship_tu','1000000',              'van_chuyen'),
('thue_vat',      '0',                      'thanh_toan'),
('tien_te',       'VND',                    'thanh_toan');

-- chi tiết đơn hàng
INSERT INTO `chi_tiet_don_hang` (`id`, `don_hang_id`, `bien_the_id`, `ten_san_pham`, `mau_sac`, `dung_luong`, `sku`, `hinh_anh`, `don_gia`, `so_luong`, `thanh_tien`) VALUES
(16, 15, 4, 'iPhone 15 Pro Max 256GB – Chính hãng VN/A', 'Titan Trắng', '512GB', 'APL-IP15PM-512-WHT', 'https://brain-images-ssl.cdn.dixons.com/8/3/10242738/u_10242738.jpg', 43990000, 1, 43990000),
(17, 16, 1, 'iPhone 15 Pro Max 256GB – Chính hãng VN/A', 'Titan Đen', '256GB', 'APL-IP15PM-256-BLK', 'https://brain-images-ssl.cdn.dixons.com/8/3/10242738/u_10242738.jpg', 28990000, 1, 28990000),
(18, 17, 63, 'Samsung Galaxy S23 FE', 'Kem', '128GB', 'SS-S23FE-128-CRE', 'products/img_6a18f2d86514a4.12071273.jpg', 13990000, 1, 13990000);


-- đánh giá
INSERT INTO `danh_gia` (`id`, `san_pham_id`, `khach_hang_id`, `don_hang_id`, `ho_ten`, `so_sao`, `tieu_de`, `noi_dung`, `trang_thai`, `created_at`) VALUES
(1, 1, 1, NULL, 'trinh thi hoa', 4, '1', '1111', 'da_duyet', '2026-05-29 03:57:11'),
(2, 9, NULL, NULL, 'Nguyễn Minh Quân', 5, 'Máy rất mượt', 'Dùng iPhone 14 Pro rất ổn định, camera đẹp và pin tốt.', 'da_duyet', '2025-05-01 10:15:00'),
(3, 9, NULL, NULL, 'Trần Quốc Bảo', 4, 'Camera đẹp', 'Chụp ảnh ban đêm khá ấn tượng, màn hình mượt.', 'da_duyet', '2025-05-02 09:20:00'),
(4, 10, NULL, NULL, 'Lê Hoàng Nam', 5, 'Pin trâu', 'iPhone 14 Plus dùng 2 ngày mới sạc.', 'da_duyet', '2025-05-03 14:00:00'),
(5, 11, NULL, NULL, 'Phạm Đức Anh', 5, 'Đáng mua', 'iPhone 13 vẫn rất mạnh và chơi game tốt.', 'da_duyet', '2025-05-04 08:40:00'),
(6, 12, NULL, NULL, 'Đặng Hải Đăng', 4, 'Nhỏ gọn', 'Máy nhỏ dễ cầm, phù hợp dùng cơ bản.', 'da_duyet', '2025-05-05 11:30:00'),
(7, 13, NULL, NULL, 'Võ Minh Hiếu', 5, 'Zoom cực đỉnh', 'Galaxy S23 Ultra zoom xa cực nét.', 'da_duyet', '2025-05-06 13:10:00'),
(8, 14, NULL, NULL, 'Nguyễn Khánh', 4, 'Hiệu năng tốt', 'S23 FE chơi game khá mượt.', 'da_duyet', '2025-05-07 15:45:00'),
(9, 15, NULL, NULL, 'Lý Thành Công', 5, 'Màn hình đẹp', 'Galaxy A55 hiển thị đẹp và pin ổn.', 'da_duyet', '2025-05-08 17:20:00'),
(10, 16, NULL, NULL, 'Bùi Trung Kiên', 4, 'Thiết kế đẹp', 'Z Flip5 gập mở rất thích.', 'da_duyet', '2025-05-09 12:00:00'),
(11, 17, NULL, NULL, 'Hoàng Nhật Minh', 5, 'Camera Leica đẹp', 'Xiaomi 13T Pro chụp chân dung tốt.', 'da_duyet', '2025-05-10 18:25:00'),
(12, 18, NULL, NULL, 'Phan Văn Tài', 4, 'Giá hợp lý', 'Redmi Note 13 Pro cấu hình ngon trong tầm giá.', 'da_duyet', '2025-05-11 20:15:00'),
(13, 19, NULL, NULL, 'Đỗ Gia Huy', 5, 'Gaming tốt', 'POCO X6 Pro chiến game rất mượt.', 'da_duyet', '2025-05-12 09:50:00'),
(14, 20, NULL, NULL, 'Trịnh Văn Nam', 4, 'Máy ổn', 'Redmi 13C phù hợp học sinh sinh viên.', 'da_duyet', '2025-05-13 10:05:00'),
(15, 21, NULL, NULL, 'Ngô Thành Đạt', 5, 'OPPO chụp đẹp', 'Find X6 Pro chụp đêm cực tốt.', 'da_duyet', '2025-05-14 16:30:00'),
(16, 22, NULL, NULL, 'Lê Minh Tuấn', 4, 'Selfie đẹp', 'Reno11 F thiết kế đẹp và nhẹ.', 'da_duyet', '2025-05-15 14:40:00'),
(17, 23, NULL, NULL, 'Nguyễn Hải Long', 4, 'Pin khá', 'OPPO A79 dùng ổn trong tầm giá.', 'da_duyet', '2025-05-16 11:11:00'),
(18, 24, NULL, NULL, 'Đinh Quang Huy', 5, 'Camera xuất sắc', 'Vivo X100 Pro chụp ảnh rất chất lượng.', 'da_duyet', '2025-05-17 08:45:00'),
(19, 25, NULL, NULL, 'Phạm Nhật Duy', 4, 'Thiết kế đẹp', 'Vivo V30 cầm nhẹ và màn đẹp.', 'da_duyet', '2025-05-18 19:10:00'),
(20, 27, NULL, NULL, 'Trần Quốc Việt', 5, 'Chơi game ngon', 'Realme GT5 Pro hiệu năng cực mạnh.', 'da_duyet', '2025-05-19 21:00:00'),
(21, 28, NULL, NULL, 'Vũ Minh Khang', 4, 'Camera zoom tốt', 'Realme 12 Pro Plus chụp xa đẹp.', 'da_duyet', '2025-05-20 13:33:00');


-- đơn hàng
INSERT INTO `don_hang` (`id`, `ma_don`, `khach_hang_id`, `ten_nguoi_nhan`, `so_dien_thoai`, `tinh_thanh`, `quan_huyen`, `phuong_xa`, `so_nha_duong`, `ghi_chu`, `tam_tinh`, `giam_gia`, `phi_van_chuyen`, `tong_tien`, `ma_giam_gia_id`, `phuong_thuc_tt`, `trang_thai_tt`, `ma_giao_dich`, `trang_thai`, `ma_van_don`, `don_vi_van_chuyen`, `ngay_du_kien_giao`, `ngay_giao_thuc`, `created_at`, `updated_at`) VALUES
(1, 'ORD-20250510-002', 2, 'Trần Quốc Bảo', '0978123456', 'Hà Nội', 'Đống Đa', 'Láng Hạ', '88 Huỳnh Thúc Kháng', NULL, 21990000, 200000, 30000, 21820000, 2, 'momo', 'da_tt', NULL, 'dang_giao', NULL, NULL, NULL, NULL, '2025-05-10 09:00:00', '2026-05-29 08:25:42'),
(2, 'ORD-20250510-003', 3, 'Lê Hoàng Nam', '0965234789', 'Hà Nội', 'Hai Bà Trưng', 'Bạch Mai', '45 Minh Khai', NULL, 17990000, 0, 30000, 18020000, NULL, 'cod', 'chua_tt', NULL, 'cho_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-10 10:15:00', '2026-05-29 08:25:42'),
(3, 'ORD-20250510-004', 4, 'Phạm Đức Anh', '0934567891', 'Hà Nội', 'Thanh Xuân', 'Nhân Chính', '120 Nguyễn Trãi', NULL, 27990000, 500000, 0, 27490000, 1, 'vnpay', 'da_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-11 14:30:00', '2026-05-29 08:25:42'),
(4, 'ORD-20250510-005', 5, 'Đặng Hải Đăng', '0912345678', 'Hà Nội', 'Hoàng Mai', 'Định Công', '56 Giải Phóng', NULL, 10990000, 0, 30000, 11020000, NULL, 'cod', 'chua_tt', NULL, 'dang_dong_hang', NULL, NULL, NULL, NULL, '2025-05-11 16:00:00', '2026-05-29 08:25:42'),
(5, 'ORD-20250510-006', 6, 'Võ Minh Hiếu', '0981122334', 'Hà Nội', 'Nam Từ Liêm', 'Mỹ Đình 1', '33 Hàm Nghi', NULL, 16990000, 200000, 30000, 16820000, 2, 'zalopay', 'da_tt', NULL, 'da_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-12 08:20:00', '2026-05-29 08:25:42'),
(6, 'ORD-20250510-007', 7, 'Nguyễn Khánh', '0977445566', 'Hà Nội', 'Bắc Từ Liêm', 'Xuân Đỉnh', '78 Phạm Văn Đồng', NULL, 8990000, 0, 30000, 9020000, NULL, 'cod', 'chua_tt', NULL, 'cho_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-12 10:45:00', '2026-05-29 08:25:42'),
(7, 'ORD-20250510-008', 8, 'Lý Thành Công', '0944556677', 'Hà Nội', 'Long Biên', 'Ngọc Lâm', '11 Nguyễn Văn Cừ', NULL, 23990000, 500000, 0, 23490000, 1, 'momo', 'da_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-13 13:15:00', '2026-05-29 08:25:42'),
(8, 'ORD-20250510-009', 9, 'Bùi Trung Kiên', '0922334455', 'Hà Nội', 'Hà Đông', 'Mộ Lao', '99 Trần Phú', NULL, 7990000, 0, 30000, 8020000, NULL, 'cod', 'chua_tt', NULL, 'dang_giao', NULL, NULL, NULL, NULL, '2025-05-13 15:00:00', '2026-05-29 08:25:42'),
(9, 'ORD-20250510-010', 10, 'Hoàng Nhật Minh', '0909888777', 'Hà Nội', 'Ba Đình', 'Kim Mã', '66 Đội Cấn', NULL, 24990000, 500000, 0, 24490000, 1, 'vnpay', 'da_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-14 11:40:00', '2026-05-29 08:25:42'),
(10, 'ORD-20250510-011', 1, 'Nguyễn Minh Quân', '0987654321', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '12 Trần Thái Tông', NULL, 15990000, 200000, 30000, 15720000, 2, 'cod', 'chua_tt', NULL, 'da_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-14 18:20:00', '2026-05-29 08:25:42'),
(11, 'ORD-20250510-012', 2, 'Trần Quốc Bảo', '0978123456', 'Hà Nội', 'Đống Đa', 'Láng Hạ', '88 Huỳnh Thúc Kháng', NULL, 11990000, 0, 30000, 12020000, NULL, 'momo', 'da_tt', NULL, 'da_giao', NULL, NULL, NULL, NULL, '2025-05-15 09:50:00', '2026-05-29 08:25:42'),
(12, 'ORD-20250510-013', 3, 'Lê Hoàng Nam', '0965234789', 'Hà Nội', 'Hai Bà Trưng', 'Bạch Mai', '45 Minh Khai', NULL, 4990000, 0, 30000, 5020000, NULL, 'cod', 'chua_tt', NULL, 'cho_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-15 12:10:00', '2026-05-29 08:25:42'),
(13, 'ORD-20250510-014', 4, 'Phạm Đức Anh', '0934567891', 'Hà Nội', 'Thanh Xuân', 'Nhân Chính', '120 Nguyễn Trãi', NULL, 22990000, 500000, 0, 22490000, 1, 'zalopay', 'da_tt', NULL, 'dang_giao', NULL, NULL, NULL, NULL, '2025-05-16 08:00:00', '2026-05-29 08:25:42'),
(14, 'ORD-20250510-015', 5, 'Đặng Hải Đăng', '0912345678', 'Hà Nội', 'Hoàng Mai', 'Định Công', '56 Giải Phóng', NULL, 10990000, 200000, 30000, 10720000, 2, 'cod', 'chua_tt', NULL, 'cho_xac_nhan', NULL, NULL, NULL, NULL, '2025-05-16 16:45:00', '2026-05-29 08:25:42'),
(15, 'ORD-20260529-845F6', 1, 'trịnh thị hòa', '0987654321', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '12 Trần Thái Tông', '', 43990000, 0, 0, 43990000, NULL, 'cod', 'chua_tt', NULL, 'cho_xac_nhan', NULL, NULL, NULL, NULL, '2026-05-29 09:21:08', '2026-05-29 09:21:08'),
(16, 'ORD-20260529-B6974', 1, 'Nguyễn Minh Quân', '0987654321', 'Hà Nội', 'Cầu Giấy', 'Dịch Vọng', '12 Trần Thái Tông', '', 28990000, 8000000, 0, 28990000, NULL, 'momo', 'chua_tt', NULL, 'da_xac_nhan', NULL, NULL, NULL, NULL, '2026-05-29 09:23:38', '2026-05-29 09:23:58'),
(17, 'ORD-20260529-85A5C', 1, 'trịnh thị hòa', '0364663178', 'hà nội', 'hai bà trưng', 'vĩnh hưng', '123', '', 13990000, 1000000, 0, 13990000, NULL, 'cod', 'chua_tt', NULL, 'cho_xac_nhan', NULL, NULL, NULL, NULL, '2026-05-29 09:27:29', '2026-05-29 09:27:29');
 
-- khách hàng
INSERT INTO `khach_hang` (`id`, `ho_ten`, `email`, `mat_khau`, `so_dien_thoai`, `gioi_tinh`, `ngay_sinh`, `avatar`, `trang_thai`, `email_verified`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'trinh thi hoa', 'hoa123@gmail.com', '$2y$12$wiPZYFYO3og8NKe9r9UmIO9g5AY5.b4ZhtemirEdS6xFLEGZI.Tpi', '0364663178', 'khac', '2004-02-13', 'avatars/img_6a18fccc303c92.81203772.jpeg', 'hoat_dong', 0, NULL, '2026-05-28 22:47:17', '2026-05-29 09:41:16'),
(2, 'khai', 'KHAI@gmail.com', '$2y$12$/orC8RaKs.JaQo.co.kyA.nRe8WCunryoUrj2NTK79uOZUXLRiVxO', '0123456789', 'khac', NULL, NULL, 'hoat_dong', 0, NULL, '2026-05-29 03:28:28', '2026-05-29 03:28:28'),
(3, 'Nguyễn Minh Quân', 'quan1@gmail.com', '$2y$10$abc123', '0987654321', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54'),
(4, 'Trần Quốc Bảo', 'bao2@gmail.com', '$2y$10$abc123', '0978123456', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54'),
(5, 'Lê Hoàng Nam', 'nam3@gmail.com', '$2y$10$abc123', '0965234789', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54'),
(6, 'Phạm Đức Anh', 'anh4@gmail.com', '$2y$10$abc123', '0934567891', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54'),
(7, 'Đặng Hải Đăng', 'dang5@gmail.com', '$2y$10$abc123', '0912345678', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54'),
(8, 'Võ Minh Hiếu', 'hieu6@gmail.com', '$2y$10$abc123', '0981122334', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54'),
(9, 'Nguyễn Khánh', 'khanh7@gmail.com', '$2y$10$abc123', '0977445566', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54'),
(10, 'Lý Thành Công', 'cong8@gmail.com', '$2y$10$abc123', '0944556677', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54'),
(11, 'Bùi Trung Kiên', 'kien9@gmail.com', '$2y$10$abc123', '0922334455', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54'),
(12, 'Hoàng Nhật Minh', 'minh10@gmail.com', '$2y$10$abc123', '0909888777', 'nam', NULL, NULL, 'hoat_dong', 1, NULL, '2026-05-29 08:22:54', '2026-05-29 08:22:54');

--lịch sử đơn hàng
INSERT INTO `lich_su_don_hang` (`id`, `don_hang_id`, `trang_thai`, `ghi_chu`, `nguoi_thuc_hien`, `created_at`) VALUES
(1, 15, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2026-05-29 09:21:08'),
(2, 16, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2026-05-29 09:23:38'),
(3, 16, 'da_xac_nhan', '', 'Admin', '2026-05-29 09:23:58'),
(4, 17, 'cho_xac_nhan', 'Đơn hàng được tạo', 'system', '2026-05-29 09:27:29');

-- mã giảm giá
INSERT INTO `ma_giam_gia` (`id`, `ma`, `ten`, `loai`, `gia_tri`, `giam_toi_da`, `don_hang_toi_thieu`, `so_luong_tong`, `so_luong_da_dung`, `gioi_han_moi_kh`, `bat_dau`, `ket_thuc`, `an_hien`, `created_at`) VALUES
(1, 'WELCOME10', 'Giảm 10% chào mừng', 'phan_tram', 10.00, 500000, 1000000, 1000, 0, 1, NULL, '2025-12-31 23:59:59', 1, '2026-05-28 15:50:14'),
(2, 'FLASH500K', 'Flash sale giảm 500K', 'co_dinh', 500000.00, NULL, 5000000, 200, 0, 1, NULL, '2025-06-30 23:59:59', 1, '2026-05-28 15:50:14'),
(3, 'PHONEZONE5', 'Ưu đãi 5% mọi đơn', 'phan_tram', 5.00, 300000, 500000, NULL, 0, 1, NULL, '2025-12-31 23:59:59', 1, '2026-05-28 15:50:14'),
(4, 'SALE10', 'Giảm 10% tối đa 500K', 'phan_tram', 10.00, 500000, 5000000, 100, 0, 1, '2025-01-01 00:00:00', '2025-12-31 23:59:59', 1, '2026-05-29 08:24:52'),
(5, 'GIAM200K', 'Giảm trực tiếp 200K', 'co_dinh', 200000.00, NULL, 3000000, 50, 0, 1, '2025-01-01 00:00:00', '2025-12-31 23:59:59', 1, '2026-05-29 08:24:52'),
(6, 'FREESHIP', 'Miễn phí vận chuyển', 'co_dinh', 30000.00, NULL, 1000000, NULL, 0, 2, '2025-01-01 00:00:00', '2025-12-31 23:59:59', 1, '2026-05-29 08:24:52');


-- sản phẩm
INSERT INTO `san_pham` (`id`, `danh_muc_id`, `hang_id`, `ten`, `slug`, `mo_ta_ngan`, `mo_ta_chi_tiet`, `hinh_chinh`, `noi_bat`, `ban_chay`, `an_hien`, `meta_title`, `meta_desc`, `luot_xem`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'iPhone 15 Pro Max 256GB – Chính hãng VN/A', 'iphone-15-pro-max-256gb-chinh-hang', 'Smartphone cao cấp nhất của Apple năm 2024 với chip A17 Pro, camera 48MP và màn hình 6.7 inch ProMotion 120Hz.', 'iPhone 15 Pro Max là chiếc điện thoại flagship cao cấp nhất của Apple, được trang bị chip A17 Pro tiên tiến nhất được sản xuất trên tiến trình 3nm, mang lại hiệu năng vượt trội cùng khả năng tiết kiệm pin tốt hơn.', 'https://brain-images-ssl.cdn.dixons.com/8/3/10242738/u_10242738.jpg', 1, 1, 1, 'iPhone 15 Pro Max 256GB Chính Hãng | PhoneZone', 'Mua iPhone 15 Pro Max 256GB chính hãng tại PhoneZone. Giá tốt nhất, bảo hành 12 tháng.', 11, '2026-05-28 15:50:14', '2026-05-29 09:42:01'),
(2, 2, 2, 'Samsung Galaxy S24 Ultra 256GB – Chính hãng', 'samsung-galaxy-s24-ultra-256gb', 'Flagship Android cao cấp của Samsung với bút S Pen tích hợp và AI Galaxy.', 'Samsung Galaxy S24 Ultra mang đến trải nghiệm smartphone cao cấp nhất với chip Snapdragon 8 Gen 3, camera 200MP và tích hợp S Pen.', 'https://cdn-v2.didongviet.vn/files/products/2024/0/18/1/1705512970393_samsung_galaxy_s24_ultra_xam_didongviet.png', 1, 1, 1, 'Samsung Galaxy S24 Ultra 256GB | PhoneZone', 'Mua Samsung Galaxy S24 Ultra chính hãng tại PhoneZone.', 1, '2026-05-28 15:50:14', '2026-05-29 08:33:18'),
(3, 3, 3, 'Xiaomi 14 Ultra 512GB – Chính hãng', 'xiaomi-14-ultra-512gb', 'Flagship Xiaomi với hệ thống camera Leica và chip Snapdragon 8 Gen 3.', 'Xiaomi 14 Ultra là đỉnh cao công nghệ của Xiaomi với camera đồng phát triển cùng Leica, chip Snapdragon 8 Gen 3 và màn hình AMOLED 6.73 inch.', 'https://tse4.mm.bing.net/th/id/OIP.Y9slyaK4YP9JEPBndWQBgAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', 1, 0, 1, 'Xiaomi 14 Ultra 512GB | PhoneZone', 'Mua Xiaomi 14 Ultra chính hãng tại PhoneZone.', 1, '2026-05-28 15:50:14', '2026-05-29 08:32:44'),
(9, 1, 1, 'iPhone 14 Pro 256GB', 'iphone-14-pro-256gb', 'iPhone cao cấp màn 120Hz', 'iPhone 14 Pro sở hữu Dynamic Island và chip A16 Bionic.', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6487/6487394cv2d.jpg', 1, 1, 1, 'iPhone 14 Pro Chính Hãng', 'Mua iPhone 14 Pro giá tốt.', 95, '2026-05-29 08:06:49', '2026-05-29 08:45:57'),
(10, 1, 1, 'iPhone 14 Plus 128GB', 'iphone-14-plus-128gb', 'iPhone màn lớn pin khỏe', 'iPhone 14 Plus có màn hình lớn và pin cực tốt.', 'https://th.bing.com/th/id/R.da84b990317f22342773efe8f39967dd?rik=%2bQJHsNSUMmg8yA&pid=ImgRaw&r=0', 0, 1, 1, 'iPhone 14 Plus', 'iPhone 14 Plus chính hãng.', 70, '2026-05-29 08:06:49', '2026-05-29 08:45:37'),
(11, 1, 1, 'iPhone 13 128GB', 'iphone-13-128gb', 'iPhone hiệu năng ổn định', 'iPhone 13 phù hợp chơi game và chụp ảnh.', 'https://media.ldlc.com/r1600/ld/products/00/05/93/01/LD0005930195_1.jpg', 0, 1, 1, 'iPhone 13', 'iPhone 13 giá tốt.', 65, '2026-05-29 08:06:49', '2026-05-29 08:45:12'),
(12, 1, 1, 'iPhone 12 Mini', 'iphone-12-mini', 'iPhone nhỏ gọn', 'iPhone 12 Mini dành cho người thích máy nhỏ.', 'https://d1eh9yux7w8iql.cloudfront.net/product_images/412291_4ddc3c20-8800-4bb5-8765-84d60b0aa3d1.jpg', 0, 0, 1, 'iPhone 12 Mini', 'iPhone nhỏ gọn hiệu năng cao.', 30, '2026-05-29 08:06:49', '2026-05-29 08:44:50'),
(13, 1, 2, 'Samsung Galaxy S23 Ultra', 'samsung-galaxy-s23-ultra', 'Flagship Samsung cao cấp', 'S23 Ultra có camera zoom mạnh và bút S-Pen.', 'https://static1.pocketnowimages.com/wordpress/wp-content/uploads/2023/02/pbi-samsung-galaxy-s23-ultra.png', 1, 1, 1, 'Samsung Galaxy S23 Ultra', 'Galaxy S23 Ultra chính hãng.', 120, '2026-05-29 08:06:49', '2026-05-29 08:44:27'),
(14, 1, 2, 'Samsung Galaxy S23 FE', 'samsung-galaxy-s23-fe', 'Flagship giá dễ tiếp cận', 'S23 FE hiệu năng mạnh camera đẹp.', 'products/img_6a18f2d86514a4.12071273.jpg', 1, 1, 1, 'Samsung Galaxy S23 FE', 'Samsung S23 FE giá tốt.', 90, '2026-05-29 08:06:49', '2026-05-29 09:27:42'),
(15, 1, 2, 'Samsung Galaxy A55 5G', 'samsung-galaxy-a55-5g', 'Tầm trung pin khỏe', 'Galaxy A55 có màn hình AMOLED đẹp.', 'products/img_6a18f2e96c49e7.82213788.webp', 0, 1, 1, 'Galaxy A55 5G', 'Samsung A55 chính hãng.', 52, '2026-05-29 08:06:49', '2026-05-29 08:59:05'),
(16, 1, 2, 'Samsung Galaxy Z Flip5', 'samsung-galaxy-z-flip5', 'Điện thoại gập thời trang', 'Galaxy Z Flip5 thiết kế hiện đại.', 'products/img_6a18f34c332153.53422768.jpg', 1, 0, 1, 'Galaxy Z Flip5', 'Điện thoại Samsung gập.', 74, '2026-05-29 08:06:49', '2026-05-29 09:00:44'),
(17, 1, 3, 'Xiaomi 13T Pro', 'xiaomi-13t-pro', 'Camera Leica cao cấp', 'Xiaomi 13T Pro hiệu năng mạnh sạc siêu nhanh.', 'products/img_6a18f37d475379.13062278.webp', 1, 1, 1, 'Xiaomi 13T Pro', 'Điện thoại Xiaomi cao cấp.', 90, '2026-05-29 08:06:49', '2026-05-29 09:01:33'),
(18, 1, 3, 'Redmi Note 13 Pro', 'redmi-note-13-pro', 'Giá rẻ cấu hình mạnh', 'Redmi Note 13 Pro phù hợp học sinh sinh viên.', 'products/img_6a18f38ac397d6.28675732.jpg', 0, 1, 1, 'Redmi Note 13 Pro', 'Redmi Note 13 Pro giá tốt.', 58, '2026-05-29 08:06:49', '2026-05-29 09:01:46'),
(19, 1, 3, 'POCO X6 Pro', 'poco-x6-pro', 'Gaming phone giá tốt', 'POCO X6 Pro hiệu năng mạnh cho game thủ.', 'products/img_6a18f39779db58.03992812.webp', 0, 1, 1, 'POCO X6 Pro', 'POCO X6 Pro cấu hình mạnh.', 62, '2026-05-29 08:06:49', '2026-05-29 09:01:59'),
(20, 1, 3, 'Redmi 13C', 'redmi-13c', 'Điện thoại phổ thông', 'Redmi 13C pin khỏe giá rẻ.', 'https://welectronics.com/images/stories/virtuemart/product/XiaomiRedmi13Cwht1.jpg', 0, 0, 1, 'Redmi 13C', 'Xiaomi Redmi giá rẻ.', 27, '2026-05-29 08:06:49', '2026-05-29 09:03:25'),
(21, 1, 4, 'OPPO Find X6 Pro', 'oppo-find-x6-pro', 'Flagship camera đẹp', 'Find X6 Pro có camera Hasselblad cao cấp.', 'products/img_6a18f3ad05a693.14532766.webp', 1, 1, 1, 'OPPO Find X6 Pro', 'OPPO flagship chính hãng.', 78, '2026-05-29 08:06:49', '2026-05-29 09:02:21'),
(22, 1, 4, 'OPPO Reno11 F', 'oppo-reno11-f', 'Thiết kế đẹp selfie tốt', 'Reno11 F phù hợp giới trẻ.', 'products/img_6a18f3b8825435.00566512.webp', 0, 1, 1, 'OPPO Reno11 F', 'OPPO Reno11 F giá tốt.', 41, '2026-05-29 08:06:49', '2026-05-29 09:02:32'),
(23, 1, 4, 'OPPO A79 5G', 'oppo-a79-5g', 'Pin khỏe sạc nhanh', 'OPPO A79 đáp ứng tốt nhu cầu cơ bản.', 'https://smartphoneshop.co.za/cdn/shop/files/31_1200x.png?v=1719565916', 0, 0, 1, 'OPPO A79 5G', 'Điện thoại OPPO giá rẻ.', 26, '2026-05-29 08:06:49', '2026-05-29 09:03:55'),
(24, 1, 5, 'Vivo X100 Pro', 'vivo-x100-pro', 'Camera Zeiss flagship', 'Vivo X100 Pro chụp ảnh chuyên nghiệp.', 'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/Vivo-X100-Pro-Verkaufsszahlen.jpg', 1, 1, 1, 'Vivo X100 Pro', 'Vivo flagship cao cấp.', 93, '2026-05-29 08:06:49', '2026-05-29 08:38:10'),
(25, 1, 5, 'Vivo V30 5G', 'vivo-v30-5g', 'Thiết kế mỏng nhẹ', 'Vivo V30 nổi bật với camera selfie.', 'https://www.gsmarena.com.bd/images/products/Vivo-V30-5G-Green.jpg', 0, 1, 1, 'Vivo V30 5G', 'Vivo V30 chính hãng.', 37, '2026-05-29 08:06:49', '2026-05-29 08:37:41'),
(26, 1, 5, 'Vivo Y100', 'vivo-y100', 'Pin lớn giá hợp lý', 'Vivo Y100 phù hợp nhu cầu cơ bản.', 'https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/1718680668993/6d801ccb514b850a8f3c8cfae524679e.png', 0, 0, 1, 'Vivo Y100', 'Điện thoại Vivo giá tốt.', 23, '2026-05-29 08:06:49', '2026-05-29 08:37:18'),
(27, 1, 6, 'Realme GT5 Pro', 'realme-gt5-pro', 'Gaming phone mạnh mẽ', 'Realme GT5 Pro dùng chip Snapdragon cao cấp.', 'https://tse1.explicit.bing.net/th/id/OIP.EhDSRzu9A8jRb3ZFGxPz-gHaI2?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', 1, 1, 1, 'Realme GT5 Pro', 'Điện thoại Realme gaming.', 68, '2026-05-29 08:06:49', '2026-05-29 08:35:31'),
(28, 1, 6, 'Realme 12 Pro Plus', 'realme-12-pro-plus', 'Camera zoom đẹp', 'Realme 12 Pro Plus có camera tiềm vọng.', 'https://img-prd-pim.poorvika.com/product/Realme-12-pro-plus-5g-navigator-beige-8gb-128gb-ram-Front-Back-View.png', 0, 1, 1, 'Realme 12 Pro Plus', 'Realme camera đẹp.', 45, '2026-05-29 08:06:49', '2026-05-29 08:35:03'),
(29, 1, 6, 'Realme C67', 'realme-c67', 'Điện thoại giá rẻ', 'Realme C67 pin khỏe cho học sinh sinh viên.', 'https://m.media-amazon.com/images/I/71IIEtyfcvL.jpg', 0, 0, 1, 'Realme C67', 'Realme C67 giá tốt.', 21, '2026-05-29 08:06:49', '2026-05-29 08:34:43');
