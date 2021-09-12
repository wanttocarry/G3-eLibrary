/*
Navicat MySQL Data Transfer

Source Server         : 111
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : e-library

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2021-09-12 18:54:27
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin1', 'admin1', 'admin1', '123456@qq.com', '15060332222', '2', '5', '5', '20.00');
INSERT INTO `admin` VALUES ('2', 'admin2', 'admin2', 'admin2', '111111@qq.com', '15228445122', '2', '5', '5', '20.00');
INSERT INTO `admin` VALUES ('3', 'admin3', 'admin3', 'admin3', '222222@qq.com', '15365452654', '2', '5', '5', '20.00');
INSERT INTO `admin` VALUES ('4', 'cool', 'leo', 'leo111', '2879231@qq.com', '25461123115', '1', '5', '5', '20.00');

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
  `state` int(11) DEFAULT '1',
  `overduePrice` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('2', 'madou', '148163156', 'yetao', 'taohuadao', '1', '20.00', '1.00', '1', '5.00');
INSERT INTO `book` VALUES ('3', 'java1', '5545416654', 'Leee', 'java coding', '2', '23.00', '1.00', '1', '5.00');
INSERT INTO `book` VALUES ('4', 'java2', '189562356', 'Leee', 'java coding', '2', '23.00', '1.00', '1', '5.00');

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
  `adminname` char(255) DEFAULT NULL,
  `username` char(255) DEFAULT NULL,
  `begintime` char(255) DEFAULT NULL,
  `endtime` char(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `outPrice` double(10,2) DEFAULT '0.00',
  `outNum` int(11) unsigned zerofill DEFAULT '00000000000',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
