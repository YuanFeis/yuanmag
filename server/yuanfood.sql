/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : yuanfood

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 04/07/2020 10:10:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_cms_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_banner`;
CREATE TABLE `t_cms_banner`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `id_file` bigint(0) NULL DEFAULT NULL COMMENT 'banner图id',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点击banner跳转到url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cms_banner
-- ----------------------------
INSERT INTO `t_cms_banner` VALUES (1, 1, '2019-03-09 16:29:03', NULL, NULL, 1, '不打开链接', 'index', 'javascript:');
INSERT INTO `t_cms_banner` VALUES (2, 1, '2019-03-09 16:29:03', NULL, NULL, 2, '打打开站内链接', 'index', '/contact');

-- ----------------------------
-- Table structure for t_cms_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_channel`;
CREATE TABLE `t_cms_channel`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章栏目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cms_channel
-- ----------------------------
INSERT INTO `t_cms_channel` VALUES (1, NULL, NULL, 1, '2019-03-13 22:52:46', 'popular', '人气热卖');
INSERT INTO `t_cms_channel` VALUES (2, NULL, NULL, 1, '2019-03-13 22:53:11', 'new', '新品上市');
INSERT INTO `t_cms_channel` VALUES (3, NULL, NULL, 1, '2019-03-13 22:53:37', 'afternoon', '欢乐送下午茶');
INSERT INTO `t_cms_channel` VALUES (4, NULL, NULL, 1, '2019-03-13 22:53:41', 'seasonal', '当季主打');

-- ----------------------------
-- Table structure for t_cms_dish
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_dish`;
CREATE TABLE `t_cms_dish`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `id_channel` bigint(0) NOT NULL COMMENT '分类id',
  `img` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片ID',
  `inventory` int(0) NOT NULL COMMENT '库存',
  `price` int(0) NOT NULL COMMENT '价格',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cms_dish
-- ----------------------------
INSERT INTO `t_cms_dish` VALUES (1, 1, '2019-03-09 16:24:58', 1, '2019-05-10 13:22:49', '赠送咪咕音乐白金会员月卡', 1, '1', 10, 39, '翅桶');
INSERT INTO `t_cms_dish` VALUES (2, 1, '2019-03-09 16:24:58', 1, '2019-05-10 13:22:49', '赠送咪咕音乐白金会员月卡', 1, '1', 19, 78, '双堡翅尖桶');
INSERT INTO `t_cms_dish` VALUES (3, 1, '2019-03-09 16:24:58', 1, '2019-05-10 13:22:49', '鸡心4串+鸡肫2串+牛肚1串+木耳2串+油豆腐2串+黄喉1串 主要原料：鸡心，鸡肫，牛肚，黄喉，木耳，油豆腐，红油，红汤底酱', 2, '2', 99, 59, '川香燃辣撸串桶');
INSERT INTO `t_cms_dish` VALUES (4, 1, '2019-03-09 16:24:58', 1, '2019-05-10 13:22:49', '香卤手撕鸡1份+香卤鸡翅尖1份+香卤鸡心1份+香卤鸡肫1份+香辣鸡翅2块+新奥尔良烤翅2块', 2, '3', 25, 69, '香卤系列辣翅烤翅');
INSERT INTO `t_cms_dish` VALUES (5, 1, '2019-03-09 16:24:58', 1, '2019-05-10 13:22:49', '香辣鸡翅4块+吮指原味鸡3块+葡式蛋挞（经典）2个+红豆派2个+九珍果汁饮料4杯（可加价换购）', 3, '4', 33, 51, '4人下午茶欢享桶');
INSERT INTO `t_cms_dish` VALUES (6, 1, '2019-03-09 16:24:58', 1, '2019-05-10 13:22:49', '热辣香骨鸡3块+新奥尔良烤翅4块+黄金鸡块5块+劲爆鸡米花（小）1份+葡式蛋挞（经典）1个+红豆派2个+九珍果汁饮料3杯（可加价换购）', 3, '5', 55, 53, '3人下午茶欢享桶');
INSERT INTO `t_cms_dish` VALUES (7, 1, '2019-03-09 16:24:58', 1, '2019-05-10 13:22:49', '华夫3份（可选）', 3, '6', 22, 27, '下午茶华夫礼盒');
INSERT INTO `t_cms_dish` VALUES (8, 1, '2019-03-09 16:24:58', 1, '2019-05-10 13:22:49', '香辣鸡腿堡2个+新奥尔良烤鸡腿堡1个+吮指原味鸡3块+香辣鸡翅2块+新奥尔良烤翅4块+醇香土豆泥2份+红豆派2只+1.25升百事可乐1瓶', 4, '7', 5, 123, '超级外送全家桶S');

-- ----------------------------
-- Table structure for t_cms_order
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_order`;
CREATE TABLE `t_cms_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单',
  `mobile` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `userid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cms_order
-- ----------------------------
INSERT INTO `t_cms_order` VALUES (1, NULL, '2019-03-11 22:30:17', NULL, NULL, '{\"list\":[{\"id\":1,\"name\":\"翅桶\",\"amount\":1,\"price\":39},{\"id\":2,\"name\":\"双堡翅尖桶\",\"amount\":2,\"price\":156},{\"id\":3,\"name\":\"川香燃辣撸串桶\",\"amount\":3,\"price\":177}]}', '15706589233', '不要辣', '备货中', '3');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `receiver` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收者',
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型,0:初始,1:成功,2:失败',
  `tpl_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板编码',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型,0:短信,1:邮件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '历史消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (1, NULL, '2019-06-10 21:20:16', NULL, NULL, '【腾讯云】校验码1032，请于5分钟内完成验证，如非本人操作请忽略本短信。', '15021592814', '2', 'REGISTER_CODE', '0');

-- ----------------------------
-- Table structure for t_message_sender
-- ----------------------------
DROP TABLE IF EXISTS `t_message_sender`;
CREATE TABLE `t_message_sender`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `class_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `tpl_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信运营商模板编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息发送者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message_sender
-- ----------------------------
INSERT INTO `t_message_sender` VALUES (1, NULL, NULL, NULL, NULL, 'tencentSmsSender', ' 腾讯短信服务', NULL);
INSERT INTO `t_message_sender` VALUES (2, NULL, NULL, NULL, NULL, 'defaultEmailSender', '默认邮件发送器', NULL);

-- ----------------------------
-- Table structure for t_message_template
-- ----------------------------
DROP TABLE IF EXISTS `t_message_template`;
CREATE TABLE `t_message_template`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `cond` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送条件',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `id_message_sender` bigint(0) NOT NULL COMMENT '发送者id',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型,0:短信,1:邮件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK942sadqk5x9kbrwil0psyek3n`(`id_message_sender`) USING BTREE,
  CONSTRAINT `FK942sadqk5x9kbrwil0psyek3n` FOREIGN KEY (`id_message_sender`) REFERENCES `t_message_sender` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message_template
