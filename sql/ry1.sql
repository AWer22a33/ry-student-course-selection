/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : ry1

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 23/07/2024 16:33:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `c_id` bigint NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `c_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `major_id` bigint NULL DEFAULT NULL COMMENT '专业号',
  `term_id` int NULL DEFAULT NULL COMMENT '学期编号',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (10, '高等数学', 3, 5, '若依', '2024-07-11 15:05:43', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `course` VALUES (11, '计算机网络', 3, 5, '若依', '2024-07-11 15:05:57', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `course` VALUES (12, '焊接', 4, 5, '若依', '2024-07-11 15:06:35', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `course` VALUES (13, 'java', 5, 5, '若依', '2024-07-11 15:06:54', '若依', '2024-07-15 19:48:07', NULL, NULL, b'0');
INSERT INTO `course` VALUES (14, 'javaEE', 6, 6, '若依', '2024-07-18 15:26:52', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `course` VALUES (15, '英语', 7, 6, '若依', '2024-07-18 15:27:20', NULL, NULL, NULL, NULL, b'0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int NULL DEFAULT 1 COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'course', '课程信息', NULL, NULL, 'Course', 'crud', 'com.ruoyi.system', 'system', 'course', '课程信息', 'ruoyi', 0, '0', '/', NULL, 'admin', '2024-07-09 20:57:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'major', '专业信息', NULL, NULL, 'Major', 'crud', 'com.ruoyi.system', 'system', 'major', '专业信息', 'ruoyi', 0, '0', '/', NULL, 'admin', '2024-07-09 20:57:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'rc', '教室课程信息', NULL, NULL, 'Rc', 'crud', 'com.ruoyi.system', 'system', 'rc', '教室课程信息', 'ruoyi', 0, '0', '/', NULL, 'admin', '2024-07-09 20:57:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'room', '教室信息', NULL, NULL, 'Room', 'crud', 'com.ruoyi.system', 'system', 'room', '教室信息', 'ruoyi', 0, '0', '/', NULL, 'admin', '2024-07-09 20:57:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'sc', '学生课程信息', NULL, NULL, 'Sc', 'crud', 'com.ruoyi.system', 'system', 'sc', '学生课程信息', 'ruoyi', 0, '0', '/', NULL, 'admin', '2024-07-09 20:57:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'student', '学生信息', NULL, NULL, 'Student', 'crud', 'com.ruoyi.system', 'system', 'student', '学生信息', 'ruoyi', 0, '0', '/', NULL, 'admin', '2024-07-09 20:57:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'tc', '教师课程信息', NULL, NULL, 'Tc', 'crud', 'com.ruoyi.system', 'system', 'tc', '教师课程信息', 'ruoyi', 0, '0', '/', NULL, 'admin', '2024-07-09 20:57:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'teacher', '教师信息', NULL, NULL, 'Teacher', 'crud', 'com.ruoyi.system', 'system', 'teacher', '教师信息', 'ruoyi', 0, '0', '/', NULL, 'admin', '2024-07-09 20:57:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'term', '学期信息', NULL, NULL, 'Term', 'crud', 'com.ruoyi.system', 'system', 'term', '学期信息', 'ruoyi', 0, '0', '/', NULL, 'admin', '2024-07-10 09:47:10', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'c_id', '课程编号', 'bigint', 'Long', 'cId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (2, 1, 'c_name', '课程名称', 'varchar(50)', 'String', 'cName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (5, 1, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (6, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (7, 1, 'update_by', '修改人', 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (8, 1, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (9, 1, 'delete_by', '删除人', 'varchar(20)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (10, 1, 'delete_time', '删除时间', 'datetime', 'Date', 'deleteTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (11, 1, 'del_flag', '删除标记', 'bit(1)', 'Integer', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (12, 2, 'major_id', '专业号', 'bigint', 'Long', 'majorId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, 2, 'major_name', '专业名称', 'varchar(100)', 'String', 'majorName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, 2, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, 2, 'update_by', '修改人', 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, 2, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, 2, 'delete_by', '删除人', 'varchar(20)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, 2, 'delete_time', '删除时间', 'datetime', 'Date', 'deleteTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, 2, 'del_flag', '删除标记', 'bit(1)', 'Integer', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, 3, 'rc_id', '教室课程编号', 'bigint', 'Long', 'rcId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (22, 3, 'r_id', '教室号', 'bigint', 'Long', 'rId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (23, 3, 'c_id', '课程编号', 'bigint', 'Long', 'cId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (25, 3, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (26, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (27, 3, 'update_by', '修改人', 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (28, 3, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (29, 3, 'delete_by', '删除人', 'varchar(20)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (30, 3, 'delete_time', '删除时间', 'datetime', 'Date', 'deleteTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (31, 3, 'del_flag', '删除标记', 'bit(1)', 'Integer', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-07-09 20:57:01', NULL, '2024-07-18 09:17:08');
INSERT INTO `gen_table_column` VALUES (32, 4, 'r_id', '教室号', 'bigint', 'Long', 'rId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, 4, 'r_name', '教室名称', 'varchar(20)', 'String', 'rName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, 4, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, 4, 'update_by', '修改人', 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 4, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 4, 'delete_by', '删除人', 'varchar(20)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 4, 'delete_time', '删除时间', 'datetime', 'Date', 'deleteTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 4, 'del_flag', '删除标记', 'bit(1)', 'Integer', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 5, 'sc_id', '学生课程编号', 'bigint', 'Long', 'scId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 5, 'stu_id', '学号', 'bigint', 'Long', 'stuId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 5, 'c_id', '课程编号', 'bigint', 'Long', 'cId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, 5, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, 5, 'update_by', '修改人', 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, 5, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, 5, 'delete_by', '删除人', 'varchar(20)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, 5, 'delete_time', '删除时间', 'datetime', 'Date', 'deleteTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, 5, 'del_flag', '删除标记', 'bit(1)', 'Integer', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, 6, 'stu_id', '学号', 'bigint', 'Long', 'stuId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, 6, 'stu_name', '学生姓名', 'varchar(20)', 'String', 'stuName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, 6, 'stu_age', '年龄', 'int', 'Long', 'stuAge', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, 6, 'stu_sex', '性别', 'bit(1)', 'Integer', 'stuSex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, 6, 'stu_birthday', '出生日期', 'date', 'Date', 'stuBirthday', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, 6, 'introducition', '介绍', 'varchar(1000)', 'String', 'introducition', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, 6, 'hobby', '爱好', 'varchar(100)', 'String', 'hobby', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, 6, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, 6, 'update_by', '修改人', 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, 6, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, 6, 'delete_by', '删除人', 'varchar(20)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, 6, 'delete_time', '删除时间', 'datetime', 'Date', 'deleteTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, 6, 'del_flag', '删除标记', 'bit(1)', 'Integer', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, 7, 'tc_id', '教师课程编号', 'bigint', 'Long', 'tcId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, 7, 't_id', '教师编号', 'bigint', 'Long', 'tId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, 7, 'c_id', '课程编号', 'bigint', 'Long', 'cId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 7, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 7, 'update_by', '修改人', 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 7, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 7, 'delete_by', '删除人', 'varchar(20)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 7, 'delete_time', '删除时间', 'datetime', 'Date', 'deleteTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 7, 'del_flag', '删除标记', 'bit(1)', 'Integer', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, 8, 't_id', '教师编号', 'bigint', 'Long', 'tId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, 8, 't_name', '教师名字', 'varchar(20)', 'String', 'tName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, 8, 't_age', '年龄', 'int', 'Long', 'tAge', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, 8, 't_sex', '性别', 'bit(1)', 'Integer', 'tSex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, 8, 'hire_date', '入职时间', 'date', 'Date', 'hireDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, 8, 't_title', '教师职称', 'varchar(100)', 'String', 'tTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, 8, 'work_experience', '工作经历', 'varchar(1000)', 'String', 'workExperience', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, 8, 'party', '党员', 'bit(1)', 'Integer', 'party', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, 8, 'speciality', '特长', 'varchar(100)', 'String', 'speciality', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, 8, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, 8, 'update_by', '修改人', 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, 8, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, 8, 'delete_by', '删除人', 'varchar(20)', 'String', 'deleteBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, 8, 'delete_time', '删除时间', 'datetime', 'Date', 'deleteTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, 8, 'del_flag', '删除标记', 'bit(1)', 'Integer', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2024-07-09 20:57:01', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, 9, 'term_id', '学期编号', 'int', 'Long', 'termId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-10 09:47:10', NULL, '2024-07-11 09:20:44');
INSERT INTO `gen_table_column` VALUES (94, 1, 'term_id', '学期编号', 'int', 'Long', 'termId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2024-07-10 10:46:07', NULL, '2024-07-10 11:01:28');
INSERT INTO `gen_table_column` VALUES (95, 1, 'major_id', '专业号', 'bigint', 'Long', 'majorId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2024-07-10 11:01:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, 9, 'term_name', '学期', 'varchar(200)', 'String', 'termName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, '', '2024-07-11 09:20:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, 3, 'weekday', '星期', 'varbinary(20)', 'String', 'weekday', '0', '0', NULL, '1', '1', '1', '1', 'EQ', NULL, '', 4, '', '2024-07-18 09:17:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, 3, 'lesson_number', '上课节次', 'varchar(20)', 'String', 'lessonNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2024-07-18 09:17:08', '', NULL);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_id` bigint NOT NULL AUTO_INCREMENT COMMENT '专业号',
  `major_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业名称',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`major_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '专业信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (3, '计算机科学与技术', '若依', '2024-07-11 11:38:13', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `major` VALUES (4, '土木工程', '若依', '2024-07-11 11:38:18', NULL, '2024-07-18 11:14:32', '若依', '2024-07-18 11:14:32', b'1');
