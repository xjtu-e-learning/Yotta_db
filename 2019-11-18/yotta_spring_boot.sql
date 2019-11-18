/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 100119
 Source Host           : 47.95.145.72:9220
 Source Schema         : yotta_spring_boot_complete

 Target Server Type    : MySQL
 Target Server Version : 100119
 File Encoding         : 65001

 Date: 18/11/2019 16:18:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assemble
-- ----------------------------
DROP TABLE IF EXISTS `assemble`;
CREATE TABLE `assemble`  (
  `assemble_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assemble_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `assemble_scratch_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assemble_text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `facet_id` bigint(20) NULL DEFAULT NULL,
  `source_id` bigint(20) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`assemble_id`) USING BTREE,
  INDEX `facetId`(`facet_id`) USING BTREE,
  INDEX `domainId`(`domain_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2903005 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assemble_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `assemble_evaluation`;
CREATE TABLE `assemble_evaluation`  (
  `evaluation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assemble_id` bigint(20) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `value` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`evaluation_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group__permission_id_4056c95df62a6dd5_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group__permission_id_4056c95df62a6dd5_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permission_group_id_58a622409c72210f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `content_type_id`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth__content_type_id_343d5d43c39b8e63_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_79eb0b205fd47a01_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_79eb0b205fd47a01_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6390015801362c1a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_u_permission_id_31ae6a268e213a2f_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_u_permission_id_31ae6a268e213a2f_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissi_user_id_41a96ddab8b82260_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for course_wangyuan
-- ----------------------------
DROP TABLE IF EXISTS `course_wangyuan`;
CREATE TABLE `course_wangyuan`  (
  `course_id` int(11) NOT NULL COMMENT '网院课程id',
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网院课程名',
  `course_wiki` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文维基课程名',
  `course_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网院课程编号',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dependency
-- ----------------------------
DROP TABLE IF EXISTS `dependency`;
CREATE TABLE `dependency`  (
  `dependency_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `confidence` float NOT NULL,
  `end_topic_id` bigint(20) NULL DEFAULT NULL,
  `start_topic_id` bigint(20) NULL DEFAULT NULL,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`dependency_id`) USING BTREE,
  INDEX `startTopicId`(`start_topic_id`) USING BTREE,
  INDEX `endTopicId`(`end_topic_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 96260 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(0) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `djang_content_type_id_42c7f6861ad5120d_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_1a57d8972a7a737c_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `djang_content_type_id_42c7f6861ad5120d_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_1a57d8972a7a737c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_3000b7230abda838_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(0) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_de54fa62`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for domain
-- ----------------------------
DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain`  (
  `domain_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`domain_id`) USING BTREE,
  INDEX `subjectId`(`subject_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 512 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for domain_copy
-- ----------------------------
DROP TABLE IF EXISTS `domain_copy`;
CREATE TABLE `domain_copy`  (
  `domain_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`domain_id`) USING BTREE,
  INDEX `subjectId`(`subject_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 411 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for domain_copyforar
-- ----------------------------
DROP TABLE IF EXISTS `domain_copyforar`;
CREATE TABLE `domain_copyforar`  (
  `domain_id` bigint(20) NOT NULL,
  `domain_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `domain_copyforar_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`domain_copyforar_id`) USING BTREE,
  INDEX `subjectId`(`subject_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 837 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for facet
-- ----------------------------
DROP TABLE IF EXISTS `facet`;
CREATE TABLE `facet`  (
  `facet_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `facet_layer` int(11) NULL DEFAULT NULL,
  `facet_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_facet_id` bigint(20) NULL DEFAULT NULL,
  `topic_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`facet_id`) USING BTREE,
  INDEX `topicId`(`topic_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 571037 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for facet_state
-- ----------------------------
DROP TABLE IF EXISTS `facet_state`;
CREATE TABLE `facet_state`  (
  `state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `states` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `topic_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`state_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34108 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hot_topic
-- ----------------------------
DROP TABLE IF EXISTS `hot_topic`;
CREATE TABLE `hot_topic`  (
  `hot_topic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `hot_topics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`hot_topic_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mapping_domain
-- ----------------------------
DROP TABLE IF EXISTS `mapping_domain`;
CREATE TABLE `mapping_domain`  (
  `course_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `domain_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 63000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 961 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '碎片ID',
  `page_website_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题网站logo。SO为 fa fa-stack-overflow, Yahoo为 fa fa-yahoo',
  `page_search_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题网站搜索链接。SO为 https://stackoverflow.com/search?q=, Yahoo为 https://answers.search.yahoo.com/search?p=',
  `page_column_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题网站高质量显示颜色',
  `question_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题链接',
  `question_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题标题(带html标签)',
  `question_title_pure` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题标题(纯文本)',
  `question_body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题正文(带html标签)',
  `question_body_pure` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题正文(纯文本)',
  `question_best_answer` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题最佳答案(带html标签)',
  `question_best_answer_pure` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题最佳答案(纯文本)',
  `question_score` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题分数',
  `question_answerCount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题回答数',
  `question_viewCount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题浏览数',
  `asker_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提问者个人主页链接',
  `asker_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提问者姓名',
  `asker_reputation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提问者声望值',
  `asker_answerCount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提问者回答总数',
  `asker_questionCount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提问者问题总数',
  `asker_viewCount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提问者浏览总数',
  `asker_best_answer_rate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提问者最佳回答率',
  `question_quality_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题质量标签',
  `assemble_id` bigint(20) NULL DEFAULT NULL COMMENT '问题对应在碎片表assemble_fragment的id，外键',
  `asker_answer_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asker_question_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asker_view_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_answer_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_view_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `questionId`(`question_id`) USING BTREE,
  INDEX `fragmentId`(`assemble_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 49817 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recommendation
-- ----------------------------
DROP TABLE IF EXISTS `recommendation`;
CREATE TABLE `recommendation`  (
  `recommendation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `recommendation_topics` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`recommendation_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for relation
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation`  (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `child_topic_id` bigint(20) NULL DEFAULT NULL,
  `parent_topic_id` bigint(20) NULL DEFAULT NULL,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`relation_id`) USING BTREE,
  INDEX `parentTopicId`(`parent_topic_id`) USING BTREE,
  INDEX `childTopicId`(`child_topic_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 193093 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source`  (
  `source_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`source_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for statistics
-- ----------------------------
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics`  (
  `statistics_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assemble_number` bigint(11) NULL DEFAULT NULL,
  `dependency_number` bigint(11) NULL DEFAULT NULL,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `facet_number` bigint(11) NULL DEFAULT NULL,
  `first_layer_facet_number` bigint(11) NULL DEFAULT NULL,
  `second_layer_facet_number` bigint(11) NULL DEFAULT NULL,
  `third_layer_facet_number` bigint(11) NULL DEFAULT NULL,
  `topic_number` bigint(11) NULL DEFAULT NULL,
  `domain_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`statistics_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2219 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `subject_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_assemble
-- ----------------------------
DROP TABLE IF EXISTS `temporary_assemble`;
CREATE TABLE `temporary_assemble`  (
  `assemble_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assemble_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `assemble_scratch_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`assemble_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 500 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for term
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term`  (
  `term_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `term_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `term_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`term_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `topic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `topic_layer` bigint(20) NULL DEFAULT NULL,
  `topic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `topic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`topic_id`) USING BTREE,
  INDEX `domainId`(`domain_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1054225 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topic_copy
-- ----------------------------
DROP TABLE IF EXISTS `topic_copy`;
CREATE TABLE `topic_copy`  (
  `topic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `topic_layer` bigint(20) NULL DEFAULT NULL,
  `topic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `topic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`topic_id`) USING BTREE,
  INDEX `domainId`(`domain_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 105122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topic_state
-- ----------------------------
DROP TABLE IF EXISTS `topic_state`;
CREATE TABLE `topic_state`  (
  `state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `domain_id` bigint(20) NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `states` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`state_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`, `user_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `passwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3198 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
