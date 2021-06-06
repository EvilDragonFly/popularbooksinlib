/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : kinectrfid

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 06/06/2021 23:13:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype`  (
  `id` int NOT NULL COMMENT '主键',
  `bookcode` int NOT NULL COMMENT '书本类型编码',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书本类型描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `书本类型`(`bookcode`) USING BTREE COMMENT '书本类型不能重复'
) ENGINE = InnoDB CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES (0, 0, '艺术');
INSERT INTO `booktype` VALUES (1, 1, '宗教');
INSERT INTO `booktype` VALUES (2, 2, '社会科学');
INSERT INTO `booktype` VALUES (3, 3, '自然科学');
INSERT INTO `booktype` VALUES (4, 4, '文学');
INSERT INTO `booktype` VALUES (5, 5, '历史地理');
INSERT INTO `booktype` VALUES (6, 6, ' 应用科学');

SET FOREIGN_KEY_CHECKS = 1;
