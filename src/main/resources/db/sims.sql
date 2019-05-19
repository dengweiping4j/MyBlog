/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50096
 Source Host           : localhost:3306
 Source Schema         : ssam

 Target Server Type    : MySQL
 Target Server Version : 50096
 File Encoding         : 65001

 Date: 17/05/2019 14:32:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '班级名称',
  `major_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所属专业，关联专业表主键',
  `department_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所属学院，关联学院表主键',
  `class_tutor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '班主任ID',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('085053f0-488c-4bb4-9ac2-20656ae3f50e', '数学1班', '9501ba10-bb3e-4f32-a2fc-4cc39cce3323', '73ab3756-5d9d-4528-809e-14e2834dfe62', '6818b0a4-6807-4f61-b6f7-92d37eadcebd');
INSERT INTO `class` VALUES ('1452cedc-b44b-4e13-9e4f-f8f9bde444b0', '广播电视1班', 'e0480485-e5cd-459f-b58b-e12ef1bae653', '9f00a06b-38e6-4ec4-ad0e-0c4f9d2b7ca5', NULL);
INSERT INTO `class` VALUES ('561a7a6d-b4d3-4505-8a93-ef1995ec9f29', '汉语言1班', '8b1b84e0-cab3-4b8b-a7a9-8c5b453f10f7', '9f00a06b-38e6-4ec4-ad0e-0c4f9d2b7ca5', 'a0273ba3-39b5-456a-b6f4-72151b92a77f');
INSERT INTO `class` VALUES ('59ea11c0-88ce-4064-bc62-29aa21307ff1', '信息1班', 'cd3528cb-ec8b-49e1-be05-b1e859dcb3d1', '73ab3756-5d9d-4528-809e-14e2834dfe62', NULL);
INSERT INTO `class` VALUES ('5be4ab9f-b836-481d-8f1b-e1c65ee0d663', '信息2班', 'cd3528cb-ec8b-49e1-be05-b1e859dcb3d1', '73ab3756-5d9d-4528-809e-14e2834dfe62', NULL);
INSERT INTO `class` VALUES ('817fbd26-00cd-40a7-9ea9-01fe7dbd105d', '食品1班', '6f01eb71-7e64-4447-8693-46a0ef431c67', '8a37077f-ed0b-4bf6-ac09-9ebcd27e1a85', NULL);
INSERT INTO `class` VALUES ('8e53709c-7f10-4f13-be23-1ede3daff61e', '物理1班', '796add5b-df7e-4370-8784-3896311ebc96', '73ab3756-5d9d-4528-809e-14e2834dfe62', NULL);
INSERT INTO `class` VALUES ('a0801fb6-88c5-4bfc-9aaf-c73672080211', '计算机2班', '5beae438-4019-4096-8c03-2a41cbbea231', '72c59e68-e1e7-4745-b296-cb173a1788de', NULL);
INSERT INTO `class` VALUES ('a99b523a-fc10-45b1-957e-c3059533d342', '计算机1班', '5beae438-4019-4096-8c03-2a41cbbea231', '72c59e68-e1e7-4745-b296-cb173a1788de', NULL);
INSERT INTO `class` VALUES ('c8dcbfc1-4418-44cc-896d-47b7d6332d29', '机电1班', '856c89da-9a73-44a0-af78-773067e6b28a', '72c59e68-e1e7-4745-b296-cb173a1788de', NULL);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程名称',
  `class_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程对应的班级',
  `teacher_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '课程对应的老师',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('fe0c38dd-3301-4225-82d8-e081655d1f9c', '大学生生理卫生与健康', 'a0801fb6-88c5-4bfc-9aaf-c73672080211', '6818b0a4-6807-4f61-b6f7-92d37eadcebd');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学院名称',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('72c59e68-e1e7-4745-b296-cb173a1788de', '计算机学院');
INSERT INTO `department` VALUES ('73ab3756-5d9d-4528-809e-14e2834dfe62', '理学院');
INSERT INTO `department` VALUES ('8a37077f-ed0b-4bf6-ac09-9ebcd27e1a85', '生物科学与技术学院');
INSERT INTO `department` VALUES ('9f00a06b-38e6-4ec4-ad0e-0c4f9d2b7ca5', '文学与传媒学院');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `major_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '专业名称',
  `department_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '所属学院，关联学院表主键',
  PRIMARY KEY USING BTREE (`pkid`),
  INDEX `major-department` USING BTREE(`department_key`),
  CONSTRAINT `major-department` FOREIGN KEY (`department_key`) REFERENCES `department` (`pkid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB; (`department_key`) REFER `ssam/department`(`pkid`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('5beae438-4019-4096-8c03-2a41cbbea231', '计算机科学与技术', '72c59e68-e1e7-4745-b296-cb173a1788de');
INSERT INTO `major` VALUES ('6f01eb71-7e64-4447-8693-46a0ef431c67', '食品专业', '8a37077f-ed0b-4bf6-ac09-9ebcd27e1a85');
INSERT INTO `major` VALUES ('796add5b-df7e-4370-8784-3896311ebc96', '物理学', '73ab3756-5d9d-4528-809e-14e2834dfe62');
INSERT INTO `major` VALUES ('856c89da-9a73-44a0-af78-773067e6b28a', '电子机械工程', '72c59e68-e1e7-4745-b296-cb173a1788de');
INSERT INTO `major` VALUES ('8b1b84e0-cab3-4b8b-a7a9-8c5b453f10f7', '汉语言文学', '9f00a06b-38e6-4ec4-ad0e-0c4f9d2b7ca5');
INSERT INTO `major` VALUES ('9501ba10-bb3e-4f32-a2fc-4cc39cce3323', '数学与应用数学', '73ab3756-5d9d-4528-809e-14e2834dfe62');
INSERT INTO `major` VALUES ('cd3528cb-ec8b-49e1-be05-b1e859dcb3d1', '信息与计算科学', '73ab3756-5d9d-4528-809e-14e2834dfe62');
INSERT INTO `major` VALUES ('d7ca39e8-82eb-4807-9597-69ba1a3ba3a8', '统计学', '73ab3756-5d9d-4528-809e-14e2834dfe62');
INSERT INTO `major` VALUES ('e0480485-e5cd-459f-b58b-e12ef1bae653', '广播电视编导', '9f00a06b-38e6-4ec4-ad0e-0c4f9d2b7ca5');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `student_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学生主键',
  `course_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程主键',
  `exam_score` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '考试成绩',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('ac8f675b-3185-48a1-99ba-bce9015f15a5', '2996b841-34c0-48b0-a61e-fe00a6187612', 'fe0c38dd-3301-4225-82d8-e081655d1f9c', '100');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `xh` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学生学号',
  `xm` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学生姓名',
  `year` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '入学年份',
  `class_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '班级',
  `major_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '专业',
  `department_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学院',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2996b841-34c0-48b0-a61e-fe00a6187612', '021446666', '伍浪', '2019', 'a0801fb6-88c5-4bfc-9aaf-c73672080211', '5beae438-4019-4096-8c03-2a41cbbea231', '72c59e68-e1e7-4745-b296-cb173a1788de', '');
INSERT INTO `student` VALUES ('6777596e-1ceb-4171-9991-24d94b624c30', '20180102', '赵三顺', '2018', '085053f0-488c-4bb4-9ac2-20656ae3f50e', '9501ba10-bb3e-4f32-a2fc-4cc39cce3323', '73ab3756-5d9d-4528-809e-14e2834dfe62', '');
INSERT INTO `student` VALUES ('79b54f3c-cf35-444d-b85c-60bee390e368', '20190101', '王建国', '2019', 'c8dcbfc1-4418-44cc-896d-47b7d6332d29', '856c89da-9a73-44a0-af78-773067e6b28a', '72c59e68-e1e7-4745-b296-cb173a1788de', '13212344321');
INSERT INTO `student` VALUES ('87754def-c957-4bc6-85a7-b05a9a212879', '20180103', '陈磊', '2018', '1452cedc-b44b-4e13-9e4f-f8f9bde444b0', 'e0480485-e5cd-459f-b58b-e12ef1bae653', '9f00a06b-38e6-4ec4-ad0e-0c4f9d2b7ca5', '15912336544');
INSERT INTO `student` VALUES ('94712e57-86c6-4c6a-a948-56f236741fa6', '20180101', '李铁军', '2018', '1452cedc-b44b-4e13-9e4f-f8f9bde444b0', 'e0480485-e5cd-459f-b58b-e12ef1bae653', '9f00a06b-38e6-4ec4-ad0e-0c4f9d2b7ca5', '18366668888');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `teacher_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教师姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `birthday` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '出生年月',
  `person_id` mediumtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '身份证号码',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `teacher_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教工号',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('6818b0a4-6807-4f61-b6f7-92d37eadcebd', '李则天', '1', '1984-03-01', '123456198403011234', '13344445555', '2018314');
INSERT INTO `teacher` VALUES ('a0273ba3-39b5-456a-b6f4-72151b92a77f', '张天师', '1', '2019-05-16', '123456789', '830083', '2019991');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `pkid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '照片',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY USING BTREE (`pkid`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 10240 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('518f68ba-5b88-4bbd-bf1e-88032dc2df59', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', NULL, '15502791235');
INSERT INTO `user` VALUES ('98337c0f-770b-422f-b969-b9f0f2333557', 'zhangsan', '张三', 'e10adc3949ba59abbe56e057f20f883e', NULL, '');

-- ----------------------------
-- View structure for v_class
-- ----------------------------
DROP VIEW IF EXISTS `v_class`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_class` AS SELECT
	`t`.`pkid` AS `pkid`,
	`t`.`class_name` AS `className`,
	`t1`.`pkid` AS `departmentKey`,
	`t1`.`department_name` AS `departmentName`,
	`t2`.`pkid` AS `majorKey`,
	`t2`.`major_name` AS `majorName`,
	`t3`.`teacher_name` AS `classTutorName` ,
	`t`.`class_tutor` AS `classTutor` 
FROM
	(
		(
			`class` `t` LEFT JOIN `department` `t1` ON ( ( `t`.`department_key` = `t1`.`pkid` ) ) 
		)
		LEFT JOIN `major` `t2` ON ( ( `t`.`major_key` = `t2`.`pkid` ) ) 
		LEFT JOIN `teacher` `t3` ON ( ( `t`.`class_tutor` = `t3`.`pkid` ) ) 
	) ;

-- ----------------------------
-- View structure for v_course
-- ----------------------------
DROP VIEW IF EXISTS `v_course`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_course` AS SELECT t.pkid,t.course_name as courseName,t1.pkid as classKey,t1.majorKey,t1.departmentKey,t1.className,t1.majorName,t1.departmentName,t2.pkid as teacherKey,t2.teacher_name as teacherName
FROM `course` t
left join v_class t1
on t.class_key=t1.pkid
left join teacher t2
on t.teacher_key=t2.pkid ;

-- ----------------------------
-- View structure for v_major
-- ----------------------------
DROP VIEW IF EXISTS `v_major`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_major` AS select `t`.`pkid` AS `pkid`,`t`.`major_name` AS `majorName`,`t1`.`pkid` AS `departmentKey`,`t1`.`department_name` AS `departmentName` from (`major` `t` left join `department` `t1` on((`t`.`department_key` = `t1`.`pkid`))) ;

-- ----------------------------
-- View structure for v_score
-- ----------------------------
DROP VIEW IF EXISTS `v_score`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_score` AS SELECT
	t.pkid,
	t.student_key AS studentKey,
	t.course_key AS courseKey,
	t.exam_score as examScore,
	t2.course_name as courseName,
	t1.xm AS studentName,
	t1.departmentKey,
	t1.majorKey,
	t1.classKey ,
	t1.departmentName,
	t1.majorName,
	t1.className 
FROM
	score t
	LEFT JOIN v_student t1 ON t.student_key = t1.pkid
	left join course t2 on t.course_key=t2.pkid ;

-- ----------------------------
-- View structure for v_student
-- ----------------------------
DROP VIEW IF EXISTS `v_student`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_student` AS SELECT
	`t`.`pkid` AS `pkid`,
	`t`.`xh` AS `xh`,
	`t`.`xm` AS `xm`,
	`t`.`year` AS `year`,
	`t`.`class_key` AS `classKey`,
	`t`.`major_key` AS `majorKey`,
	`t`.`department_key` AS `departmentKey`,
	`t`.`phone` AS `phone`,
	`t1`.`class_name` AS `className`,
	`t2`.`major_name` AS `majorName`,
	`t3`.`department_name` AS `departmentName` 
FROM
	(
	(
	( `student` `t` LEFT JOIN `class` `t1` ON ( ( `t`.`class_key` = `t1`.`pkid` ) ) )
	LEFT JOIN `major` `t2` ON ( ( `t`.`major_key` = `t2`.`pkid` ) ) 
	)
	LEFT JOIN `department` `t3` ON ( ( `t`.`department_key` = `t3`.`pkid` ) ) 
	) ;

-- ----------------------------
-- View structure for v_teacher
-- ----------------------------
DROP VIEW IF EXISTS `v_teacher`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_teacher` AS select `t`.`pkid` AS `pkid`,`t`.`teacher_name` AS `teacherName`,`t`.`teacher_key` AS `teacherKey`,`t`.`sex` AS `sex`,(case when (`t`.`sex` = '1') then '男' when (`t`.`sex` = '2') then '女' end) AS `sexmc`,`t`.`birthday` AS `birthday`,`t`.`person_id` AS `personId`,`t`.`phone` AS `phone` from `teacher` `t` ;

SET FOREIGN_KEY_CHECKS = 1;
