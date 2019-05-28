/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50096
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 50096
 File Encoding         : 65001

 Date: 28/05/2019 13:33:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `article_abstract` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文章摘要',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '文章内容',
  `title_page` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '封面',
  `tag_key` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文章标签',
  `user_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `title` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('test', '这是一条用来测试的数据', '《擦肩而过》文/清河鱼 编绘/天朝羽打开一扇窗，我不曾把你想得平常。看季节一一过往。你停留的那个地方，是否依然花儿开放？在夜里守靠着梦中的，想那仿佛前世铭刻进心肠的', '1.jpg', '1', 'admin', '2019-05-26 12:34:56', '测试标题');
INSERT INTO `article` VALUES ('test2', '第二条测试数据', '也许，爱情没有永远，地老天荒也走不完，生命终结的末端，苦短情长。站在岁月的边端，那些美丽的定格，心伤的绝恋，都被四季的掩埋，一去不返。徒剩下这荒芜的花好月圆，一路相随，流离天涯背负了谁的思念？', '2.jpg', '2', 'admin', '2019-05-20 17:43:38', '测试2');
INSERT INTO `article` VALUES ('test3', '这是第三条测试数据', '有时就为了一句狠话，像心头一口毒钉，永远麻痺着亲密感情交流。恶言，真要慎出，平日多誠心爱语，乃最简易之佈施。', '3.jpg', '3', 'admin', '2018-03-24 14:20:41', '测试3');
INSERT INTO `article` VALUES ('test5', '这是第5条测试数据', '专家表示早上不宜空腹吃早餐，否则你每呼吸60秒，寿命就会减少1分钟', '5.jpg', '5', 'admin', '2019-05-21 14:20:41', '测试4');
INSERT INTO `article` VALUES ('test6', '这是第6条测试数据', '有时就为了一句狠话，像心头一口毒钉，永远麻痺着亲密感情交流。恶言，真要慎出，平日多誠心爱语，乃最简易之佈施。', '6.jpg', '3', 'admin', '2019-05-21 14:20:41', '测试4');
INSERT INTO `article` VALUES ('test7', '这是第7条测试数据', '还在为浪漫的求婚词而烦恼不知道该怎么说吗？女孩子都有着浪漫的小情怀，对于求婚更是抱着满满的浪漫期待，也希望在求婚那一天对方可以给自己一个最浪漫的求婚词。', '7.jpg', '2', 'admin', '2019-05-21 14:20:41', '测试4');

-- ----------------------------
-- Table structure for article_expand
-- ----------------------------
DROP TABLE IF EXISTS `article_expand`;
CREATE TABLE `article_expand`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `article_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文章id',
  `user_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '操作人id',
  `action` int(10) NOT NULL COMMENT '操作类型（1 点赞；2 评论；3 阅读）',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '具体内容',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for concern
-- ----------------------------
DROP TABLE IF EXISTS `concern`;
CREATE TABLE `concern`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `user_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `concern_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '关注的人ID',
  `concern_time` date NOT NULL COMMENT '关注时间',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `profile_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `user_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户类型 1：超级管理员 2:管理员 3：普通用户',
  `signature` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '个人说明',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1372e86b-3154-4a3c-b25f-5b17f7fbbb11', 'zhangsan', '张三丰', 'e10adc3949ba59abbe56e057f20f883e', 'photo.jpg', '3', NULL);
INSERT INTO `user` VALUES ('2fed1b32-c934-48c3-b19f-9ea16561b6cc', 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 'photo.jpg', '3', NULL);
INSERT INTO `user` VALUES ('5b456f1a-1ba1-49e9-9064-c41cefeacbb1', 'carrie', '柴文', 'e10adc3949ba59abbe56e057f20f883e', 'photo.jpg', '3', NULL);

SET FOREIGN_KEY_CHECKS = 1;
