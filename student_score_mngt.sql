/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : student_score_mngt

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 30/07/2024 09:22:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bo_mons
-- ----------------------------
DROP TABLE IF EXISTS `bo_mons`;
CREATE TABLE `bo_mons`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_bo_mon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_khoa` int NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_khoa`(`id_khoa` ASC) USING BTREE,
  CONSTRAINT `bo_mons_ibfk_1` FOREIGN KEY (`id_khoa`) REFERENCES `khoas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bo_mons
-- ----------------------------
INSERT INTO `bo_mons` VALUES (1, 'Công Nghệ Phần Mềm', 1, 1, NULL, NULL);
INSERT INTO `bo_mons` VALUES (2, 'Mạng Máy Tính', 1, 1, NULL, NULL);
INSERT INTO `bo_mons` VALUES (3, 'Văn Hóa Ngoại Ngữ', 6, 1, NULL, NULL);

-- ----------------------------
-- Table structure for chuc_vu_giang_viens
-- ----------------------------
DROP TABLE IF EXISTS `chuc_vu_giang_viens`;
CREATE TABLE `chuc_vu_giang_viens`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_chuc_vu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chuc_vu_giang_viens
-- ----------------------------
INSERT INTO `chuc_vu_giang_viens` VALUES (1, 'Siêu quản trị viên', 1, NULL, NULL);
INSERT INTO `chuc_vu_giang_viens` VALUES (2, 'Quản trị viên', 1, NULL, NULL);
INSERT INTO `chuc_vu_giang_viens` VALUES (3, 'Giảng Viên', 1, NULL, NULL);

-- ----------------------------
-- Table structure for chuc_vu_sinh_viens
-- ----------------------------
DROP TABLE IF EXISTS `chuc_vu_sinh_viens`;
CREATE TABLE `chuc_vu_sinh_viens`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_chuc_vu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chuc_vu_sinh_viens
-- ----------------------------
INSERT INTO `chuc_vu_sinh_viens` VALUES (1, 'Lớp trưởng', 1, NULL, NULL);
INSERT INTO `chuc_vu_sinh_viens` VALUES (2, 'Lớp phó 1', 1, NULL, NULL);
INSERT INTO `chuc_vu_sinh_viens` VALUES (3, 'Lớp phó 2', 1, NULL, NULL);
INSERT INTO `chuc_vu_sinh_viens` VALUES (4, 'Bí thư', 1, NULL, NULL);
INSERT INTO `chuc_vu_sinh_viens` VALUES (5, 'Phó bí thư', 1, NULL, NULL);
INSERT INTO `chuc_vu_sinh_viens` VALUES (6, 'Thủ quỹ', 1, NULL, NULL);

-- ----------------------------
-- Table structure for chuong_trinh_dao_taos
-- ----------------------------
DROP TABLE IF EXISTS `chuong_trinh_dao_taos`;
CREATE TABLE `chuong_trinh_dao_taos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `khoa_hoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_chuyen_nganh` int NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_chuyen_nganh`(`id_chuyen_nganh` ASC) USING BTREE,
  CONSTRAINT `chuong_trinh_dao_taos_ibfk_1` FOREIGN KEY (`id_chuyen_nganh`) REFERENCES `chuyen_nganhs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chuong_trinh_dao_taos
-- ----------------------------
INSERT INTO `chuong_trinh_dao_taos` VALUES (1, '2020', 5, 1, NULL, NULL);
INSERT INTO `chuong_trinh_dao_taos` VALUES (2, '2021', 5, 1, NULL, NULL);

