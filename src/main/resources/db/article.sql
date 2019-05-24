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

 Date: 24/05/2019 18:06:26
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
INSERT INTO `article` VALUES ('1343595e-f550-49aa-84ec-d24ec0264320', NULL, '明天要去徒步啊┭┮﹏┭┮', NULL, '1', 'admin', '2019-05-24 18:00:29', NULL);
INSERT INTO `article` VALUES ('74556ac1-393c-4685-afd7-3023e3c107b7', NULL, '今天周五啦，放假了开心(*^▽^*)', NULL, '1', 'admin', '2019-05-24 18:00:14', NULL);
INSERT INTO `article` VALUES ('d0d8dd23-8d45-47be-afdf-c2ec2b5c0c14', NULL, '下班下班 走了', NULL, '1', 'admin', '2019-05-24 18:01:17', NULL);
INSERT INTO `article` VALUES ('fd73cfbb-c903-4160-aa0c-0ccf29f07909', NULL, '不想去啊！！！', NULL, '1', 'admin', '2019-05-24 18:00:40', NULL);
INSERT INTO `article` VALUES ('test', '这是一条用来测试的数据', '《擦肩而过》文/清河鱼 编绘/天朝羽打开一扇窗，我不曾把你想得平常。看季节一一过往。你停留的那个地方，是否依然花儿开放？在夜里守靠着梦中的，想那仿佛前世铭刻进心肠的', '1.jpg', '1', 'admin', '2019-05-24 12:34:56', '测试标题');
INSERT INTO `article` VALUES ('test2', '第二条测试数据', '也许，爱情没有永远，地老天荒也走不完，生命终结的末端，苦短情长。站在岁月的边端，那些美丽的定格，心伤的绝恋，都被四季的掩埋，一去不返。徒剩下这荒芜的花好月圆，一路相随，流离天涯背负了谁的思念？', '2.jpg', '2', 'admin', '2019-05-23 17:43:38', '测试2');
INSERT INTO `article` VALUES ('test3', '这是第三条测试数据', '有时就为了一句狠话，像心头一口毒钉，永远麻痺着亲密感情交流。恶言，真要慎出，平日多誠心爱语，乃最简易之佈施。', '3.jpg', '3', 'admin', '2018-03-24 14:20:41', '测试3');
INSERT INTO `article` VALUES ('test4', '这是第四条测试数据', '丁松问周华这周日你有空吗？刘千说这周日我有空！', '4.jpg', '4', 'admin', '2019-05-21 14:20:41', '测试4');
INSERT INTO `article` VALUES ('test5', '这是第5条测试数据', '专家表示早上不宜空腹吃早餐，否则你每呼吸60秒，寿命就会减少1分钟', '5.jpg', '5', 'admin', '2019-05-21 14:20:41', '测试4');
INSERT INTO `article` VALUES ('test6', '这是第6条测试数据', '有时就为了一句狠话，像心头一口毒钉，永远麻痺着亲密感情交流。恶言，真要慎出，平日多誠心爱语，乃最简易之佈施。', '6.jpg', '3', 'admin', '2019-05-21 14:20:41', '测试4');
INSERT INTO `article` VALUES ('test7', '这是第7条测试数据', '还在为浪漫的求婚词而烦恼不知道该怎么说吗？女孩子都有着浪漫的小情怀，对于求婚更是抱着满满的浪漫期待，也希望在求婚那一天对方可以给自己一个最浪漫的求婚词。', '7.jpg', '2', 'admin', '2019-05-21 14:20:41', '测试4');

SET FOREIGN_KEY_CHECKS = 1;
