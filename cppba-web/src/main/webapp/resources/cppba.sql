/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50710
Source Host           : 127.0.0.1:3306
Source Database       : cppba

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-06-23 11:49:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `article_class_id` bigint(20) DEFAULT NULL COMMENT '文章分类编号',
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `abstracts` text COMMENT '简介(显示在列表中)',
  `content` text COMMENT '内容',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------

-- ----------------------------
-- Table structure for article_class
-- ----------------------------
DROP TABLE IF EXISTS `article_class`;
CREATE TABLE `article_class` (
  `article_class_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `name` varchar(16) DEFAULT NULL COMMENT '分类名',
  `sort_id` int(11) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`article_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_class
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) DEFAULT '0',
  `user_name` varchar(16) DEFAULT NULL COMMENT '账号',
  `password` varchar(16) DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(16) DEFAULT NULL COMMENT '昵称',
  `remark` text COMMENT '个人简介',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2016-06-23 09:40:01', '0', 'admin', 'admin', '大黄蜂', '1234555');
