/*
Navicat MySQL Data Transfer

Source Server         : 111
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : e-library

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2021-10-18 20:29:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `password` char(20) DEFAULT NULL,
  `email` char(80) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `lend_num` int(11) DEFAULT '5',
  `maxbq_num` int(11) DEFAULT '5',
  `balance` double(255,2) DEFAULT '20.00',
  PRIMARY KEY (`aid`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin1', 'admin1', 'admin1', '123456@qq.com', '15060332222', '2', '5', '5', '20.00');
INSERT INTO `admin` VALUES ('2', 'admin2', 'admin2', 'admin2', '111111@qq.com', '15228445122', '2', '5', '5', '20.00');
INSERT INTO `admin` VALUES ('3', 'admin3', 'admin3', 'admin3', '222222@qq.com', '15365452654', '2', '5', '5', '20.00');
INSERT INTO `admin` VALUES ('4', 'cool', 'leo1123', '123123', '28792311123123@qq.com', '123123', '1', '5', '5', '44.00');
INSERT INTO `admin` VALUES ('5', 'cool123', 'na', '123123', '123456', '1111', '1', '5', '5', '100.00');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(205) NOT NULL,
  `card` char(205) NOT NULL,
  `author` char(205) DEFAULT NULL,
  `press` char(205) DEFAULT NULL,
  `type` char(255) DEFAULT NULL,
  `bookPrice` float(10,2) DEFAULT NULL,
  `borrowPrice` float(10,2) DEFAULT NULL,
  `overduePrice` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('2', 'madou1', '1481631561', 'yetao1', 'taohuadao1', 'history', '20.01', '1.01', '5.00');
INSERT INTO `book` VALUES ('3', 'java1', '5545416654', 'Leee', 'java coding', '2', '23.00', '1.00', '5.00');
INSERT INTO `book` VALUES ('4', 'java2', '189562356', 'Leee', 'java coding', '2', '23.00', '1.00', '5.00');
INSERT INTO `book` VALUES ('5', 'ddsa', '234', 'dsa', 'r2sad', 'math', '2.00', '1.00', '4.00');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `booktypeid` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`booktypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', 'video learning');
INSERT INTO `booktype` VALUES ('2', 'coding');
INSERT INTO `booktype` VALUES ('3', 'math');
INSERT INTO `booktype` VALUES ('4', 'history');
INSERT INTO `booktype` VALUES ('5', 'Engilish');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `card` int(11) DEFAULT NULL,
  `bookname` char(255) DEFAULT NULL,
  `username` char(255) DEFAULT NULL,
  `begintime` char(255) DEFAULT NULL,
  `endtime` char(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `outPrice` double(10,2) DEFAULT '0.00',
  `outNum` int(11) unsigned zerofill DEFAULT '00000000000',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('5', '4', '2', '1481631561', 'madou1', 'leo', '2021-10-1', '2021-10-4', '0', '0.00', '00000000000');
INSERT INTO `history` VALUES ('6', '4', '4', '189562356', 'java2', 'leo', '2021-10-1', '2021-10-6', '0', '0.00', '00000000000');
INSERT INTO `history` VALUES ('7', '4', '2', '1481631561', 'madou1', 'leo', '2021-10-1', '2021-10-06', '0', '0.00', '00000000000');
INSERT INTO `history` VALUES ('8', '4', '5', '234', 'ddsa', 'leo', '2021-09-25', '2021-10-1', '0', '8.00', '00000000002');
INSERT INTO `history` VALUES ('9', '4', '4', '189562356', 'java2', 'leo', '2021-10-1', '2021-10-10', '0', '20.00', '00000000004');
INSERT INTO `history` VALUES ('10', '4', '2', '1481631561', 'madou1', 'leo', '2021-10-1', '2021-10-10', '0', '20.00', '00000000004');
INSERT INTO `history` VALUES ('11', '4', '5', '234', 'ddsa', 'leo', '2021-10-1', '2021-10-1', '0', '0.00', '00000000000');
INSERT INTO `history` VALUES ('12', '4', '2', '1481631561', 'madou1', 'leo', '2021-10-2', '2021-10-14', '0', '35.00', '00000000007');
INSERT INTO `history` VALUES ('13', '4', '2', '1481631561', 'madou1', 'leo', '2021-10-6', '2021-10-11', '1', '0.00', '00000000000');
INSERT INTO `history` VALUES ('14', '4', '5', '234', 'ddsa', 'leo', '2021-10-10', '2021-10-15', '1', '0.00', '00000000000');
