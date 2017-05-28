/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50619
Source Host           : 127.0.0.1:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2017-05-20 22:25:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `adminid` int(11) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('admin', 'admin', '1');
INSERT INTO `t_admin` VALUES ('lxp', '123', '2');

-- ----------------------------
-- Table structure for t_check
-- ----------------------------
DROP TABLE IF EXISTS `t_check`;
CREATE TABLE `t_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `idCard` varchar(30) DEFAULT NULL,
  `phoneNum` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_check
-- ----------------------------

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` double(8,0) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('1', 'A301', '520', '商务间', null);
INSERT INTO `t_house` VALUES ('2', 'A101', '530', '单人间', '0');
INSERT INTO `t_house` VALUES ('4', 'A102', '500', '单人间', '0');
INSERT INTO `t_house` VALUES ('6', 'A103', '550', '双人间', '1');
INSERT INTO `t_house` VALUES ('7', 'A104', '550', '双人间', '1');
INSERT INTO `t_house` VALUES ('8', 'A105', '500', '双人间', '0');
INSERT INTO `t_house` VALUES ('9', 'A106', '500', '单人间', '0');
INSERT INTO `t_house` VALUES ('10', 'A107', '500', '单人间', '1');
INSERT INTO `t_house` VALUES ('11', 'A108', '550', '单人间', '1');
INSERT INTO `t_house` VALUES ('12', 'A109', '300', '单人间', '0');
INSERT INTO `t_house` VALUES ('13', 'A201', '120', '双人间', '0');
INSERT INTO `t_house` VALUES ('14', 'A202', '210', '双人间', '0');
INSERT INTO `t_house` VALUES ('15', 'A203', '111', '双人间', '0');
INSERT INTO `t_house` VALUES ('16', 'A204', '222', '双人间', '0');
INSERT INTO `t_house` VALUES ('19', 'A402', '521', '商务间', null);

-- ----------------------------
-- Table structure for t_liuyan
-- ----------------------------
DROP TABLE IF EXISTS `t_liuyan`;
CREATE TABLE `t_liuyan` (
  `liuyan_id` int(11) NOT NULL,
  `liuyan_title` varchar(500) DEFAULT NULL,
  `liuyan_content` varchar(500) DEFAULT NULL,
  `liuyan_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`liuyan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_liuyan
-- ----------------------------
INSERT INTO `t_liuyan` VALUES ('1', '房间', '房间干净卫生，有热水', 'lxp');
INSERT INTO `t_liuyan` VALUES ('2', '价格', '价格便宜实惠', 'jxq');
INSERT INTO `t_liuyan` VALUES ('3', '测试啊啊啊哈哈哈', '这回肯定没有中文乱码了啊哈哈哈', '游客');
INSERT INTO `t_liuyan` VALUES ('4', '阿达爱我的安慰', 'would you have lost？so carry on =加薪', '游客');
INSERT INTO `t_liuyan` VALUES ('5', '测试', '这里是内容部分', '游客');
INSERT INTO `t_liuyan` VALUES ('7', '开始就付了款', '  安抚法师法师法', '游客');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `userid` int(11) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `reserveTime` varchar(30) DEFAULT NULL,
  `createTime` varchar(30) DEFAULT NULL,
  `orderStatus` varchar(11) DEFAULT '',
  `totalPrice` double(10,0) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('2', '13', '1', '2017-05-20', '2017-05-20', '1', null);
INSERT INTO `t_order` VALUES ('1', '7', '9', '2017-05-20', '2017-05-20', '1', null);
INSERT INTO `t_order` VALUES ('1', '6', '12', null, null, null, null);
INSERT INTO `t_order` VALUES ('6', '11', '13', null, null, null, null);
INSERT INTO `t_order` VALUES ('1', '10', '14', null, null, null, null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', 'xyz', '312321', '15059456322', '123@qq.com');
INSERT INTO `t_user` VALUES ('4', 'joha', '13231', '15059456171', '3232@qq.com');
INSERT INTO `t_user` VALUES ('5', 'fangel123', '123123', '15059456171', '123@qq.com');
INSERT INTO `t_user` VALUES ('6', 'fangel321', '123123', '15059456172', '123@qq.com');
INSERT INTO `t_user` VALUES ('7', 'fangel123123', '123123', '15059456172', '1234@qq.com');
INSERT INTO `t_user` VALUES ('9', 'lxp', '123', '18330212740', '865591015@qq.com');
INSERT INTO `t_user` VALUES ('10', 'zq', '123', '123', '');
