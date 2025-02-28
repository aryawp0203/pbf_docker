/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : krs_online

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 27/02/2025 13:46:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `NPM` int NOT NULL AUTO_INCREMENT,
  `nama_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alamat_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_prodi` int NOT NULL,
  PRIMARY KEY (`NPM` DESC) USING BTREE,
  INDEX `fk_prodi_mhs`(`id_prodi` ASC) USING BTREE,
  CONSTRAINT `fk_prodi_mhs` FOREIGN KEY (`id_prodi`) REFERENCES `program_studi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4015 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES (4014, 'Adimas', 'Cilacap', 908);
INSERT INTO `mahasiswa` VALUES (4013, 'Yovi Tito Budianto', 'Adipala', 902);
INSERT INTO `mahasiswa` VALUES (4012, 'Alissya Iklima', 'Cilacap', 906);
INSERT INTO `mahasiswa` VALUES (4009, 'Galan Bagus Reswara', 'Cilacap', 901);
INSERT INTO `mahasiswa` VALUES (4008, 'Azka Syams ', 'Cilacap', 903);
INSERT INTO `mahasiswa` VALUES (4006, 'Esnaeni Wulan', 'Cilacap', 902);
INSERT INTO `mahasiswa` VALUES (4005, 'Ghina Safinatun', 'Jaruk Legi', 900);
INSERT INTO `mahasiswa` VALUES (4003, 'Alfito Dwi Aditya', 'Cilacap', 904);
INSERT INTO `mahasiswa` VALUES (4002, 'Bondan Rahardinata', 'Cilacap', 900);
INSERT INTO `mahasiswa` VALUES (4001, 'Rina Nur Rohmah', 'Widara Payung', 903);
INSERT INTO `mahasiswa` VALUES (4000, 'Rizki Khomsatun  Barokah', 'Kesugihan', 901);

-- ----------------------------
-- Table structure for mata_kuliah
-- ----------------------------
DROP TABLE IF EXISTS `mata_kuliah`;
CREATE TABLE `mata_kuliah`  (
  `id_matkul` int NOT NULL AUTO_INCREMENT,
  `semester` int NOT NULL,
  `nama_matkul` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `banyak_sks` int NOT NULL,
  `banyak_jam_matkul` int NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_matkul`) USING BTREE,
  UNIQUE INDEX `unique_nama_matkul`(`nama_matkul` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3018 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mata_kuliah
-- ----------------------------
INSERT INTO `mata_kuliah` VALUES (3001, 4, 'Praktikum Pemrograman', 4, 6, NULL);
INSERT INTO `mata_kuliah` VALUES (3002, 4, 'Statistika', 2, 2, NULL);
INSERT INTO `mata_kuliah` VALUES (3003, 4, 'Metodologi Penelitian TI', 2, 2, NULL);
INSERT INTO `mata_kuliah` VALUES (3004, 4, 'Manajemen Proyek', 2, 2, NULL);
INSERT INTO `mata_kuliah` VALUES (3005, 4, 'Praktikum Basis Data Lanjut', 2, 6, NULL);
INSERT INTO `mata_kuliah` VALUES (3006, 4, 'Etika Profesi', 2, 2, NULL);
INSERT INTO `mata_kuliah` VALUES (3007, 4, 'Praktikum Manajemen Internetworking And Security', 2, 6, NULL);
INSERT INTO `mata_kuliah` VALUES (3008, 4, 'Praktikum Pemrograman Berorientasi Objek', 2, 6, NULL);
INSERT INTO `mata_kuliah` VALUES (3009, 4, 'Praktikum Pemrograman Mobile', 2, 6, NULL);
INSERT INTO `mata_kuliah` VALUES (3011, 4, 'algoritma', 2, 2, NULL);
INSERT INTO `mata_kuliah` VALUES (3015, 4, 'Alpro', 2, 2, NULL);
INSERT INTO `mata_kuliah` VALUES (3016, 3, 'Matematika Diskrit', 2, 2, NULL);
INSERT INTO `mata_kuliah` VALUES (3017, 2, 'Pemrograman Web 2', 2, 6, NULL);

-- ----------------------------
-- Table structure for pengisian_krs
-- ----------------------------
DROP TABLE IF EXISTS `pengisian_krs`;
CREATE TABLE `pengisian_krs`  (
  `id_pengisian` int NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL,
  `tahun_akademik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NPM` int NOT NULL,
  `id_matkul` int NOT NULL,
  PRIMARY KEY (`id_pengisian`) USING BTREE,
  UNIQUE INDEX `unique_npm_matkul`(`NPM` ASC, `id_matkul` ASC) USING BTREE,
  INDEX `fk_matkul_mhs`(`id_matkul` ASC) USING BTREE,
  CONSTRAINT `fk_matkul_mhs` FOREIGN KEY (`id_matkul`) REFERENCES `mata_kuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mhs_npm` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 618 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengisian_krs
-- ----------------------------
INSERT INTO `pengisian_krs` VALUES (600, '2025-02-24 20:31:39', '2024/2025', 4000, 3007);
INSERT INTO `pengisian_krs` VALUES (603, '2025-02-25 09:50:28', '2024/2025', 4003, 3003);
INSERT INTO `pengisian_krs` VALUES (604, '2025-02-25 09:57:44', '2024/2025', 4000, 3001);
INSERT INTO `pengisian_krs` VALUES (607, '2025-02-25 11:17:23', '2024/2025', 4003, 3001);
INSERT INTO `pengisian_krs` VALUES (609, '2025-02-25 12:59:28', '2024/2025', 4009, 3005);
INSERT INTO `pengisian_krs` VALUES (611, '2025-02-27 13:00:23', '2024/2025', 4008, 3009);
INSERT INTO `pengisian_krs` VALUES (612, '2025-02-27 13:01:01', '2024/2025', 4005, 3005);
INSERT INTO `pengisian_krs` VALUES (615, '2025-02-25 14:39:45', '2024/2025', 4003, 3002);
INSERT INTO `pengisian_krs` VALUES (616, '2025-02-26 14:35:02', '2023/2024', 4013, 3016);
INSERT INTO `pengisian_krs` VALUES (617, '2025-02-26 14:44:52', '2022/2023', 4014, 3017);

-- ----------------------------
-- Table structure for program_studi
-- ----------------------------
DROP TABLE IF EXISTS `program_studi`;
CREATE TABLE `program_studi`  (
  `id_prodi` int NOT NULL AUTO_INCREMENT,
  `nama_prodi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_prodi`) USING BTREE,
  UNIQUE INDEX `unique_nama_prodi`(`nama_prodi` ASC) USING BTREE,
  INDEX `nama_prodi`(`nama_prodi` ASC) USING BTREE,
  INDEX `nama_prodi_2`(`nama_prodi` ASC, `id_prodi` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 909 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of program_studi
-- ----------------------------
INSERT INTO `program_studi` VALUES (906, 'D3-Teknik Industri');
INSERT INTO `program_studi` VALUES (900, 'D3-Teknik Informatika');
INSERT INTO `program_studi` VALUES (904, 'D3-Teknik Sipil');
INSERT INTO `program_studi` VALUES (901, 'D4-Akuntansi Lembaga Keuangan Syariah');
INSERT INTO `program_studi` VALUES (902, 'D4-Rekayasa keamanan Cyber');
INSERT INTO `program_studi` VALUES (903, 'D4-Rekayasa Perangkat Lunak');
INSERT INTO `program_studi` VALUES (908, 'S1-Ilmu Komunikasi');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `npm` int NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  INDEX `fk_user_mhs`(`npm` ASC) USING BTREE,
  UNIQUE INDEX `unique_password`(`password` ASC) USING BTREE,
  CONSTRAINT `fk_user_mhs` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`NPM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (10000, 'riris', '1234', NULL, 4000);
INSERT INTO `tbl_user` VALUES (10001, 'rina', 'abcd', NULL, 4001);
INSERT INTO `tbl_user` VALUES (10002, 'ghina', '6728', NULL, 4005);
INSERT INTO `tbl_user` VALUES (10004, 'yovi', '6729', NULL, 4013);

SET FOREIGN_KEY_CHECKS = 1;
