/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : lvwen

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-08-04 23:14:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aws_active_data
-- ----------------------------
DROP TABLE IF EXISTS `aws_active_data`;
CREATE TABLE `aws_active_data` (
  `active_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `expire_time` int(10) DEFAULT NULL,
  `active_code` varchar(32) DEFAULT NULL,
  `active_type_code` varchar(16) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL,
  `add_ip` bigint(12) DEFAULT NULL,
  `active_time` int(10) DEFAULT NULL,
  `active_ip` bigint(12) DEFAULT NULL,
  PRIMARY KEY (`active_id`),
  KEY `active_code` (`active_code`),
  KEY `active_type_code` (`active_type_code`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_active_data
-- ----------------------------

-- ----------------------------
-- Table structure for aws_answer
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer`;
CREATE TABLE `aws_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回答id',
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `answer_content` text COMMENT '回答内容',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `against_count` int(11) NOT NULL DEFAULT '0' COMMENT '反对人数',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '支持人数',
  `uid` int(11) DEFAULT '0' COMMENT '发布问题用户ID',
  `comment_count` int(11) DEFAULT '0' COMMENT '评论总数',
  `uninterested_count` int(11) DEFAULT '0' COMMENT '不感兴趣',
  `thanks_count` int(11) DEFAULT '0' COMMENT '感谢数量',
  `category_id` int(11) DEFAULT '0' COMMENT '分类id',
  `has_attach` tinyint(1) DEFAULT '0' COMMENT '是否存在附件',
  `ip` bigint(11) DEFAULT NULL,
  `force_fold` tinyint(1) DEFAULT '0' COMMENT '强制折叠',
  `anonymous` tinyint(1) DEFAULT '0',
  `publish_source` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  KEY `agree_count` (`agree_count`),
  KEY `against_count` (`against_count`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `uninterested_count` (`uninterested_count`),
  KEY `force_fold` (`force_fold`),
  KEY `anonymous` (`anonymous`),
  KEY `publich_source` (`publish_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='回答';

-- ----------------------------
-- Records of aws_answer
-- ----------------------------

-- ----------------------------
-- Table structure for aws_answer_comments
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer_comments`;
CREATE TABLE `aws_answer_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_answer_comments
-- ----------------------------

-- ----------------------------
-- Table structure for aws_answer_thanks
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer_thanks`;
CREATE TABLE `aws_answer_thanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_answer_thanks
-- ----------------------------

-- ----------------------------
-- Table structure for aws_answer_uninterested
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer_uninterested`;
CREATE TABLE `aws_answer_uninterested` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_answer_uninterested
-- ----------------------------

-- ----------------------------
-- Table structure for aws_answer_vote
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer_vote`;
CREATE TABLE `aws_answer_vote` (
  `voter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动ID',
  `answer_id` int(11) DEFAULT NULL COMMENT '回复id',
  `answer_uid` int(11) DEFAULT NULL COMMENT '回复作者id',
  `vote_uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `vote_value` tinyint(4) NOT NULL COMMENT '-1反对 1 支持',
  `reputation_factor` int(10) DEFAULT '0',
  PRIMARY KEY (`voter_id`),
  KEY `answer_id` (`answer_id`),
  KEY `vote_value` (`vote_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_answer_vote
-- ----------------------------

-- ----------------------------
-- Table structure for aws_approval
-- ----------------------------
DROP TABLE IF EXISTS `aws_approval`;
CREATE TABLE `aws_approval` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT NULL,
  `data` mediumtext NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_approval
-- ----------------------------

-- ----------------------------
-- Table structure for aws_article
-- ----------------------------
DROP TABLE IF EXISTS `aws_article`;
CREATE TABLE `aws_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `comments` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  `add_time` int(10) DEFAULT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `lock` int(1) NOT NULL DEFAULT '0',
  `votes` int(10) DEFAULT '0',
  `title_fulltext` text,
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `column_id` int(11) DEFAULT NULL COMMENT '所属专栏id',
  `article_img` varchar(255) DEFAULT NULL COMMENT '文章封面',
  PRIMARY KEY (`id`),
  KEY `has_attach` (`has_attach`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`),
  KEY `views` (`views`),
  KEY `add_time` (`add_time`),
  KEY `lock` (`lock`),
  KEY `votes` (`votes`),
  KEY `category_id` (`category_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `chapter_id` (`chapter_id`),
  KEY `sort` (`sort`),
  FULLTEXT KEY `title_fulltext` (`title_fulltext`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_article
-- ----------------------------

-- ----------------------------
-- Table structure for aws_article_comments
-- ----------------------------
DROP TABLE IF EXISTS `aws_article_comments`;
CREATE TABLE `aws_article_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `article_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `at_uid` int(10) DEFAULT NULL,
  `votes` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `article_id` (`article_id`),
  KEY `add_time` (`add_time`),
  KEY `votes` (`votes`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_article_comments
-- ----------------------------

-- ----------------------------
-- Table structure for aws_article_vote
-- ----------------------------
DROP TABLE IF EXISTS `aws_article_vote`;
CREATE TABLE `aws_article_vote` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(10) NOT NULL,
  `rating` tinyint(1) DEFAULT '0',
  `time` int(10) NOT NULL,
  `reputation_factor` int(10) DEFAULT '0',
  `item_uid` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`),
  KEY `time` (`time`),
  KEY `item_uid` (`item_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_article_vote
-- ----------------------------

-- ----------------------------
-- Table structure for aws_attach
-- ----------------------------
DROP TABLE IF EXISTS `aws_attach`;
CREATE TABLE `aws_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `access_key` varchar(32) DEFAULT NULL COMMENT '批次 Key',
  `add_time` int(10) DEFAULT '0' COMMENT '上传时间',
  `file_location` varchar(255) DEFAULT NULL COMMENT '文件位置',
  `is_image` int(1) DEFAULT '0',
  `item_type` varchar(32) DEFAULT '0' COMMENT '关联类型',
  `item_id` bigint(20) DEFAULT '0' COMMENT '关联 ID',
  `wait_approval` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `access_key` (`access_key`),
  KEY `is_image` (`is_image`),
  KEY `fetch` (`item_id`,`item_type`),
  KEY `wait_approval` (`wait_approval`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_attach
-- ----------------------------

-- ----------------------------
-- Table structure for aws_category
-- ----------------------------
DROP TABLE IF EXISTS `aws_category`;
CREATE TABLE `aws_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `url_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `url_token` (`url_token`),
  KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_category
-- ----------------------------
INSERT INTO `aws_category` VALUES ('1', '默认分类', 'question', null, '0', '0', null);

-- ----------------------------
-- Table structure for aws_column
-- ----------------------------
DROP TABLE IF EXISTS `aws_column`;
CREATE TABLE `aws_column` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专栏id',
  `column_name` varchar(64) DEFAULT NULL COMMENT '专栏标题',
  `is_verify` tinyint(1) DEFAULT '0' COMMENT '是否审核通过 （1通过0审核中-1通过）',
  `focus_count` int(11) DEFAULT '0' COMMENT '关注计数',
  `column_description` text COMMENT '专栏描述',
  `column_pic` varchar(255) DEFAULT NULL COMMENT '专栏图片',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `reson` varchar(100) DEFAULT NULL COMMENT '拒绝原因',
  PRIMARY KEY (`column_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='专栏表';

-- ----------------------------
-- Records of aws_column
-- ----------------------------

-- ----------------------------
-- Table structure for aws_column_focus
-- ----------------------------
DROP TABLE IF EXISTS `aws_column_focus`;
CREATE TABLE `aws_column_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `column_id` int(11) DEFAULT NULL COMMENT '专栏ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`focus_id`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`column_id`),
  KEY `topic_uid` (`column_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='专栏关注表';

-- ----------------------------
-- Records of aws_column_focus
-- ----------------------------

-- ----------------------------
-- Table structure for aws_draft
-- ----------------------------
DROP TABLE IF EXISTS `aws_draft`;
CREATE TABLE `aws_draft` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `data` text,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `item_id` (`item_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_draft
-- ----------------------------
INSERT INTO `aws_draft` VALUES ('15', '3', 'question', '1', 'a:1:{s:7:\"message\";s:72:\"爱上对方法发送发大水发发送打发多少打发发送到发达\";}', '1529829517');

-- ----------------------------
-- Table structure for aws_edm_task
-- ----------------------------
DROP TABLE IF EXISTS `aws_edm_task`;
CREATE TABLE `aws_edm_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_edm_task
-- ----------------------------

-- ----------------------------
-- Table structure for aws_edm_taskdata
-- ----------------------------
DROP TABLE IF EXISTS `aws_edm_taskdata`;
CREATE TABLE `aws_edm_taskdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sent_time` int(10) NOT NULL,
  `view_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `sent_time` (`sent_time`),
  KEY `view_time` (`view_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_edm_taskdata
-- ----------------------------

-- ----------------------------
-- Table structure for aws_edm_unsubscription
-- ----------------------------
DROP TABLE IF EXISTS `aws_edm_unsubscription`;
CREATE TABLE `aws_edm_unsubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_edm_unsubscription
-- ----------------------------

-- ----------------------------
-- Table structure for aws_edm_userdata
-- ----------------------------
DROP TABLE IF EXISTS `aws_edm_userdata`;
CREATE TABLE `aws_edm_userdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usergroup` (`usergroup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_edm_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for aws_edm_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `aws_edm_usergroup`;
CREATE TABLE `aws_edm_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_edm_usergroup
-- ----------------------------

-- ----------------------------
-- Table structure for aws_education_experience
-- ----------------------------
DROP TABLE IF EXISTS `aws_education_experience`;
CREATE TABLE `aws_education_experience` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `education_years` int(11) DEFAULT NULL COMMENT '入学年份',
  `school_name` varchar(64) DEFAULT NULL COMMENT '学校名',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '学校类别',
  `departments` varchar(64) DEFAULT NULL COMMENT '院系',
  `add_time` int(10) DEFAULT NULL COMMENT '记录添加时间',
  PRIMARY KEY (`education_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教育经历';

-- ----------------------------
-- Records of aws_education_experience
-- ----------------------------

-- ----------------------------
-- Table structure for aws_favorite
-- ----------------------------
DROP TABLE IF EXISTS `aws_favorite`;
CREATE TABLE `aws_favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `item_id` (`item_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for aws_favorite_tag
-- ----------------------------
DROP TABLE IF EXISTS `aws_favorite_tag`;
CREATE TABLE `aws_favorite_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `item_id` int(11) DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `title` (`title`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_favorite_tag
-- ----------------------------

-- ----------------------------
-- Table structure for aws_feature
-- ----------------------------
DROP TABLE IF EXISTS `aws_feature`;
CREATE TABLE `aws_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '专题标题',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '专题图标',
  `topic_count` int(11) NOT NULL DEFAULT '0' COMMENT '话题计数',
  `css` text COMMENT '自定义CSS',
  `url_token` varchar(32) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `url_token` (`url_token`),
  KEY `title` (`title`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_feature
-- ----------------------------

-- ----------------------------
-- Table structure for aws_feature_topic
-- ----------------------------
DROP TABLE IF EXISTS `aws_feature_topic`;
CREATE TABLE `aws_feature_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题ID',
  `topic_id` int(11) NOT NULL DEFAULT '0' COMMENT '话题ID',
  PRIMARY KEY (`id`),
  KEY `feature_id` (`feature_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_feature_topic
-- ----------------------------

-- ----------------------------
-- Table structure for aws_geo_location
-- ----------------------------
DROP TABLE IF EXISTS `aws_geo_location`;
CREATE TABLE `aws_geo_location` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `add_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_type` (`item_type`),
  KEY `add_time` (`add_time`),
  KEY `geo_location` (`latitude`,`longitude`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_geo_location
-- ----------------------------

-- ----------------------------
-- Table structure for aws_help_chapter
-- ----------------------------
DROP TABLE IF EXISTS `aws_help_chapter`;
CREATE TABLE `aws_help_chapter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url_token` varchar(32) DEFAULT NULL,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `url_token` (`url_token`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='帮助中心';

-- ----------------------------
-- Records of aws_help_chapter
-- ----------------------------

-- ----------------------------
-- Table structure for aws_inbox
-- ----------------------------
DROP TABLE IF EXISTS `aws_inbox`;
CREATE TABLE `aws_inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '发送者 ID',
  `dialog_id` int(11) DEFAULT NULL COMMENT '对话id',
  `message` text COMMENT '内容',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `sender_remove` tinyint(1) DEFAULT '0',
  `recipient_remove` tinyint(1) DEFAULT '0',
  `receipt` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dialog_id` (`dialog_id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `sender_remove` (`sender_remove`),
  KEY `recipient_remove` (`recipient_remove`),
  KEY `sender_receipt` (`receipt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_inbox
-- ----------------------------

-- ----------------------------
-- Table structure for aws_inbox_dialog
-- ----------------------------
DROP TABLE IF EXISTS `aws_inbox_dialog`;
CREATE TABLE `aws_inbox_dialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '对话ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者UID',
  `sender_unread` int(11) DEFAULT NULL COMMENT '发送者未读',
  `recipient_uid` int(11) DEFAULT NULL COMMENT '接收者UID',
  `recipient_unread` int(11) DEFAULT NULL COMMENT '接收者未读',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `sender_count` int(11) DEFAULT NULL COMMENT '发送者显示对话条数',
  `recipient_count` int(11) DEFAULT NULL COMMENT '接收者显示对话条数',
  PRIMARY KEY (`id`),
  KEY `recipient_uid` (`recipient_uid`),
  KEY `sender_uid` (`sender_uid`),
  KEY `update_time` (`update_time`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_inbox_dialog
-- ----------------------------

-- ----------------------------
-- Table structure for aws_integral_log
-- ----------------------------
DROP TABLE IF EXISTS `aws_integral_log`;
CREATE TABLE `aws_integral_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `action` varchar(16) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `balance` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `action` (`action`),
  KEY `time` (`time`),
  KEY `integral` (`integral`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_integral_log
-- ----------------------------
INSERT INTO `aws_integral_log` VALUES ('1', '1', 'REGISTER', '2000', '初始资本', '2000', '0', '1527948664');
INSERT INTO `aws_integral_log` VALUES ('2', '1', 'NEW_QUESTION', '-20', '发起问题 #1', '1980', '1', '1527950522');
INSERT INTO `aws_integral_log` VALUES ('3', '1', 'NEW_QUESTION', '-20', '发起问题 #2', '1960', '2', '1527950544');
INSERT INTO `aws_integral_log` VALUES ('4', '1', 'NEW_QUESTION', '-20', '发起问题 #3', '1940', '3', '1527950570');
INSERT INTO `aws_integral_log` VALUES ('5', '1', 'NEW_QUESTION', '-20', '发起问题 #4', '1920', '4', '1527950588');
INSERT INTO `aws_integral_log` VALUES ('6', '1', 'NEW_QUESTION', '-20', '发起问题 #5', '1900', '5', '1527950606');
INSERT INTO `aws_integral_log` VALUES ('7', '2', 'REGISTER', '2000', '初始资本', '2000', '0', '1527950776');
INSERT INTO `aws_integral_log` VALUES ('8', '3', 'REGISTER', '2000', '初始资本', '2000', '0', '1527983670');
INSERT INTO `aws_integral_log` VALUES ('9', '3', 'NEW_QUESTION', '-20', '发起问题 #6', '1980', '6', '1528296134');
INSERT INTO `aws_integral_log` VALUES ('10', '3', 'NEW_QUESTION', '-20', '发起问题 #7', '1960', '7', '1528642355');
INSERT INTO `aws_integral_log` VALUES ('11', '3', 'NEW_QUESTION', '-20', '发起问题 #8', '1940', '8', '1528643286');
INSERT INTO `aws_integral_log` VALUES ('12', '3', 'NEW_QUESTION', '-20', '发起问题 #9', '1920', '9', '1528643472');
INSERT INTO `aws_integral_log` VALUES ('13', '3', 'NEW_QUESTION', '-20', '发起问题 #10', '1900', '10', '1528643620');
INSERT INTO `aws_integral_log` VALUES ('14', '3', 'NEW_QUESTION', '-20', '发起问题 #11', '1880', '11', '1528644180');
INSERT INTO `aws_integral_log` VALUES ('15', '3', 'NEW_QUESTION', '-20', '发起问题 #12', '1860', '12', '1529300699');
INSERT INTO `aws_integral_log` VALUES ('16', '3', 'NEW_QUESTION', '-20', '发起问题 #13', '1840', '13', '1529303371');
INSERT INTO `aws_integral_log` VALUES ('17', '3', 'NEW_QUESTION', '-20', '发起问题 #14', '1820', '14', '1529829418');
INSERT INTO `aws_integral_log` VALUES ('18', '4', 'REGISTER', '2000', '初始资本', '2000', '0', '1533382693');

-- ----------------------------
-- Table structure for aws_invitation
-- ----------------------------
DROP TABLE IF EXISTS `aws_invitation`;
CREATE TABLE `aws_invitation` (
  `invitation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '激活ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `invitation_code` varchar(32) DEFAULT NULL COMMENT '激活码',
  `invitation_email` varchar(255) DEFAULT NULL COMMENT '激活email',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `add_ip` bigint(12) DEFAULT NULL COMMENT '添加IP',
  `active_expire` tinyint(1) DEFAULT '0' COMMENT '激活过期',
  `active_time` int(10) DEFAULT NULL COMMENT '激活时间',
  `active_ip` bigint(12) DEFAULT NULL COMMENT '激活IP',
  `active_status` tinyint(4) DEFAULT '0' COMMENT '1已使用0未使用-1已删除',
  `active_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `uid` (`uid`),
  KEY `invitation_code` (`invitation_code`),
  KEY `invitation_email` (`invitation_email`),
  KEY `active_time` (`active_time`),
  KEY `active_ip` (`active_ip`),
  KEY `active_status` (`active_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_invitation
-- ----------------------------

-- ----------------------------
-- Table structure for aws_jobs
-- ----------------------------
DROP TABLE IF EXISTS `aws_jobs`;
CREATE TABLE `aws_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(64) DEFAULT NULL COMMENT '职位名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_jobs
-- ----------------------------
INSERT INTO `aws_jobs` VALUES ('1', '销售');
INSERT INTO `aws_jobs` VALUES ('2', '市场/市场拓展/公关');
INSERT INTO `aws_jobs` VALUES ('3', '商务/采购/贸易');
INSERT INTO `aws_jobs` VALUES ('4', '计算机软、硬件/互联网/IT');
INSERT INTO `aws_jobs` VALUES ('5', '电子/半导体/仪表仪器');
INSERT INTO `aws_jobs` VALUES ('6', '通信技术');
INSERT INTO `aws_jobs` VALUES ('7', '客户服务/技术支持');
INSERT INTO `aws_jobs` VALUES ('8', '行政/后勤');
INSERT INTO `aws_jobs` VALUES ('9', '人力资源');
INSERT INTO `aws_jobs` VALUES ('10', '高级管理');
INSERT INTO `aws_jobs` VALUES ('11', '生产/加工/制造');
INSERT INTO `aws_jobs` VALUES ('12', '质控/安检');
INSERT INTO `aws_jobs` VALUES ('13', '工程机械');
INSERT INTO `aws_jobs` VALUES ('14', '技工');
INSERT INTO `aws_jobs` VALUES ('15', '财会/审计/统计');
INSERT INTO `aws_jobs` VALUES ('16', '金融/银行/保险/证券/投资');
INSERT INTO `aws_jobs` VALUES ('17', '建筑/房地产/装修/物业');
INSERT INTO `aws_jobs` VALUES ('18', '交通/仓储/物流');
INSERT INTO `aws_jobs` VALUES ('19', '普通劳动力/家政服务');
INSERT INTO `aws_jobs` VALUES ('20', '零售业');
INSERT INTO `aws_jobs` VALUES ('21', '教育/培训');
INSERT INTO `aws_jobs` VALUES ('22', '咨询/顾问');
INSERT INTO `aws_jobs` VALUES ('23', '学术/科研');
INSERT INTO `aws_jobs` VALUES ('24', '法律');
INSERT INTO `aws_jobs` VALUES ('25', '美术/设计/创意');
INSERT INTO `aws_jobs` VALUES ('26', '编辑/文案/传媒/影视/新闻');
INSERT INTO `aws_jobs` VALUES ('27', '酒店/餐饮/旅游/娱乐');
INSERT INTO `aws_jobs` VALUES ('28', '化工');
INSERT INTO `aws_jobs` VALUES ('29', '能源/矿产/地质勘查');
INSERT INTO `aws_jobs` VALUES ('30', '医疗/护理/保健/美容');
INSERT INTO `aws_jobs` VALUES ('31', '生物/制药/医疗器械');
INSERT INTO `aws_jobs` VALUES ('32', '翻译（口译与笔译）');
INSERT INTO `aws_jobs` VALUES ('33', '公务员');
INSERT INTO `aws_jobs` VALUES ('34', '环境科学/环保');
INSERT INTO `aws_jobs` VALUES ('35', '农/林/牧/渔业');
INSERT INTO `aws_jobs` VALUES ('36', '兼职/临时/培训生/储备干部');
INSERT INTO `aws_jobs` VALUES ('37', '在校学生');
INSERT INTO `aws_jobs` VALUES ('38', '其他');

-- ----------------------------
-- Table structure for aws_mail_queue
-- ----------------------------
DROP TABLE IF EXISTS `aws_mail_queue`;
CREATE TABLE `aws_mail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_to` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_error` tinyint(1) NOT NULL DEFAULT '0',
  `error_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_error` (`is_error`),
  KEY `send_to` (`send_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_mail_queue
-- ----------------------------

-- ----------------------------
-- Table structure for aws_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `aws_nav_menu`;
CREATE TABLE `aws_nav_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `type_id` int(11) DEFAULT '0',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`link`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_nav_menu
-- ----------------------------

-- ----------------------------
-- Table structure for aws_notification
-- ----------------------------
DROP TABLE IF EXISTS `aws_notification`;
CREATE TABLE `aws_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者ID',
  `recipient_uid` int(11) DEFAULT '0' COMMENT '接收者ID',
  `action_type` int(4) DEFAULT NULL COMMENT '操作类型',
  `model_type` smallint(11) NOT NULL DEFAULT '0',
  `source_id` varchar(16) NOT NULL DEFAULT '0' COMMENT '关联 ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `read_flag` tinyint(1) DEFAULT '0' COMMENT '阅读状态',
  PRIMARY KEY (`notification_id`),
  KEY `recipient_read_flag` (`recipient_uid`,`read_flag`),
  KEY `sender_uid` (`sender_uid`),
  KEY `model_type` (`model_type`),
  KEY `source_id` (`source_id`),
  KEY `action_type` (`action_type`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统通知';

-- ----------------------------
-- Records of aws_notification
-- ----------------------------

-- ----------------------------
-- Table structure for aws_notification_data
-- ----------------------------
DROP TABLE IF EXISTS `aws_notification_data`;
CREATE TABLE `aws_notification_data` (
  `notification_id` int(11) unsigned NOT NULL,
  `data` text,
  PRIMARY KEY (`notification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统通知数据表';

-- ----------------------------
-- Records of aws_notification_data
-- ----------------------------

-- ----------------------------
-- Table structure for aws_pages
-- ----------------------------
DROP TABLE IF EXISTS `aws_pages`;
CREATE TABLE `aws_pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url_token` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contents` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_token` (`url_token`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_pages
-- ----------------------------

-- ----------------------------
-- Table structure for aws_payment
-- ----------------------------
DROP TABLE IF EXISTS `aws_payment`;
CREATE TABLE `aws_payment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `amount` double NOT NULL,
  `time` int(10) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_id` bigint(16) NOT NULL,
  `terrace_id` varchar(64) DEFAULT NULL,
  `payment_id` varchar(16) DEFAULT '',
  `source` varchar(16) NOT NULL DEFAULT '',
  `extra_param` text,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `terrace_id` (`terrace_id`),
  KEY `time` (`time`),
  KEY `payment_id` (`payment_id`),
  KEY `order_id` (`order_id`),
  KEY `source` (`source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_payment
-- ----------------------------

-- ----------------------------
-- Table structure for aws_pay_account
-- ----------------------------
DROP TABLE IF EXISTS `aws_pay_account`;
CREATE TABLE `aws_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  `zxid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_pay_account
-- ----------------------------
INSERT INTO `aws_pay_account` VALUES ('1', '2018060623022859822', '3', '', '', '', '', '0.00', '', '1', '1528297348', '0', '', '0', 'recharge', '', '1', '127.0.0.1', 'unpay', '', '0');
INSERT INTO `aws_pay_account` VALUES ('2', '2018061023022511047', '3', '', '', '', '', '0.00', '', '1', '1528642945', '0', '', '0', 'recharge', '', '1', '127.0.0.1', 'succ', '', '0');
INSERT INTO `aws_pay_account` VALUES ('3', '2018061813450114496', '3', '', 'VIP1咨询服务', '', '', '0.00', '29.9', '1', '1529300701', '0', '', '0', 'recharge', '', '1', '127.0.0.1', 'unpay', '', '12');
INSERT INTO `aws_pay_account` VALUES ('4', '2018061814293348956', '3', '', 'VIP1咨询服务', '', '', '0.00', '29.9', '1', '1529303373', '0', '', '0', 'recharge', '', '1', '127.0.0.1', 'unpay', '', '13');

-- ----------------------------
-- Table structure for aws_posts_index
-- ----------------------------
DROP TABLE IF EXISTS `aws_posts_index`;
CREATE TABLE `aws_posts_index` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `post_id` int(10) NOT NULL,
  `post_type` varchar(16) NOT NULL DEFAULT '',
  `add_time` int(10) NOT NULL,
  `update_time` int(10) DEFAULT '0',
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `view_count` int(10) DEFAULT '0',
  `anonymous` tinyint(1) DEFAULT '0',
  `popular_value` int(10) DEFAULT '0',
  `uid` int(10) NOT NULL,
  `lock` tinyint(1) DEFAULT '0',
  `agree_count` int(10) DEFAULT '0',
  `answer_count` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `post_type` (`post_type`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`),
  KEY `category_id` (`category_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `anonymous` (`anonymous`),
  KEY `popular_value` (`popular_value`),
  KEY `uid` (`uid`),
  KEY `lock` (`lock`),
  KEY `agree_count` (`agree_count`),
  KEY `answer_count` (`answer_count`),
  KEY `view_count` (`view_count`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_posts_index
-- ----------------------------
INSERT INTO `aws_posts_index` VALUES ('1', '1', 'question', '1527950522', '1527950522', '1', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('2', '2', 'question', '1527950544', '1527950544', '1', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('3', '3', 'question', '1527950570', '1527950570', '1', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('4', '4', 'question', '1527950588', '1527950588', '1', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('5', '5', 'question', '1527950606', '1527950606', '1', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('12', '12', 'question', '1529300699', '1529300699', '1', '0', '0', '0', '0', '3', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('13', '13', 'question', '1529303371', '1529303371', '1', '0', '0', '0', '0', '3', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('14', '14', 'question', '1529829417', '1529829417', '1', '0', '0', '0', '0', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for aws_product_order
-- ----------------------------
DROP TABLE IF EXISTS `aws_product_order`;
CREATE TABLE `aws_product_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `payment_order_id` bigint(16) NOT NULL DEFAULT '0',
  `product_id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  `project_title` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(64) DEFAULT NULL,
  `shipping_province` varchar(64) DEFAULT NULL,
  `shipping_city` varchar(64) DEFAULT NULL,
  `shipping_mobile` varchar(16) DEFAULT NULL,
  `shipping_zipcode` int(10) DEFAULT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `refund_time` int(10) NOT NULL DEFAULT '0',
  `shipping_time` int(10) NOT NULL DEFAULT '0',
  `is_donate` tinyint(1) NOT NULL DEFAULT '0',
  `track_no` varchar(32) NOT NULL DEFAULT '',
  `track_branch` varchar(64) NOT NULL DEFAULT '',
  `note` text,
  `payment_time` int(10) NOT NULL DEFAULT '0',
  `product_title` varchar(255) NOT NULL DEFAULT '',
  `cancel_time` int(10) NOT NULL DEFAULT '0',
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `project_type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `product_id` (`product_id`),
  KEY `project_id` (`project_id`),
  KEY `payment_order_id` (`payment_order_id`),
  KEY `track_no` (`track_no`),
  KEY `is_donate` (`is_donate`),
  KEY `refund_time` (`refund_time`),
  KEY `add_time` (`add_time`),
  KEY `payment_time` (`payment_time`),
  KEY `cancel_time` (`cancel_time`),
  KEY `project_type` (`project_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_product_order
-- ----------------------------

-- ----------------------------
-- Table structure for aws_project
-- ----------------------------
DROP TABLE IF EXISTS `aws_project`;
CREATE TABLE `aws_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `open_notify` int(10) NOT NULL DEFAULT '0',
  `close_noify` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `category_id` int(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `country` varchar(16) NOT NULL,
  `province` varchar(16) NOT NULL,
  `city` varchar(16) DEFAULT NULL,
  `summary` text,
  `description` text,
  `start_time` int(10) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `contact` text,
  `paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sponsored_users` int(10) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `views` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `discuss_count` int(10) NOT NULL DEFAULT '0',
  `status` varchar(16) DEFAULT NULL,
  `like_count` int(10) NOT NULL DEFAULT '0',
  `video_link` varchar(255) NOT NULL DEFAULT '',
  `project_type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `open_notify` (`open_notify`),
  KEY `close_noify` (`close_noify`),
  KEY `category_id` (`category_id`),
  KEY `title` (`title`),
  KEY `country` (`country`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `amount` (`amount`),
  KEY `paid` (`paid`),
  KEY `approved` (`approved`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `views` (`views`),
  KEY `update_time` (`update_time`),
  KEY `discuss_count` (`discuss_count`),
  KEY `sponsored_users` (`sponsored_users`),
  KEY `status` (`status`),
  KEY `like_count` (`like_count`),
  KEY `project_type` (`project_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_project
-- ----------------------------

-- ----------------------------
-- Table structure for aws_project_like
-- ----------------------------
DROP TABLE IF EXISTS `aws_project_like`;
CREATE TABLE `aws_project_like` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_project_like
-- ----------------------------

-- ----------------------------
-- Table structure for aws_project_product
-- ----------------------------
DROP TABLE IF EXISTS `aws_project_product`;
CREATE TABLE `aws_project_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` int(10) NOT NULL DEFAULT '0',
  `description` text,
  `project_id` int(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `amount` (`amount`),
  KEY `project_id` (`project_id`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_project_product
-- ----------------------------

-- ----------------------------
-- Table structure for aws_question
-- ----------------------------
DROP TABLE IF EXISTS `aws_question`;
CREATE TABLE `aws_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_content` varchar(255) NOT NULL DEFAULT '' COMMENT '问题内容',
  `question_detail` text COMMENT '问题说明',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  `published_uid` int(11) DEFAULT NULL COMMENT '发布用户UID',
  `answer_count` int(11) NOT NULL DEFAULT '0' COMMENT '回答计数',
  `answer_users` int(11) NOT NULL DEFAULT '0' COMMENT '回答人数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `focus_count` int(11) NOT NULL DEFAULT '0' COMMENT '关注数',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `action_history_id` int(11) NOT NULL DEFAULT '0' COMMENT '动作的记录表的关连id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类 ID',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '回复赞同数总和',
  `against_count` int(11) NOT NULL DEFAULT '0' COMMENT '回复反对数总和',
  `best_answer` int(11) NOT NULL DEFAULT '0' COMMENT '最佳回复 ID',
  `has_attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存在附件',
  `unverified_modify` text,
  `unverified_modify_count` int(10) NOT NULL DEFAULT '0',
  `ip` bigint(11) DEFAULT NULL,
  `last_answer` int(11) NOT NULL DEFAULT '0' COMMENT '最后回答 ID',
  `popular_value` double NOT NULL DEFAULT '0',
  `popular_value_update` int(10) NOT NULL DEFAULT '0',
  `lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `thanks_count` int(10) NOT NULL DEFAULT '0',
  `question_content_fulltext` text,
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0',
  `weibo_msg_id` bigint(20) DEFAULT NULL,
  `received_email_id` int(10) DEFAULT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(10) unsigned DEFAULT NULL,
  `question_mobile` varchar(255) DEFAULT NULL,
  `provid` int(6) DEFAULT NULL,
  `cityid` int(6) DEFAULT NULL,
  `qxid` int(6) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `category_id` (`category_id`),
  KEY `update_time` (`update_time`),
  KEY `add_time` (`add_time`),
  KEY `published_uid` (`published_uid`),
  KEY `answer_count` (`answer_count`),
  KEY `agree_count` (`agree_count`),
  KEY `question_content` (`question_content`),
  KEY `lock` (`lock`),
  KEY `thanks_count` (`thanks_count`),
  KEY `anonymous` (`anonymous`),
  KEY `popular_value` (`popular_value`),
  KEY `best_answer` (`best_answer`),
  KEY `popular_value_update` (`popular_value_update`),
  KEY `against_count` (`against_count`),
  KEY `is_recommend` (`is_recommend`),
  KEY `weibo_msg_id` (`weibo_msg_id`),
  KEY `received_email_id` (`received_email_id`),
  KEY `unverified_modify_count` (`unverified_modify_count`),
  KEY `chapter_id` (`chapter_id`),
  KEY `sort` (`sort`),
  KEY `ticket_id` (`ticket_id`),
  FULLTEXT KEY `question_content_fulltext` (`question_content_fulltext`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='问题列表';

-- ----------------------------
-- Records of aws_question
-- ----------------------------
INSERT INTO `aws_question` VALUES ('1', '储蓄卡上的钱被莫名转走了', '我自己通过手机操作把钱转到自己的储蓄卡上后，储蓄卡上的钱又被莫名的转走了，而没有收到任何短信提醒和通知，请问这个是银行的责任吗？可以起诉银行要求赔偿吗？', '1527950522', '1527950522', '1', '0', '0', '19', '1', '0', '0', '1', '0', '0', '0', '0', null, '0', '1020328429', '0', '2', '1528257619', '0', '0', '0', '2064833988 2134519978 3370721517', '0', null, null, null, '0', null, '15066158017', '17', '261', null);
INSERT INTO `aws_question` VALUES ('2', '我女儿被别家小孩推倒摔成骨折', '我家小孩在和人家一个小女孩玩，具我女儿说被她推倒胳膊摔骨折花了3万左右，对方不认账怎么办？', '1527950544', '1527950544', '1', '0', '0', '32', '1', '0', '0', '1', '0', '0', '0', '0', null, '0', '1020328429', '0', '2.3424226808222', '1528257614', '0', '0', '0', '2289920799 2103523478 2356723401 2551220498 2568425104 3959225240', '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `aws_question` VALUES ('3', '父亲和我大哥口头协议 要把村原来是分给我和父亲宅基地给了哥', '父亲和我大哥口头协议 要把村原来是分给我和父亲宅基地给了哥 并且多人做证 我有村里分给我和父亲的物证 哥无物证上法院会受理吗 假如受理谁胜算大?', '1527950570', '1527950570', '1', '0', '0', '27', '1', '0', '0', '1', '0', '0', '0', '0', null, '0', '1020328429', '0', '2.4149733479708', '1528292200', '0', '0', '0', '2923820146 2164425105 2282321733 2147522836 2132735758 3520125226 2140726469 2099832473 2510521644 234292252222320', '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `aws_question` VALUES ('4', '饭店雇佣童工不给钱应该怎么处理？', '饭店雇佣童工不给钱应该怎么处理？', '1527950588', '1527950588', '1', '0', '0', '27', '1', '0', '0', '1', '0', '0', '0', '0', null, '0', '1020328429', '0', '2.4149733479708', '1528641021', '0', '0', '0', '3927724215 3859920323 3146124037 3247338065 2421235813 2278829702', '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `aws_question` VALUES ('5', '赔偿收据怎么写？具体格式', '私了要赔40%，不是一次性给完，每次对方在医院交钱，我都要去给40%，很麻烦。可不可以，交钱时，对方先出，我把小票发票拿走，我直接给对方的银行卡里打钱，这样就有了转账记录，再让对方写两张收据，一式两份。这个每次要付40%的收据，具体怎么写？', '1527950606', '1527950606', '1', '0', '0', '43', '1', '0', '0', '1', '0', '0', '0', '0', null, '0', '1020328429', '0', '2.6232492903979', '1529303356', '0', '0', '0', '3618020607 2591025454 2085520307 2668424335', '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `aws_question` VALUES ('12', '发达按时发生发送大法...', '发达按时发生发送大法师打发送到发', '1529300699', '1529300699', '3', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', null, '0', '2130706433', '0', '0', '0', '0', '0', '0', '2145736798 2535326102 2145729983 2145736865 2282327861 ', '0', null, null, null, '0', null, '15066158017', '17', '261', '0');
INSERT INTO `aws_question` VALUES ('13', '范德萨打法大大发发呆...', '范德萨打法大大发发呆发生的发多少发多少发达的', '1529303371', '1529303371', '3', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', null, '0', '2130706433', '0', '0', '0', '0', '0', '0', '3353924503 2517127861 2282321457 2145721574 ', '0', null, null, null, '0', null, '15066158011', '17', '261', '0');
INSERT INTO `aws_question` VALUES ('14', '爱上对方法发送发大水...', '爱上对方法发送发大水发发送打发多少打发发送到发达', '1529829417', '1529829417', '3', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', null, '0', '2130706433', '0', '0', '0', '0', '0', '0', '2923319978 2604127861 2145736865 2282327700 ', '0', null, null, null, '0', null, '15066158011', '17', '261', '0');

-- ----------------------------
-- Table structure for aws_question_comments
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_comments`;
CREATE TABLE `aws_question_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_question_comments
-- ----------------------------

-- ----------------------------
-- Table structure for aws_question_focus
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_focus`;
CREATE TABLE `aws_question_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`focus_id`),
  KEY `question_id` (`question_id`),
  KEY `question_uid` (`question_id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='问题关注表';

-- ----------------------------
-- Records of aws_question_focus
-- ----------------------------
INSERT INTO `aws_question_focus` VALUES ('1', '1', '1', '1527950522');
INSERT INTO `aws_question_focus` VALUES ('2', '2', '1', '1527950544');
INSERT INTO `aws_question_focus` VALUES ('3', '3', '1', '1527950570');
INSERT INTO `aws_question_focus` VALUES ('4', '4', '1', '1527950588');
INSERT INTO `aws_question_focus` VALUES ('5', '5', '1', '1527950606');
INSERT INTO `aws_question_focus` VALUES ('12', '12', '3', '1529300699');
INSERT INTO `aws_question_focus` VALUES ('13', '13', '3', '1529303371');
INSERT INTO `aws_question_focus` VALUES ('14', '14', '3', '1529829418');

-- ----------------------------
-- Table structure for aws_question_invite
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_invite`;
CREATE TABLE `aws_question_invite` (
  `question_invite_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) NOT NULL COMMENT '问题ID',
  `sender_uid` int(11) NOT NULL,
  `recipients_uid` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '受邀Email',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `available_time` int(10) DEFAULT '0' COMMENT '生效时间',
  PRIMARY KEY (`question_invite_id`),
  KEY `question_id` (`question_id`),
  KEY `sender_uid` (`sender_uid`),
  KEY `recipients_uid` (`recipients_uid`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请问答';

-- ----------------------------
-- Records of aws_question_invite
-- ----------------------------

-- ----------------------------
-- Table structure for aws_question_thanks
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_thanks`;
CREATE TABLE `aws_question_thanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `question_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_question_thanks
-- ----------------------------

-- ----------------------------
-- Table structure for aws_question_uninterested
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_uninterested`;
CREATE TABLE `aws_question_uninterested` (
  `interested_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`interested_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问题不感兴趣表';

-- ----------------------------
-- Records of aws_question_uninterested
-- ----------------------------

-- ----------------------------
-- Table structure for aws_received_email
-- ----------------------------
DROP TABLE IF EXISTS `aws_received_email`;
CREATE TABLE `aws_received_email` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `message_id` varchar(255) NOT NULL,
  `date` int(10) NOT NULL,
  `from` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `question_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `config_id` (`config_id`),
  KEY `message_id` (`message_id`),
  KEY `date` (`date`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='已导入邮件列表';

-- ----------------------------
-- Records of aws_received_email
-- ----------------------------

-- ----------------------------
-- Table structure for aws_receiving_email_config
-- ----------------------------
DROP TABLE IF EXISTS `aws_receiving_email_config`;
CREATE TABLE `aws_receiving_email_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(10) NOT NULL,
  `server` varchar(255) NOT NULL,
  `ssl` tinyint(1) NOT NULL DEFAULT '0',
  `port` smallint(5) DEFAULT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid` int(10) NOT NULL,
  `access_key` varchar(32) NOT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `server` (`server`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件账号列表';

-- ----------------------------
-- Records of aws_receiving_email_config
-- ----------------------------

-- ----------------------------
-- Table structure for aws_redirect
-- ----------------------------
DROP TABLE IF EXISTS `aws_redirect`;
CREATE TABLE `aws_redirect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT '0',
  `target_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_redirect
-- ----------------------------

-- ----------------------------
-- Table structure for aws_related_links
-- ----------------------------
DROP TABLE IF EXISTS `aws_related_links`;
CREATE TABLE `aws_related_links` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `link` varchar(255) NOT NULL,
  `add_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `item_type` (`item_type`),
  KEY `item_id` (`item_id`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_related_links
-- ----------------------------

-- ----------------------------
-- Table structure for aws_related_topic
-- ----------------------------
DROP TABLE IF EXISTS `aws_related_topic`;
CREATE TABLE `aws_related_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT '0' COMMENT '话题 ID',
  `related_id` int(11) DEFAULT '0' COMMENT '相关话题 ID',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `related_id` (`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_related_topic
-- ----------------------------

-- ----------------------------
-- Table structure for aws_report
-- ----------------------------
DROP TABLE IF EXISTS `aws_report`;
CREATE TABLE `aws_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '举报用户id',
  `type` varchar(50) DEFAULT NULL COMMENT '类别',
  `target_id` int(11) DEFAULT '0' COMMENT 'ID',
  `reason` varchar(255) DEFAULT NULL COMMENT '举报理由',
  `url` varchar(255) DEFAULT NULL,
  `add_time` int(11) DEFAULT '0' COMMENT '举报时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否处理',
  PRIMARY KEY (`id`),
  KEY `add_time` (`add_time`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_report
-- ----------------------------

-- ----------------------------
-- Table structure for aws_reputation_category
-- ----------------------------
DROP TABLE IF EXISTS `aws_reputation_category`;
CREATE TABLE `aws_reputation_category` (
  `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `category_id` smallint(4) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  `reputation` int(10) DEFAULT '0',
  `thanks_count` int(10) DEFAULT '0',
  `agree_count` int(10) DEFAULT '0',
  `question_count` int(10) DEFAULT '0',
  PRIMARY KEY (`auto_id`),
  UNIQUE KEY `uid_category_id` (`uid`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_reputation_category
-- ----------------------------

-- ----------------------------
-- Table structure for aws_reputation_topic
-- ----------------------------
DROP TABLE IF EXISTS `aws_reputation_topic`;
CREATE TABLE `aws_reputation_topic` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题ID',
  `topic_count` int(10) DEFAULT '0' COMMENT '威望问题话题计数',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `agree_count` int(10) DEFAULT '0' COMMENT '赞成',
  `thanks_count` int(10) DEFAULT '0' COMMENT '感谢',
  `reputation` int(10) DEFAULT '0',
  PRIMARY KEY (`auto_id`),
  KEY `topic_count` (`topic_count`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`topic_id`),
  KEY `reputation` (`reputation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_reputation_topic
-- ----------------------------

-- ----------------------------
-- Table structure for aws_school
-- ----------------------------
DROP TABLE IF EXISTS `aws_school`;
CREATE TABLE `aws_school` (
  `school_id` int(11) NOT NULL COMMENT '自增ID',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '学校类型ID',
  `school_code` int(11) DEFAULT NULL COMMENT '学校编码',
  `school_name` varchar(64) DEFAULT NULL COMMENT '学校名称',
  `area_code` int(11) DEFAULT NULL COMMENT '地区代码',
  PRIMARY KEY (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学校';

-- ----------------------------
-- Records of aws_school
-- ----------------------------

-- ----------------------------
-- Table structure for aws_search_cache
-- ----------------------------
DROP TABLE IF EXISTS `aws_search_cache`;
CREATE TABLE `aws_search_cache` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL,
  `data` mediumtext NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_search_cache
-- ----------------------------

-- ----------------------------
-- Table structure for aws_sessions
-- ----------------------------
DROP TABLE IF EXISTS `aws_sessions`;
CREATE TABLE `aws_sessions` (
  `id` varchar(32) NOT NULL,
  `modified` int(10) NOT NULL,
  `data` text NOT NULL,
  `lifetime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modified` (`modified`),
  KEY `lifetime` (`lifetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_sessions
-- ----------------------------
INSERT INTO `aws_sessions` VALUES ('i2j7u890elk287og1lgshvdp10', '1533395567', 'neb__Anwsion|a:4:{s:13:\"find_password\";N;s:11:\"admin_login\";N;s:11:\"client_info\";a:3:{s:12:\"__CLIENT_UID\";i:4;s:18:\"__CLIENT_USER_NAME\";s:8:\"xiaochao\";s:17:\"__CLIENT_PASSWORD\";s:32:\"834240961e515157439d2232f926b9d6\";}s:10:\"permission\";a:3:{s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:19:\"question_valid_hour\";s:2:\"10\";s:17:\"answer_valid_hour\";s:2:\"10\";}}neb__Captcha|a:1:{s:4:\"word\";s:4:\"r92e\";}', '1440');
INSERT INTO `aws_sessions` VALUES ('2jaaegp7ljfvqvtpisu0lb6oe3', '1533395666', 'neb__Anwsion|a:2:{s:11:\"client_info\";a:3:{s:12:\"__CLIENT_UID\";i:3;s:18:\"__CLIENT_USER_NAME\";s:6:\"manage\";s:17:\"__CLIENT_PASSWORD\";s:32:\"361b62b151756b860112d867c2436203\";}s:10:\"permission\";a:15:{s:16:\"is_administortar\";s:1:\"1\";s:12:\"is_moderator\";s:1:\"1\";s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:12:\"edit_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}}', '1440');

-- ----------------------------
-- Table structure for aws_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `aws_system_setting`;
CREATE TABLE `aws_system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `varname` varchar(255) NOT NULL COMMENT '字段名',
  `value` text COMMENT '变量值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `varname` (`varname`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='系统设置';

-- ----------------------------
-- Records of aws_system_setting
-- ----------------------------
INSERT INTO `aws_system_setting` VALUES ('1', 'project_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('2', 'alipay_partner', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('3', 'alipay_key', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('4', 'alipay_seller_email', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('5', 'alipay_sign_type', 's:3:\"MD5\";');
INSERT INTO `aws_system_setting` VALUES ('6', 'alipay_input_charset', 's:5:\"utf-8\";');
INSERT INTO `aws_system_setting` VALUES ('7', 'alipay_transport', 's:5:\"https\";');
INSERT INTO `aws_system_setting` VALUES ('8', 'alipay_private_key', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('9', 'alipay_ali_public_key', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('10', 'ticket_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('11', 'db_engine', 's:6:\"MyISAM\";');
INSERT INTO `aws_system_setting` VALUES ('12', 'site_name', 's:9:\"律问网\";');
INSERT INTO `aws_system_setting` VALUES ('13', 'description', 's:69:\"有问题来律问网站问律师，在线律师为您排忧解难。\";');
INSERT INTO `aws_system_setting` VALUES ('14', 'keywords', 's:38:\"律师网站,咨询律师,在线律师\";');
INSERT INTO `aws_system_setting` VALUES ('15', 'sensitive_words', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('16', 'def_focus_uids', 's:1:\"1\";');
INSERT INTO `aws_system_setting` VALUES ('17', 'answer_edit_time', 's:2:\"30\";');
INSERT INTO `aws_system_setting` VALUES ('18', 'cache_level_high', 's:2:\"60\";');
INSERT INTO `aws_system_setting` VALUES ('19', 'cache_level_normal', 's:3:\"600\";');
INSERT INTO `aws_system_setting` VALUES ('20', 'cache_level_low', 's:4:\"1800\";');
INSERT INTO `aws_system_setting` VALUES ('21', 'unread_flush_interval', 's:3:\"100\";');
INSERT INTO `aws_system_setting` VALUES ('22', 'newer_invitation_num', 's:1:\"5\";');
INSERT INTO `aws_system_setting` VALUES ('23', 'index_per_page', 's:2:\"20\";');
INSERT INTO `aws_system_setting` VALUES ('24', 'from_email', 's:19:\"wupeng@lvwen360.com\";');
INSERT INTO `aws_system_setting` VALUES ('25', 'img_url', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('26', 'upload_url', 's:32:\"https://www.lvwen360.com/uploads\";');
INSERT INTO `aws_system_setting` VALUES ('27', 'upload_dir', 's:34:\"D:/wwwroot/lvwen360com/web/uploads\";');
INSERT INTO `aws_system_setting` VALUES ('28', 'ui_style', 's:7:\"default\";');
INSERT INTO `aws_system_setting` VALUES ('29', 'uninterested_fold', 's:1:\"5\";');
INSERT INTO `aws_system_setting` VALUES ('30', 'sina_akey\', NULL', '');
INSERT INTO `aws_system_setting` VALUES ('31', 'sina_skey\', NULL', '');
INSERT INTO `aws_system_setting` VALUES ('32', 'sina_weibo_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('33', 'answer_unique', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('34', 'notifications_per_page', 's:2:\"10\";');
INSERT INTO `aws_system_setting` VALUES ('35', 'contents_per_page', 's:2:\"10\";');
INSERT INTO `aws_system_setting` VALUES ('36', 'hot_question_period', 's:1:\"7\";');
INSERT INTO `aws_system_setting` VALUES ('37', 'category_display_mode', 's:4:\"icon\";');
INSERT INTO `aws_system_setting` VALUES ('38', 'recommend_users_number', 's:1:\"6\";');
INSERT INTO `aws_system_setting` VALUES ('39', 'ucenter_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('40', 'register_valid_type', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('41', 'best_answer_day', 's:2:\"30\";');
INSERT INTO `aws_system_setting` VALUES ('42', 'answer_self_question', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('43', 'censoruser', 's:5:\"admin\";');
INSERT INTO `aws_system_setting` VALUES ('44', 'best_answer_min_count', 's:1:\"3\";');
INSERT INTO `aws_system_setting` VALUES ('45', 'reputation_function', 's:78:\"[最佳答案]*3+[赞同]*1-[反对]*1+[发起者赞同]*2-[发起者反对]*1\";');
INSERT INTO `aws_system_setting` VALUES ('46', 'db_version', 's:8:\"20180601\";');
INSERT INTO `aws_system_setting` VALUES ('47', 'statistic_code', 's:271:\"<script>\nvar _hmt = _hmt || [];\n(function() {\n  var hm = document.createElement(\"script\");\n  hm.src = \"https://hm.baidu.com/hm.js?5009598ab92af8822d40e0f72cdc9ade\";\n  var s = document.getElementsByTagName(\"script\")[0]; \n  s.parentNode.insertBefore(hm, s);\n})();\n</script>\";');
INSERT INTO `aws_system_setting` VALUES ('48', 'upload_enable', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('49', 'answer_length_lower', 's:1:\"2\";');
INSERT INTO `aws_system_setting` VALUES ('50', 'quick_publish', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('51', 'register_type', 's:5:\"close\";');
INSERT INTO `aws_system_setting` VALUES ('52', 'question_title_limit', 's:3:\"100\";');
INSERT INTO `aws_system_setting` VALUES ('53', 'register_seccode', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('54', 'admin_login_seccode', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('55', 'comment_limit', 's:1:\"0\";');
INSERT INTO `aws_system_setting` VALUES ('56', 'backup_dir', '');
INSERT INTO `aws_system_setting` VALUES ('57', 'best_answer_reput', 's:2:\"20\";');
INSERT INTO `aws_system_setting` VALUES ('58', 'publisher_reputation_factor', 's:2:\"10\";');
INSERT INTO `aws_system_setting` VALUES ('59', 'request_route_custom', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('60', 'upload_size_limit', 's:3:\"512\";');
INSERT INTO `aws_system_setting` VALUES ('61', 'upload_avatar_size_limit', 's:3:\"512\";');
INSERT INTO `aws_system_setting` VALUES ('62', 'topic_title_limit', 's:2:\"12\";');
INSERT INTO `aws_system_setting` VALUES ('63', 'url_rewrite_enable', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('64', 'best_agree_min_count', 's:1:\"3\";');
INSERT INTO `aws_system_setting` VALUES ('65', 'site_close', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('66', 'close_notice', 's:39:\"站点已关闭，管理员请登录。\";');
INSERT INTO `aws_system_setting` VALUES ('67', 'qq_login_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('68', 'qq_login_app_id', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('69', 'qq_login_app_key', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('70', 'integral_system_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('71', 'integral_system_config_register', 's:4:\"2000\";');
INSERT INTO `aws_system_setting` VALUES ('72', 'integral_system_config_profile', 's:3:\"100\";');
INSERT INTO `aws_system_setting` VALUES ('73', 'integral_system_config_invite', 's:3:\"200\";');
INSERT INTO `aws_system_setting` VALUES ('74', 'integral_system_config_best_answer', 's:3:\"200\";');
INSERT INTO `aws_system_setting` VALUES ('75', 'integral_system_config_answer_fold', 's:3:\"-50\";');
INSERT INTO `aws_system_setting` VALUES ('76', 'integral_system_config_new_question', 's:3:\"-20\";');
INSERT INTO `aws_system_setting` VALUES ('77', 'integral_system_config_new_answer', 's:2:\"-5\";');
INSERT INTO `aws_system_setting` VALUES ('78', 'integral_system_config_thanks', 's:3:\"-10\";');
INSERT INTO `aws_system_setting` VALUES ('79', 'integral_system_config_invite_answer', 's:3:\"-10\";');
INSERT INTO `aws_system_setting` VALUES ('80', 'username_rule', 's:1:\"0\";');
INSERT INTO `aws_system_setting` VALUES ('81', 'username_length_min', 's:1:\"2\";');
INSERT INTO `aws_system_setting` VALUES ('82', 'username_length_max', 's:2:\"14\";');
INSERT INTO `aws_system_setting` VALUES ('83', 'category_enable', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('84', 'integral_unit', 's:6:\"金币\";');
INSERT INTO `aws_system_setting` VALUES ('85', 'nav_menu_show_child', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('86', 'anonymous_enable', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('87', 'report_reason', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('88', 'allowed_upload_types', 's:41:\"jpg,jpeg,png,gif,zip,doc,docx,rar,pdf,psd\";');
INSERT INTO `aws_system_setting` VALUES ('89', 'site_announce', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('90', 'icp_beian', 's:20:\"鲁ICP备18019466号\";');
INSERT INTO `aws_system_setting` VALUES ('91', 'report_message_uid', 's:1:\"1\";');
INSERT INTO `aws_system_setting` VALUES ('92', 'today_topics', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('93', 'welcome_recommend_users', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('94', 'welcome_message_pm', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('95', 'time_style', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('96', 'reputation_log_factor', 's:1:\"3\";');
INSERT INTO `aws_system_setting` VALUES ('97', 'advanced_editor_enable', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('98', 'auto_question_lock_day', 's:1:\"0\";');
INSERT INTO `aws_system_setting` VALUES ('99', 'default_timezone', 's:9:\"Etc/GMT-8\";');
INSERT INTO `aws_system_setting` VALUES ('100', 'reader_questions_last_days', 's:2:\"30\";');
INSERT INTO `aws_system_setting` VALUES ('101', 'reader_questions_agree_count', 's:2:\"10\";');
INSERT INTO `aws_system_setting` VALUES ('102', 'weixin_mp_token', 's:11:\"weixinlvwen\";');
INSERT INTO `aws_system_setting` VALUES ('103', 'new_user_email_setting', 'a:2:{s:9:\"FOLLOW_ME\";s:1:\"N\";s:10:\"NEW_ANSWER\";s:1:\"N\";}');
INSERT INTO `aws_system_setting` VALUES ('104', 'new_user_notification_setting', 'a:0:{}');
INSERT INTO `aws_system_setting` VALUES ('105', 'user_action_history_fresh_upgrade', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('106', 'cache_dir', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('107', 'ucenter_charset', 's:5:\"UTF-8\";');
INSERT INTO `aws_system_setting` VALUES ('108', 'question_topics_limit', 's:2:\"10\";');
INSERT INTO `aws_system_setting` VALUES ('109', 'mail_config', 'a:7:{s:9:\"transport\";s:8:\"sendmail\";s:7:\"charset\";s:5:\"UTF-8\";s:6:\"server\";s:0:\"\";s:3:\"ssl\";s:1:\"0\";s:4:\"port\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}');
INSERT INTO `aws_system_setting` VALUES ('110', 'auto_create_social_topics', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('111', 'weixin_subscribe_message_key', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('112', 'weixin_no_result_message_key', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('113', 'weixin_mp_menu', 'a:0:{}');
INSERT INTO `aws_system_setting` VALUES ('114', 'new_question_force_add_topic', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('115', 'unfold_question_comments', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('116', 'report_diagnostics', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('117', 'weixin_app_id', 's:18:\"wxad0a64bc64f96abc\";');
INSERT INTO `aws_system_setting` VALUES ('118', 'weixin_app_secret', 's:32:\"498cf1e0b67481320b0ab2f2eb87a5ff\";');
INSERT INTO `aws_system_setting` VALUES ('119', 'weixin_account_role', 's:7:\"service\";');
INSERT INTO `aws_system_setting` VALUES ('120', 'weibo_msg_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('121', 'weibo_msg_published_user', 'a:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('122', 'admin_notifications', 'a:11:{s:15:\"answer_approval\";i:0;s:17:\"question_approval\";i:0;s:16:\"article_approval\";i:0;s:24:\"article_comment_approval\";i:0;s:23:\"unverified_modify_count\";i:0;s:11:\"user_report\";i:0;s:17:\"register_approval\";i:0;s:15:\"verify_approval\";i:0;s:12:\"last_version\";a:2:{s:7:\"version\";s:5:\"3.2.1\";s:9:\"build_day\";s:8:\"20180601\";}s:10:\"sina_users\";N;s:19:\"receive_email_error\";N;}');
INSERT INTO `aws_system_setting` VALUES ('123', 'slave_mail_config', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('124', 'receiving_email_global_config', 'a:2:{s:7:\"enabled\";s:1:\"N\";s:12:\"publish_user\";N;}');
INSERT INTO `aws_system_setting` VALUES ('125', 'last_sent_valid_email_id', 'i:0;');
INSERT INTO `aws_system_setting` VALUES ('126', 'google_login_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('127', 'google_client_id', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('128', 'google_client_secret', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('129', 'facebook_login_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('130', 'facebook_app_id', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('131', 'facebook_app_secret', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('132', 'twitter_login_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('133', 'twitter_consumer_key', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('134', 'twitter_consumer_secret', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('135', 'weixin_encoding_aes_key', 's:43:\"KolrZAswYkOzALIE8iRDbnUiXz7Pw18NWLebvGv6stl\";');
INSERT INTO `aws_system_setting` VALUES ('136', 'integral_system_config_answer_change_source', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('137', 'enable_help_center', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('138', 'ucenter_path', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('139', 'wecenter_website', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('140', '', '');
INSERT INTO `aws_system_setting` VALUES ('141', 'register_agreement', 's:1608:\"当您申请用户时，表示您已经同意遵守本规章。\n欢迎您加入本站点参与交流和讨论，本站点为社区，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：\n\n一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：\n　（一）煽动抗拒、破坏宪法和法律、行政法规实施的；\n　（二）煽动颠覆国家政权，推翻社会主义制度的；\n　（三）煽动分裂国家、破坏国家统一的；\n　（四）煽动民族仇恨、民族歧视，破坏民族团结的；\n　（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\n　（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\n　（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\n　（八）损害国家机关信誉的；\n　（九）其他违反宪法和法律行政法规的；\n　（十）进行商业广告行为的。\n\n二、互相尊重，对自己的言论和行为负责。\n三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。\n四、禁止以任何方式对本站进行各种破坏行为。\n五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。\";');

-- ----------------------------
-- Table structure for aws_ticket
-- ----------------------------
DROP TABLE IF EXISTS `aws_ticket`;
CREATE TABLE `aws_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `status` enum('pending','closed') NOT NULL DEFAULT 'pending',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `message` text,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` enum('valid','invalid','undefined') NOT NULL DEFAULT 'undefined',
  `service` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` bigint(11) unsigned DEFAULT NULL,
  `source` enum('local','weibo','weixin','email') NOT NULL DEFAULT 'local',
  `question_id` int(10) unsigned DEFAULT NULL,
  `weibo_msg_id` bigint(20) unsigned DEFAULT NULL,
  `received_email_id` int(10) unsigned DEFAULT NULL,
  `reply_time` int(10) unsigned NOT NULL DEFAULT '0',
  `close_time` int(10) unsigned NOT NULL DEFAULT '0',
  `has_attach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `status` (`status`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `rating` (`rating`),
  KEY `service` (`service`),
  KEY `source` (`source`),
  KEY `question_id` (`question_id`),
  KEY `weibo_msg_id` (`weibo_msg_id`),
  KEY `received_email_id` (`received_email_id`),
  KEY `reply_time` (`reply_time`),
  KEY `close_time` (`close_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_ticket
-- ----------------------------

-- ----------------------------
-- Table structure for aws_ticket_invite
-- ----------------------------
DROP TABLE IF EXISTS `aws_ticket_invite`;
CREATE TABLE `aws_ticket_invite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `sender_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `sender_uid` (`sender_uid`),
  KEY `recipient_uid` (`recipient_uid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_ticket_invite
-- ----------------------------

-- ----------------------------
-- Table structure for aws_ticket_log
-- ----------------------------
DROP TABLE IF EXISTS `aws_ticket_log`;
CREATE TABLE `aws_ticket_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(255) NOT NULL,
  `data` text,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `uid` (`uid`),
  KEY `action` (`action`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_ticket_log
-- ----------------------------

-- ----------------------------
-- Table structure for aws_ticket_reply
-- ----------------------------
DROP TABLE IF EXISTS `aws_ticket_reply`;
CREATE TABLE `aws_ticket_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `message` text,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` bigint(11) unsigned DEFAULT NULL,
  `has_attach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_ticket_reply
-- ----------------------------

-- ----------------------------
-- Table structure for aws_topic
-- ----------------------------
DROP TABLE IF EXISTS `aws_topic`;
CREATE TABLE `aws_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题id',
  `topic_title` varchar(64) DEFAULT NULL COMMENT '话题标题',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `discuss_count` int(11) DEFAULT '0' COMMENT '讨论计数',
  `topic_description` text COMMENT '话题描述',
  `topic_pic` varchar(255) DEFAULT NULL COMMENT '话题图片',
  `topic_lock` tinyint(2) NOT NULL DEFAULT '0' COMMENT '话题是否锁定 1 锁定 0 未锁定',
  `focus_count` int(11) DEFAULT '0' COMMENT '关注计数',
  `user_related` tinyint(1) DEFAULT '0' COMMENT '是否被用户关联',
  `url_token` varchar(32) DEFAULT NULL,
  `merged_id` int(11) DEFAULT '0',
  `seo_title` varchar(255) DEFAULT NULL,
  `parent_id` int(10) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '0',
  `discuss_count_last_week` int(10) DEFAULT '0',
  `discuss_count_last_month` int(10) DEFAULT '0',
  `discuss_count_update` int(10) DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic_title` (`topic_title`),
  KEY `url_token` (`url_token`),
  KEY `merged_id` (`merged_id`),
  KEY `discuss_count` (`discuss_count`),
  KEY `add_time` (`add_time`),
  KEY `user_related` (`user_related`),
  KEY `focus_count` (`focus_count`),
  KEY `topic_lock` (`topic_lock`),
  KEY `parent_id` (`parent_id`),
  KEY `is_parent` (`is_parent`),
  KEY `discuss_count_last_week` (`discuss_count_last_week`),
  KEY `discuss_count_last_month` (`discuss_count_last_month`),
  KEY `discuss_count_update` (`discuss_count_update`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='话题';

-- ----------------------------
-- Records of aws_topic
-- ----------------------------
INSERT INTO `aws_topic` VALUES ('1', '默认话题', null, '0', '默认话题', null, '0', '0', '0', null, '0', null, '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for aws_topic_focus
-- ----------------------------
DROP TABLE IF EXISTS `aws_topic_focus`;
CREATE TABLE `aws_topic_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `topic_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`focus_id`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`topic_id`),
  KEY `topic_uid` (`topic_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='话题关注表';

-- ----------------------------
-- Records of aws_topic_focus
-- ----------------------------

-- ----------------------------
-- Table structure for aws_topic_merge
-- ----------------------------
DROP TABLE IF EXISTS `aws_topic_merge`;
CREATE TABLE `aws_topic_merge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL DEFAULT '0',
  `target_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`),
  KEY `target_id` (`target_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_topic_merge
-- ----------------------------

-- ----------------------------
-- Table structure for aws_topic_relation
-- ----------------------------
DROP TABLE IF EXISTS `aws_topic_relation`;
CREATE TABLE `aws_topic_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题id',
  `item_id` int(11) DEFAULT '0',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_topic_relation
-- ----------------------------

-- ----------------------------
-- Table structure for aws_users
-- ----------------------------
DROP TABLE IF EXISTS `aws_users`;
CREATE TABLE `aws_users` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户的 UID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(100) DEFAULT NULL,
  `nicknametime` int(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT 'EMAIL',
  `mobile` varchar(16) DEFAULT NULL COMMENT '用户手机',
  `password` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(16) DEFAULT NULL COMMENT '用户附加混淆码',
  `avatar_file` varchar(128) DEFAULT NULL COMMENT '头像文件',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` int(10) DEFAULT NULL COMMENT '生日',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `job_id` int(10) DEFAULT '0' COMMENT '职业ID',
  `reg_time` int(10) DEFAULT NULL COMMENT '注册时间',
  `reg_ip` bigint(12) DEFAULT NULL COMMENT '注册IP',
  `last_login` int(10) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` bigint(12) DEFAULT NULL COMMENT '最后登录 IP',
  `online_time` int(10) DEFAULT '0' COMMENT '在线时间',
  `last_active` int(10) DEFAULT NULL COMMENT '最后活跃时间',
  `notification_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未读系统通知',
  `inbox_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未读短信息',
  `inbox_recv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-所有人可以发给我,1-我关注的人',
  `fans_count` int(10) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `friend_count` int(10) NOT NULL DEFAULT '0' COMMENT '观众数',
  `invite_count` int(10) NOT NULL DEFAULT '0' COMMENT '邀请我回答数量',
  `article_count` int(10) NOT NULL DEFAULT '0' COMMENT '文章数量',
  `question_count` int(10) NOT NULL DEFAULT '0' COMMENT '问题数量',
  `answer_count` int(10) NOT NULL DEFAULT '0' COMMENT '回答数量',
  `topic_focus_count` int(10) NOT NULL DEFAULT '0' COMMENT '关注话题数量',
  `invitation_available` int(10) NOT NULL DEFAULT '0' COMMENT '邀请数量',
  `group_id` int(10) DEFAULT '0' COMMENT '用户组',
  `reputation_group` int(10) DEFAULT '0' COMMENT '威望对应组',
  `forbidden` tinyint(1) DEFAULT '0' COMMENT '是否禁止用户',
  `valid_email` tinyint(1) DEFAULT '0' COMMENT '邮箱验证',
  `is_first_login` tinyint(1) DEFAULT '1' COMMENT '首次登录标记',
  `agree_count` int(10) DEFAULT '0' COMMENT '赞同数量',
  `thanks_count` int(10) DEFAULT '0' COMMENT '感谢数量',
  `views_count` int(10) DEFAULT '0' COMMENT '个人主页查看数量',
  `reputation` int(10) DEFAULT '0' COMMENT '威望',
  `reputation_update_time` int(10) DEFAULT '0' COMMENT '威望更新',
  `weibo_visit` tinyint(1) DEFAULT '1' COMMENT '微博允许访问',
  `integral` int(10) DEFAULT '0',
  `draft_count` int(10) DEFAULT NULL,
  `common_email` varchar(255) DEFAULT NULL COMMENT '常用邮箱',
  `url_token` varchar(32) DEFAULT NULL COMMENT '个性网址',
  `url_token_update` int(10) DEFAULT '0',
  `verified` varchar(32) DEFAULT NULL,
  `default_timezone` varchar(32) DEFAULT NULL,
  `email_settings` varchar(255) DEFAULT '',
  `weixin_settings` varchar(255) DEFAULT '',
  `recent_topics` text,
  `theme` varchar(64) DEFAULT NULL COMMENT '主题',
  `column_count` int(10) NOT NULL DEFAULT '0' COMMENT '专栏数量',
  `skin` varchar(32) DEFAULT 'common.css' COMMENT '皮肤',
  PRIMARY KEY (`uid`),
  KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `reputation` (`reputation`),
  KEY `reputation_update_time` (`reputation_update_time`),
  KEY `group_id` (`group_id`),
  KEY `agree_count` (`agree_count`),
  KEY `thanks_count` (`thanks_count`),
  KEY `forbidden` (`forbidden`),
  KEY `valid_email` (`valid_email`),
  KEY `last_active` (`last_active`),
  KEY `integral` (`integral`),
  KEY `url_token` (`url_token`),
  KEY `verified` (`verified`),
  KEY `answer_count` (`answer_count`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users
-- ----------------------------
INSERT INTO `aws_users` VALUES ('1', 'itdapeng', null, null, 'wupeng@lvwen360.com', null, '1934210ed8efdcfba91ce4e84200c86b', 'dlyb', '000/00/00/01_avatar_min.jpg', null, null, null, null, '0', '1527948664', '1020328429', '1528288890', '2089133619', '7399', '1528293458', '0', '0', '0', '3', '0', '0', '0', '5', '0', '0', '10', '1', '4', '0', '1', '0', '0', '0', '18', '0', '1533395461', '1', '1900', '0', null, null, '0', null, null, '', '', null, null, '0', 'common.css');
INSERT INTO `aws_users` VALUES ('2', 'lvwen', null, null, 'lvwen@lvwen360.com', '', '0b28f6513046f88d4c3067b74e4d9320', 'oksy', null, '1', null, '', '', '0', '1527950776', '1020328429', '1529299563', '2130706433', '2621', '1529299563', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '5', '4', '4', '0', '1', '0', '0', '0', '14', '0', '1533395461', '1', '2000', null, null, null, '0', null, '', 'a:2:{s:9:\"FOLLOW_ME\";s:1:\"N\";s:10:\"NEW_ANSWER\";s:1:\"N\";}', '', null, null, '0', 'common.css');
INSERT INTO `aws_users` VALUES ('3', 'manage', null, null, 'manage@lvwen360.com', '', '361b62b151756b860112d867c2436203', 'avgo', null, '3', null, '', '', '0', '1527983670', '2089132793', '1533389348', '2130706433', '15958', '1533395666', '0', '0', '0', '0', '1', '0', '0', '3', '0', '0', '5', '1', '4', '0', '1', '0', '0', '0', '13', '0', '1533395461', '1', '1820', '0', null, null, '0', null, '', 'a:2:{s:9:\"FOLLOW_ME\";s:1:\"N\";s:10:\"NEW_ANSWER\";s:1:\"N\";}', '', null, null, '0', 'common.css');
INSERT INTO `aws_users` VALUES ('4', 'xiaochao', '5555', '1533390990', '1309729254@qq.com', '15066157777', '834240961e515157439d2232f926b9d6', 'sjrr', null, '1', null, '', '', '0', '1533382693', '2130706433', '1533395540', '2130706433', '11147', '1533395540', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '5', '4', '4', '0', '1', '0', '0', '0', '3', '0', '1533395461', '1', '2000', null, null, null, '0', null, '', 'a:2:{s:9:\"FOLLOW_ME\";s:1:\"N\";s:10:\"NEW_ANSWER\";s:1:\"N\";}', '', null, null, '0', 'common.css');

-- ----------------------------
-- Table structure for aws_users_attrib
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_attrib`;
CREATE TABLE `aws_users_attrib` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `introduction` varchar(255) DEFAULT NULL COMMENT '个人简介',
  `signature` varchar(255) DEFAULT NULL COMMENT '个人签名',
  `qq` bigint(15) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户附加属性表';

-- ----------------------------
-- Records of aws_users_attrib
-- ----------------------------
INSERT INTO `aws_users_attrib` VALUES ('1', '1', null, '', null, null);
INSERT INTO `aws_users_attrib` VALUES ('2', '2', null, '', '0', '');
INSERT INTO `aws_users_attrib` VALUES ('3', '3', null, '', '0', '');
INSERT INTO `aws_users_attrib` VALUES ('4', '4', null, '', '0', '');

-- ----------------------------
-- Table structure for aws_users_facebook
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_facebook`;
CREATE TABLE `aws_users_facebook` (
  `id` bigint(20) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `timezone` tinyint(3) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expires_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_facebook
-- ----------------------------

-- ----------------------------
-- Table structure for aws_users_google
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_google`;
CREATE TABLE `aws_users_google` (
  `id` varchar(64) NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `access_token` varchar(128) DEFAULT NULL,
  `refresh_token` varchar(128) DEFAULT NULL,
  `expires_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_google
-- ----------------------------

-- ----------------------------
-- Table structure for aws_users_group
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_group`;
CREATE TABLE `aws_users_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) DEFAULT '0' COMMENT '0-会员组 1-系统组',
  `custom` tinyint(1) DEFAULT '0' COMMENT '是否自定义',
  `group_name` varchar(50) NOT NULL,
  `reputation_lower` int(11) DEFAULT '0',
  `reputation_higer` int(11) DEFAULT '0',
  `reputation_factor` float DEFAULT '0' COMMENT '威望系数',
  `permission` text COMMENT '权限设置',
  PRIMARY KEY (`group_id`),
  KEY `type` (`type`),
  KEY `custom` (`custom`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='用户组';

-- ----------------------------
-- Records of aws_users_group
-- ----------------------------
INSERT INTO `aws_users_group` VALUES ('1', '0', '0', '超级管理员', '0', '0', '5', 'a:15:{s:16:\"is_administortar\";s:1:\"1\";s:12:\"is_moderator\";s:1:\"1\";s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:12:\"edit_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('2', '0', '0', '前台管理员', '0', '0', '4', 'a:14:{s:12:\"is_moderator\";s:1:\"1\";s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:12:\"edit_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('3', '0', '0', '未验证会员', '0', '0', '0', 'a:5:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:11:\"human_valid\";s:1:\"1\";s:19:\"question_valid_hour\";s:1:\"2\";s:17:\"answer_valid_hour\";s:1:\"2\";}');
INSERT INTO `aws_users_group` VALUES ('4', '0', '0', '普通会员', '0', '0', '0', 'a:3:{s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:19:\"question_valid_hour\";s:2:\"10\";s:17:\"answer_valid_hour\";s:2:\"10\";}');
INSERT INTO `aws_users_group` VALUES ('101', '0', '1', '注册律师', '0', '0', '0', 'a:3:{s:16:\"publish_approval\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:15:\"publish_comment\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('102', '0', '1', '认证律师', '0', '0', '0', 'a:5:{s:16:\"publish_approval\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:15:\"publish_article\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";s:14:\"publish_column\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('99', '0', '0', '游客', '0', '0', '0', 'a:9:{s:10:\"visit_site\";s:1:\"1\";s:13:\"visit_explore\";s:1:\"1\";s:12:\"search_avail\";s:1:\"1\";s:14:\"visit_question\";s:1:\"1\";s:11:\"visit_topic\";s:1:\"1\";s:13:\"visit_feature\";s:1:\"1\";s:12:\"visit_people\";s:1:\"1\";s:13:\"visit_chapter\";s:1:\"1\";s:11:\"answer_show\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('100', '2', '2', '咨询客服', '0', '0', '0', 'a:5:{s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:10:\"edit_topic\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}');

-- ----------------------------
-- Table structure for aws_users_notification_setting
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_notification_setting`;
CREATE TABLE `aws_users_notification_setting` (
  `notice_setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) NOT NULL,
  `data` text COMMENT '设置数据',
  PRIMARY KEY (`notice_setting_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='通知设定';

-- ----------------------------
-- Records of aws_users_notification_setting
-- ----------------------------
INSERT INTO `aws_users_notification_setting` VALUES ('1', '2', 'a:0:{}');
INSERT INTO `aws_users_notification_setting` VALUES ('2', '3', 'a:0:{}');
INSERT INTO `aws_users_notification_setting` VALUES ('3', '4', 'a:0:{}');

-- ----------------------------
-- Table structure for aws_users_online
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_online`;
CREATE TABLE `aws_users_online` (
  `uid` int(11) NOT NULL COMMENT '用户 ID',
  `last_active` int(11) DEFAULT '0' COMMENT '上次活动时间',
  `ip` bigint(12) DEFAULT '0' COMMENT '客户端ip',
  `active_url` varchar(255) DEFAULT NULL COMMENT '停留页面',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户客户端信息',
  KEY `uid` (`uid`),
  KEY `last_active` (`last_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线用户列表';

-- ----------------------------
-- Records of aws_users_online
-- ----------------------------
INSERT INTO `aws_users_online` VALUES ('3', '1533395666', '2130706433', 'http://www.lvwen.com/?/m/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4');
INSERT INTO `aws_users_online` VALUES ('4', '1533395540', '2130706433', 'http://www.lvwen.com/?/account/find_password/code/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');

-- ----------------------------
-- Table structure for aws_users_qq
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_qq`;
CREATE TABLE `aws_users_qq` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户在本地的UID',
  `nickname` varchar(64) DEFAULT NULL,
  `openid` varchar(128) DEFAULT '',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `access_token` varchar(64) DEFAULT NULL,
  `refresh_token` varchar(64) DEFAULT NULL,
  `expires_time` int(10) DEFAULT NULL,
  `figureurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `access_token` (`access_token`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_qq
-- ----------------------------

-- ----------------------------
-- Table structure for aws_users_sina
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_sina`;
CREATE TABLE `aws_users_sina` (
  `id` bigint(11) NOT NULL COMMENT '新浪用户 ID',
  `uid` int(11) NOT NULL COMMENT '用户在本地的UID',
  `name` varchar(64) DEFAULT NULL COMMENT '微博昵称',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `description` text COMMENT '个人描述',
  `url` varchar(255) DEFAULT NULL COMMENT '用户博客地址',
  `profile_image_url` varchar(255) DEFAULT NULL COMMENT 'Sina 自定义头像地址',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `expires_time` int(10) DEFAULT '0' COMMENT '过期时间',
  `access_token` varchar(64) DEFAULT NULL,
  `last_msg_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`),
  KEY `last_msg_id` (`last_msg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_sina
-- ----------------------------

-- ----------------------------
-- Table structure for aws_users_twitter
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_twitter`;
CREATE TABLE `aws_users_twitter` (
  `id` bigint(20) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `screen_name` varchar(128) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `time_zone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `access_token` varchar(255) NOT NULL DEFAULT 'a:2:{s:11:"oauth_token";s:0:"";s:18:"oauth_token_secret";s:0:"";}',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_twitter
-- ----------------------------

-- ----------------------------
-- Table structure for aws_users_ucenter
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_ucenter`;
CREATE TABLE `aws_users_ucenter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `uc_uid` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uc_uid` (`uc_uid`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_ucenter
-- ----------------------------

-- ----------------------------
-- Table structure for aws_users_weixin
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_weixin`;
CREATE TABLE `aws_users_weixin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `expires_in` int(10) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `scope` varchar(64) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '0',
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `add_time` int(10) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location_update` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `openid` (`openid`),
  KEY `expires_in` (`expires_in`),
  KEY `scope` (`scope`),
  KEY `sex` (`sex`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `country` (`country`),
  KEY `add_time` (`add_time`),
  KEY `latitude` (`latitude`,`longitude`),
  KEY `location_update` (`location_update`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_weixin
-- ----------------------------
INSERT INTO `aws_users_weixin` VALUES ('1', '1', 'oElRn00zIllnm9RDjcqELXRmWIV0', '1527988789', '10_UBME5v4FwHbZDS8e-WOOj-wxyJw6BID30dSBtvgjAZlGCUrfqRPMO99PscuoiboR8KmiyXe4y-gvnMc9pcYVlDFWx9IuEm27WxcvW78qPBs', '10_qP7WS9WX7ivyWjyNHljvb_uY3yovCtpruJMrbxfZd0pdFZP85ZRDvNaE6QZhMk_jAUoq5MwScXFTZpotpX9yoxKaRAuWNzqfk5GF2iZGcp4', 'snsapi_userinfo', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83ernnAMfQceq3g2HBkUZO4icqMXiaEDXmBicmnWJE4RsJQrAlCnicdSn9qDSAzJTFuWianO1o2EJmuG3icMA/132', 'IT大鹏', '1', 'Shandong', 'Jinan', 'CN', '1527981589', null, null, '0');

-- ----------------------------
-- Table structure for aws_user_action_history
-- ----------------------------
DROP TABLE IF EXISTS `aws_user_action_history`;
CREATE TABLE `aws_user_action_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `associate_type` tinyint(1) DEFAULT NULL COMMENT '关联类型: 1 问题 2 回答 3 评论 4 话题',
  `associate_action` smallint(3) DEFAULT NULL COMMENT '操作类型',
  `associate_id` int(11) DEFAULT NULL COMMENT '关联ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `associate_attached` int(11) DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT '0' COMMENT '是否匿名',
  `fold_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`history_id`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `associate_id` (`associate_id`),
  KEY `anonymous` (`anonymous`),
  KEY `fold_status` (`fold_status`),
  KEY `associate` (`associate_type`,`associate_action`),
  KEY `associate_attached` (`associate_attached`),
  KEY `associate_with_id` (`associate_id`,`associate_type`,`associate_action`),
  KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户操作记录';

-- ----------------------------
-- Records of aws_user_action_history
-- ----------------------------
INSERT INTO `aws_user_action_history` VALUES ('1', '1', '1', '101', '1', '1527950522', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('2', '1', '1', '101', '2', '1527950544', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('3', '1', '1', '101', '3', '1527950570', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('4', '1', '1', '101', '4', '1527950588', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('5', '1', '1', '101', '5', '1527950606', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('12', '3', '1', '101', '12', '1529300699', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('13', '3', '1', '101', '13', '1529303371', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('14', '3', '1', '101', '14', '1529829418', '-1', '0', '0');

-- ----------------------------
-- Table structure for aws_user_action_history_data
-- ----------------------------
DROP TABLE IF EXISTS `aws_user_action_history_data`;
CREATE TABLE `aws_user_action_history_data` (
  `history_id` int(11) unsigned NOT NULL,
  `associate_content` text,
  `associate_attached` text,
  `addon_data` text COMMENT '附加数据',
  PRIMARY KEY (`history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_user_action_history_data
-- ----------------------------
INSERT INTO `aws_user_action_history_data` VALUES ('1', '储蓄卡上的钱被莫名转走了', '我自己通过手机操作把钱转到自己的储蓄卡上后，储蓄卡上的钱又被莫名的转走了，而没有收到任何短信提醒和通知，请问这个是银行的责任吗？可以起诉银行要求赔偿吗？', '');
INSERT INTO `aws_user_action_history_data` VALUES ('2', '我女儿被别家小孩推倒摔成骨折', '我家小孩在和人家一个小女孩玩，具我女儿说被她推倒胳膊摔骨折花了3万左右，对方不认账怎么办？', '');
INSERT INTO `aws_user_action_history_data` VALUES ('3', '父亲和我大哥口头协议 要把村原来是分给我和父亲宅基地给了哥', '父亲和我大哥口头协议 要把村原来是分给我和父亲宅基地给了哥 并且多人做证 我有村里分给我和父亲的物证 哥无物证上法院会受理吗 假如受理谁胜算大?', '');
INSERT INTO `aws_user_action_history_data` VALUES ('4', '饭店雇佣童工不给钱应该怎么处理？', '饭店雇佣童工不给钱应该怎么处理？', '');
INSERT INTO `aws_user_action_history_data` VALUES ('5', '赔偿收据怎么写？具体格式', '私了要赔40%，不是一次性给完，每次对方在医院交钱，我都要去给40%，很麻烦。可不可以，交钱时，对方先出，我把小票发票拿走，我直接给对方的银行卡里打钱，这样就有了转账记录，再让对方写两张收据，一式两份。这个每次要付40%的收据，具体怎么写？', '');
INSERT INTO `aws_user_action_history_data` VALUES ('12', '发达按时发生发送大法...', '发达按时发生发送大法师打发送到发', '');
INSERT INTO `aws_user_action_history_data` VALUES ('13', '范德萨打法大大发发呆...', '范德萨打法大大发发呆发生的发多少发多少发达的', '');
INSERT INTO `aws_user_action_history_data` VALUES ('14', '爱上对方法发送发大水...', '爱上对方法发送发大水发发送打发多少打发发送到发达', '');

-- ----------------------------
-- Table structure for aws_user_action_history_fresh
-- ----------------------------
DROP TABLE IF EXISTS `aws_user_action_history_fresh`;
CREATE TABLE `aws_user_action_history_fresh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NOT NULL,
  `associate_id` int(11) NOT NULL,
  `associate_type` tinyint(1) NOT NULL,
  `associate_action` smallint(3) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `associate` (`associate_type`,`associate_action`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `history_id` (`history_id`),
  KEY `associate_with_id` (`id`,`associate_type`,`associate_action`),
  KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`),
  KEY `anonymous` (`anonymous`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_user_action_history_fresh
-- ----------------------------
INSERT INTO `aws_user_action_history_fresh` VALUES ('1', '1', '1', '1', '101', '1527950522', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('2', '2', '2', '1', '101', '1527950544', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('3', '3', '3', '1', '101', '1527950570', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('4', '4', '4', '1', '101', '1527950588', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('5', '5', '5', '1', '101', '1527950606', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('12', '12', '12', '1', '101', '1529300699', '3', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('13', '13', '13', '1', '101', '1529303371', '3', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('14', '14', '14', '1', '101', '1529829418', '3', '0');

-- ----------------------------
-- Table structure for aws_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `aws_user_follow`;
CREATE TABLE `aws_user_follow` (
  `follow_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fans_uid` int(11) DEFAULT NULL COMMENT '关注人的UID',
  `friend_uid` int(11) DEFAULT NULL COMMENT '被关注人的uid',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`follow_id`),
  KEY `fans_uid` (`fans_uid`),
  KEY `friend_uid` (`friend_uid`),
  KEY `user_follow` (`fans_uid`,`friend_uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of aws_user_follow
-- ----------------------------
INSERT INTO `aws_user_follow` VALUES ('1', '2', '1', '1527950776');
INSERT INTO `aws_user_follow` VALUES ('2', '3', '1', '1527983670');
INSERT INTO `aws_user_follow` VALUES ('3', '4', '1', '1533382693');

-- ----------------------------
-- Table structure for aws_verify_apply
-- ----------------------------
DROP TABLE IF EXISTS `aws_verify_apply`;
CREATE TABLE `aws_verify_apply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `time` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text,
  `status` tinyint(1) DEFAULT '0',
  `type` varchar(16) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `name` (`name`,`status`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_verify_apply
-- ----------------------------

-- ----------------------------
-- Table structure for aws_weibo_msg
-- ----------------------------
DROP TABLE IF EXISTS `aws_weibo_msg`;
CREATE TABLE `aws_weibo_msg` (
  `id` bigint(20) NOT NULL,
  `created_at` int(10) NOT NULL,
  `msg_author_uid` bigint(20) NOT NULL,
  `text` varchar(255) NOT NULL,
  `access_key` varchar(32) NOT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  `weibo_uid` bigint(20) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`),
  KEY `uid` (`uid`),
  KEY `weibo_uid` (`weibo_uid`),
  KEY `question_id` (`question_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新浪微博消息列表';

-- ----------------------------
-- Records of aws_weibo_msg
-- ----------------------------

-- ----------------------------
-- Table structure for aws_weixin_accounts
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_accounts`;
CREATE TABLE `aws_weixin_accounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weixin_mp_token` varchar(255) NOT NULL,
  `weixin_account_role` varchar(20) DEFAULT 'base',
  `weixin_app_id` varchar(255) DEFAULT '',
  `weixin_app_secret` varchar(255) DEFAULT '',
  `weixin_mp_menu` text,
  `weixin_subscribe_message_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `weixin_no_result_message_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `weixin_encoding_aes_key` varchar(43) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `weixin_mp_token` (`weixin_mp_token`),
  KEY `weixin_account_role` (`weixin_account_role`),
  KEY `weixin_app_id` (`weixin_app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信多账号设置';

-- ----------------------------
-- Records of aws_weixin_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for aws_weixin_login
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_login`;
CREATE TABLE `aws_weixin_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` int(10) NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `session_id` varchar(32) NOT NULL,
  `expire` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `token` (`token`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_weixin_login
-- ----------------------------
INSERT INTO `aws_weixin_login` VALUES ('161', '36328124', null, 'i2j7u890elk287og1lgshvdp10', '1533395762');

-- ----------------------------
-- Table structure for aws_weixin_message
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_message`;
CREATE TABLE `aws_weixin_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weixin_id` varchar(32) NOT NULL,
  `content` varchar(255) NOT NULL,
  `action` text,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `weixin_id` (`weixin_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_weixin_message
-- ----------------------------

-- ----------------------------
-- Table structure for aws_weixin_msg
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_msg`;
CREATE TABLE `aws_weixin_msg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_id` bigint(20) NOT NULL,
  `group_name` varchar(255) NOT NULL DEFAULT '未分组',
  `status` varchar(15) NOT NULL DEFAULT 'unsent',
  `error_num` int(10) DEFAULT NULL,
  `main_msg` text,
  `articles_info` text,
  `questions_info` text,
  `create_time` int(10) NOT NULL,
  `filter_count` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`),
  KEY `group_name` (`group_name`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信群发列表';

-- ----------------------------
-- Records of aws_weixin_msg
-- ----------------------------

-- ----------------------------
-- Table structure for aws_weixin_qr_code
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_qr_code`;
CREATE TABLE `aws_weixin_qr_code` (
  `scene_id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `subscribe_num` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`scene_id`),
  KEY `ticket` (`ticket`),
  KEY `subscribe_num` (`subscribe_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信二维码';

-- ----------------------------
-- Records of aws_weixin_qr_code
-- ----------------------------

-- ----------------------------
-- Table structure for aws_weixin_reply_rule
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_reply_rule`;
CREATE TABLE `aws_weixin_reply_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL DEFAULT '0',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `sort_status` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `keyword` (`keyword`),
  KEY `enabled` (`enabled`),
  KEY `sort_status` (`sort_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_weixin_reply_rule
-- ----------------------------

-- ----------------------------
-- Table structure for aws_weixin_third_party_api
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_third_party_api`;
CREATE TABLE `aws_weixin_third_party_api` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `enabled` (`enabled`),
  KEY `rank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信第三方接入';

-- ----------------------------
-- Records of aws_weixin_third_party_api
-- ----------------------------

-- ----------------------------
-- Table structure for aws_work_experience
-- ----------------------------
DROP TABLE IF EXISTS `aws_work_experience`;
CREATE TABLE `aws_work_experience` (
  `work_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `start_year` int(11) DEFAULT NULL COMMENT '开始年份',
  `end_year` int(11) DEFAULT NULL COMMENT '结束年月',
  `company_name` varchar(64) DEFAULT NULL COMMENT '公司名',
  `job_id` int(11) DEFAULT NULL COMMENT '职位ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`work_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='工作经历';

-- ----------------------------
-- Records of aws_work_experience
-- ----------------------------