-- ----------------------------
INSERT INTO `t_message_template` VALUES (1, NULL, NULL, NULL, NULL, 'REGISTER_CODE', '注册页面，点击获取验证码', '【腾讯云】校验码{1}，请于5分钟内完成验证，如非本人操作请忽略本短信。', 1, '注册验证码', '0');
INSERT INTO `t_message_template` VALUES (2, NULL, NULL, NULL, NULL, 'EMAIL_TEST', '测试发送', '你好:{1},欢迎使用{2}', 2, '测试邮件', '1');
INSERT INTO `t_message_template` VALUES (3, NULL, NULL, NULL, NULL, 'EMAIL_HTML_TEMPLATE_TEST', '测试发送模板邮件', '你好<strong>${userName}</strong>欢迎使用<font color=\"red\">${appName}</font>,这是html模板邮件', 2, '测试发送模板邮件', '1');

-- ----------------------------
-- Table structure for t_sys_cfg
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_cfg`;
CREATE TABLE `t_sys_cfg`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `cfg_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `cfg_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名',
  `cfg_value` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_cfg
-- ----------------------------
INSERT INTO `t_sys_cfg` VALUES (1, NULL, NULL, 1, '2019-04-15 21:36:07', '应用名称update by 2019-03-27 11:47:04', 'system.app.name', 'web-flash');
INSERT INTO `t_sys_cfg` VALUES (2, NULL, NULL, 1, '2019-04-15 21:36:17', '系统默认上传文件路径', 'system.file.upload.path', 'runtime/upload');
INSERT INTO `t_sys_cfg` VALUES (3, NULL, NULL, 1, '2019-04-15 21:36:17', '腾讯sms接口appid', 'api.tencent.sms.appid', '1400219425');
INSERT INTO `t_sys_cfg` VALUES (4, NULL, NULL, 1, '2019-04-15 21:36:17', '腾讯sms接口appkey', 'api.tencent.sms.appkey', '5f71ed5325f3b292946530a1773e997a');
INSERT INTO `t_sys_cfg` VALUES (5, NULL, NULL, 1, '2019-04-15 21:36:17', '腾讯sms接口签名参数', 'api.tencent.sms.sign', '需要去申请咯');

-- ----------------------------
-- Table structure for t_sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dept`;
CREATE TABLE `t_sys_dept`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(0) NULL DEFAULT NULL,
  `pid` bigint(0) NULL DEFAULT NULL,
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simplename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_dept
-- ----------------------------
INSERT INTO `t_sys_dept` VALUES (1, NULL, NULL, 1, '2020-07-04 00:11:54', '开发区店', 1, 0, '[0],', '开发区店', '', NULL);
INSERT INTO `t_sys_dept` VALUES (2, NULL, NULL, NULL, NULL, '开发部', 2, 1, '[0],[24],', '开发部', '', NULL);
INSERT INTO `t_sys_dept` VALUES (3, NULL, NULL, NULL, NULL, '运营部', 3, 1, '[0],[24],', '运营部', '', NULL);
INSERT INTO `t_sys_dept` VALUES (4, NULL, NULL, NULL, NULL, '战略部', 4, 1, '[0],[24],', '战略部', '', NULL);
INSERT INTO `t_sys_dept` VALUES (5, NULL, NULL, NULL, NULL, '用户', 5, 3, '[0],[24],[3],', '用户', '', NULL);

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` bigint(0) NULL DEFAULT NULL,
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO `t_sys_dict` VALUES (16, NULL, NULL, NULL, NULL, '状态', '0', 0, NULL);
INSERT INTO `t_sys_dict` VALUES (17, NULL, NULL, NULL, NULL, '启用', '1', 16, NULL);
INSERT INTO `t_sys_dict` VALUES (18, NULL, NULL, NULL, NULL, '禁用', '2', 16, NULL);
INSERT INTO `t_sys_dict` VALUES (29, NULL, NULL, NULL, NULL, '性别', '0', 0, NULL);
INSERT INTO `t_sys_dict` VALUES (30, NULL, NULL, NULL, NULL, '男', '1', 29, NULL);
INSERT INTO `t_sys_dict` VALUES (31, NULL, NULL, NULL, NULL, '女', '2', 29, NULL);
INSERT INTO `t_sys_dict` VALUES (35, NULL, NULL, NULL, NULL, '账号状态', '0', 0, NULL);
INSERT INTO `t_sys_dict` VALUES (36, NULL, NULL, NULL, NULL, '启用', '1', 35, NULL);
INSERT INTO `t_sys_dict` VALUES (37, NULL, NULL, NULL, NULL, '冻结', '2', 35, NULL);
INSERT INTO `t_sys_dict` VALUES (38, NULL, NULL, NULL, NULL, '已删除', '3', 35, NULL);
INSERT INTO `t_sys_dict` VALUES (53, NULL, NULL, NULL, NULL, '证件类型', '0', 0, NULL);
INSERT INTO `t_sys_dict` VALUES (54, NULL, NULL, NULL, NULL, '身份证', '1', 53, NULL);
INSERT INTO `t_sys_dict` VALUES (55, NULL, NULL, NULL, NULL, '护照', '2', 53, NULL);
INSERT INTO `t_sys_dict` VALUES (68, 1, '2019-01-13 14:18:21', 1, '2019-01-13 14:18:21', '是否', '0', 0, NULL);
INSERT INTO `t_sys_dict` VALUES (69, 1, '2019-01-13 14:18:21', 1, '2019-01-13 14:18:21', '是', '1', 68, NULL);
INSERT INTO `t_sys_dict` VALUES (70, 1, '2019-01-13 14:18:21', 1, '2019-01-13 14:18:21', '否', '0', 68, NULL);

-- ----------------------------
-- Table structure for t_sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_file_info`;
CREATE TABLE `t_sys_file_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `original_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_file_info
-- ----------------------------
INSERT INTO `t_sys_file_info` VALUES (1, 1, '2019-03-18 10:34:34', 1, '2019-03-18 10:34:34', 'dish1.jpg', 'dish1.jpg');
INSERT INTO `t_sys_file_info` VALUES (2, 1, '2019-03-18 10:54:04', 1, '2019-03-18 10:54:04', 'dish2.jpg', 'dish2.jpg');
INSERT INTO `t_sys_file_info` VALUES (3, 1, '2019-03-18 20:09:59', 1, '2019-03-18 20:09:59', 'dish3.jpg', 'dish3.jpg');
INSERT INTO `t_sys_file_info` VALUES (4, 1, '2019-03-18 20:10:18', 1, '2019-03-18 20:10:18', 'dish4.jpg', 'dish4.jpg');
INSERT INTO `t_sys_file_info` VALUES (5, 1, '2019-03-18 20:20:14', 1, '2019-03-18 20:20:14', 'dish5.jpg', 'dish5.jpg');
INSERT INTO `t_sys_file_info` VALUES (6, 1, '2019-03-18 20:22:09', 1, '2019-03-18 20:22:09', 'dish6.jpg', 'dish6.jpg');
INSERT INTO `t_sys_file_info` VALUES (7, 1, '2019-03-20 09:05:54', 1, '2019-03-20 09:05:54', 'dish7.jpg', 'dish7.jpg');
INSERT INTO `t_sys_file_info` VALUES (8, 1, '2019-03-20 09:05:54', 1, '2019-03-20 09:05:54', 'dish8.jpg', 'dish8.jpg');