INSERT INTO `major` VALUES (5, '软件工程', '若依', '2024-07-11 11:38:37', NULL, '2024-07-15 19:37:41', '若依', '2024-07-15 19:37:41', b'1');
INSERT INTO `major` VALUES (6, '软件工程', '若依', '2024-07-18 15:25:57', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `major` VALUES (7, '土木工程', '若依', '2024-07-18 15:26:01', NULL, NULL, NULL, NULL, b'0');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for rc
-- ----------------------------
DROP TABLE IF EXISTS `rc`;
CREATE TABLE `rc`  (
  `rc_id` bigint NOT NULL AUTO_INCREMENT COMMENT '教室课程编号',
  `r_id` bigint NULL DEFAULT NULL COMMENT '教室号',
  `c_id` bigint NULL DEFAULT NULL COMMENT '课程编号',
  `weekday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '星期',
  `lesson_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课节次',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`rc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教室课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc
-- ----------------------------
INSERT INTO `rc` VALUES (1, 2, 10, '星期一', '1,4', '若依', '2024-07-18 10:54:33', '若依', '2024-07-22 19:10:24', NULL, NULL, b'0');
INSERT INTO `rc` VALUES (19, 2, 11, '星期一', '2,3', '若依', '2024-07-22 19:04:13', '若依', '2024-07-22 19:08:51', NULL, NULL, b'0');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `r_id` bigint NOT NULL AUTO_INCREMENT COMMENT '教室号',
  `r_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教室名称',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教室信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (2, 'A', '若依', '2024-07-11 11:38:50', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `room` VALUES (3, 'B', '若依', '2024-07-11 11:38:55', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `room` VALUES (4, 'C', '若依', '2024-07-11 11:39:00', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `room` VALUES (5, 'D', '若依', '2024-07-11 11:39:04', NULL, NULL, NULL, NULL, b'0');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `sc_id` bigint NOT NULL AUTO_INCREMENT COMMENT '学生课程编号',
  `stu_id` bigint NULL DEFAULT NULL COMMENT '学号',
  `c_id` bigint NULL DEFAULT NULL COMMENT '课程编号',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`sc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (2, 3, 10, '若依', '2024-07-11 15:08:10', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sc` VALUES (3, 4, 10, '若依', '2024-07-11 15:08:17', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sc` VALUES (4, 4, 11, '若依', '2024-07-11 15:08:26', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sc` VALUES (5, 5, 14, '若依', '2024-07-11 15:08:32', '若依', '2024-07-18 15:27:33', NULL, NULL, b'0');
INSERT INTO `sc` VALUES (6, 3, 15, '若依', '2024-07-11 15:08:36', '若依', '2024-07-18 15:27:37', NULL, NULL, b'0');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '学号',
  `stu_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `stu_age` int NULL DEFAULT NULL COMMENT '年龄',
  `stu_sex` bit(1) NULL DEFAULT NULL COMMENT '性别',
  `stu_birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `introducition` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '介绍',
  `hobby` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '爱好',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (3, '周彤', 20, b'1', '2009-02-03', '自我介绍', '1', '若依', '2024-07-11 11:39:53', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `student` VALUES (4, '小亮', 20, b'1', '2003-04-02', '介绍', '2', '若依', '2024-07-11 11:40:33', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `student` VALUES (5, '张三', 22, b'0', '2002-06-13', '介绍', '1,2,3', '若依', '2024-07-11 15:02:34', NULL, NULL, NULL, NULL, b'0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-07-09 16:50:05', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-07-09 16:50:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 292 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 16:52:49');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 16:53:31');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 20:55:13');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:06:03');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:26:26');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:36:58');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:42:11');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-09 21:44:52');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:44:57');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 21:53:54');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-10 09:23:38');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 09:23:40');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 09:26:30');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 09:28:41');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 09:46:48');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 10:32:46');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 10:45:01');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-10 10:57:08');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 10:57:10');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 11:01:13');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 11:05:59');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-10 11:15:38');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 11:15:41');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 11:24:21');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 11:26:33');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 11:28:21');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 11:34:46');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 11:35:59');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 11:39:42');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 14:26:59');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 14:30:29');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 14:35:11');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 14:39:45');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 14:41:49');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 14:49:01');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 14:58:21');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 15:39:26');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 16:02:55');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-10 16:18:57');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 16:19:00');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 18:53:30');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 19:02:23');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 19:10:10');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 19:13:24');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 19:26:24');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 19:32:45');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 19:38:32');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 19:43:39');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 19:45:35');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-10 19:50:20');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 19:50:23');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 20:02:44');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 20:27:55');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 20:41:28');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 20:42:15');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 20:44:36');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 20:58:04');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:01:41');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:06:58');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:09:58');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:10:53');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:17:53');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:29:27');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:30:47');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:31:56');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:34:05');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:35:04');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:44:57');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:46:09');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-10 21:50:21');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 09:20:35');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 09:26:47');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 09:28:02');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 09:31:07');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 09:32:28');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 10:38:00');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-11 10:43:14');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 10:43:19');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 10:44:34');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 10:50:31');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-11 10:59:41');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 10:59:45');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-11 11:05:17');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 11:05:22');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 11:13:59');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-11 11:17:58');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 11:18:00');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-11 11:26:02');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 11:26:05');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 11:29:38');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 11:34:01');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 11:37:57');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 15:01:19');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 21:30:26');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-12 17:18:56');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-12 17:19:57');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-12 19:13:03');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 09:06:23');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:22:52');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-15 19:26:01');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:26:03');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:27:50');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:33:08');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:36:55');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:44:48');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:46:45');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:48:04');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:53:27');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:56:16');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 20:07:56');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 20:11:50');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 20:13:59');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 20:17:17');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 20:21:16');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 20:25:22');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 20:30:46');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 20:58:44');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 09:16:40');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 09:42:58');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 10:25:09');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 10:54:24');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 10:56:47');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 11:05:02');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 11:13:42');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 15:07:34');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-18 15:17:01');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 15:17:04');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 15:23:38');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 17:32:05');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:19:53');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:31:39');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:33:52');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:38:31');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:44:27');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-18 19:47:04');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:47:06');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-18 19:48:23');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-18 19:48:26');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:48:29');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:50:16');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-18 19:51:24');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:51:26');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:52:29');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-18 19:54:07');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:54:09');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 19:56:47');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 20:01:16');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 20:04:48');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 20:06:56');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 10:58:24');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 11:29:19');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 11:34:22');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 16:56:55');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-19 17:09:04');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 17:09:06');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 17:12:39');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 19:04:26');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 19:27:57');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 19:42:47');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 20:25:05');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 20:27:05');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-19 20:33:47');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 20:33:50');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 20:34:46');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 20:39:20');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 20:42:12');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 21:02:47');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 10:20:50');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-22 11:03:52');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 11:03:55');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 14:27:54');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-22 15:34:03');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 15:34:05');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-22 15:55:39');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 15:55:42');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 16:20:28');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 17:19:20');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 17:20:35');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 17:26:17');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 17:28:26');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 19:02:05');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 19:06:12');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-22 19:08:28');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 19:08:31');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 19:13:42');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 19:14:34');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 19:17:02');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 19:28:29');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 19:33:01');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-22 20:08:17');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-22 20:08:20');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-22 20:08:23');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2049 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2024-07-09 16:50:05', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2024-07-09 16:50:05', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2024-07-09 16:50:05', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 5, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2024-07-09 16:50:05', 'admin', '2024-07-09 21:06:21', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2024-07-09 16:50:05', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2024-07-09 16:50:05', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2024-07-09 16:50:05', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2024-07-09 16:50:05', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2024-07-09 16:50:05', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2024-07-09 16:50:05', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2024-07-09 16:50:05', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2024-07-09 16:50:05', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2024-07-09 16:50:05', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2024-07-09 16:50:05', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2024-07-09 16:50:05', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2024-07-09 16:50:05', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2024-07-09 16:50:05', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2024-07-09 16:50:05', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2024-07-09 16:50:05', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2024-07-09 16:50:05', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2024-07-09 16:50:05', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2024-07-09 16:50:05', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2024-07-09 16:50:05', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '学生选课信息', 0, 4, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-mortar-board', 'admin', '2024-07-09 20:56:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '课程信息', 2000, 1, '/system/course', '', 'C', '0', '1', 'system:course:view', '#', 'admin', '2024-07-09 20:59:09', '', NULL, '课程信息菜单');
INSERT INTO `sys_menu` VALUES (2002, '课程信息查询', 2001, 1, '#', '', 'F', '0', '1', 'system:course:list', '#', 'admin', '2024-07-09 20:59:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '课程信息新增', 2001, 2, '#', '', 'F', '0', '1', 'system:course:add', '#', 'admin', '2024-07-09 20:59:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '课程信息修改', 2001, 3, '#', '', 'F', '0', '1', 'system:course:edit', '#', 'admin', '2024-07-09 20:59:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '课程信息删除', 2001, 4, '#', '', 'F', '0', '1', 'system:course:remove', '#', 'admin', '2024-07-09 20:59:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '课程信息导出', 2001, 5, '#', '', 'F', '0', '1', 'system:course:export', '#', 'admin', '2024-07-09 20:59:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '专业信息', 2000, 1, '/system/major', '', 'C', '0', '1', 'system:major:view', '#', 'admin', '2024-07-09 20:59:36', '', NULL, '专业信息菜单');
INSERT INTO `sys_menu` VALUES (2008, '专业信息查询', 2007, 1, '#', '', 'F', '0', '1', 'system:major:list', '#', 'admin', '2024-07-09 20:59:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '专业信息新增', 2007, 2, '#', '', 'F', '0', '1', 'system:major:add', '#', 'admin', '2024-07-09 20:59:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '专业信息修改', 2007, 3, '#', '', 'F', '0', '1', 'system:major:edit', '#', 'admin', '2024-07-09 20:59:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '专业信息删除', 2007, 4, '#', '', 'F', '0', '1', 'system:major:remove', '#', 'admin', '2024-07-09 20:59:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '专业信息导出', 2007, 5, '#', '', 'F', '0', '1', 'system:major:export', '#', 'admin', '2024-07-09 20:59:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '教室课程信息', 2000, 1, '/system/rc', '', 'C', '0', '1', 'system:rc:view', '#', 'admin', '2024-07-09 21:00:05', '', NULL, '教室课程信息菜单');
INSERT INTO `sys_menu` VALUES (2014, '教室课程信息查询', 2013, 1, '#', '', 'F', '0', '1', 'system:rc:list', '#', 'admin', '2024-07-09 21:00:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '教室课程信息新增', 2013, 2, '#', '', 'F', '0', '1', 'system:rc:add', '#', 'admin', '2024-07-09 21:00:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '教室课程信息修改', 2013, 3, '#', '', 'F', '0', '1', 'system:rc:edit', '#', 'admin', '2024-07-09 21:00:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '教室课程信息删除', 2013, 4, '#', '', 'F', '0', '1', 'system:rc:remove', '#', 'admin', '2024-07-09 21:00:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '教室课程信息导出', 2013, 5, '#', '', 'F', '0', '1', 'system:rc:export', '#', 'admin', '2024-07-09 21:00:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '教室信息', 2000, 1, '/system/room', '', 'C', '0', '1', 'system:room:view', '#', 'admin', '2024-07-09 21:00:26', '', NULL, '教室信息菜单');
INSERT INTO `sys_menu` VALUES (2020, '教室信息查询', 2019, 1, '#', '', 'F', '0', '1', 'system:room:list', '#', 'admin', '2024-07-09 21:00:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '教室信息新增', 2019, 2, '#', '', 'F', '0', '1', 'system:room:add', '#', 'admin', '2024-07-09 21:00:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '教室信息修改', 2019, 3, '#', '', 'F', '0', '1', 'system:room:edit', '#', 'admin', '2024-07-09 21:00:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '教室信息删除', 2019, 4, '#', '', 'F', '0', '1', 'system:room:remove', '#', 'admin', '2024-07-09 21:00:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '教室信息导出', 2019, 5, '#', '', 'F', '0', '1', 'system:room:export', '#', 'admin', '2024-07-09 21:00:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '学生课程信息', 2000, 1, '/system/sc', '', 'C', '0', '1', 'system:sc:view', '#', 'admin', '2024-07-09 21:00:52', '', NULL, '学生课程信息菜单');
INSERT INTO `sys_menu` VALUES (2026, '学生课程信息查询', 2025, 1, '#', '', 'F', '0', '1', 'system:sc:list', '#', 'admin', '2024-07-09 21:00:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '学生课程信息新增', 2025, 2, '#', '', 'F', '0', '1', 'system:sc:add', '#', 'admin', '2024-07-09 21:00:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '学生课程信息修改', 2025, 3, '#', '', 'F', '0', '1', 'system:sc:edit', '#', 'admin', '2024-07-09 21:00:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '学生课程信息删除', 2025, 4, '#', '', 'F', '0', '1', 'system:sc:remove', '#', 'admin', '2024-07-09 21:00:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '学生课程信息导出', 2025, 5, '#', '', 'F', '0', '1', 'system:sc:export', '#', 'admin', '2024-07-09 21:00:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '学生信息', 2000, 1, '/system/student', '', 'C', '0', '1', 'system:student:view', '#', 'admin', '2024-07-09 21:01:12', '', NULL, '学生信息菜单');
INSERT INTO `sys_menu` VALUES (2032, '学生信息查询', 2031, 1, '#', '', 'F', '0', '1', 'system:student:list', '#', 'admin', '2024-07-09 21:01:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '学生信息新增', 2031, 2, '#', '', 'F', '0', '1', 'system:student:add', '#', 'admin', '2024-07-09 21:01:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '学生信息修改', 2031, 3, '#', '', 'F', '0', '1', 'system:student:edit', '#', 'admin', '2024-07-09 21:01:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '学生信息删除', 2031, 4, '#', '', 'F', '0', '1', 'system:student:remove', '#', 'admin', '2024-07-09 21:01:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '学生信息导出', 2031, 5, '#', '', 'F', '0', '1', 'system:student:export', '#', 'admin', '2024-07-09 21:01:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '教师课程信息', 2000, 1, '/system/tc', '', 'C', '0', '1', 'system:tc:view', '#', 'admin', '2024-07-09 21:01:32', '', NULL, '教师课程信息菜单');
INSERT INTO `sys_menu` VALUES (2038, '教师课程信息查询', 2037, 1, '#', '', 'F', '0', '1', 'system:tc:list', '#', 'admin', '2024-07-09 21:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '教师课程信息新增', 2037, 2, '#', '', 'F', '0', '1', 'system:tc:add', '#', 'admin', '2024-07-09 21:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '教师课程信息修改', 2037, 3, '#', '', 'F', '0', '1', 'system:tc:edit', '#', 'admin', '2024-07-09 21:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '教师课程信息删除', 2037, 4, '#', '', 'F', '0', '1', 'system:tc:remove', '#', 'admin', '2024-07-09 21:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '教师课程信息导出', 2037, 5, '#', '', 'F', '0', '1', 'system:tc:export', '#', 'admin', '2024-07-09 21:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '教师信息', 2000, 1, '/system/teacher', '', 'C', '0', '1', 'system:teacher:view', '#', 'admin', '2024-07-09 21:01:55', '', NULL, '教师信息菜单');
INSERT INTO `sys_menu` VALUES (2044, '教师信息查询', 2043, 1, '#', '', 'F', '0', '1', 'system:teacher:list', '#', 'admin', '2024-07-09 21:01:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '教师信息新增', 2043, 2, '#', '', 'F', '0', '1', 'system:teacher:add', '#', 'admin', '2024-07-09 21:01:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '教师信息修改', 2043, 3, '#', '', 'F', '0', '1', 'system:teacher:edit', '#', 'admin', '2024-07-09 21:01:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '教师信息删除', 2043, 4, '#', '', 'F', '0', '1', 'system:teacher:remove', '#', 'admin', '2024-07-09 21:01:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '教师信息导出', 2043, 5, '#', '', 'F', '0', '1', 'system:teacher:export', '#', 'admin', '2024-07-09 21:01:55', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-07-09 16:50:05', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-07-09 16:50:05', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '若依开源框架介绍', '1', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE9A1B9E79BAEE4BB8BE7BB8D3C2F7370616E3E3C2F703E3C703E3C666F6E7420636F6C6F723D2223333333333333223E52756F5969E5BC80E6BA90E9A1B9E79BAEE698AFE4B8BAE4BC81E4B89AE794A8E688B7E5AE9AE588B6E79A84E5908EE58FB0E8849AE6898BE69EB6E6A186E69EB6EFBC8CE4B8BAE4BC81E4B89AE68993E980A0E79A84E4B880E7AB99E5BC8FE8A7A3E586B3E696B9E6A188EFBC8CE9998DE4BD8EE4BC81E4B89AE5BC80E58F91E68890E69CACEFBC8CE68F90E58D87E5BC80E58F91E69588E78E87E38082E4B8BBE8A681E58C85E68BACE794A8E688B7E7AEA1E79086E38081E8A792E889B2E7AEA1E79086E38081E983A8E997A8E7AEA1E79086E38081E88F9CE58D95E7AEA1E79086E38081E58F82E695B0E7AEA1E79086E38081E5AD97E585B8E7AEA1E79086E380813C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE5B297E4BD8DE7AEA1E790863C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E5AE9AE697B6E4BBBBE58AA13C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE380813C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE69C8DE58AA1E79B91E68EA7E38081E799BBE5BD95E697A5E5BF97E38081E6938DE4BD9CE697A5E5BF97E38081E4BBA3E7A081E7949FE68890E7AD89E58A9FE883BDE38082E585B6E4B8ADEFBC8CE8BF98E694AFE68C81E5A49AE695B0E68DAEE6BA90E38081E695B0E68DAEE69D83E99990E38081E59BBDE99985E58C96E380815265646973E7BC93E5AD98E38081446F636B6572E983A8E7BDB2E38081E6BB91E58AA8E9AA8CE8AF81E7A081E38081E7ACACE4B889E696B9E8AEA4E8AF81E799BBE5BD95E38081E58886E5B883E5BC8FE4BA8BE58AA1E380813C2F7370616E3E3C666F6E7420636F6C6F723D2223333333333333223EE58886E5B883E5BC8FE69687E4BBB6E5AD98E582A83C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E58886E5BA93E58886E8A1A8E5A484E79086E7AD89E68A80E69CAFE789B9E782B9E380823C2F7370616E3E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F666F727564612E67697465652E636F6D2F696D616765732F313730353033303538333937373430313635312F35656435646236615F313135313030342E706E6722207374796C653D2277696474683A20363470783B223E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE5AE98E7BD91E58F8AE6BC94E7A4BA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE5AE98E7BD91E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F72756F79692E7669703C2F613E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E3C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE69687E6A1A3E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F646F632E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F646F632E72756F79692E7669703C2F613E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E4B88DE58886E7A6BBE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F64656D6F2E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F64656D6F2E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E58886E7A6BBE78988E69CACE38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F7675652E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F7675652E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E5BEAEE69C8DE58AA1E78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F636C6F75642E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F636C6F75642E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E7A7BBE58AA8E7ABAFE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F68352E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F68352E72756F79692E7669703C2F613E3C2F703E3C703E3C6272207374796C653D22636F6C6F723A207267622834382C2034392C203531293B20666F6E742D66616D696C793A202671756F743B48656C766574696361204E6575652671756F743B2C2048656C7665746963612C20417269616C2C2073616E732D73657269663B20666F6E742D73697A653A20313270783B223E3C2F703E, '0', 'admin', '2024-07-09 16:50:05', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 328 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"学生选课信息\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-mortar-board\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 20:56:26', 73);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"student,course,major,rc,room,sc,tc,teacher\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 20:57:01', 301);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"course,major,rc,room,sc,student,tc,teacher\"]}', NULL, 0, NULL, '2024-07-09 20:57:17', 487);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 21:06:22', 56);
INSERT INTO `sys_oper_log` VALUES (104, '学生信息', 1, 'com.ruoyi.web.controller.system.StudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/student/add', '127.0.0.1', '内网IP', '{\"stuName\":[\"周彤\"],\"stuAge\":[\"20\"],\"stuBirthday\":[\"2009-02-03\"],\"introducition\":[\"\"],\"hobby\":[\"\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"],\"delFlag\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 21:07:32', 19);
INSERT INTO `sys_oper_log` VALUES (105, '教师信息', 1, 'com.ruoyi.web.controller.system.TeacherController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/add', '127.0.0.1', '内网IP', '{\"tName\":[\"张一\"],\"tAge\":[\"24\"],\"hireDate\":[\"2024-02-07\"],\"tTitle\":[\"教务主任\"],\"workExperience\":[\"\"],\"party\":[\"1\"],\"speciality\":[\"\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"],\"delFlag\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 21:15:41', 19);
INSERT INTO `sys_oper_log` VALUES (106, '教室信息', 1, 'com.ruoyi.web.controller.system.RoomController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/room/add', '127.0.0.1', '内网IP', '{\"rName\":[\"100\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"],\"delFlag\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 21:16:02', 6);
INSERT INTO `sys_oper_log` VALUES (107, '专业信息', 1, 'com.ruoyi.web.controller.system.MajorController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/major/add', '127.0.0.1', '内网IP', '{\"majorName\":[\"计算机科学与技术\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"],\"delFlag\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 21:16:28', 4);
INSERT INTO `sys_oper_log` VALUES (108, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"javaEE\"],\"majorId\":[\"1\"],\"term\":[\"\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"],\"delFlag\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 21:17:02', 4);
INSERT INTO `sys_oper_log` VALUES (109, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"1\"],\"cId\":[\"1\"],\"schooltime\":[\"2024-07-11\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"],\"delFlag\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 21:17:20', 16);
INSERT INTO `sys_oper_log` VALUES (110, '学生课程信息', 1, 'com.ruoyi.web.controller.system.ScController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/sc/add', '127.0.0.1', '内网IP', '{\"stuId\":[\"1\"],\"cId\":[\"1\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"],\"delFlag\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 21:17:30', 15);
INSERT INTO `sys_oper_log` VALUES (111, '教师课程信息', 1, 'com.ruoyi.web.controller.system.TcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/add', '127.0.0.1', '内网IP', '{\"tId\":[\"1\"],\"cId\":[\"1\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"],\"delFlag\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-09 21:17:40', 4);
INSERT INTO `sys_oper_log` VALUES (112, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"计算机网络\"],\"majorId\":[\"1\"],\"termSelect\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 09:24:31', 65);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"term\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 09:47:10', 99);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"term\"]}', NULL, 0, NULL, '2024-07-10 09:47:18', 237);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"term\"]}', NULL, 0, NULL, '2024-07-10 10:41:51', 56);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/course', '127.0.0.1', '内网IP', '\"course\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 10:46:07', 79);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"course\"]}', NULL, 0, NULL, '2024-07-10 10:46:23', 55);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/course', '127.0.0.1', '内网IP', '\"course\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 11:01:28', 71);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"course\"]}', NULL, 0, NULL, '2024-07-10 11:01:43', 44);
INSERT INTO `sys_oper_log` VALUES (120, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"javaEE\"],\"majorId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 11:16:03', 64);
INSERT INTO `sys_oper_log` VALUES (121, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"计算机网络\"],\"majorId\":[\"1\"],\"termId\":[\"3\",\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 11:29:53', 59);
INSERT INTO `sys_oper_log` VALUES (122, '课程信息', 3, 'com.ruoyi.web.controller.system.CourseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/course/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:31:03', 50);
INSERT INTO `sys_oper_log` VALUES (123, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"计算机网络\"],\"majorId\":[\"1\"],\"termId\":[\"1\",\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:31:11', 9);
INSERT INTO `sys_oper_log` VALUES (124, '课程信息', 2, 'com.ruoyi.web.controller.system.CourseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/course/edit', '127.0.0.1', '内网IP', '{\"cId\":[\"3\"],\"cName\":[\"javaEE\"],\"majorId\":[\"1\"],\"termId\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:35:24', 7);
INSERT INTO `sys_oper_log` VALUES (125, '课程信息', 3, 'com.ruoyi.web.controller.system.CourseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/course/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:39:55', 64);
INSERT INTO `sys_oper_log` VALUES (126, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"计算机网络\"],\"majorId\":[\"1\"],\"termId\":[\"1\",\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:40:00', 16);
INSERT INTO `sys_oper_log` VALUES (127, '课程信息', 2, 'com.ruoyi.web.controller.system.CourseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/course/edit', '127.0.0.1', '内网IP', '{\"cId\":[\"6\"],\"cName\":[\"计算机网络\"],\"majorId\":[\"1\"],\"termId\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:40:16', 15);
INSERT INTO `sys_oper_log` VALUES (128, '课程信息', 2, 'com.ruoyi.web.controller.system.CourseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/course/edit', '127.0.0.1', '内网IP', '{\"cId\":[\"6\"],\"cName\":[\"计算机网络\"],\"majorId\":[\"1\"],\"termId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:47:31', 331195);
INSERT INTO `sys_oper_log` VALUES (129, '课程信息', 2, 'com.ruoyi.web.controller.system.CourseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/course/edit', '127.0.0.1', '内网IP', '{\"cId\":[\"6\"],\"cName\":[\"计算机网络\"],\"majorId\":[\"1\"],\"termId\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:58:32', 60);
INSERT INTO `sys_oper_log` VALUES (130, '课程信息', 3, 'com.ruoyi.web.controller.system.CourseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/course/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:58:41', 8);
INSERT INTO `sys_oper_log` VALUES (131, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"计算机网络\"],\"majorId\":[\"1\"],\"termId\":[\"1\",\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 14:58:56', 6);
INSERT INTO `sys_oper_log` VALUES (132, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"1\"],\"tName\":[\"张一\"],\"tAge\":[\"26\"],\"hireDate\":[\"2024-02-07\"],\"tTitle\":[\"教务主任\"],\"workExperience\":[\"\"],\"party\":[\"1\"],\"speciality\":[\"\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 15:39:46', 18);
INSERT INTO `sys_oper_log` VALUES (133, '学生信息', 2, 'com.ruoyi.web.controller.system.StudentController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/student/edit', '127.0.0.1', '内网IP', '{\"stuId\":[\"1\"],\"stuName\":[\"周彤\"],\"stuAge\":[\"20\"],\"stuSex\":[\"1\"],\"stuBirthday\":[\"2009-02-03\"],\"introducition\":[\"\"],\"hobby\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 16:19:13', 73);
INSERT INTO `sys_oper_log` VALUES (134, '学生信息', 2, 'com.ruoyi.web.controller.system.StudentController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/student/edit', '127.0.0.1', '内网IP', '{\"stuId\":[\"1\"],\"stuName\":[\"周彤\"],\"stuAge\":[\"20\"],\"stuSex\":[\"1\"],\"stuBirthday\":[\"2009-02-03\"],\"introducition\":[\"\"],\"hobbies\":[\"1\",\"2\",\"3\"],\"_hobbies\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 18:53:45', 59);
INSERT INTO `sys_oper_log` VALUES (135, '学生信息', 2, 'com.ruoyi.web.controller.system.StudentController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/student/edit', '127.0.0.1', '内网IP', '{\"stuId\":[\"1\"],\"stuName\":[\"周彤\"],\"stuAge\":[\"20\"],\"stuSex\":[\"1\"],\"stuBirthday\":[\"2009-02-03\"],\"introducition\":[\"\"],\"hobbies\":[\"1\"],\"_hobbies\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 18:53:49', 15);
INSERT INTO `sys_oper_log` VALUES (136, '学生信息', 2, 'com.ruoyi.web.controller.system.StudentController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/student/edit', '127.0.0.1', '内网IP', '{\"stuId\":[\"1\"],\"stuName\":[\"周彤\"],\"stuAge\":[\"20\"],\"stuSex\":[\"0\"],\"stuBirthday\":[\"2009-02-03\"],\"introducition\":[\"\"],\"hobbies\":[\"1\"],\"_hobbies\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 18:54:03', 4);
INSERT INTO `sys_oper_log` VALUES (137, '学生信息', 1, 'com.ruoyi.web.controller.system.StudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/student/add', '127.0.0.1', '内网IP', '{\"stuName\":[\"\"],\"stuAge\":[\"\"],\"stuBirthday\":[\"\"],\"introducition\":[\"<p>介绍...</p>\"],\"stuSex\":[\"\"],\"hobby\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 19:03:06', 52);
INSERT INTO `sys_oper_log` VALUES (138, '学生信息', 3, 'com.ruoyi.web.controller.system.StudentController.remove()', 'POST', 1, 'admin', '研发部门', '/system/student/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 19:03:11', 9);
INSERT INTO `sys_oper_log` VALUES (139, '学生信息', 2, 'com.ruoyi.web.controller.system.StudentController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/student/edit', '127.0.0.1', '内网IP', '{\"stuId\":[\"1\"],\"stuName\":[\"周彤\"],\"stuAge\":[\"20\"],\"stuSex\":[\"0\"],\"stuBirthday\":[\"2009-02-03\"],\"introducition\":[\"介绍...\"],\"hobbies\":[\"1\"],\"_hobbies\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 19:03:23', 15);
INSERT INTO `sys_oper_log` VALUES (140, '学生信息', 2, 'com.ruoyi.web.controller.system.StudentController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/student/edit', '127.0.0.1', '内网IP', '{\"stuId\":[\"1\"],\"stuName\":[\"周彤\"],\"stuAge\":[\"20\"],\"stuSex\":[\"1\"],\"stuBirthday\":[\"2009-02-03\"],\"introducition\":[\"介绍...\"],\"hobbies\":[\"1\"],\"_hobbies\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 19:03:32', 4);
INSERT INTO `sys_oper_log` VALUES (141, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"1\"],\"tName\":[\"张一\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"2024-02-07\"],\"tTitle\":[\"教务主任\"],\"workExperience\":[\"\"],\"party\":[\"1\"],\"speciality\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 19:10:21', 59);
INSERT INTO `sys_oper_log` VALUES (142, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"1\"],\"tName\":[\"张一\"],\"tAge\":[\"26\"],\"tSex\":[\"0\"],\"hireDate\":[\"2024-02-07\"],\"tTitle\":[\"教务主任\"],\"workExperience\":[\"\"],\"party\":[\"1\"],\"speciality\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 19:10:25', 5);
INSERT INTO `sys_oper_log` VALUES (143, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"1\"],\"tName\":[\"张一\"],\"tAge\":[\"26\"],\"tSex\":[\"0\"],\"hireDate\":[\"2024-02-07\"],\"tTitle\":[\"教务主任\"],\"workExperience\":[\"\"],\"party\":[\"1\"],\"specialities\":[\"1\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 19:26:31', 63);
INSERT INTO `sys_oper_log` VALUES (144, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"1\"],\"tName\":[\"张一\"],\"tAge\":[\"26\"],\"tSex\":[\"0\"],\"hireDate\":[\"2024-02-07\"],\"tTitle\":[\"教务主任\"],\"workExperience\":[\"工作经历...\"],\"party\":[\"1\"],\"specialities\":[\"1\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 19:33:14', 60);
INSERT INTO `sys_oper_log` VALUES (145, '学生课程信息', 2, 'com.ruoyi.web.controller.system.ScController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/sc/edit', '127.0.0.1', '内网IP', '{\"scId\":[\"1\"],\"stuId\":[\"1\"],\"cId\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 20:28:06', 57);
INSERT INTO `sys_oper_log` VALUES (146, '教师课程信息', 2, 'com.ruoyi.web.controller.system.TcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/edit', '127.0.0.1', '内网IP', '{\"tcId\":[\"1\"],\"tId\":[\"1\"],\"cId\":[\"2\"],\"deleteBy\":[\"\"],\"deleteTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 20:41:44', 58);
INSERT INTO `sys_oper_log` VALUES (147, '课程信息', 2, 'com.ruoyi.web.controller.system.CourseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/course/edit', '127.0.0.1', '内网IP', '{\"cId\":[\"1\"],\"cName\":[\"javaEE\"],\"majorId\":[\"1\"],\"termId\":[\"2\",\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 21:01:55', 53);
INSERT INTO `sys_oper_log` VALUES (148, '专业信息', 1, 'com.ruoyi.web.controller.system.MajorController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/major/add', '127.0.0.1', '内网IP', '{\"majorName\":[\"土木工程\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 21:50:48', 62);
INSERT INTO `sys_oper_log` VALUES (149, '专业信息', 3, 'com.ruoyi.web.controller.system.MajorController.remove()', 'POST', 1, 'admin', '研发部门', '/system/major/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 21:51:07', 10);
INSERT INTO `sys_oper_log` VALUES (150, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"\"],\"majorId\":[\"1\"],\"termId\":[\"1\",\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-10 21:52:06', 5);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/term', '127.0.0.1', '内网IP', '\"term\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 09:20:45', 116);
INSERT INTO `sys_oper_log` VALUES (152, '课程信息', 2, 'com.ruoyi.web.controller.system.CourseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/course/edit', '127.0.0.1', '内网IP', '{\"cId\":[\"1\"],\"cName\":[\"javaEE\"],\"majorId\":[\"1\"],\"termId\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 09:32:48', 63);
INSERT INTO `sys_oper_log` VALUES (153, '课程信息', 2, 'com.ruoyi.web.controller.system.CourseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/course/edit', '127.0.0.1', '内网IP', '{\"cId\":[\"3\"],\"cName\":[\"计算机网络\"],\"majorId\":[\"1\"],\"termId\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 09:32:56', 15);
INSERT INTO `sys_oper_log` VALUES (154, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"高等数学\"],\"majorId\":[\"1\"],\"termId\":[\"5\"]}', NULL, 1, 'Cannot invoke \"java.lang.Integer.intValue()\" because the return value of \"com.ruoyi.system.domain.Course.getDelFlag()\" is null', '2024-07-11 10:48:37', 200792);
INSERT INTO `sys_oper_log` VALUES (155, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"高等数学\"],\"majorId\":[\"1\"],\"termId\":[\"5\"]}', NULL, 1, 'Cannot invoke \"java.lang.Integer.intValue()\" because the return value of \"com.ruoyi.system.domain.Course.getDelFlag()\" is null', '2024-07-11 10:49:06', 10841);
INSERT INTO `sys_oper_log` VALUES (156, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"高等数学\"],\"majorId\":[\"1\"],\"termId\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 10:50:50', 58);
INSERT INTO `sys_oper_log` VALUES (157, '课程信息', 3, 'com.ruoyi.web.controller.system.CourseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/course/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:34:24', 52);
INSERT INTO `sys_oper_log` VALUES (158, '专业信息', 1, 'com.ruoyi.web.controller.system.MajorController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/major/add', '127.0.0.1', '内网IP', '{\"majorName\":[\"计算机科学与技术\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:38:13', 62);
INSERT INTO `sys_oper_log` VALUES (159, '专业信息', 1, 'com.ruoyi.web.controller.system.MajorController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/major/add', '127.0.0.1', '内网IP', '{\"majorName\":[\"土木工程\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:38:18', 15);
INSERT INTO `sys_oper_log` VALUES (160, '专业信息', 1, 'com.ruoyi.web.controller.system.MajorController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/major/add', '127.0.0.1', '内网IP', '{\"majorName\":[\"软件工程\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:38:37', 17);
INSERT INTO `sys_oper_log` VALUES (161, '教室信息', 1, 'com.ruoyi.web.controller.system.RoomController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/room/add', '127.0.0.1', '内网IP', '{\"rName\":[\"A\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:38:50', 14);
INSERT INTO `sys_oper_log` VALUES (162, '教室信息', 1, 'com.ruoyi.web.controller.system.RoomController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/room/add', '127.0.0.1', '内网IP', '{\"rName\":[\"B\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:38:54', 4);
INSERT INTO `sys_oper_log` VALUES (163, '教室信息', 1, 'com.ruoyi.web.controller.system.RoomController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/room/add', '127.0.0.1', '内网IP', '{\"rName\":[\"C\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:39:00', 3);
INSERT INTO `sys_oper_log` VALUES (164, '教室信息', 1, 'com.ruoyi.web.controller.system.RoomController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/room/add', '127.0.0.1', '内网IP', '{\"rName\":[\"D\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:39:04', 4);
INSERT INTO `sys_oper_log` VALUES (165, '学生信息', 1, 'com.ruoyi.web.controller.system.StudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/student/add', '127.0.0.1', '内网IP', '{\"stuName\":[\"周彤\"],\"stuAge\":[\"20\"],\"stuSex\":[\"1\"],\"stuBirthday\":[\"2009-02-03\"],\"introducition\":[\"<p>自我介绍</p>\"],\"hobby\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:39:53', 16);
INSERT INTO `sys_oper_log` VALUES (166, '学生信息', 1, 'com.ruoyi.web.controller.system.StudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/student/add', '127.0.0.1', '内网IP', '{\"stuName\":[\"小亮\"],\"stuAge\":[\"20\"],\"stuSex\":[\"1\"],\"stuBirthday\":[\"2003-04-02\"],\"introducition\":[\"<p>介绍</p>\"],\"hobby\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 11:40:33', 5);
INSERT INTO `sys_oper_log` VALUES (167, '学生信息', 1, 'com.ruoyi.web.controller.system.StudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/student/add', '127.0.0.1', '内网IP', '{\"stuName\":[\"张三\"],\"stuAge\":[\"22\"],\"stuSex\":[\"0\"],\"stuBirthday\":[\"2002-06-13\"],\"introducition\":[\"<p>介绍</p>\"],\"hobby\":[\"1\",\"2\",\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:02:33', 65);
INSERT INTO `sys_oper_log` VALUES (168, '教师信息', 1, 'com.ruoyi.web.controller.system.TeacherController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/add', '127.0.0.1', '内网IP', '{\"tName\":[\"李一\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"1997-06-10\"],\"tTitle\":[\"教务主任\"],\"workExperience\":[\"<p>工作经历...</p>\"],\"party\":[\"1\"],\"speciality\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:03:33', 5);
INSERT INTO `sys_oper_log` VALUES (169, '教师信息', 1, 'com.ruoyi.web.controller.system.TeacherController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/add', '127.0.0.1', '内网IP', '{\"tName\":[\"李二\"],\"tAge\":[\"25\"],\"tSex\":[\"0\"],\"hireDate\":[\"2000-03-01\"],\"tTitle\":[\"老师\"],\"workExperience\":[\"<p>经历...</p>\"],\"party\":[\"1\"],\"speciality\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:04:34', 16);
INSERT INTO `sys_oper_log` VALUES (170, '教师信息', 1, 'com.ruoyi.web.controller.system.TeacherController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/add', '127.0.0.1', '内网IP', '{\"tName\":[\"李三\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"1976-07-13\"],\"tTitle\":[\"校长\"],\"workExperience\":[\"<p>经历...</p>\"],\"party\":[\"1\"],\"speciality\":[\"1\",\"2\",\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:05:22', 13);
INSERT INTO `sys_oper_log` VALUES (171, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"高等数学\"],\"majorId\":[\"3\"],\"termId\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:05:42', 6);
INSERT INTO `sys_oper_log` VALUES (172, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"计算机网络\"],\"majorId\":[\"3\"],\"termId\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:05:57', 15);
INSERT INTO `sys_oper_log` VALUES (173, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"焊接\"],\"majorId\":[\"4\"],\"termId\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:06:35', 15);
INSERT INTO `sys_oper_log` VALUES (174, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"java\"],\"majorId\":[\"5\"],\"termId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:06:54', 16);
INSERT INTO `sys_oper_log` VALUES (175, '课程信息', 2, 'com.ruoyi.web.controller.system.CourseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/course/edit', '127.0.0.1', '内网IP', '{\"cId\":[\"13\"],\"cName\":[\"java\"],\"majorId\":[\"5\"],\"termId\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:07:05', 16);
INSERT INTO `sys_oper_log` VALUES (176, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"schooltime\":[\"2024-07-11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:07:24', 5);
INSERT INTO `sys_oper_log` VALUES (177, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"3\"],\"cId\":[\"11\"],\"schooltime\":[\"2024-07-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:07:41', 14);
INSERT INTO `sys_oper_log` VALUES (178, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"4\"],\"cId\":[\"12\"],\"schooltime\":[\"2024-07-11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:07:50', 4);
INSERT INTO `sys_oper_log` VALUES (179, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"5\"],\"cId\":[\"13\"],\"schooltime\":[\"2024-07-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:07:57', 5);
INSERT INTO `sys_oper_log` VALUES (180, '学生课程信息', 1, 'com.ruoyi.web.controller.system.ScController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/sc/add', '127.0.0.1', '内网IP', '{\"stuId\":[\"3\"],\"cId\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:08:09', 14);
INSERT INTO `sys_oper_log` VALUES (181, '学生课程信息', 1, 'com.ruoyi.web.controller.system.ScController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/sc/add', '127.0.0.1', '内网IP', '{\"stuId\":[\"4\"],\"cId\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:08:16', 15);
INSERT INTO `sys_oper_log` VALUES (182, '学生课程信息', 1, 'com.ruoyi.web.controller.system.ScController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/sc/add', '127.0.0.1', '内网IP', '{\"stuId\":[\"4\"],\"cId\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:08:25', 15);
INSERT INTO `sys_oper_log` VALUES (183, '学生课程信息', 1, 'com.ruoyi.web.controller.system.ScController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/sc/add', '127.0.0.1', '内网IP', '{\"stuId\":[\"5\"],\"cId\":[\"12\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:08:31', 15);
INSERT INTO `sys_oper_log` VALUES (184, '学生课程信息', 1, 'com.ruoyi.web.controller.system.ScController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/sc/add', '127.0.0.1', '内网IP', '{\"stuId\":[\"3\"],\"cId\":[\"13\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:08:35', 5);
INSERT INTO `sys_oper_log` VALUES (185, '教师课程信息', 1, 'com.ruoyi.web.controller.system.TcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/add', '127.0.0.1', '内网IP', '{\"tId\":[\"2\"],\"cId\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:08:43', 4);
INSERT INTO `sys_oper_log` VALUES (186, '教师课程信息', 1, 'com.ruoyi.web.controller.system.TcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/add', '127.0.0.1', '内网IP', '{\"tId\":[\"3\"],\"cId\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:08:50', 14);
INSERT INTO `sys_oper_log` VALUES (187, '教师课程信息', 1, 'com.ruoyi.web.controller.system.TcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/add', '127.0.0.1', '内网IP', '{\"tId\":[\"3\"],\"cId\":[\"13\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:08:55', 10);
INSERT INTO `sys_oper_log` VALUES (188, '教师课程信息', 1, 'com.ruoyi.web.controller.system.TcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/add', '127.0.0.1', '内网IP', '{\"tId\":[\"4\"],\"cId\":[\"12\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 15:09:00', 20);
INSERT INTO `sys_oper_log` VALUES (189, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"2\"],\"tName\":[\"李一\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"1997-06-10\"],\"tTitle\":[\"教务主任\"],\"workExperience\":[\"工作经历...\"],\"party\":[\"1\"],\"_specialities\":[\"on\",\"on\",\"on\"],\"specialities\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 21:30:43', 76);
INSERT INTO `sys_oper_log` VALUES (190, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"2\"],\"tName\":[\"李一\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"1997-06-10\"],\"tTitle\":[\"教务主任\"],\"workExperience\":[\"工作经历...\"],\"party\":[\"1\"],\"specialities\":[\"1\",\"2\",\"3\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-11 21:30:58', 6);
INSERT INTO `sys_oper_log` VALUES (191, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"2\"],\"tName\":[\"李一\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"1997-06-10\"],\"tTitle\":[\"1\"],\"workExperience\":[\"工作经历...\"],\"party\":[\"1\"],\"specialities\":[\"1\",\"2\",\"3\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-12 17:19:06', 62);
INSERT INTO `sys_oper_log` VALUES (192, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"2\"],\"tName\":[\"李一\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"1997-06-10\"],\"tTitle\":[\"1\"],\"workExperience\":[\"工作经历...\"],\"party\":[\"1\"],\"specialities\":[\"1\",\"2\",\"3\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-12 17:20:04', 56);
INSERT INTO `sys_oper_log` VALUES (193, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"3\"],\"tName\":[\"李二\"],\"tAge\":[\"25\"],\"tSex\":[\"0\"],\"hireDate\":[\"2000-03-01\"],\"tTitle\":[\"2\"],\"workExperience\":[\"经历...\"],\"party\":[\"1\"],\"specialities\":[\"1\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-12 17:20:10', 15);
INSERT INTO `sys_oper_log` VALUES (194, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"2\"],\"tName\":[\"李一\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"1997-06-10\"],\"tTitle\":[\"讲师\"],\"workExperience\":[\"工作经历...\"],\"party\":[\"1\"],\"specialities\":[\"1\",\"2\",\"3\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-12 17:21:12', 15);
INSERT INTO `sys_oper_log` VALUES (195, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"2\"],\"tName\":[\"李一\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"1997-06-10\"],\"tTitle\":[\"教授\"],\"workExperience\":[\"工作经历...\"],\"party\":[\"1\"],\"specialities\":[\"1\",\"2\",\"3\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-12 17:21:18', 15);
INSERT INTO `sys_oper_log` VALUES (196, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"3\"],\"tName\":[\"李二\"],\"tAge\":[\"25\"],\"tSex\":[\"0\"],\"hireDate\":[\"2000-03-01\"],\"tTitle\":[\"副教授\"],\"workExperience\":[\"经历...\"],\"party\":[\"1\"],\"specialities\":[\"1\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-12 17:21:23', 7);
INSERT INTO `sys_oper_log` VALUES (197, '教师信息', 2, 'com.ruoyi.web.controller.system.TeacherController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/edit', '127.0.0.1', '内网IP', '{\"tId\":[\"4\"],\"tName\":[\"李三\"],\"tAge\":[\"26\"],\"tSex\":[\"1\"],\"hireDate\":[\"1976-07-13\"],\"tTitle\":[\"教授\"],\"workExperience\":[\"经历...\"],\"party\":[\"1\"],\"specialities\":[\"1\",\"2\",\"3\"],\"_specialities\":[\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-12 17:21:28', 4);
INSERT INTO `sys_oper_log` VALUES (198, '专业信息', 3, 'com.ruoyi.web.controller.system.MajorController.remove()', 'POST', 1, 'admin', '研发部门', '/system/major/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-15 19:37:40', 73);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/rc', '127.0.0.1', '内网IP', '\"rc\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 09:17:08', 330);
INSERT INTO `sys_oper_log` VALUES (200, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"lessonNumber\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 09:44:12', 167);
INSERT INTO `sys_oper_log` VALUES (201, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"6\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 09:51:55', 5);
INSERT INTO `sys_oper_log` VALUES (202, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"6\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"5\"],\"lessonNumber\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 09:55:26', 15);
INSERT INTO `sys_oper_log` VALUES (203, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"6\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\",\"5\"],\"_weekday\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumber\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:25:20', 54);
INSERT INTO `sys_oper_log` VALUES (204, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\",\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:26:34', 17);
INSERT INTO `sys_oper_log` VALUES (205, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"3\"],\"cId\":[\"11\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:29:25', 3);
INSERT INTO `sys_oper_log` VALUES (206, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"8\"],\"rId\":[\"3\"],\"cId\":[\"11\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"1\",\"2\",\"1\"],\"_lessonNumber\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:30:10', 14);
INSERT INTO `sys_oper_log` VALUES (207, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"8\"],\"rId\":[\"3\"],\"cId\":[\"11\"],\"weekday\":[\"星期六\"],\"_lessonNumber\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumber\":[\"\",\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:30:19', 13);
INSERT INTO `sys_oper_log` VALUES (208, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"8\"],\"rId\":[\"3\"],\"cId\":[\"11\"],\"weekday\":[\"星期六\"],\"lessonNumber\":[\"1\",\"2\",\"\"],\"_lessonNumber\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:42:41', 15);
INSERT INTO `sys_oper_log` VALUES (209, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"8\"],\"rId\":[\"3\"],\"cId\":[\"11\"],\"weekday\":[\"星期六\"],\"lessonNumber\":[\"1\",\"\"],\"_lessonNumber\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:42:50', 15);
INSERT INTO `sys_oper_log` VALUES (210, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"8\"],\"rId\":[\"3\"],\"cId\":[\"11\"],\"weekday\":[\"星期六\"],\"lessonNumber\":[\"1\",\"\"],\"_lessonNumber\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:43:07', 4);
INSERT INTO `sys_oper_log` VALUES (211, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"8\"],\"rId\":[\"3\"],\"cId\":[\"11\"],\"weekday\":[\"星期六\"],\"lessonNumber\":[\"1\"],\"_lessonNumber\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:44:41', 15);
INSERT INTO `sys_oper_log` VALUES (212, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期三\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:45:13', 15);
INSERT INTO `sys_oper_log` VALUES (213, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"2\",\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:54:33', 61);
INSERT INTO `sys_oper_log` VALUES (214, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"2\"],\"_lessonNumber\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:54:40', 16);
INSERT INTO `sys_oper_log` VALUES (215, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"_lessonNumber\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumber\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 10:54:44', 15);
INSERT INTO `sys_oper_log` VALUES (216, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"_lessonNumber\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumber\":[\"2\",\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 11:04:47', 247060);
INSERT INTO `sys_oper_log` VALUES (217, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"2\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 11:05:11', 61);
INSERT INTO `sys_oper_log` VALUES (218, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumbers\":[\"1\",\"2\",\"3\",\"4\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 11:10:58', 13);
INSERT INTO `sys_oper_log` VALUES (219, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumbers\":[\"1\",\"2\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 11:11:06', 15);
INSERT INTO `sys_oper_log` VALUES (220, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumbers\":[\"1\",\"2\",\"3\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 11:11:11', 15);
INSERT INTO `sys_oper_log` VALUES (221, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumbers\":[\"1\",\"2\",\"3\",\"4\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 11:11:15', 14);
INSERT INTO `sys_oper_log` VALUES (222, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumbers\":[\"1\",\"2\",\"3\",\"4\",\"5\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 11:12:25', 14);
INSERT INTO `sys_oper_log` VALUES (223, '专业信息', 3, 'com.ruoyi.web.controller.system.MajorController.remove()', 'POST', 1, 'admin', '研发部门', '/system/major/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 11:14:32', 53);
INSERT INTO `sys_oper_log` VALUES (224, '专业信息', 3, 'com.ruoyi.web.controller.system.MajorController.remove()', 'POST', 1, 'admin', '研发部门', '/system/major/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"该专业下有课程，无法删除\",\"code\":500}', 0, NULL, '2024-07-18 15:07:46', 58);
INSERT INTO `sys_oper_log` VALUES (225, '课程信息', 3, 'com.ruoyi.web.controller.system.CourseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/course/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', '{\"msg\":\"该课程已有学生选课，无法删除\",\"code\":301}', 0, NULL, '2024-07-18 15:17:27', 15);
INSERT INTO `sys_oper_log` VALUES (226, '课程信息', 3, 'com.ruoyi.web.controller.system.CourseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/course/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '{\"msg\":\"该课程已有学生选课，无法删除\",\"code\":301}', 0, NULL, '2024-07-18 15:17:43', 10);
INSERT INTO `sys_oper_log` VALUES (227, '教师信息', 3, 'com.ruoyi.web.controller.system.TeacherController.remove()', 'POST', 1, 'admin', '研发部门', '/system/teacher/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"该教师有课程，无法删除\",\"code\":500}', 0, NULL, '2024-07-18 15:23:51', 54);
INSERT INTO `sys_oper_log` VALUES (228, '教师信息', 3, 'com.ruoyi.web.controller.system.TeacherController.remove()', 'POST', 1, 'admin', '研发部门', '/system/teacher/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"该教师有课程，无法删除\",\"code\":500}', 0, NULL, '2024-07-18 15:23:54', 7);
INSERT INTO `sys_oper_log` VALUES (229, '教师信息', 3, 'com.ruoyi.web.controller.system.TeacherController.remove()', 'POST', 1, 'admin', '研发部门', '/system/teacher/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"该教师有课程，无法删除\",\"code\":500}', 0, NULL, '2024-07-18 15:23:58', 7);
INSERT INTO `sys_oper_log` VALUES (230, '专业信息', 1, 'com.ruoyi.web.controller.system.MajorController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/major/add', '127.0.0.1', '内网IP', '{\"majorName\":[\"软件工程\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 15:25:57', 18);
INSERT INTO `sys_oper_log` VALUES (231, '专业信息', 1, 'com.ruoyi.web.controller.system.MajorController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/major/add', '127.0.0.1', '内网IP', '{\"majorName\":[\"土木工程\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 15:26:01', 16);
INSERT INTO `sys_oper_log` VALUES (232, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"javaEE\"],\"majorId\":[\"6\"],\"termId\":[\"6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 15:26:51', 15);
INSERT INTO `sys_oper_log` VALUES (233, '课程信息', 1, 'com.ruoyi.web.controller.system.CourseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/course/add', '127.0.0.1', '内网IP', '{\"cName\":[\"英语\"],\"majorId\":[\"7\"],\"termId\":[\"6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 15:27:19', 4);
INSERT INTO `sys_oper_log` VALUES (234, '学生课程信息', 2, 'com.ruoyi.web.controller.system.ScController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/sc/edit', '127.0.0.1', '内网IP', '{\"scId\":[\"5\"],\"stuId\":[\"5\"],\"cId\":[\"14\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 15:27:33', 15);
INSERT INTO `sys_oper_log` VALUES (235, '学生课程信息', 2, 'com.ruoyi.web.controller.system.ScController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/sc/edit', '127.0.0.1', '内网IP', '{\"scId\":[\"6\"],\"stuId\":[\"3\"],\"cId\":[\"15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 15:27:37', 15);
INSERT INTO `sys_oper_log` VALUES (236, '教师课程信息', 2, 'com.ruoyi.web.controller.system.TcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/edit', '127.0.0.1', '内网IP', '{\"tcId\":[\"4\"],\"tId\":[\"3\"],\"cId\":[\"14\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 15:27:54', 14);
INSERT INTO `sys_oper_log` VALUES (237, '教师课程信息', 2, 'com.ruoyi.web.controller.system.TcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/edit', '127.0.0.1', '内网IP', '{\"tcId\":[\"5\"],\"tId\":[\"4\"],\"cId\":[\"15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 15:27:59', 15);
INSERT INTO `sys_oper_log` VALUES (238, '专业信息', 3, 'com.ruoyi.web.controller.system.MajorController.remove()', 'POST', 1, 'admin', '研发部门', '/system/major/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\"msg\":\"该专业下有课程，无法删除\",\"code\":500}', 0, NULL, '2024-07-18 17:32:11', 66);
INSERT INTO `sys_oper_log` VALUES (239, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"3\"],\"cId\":[\"14\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 19:31:06', 577216);
INSERT INTO `sys_oper_log` VALUES (240, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"4\"],\"cId\":[\"15\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 19:33:09', 144);
INSERT INTO `sys_oper_log` VALUES (241, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"14\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 19:37:47', 190089);
INSERT INTO `sys_oper_log` VALUES (242, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:40:42', 113955);
INSERT INTO `sys_oper_log` VALUES (243, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"2\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:41:21', 2726);
INSERT INTO `sys_oper_log` VALUES (244, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"2\",\"3\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:41:31', 2007);
INSERT INTO `sys_oper_log` VALUES (245, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"11\"],\"rId\":[\"3\"],\"cId\":[\"14\"],\"weekday\":[\"星期二\"],\"lessonNumbers\":[\"1\",\"2\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', NULL, 1, 'Cannot invoke \"java.lang.CharSequence.toString()\" because \"s\" is null', '2024-07-18 19:44:38', 59);
INSERT INTO `sys_oper_log` VALUES (246, '教室课程信息', 3, 'com.ruoyi.web.controller.system.RcController.remove()', 'POST', 1, 'admin', '研发部门', '/system/rc/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 19:45:17', 14);
INSERT INTO `sys_oper_log` VALUES (247, '教室课程信息', 3, 'com.ruoyi.web.controller.system.RcController.remove()', 'POST', 1, 'admin', '研发部门', '/system/rc/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 19:45:19', 18);
INSERT INTO `sys_oper_log` VALUES (248, '教室课程信息', 3, 'com.ruoyi.web.controller.system.RcController.remove()', 'POST', 1, 'admin', '研发部门', '/system/rc/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"13\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 19:45:21', 8);
INSERT INTO `sys_oper_log` VALUES (249, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:45:36', 4);
INSERT INTO `sys_oper_log` VALUES (250, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:47:16', 5);
INSERT INTO `sys_oper_log` VALUES (251, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"1\",\"2\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:47:20', 3);
INSERT INTO `sys_oper_log` VALUES (252, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"2\",\"3\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:47:24', 4);
INSERT INTO `sys_oper_log` VALUES (253, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"2\",\"4\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:47:33', 3);
INSERT INTO `sys_oper_log` VALUES (254, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"lessonNumber\":[\"2\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:47:39', 3);
INSERT INTO `sys_oper_log` VALUES (255, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:47:50', 3);
INSERT INTO `sys_oper_log` VALUES (256, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:48:36', 5);
INSERT INTO `sys_oper_log` VALUES (257, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:48:39', 3);
INSERT INTO `sys_oper_log` VALUES (258, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:48:54', 3);
INSERT INTO `sys_oper_log` VALUES (259, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:50:23', 66);
INSERT INTO `sys_oper_log` VALUES (260, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"2\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:50:29', 5);
INSERT INTO `sys_oper_log` VALUES (261, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:51:34', 49);
INSERT INTO `sys_oper_log` VALUES (262, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:51:50', 3);
INSERT INTO `sys_oper_log` VALUES (263, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 19:53:45', 69508);
INSERT INTO `sys_oper_log` VALUES (264, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 19:54:17', 57);
INSERT INTO `sys_oper_log` VALUES (265, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\"]}', NULL, 1, 'Cannot invoke \"java.lang.CharSequence.toString()\" because \"s\" is null', '2024-07-18 19:54:31', 5);
INSERT INTO `sys_oper_log` VALUES (266, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\"]}', NULL, 1, 'Cannot invoke \"java.lang.CharSequence.toString()\" because \"s\" is null', '2024-07-18 20:00:21', 191779);
INSERT INTO `sys_oper_log` VALUES (267, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 20:04:14', 157941);
INSERT INTO `sys_oper_log` VALUES (268, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 20:04:58', 69);
INSERT INTO `sys_oper_log` VALUES (269, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"3\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 20:05:05', 3);
INSERT INTO `sys_oper_log` VALUES (270, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 20:05:14', 4);
INSERT INTO `sys_oper_log` VALUES (271, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 20:05:25', 4);
INSERT INTO `sys_oper_log` VALUES (272, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 20:05:32', 18);
INSERT INTO `sys_oper_log` VALUES (273, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 20:05:36', 3);
INSERT INTO `sys_oper_log` VALUES (274, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 20:05:41', 4);
INSERT INTO `sys_oper_log` VALUES (275, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 20:07:02', 77);
INSERT INTO `sys_oper_log` VALUES (276, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\",\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 20:07:06', 8);
INSERT INTO `sys_oper_log` VALUES (277, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"14\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\",\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 20:07:09', 18);
INSERT INTO `sys_oper_log` VALUES (278, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期四\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\",\"4\",\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 20:11:55', 21);
INSERT INTO `sys_oper_log` VALUES (279, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\",\"4\",\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 20:12:03', 6);
INSERT INTO `sys_oper_log` VALUES (280, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期二\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\",\"4\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-18 20:12:09', 4);
INSERT INTO `sys_oper_log` VALUES (281, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"10\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"5\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-18 20:12:22', 7);
INSERT INTO `sys_oper_log` VALUES (282, '教师信息', 1, 'com.ruoyi.web.controller.system.TeacherController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/add', '127.0.0.1', '内网IP', '{\"tName\":[\"李四\"],\"tAge\":[\"18\"],\"tSex\":[\"1\"],\"hireDate\":[\"2010-03-03\"],\"tTitle\":[\"讲师\"],\"workExperience\":[\"<p>.</p>\"],\"party\":[\"1\"],\"speciality\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 15:37:51', 74);
INSERT INTO `sys_oper_log` VALUES (283, '教师信息', 1, 'com.ruoyi.web.controller.system.TeacherController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/teacher/add', '127.0.0.1', '内网IP', '{\"tName\":[\"李五\"],\"tAge\":[\"40\"],\"tSex\":[\"0\"],\"hireDate\":[\"1997-06-11\"],\"tTitle\":[\"教授\"],\"workExperience\":[\"<p>.。</p>\"],\"party\":[\"1\"],\"speciality\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 15:38:33', 17);
INSERT INTO `sys_oper_log` VALUES (284, '教师课程信息', 1, 'com.ruoyi.web.controller.system.TcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/add', '127.0.0.1', '内网IP', '{\"tId\":[\"5\"],\"cId\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 15:38:42', 14);
INSERT INTO `sys_oper_log` VALUES (285, '教师课程信息', 1, 'com.ruoyi.web.controller.system.TcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/add', '127.0.0.1', '内网IP', '{\"tId\":[\"6\"],\"cId\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 15:38:52', 4);
INSERT INTO `sys_oper_log` VALUES (286, '教师课程信息', 1, 'com.ruoyi.web.controller.system.TcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/tc/add', '127.0.0.1', '内网IP', '{\"tId\":[\"2\"],\"cId\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 15:39:05', 5);
INSERT INTO `sys_oper_log` VALUES (287, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 16:53:11', 9);
INSERT INTO `sys_oper_log` VALUES (288, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 16:53:22', 3);
INSERT INTO `sys_oper_log` VALUES (289, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 16:53:25', 16);
INSERT INTO `sys_oper_log` VALUES (290, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 17:19:46', 54);
INSERT INTO `sys_oper_log` VALUES (291, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 17:19:52', 5);
INSERT INTO `sys_oper_log` VALUES (292, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"4\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 17:20:00', 4);
INSERT INTO `sys_oper_log` VALUES (293, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"3\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 17:20:08', 3);
INSERT INTO `sys_oper_log` VALUES (294, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 17:25:05', 257818);
INSERT INTO `sys_oper_log` VALUES (295, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 17:26:43', 73);
INSERT INTO `sys_oper_log` VALUES (296, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 17:29:07', 31075);
INSERT INTO `sys_oper_log` VALUES (297, '教室课程信息', 3, 'com.ruoyi.web.controller.system.RcController.remove()', 'POST', 1, 'admin', '研发部门', '/system/rc/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 19:02:21', 65);
INSERT INTO `sys_oper_log` VALUES (298, '教室课程信息', 3, 'com.ruoyi.web.controller.system.RcController.remove()', 'POST', 1, 'admin', '研发部门', '/system/rc/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 19:02:23', 18);
INSERT INTO `sys_oper_log` VALUES (299, '教室课程信息', 3, 'com.ruoyi.web.controller.system.RcController.remove()', 'POST', 1, 'admin', '研发部门', '/system/rc/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"16\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 19:02:25', 7);
INSERT INTO `sys_oper_log` VALUES (300, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"11\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"3\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:03:55', 2);
INSERT INTO `sys_oper_log` VALUES (301, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"11\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"3\",\"4\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:03:58', 2);
INSERT INTO `sys_oper_log` VALUES (302, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"11\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"4\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:04:03', 3);
INSERT INTO `sys_oper_log` VALUES (303, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"11\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"3\",\"4\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:04:06', 3);
INSERT INTO `sys_oper_log` VALUES (304, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"11\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"2\",\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 19:04:13', 8);
INSERT INTO `sys_oper_log` VALUES (305, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"2\",\"3\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:04:21', 1);
INSERT INTO `sys_oper_log` VALUES (306, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"2\",\"3\",\"4\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:04:25', 3);
INSERT INTO `sys_oper_log` VALUES (307, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"2\",\"4\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:04:28', 3);
INSERT INTO `sys_oper_log` VALUES (308, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"4\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:04:31', 3);
INSERT INTO `sys_oper_log` VALUES (309, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"2\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:06:31', 5);
INSERT INTO `sys_oper_log` VALUES (310, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"2\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:06:34', 3);
INSERT INTO `sys_oper_log` VALUES (311, '教室课程信息', 1, 'com.ruoyi.web.controller.system.RcController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/add', '127.0.0.1', '内网IP', '{\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumber\":[\"1\",\"2\",\"4\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:06:37', 3);
INSERT INTO `sys_oper_log` VALUES (312, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"4\"]}', NULL, 1, 'Cannot invoke \"String.split(String)\" because \"rcLessonNumber\" is null', '2024-07-22 19:07:03', 16);
INSERT INTO `sys_oper_log` VALUES (313, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', NULL, 1, 'Cannot invoke \"String.split(String)\" because \"rcLessonNumber\" is null', '2024-07-22 19:07:17', 3);
INSERT INTO `sys_oper_log` VALUES (314, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"19\"],\"rId\":[\"2\"],\"cId\":[\"11\"],\"weekday\":[\"星期一\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 19:08:51', 18);
INSERT INTO `sys_oper_log` VALUES (315, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"19\"],\"rId\":[\"2\"],\"cId\":[\"11\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"3\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:08:55', 3);
INSERT INTO `sys_oper_log` VALUES (316, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"19\"],\"rId\":[\"2\"],\"cId\":[\"11\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"2\",\"3\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:09:05', 1);
INSERT INTO `sys_oper_log` VALUES (317, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"2\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:09:12', 3);
INSERT INTO `sys_oper_log` VALUES (318, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"2\",\"4\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:09:14', 3);
INSERT INTO `sys_oper_log` VALUES (319, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"2\",\"4\",\"5\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:09:18', 2);
INSERT INTO `sys_oper_log` VALUES (320, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"19\"],\"rId\":[\"2\"],\"cId\":[\"11\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"3\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:10:11', 3);
INSERT INTO `sys_oper_log` VALUES (321, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"2\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:10:18', 3);
INSERT INTO `sys_oper_log` VALUES (322, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"4\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-07-22 19:10:24', 15);
INSERT INTO `sys_oper_log` VALUES (323, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"3\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:10:27', 2);
INSERT INTO `sys_oper_log` VALUES (324, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"lessonNumbers\":[\"1\",\"2\",\"3\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:10:30', 2);
INSERT INTO `sys_oper_log` VALUES (325, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"2\",\"3\",\"4\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:10:34', 2);
INSERT INTO `sys_oper_log` VALUES (326, '教室课程信息', 2, 'com.ruoyi.web.controller.system.RcController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rc/edit', '127.0.0.1', '内网IP', '{\"rcId\":[\"1\"],\"rId\":[\"2\"],\"cId\":[\"10\"],\"weekday\":[\"星期一\"],\"_lessonNumbers\":[\"on\",\"on\",\"on\",\"on\",\"on\"],\"lessonNumbers\":[\"3\",\"4\",\"5\"]}', '{\"msg\":\"该教室在该时间段已有课程\",\"code\":500}', 0, NULL, '2024-07-22 19:10:37', 2);
INSERT INTO `sys_oper_log` VALUES (327, '教室课程信息', 5, 'com.ruoyi.web.controller.system.RcController.export()', 'POST', 1, 'admin', '研发部门', '/system/rc/export', '127.0.0.1', '内网IP', '{\"rId\":[\"\"],\"cId\":[\"\"],\"weekday\":[\"\"],\"lessonNumber\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"71022390-0249-4d16-8034-51b0a22d11df_教室课程信息数据.xlsx\",\"code\":0}', 0, NULL, '2024-07-22 19:35:56', 640);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-07-09 16:50:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-07-09 16:50:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2024-07-09 16:50:05', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2024-07-22 20:08:23', NULL, 'admin', '2024-07-09 16:50:05', '', '2024-07-22 20:08:23', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', NULL, NULL, 'admin', '2024-07-09 16:50:05', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('506a8fb1-95a7-4a6c-ba06-aeff06e8bdcc', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-07-22 19:01:57', '2024-07-22 20:14:13', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for tc
-- ----------------------------
DROP TABLE IF EXISTS `tc`;
CREATE TABLE `tc`  (
  `tc_id` bigint NOT NULL AUTO_INCREMENT COMMENT '教师课程编号',
  `t_id` bigint NULL DEFAULT NULL COMMENT '教师编号',
  `c_id` bigint NULL DEFAULT NULL COMMENT '课程编号',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`tc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教师课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tc
-- ----------------------------
INSERT INTO `tc` VALUES (2, 2, 10, '若依', '2024-07-11 15:08:43', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tc` VALUES (3, 3, 11, '若依', '2024-07-11 15:08:50', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tc` VALUES (4, 3, 14, '若依', '2024-07-11 15:08:55', '若依', '2024-07-18 15:27:55', NULL, NULL, b'0');
INSERT INTO `tc` VALUES (5, 4, 15, '若依', '2024-07-11 15:09:00', '若依', '2024-07-18 15:27:59', NULL, NULL, b'0');
INSERT INTO `tc` VALUES (6, 5, 11, '若依', '2024-07-22 15:38:42', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tc` VALUES (7, 6, 10, '若依', '2024-07-22 15:38:52', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tc` VALUES (8, 2, 11, '若依', '2024-07-22 15:39:06', NULL, NULL, NULL, NULL, b'0');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_id` bigint NOT NULL AUTO_INCREMENT COMMENT '教师编号',
  `t_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教师名字',
  `t_age` int NULL DEFAULT NULL COMMENT '年龄',
  `t_sex` bit(1) NULL DEFAULT NULL COMMENT '性别',
  `hire_date` date NULL DEFAULT NULL COMMENT '入职时间',
  `t_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教师职称',
  `work_experience` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作经历',
  `party` bit(1) NULL DEFAULT NULL COMMENT '党员',
  `speciality` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特长',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `del_flag` bit(1) NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教师信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (2, '李一', 26, b'1', '1997-06-10', '教授', '工作经历...', b'1', '1,2,3', '若依', '2024-07-11 15:03:34', '若依', '2024-07-12 17:21:18', NULL, NULL, b'0');
INSERT INTO `teacher` VALUES (3, '李二', 25, b'0', '2000-03-01', '副教授', '经历...', b'1', '1', '若依', '2024-07-11 15:04:34', '若依', '2024-07-12 17:21:23', NULL, NULL, b'0');
INSERT INTO `teacher` VALUES (4, '李三', 26, b'1', '1976-07-13', '教授', '经历...', b'1', '1,2,3', '若依', '2024-07-11 15:05:23', '若依', '2024-07-12 17:21:28', NULL, NULL, b'0');
INSERT INTO `teacher` VALUES (5, '李四', 18, b'1', '2010-03-03', '讲师', '.', b'1', '2', '若依', '2024-07-22 15:37:52', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `teacher` VALUES (6, '李五', 40, b'0', '1997-06-11', '教授', '.。', b'1', '3', '若依', '2024-07-22 15:38:34', NULL, NULL, NULL, NULL, b'0');

-- ----------------------------
-- Table structure for term
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term`  (
  `term_id` int NOT NULL AUTO_INCREMENT COMMENT '学期编号',
  `term_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学期',
  PRIMARY KEY (`term_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学期信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of term
-- ----------------------------
INSERT INTO `term` VALUES (1, '2022-2023 第一学期');
INSERT INTO `term` VALUES (2, '2022-2023 第二学期');
INSERT INTO `term` VALUES (3, '2023-2024 第一学期');
INSERT INTO `term` VALUES (4, '2023-2024 第二学期');
INSERT INTO `term` VALUES (5, '2024-2025 第一学期');
INSERT INTO `term` VALUES (6, '2024-2025 第二学期');

SET FOREIGN_KEY_CHECKS = 1;