-- ----------------------------
-- Table structure for chuyen_nganhs
-- ----------------------------
DROP TABLE IF EXISTS `chuyen_nganhs`;
CREATE TABLE `chuyen_nganhs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_chuyen_nganh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ma_chu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ma_so` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_khoa` int NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_khoa`(`id_khoa` ASC) USING BTREE,
  CONSTRAINT `chuyen_nganhs_ibfk_1` FOREIGN KEY (`id_khoa`) REFERENCES `khoas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chuyen_nganhs
-- ----------------------------
INSERT INTO `chuyen_nganhs` VALUES (1, 'Công nghệ Kỹ thuật Cơ khí', 'CK', '01', 2, 1, NULL, NULL);
INSERT INTO `chuyen_nganhs` VALUES (2, 'Công nghệ Kỹ thuật Ô tô', 'OTO', '02', 3, 1, NULL, NULL);
INSERT INTO `chuyen_nganhs` VALUES (3, 'Công nghệ Kỹ thuật Điện-Điện tử', 'Đ-ĐT', '03', 4, 1, NULL, NULL);
INSERT INTO `chuyen_nganhs` VALUES (4, 'Công nghệ Kỹ thuật Nhiệt lạnh', 'NL', '04', 2, 1, NULL, NULL);
INSERT INTO `chuyen_nganhs` VALUES (5, 'Công nghệ Thông tin', 'TH', '06', 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for ct_chuong_trinh_dao_taos
-- ----------------------------
DROP TABLE IF EXISTS `ct_chuong_trinh_dao_taos`;
CREATE TABLE `ct_chuong_trinh_dao_taos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_chuong_trinh_dao_tao` int NULL DEFAULT NULL,
  `hoc_ky` int NULL DEFAULT NULL,
  `id_mon_hoc` int NULL DEFAULT NULL,
  `so_tin_chi` int NULL DEFAULT NULL,
  `so_tiet` int NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_chuong_trinh_dao_tao`(`id_chuong_trinh_dao_tao` ASC) USING BTREE,
  INDEX `id_mon_hoc`(`id_mon_hoc` ASC) USING BTREE,
  CONSTRAINT `ct_chuong_trinh_dao_taos_ibfk_1` FOREIGN KEY (`id_mon_hoc`) REFERENCES `mon_hocs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ct_chuong_trinh_dao_taos_ibfk_2` FOREIGN KEY (`id_chuong_trinh_dao_tao`) REFERENCES `chuong_trinh_dao_taos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ct_chuong_trinh_dao_taos
-- ----------------------------
INSERT INTO `ct_chuong_trinh_dao_taos` VALUES (1, 1, 1, 1, 3, 45, 1, NULL, NULL);
INSERT INTO `ct_chuong_trinh_dao_taos` VALUES (2, 1, 1, 2, 3, 45, 1, NULL, NULL);
INSERT INTO `ct_chuong_trinh_dao_taos` VALUES (3, 1, 1, 3, 5, 75, 1, NULL, NULL);

-- ----------------------------
-- Table structure for ct_lop_hoc_phans
-- ----------------------------
DROP TABLE IF EXISTS `ct_lop_hoc_phans`;
CREATE TABLE `ct_lop_hoc_phans`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_lop_hoc_phan` int NULL DEFAULT NULL,
  `ma_sv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `chuyen_can` int NULL DEFAULT NULL,
  `tbkt` double NULL DEFAULT NULL,
  `thi_1` double NULL DEFAULT NULL,
  `thi_2` double NULL DEFAULT NULL,
  `tong_ket_1` double NULL DEFAULT NULL,
  `tong_ket_2` double NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_lop_hoc_phan`(`id_lop_hoc_phan` ASC) USING BTREE,
  INDEX `ma_sv`(`ma_sv` ASC) USING BTREE,
  CONSTRAINT `ct_lop_hoc_phans_ibfk_1` FOREIGN KEY (`id_lop_hoc_phan`) REFERENCES `lop_hoc_phans` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ct_lop_hoc_phans_ibfk_2` FOREIGN KEY (`ma_sv`) REFERENCES `sinh_viens` (`ma_sv`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ct_lop_hoc_phans
-- ----------------------------
INSERT INTO `ct_lop_hoc_phans` VALUES (1, 1, '0307201123', 5, NULL, NULL, NULL, 0.5, NULL, 1, '2024-07-30 02:20:02', '2024-07-30 02:21:04');

-- ----------------------------
-- Table structure for danh_sach_chuc_vu_giang_viens
-- ----------------------------
DROP TABLE IF EXISTS `danh_sach_chuc_vu_giang_viens`;
CREATE TABLE `danh_sach_chuc_vu_giang_viens`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_gv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_chuc_vu` int NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ma_gv`(`ma_gv` ASC) USING BTREE,
  INDEX `id_chuc_vu`(`id_chuc_vu` ASC) USING BTREE,
  CONSTRAINT `danh_sach_chuc_vu_giang_viens_ibfk_1` FOREIGN KEY (`ma_gv`) REFERENCES `giang_viens` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `danh_sach_chuc_vu_giang_viens_ibfk_2` FOREIGN KEY (`id_chuc_vu`) REFERENCES `chuc_vu_giang_viens` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of danh_sach_chuc_vu_giang_viens
-- ----------------------------

-- ----------------------------
-- Table structure for danh_sach_chuc_vu_sinh_viens
-- ----------------------------
DROP TABLE IF EXISTS `danh_sach_chuc_vu_sinh_viens`;
CREATE TABLE `danh_sach_chuc_vu_sinh_viens`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_sv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_chuc_vu` int NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ma_sv`(`ma_sv` ASC) USING BTREE,
  INDEX `id_chuc_vu`(`id_chuc_vu` ASC) USING BTREE,
  CONSTRAINT `danh_sach_chuc_vu_sinh_viens_ibfk_1` FOREIGN KEY (`ma_sv`) REFERENCES `sinh_viens` (`ma_sv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `danh_sach_chuc_vu_sinh_viens_ibfk_2` FOREIGN KEY (`id_chuc_vu`) REFERENCES `chuc_vu_sinh_viens` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of danh_sach_chuc_vu_sinh_viens