-- ----------------------------
-- Table structure for t_sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_login_log`;
CREATE TABLE `t_sys_login_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_login_log
-- ----------------------------
INSERT INTO `t_sys_login_log` VALUES (71, '2019-05-10 13:17:43', '127.0.0.1', '登录日志', NULL, '成功', 1);
INSERT INTO `t_sys_login_log` VALUES (72, '2019-05-12 13:36:56', '127.0.0.1', '登录日志', NULL, '成功', 1);
INSERT INTO `t_sys_login_log` VALUES (73, '2020-07-04 00:11:06', '127.0.0.1', '登录日志', NULL, '成功', 1);
INSERT INTO `t_sys_login_log` VALUES (74, '2020-07-04 07:53:53', '127.0.0.1', '登录日志', NULL, '成功', 1);
INSERT INTO `t_sys_login_log` VALUES (75, '2020-07-04 08:56:24', '127.0.0.1', '登录日志', NULL, '成功', 5);
INSERT INTO `t_sys_login_log` VALUES (76, '2020-07-04 09:22:38', '127.0.0.1', '退出日志', NULL, '成功', 5);
INSERT INTO `t_sys_login_log` VALUES (77, '2020-07-04 09:22:42', '127.0.0.1', '登录日志', NULL, '成功', 1);
INSERT INTO `t_sys_login_log` VALUES (78, '2020-07-04 09:29:59', '127.0.0.1', '退出日志', NULL, '成功', 1);
INSERT INTO `t_sys_login_log` VALUES (79, '2020-07-04 09:30:06', '127.0.0.1', '登录日志', NULL, '成功', 1);
INSERT INTO `t_sys_login_log` VALUES (80, '2020-07-04 09:50:08', '127.0.0.1', '退出日志', NULL, '成功', 1);
INSERT INTO `t_sys_login_log` VALUES (81, '2020-07-04 09:50:17', '127.0.0.1', '登录日志', NULL, '成功', 5);
INSERT INTO `t_sys_login_log` VALUES (82, '2020-07-04 09:51:03', '127.0.0.1', '登录日志', NULL, '成功', 5);
INSERT INTO `t_sys_login_log` VALUES (83, '2020-07-04 09:58:57', '127.0.0.1', '登录日志', NULL, '成功', 5);
INSERT INTO `t_sys_login_log` VALUES (84, '2020-07-04 09:59:45', '127.0.0.1', '退出日志', NULL, '成功', 5);
INSERT INTO `t_sys_login_log` VALUES (85, '2020-07-04 10:06:25', '127.0.0.1', '登录日志', NULL, '成功', 5);

-- ----------------------------
-- Table structure for t_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '組件配置',
  `hidden` tinyint(0) NULL DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `ismenu` int(0) NOT NULL COMMENT '是否是菜单1:菜单,0:按钮',
  `isopen` int(0) NULL DEFAULT NULL COMMENT '是否默认打开1:是,0:否',
  `levels` int(0) NOT NULL COMMENT '级别',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `num` int(0) NOT NULL COMMENT '顺序',
  `pcode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父菜单编号',
  `pcodes` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '递归父级菜单编号',
  `status` int(0) NOT NULL COMMENT '状态1:启用,0:禁用',
  `tips` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鼠标悬停提示信息',
  `url` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_s37unj3gh67ujhk83lqva8i1t`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES (1, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'system', 'layout', 0, 'system', 1, 1, 1, '系统管理', 1, '0', '[0],', 1, NULL, '/system');
