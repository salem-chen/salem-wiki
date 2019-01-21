/*
Navicat MySQL Data Transfer

Source Server         : local-centso7-dvd
Source Server Version : 50641
Source Host           : 192.168.61.130:3306
Source Database       : wiki

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2019-01-21 15:54:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2019_01_15_090800_create_sessions_table', '2');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`) USING BTREE,
  KEY `password_resets_token_index` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------

-- ----------------------------
-- Table structure for software
-- ----------------------------
DROP TABLE IF EXISTS `software`;
CREATE TABLE `software` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '软件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='软件表';

-- ----------------------------
-- Records of software
-- ----------------------------
INSERT INTO `software` VALUES ('1', 'Navicate for MySql');

-- ----------------------------
-- Table structure for software_key
-- ----------------------------
DROP TABLE IF EXISTS `software_key`;
CREATE TABLE `software_key` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '软件id  software.id',
  `key_value` varchar(64) NOT NULL DEFAULT '' COMMENT '快捷键',
  `key_value_zh` varchar(64) NOT NULL DEFAULT '' COMMENT '快捷键中文',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='软件快捷键';

-- ----------------------------
-- Records of software_key
-- ----------------------------
INSERT INTO `software_key` VALUES ('1', '1', 'ctrl+q', '打开查询窗口');
INSERT INTO `software_key` VALUES ('2', '1', 'ctrl+/', '注释sql语句');
INSERT INTO `software_key` VALUES ('3', '1', 'ctrl+shift+/', '解除注释');
INSERT INTO `software_key` VALUES ('4', '1', 'ctrl+r', '运行查询窗口的sql语句');
INSERT INTO `software_key` VALUES ('5', '1', 'ctrl+shift+r', '只运行选中的sql语句');
INSERT INTO `software_key` VALUES ('6', '1', 'F6', '打开一个mysql命令行窗口');
INSERT INTO `software_key` VALUES ('7', '1', 'ctrl+d', '（1）：查看表结构详情，包括索引 触发器，存储过程，外键，唯一键;（2）：复制一行');
INSERT INTO `software_key` VALUES ('8', '1', 'ctrl+l', '删除一行');
INSERT INTO `software_key` VALUES ('9', '1', 'ctrl+n', '打开一个新的查询窗口');
INSERT INTO `software_key` VALUES ('10', '1', 'ctrl+w', '关闭一个查询窗口');
INSERT INTO `software_key` VALUES ('11', '1', 'ctrl+tab', '多窗口切换');
INSERT INTO `software_key` VALUES ('12', '0', 'f7', '从这里运行一个语句,可以执行一行');

-- ----------------------------
-- Table structure for technology
-- ----------------------------
DROP TABLE IF EXISTS `technology`;
CREATE TABLE `technology` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `name_zh` varchar(256) DEFAULT '' COMMENT '中文 名称',
  `order_sort` smallint(5) NOT NULL DEFAULT '100' COMMENT '排序 最小越靠前',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tech_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='技术栈表';

-- ----------------------------
-- Records of technology
-- ----------------------------
INSERT INTO `technology` VALUES ('1', '0', 'PHP', '', '100', '0', '2018-09-07 11:32:48', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('2', '0', 'Java', '', '100', '0', '2018-09-07 11:32:53', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('3', '0', 'Python', '', '100', '0', '2018-09-07 11:32:32', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('4', '0', 'JavaScript', '', '100', '0', '2018-09-07 11:32:57', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('5', '0', 'C', '', '100', '0', '2018-09-07 11:33:23', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('6', '0', 'C++', '', '100', '0', '2018-09-07 11:33:29', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('7', '0', 'Html', '', '100', '0', '2018-09-07 11:34:20', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('8', '0', 'CSS', '', '100', '0', '2018-09-07 11:34:26', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('9', '0', 'SQL', '', '100', '0', '2018-09-07 11:37:00', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('10', '1', 'ThinkPHP', '', '100', '0', '2018-09-07 12:13:55', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('11', '1', 'Laravel', '', '100', '0', '2018-09-07 12:13:55', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('12', '1', 'Phalcon', '', '100', '0', '2018-09-07 12:13:56', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('13', '1', 'Symfony2', '', '100', '0', '2018-09-07 12:13:56', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('14', '1', 'Codelgniter', '', '100', '0', '2018-09-07 12:13:56', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('15', '1', 'Yii', '', '100', '0', '2018-09-07 12:13:57', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('16', '1', 'Aura', '', '100', '0', '2018-09-07 12:13:57', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('17', '1', 'Cakephp', '', '100', '0', '2018-09-07 12:13:57', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('18', '1', 'Zend', '', '100', '0', '2018-09-07 12:13:57', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('19', '1', 'Kohana', '', '100', '0', '2018-09-07 12:13:58', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('20', '1', 'FuelPHP', '', '100', '0', '2018-09-07 12:13:58', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('21', '1', 'Flight', '', '100', '0', '2018-09-07 12:13:58', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('22', '1', 'PHPixie', '', '100', '0', '2018-09-07 12:13:59', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('23', '1', 'Yaf', '', '100', '0', '2018-09-07 12:13:59', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('24', '1', 'Swoole', '', '100', '0', '2018-09-07 12:13:59', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('25', '1', 'Nette', '', '100', '0', '2018-09-07 12:14:01', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('26', '1', 'Workerman', '', '100', '0', '2018-09-07 12:14:00', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('27', '1', 'PHPDevShell', '', '100', '0', '2018-09-07 12:14:02', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('28', '1', 'ZooP', '', '100', '0', '2018-09-07 12:14:03', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('29', '1', 'QPHP', '', '100', '0', '2018-09-07 12:14:04', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('30', '1', 'WordPress', '', '100', '0', '2018-09-07 12:14:50', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('31', '1', 'Drupal', '', '100', '0', '2018-09-07 12:14:57', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('32', '1', 'Joomla', '', '100', '0', '2018-09-07 12:15:04', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('33', '1', 'Frog CMS', '', '100', '0', '2018-09-07 12:15:10', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('34', '1', 'SilverStripe', '', '100', '0', '2018-09-07 12:15:16', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('35', '1', 'Mambo', '', '100', '0', '2018-09-07 12:15:21', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('36', '1', 'TYPOlight', '', '100', '0', '2018-09-07 12:15:26', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('37', '1', 'Concrete5', '', '100', '0', '2018-09-07 12:15:31', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('38', '1', 'Textpattern', '', '100', '0', '2018-09-07 12:15:36', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('39', '1', 'Symphony', '', '100', '0', '2018-09-07 12:15:42', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('40', '1', 'MODx', '', '100', '0', '2018-09-07 12:15:47', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('41', '1', 'Habari Project', '', '100', '0', '2018-09-07 12:15:52', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('42', '1', 'CMS Made Simple', '', '100', '0', '2018-09-07 12:16:00', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('43', '1', 'ImpressCMS', '', '100', '0', '2018-09-07 12:18:03', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('45', '1', 'MiaCMS', '', '100', '0', '2018-09-07 12:18:04', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('46', '1', 'Jojo CMS', '', '100', '0', '2018-09-07 12:18:05', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('47', '1', 'TYPO3', '', '100', '0', '2018-09-07 12:18:07', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('48', '1', 'Elxis CMS', '', '100', '0', '2018-09-07 12:18:06', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('49', '1', 'Chyrp', '', '100', '0', '2018-09-07 12:18:10', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('50', '1', 'DedeCMS', '织梦cms', '100', '0', '2018-09-07 14:01:05', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('51', '1', 'EmpireCMS', '帝国cms', '100', '0', '2018-09-07 14:01:06', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('52', '1', 'CmsSeasy', '易通cms', '100', '0', '2018-09-07 14:01:06', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('53', '1', 'PHPCMS', '', '100', '0', '2018-09-07 14:01:07', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('54', '1', 'ZenTao', '禅道', '100', '0', '2018-09-07 14:01:07', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('55', '1', 'Fecshop', '', '100', '0', '2018-09-07 14:01:07', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('56', '1', 'osCommerce', '', '100', '0', '2018-09-07 14:01:08', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('57', '1', 'Zend Cart', '', '100', '0', '2018-09-07 14:01:08', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('58', '1', 'Magento', '', '100', '0', '2018-09-07 14:01:09', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('59', '1', 'ShopNC', '', '100', '0', '2018-09-07 14:01:09', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('60', '1', 'EcShop', '', '100', '0', '2018-09-07 14:01:09', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('61', '1', 'OpenCart', '', '100', '0', '2018-09-07 14:01:10', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('63', '8', 'Bootstrap', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('64', '8', 'Semantic-ui', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('65', '8', 'Foundation', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('66', '8', 'Materialize', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('67', '8', 'Material-ui', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('68', '8', 'Phantomjs', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('69', '8', 'Pure', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('70', '8', 'Flat-ui', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('71', '8', 'Jquery-ui', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('72', '8', 'React-bootstrap', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('73', '8', 'Uikit', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('74', '8', 'Iview', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('75', '8', 'Mui', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('76', '8', 'Frozenui', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('77', '8', 'AlloyUI', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('78', '8', 'W3.CSS', '', '100', '0', '2018-09-07 14:08:19', '2018-09-07 16:12:01');
INSERT INTO `technology` VALUES ('79', '4', 'React Js', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('80', '4', 'Vue JS', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('81', '4', 'Node JS', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('82', '4', 'Tree JS', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('83', '4', 'Meteror JS', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('84', '4', 'Express', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('85', '4', 'Chart JS', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('86', '4', 'Yarn', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('87', '4', 'Jquery', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('88', '4', 'Dojo', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('89', '4', 'Sencha Ext JS4', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('90', '4', 'Prototype', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('91', '4', 'Uize', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('92', '4', 'Qooxdoo ', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('93', '4', 'DHTMLX Touch', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('94', '4', 'YUI', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('95', '4', 'Archetype', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('96', '4', 'Rico', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('97', '4', 'Script.aculo', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('98', '4', 'JavaScriptMVC', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('99', '4', 'Spry', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('100', '4', 'MooTools', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('101', '4', 'SproutCore', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:19:12');
INSERT INTO `technology` VALUES ('102', '4', 'Echart', '百度图表', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:27:57');
INSERT INTO `technology` VALUES ('103', '4', 'Highcharts', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:27:24');
INSERT INTO `technology` VALUES ('104', '4', 'G2', '阿里图表', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:27:51');
INSERT INTO `technology` VALUES ('105', '4', 'Flot', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:27:24');
INSERT INTO `technology` VALUES ('106', '4', 'JFreeChart', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:27:24');

-- ----------------------------
-- Table structure for technology_article
-- ----------------------------
DROP TABLE IF EXISTS `technology_article`;
CREATE TABLE `technology_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` text COMMENT '文章内容',
  `order_sort` smallint(5) NOT NULL DEFAULT '100' COMMENT '排序 越小越靠前',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='技术文章表';

-- ----------------------------
-- Records of technology_article
-- ----------------------------
INSERT INTO `technology_article` VALUES ('9', 'Laravel  @yield @section @show @stop @append标签区别', '参考：https://blog.csdn.net/returningprodigal/article/details/62240134', '100', '0', '0000-00-00 00:00:00', '2018-10-09 17:32:37');

-- ----------------------------
-- Table structure for technology_tag
-- ----------------------------
DROP TABLE IF EXISTS `technology_tag`;
CREATE TABLE `technology_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '标签名称',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tech_tag` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='技术标签';

-- ----------------------------
-- Records of technology_tag
-- ----------------------------
INSERT INTO `technology_tag` VALUES ('1', '电商', '0000-00-00 00:00:00', '2018-09-07 16:12:14');
INSERT INTO `technology_tag` VALUES ('3', '图表', '0000-00-00 00:00:00', '2018-09-07 16:21:15');

-- ----------------------------
-- Table structure for technology_tech_tag
-- ----------------------------
DROP TABLE IF EXISTS `technology_tech_tag`;
CREATE TABLE `technology_tech_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tech_id` int(11) NOT NULL DEFAULT '0' COMMENT '技术id @technology.id',
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '标签id @technology_tag.id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='技术标签中间表';

-- ----------------------------
-- Records of technology_tech_tag
-- ----------------------------

-- ----------------------------
-- Table structure for technology_tech_type
-- ----------------------------
DROP TABLE IF EXISTS `technology_tech_type`;
CREATE TABLE `technology_tech_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tech_id` int(11) NOT NULL DEFAULT '0' COMMENT '技术id @technology.id',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '类型id @technology_type.id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='技术类型中间表';

-- ----------------------------
-- Records of technology_tech_type
-- ----------------------------
INSERT INTO `technology_tech_type` VALUES ('1', '1', '1', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('2', '2', '1', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('3', '3', '1', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('4', '4', '1', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('5', '5', '1', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('6', '6', '1', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('7', '7', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('8', '8', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('9', '9', '1', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('10', '10', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('11', '11', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('12', '12', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('13', '13', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('14', '14', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('15', '15', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('16', '16', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('17', '17', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('18', '18', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('19', '19', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('20', '20', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('21', '21', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('22', '22', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('23', '23', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('24', '24', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('25', '25', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('26', '26', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('27', '27', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('28', '28', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('29', '29', '6', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('30', '30', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('31', '31', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('32', '32', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('33', '33', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('34', '34', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('35', '35', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('36', '36', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('37', '37', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('38', '38', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('39', '39', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('40', '40', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('41', '41', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('42', '42', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('43', '43', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('44', '45', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('45', '46', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('46', '47', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('47', '48', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('48', '49', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('49', '50', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('50', '51', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('51', '52', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('52', '53', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('53', '54', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('54', '55', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('55', '56', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('56', '57', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('57', '58', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('58', '59', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('59', '60', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('60', '61', '7', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('61', '63', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('62', '64', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('63', '65', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('64', '66', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('65', '67', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('66', '68', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('67', '69', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('68', '70', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('69', '71', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('70', '72', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('71', '73', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('72', '74', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('73', '75', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('74', '76', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('75', '77', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');
INSERT INTO `technology_tech_type` VALUES ('76', '78', '5', '2018-09-07 16:11:21', '2018-09-07 16:11:49');

-- ----------------------------
-- Table structure for technology_type
-- ----------------------------
DROP TABLE IF EXISTS `technology_type`;
CREATE TABLE `technology_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '技术类型名称',
  `name_zh` varchar(64) NOT NULL DEFAULT '' COMMENT '中文名称',
  `remark` varchar(1024) NOT NULL DEFAULT '' COMMENT '备注',
  `order_sort` smallint(5) NOT NULL DEFAULT '100' COMMENT '排序 越小越靠前',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tech_type` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='技术类型表';

-- ----------------------------
-- Records of technology_type
-- ----------------------------
INSERT INTO `technology_type` VALUES ('1', 'Programming Language', '编程语言', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 11:24:02');
INSERT INTO `technology_type` VALUES ('2', 'Database', '数据库', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 11:24:05');
INSERT INTO `technology_type` VALUES ('3', 'Opertting System', '操作系统', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 11:24:38');
INSERT INTO `technology_type` VALUES ('4', 'IDE', '开发工具', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 11:25:59');
INSERT INTO `technology_type` VALUES ('5', 'Front-End', '前端', '前端技术', '100', '0', '0000-00-00 00:00:00', '2018-09-07 11:28:40');
INSERT INTO `technology_type` VALUES ('6', 'Framework', '框架', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 11:36:25');
INSERT INTO `technology_type` VALUES ('7', 'CMS', 'cms系统', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 11:36:36');
INSERT INTO `technology_type` VALUES ('8', 'Plug', '插件', '', '100', '0', '0000-00-00 00:00:00', '2018-09-07 16:22:05');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
