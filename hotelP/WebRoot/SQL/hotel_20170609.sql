/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2017-06-09 13:33:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO t_admin VALUES ('admin', '123456', '1', '管理员');
INSERT INTO t_admin VALUES ('lxp', '123', '2', '李小朋');

-- ----------------------------
-- Table structure for `t_check`
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
-- Table structure for `t_house`
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` double(8,0) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO t_house VALUES ('1', 'A301', '520', '双人间', '/image//e11a2da9-3e40-4838-9171-9b64a083b2b3.jpg');
INSERT INTO t_house VALUES ('2', 'A101', '530', '单人间', '/image//7df1b70f-8779-461a-b074-a6e8e293d28f.jpg');
INSERT INTO t_house VALUES ('4', 'A102', '500', '单人间', '/image//4560cfe6-ced8-410f-8ffe-6c5f353d73be.jpg');
INSERT INTO t_house VALUES ('6', 'A103', '550', '双人间', '/image//bc23b779-a728-4967-a44f-46c11e222377.gif');
INSERT INTO t_house VALUES ('7', 'A104', '550', '双人间', '/image//590e3171-000a-4a9d-b19c-66b2d0f0e3b2.gif');
INSERT INTO t_house VALUES ('8', 'A105', '500', '双人间', '/image//77ad1761-fa39-4be3-a52a-ad6af1520e94.gif');
INSERT INTO t_house VALUES ('9', 'A106', '500', '单人间', '/image//c7973cda-7b6f-4728-a01d-d4d1420bfb5f.jpg');
INSERT INTO t_house VALUES ('10', 'A107', '500', '单人间', '/image//8ddc438d-1cf9-4803-8b49-067dc51bad14.jpg');
INSERT INTO t_house VALUES ('11', 'A108', '550', '单人间', '/image//bc2db6f5-7fe5-45fb-912e-4ea6c4e99b1d.jpg');
INSERT INTO t_house VALUES ('12', 'A109', '300', '双人间', '/image//92433139-8750-438c-a427-da2c93c118b3.jpg');
INSERT INTO t_house VALUES ('13', 'A201', '120', '双人间', '/image//66950ff8-77d4-44a2-878f-4bd8ec1c5123.jpg');
INSERT INTO t_house VALUES ('14', 'A202', '210', '双人间', '/image//1e1a14ec-a752-4d0e-9ee5-cb9836d67aec.gif');
INSERT INTO t_house VALUES ('15', 'A203', '111', '双人间', '/image//0f5036c9-449e-4ac6-a96e-c5860a7a0582.jpg');
INSERT INTO t_house VALUES ('16', 'A204', '222', '双人间', '/image//4033c593-43ed-435b-976b-f63e8086d9b0.jpg');
INSERT INTO t_house VALUES ('20', 'A501', '600', '双人间', '/image//833dd0da-1955-448b-a80e-c9f4e06bd2ee.gif');
INSERT INTO t_house VALUES ('22', 'A1106', '1321', '商务间', '/image//e8e1efa8-66da-4201-adb4-1a3d7633723b.jpg');
INSERT INTO t_house VALUES ('23', 'A1106', '888', '商务间', '/image//34941e64-1207-40c9-b91c-062538afc8f4.gif');
INSERT INTO t_house VALUES ('24', 'A1107', '2888', '商务间', '/image//0fc6f29b-f1a4-4532-84f5-9d4ef3b078fe.jpg');
INSERT INTO t_house VALUES ('25', 'A1106', '144', '单人间', '/image//8ca2c4a6-b65e-4e30-adb6-af1d0e4e2cd9.jpg');

-- ----------------------------
-- Table structure for `t_liuyan`
-- ----------------------------
DROP TABLE IF EXISTS `t_liuyan`;
CREATE TABLE `t_liuyan` (
  `liuyan_id` int(11) NOT NULL AUTO_INCREMENT,
  `liuyan_title` varchar(500) DEFAULT NULL,
  `liuyan_content` varchar(500) DEFAULT NULL,
  `liuyan_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`liuyan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_liuyan
-- ----------------------------
INSERT INTO t_liuyan VALUES ('1', '房间', '房间干净卫生，有热水', 'lxp');
INSERT INTO t_liuyan VALUES ('2', '价格', '价格便宜实惠', 'jxq');
INSERT INTO t_liuyan VALUES ('3', '测试啊啊啊哈哈哈', '这回肯定没有中文乱码了啊哈哈哈', '游客');
INSERT INTO t_liuyan VALUES ('4', '阿达爱我的安慰', 'would you have lost？so carry on =加薪', '游客');
INSERT INTO t_liuyan VALUES ('5', '测试', '这里是内容部分', '游客');
INSERT INTO t_liuyan VALUES ('7', '开始就付了款', '  安抚法师法师法', '游客');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `userid` int(11) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `orderCodes` varchar(32) DEFAULT NULL,
  `reserveTime` varchar(30) DEFAULT NULL,
  `createTime` varchar(30) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `totalPrice` double(10,0) DEFAULT NULL,
  `contactPerson` varchar(32) DEFAULT NULL,
  `mobilePhone` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO t_order VALUES ('9', '11', '21', '9ebf10465010', '2017-06-06', '2017-06-06 12:58:25', '1', '550', '李小朋', '18330212740');
INSERT INTO t_order VALUES ('9', '25', '22', 'eb5e650ea2c7', '2017-06-07', '2017-06-06 12:59:16', '1', '144', '李小朋', '18330212740');
INSERT INTO t_order VALUES ('12', '25', '23', '1e252836bbff', '2017-06-06', '2017-06-06 01:32:26', '0', '144', '张权', '18330212740');
INSERT INTO t_order VALUES ('12', '10', '24', 'c195fd78b2a6', '2017-06-08', '2017-06-07 01:17:45', '0', '500', '张权', '123');
INSERT INTO t_order VALUES ('9', '4', '25', 'feec7f19413a', '2017-06-08', '2017-06-08 05:10:02', '1', '500', '李小朋', '17801002476');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `nickName` varchar(30) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO t_user VALUES ('2', null, 'xyz', '312321', '15059456322', '123@qq.com');
INSERT INTO t_user VALUES ('4', null, 'joha', '13231', '15059456171', '3232@qq.com');
INSERT INTO t_user VALUES ('5', null, 'fangel123', '123123', '15059456171', '123@qq.com');
INSERT INTO t_user VALUES ('6', null, 'fangel321', '123123', '15059456172', '123@qq.com');
INSERT INTO t_user VALUES ('7', null, 'fangel123123', '123123', '15059456172', '1234@qq.com');
INSERT INTO t_user VALUES ('9', '李小朋', 'lxp', '123', '18330212740', '865591015@qq.com');
INSERT INTO t_user VALUES ('10', '张权', 'zq', '123', '123', '');
INSERT INTO t_user VALUES ('11', '李小朋', 'lixiaopeng', '123', '17801002476', '865591015@qq.com');
INSERT INTO t_user VALUES ('12', '张权', 'zhangquan', '123', '17801002476', '865591015@qq.com');
