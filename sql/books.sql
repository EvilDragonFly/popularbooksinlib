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

 Date: 06/06/2021 23:13:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书名',
  `price` int NULL DEFAULT 10 COMMENT '价格名',
  `author` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `PublDate` datetime NULL DEFAULT NULL COMMENT '出版日期',
  `bookcode` int NULL DEFAULT NULL COMMENT '书籍类别标识',
  `descr` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书本详细介绍信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '简爱', 10, '夏洛蒂·勃朗特', NULL, 4, '讲述一位从小变成孤儿的英国女子在各种磨难中不断追求自由与尊严，坚持自我，最终获得幸福的故事');
INSERT INTO `books` VALUES (2, '战争与和平', 10, '列夫·托尔斯泰', NULL, 4, '该作以1812年的卫国战争为中心，反映从1805到1820年间的重大历史事件。以鲍尔康斯、别祖霍夫、罗斯托夫和库拉金四大贵族的经历为主线，在战争与和平的交替描写中把众多的事件和人物串联起来');

SET FOREIGN_KEY_CHECKS = 1;