INSERT INTO `t_sys_menu` VALUES (2, 1, '2019-07-31 22:04:30', 1, '2019-03-11 22:25:38', 'cms', 'layout', 0, 'documentation', 1, NULL, 1, 'CMS管理', 3, '0', '[0],', 1, NULL, '/cms');
INSERT INTO `t_sys_menu` VALUES (3, 1, '2019-07-31 22:04:30', 1, '2019-06-02 10:09:09', 'operationMgr', 'layout', 0, 'operation', 1, NULL, 1, '运维管理', 2, '0', '[0],', 1, NULL, '/optionMgr');
INSERT INTO `t_sys_menu` VALUES (4, 1, '2019-07-31 22:04:30', 1, '2019-04-16 18:59:15', 'mgr', 'views/system/user/index', 0, 'user', 1, NULL, 2, '用户管理', 1, 'system', '[0],[system],', 1, NULL, '/mgr');
INSERT INTO `t_sys_menu` VALUES (5, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'mgrAdd', NULL, 0, NULL, 0, NULL, 3, '添加用户', 1, 'mgr', '[0],[system],[mgr],', 1, NULL, '/mgr/add');
INSERT INTO `t_sys_menu` VALUES (6, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'mgrEdit', NULL, 0, NULL, 0, NULL, 3, '修改用户', 2, 'mgr', '[0],[system],[mgr],', 1, NULL, '/mgr/edit');
INSERT INTO `t_sys_menu` VALUES (7, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'mgrDelete', NULL, 0, NULL, 0, 0, 3, '删除用户', 3, 'mgr', '[0],[system],[mgr],', 1, NULL, '/mgr/delete');
INSERT INTO `t_sys_menu` VALUES (8, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'mgrReset', NULL, 0, NULL, 0, 0, 3, '重置密码', 4, 'mgr', '[0],[system],[mgr],', 1, NULL, '/mgr/reset');
INSERT INTO `t_sys_menu` VALUES (9, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'mgrFreeze', NULL, 0, NULL, 0, 0, 3, '冻结用户', 5, 'mgr', '[0],[system],[mgr],', 1, NULL, '/mgr/freeze');
INSERT INTO `t_sys_menu` VALUES (10, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'mgrUnfreeze', NULL, 0, NULL, 0, 0, 3, '解除冻结用户', 6, 'mgr', '[0],[system],[mgr],', 1, NULL, '/mgr/unfreeze');
INSERT INTO `t_sys_menu` VALUES (11, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'mgrSetRole', NULL, 0, NULL, 0, 0, 3, '分配角色', 7, 'mgr', '[0],[system],[mgr],', 1, NULL, '/mgr/setRole');
INSERT INTO `t_sys_menu` VALUES (12, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'role', 'views/system/role/index', 0, 'peoples', 1, 0, 2, '角色管理', 2, 'system', '[0],[system],', 1, NULL, '/role');
INSERT INTO `t_sys_menu` VALUES (13, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'roleAdd', NULL, 0, NULL, 0, 0, 3, '添加角色', 1, 'role', '[0],[system],[role],', 1, NULL, '/role/add');
INSERT INTO `t_sys_menu` VALUES (14, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'roleEdit', NULL, 0, NULL, 0, 0, 3, '修改角色', 2, 'role', '[0],[system],[role],', 1, NULL, '/role/edit');
INSERT INTO `t_sys_menu` VALUES (15, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'roleDelete', NULL, 0, NULL, 0, 0, 3, '删除角色', 3, 'role', '[0],[system],[role],', 1, NULL, '/role/remove');
INSERT INTO `t_sys_menu` VALUES (16, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'roleSetAuthority', NULL, 0, NULL, 0, 0, 3, '配置权限', 4, 'role', '[0],[system],[role],', 1, NULL, '/role/setAuthority');
INSERT INTO `t_sys_menu` VALUES (17, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'menu', 'views/system/menu/index', 0, 'menu', 1, 0, 2, '菜单管理', 4, 'system', '[0],[system],', 1, NULL, '/menu');
INSERT INTO `t_sys_menu` VALUES (18, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'menuAdd', NULL, 0, NULL, 0, 0, 3, '添加菜单', 1, 'menu', '[0],[system],[menu],', 1, NULL, '/menu/add');
INSERT INTO `t_sys_menu` VALUES (19, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'menuEdit', NULL, 0, NULL, 0, 0, 3, '修改菜单', 2, 'menu', '[0],[system],[menu],', 1, NULL, '/menu/edit');
INSERT INTO `t_sys_menu` VALUES (20, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'menuDelete', NULL, 0, NULL, 0, 0, 3, '删除菜单', 3, 'menu', '[0],[system],[menu],', 1, NULL, '/menu/remove');
INSERT INTO `t_sys_menu` VALUES (21, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'dept', 'views/system/dept/index', 0, 'dept', 1, NULL, 2, '部门管理', 3, 'system', '[0],[system],', 1, NULL, '/dept');
INSERT INTO `t_sys_menu` VALUES (22, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'dict', 'views/system/dict/index', 0, 'dict', 1, NULL, 2, '字典管理', 4, 'system', '[0],[system],', 1, NULL, '/dict');
INSERT INTO `t_sys_menu` VALUES (23, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'deptEdit', NULL, 0, NULL, 0, NULL, 3, '修改部门', 1, 'dept', '[0],[system],[dept],', 1, NULL, '/dept/update');
INSERT INTO `t_sys_menu` VALUES (24, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'deptDelete', NULL, 0, NULL, 0, NULL, 3, '删除部门', 1, 'dept', '[0],[system],[dept],', 1, NULL, '/dept/delete');
INSERT INTO `t_sys_menu` VALUES (25, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'dictAdd', NULL, 0, NULL, 0, NULL, 3, '添加字典', 1, 'dict', '[0],[system],[dict],', 1, NULL, '/dict/add');
INSERT INTO `t_sys_menu` VALUES (26, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'dictEdit', NULL, 0, NULL, 0, NULL, 3, '修改字典', 1, 'dict', '[0],[system],[dict],', 1, NULL, '/dict/update');
INSERT INTO `t_sys_menu` VALUES (27, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'dictDelete', NULL, 0, NULL, 0, NULL, 3, '删除字典', 1, 'dict', '[0],[system],[dict],', 1, NULL, '/dict/delete');
INSERT INTO `t_sys_menu` VALUES (28, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'deptList', NULL, 0, NULL, 0, NULL, 3, '部门列表', 5, 'dept', '[0],[system],[dept],', 1, NULL, '/dept/list');
INSERT INTO `t_sys_menu` VALUES (29, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'deptDetail', NULL, 0, NULL, 0, NULL, 3, '部门详情', 6, 'dept', '[0],[system],[dept],', 1, NULL, '/dept/detail');
INSERT INTO `t_sys_menu` VALUES (30, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'dictList', NULL, 0, NULL, 0, NULL, 3, '字典列表', 5, 'dict', '[0],[system],[dict],', 1, NULL, '/dict/list');
INSERT INTO `t_sys_menu` VALUES (31, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'dictDetail', NULL, 0, NULL, 0, NULL, 3, '字典详情', 6, 'dict', '[0],[system],[dict],', 1, NULL, '/dict/detail');
INSERT INTO `t_sys_menu` VALUES (32, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'deptAdd', NULL, 0, NULL, 0, NULL, 3, '添加部门', 1, 'dept', '[0],[system],[dept],', 1, NULL, '/dept/add');
INSERT INTO `t_sys_menu` VALUES (33, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'cfg', 'views/system/cfg/index', 0, 'cfg', 1, NULL, 2, '参数管理', 10, 'system', '[0],[system],', 1, NULL, '/cfg');
INSERT INTO `t_sys_menu` VALUES (34, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'cfgAdd', NULL, 0, NULL, 0, NULL, 3, '添加系统参数', 1, 'cfg', '[0],[system],[cfg],', 1, NULL, '/cfg/add');
INSERT INTO `t_sys_menu` VALUES (35, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'cfgEdit', NULL, 0, NULL, 0, NULL, 3, '修改系统参数', 2, 'cfg', '[0],[system],[cfg],', 1, NULL, '/cfg/update');
INSERT INTO `t_sys_menu` VALUES (36, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'cfgDelete', NULL, 0, NULL, 0, NULL, 3, '删除系统参数', 3, 'cfg', '[0],[system],[cfg],', 1, NULL, '/cfg/delete');
INSERT INTO `t_sys_menu` VALUES (37, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'task', 'views/system/task/index', 0, 'task', 1, NULL, 2, '任务管理', 11, 'system', '[0],[system],', 1, NULL, '/task');
INSERT INTO `t_sys_menu` VALUES (38, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'taskAdd', NULL, 0, NULL, 0, NULL, 3, '添加任务', 1, 'task', '[0],[system],[task],', 1, NULL, '/task/add');
INSERT INTO `t_sys_menu` VALUES (39, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'taskEdit', NULL, 0, NULL, 0, NULL, 3, '修改任务', 2, 'task', '[0],[system],[task],', 1, NULL, '/task/update');
INSERT INTO `t_sys_menu` VALUES (40, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'taskDelete', NULL, 0, NULL, 0, NULL, 3, '删除任务', 3, 'task', '[0],[system],[task],', 1, NULL, '/task/delete');
INSERT INTO `t_sys_menu` VALUES (41, 1, '2019-03-11 22:29:54', 1, '2019-03-11 22:29:54', 'channel', 'views/cms/channel/index', 0, 'channel', 1, NULL, 2, '栏目管理', 1, 'cms', '[0],[cms],', 1, NULL, '/channel');
INSERT INTO `t_sys_menu` VALUES (42, 1, '2019-03-11 22:30:17', 1, '2019-03-11 22:30:17', 'dish', 'views/cms/dish/index', 0, 'documentation', 1, NULL, 2, '菜品管理', 2, 'cms', '[0],[cms],', 1, NULL, '/dish');
INSERT INTO `t_sys_menu` VALUES (43, 1, '2019-03-11 22:30:52', 1, '2019-03-11 22:30:52', 'banner', 'views/cms/banner/index', 0, 'banner', 1, NULL, 2, 'banner管理', 3, 'cms', '[0],[cms],', 1, NULL, '/banner');
INSERT INTO `t_sys_menu` VALUES (44, 1, '2019-03-18 19:45:37', 1, '2019-03-18 19:45:37', 'order', 'views/cms/order/index', 0, 'contacts', 1, NULL, 2, '订单管理', 4, 'cms', '[0],[cms],', 1, NULL, '/order');
INSERT INTO `t_sys_menu` VALUES (45, 1, '2019-03-19 10:25:05', 1, '2019-03-19 10:25:05', 'file', 'views/cms/file/index', 0, 'file', 1, NULL, 2, '文件管理', 5, 'cms', '[0],[cms],', 1, NULL, '/fileMgr');
INSERT INTO `t_sys_menu` VALUES (46, 1, '2019-03-11 22:30:17', 1, '2019-03-11 22:30:17', 'editDish', 'views/cms/dish/edit.vue', 0, 'articleEdit', 1, NULL, 2, '新建文章', 1, 'cms', '[0],[cms],', 1, NULL, '/cms/dishEdit');
INSERT INTO `t_sys_menu` VALUES (47, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'taskLog', 'views/system/taskLog/index', 1, 'task', 1, NULL, 2, '任务日志', 4, 'system', '[0],[system]', 1, NULL, '/taskLog');
INSERT INTO `t_sys_menu` VALUES (48, 1, '2019-07-31 22:04:30', 1, '2019-06-02 10:25:31', 'log', 'views/operation/log/index', 0, 'log', 1, NULL, 2, '业务日志', 6, 'operationMgr', '[0],[operationMgr],', 1, NULL, '/log');
INSERT INTO `t_sys_menu` VALUES (49, 1, '2019-07-31 22:04:30', 1, '2019-06-02 10:25:36', 'loginLog', 'views/operation/loginLog/index', 0, 'logininfor', 1, NULL, 2, '登录日志', 6, 'operationMgr', '[0],[operationMgr],', 1, NULL, '/loginLog');
INSERT INTO `t_sys_menu` VALUES (50, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'logClear', NULL, 0, NULL, 0, NULL, 3, '清空日志', 3, 'log', '[0],[system],[log],', 1, NULL, '/log/delLog');
INSERT INTO `t_sys_menu` VALUES (51, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'logDetail', NULL, 0, NULL, 0, NULL, 3, '日志详情', 3, 'log', '[0],[system],[log],', 1, NULL, '/log/detail');
INSERT INTO `t_sys_menu` VALUES (52, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'loginLogClear', NULL, 0, NULL, 0, NULL, 3, '清空登录日志', 1, 'loginLog', '[0],[system],[loginLog],', 1, NULL, '/loginLog/delLoginLog');
INSERT INTO `t_sys_menu` VALUES (53, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'loginLogList', NULL, 0, NULL, 0, NULL, 3, '登录日志列表', 2, 'loginLog', '[0],[system],[loginLog],', 1, NULL, '/loginLog/list');
INSERT INTO `t_sys_menu` VALUES (54, 1, '2019-06-02 10:10:20', 1, '2019-06-02 10:10:20', 'druid', 'views/operation/druid/index', 0, 'monitor', 1, NULL, 2, '数据库管理', 1, 'operationMgr', '[0],[operationMgr],', 1, NULL, '/druid');
INSERT INTO `t_sys_menu` VALUES (55, 1, '2019-06-02 10:10:20', 1, '2019-06-02 10:10:20', 'swagger', 'views/operation/api/index', 0, 'swagger', 1, NULL, 2, '接口文档', 2, 'operationMgr', '[0],[operationMgr],', 1, NULL, '/swagger');
INSERT INTO `t_sys_menu` VALUES (56, 1, '2019-06-10 21:26:52', 1, '2019-06-10 21:26:52', 'messageMgr', 'layout', 0, 'message', 1, NULL, 1, '消息管理', 4, '0', '[0],', 1, NULL, '/message');
INSERT INTO `t_sys_menu` VALUES (57, 1, '2019-06-10 21:27:34', 1, '2019-06-10 21:27:34', 'msg', 'views/message/message/index', 0, 'message', 1, NULL, 2, '历史消息', 1, 'messageMgr', '[0],[messageMgr],', 1, NULL, '/history');
INSERT INTO `t_sys_menu` VALUES (58, 1, '2019-06-10 21:27:56', 1, '2019-06-10 21:27:56', 'msgTpl', 'views/message/template/index', 0, 'template', 1, NULL, 2, '消息模板', 2, 'messageMgr', '[0],[messageMgr],', 1, NULL, '/template');
INSERT INTO `t_sys_menu` VALUES (59, 1, '2019-06-10 21:28:21', 1, '2019-06-10 21:28:21', 'msgSender', 'views/message/sender/index', 0, 'sender', 1, NULL, 2, '消息发送者', 3, 'messageMgr', '[0],[messageMgr],', 1, NULL, '/sender');
INSERT INTO `t_sys_menu` VALUES (60, 1, '2019-06-10 21:28:21', 1, '2019-06-10 21:28:21', 'msgClear', NULL, 0, NULL, 1, NULL, 2, '清空历史消息', 3, 'messageMgr', '[0],[messageMgr],', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (61, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'msgTplEdit', NULL, 0, NULL, 0, NULL, 3, '编辑消息模板', 1, 'msgTpl', '[0],[messageMgr],[msgTpl]', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (62, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'msgTplDelete', NULL, 0, NULL, 0, NULL, 3, '删除消息模板', 2, 'msgTpl', '[0],[messageMgr],[msgTpl]', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (63, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'msgSenderEdit', NULL, 0, NULL, 0, NULL, 3, '编辑消息发送器', 1, 'msgSender', '[0],[messageMgr],[msgSender]', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (64, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'msgSenderDelete', NULL, 0, NULL, 0, NULL, 3, '删除消息发送器', 2, 'msgSender', '[0],[messageMgr],[msgSender]', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (65, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'fileUpload', NULL, 0, NULL, 0, NULL, 3, '上传文件', 1, 'file', '[0],[cms],[file],', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (66, 1, '2019-07-31 21:51:33', 1, '2019-07-31 21:51:33', 'bannerEdit', NULL, 0, NULL, 0, NULL, 3, '编辑banner', 1, 'banner', '[0],[cms],[banner],', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (67, 1, '2019-07-31 21:51:33', 1, '2019-07-31 21:51:33', 'bannerDelete', NULL, 0, NULL, 0, NULL, 3, '删除banner', 2, 'banner', '[0],[cms],[banner],', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (68, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'channelEdit', NULL, 0, NULL, 0, NULL, 3, '编辑栏目', 1, 'channel', '[0],[cms],[channel],', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (69, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'channelDelete', NULL, 0, NULL, 0, NULL, 3, '删除栏目', 2, 'channel', '[0],[cms],[channel],', 1, NULL, NULL);
INSERT INTO `t_sys_menu` VALUES (70, 1, '2019-07-31 22:04:30', 1, '2019-07-31 22:04:30', 'deleteDish', NULL, 0, NULL, 0, NULL, 3, '删除菜品', 2, 'dish', '[0],[cms],[dish]', 1, NULL, NULL);

-- ----------------------------
-- Table structure for t_sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_notice`;
CREATE TABLE `t_sys_notice`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_notice
-- ----------------------------
INSERT INTO `t_sys_notice` VALUES (1, 1, '2017-01-11 08:53:20', 1, '2019-01-08 23:30:58', 'Welcome', '超级管理员', 10);

-- ----------------------------
-- Table structure for t_sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_operation_log`;
CREATE TABLE `t_sys_operation_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `logname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细信息',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_operation_log
-- ----------------------------
INSERT INTO `t_sys_operation_log` VALUES (1, 'cn.yuanfeisyWong.guns.api.controller.cms.DishMgrController', '2019-05-10 13:22:49', '添加参数', '业务日志', '参数名称=system.app.name', 'upload', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (2, 'cn.yuanfeisyWong.guns.api.controller.cms.DishMgrController', '2019-06-10 13:31:09', '修改参数', '业务日志', '参数名称=system.app.name', 'upload', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (3, 'cn.yuanfeisyWong.guns.api.controller.cms.DishMgrController', '2019-07-10 13:22:49', '编辑文章', '业务日志', '参数名称=system.app.name', 'upload', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (4, 'cn.yuanfeisyWong.guns.api.controller.cms.DishMgrController', '2019-08-10 13:31:09', '编辑栏目', '业务日志', '参数名称=system.app.name', 'upload', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (5, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 00:11:21', '删除管理员', '业务日志', '账号=yuanfeisy', 'remove', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (6, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 00:11:27', '编辑管理员', '业务日志', '名字=yuanfeisy;;;', 'save', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (7, 'cn.yuanfeisy.flash.api.controller.system.DeptContoller', '2020-07-04 00:11:54', '编辑部门', '业务日志', '部门简称=开发区店;;;字段名称:部门简称,旧值:海甸岛店,新值:开发区店;;;字段名称:部门全称,旧值:海甸岛店,新值:开发区店', 'save', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (8, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 00:12:21', '编辑管理员', '业务日志', '名字=yuanfeisy;;;', 'save', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (9, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 00:12:26', '编辑管理员', '业务日志', '名字=yuanfeisy;;;', 'save', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (10, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 07:54:37', '编辑管理员', '业务日志', '名字=chaoswang;;;', 'save', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (11, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 07:55:27', '编辑管理员', '业务日志', '名字=chaoswang;;;', 'save', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (12, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 07:58:13', '编辑管理员', '业务日志', '名字=yuanfeisy;;;', 'save', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (13, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 07:58:28', '设置用户角色', '业务日志', '账号=yuanfeisy', 'setRole', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (14, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 08:33:09', '编辑管理员', '业务日志', '名字=test;;;', 'save', '成功', 1);
INSERT INTO `t_sys_operation_log` VALUES (15, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 08:56:36', '删除管理员', '业务日志', '账号=test', 'remove', '成功', 5);
INSERT INTO `t_sys_operation_log` VALUES (16, 'cn.yuanfeisy.flash.api.controller.system.UserController', '2020-07-04 08:56:41', '编辑管理员', '业务日志', '名字=test;;;', 'save', '成功', 5);

-- ----------------------------
-- Table structure for t_sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_relation`;
CREATE TABLE `t_sys_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `menuid` bigint(0) NULL DEFAULT NULL,
  `roleid` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单角色关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_relation
-- ----------------------------
INSERT INTO `t_sys_relation` VALUES (1, 42, 1);
INSERT INTO `t_sys_relation` VALUES (2, 70, 1);
INSERT INTO `t_sys_relation` VALUES (3, 46, 1);
INSERT INTO `t_sys_relation` VALUES (4, 43, 1);
INSERT INTO `t_sys_relation` VALUES (5, 67, 1);
INSERT INTO `t_sys_relation` VALUES (6, 66, 1);
INSERT INTO `t_sys_relation` VALUES (7, 33, 1);
INSERT INTO `t_sys_relation` VALUES (8, 34, 1);
INSERT INTO `t_sys_relation` VALUES (9, 36, 1);
INSERT INTO `t_sys_relation` VALUES (10, 35, 1);
INSERT INTO `t_sys_relation` VALUES (11, 41, 1);
INSERT INTO `t_sys_relation` VALUES (12, 69, 1);
INSERT INTO `t_sys_relation` VALUES (13, 68, 1);
INSERT INTO `t_sys_relation` VALUES (14, 2, 1);
INSERT INTO `t_sys_relation` VALUES (15, 44, 1);
INSERT INTO `t_sys_relation` VALUES (16, 21, 1);
INSERT INTO `t_sys_relation` VALUES (17, 32, 1);
INSERT INTO `t_sys_relation` VALUES (18, 24, 1);
INSERT INTO `t_sys_relation` VALUES (19, 29, 1);
INSERT INTO `t_sys_relation` VALUES (20, 23, 1);
INSERT INTO `t_sys_relation` VALUES (21, 28, 1);
INSERT INTO `t_sys_relation` VALUES (22, 22, 1);
INSERT INTO `t_sys_relation` VALUES (23, 25, 1);
INSERT INTO `t_sys_relation` VALUES (24, 27, 1);
INSERT INTO `t_sys_relation` VALUES (25, 31, 1);
INSERT INTO `t_sys_relation` VALUES (26, 26, 1);
INSERT INTO `t_sys_relation` VALUES (27, 30, 1);
INSERT INTO `t_sys_relation` VALUES (28, 54, 1);
INSERT INTO `t_sys_relation` VALUES (29, 45, 1);
INSERT INTO `t_sys_relation` VALUES (30, 65, 1);
INSERT INTO `t_sys_relation` VALUES (31, 48, 1);
INSERT INTO `t_sys_relation` VALUES (32, 50, 1);
INSERT INTO `t_sys_relation` VALUES (33, 51, 1);
INSERT INTO `t_sys_relation` VALUES (34, 49, 1);
INSERT INTO `t_sys_relation` VALUES (35, 52, 1);
INSERT INTO `t_sys_relation` VALUES (36, 53, 1);
INSERT INTO `t_sys_relation` VALUES (37, 17, 1);
INSERT INTO `t_sys_relation` VALUES (38, 18, 1);
INSERT INTO `t_sys_relation` VALUES (39, 20, 1);
INSERT INTO `t_sys_relation` VALUES (40, 19, 1);
INSERT INTO `t_sys_relation` VALUES (41, 56, 1);
INSERT INTO `t_sys_relation` VALUES (42, 4, 1);
INSERT INTO `t_sys_relation` VALUES (43, 5, 1);
INSERT INTO `t_sys_relation` VALUES (44, 7, 1);
INSERT INTO `t_sys_relation` VALUES (45, 6, 1);
INSERT INTO `t_sys_relation` VALUES (46, 9, 1);
INSERT INTO `t_sys_relation` VALUES (47, 8, 1);
INSERT INTO `t_sys_relation` VALUES (48, 11, 1);
INSERT INTO `t_sys_relation` VALUES (49, 10, 1);
INSERT INTO `t_sys_relation` VALUES (50, 57, 1);
INSERT INTO `t_sys_relation` VALUES (51, 60, 1);
INSERT INTO `t_sys_relation` VALUES (52, 59, 1);
INSERT INTO `t_sys_relation` VALUES (53, 64, 1);
INSERT INTO `t_sys_relation` VALUES (54, 63, 1);
INSERT INTO `t_sys_relation` VALUES (55, 58, 1);
INSERT INTO `t_sys_relation` VALUES (56, 62, 1);
INSERT INTO `t_sys_relation` VALUES (57, 61, 1);
INSERT INTO `t_sys_relation` VALUES (58, 3, 1);
INSERT INTO `t_sys_relation` VALUES (59, 12, 1);
INSERT INTO `t_sys_relation` VALUES (60, 13, 1);
INSERT INTO `t_sys_relation` VALUES (61, 15, 1);
INSERT INTO `t_sys_relation` VALUES (62, 14, 1);
INSERT INTO `t_sys_relation` VALUES (63, 16, 1);
INSERT INTO `t_sys_relation` VALUES (64, 55, 1);
INSERT INTO `t_sys_relation` VALUES (65, 1, 1);
INSERT INTO `t_sys_relation` VALUES (66, 37, 1);
INSERT INTO `t_sys_relation` VALUES (67, 38, 1);
INSERT INTO `t_sys_relation` VALUES (68, 40, 1);
INSERT INTO `t_sys_relation` VALUES (69, 39, 1);
INSERT INTO `t_sys_relation` VALUES (70, 47, 1);
INSERT INTO `t_sys_relation` VALUES (128, 41, 2);
INSERT INTO `t_sys_relation` VALUES (129, 42, 2);
INSERT INTO `t_sys_relation` VALUES (130, 43, 2);
INSERT INTO `t_sys_relation` VALUES (131, 44, 2);
INSERT INTO `t_sys_relation` VALUES (132, 45, 2);
INSERT INTO `t_sys_relation` VALUES (133, 46, 2);
INSERT INTO `t_sys_relation` VALUES (134, 65, 2);
INSERT INTO `t_sys_relation` VALUES (135, 66, 2);
INSERT INTO `t_sys_relation` VALUES (136, 67, 2);
INSERT INTO `t_sys_relation` VALUES (137, 68, 2);
INSERT INTO `t_sys_relation` VALUES (138, 69, 2);
INSERT INTO `t_sys_relation` VALUES (139, 70, 2);
INSERT INTO `t_sys_relation` VALUES (143, 2, 2);

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deptid` bigint(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(0) NULL DEFAULT NULL,
  `pid` bigint(0) NULL DEFAULT NULL,
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES (1, NULL, NULL, NULL, NULL, 24, '超级管理员', 1, 0, 'administrator', 1);
INSERT INTO `t_sys_role` VALUES (2, NULL, NULL, NULL, NULL, 3, '网站管理员', 2, 1, 'developer', NULL);
INSERT INTO `t_sys_role` VALUES (3, NULL, NULL, NULL, NULL, 5, '用户', 3, 1, 'user', NULL);

-- ----------------------------
-- Table structure for t_sys_task
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_task`;
CREATE TABLE `t_sys_task`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `concurrent` tinyint(0) NULL DEFAULT NULL COMMENT '是否允许并发',
  `cron` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时规则',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行参数',
  `disabled` tinyint(0) NULL DEFAULT NULL COMMENT '是否禁用',
  `exec_at` datetime(0) NULL DEFAULT NULL COMMENT '执行时间',
  `exec_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行结果',
  `job_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行类',
  `job_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_task
-- ----------------------------
INSERT INTO `t_sys_task` VALUES (1, 1, '2018-12-28 09:54:00', -1, '2019-03-27 11:47:11', 0, '0 0/30 * * * ?', '{\n\"appname\": \"web-flash\",\n\"version\":1\n}\n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            ', 0, '2019-03-27 11:47:00', '执行成功', '.service.task.job.HelloJob', 'default', '测试任务', '测试任务,每30分钟执行一次');

-- ----------------------------
-- Table structure for t_sys_task_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_task_log`;
CREATE TABLE `t_sys_task_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `exec_at` datetime(0) NULL DEFAULT NULL COMMENT '执行时间',
  `exec_success` int(0) NULL DEFAULT NULL COMMENT '执行结果（成功:1、失败:0)',
  `id_task` bigint(0) NULL DEFAULT NULL,
  `job_exception` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抛出异常',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `deptid` bigint(0) NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'email',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `roleid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id列表，以逗号分隔',
  `salt` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码盐',
  `sex` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (-1, NULL, NULL, NULL, NULL, 'system', NULL, NULL, NULL, NULL, '应用系统', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_user` VALUES (1, NULL, '2016-01-29 08:49:53', 1, '2019-03-20 23:45:24', 'admin', NULL, '2017-05-05 00:00:00', 2, '123@qq.com', '管理员', 'b5a51391f271f062867e5984e2fcffee', '15021222222', '1', '8pgby', 2, 1, 25);
INSERT INTO `t_sys_user` VALUES (2, NULL, '2018-09-13 17:21:02', 1, '2019-01-09 23:05:51', 'developer', NULL, '2017-12-31 00:00:00', 3, '456@qq.com', '网站管理员', 'fac36d5616fe9ebd460691264b28ee27', '15022222222', '2,', 'vscp9', 1, 1, NULL);
INSERT INTO `t_sys_user` VALUES (4, NULL, '2019-10-20 18:53:40', 1, '2020-07-04 07:54:37', 'chaoswang', NULL, '1998-09-07 00:00:00', 5, 'chaoswang@chaoswang.Hainanu', 'chaoswang', 'c56ca76684b08eb6c344206c804aa383', '15706589233', '3', '47067', 1, 1, NULL);
INSERT INTO `t_sys_user` VALUES (5, 1, '2020-07-04 07:58:13', 1, '2020-07-04 07:58:28', 'yuanfeisy', NULL, '1999-01-30 00:00:00', 4, '4392@qq.com', 'yuanfeisy', '57098759308eee1157d177af481140f8', '123456789', '1,', 'qtjje', 1, 1, NULL);
INSERT INTO `t_sys_user` VALUES (6, 1, '2020-07-04 08:33:09', 5, '2020-07-04 08:56:41', 'test', NULL, '2004-07-15 00:00:00', 5, '439@qq.com', 'test', '851e851964ac6da90316227a09c49fdf', '123456', NULL, 'rf2ke', 1, 1, NULL);

-- ----------------------------
-- Table structure for t_test_boy
-- ----------------------------
DROP TABLE IF EXISTS `t_test_boy`;
CREATE TABLE `t_test_boy`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `has_girl_friend` tinyint(0) NULL DEFAULT NULL COMMENT '是否有女朋友',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '男孩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_test_boy
-- ----------------------------
INSERT INTO `t_test_boy` VALUES (1, NULL, NULL, NULL, NULL, 18, '2000-01-01', 1, '张三');

-- ----------------------------
-- Table structure for t_test_girl
-- ----------------------------
DROP TABLE IF EXISTS `t_test_girl`;
CREATE TABLE `t_test_girl`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint(0) NULL DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `has_boy_friend` tinyint(0) NULL DEFAULT NULL COMMENT '是否有男朋友',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '女孩' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