-- ----------------------------

-- ----------------------------
-- Table structure for giang_viens
-- ----------------------------
DROP TABLE IF EXISTS `giang_viens`;
CREATE TABLE `giang_viens`  (
  `ma_gv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten_giang_vien` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `so_dien_thoai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `so_cmt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gioi_tinh` tinyint(1) NULL DEFAULT NULL,
  `ngay_sinh` date NULL DEFAULT NULL,
  `noi_sinh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dan_toc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ton_giao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dia_chi_thuong_tru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dia_chi_tam_tru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hinh_anh_dai_dien` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tai_khoan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_bo_mon` int NULL DEFAULT NULL,
  `id_chuc_vu` int NULL DEFAULT NULL,
  `tinh_trang_lam_viec` tinyint(1) NULL DEFAULT 1,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ma_gv`) USING BTREE,
  INDEX `id_bo_mon`(`id_bo_mon` ASC) USING BTREE,
  INDEX `id_chuc_vu`(`id_chuc_vu` ASC) USING BTREE,
  CONSTRAINT `giang_viens_ibfk_1` FOREIGN KEY (`id_bo_mon`) REFERENCES `bo_mons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `giang_viens_ibfk_2` FOREIGN KEY (`id_chuc_vu`) REFERENCES `chuc_vu_giang_viens` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of giang_viens
-- ----------------------------
INSERT INTO `giang_viens` VALUES ('046123000', 'Pham Anh Tiến', 'phamanhtien@edu.vn', '0906913419', '123456789', 1, '2002-04-04', 'HCM', 'Kinh', 'Không', 'HCM', 'HCM', NULL, 'admin', '$2y$10$bYsl0e3cpJ8OBNk2pr/IKeUCyeJal3noCzQYZPfn6ACm.7KI9wJZW', NULL, 1, 1, 1, NULL, NULL);
INSERT INTO `giang_viens` VALUES ('046123001', 'Giáo Viên 1', 'gv1@edu.vn', '0906913419', '123456789', 1, '2002-04-04', 'HCM', 'Kinh', 'Không', 'HCM', 'HCM', NULL, 'gv1', '$2y$10$Zxbigzh621VAg7XuUADmG.iLfWw4fOS8dXR8Mbh9XU9VoPtvERlKK', 2, 2, 1, 1, NULL, NULL);
INSERT INTO `giang_viens` VALUES ('046123002', 'Giáo Viên 2', 'gv2@edu.vn', '0906913419', '123456789', 1, '2002-04-04', 'HCM', 'Kinh', 'Không', 'HCM', 'HCM', NULL, 'gv2', '$2y$10$.qbm7du54yVYBQ.dXKvZ3.JwNsTc894ExIKPhq6WCCtVsfNvBZTMG', 3, 3, 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for hoc_phis
-- ----------------------------
DROP TABLE IF EXISTS `hoc_phis`;
CREATE TABLE `hoc_phis`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hoc_ky` int NULL DEFAULT NULL,
  `khoa_hoc` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_chuyen_nganh` int NULL DEFAULT NULL,
  `so_tien` decimal(10, 0) NULL DEFAULT NULL,
  `ngay_bat_dau` datetime NULL DEFAULT NULL,
  `ngay_ket_thuc` datetime NULL DEFAULT NULL,
  `mo_dong_hoc_phi` tinyint(1) NULL DEFAULT 1,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_chuyen_nganh`(`id_chuyen_nganh` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hoc_phis
-- ----------------------------

-- ----------------------------
-- Table structure for khoas
-- ----------------------------
DROP TABLE IF EXISTS `khoas`;
CREATE TABLE `khoas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_khoa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of khoas
-- ----------------------------
INSERT INTO `khoas` VALUES (1, 'Công Nghệ Thông Tin', 1, NULL, NULL);
INSERT INTO `khoas` VALUES (2, 'Cơ Khí', 1, NULL, NULL);
INSERT INTO `khoas` VALUES (3, 'Cơ Khí Động Lực', 1, NULL, NULL);
INSERT INTO `khoas` VALUES (4, 'Điện - Điện Tử', 1, NULL, NULL);
INSERT INTO `khoas` VALUES (5, 'Công Nghệ Nhiệt - Lạnh', 1, NULL, NULL);
INSERT INTO `khoas` VALUES (6, 'Giáo Dục Đại Cương', 1, NULL, NULL);
INSERT INTO `khoas` VALUES (7, 'Bộ Môn Kinh Tế', 1, NULL, NULL);

-- ----------------------------
-- Table structure for loai_mon_hocs
-- ----------------------------
DROP TABLE IF EXISTS `loai_mon_hocs`;
CREATE TABLE `loai_mon_hocs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_loai_mon_hoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loai_mon_hocs
-- ----------------------------
INSERT INTO `loai_mon_hocs` VALUES (1, 'Lý Thuyết', 1, NULL, NULL);
INSERT INTO `loai_mon_hocs` VALUES (2, 'Thực Hành', 1, NULL, NULL);
INSERT INTO `loai_mon_hocs` VALUES (3, 'Đồ Án', 1, NULL, NULL);

-- ----------------------------
-- Table structure for loai_phongs
-- ----------------------------
DROP TABLE IF EXISTS `loai_phongs`;
CREATE TABLE `loai_phongs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_loai_phong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loai_phongs
-- ----------------------------

-- ----------------------------
-- Table structure for lop_hoc_phans
-- ----------------------------
DROP TABLE IF EXISTS `lop_hoc_phans`;
CREATE TABLE `lop_hoc_phans`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_lop_hoc_phan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_lop_hoc` int NULL DEFAULT NULL,
  `ma_gv_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ma_gv_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ma_gv_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_ct_chuong_trinh_dao_tao` int NULL DEFAULT NULL,
  `mo_dang_ky` tinyint(1) NULL DEFAULT 1,
  `trang_thai_hoan_thanh` tinyint(1) NULL DEFAULT 0,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_lop_hoc`(`id_lop_hoc` ASC) USING BTREE,
  INDEX `ma_gv_1`(`ma_gv_1` ASC) USING BTREE,
  INDEX `ma_gv_2`(`ma_gv_2` ASC) USING BTREE,
  INDEX `ma_gv_3`(`ma_gv_3` ASC) USING BTREE,
  INDEX `id_ct_chuong_trinh_dao_tao`(`id_ct_chuong_trinh_dao_tao` ASC) USING BTREE,
  CONSTRAINT `lop_hoc_phans_ibfk_1` FOREIGN KEY (`id_ct_chuong_trinh_dao_tao`) REFERENCES `ct_chuong_trinh_dao_taos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lop_hoc_phans_ibfk_2` FOREIGN KEY (`ma_gv_1`) REFERENCES `giang_viens` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lop_hoc_phans_ibfk_3` FOREIGN KEY (`ma_gv_2`) REFERENCES `giang_viens` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lop_hoc_phans_ibfk_4` FOREIGN KEY (`ma_gv_3`) REFERENCES `giang_viens` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lop_hoc_phans_ibfk_5` FOREIGN KEY (`id_lop_hoc`) REFERENCES `lop_hocs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lop_hoc_phans
-- ----------------------------
INSERT INTO `lop_hoc_phans` VALUES (1, 'CN 23 SG1 - 2020.Nhập Môn Lập Trình', 1, '046123001', '046123002', NULL, 1, 1, 0, 1, '2024-07-30 02:19:53', '2024-07-30 02:19:53');

-- ----------------------------
-- Table structure for lop_hocs
-- ----------------------------
DROP TABLE IF EXISTS `lop_hocs`;
CREATE TABLE `lop_hocs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_lop_hoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_chuyen_nganh` int NULL DEFAULT NULL,
  `ma_gv_chu_nhiem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_chuyen_nganh`(`id_chuyen_nganh` ASC) USING BTREE,
  INDEX `ma_gv_chu_nhiem`(`ma_gv_chu_nhiem` ASC) USING BTREE,
  CONSTRAINT `lop_hocs_ibfk_1` FOREIGN KEY (`ma_gv_chu_nhiem`) REFERENCES `giang_viens` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lop_hocs_ibfk_2` FOREIGN KEY (`id_chuyen_nganh`) REFERENCES `chuyen_nganhs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lop_hocs
-- ----------------------------
INSERT INTO `lop_hocs` VALUES (1, 'CN 23 SG1', 5, NULL, 1, NULL, NULL);
INSERT INTO `lop_hocs` VALUES (2, 'CN 22 SG3', 5, NULL, 1, NULL, NULL);
INSERT INTO `lop_hocs` VALUES (3, 'CN 20 SG1', 5, NULL, 1, NULL, NULL);
INSERT INTO `lop_hocs` VALUES (4, 'CN 24 SG2', 5, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (2, '2023_07_13_175811_create_bo_mons_table', 1);
INSERT INTO `migrations` VALUES (3, '2023_07_13_175811_create_chuc_vu_giang_viens_table', 1);
INSERT INTO `migrations` VALUES (4, '2023_07_13_175811_create_chuc_vu_sinh_viens_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_07_13_175811_create_chuong_trinh_dao_taos_table', 1);
INSERT INTO `migrations` VALUES (6, '2023_07_13_175811_create_chuyen_nganhs_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_07_13_175811_create_ct_chuong_trinh_dao_taos_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_07_13_175811_create_ct_lop_hoc_phans_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_07_13_175811_create_danh_sach_chuc_vu_giang_viens_table', 1);
INSERT INTO `migrations` VALUES (10, '2023_07_13_175811_create_danh_sach_chuc_vu_sinh_viens_table', 1);
INSERT INTO `migrations` VALUES (11, '2023_07_13_175811_create_giang_viens_table', 1);
INSERT INTO `migrations` VALUES (12, '2023_07_13_175811_create_hoc_phis_table', 1);
INSERT INTO `migrations` VALUES (13, '2023_07_13_175811_create_khoas_table', 1);
INSERT INTO `migrations` VALUES (14, '2023_07_13_175811_create_loai_mon_hocs_table', 1);
INSERT INTO `migrations` VALUES (15, '2023_07_13_175811_create_loai_phongs_table', 1);
INSERT INTO `migrations` VALUES (16, '2023_07_13_175811_create_lop_hoc_phans_table', 1);
INSERT INTO `migrations` VALUES (17, '2023_07_13_175811_create_lop_hocs_table', 1);
INSERT INTO `migrations` VALUES (18, '2023_07_13_175811_create_mon_hocs_table', 1);
INSERT INTO `migrations` VALUES (19, '2023_07_13_175811_create_phongs_table', 1);
INSERT INTO `migrations` VALUES (20, '2023_07_13_175811_create_sinh_viens_table', 1);
INSERT INTO `migrations` VALUES (21, '2023_07_13_175814_add_foreign_keys_to_bo_mons_table', 1);
INSERT INTO `migrations` VALUES (22, '2023_07_13_175814_add_foreign_keys_to_chuong_trinh_dao_taos_table', 1);
INSERT INTO `migrations` VALUES (23, '2023_07_13_175814_add_foreign_keys_to_chuyen_nganhs_table', 1);
INSERT INTO `migrations` VALUES (24, '2023_07_13_175814_add_foreign_keys_to_ct_chuong_trinh_dao_taos_table', 1);
INSERT INTO `migrations` VALUES (25, '2023_07_13_175814_add_foreign_keys_to_ct_lop_hoc_phans_table', 1);
INSERT INTO `migrations` VALUES (26, '2023_07_13_175814_add_foreign_keys_to_danh_sach_chuc_vu_giang_viens_table', 1);
INSERT INTO `migrations` VALUES (27, '2023_07_13_175814_add_foreign_keys_to_danh_sach_chuc_vu_sinh_viens_table', 1);
INSERT INTO `migrations` VALUES (28, '2023_07_13_175814_add_foreign_keys_to_giang_viens_table', 1);
INSERT INTO `migrations` VALUES (29, '2023_07_13_175814_add_foreign_keys_to_lop_hoc_phans_table', 1);
INSERT INTO `migrations` VALUES (30, '2023_07_13_175814_add_foreign_keys_to_lop_hocs_table', 1);
INSERT INTO `migrations` VALUES (31, '2023_07_13_175814_add_foreign_keys_to_mon_hocs_table', 1);
INSERT INTO `migrations` VALUES (32, '2023_07_13_175814_add_foreign_keys_to_phongs_table', 1);
INSERT INTO `migrations` VALUES (33, '2023_07_13_175814_add_foreign_keys_to_sinh_viens_table', 1);
INSERT INTO `migrations` VALUES (34, '2023_07_16_080225_create_password_resets_table', 1);

-- ----------------------------
-- Table structure for mon_hocs
-- ----------------------------
DROP TABLE IF EXISTS `mon_hocs`;
CREATE TABLE `mon_hocs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_mon_hoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_bo_mon` int NULL DEFAULT NULL,
  `id_loai_mon_hoc` int NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_bo_mon`(`id_bo_mon` ASC) USING BTREE,
  INDEX `id_loai_mon_hoc`(`id_loai_mon_hoc` ASC) USING BTREE,
  CONSTRAINT `mon_hocs_ibfk_1` FOREIGN KEY (`id_bo_mon`) REFERENCES `bo_mons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mon_hocs_ibfk_2` FOREIGN KEY (`id_loai_mon_hoc`) REFERENCES `loai_mon_hocs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mon_hocs
-- ----------------------------
INSERT INTO `mon_hocs` VALUES (1, 'Nhập Môn Lập Trình', 1, 1, 1, NULL, NULL);
INSERT INTO `mon_hocs` VALUES (2, 'Phần Cứng Máy Tính', 1, 1, 1, NULL, NULL);
INSERT INTO `mon_hocs` VALUES (3, 'Toán Cao Cấp', 3, 1, 1, NULL, NULL);
INSERT INTO `mon_hocs` VALUES (4, 'Vật Lý Đại Cương', 3, 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tokenable_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` datetime NULL DEFAULT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for phongs
-- ----------------------------
DROP TABLE IF EXISTS `phongs`;
CREATE TABLE `phongs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_loai_phong` int NULL DEFAULT NULL,
  `ten_phong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mo_ta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `suc_chua` int NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_loai_phong`(`id_loai_phong` ASC) USING BTREE,
  CONSTRAINT `phongs_ibfk_1` FOREIGN KEY (`id_loai_phong`) REFERENCES `loai_phongs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phongs
-- ----------------------------

-- ----------------------------
-- Table structure for sinh_viens
-- ----------------------------
DROP TABLE IF EXISTS `sinh_viens`;
CREATE TABLE `sinh_viens`  (
  `ma_sv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten_sinh_vien` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `so_dien_thoai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `so_cmt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gioi_tinh` tinyint(1) NULL DEFAULT NULL,
  `ngay_sinh` date NULL DEFAULT NULL,
  `noi_sinh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dan_toc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ton_giao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dia_chi_thuong_tru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dia_chi_tam_tru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hinh_anh_dai_dien` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tai_khoan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `khoa_hoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bac_dao_tao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `he_dao_tao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_lop_hoc` int NULL DEFAULT NULL,
  `tinh_trang_hoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ma_sv`) USING BTREE,
  INDEX `id_lop_hoc`(`id_lop_hoc` ASC) USING BTREE,
  CONSTRAINT `sinh_viens_ibfk_1` FOREIGN KEY (`id_lop_hoc`) REFERENCES `lop_hocs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sinh_viens
-- ----------------------------
INSERT INTO `sinh_viens` VALUES ('0307201123', 'Sv1', '0306201123@gmail.com', '0906913419', '215587193', 1, '2002-04-04', 'TP.HCM', 'Kinh', 'Không', 'HCM', 'HCM', NULL, 'sv1', '$2y$10$IU422yVYISe./Z4NE.J6Ue8VaxShf3SZviLKUjivVOqDGIjD1PKt2', '2020', 'Đại học', 'Chính quy', 1, 'Đang học', 1, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
