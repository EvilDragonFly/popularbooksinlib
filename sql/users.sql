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

 Date: 06/06/2021 23:13:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `personId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Azure人脸数据库中人物id,类型为Guid',
  `name` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户名',
  `age` int UNSIGNED NULL DEFAULT NULL,
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '男 or 女',
  `art_value` int UNSIGNED NULL DEFAULT NULL COMMENT '用户翻阅艺术类书籍次数',
  `religion_value` int UNSIGNED NULL DEFAULT NULL COMMENT '用户翻阅宗教类书籍次数',
  `socialSci_value` int UNSIGNED NULL DEFAULT NULL COMMENT '用户翻阅社会科学类书籍次数',
  `Sci_value` int UNSIGNED NULL DEFAULT NULL COMMENT '用户翻阅自然科学类书籍次数',
  `literature_value` int UNSIGNED NULL DEFAULT NULL COMMENT '用户翻阅文学类书籍次数',
  `hisgeo_value` int UNSIGNED NULL DEFAULT NULL COMMENT '用户翻阅历史地理类书籍次数',
  `appliSci_value` int UNSIGNED NULL DEFAULT NULL COMMENT '用户翻阅应用科学类书籍次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (0000000001, '11f26304-6ef5-42f0-81f4-65a0fba3073d', '钱由军', 25, '男', 50, 120, 130, 120, 200, 90, 20);

SET FOREIGN_KEY_CHECKS = 1;
