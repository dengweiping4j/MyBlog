/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 19/05/2019 18:00:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `pkid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `article_abstract` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文章摘要',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '文章内容',
  `title_page` varchar(4000) COLLATE utf8_bin DEFAULT NULL COMMENT '封面',
  `tag_key` varchar(4000) COLLATE utf8_bin DEFAULT NULL COMMENT '文章标签',
  `user_key` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `title` varchar(4000) COLLATE utf8_bin NOT NULL COMMENT '标题',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES ('test', '这是一条用来测试的数据', '这条数据主要用来测试，这条数据主要用来测试，这条数据主要用来测试，这条数据主要用来测试，这条数据主要用来测试，这条数据主要用来测试，这条数据主要用来测试', '1.jpg', 'test1', 'admin', '2019-01-01 12:34:56', '测试标题');
INSERT INTO `article` VALUES ('test2', '第二条测试数据', '用来测试第二条数据的内容', '2.jpg', 'test2', 'admin', '2019-05-19 17:43:38', '测试2');
COMMIT;

-- ----------------------------
-- Table structure for article_expand
-- ----------------------------
DROP TABLE IF EXISTS `article_expand`;
CREATE TABLE `article_expand` (
  `pkid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `thumb_up` int(11) DEFAULT NULL COMMENT '点赞数',
  `watch` int(11) DEFAULT NULL COMMENT '浏览数',
  `collect` int(11) DEFAULT NULL COMMENT '收藏数',
  `comment` int(11) DEFAULT NULL COMMENT '评论数',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `pkid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `article_key` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '文章ID',
  `content` text COLLATE utf8_bin COMMENT '评论内容',
  `mark_given` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '文章评分',
  `create_time` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for concern
-- ----------------------------
DROP TABLE IF EXISTS `concern`;
CREATE TABLE `concern` (
  `pkid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `user_key` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `concern_key` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '关注的人ID',
  `concern_time` date NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `pkid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `tag_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标签名称',
  `user_key` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` date NOT NULL COMMENT '创建时间',
  `tag_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '标签类型 1:系统标签 2:用户自定义标签',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `pkid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `user_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `password` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `profile_photo` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `user_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户类型 1：超级管理员 2:管理员 3：普通用户',
  `signature` varchar(4000) COLLATE utf8_bin DEFAULT NULL COMMENT '个人说明',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;
