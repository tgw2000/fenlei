/*
Navicat MySQL Data Transfer

Source Server         : locahost
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : fenlei

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2016-01-06 00:23:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `f_admin`
-- ----------------------------
DROP TABLE IF EXISTS `f_admin`;
CREATE TABLE `f_admin` (
  `uid` int(10) unsigned NOT NULL auto_increment,
  `user` char(50) NOT NULL,
  `pwd` char(50) NOT NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_admin
-- ----------------------------
INSERT INTO `f_admin` VALUES ('1', 'admin', '112b37ff282a9e41b4fb187f1a8d7f15');

-- ----------------------------
-- Table structure for `f_area`
-- ----------------------------
DROP TABLE IF EXISTS `f_area`;
CREATE TABLE `f_area` (
  `aid` mediumint(6) NOT NULL auto_increment,
  `title` varchar(32) NOT NULL,
  `pid` int(11) unsigned NOT NULL,
  `sort` smallint(6) NOT NULL,
  PRIMARY KEY  (`aid`),
  KEY `areaname` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_area
-- ----------------------------
INSERT INTO `f_area` VALUES ('1', '市中区', '0', '1');
INSERT INTO `f_area` VALUES ('2', '任城区', '0', '2');
INSERT INTO `f_area` VALUES ('3', '高新区', '0', '3');
INSERT INTO `f_area` VALUES ('4', '兖州', '0', '4');
INSERT INTO `f_area` VALUES ('5', '曲阜', '0', '5');
INSERT INTO `f_area` VALUES ('6', '邹城', '0', '6');
INSERT INTO `f_area` VALUES ('7', '泗水', '0', '7');
INSERT INTO `f_area` VALUES ('8', '微山', '0', '8');
INSERT INTO `f_area` VALUES ('9', '鱼台', '0', '9');
INSERT INTO `f_area` VALUES ('10', '金乡', '0', '10');
INSERT INTO `f_area` VALUES ('11', '嘉祥', '0', '11');
INSERT INTO `f_area` VALUES ('12', '梁山', '0', '12');
INSERT INTO `f_area` VALUES ('13', '汶上', '0', '13');

-- ----------------------------
-- Table structure for `f_category`
-- ----------------------------
DROP TABLE IF EXISTS `f_category`;
CREATE TABLE `f_category` (
  `cid` mediumint(6) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL,
  `pinyin` varchar(50) default NULL,
  `template` text,
  `color` char(10) default NULL,
  `description` mediumtext,
  `pid` int(11) default NULL,
  `mid` smallint(5) NOT NULL,
  `codes` char(255) default NULL,
  `sort` smallint(6) NOT NULL,
  `keywords` varchar(255) default NULL,
  `icon` varchar(50) default NULL,
  PRIMARY KEY  (`cid`),
  KEY `parentid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=672 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_category
-- ----------------------------
INSERT INTO `f_category` VALUES ('1', '房产交易', 'fangwu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '<p>房屋频道为您提供了最新的济宁租房、济宁售房、济宁二手房、济宁店铺、济宁房产等各种相关的济宁房产信息。免费发布与查询济宁房产信息，流程即轻松又快捷。</p>', '0', '0', '9', '1', '', null);
INSERT INTO `f_category` VALUES ('2', '跳蚤市场', 'jiaoyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '若卖方要求支付定金，建议用户不管在什么情况下，都不要支付。 <br />建议用户通过支付宝付款，有效保障您的个人权益。 <br />交易时请警惕网络诈骗、欺诈交易。有卖家卖手机、汽车、笔记本等的，请查询手机归属地以确保是同城交易。 <br />若遇上疑似或确定为欺诈交易、网络诈骗等信息，请向本网站举报。', '0', '7', '1,5', '2', '跳蚤市场', null);
INSERT INTO `f_category` VALUES ('3', '招聘求职', 'zhaopin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '敬告各位求职者：国家明文规定，用工单位禁收任何费用（职介机构除外）。 <br />若有用工单位向您收取费用，请各位求职者保持警惕！', '0', '9', '12', '5', '', 'hr.jpg');
INSERT INTO `f_category` VALUES ('4', '交友征婚', 'jiaoyou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '同城交友第一次见面，尤其是女生，记得，女生一定要有防范意识。 <br />建议最好选择在公共场所见面，找朋友陪同。', '0', '10', '7,8,11', '9', '交友征婚', null);
INSERT INTO `f_category` VALUES ('5', '同城活动', 'tongcheng', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '0', '1', '11', '4', '', null);
INSERT INTO `f_category` VALUES ('313', '初中家教', 'chuzhong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '74', '8', '7,8', '2', '', null);
INSERT INTO `f_category` VALUES ('314', '中考家教', 'zhongkao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '74', '8', '7,8', '3', '', null);
INSERT INTO `f_category` VALUES ('6', '生活服务', 'fuwu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '0', '11', '7,8', '7', '', null);
INSERT INTO `f_category` VALUES ('13', '住房出租', 'chuzu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:14:\"add/post_cuzhu\";}', '', '', '1', '2', '1,5', '1', '出租房', 'fw.jpg');
INSERT INTO `f_category` VALUES ('14', '住房出售', 'chushou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:15:\"add/post_cushou\";}', '', '1.购房者要仔细观察房屋结构，检查房屋是否存在安全隐患。了解房屋是否具有产权证、是否设定抵押、是否可以自由转让。 <br />2.办理交易过户手续请到济宁市房地产交易中心。', '1', '3', '1,5', '2', '二手房出售', null);
INSERT INTO `f_category` VALUES ('15', '房产求租/求购', 'qiuzhu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:15:\"add/post_qiuzhu\";}', '#FF3300', '1.房东应当与承租人签订正规房屋租赁合同，明确是否允许合租、转租、或者作除住宿以外的其他用途。 <br />2.房屋内家具、家电等物品一定要清点核对并确定是否正常使用，水电、煤气、宽带等费用一定要核对清楚。', '1', '4', '7,8', '3', '', null);
INSERT INTO `f_category` VALUES ('16', '写字楼/店面/仓库/厂房', 'xiezilou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:18:\"add/post_xiezhilou\";}', '', '1.转让店面或商用房屋时，一定要签订正规转让协议，由房东、转让方、受让方三方签署。 <br />2.注意营业执照是否随店转让、是否拖欠税费、房租、水电费等。', '1', '5', '1,5', '4', '', null);
INSERT INTO `f_category` VALUES ('17', '其它房屋信息', 'qitafangwu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:19:\"add/post_qitafangwu\";}', '', '1.房屋、土地买卖、转让是一件大事，仔细观察、多方询问了解、签订正规合同，有利于保障合法权益不受侵害。 <br />2.如有疑问，可向有关政府部门咨询：济宁市房管局 济宁市国土资源局', '1', '6', '7,8', '5', '', null);
INSERT INTO `f_category` VALUES ('25', '手机交易/配件', 'shouji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。<br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '0', '1,5', '25', '二手台式电脑', null);
INSERT INTO `f_category` VALUES ('26', '二手电脑/笔记本/配件', 'diannao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '26', '二手笔记本', null);
INSERT INTO `f_category` VALUES ('27', '手机号码/虚拟物品', 'haoma', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '27', '手机/通讯相关', null);
INSERT INTO `f_category` VALUES ('28', '通讯/宽带', 'tongxun', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '28', '二手数码/摄录', null);
INSERT INTO `f_category` VALUES ('29', '数码产品/相机', 'shuma', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '#FF3300', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '29', '音响/乐器/影音', null);
INSERT INTO `f_category` VALUES ('30', '二手家电', 'jiadian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '30', '软件/图书/音像', null);
INSERT INTO `f_category` VALUES ('31', '二手家具/家居', 'ershoujiaju', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '31', '艺术品/收藏品/收藏品', null);
INSERT INTO `f_category` VALUES ('32', '服装/鞋帽/箱包', 'fuzhuangxiangbao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '32', '音响/乐器/影音', null);
INSERT INTO `f_category` VALUES ('33', '饰品/化妆品', 'shipin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '33', '母婴/儿童用品', null);
INSERT INTO `f_category` VALUES ('34', '母婴/儿童用品/玩具', 'muying', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '34', '服饰/箱包/鞋帽', null);
INSERT INTO `f_category` VALUES ('35', '婚庆用品/烟酒/酒店转让', 'hunqing', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '35', '', null);
INSERT INTO `f_category` VALUES ('220', '婚纱礼服', 'hunsha', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '35', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('36', '艺术品/收藏品', 'yishu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '36', '办公用品/耗材', null);
INSERT INTO `f_category` VALUES ('37', '图书/音像/软件', 'tushu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '37', '运动/健身器材', null);
INSERT INTO `f_category` VALUES ('38', '文体/户外/乐器', 'wenti', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '38', '家居/日用百货', null);
INSERT INTO `f_category` VALUES ('39', '办公用品/设备', 'bangong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '39', '二手家电', null);
INSERT INTO `f_category` VALUES ('40', '二手设备/五金/材料', 'ershoushebei', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '40', '网游/虚拟物品', null);
INSERT INTO `f_category` VALUES ('41', '水货手机', 'guowai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '25', '7', '1,5', '1', '其他物品', null);
INSERT INTO `f_category` VALUES ('42', '普工/技工', 'pugong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '3', '', null);
INSERT INTO `f_category` VALUES ('512', '质检员', 'zhijianyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('513', '普通工人', 'putonggongren', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('43', '行政/人事/后勤', 'xingzhengrenshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '2', '', null);
INSERT INTO `f_category` VALUES ('503', '文员', 'wenyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '43', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('504', '秘书', 'mishu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '43', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('44', '贸易/采购/商务', 'maoyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '21', '', null);
INSERT INTO `f_category` VALUES ('590', '外贸专员/助理', 'waimaozuanyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '44', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('591', '外贸业务员', 'waimaoyewuyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '44', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('45', '销售/市场/顾问', 'xiaoshou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '1', '', null);
INSERT INTO `f_category` VALUES ('491', '销售代表', 'xiaoshoudaibiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('492', '电话销售', 'dianhuaxiaoshou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('46', '财务/会计/出纳', 'caikuai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '5', '', null);
INSERT INTO `f_category` VALUES ('531', '财务/财务总监', 'chaiwu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '46', '9', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('532', '会计/会计助理', 'kuaiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '46', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('47', '家政/保洁/安保', 'jiazhengbaojie', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '7', '', null);
INSERT INTO `f_category` VALUES ('535', '保洁', 'baojie', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '47', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('536', '保安', 'baoan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '47', '9', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('48', '公关/演艺/吧丽/DJ', 'gongguan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '敬告各位求职者：国家明文规定，用工单位禁收任何费用（职介机构除外）。 <br />若有用工单位向您收取费用，请各位求职者保持警惕！', '3', '9', '7,8', '16', '', null);
INSERT INTO `f_category` VALUES ('549', '模特', 'mote', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '48', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('49', '金融/证券/投资', 'jinrongtouzhi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '26', '', null);
INSERT INTO `f_category` VALUES ('598', '证券/金融研究', 'zhengquan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '49', '9', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('599', '投资/理财顾问', 'tuozhilicai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '49', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('50', '美容/美发/按摩', 'meirongmeifa', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '15', '', null);
INSERT INTO `f_category` VALUES ('540', '美容师', 'meirongshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '50', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('541', '美发师', 'meifashi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '50', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('51', '医疗/制药/生物', 'yiliao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '19', '', null);
INSERT INTO `f_category` VALUES ('560', '医生', 'yisheng', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '51', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('561', '护士/护理', 'hushi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '51', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('52', '教育/家教/培训', 'jiaoyu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '#f54100', '', '3', '9', '7,8', '12', '', null);
INSERT INTO `f_category` VALUES ('584', '教师/助教', 'jiaoshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '52', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('585', '培训师/讲师', 'jiangshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '52', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('53', '游戏代练/游戏推广员', 'youxi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '14', '', null);
INSERT INTO `f_category` VALUES ('538', '游戏推广', 'youxituiguang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '53', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('539', '游戏代练', 'youxidailian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '53', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('54', '计算机/网络/通信', 'hulianwang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '5', '', null);
INSERT INTO `f_category` VALUES ('564', '技术支持/维护', 'jishuweihu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('565', '技术总监/经理', 'jishuzongjian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('55', '超市/百货/零售', 'chaoshibaihuo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '6', '', null);
INSERT INTO `f_category` VALUES ('577', '营业员/店员', 'yingyeyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '55', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('578', '收银员', 'shouyinyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '55', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('56', '餐饮/酒店/旅游', 'canyin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '4', '', null);
INSERT INTO `f_category` VALUES ('522', '服务员', 'fuwuyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '56', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('523', '厨师/厨师长', 'chushi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '56', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('59', '找男友', 'nanyou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '4', '10', '7,8', '59', '', 'nanyou.jpg');
INSERT INTO `f_category` VALUES ('312', '小升初家教', 'xiaoshengchu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '74', '8', '7,8', '1', '', null);
INSERT INTO `f_category` VALUES ('60', '找女友', 'nvyou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '4', '10', '7,8', '60', '', 'nvyou.jpg');
INSERT INTO `f_category` VALUES ('310', '职业/技能培训', 'zhiyejineng', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '307', '8', '7,8', '2', '', null);
INSERT INTO `f_category` VALUES ('61', '找老乡', 'laoxiang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '4', '10', '7,8', '61', '', null);
INSERT INTO `f_category` VALUES ('309', '留学/移民/签证', 'liuxueyimin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '307', '8', '7,8', '3', '', null);
INSERT INTO `f_category` VALUES ('62', '其它交友', 'qitajiaoyou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '4', '10', '7,8', '62', '', null);
INSERT INTO `f_category` VALUES ('307', '教育培训', 'peixun', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '0', '8', '7,8', '6', '', null);
INSERT INTO `f_category` VALUES ('308', '学历教育', 'xuelijiaoyu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '307', '8', '7,8', '1', '', null);
INSERT INTO `f_category` VALUES ('63', '活动召集', 'zhaoji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '5', '1', '7,8', '63', '', null);
INSERT INTO `f_category` VALUES ('319', '远程/网络教育', 'yuancheng', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '308', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('64', '团购/打折', 'tuangou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '5', '1', '7,8', '64', '', null);
INSERT INTO `f_category` VALUES ('321', '公务员', 'gongwuyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '308', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('322', '学历认证', 'xuelirenzheng', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '308', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('65', '结伴出游', 'chuyou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '5', '1', '7,8', '65', '', null);
INSERT INTO `f_category` VALUES ('320', '成人教育', 'chengrenjiaoyu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '308', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('66', '相约运动', 'yundong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '5', '1', '7,8', '66', '', null);
INSERT INTO `f_category` VALUES ('317', '其他家教', 'qitajiajiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '74', '8', '7,8', '6', '', null);
INSERT INTO `f_category` VALUES ('318', '考研', 'kaoyan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '308', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('67', '公益活动/志愿者', 'gongyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '5', '1', '7,8', '67', '', null);
INSERT INTO `f_category` VALUES ('316', '高考冲刺班', 'gaokao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '74', '8', '7,8', '5', '', null);
INSERT INTO `f_category` VALUES ('68', '讲座/研讨会', 'jiangzhuo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '5', '1', '7,8', '68', '', null);
INSERT INTO `f_category` VALUES ('315', '高中家教', 'gaozhong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '74', '8', '7,8', '4', '', null);
INSERT INTO `f_category` VALUES ('69', '演出/展览', 'yuanchu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '同城交友第一次见面，尤其是女生，记得，女生一定要有防范意识。 <br />建议最好选择在公共场所见面，找朋友陪同。', '5', '1', '7,8', '69', '', null);
INSERT INTO `f_category` VALUES ('70', '快递/物流/货运', 'kuaidi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '4', '', null);
INSERT INTO `f_category` VALUES ('71', '生活配送/跑腿/外卖', 'peisong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '6', '', null);
INSERT INTO `f_category` VALUES ('72', '急开锁/配锁/换锁', 'kaisuo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '23', '', null);
INSERT INTO `f_category` VALUES ('73', '房屋维修', 'fangwuweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '9', '', null);
INSERT INTO `f_category` VALUES ('378', '水管维修', 'shuiguanweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '73', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('74', '家教', 'jiajiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '307', '8', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('311', '小学家教', 'xiaoxue', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '74', '8', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('75', '娱乐场所', 'yulechangshuo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '11', '', null);
INSERT INTO `f_category` VALUES ('76', '家政/钟点工/月嫂', 'jiazheng', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '1', '', null);
INSERT INTO `f_category` VALUES ('77', '运动健身', 'jianshen', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '12', '', null);
INSERT INTO `f_category` VALUES ('78', '搬家', 'banjia', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '3', '', null);
INSERT INTO `f_category` VALUES ('422', '商务服务', 'business', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '0', '11', '7,8', '8', '', null);
INSERT INTO `f_category` VALUES ('79', '装修/装饰', 'zhuangxiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '8', '', null);
INSERT INTO `f_category` VALUES ('80', '管道疏通/打孔/防水', 'shutong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '2', '管道疏通/打孔', null);
INSERT INTO `f_category` VALUES ('81', '电脑/手机/数码维修', 'diannaoweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '5', '电脑维修', null);
INSERT INTO `f_category` VALUES ('82', '家电维修', 'jiadianweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '7', '', null);
INSERT INTO `f_category` VALUES ('83', '婚庆/庆典/司仪', 'qingdian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '20', '', null);
INSERT INTO `f_category` VALUES ('396', '婚庆公司', 'hunqinggongsi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '83', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('84', '宾馆酒店', 'jiudian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '15', '', null);
INSERT INTO `f_category` VALUES ('406', '经济型酒店', 'jingjixing', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '84', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('85', '摄影摄像/写真', 'shexiang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '17', '', null);
INSERT INTO `f_category` VALUES ('409', '婚纱影楼', 'hunshayinglou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '85', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('86', '美容/美发/美体', 'meiti', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '12', '', null);
INSERT INTO `f_category` VALUES ('403', '美发', 'meifa', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '86', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('87', '美容美体', 'meirongmeiti', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '86', '11', '7,8', '87', '', null);
INSERT INTO `f_category` VALUES ('88', '旅游相关', 'lvxing', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '6', '11', '7,8', '17', '', null);
INSERT INTO `f_category` VALUES ('89', '票务/特价机票', 'piaowu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '#FF3300', '', '6', '11', '7,8', '21', '', null);
INSERT INTO `f_category` VALUES ('144', '物品交换/赠送', 'wupinjiaohuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '146', '五金/机械设备/建材', null);
INSERT INTO `f_category` VALUES ('161', '其它物品交易', 'qitajiaoyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。', '2', '7', '1,5', '148', '其它交易', null);
INSERT INTO `f_category` VALUES ('145', '闲置礼品', 'xianzhi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '<p>交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />\r\n搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。</p>', '2', '7', '1,5', '147', '专业收购', null);
INSERT INTO `f_category` VALUES ('146', '行货手机', 'guochan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '<p>交易时请警惕网络诈骗、先付款后发货交易、欺诈交易。 <br />\r\n搜济宁建议您只进行同城或当面交易，并检查物品的相关资料和手续。</p>', '25', '7', '1,5', '0', '个人求购', null);
INSERT INTO `f_category` VALUES ('592', '外贸经理/主管', 'waimaojingli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '44', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('542', '洗头工', 'xitougong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '50', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('543', '美甲师', 'meijiashi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '50', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('151', '司机', 'siji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '17', '', null);
INSERT INTO `f_category` VALUES ('556', '货运司机', 'huoyunsiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '151', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('557', '出租车司机', 'chuzuchesiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '151', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('152', '农/林/牧/渔业', 'nonglinmu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '27', '', null);
INSERT INTO `f_category` VALUES ('603', '养殖人员', 'yangzhi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '152', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('604', '农艺师', 'nongyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '152', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('153', '其它招聘', 'qitazhaopin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '敬告各位求职者：国家明文规定，用工单位禁收任何费用（职介机构除外）。 <br />若有用工单位向您收取费用，请各位求职者保持警惕！', '3', '9', '', '157', '其它招聘', null);
INSERT INTO `f_category` VALUES ('154', '个人求职', 'qiuzhi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '13', '7,8,12', '158', '', null);
INSERT INTO `f_category` VALUES ('593', '采购员/助理', 'chaigouyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '44', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('162', '电视机', 'dianshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '电视机', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('163', '手机配件', 'peijian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '25', '7', '1,5', '3', '', null);
INSERT INTO `f_category` VALUES ('164', '其它手机', 'qitashouji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '25', '7', '1,5', '4', '', null);
INSERT INTO `f_category` VALUES ('165', '台式机', 'taishiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '26', '7', '1,5', '0', '', null);
INSERT INTO `f_category` VALUES ('166', '笔记本', 'bijiben', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '26', '7', '1,5', '0', '', null);
INSERT INTO `f_category` VALUES ('167', '平板电脑/ipad', 'pingban', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '26', '7', '1,5', '3', '', null);
INSERT INTO `f_category` VALUES ('168', '硬件', 'yingjian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '26', '7', '1,5', '4', '', null);
INSERT INTO `f_category` VALUES ('169', '外设产品', 'wanshe', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '26', '7', '1,5', '5', '', null);
INSERT INTO `f_category` VALUES ('170', '其它配件', 'qitapeijian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '26', '7', '1,5', '6', '', null);
INSERT INTO `f_category` VALUES ('171', '手机号', 'shoujihao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '27', '7', null, '0', '', null);
INSERT INTO `f_category` VALUES ('172', 'QQ号', 'qq', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '27', '7', null, '1', '', null);
INSERT INTO `f_category` VALUES ('173', '游戏账号/网游装备', 'youxiwangyou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '27', '7', null, '3', '', null);
INSERT INTO `f_category` VALUES ('174', '其他虚拟物品', 'qitaxnwp', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '27', '7', null, '4', '', null);
INSERT INTO `f_category` VALUES ('175', '充值卡', 'chongzhika', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '28', '7', null, '0', '', null);
INSERT INTO `f_category` VALUES ('176', '手机上网卡', 'shangwangka', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '28', '7', null, '1', '', null);
INSERT INTO `f_category` VALUES ('177', '手机业务', 'shoujiyewu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '28', '7', null, '2', '', null);
INSERT INTO `f_category` VALUES ('178', '数码相机', 'shumaxiangji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '29', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('179', '数码摄像机', 'shexiangji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '29', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('180', 'MP3/MP4', 'shuishenting', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '29', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('181', '游戏机', 'youxiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '29', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('182', '音频设备', 'yinpinshebei', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '29', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('183', '其它数码产品', 'qtshuma', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '29', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('184', '洗衣机', 'xiyiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('185', '空调', 'kongdiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('186', '冰箱/冰柜', 'bingxiangbinggui', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('187', '微波炉', 'weibolu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('188', '饮水机', 'yinshuiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('189', '家电配件', 'jiadianpeijian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('190', '热水器', 'reshuiqi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('191', '音响/音箱', 'yinxiangyinxiang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('192', '烤箱', 'kaoxiang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('193', '其他家电', 'qitajiadian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '30', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('202', '服装', 'fuzhuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '32', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('195', '床/床垫', 'chuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '31', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('196', '柜子', 'guizi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '31', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('197', '桌子', 'zhuozi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '31', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('198', '椅子/沙发', 'yizishafa', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '31', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('199', '居家用品/家纺', 'jujiayongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '31', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('200', '茶几', 'chaji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '31', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('201', '其他家具/家居', 'qitajiaju', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '31', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('203', '鞋帽', 'xiemao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '32', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('204', '服饰配件', 'fushipeijian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '32', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('205', '箱包', 'xiangbao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '32', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('206', '其他服装', 'qitafuzhuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '32', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('207', '美容用品', 'meirongyongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '33', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('208', '护肤品', 'hufupin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '33', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('209', '美体用品', 'meitiyongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '33', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('210', '化妆品', 'huazhuangpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '33', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('211', '保健品', 'baojianpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '33', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('212', '美发用品', 'meifayongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '33', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('213', '美甲用品', 'meijiayongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '33', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('214', '香水', 'xiangshui', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '33', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('215', '其他饰品', 'qitashipin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '33', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('216', '孕妇用品', 'yunfuyongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '34', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('217', '婴儿用品', 'yingeryongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '34', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('218', '玩具', 'wanju', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '34', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('219', '其他母婴用品', 'qitamuying', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '34', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('221', '烟/酒', 'yanjiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '35', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('222', '婚庆酒店', 'hunqingjiudian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '35', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('223', '其他婚庆用品', 'qitahunqing', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '35', '7', '', '0', '', null);
INSERT INTO `f_category` VALUES ('224', '古董古玩', 'gudong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '36', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('225', '书法绘画', 'shufa', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '36', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('226', '珠宝玉器', 'zhubao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '36', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('227', '纪念品', 'jinianpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '36', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('228', '工艺品', 'gongyipin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '36', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('229', '其他收藏品', 'qtshouchang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '36', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('230', '书籍', 'shuji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '37', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('231', '影片/电视剧', 'yingpian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '37', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('232', '音乐', 'yinle', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '37', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('233', '软件', 'ruanjian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '37', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('234', '其他图书/音像/软件', 'qitatushu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '37', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('235', '户外用品', 'huwai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '38', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('236', '文教用品', 'wenjiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '38', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('237', '健身器械', 'jianshenqixie', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '38', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('238', '乐器', 'leqi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '38', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('239', '球类用品', 'qiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '38', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('240', '其他文体用品', 'qitawenti', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '38', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('241', '办公设备', 'bangongshebei', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '39', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('242', '办公耗材', 'bangonghaocai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '39', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('243', '桌面文具', 'zhuomianwenju', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '39', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('244', '办公家具', 'bangongjiaju', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '39', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('245', '其他办公用品', 'qitabangong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '39', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('246', '化工', 'huagong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('247', '机床', 'jichuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('248', '纺织', 'fangzhi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('249', '塑料', 'suliao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('250', '工程机械', 'gongchengjixie', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('251', '发电', 'fadian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('252', '仪器仪表', 'yiqiyibiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('253', '五金', 'wujin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('254', '木工', 'mugong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('255', '农业', 'nongye', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('256', '食品加工', 'shipinjiagong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('257', '机械设备', 'jixieshebei', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('258', '其它设备', 'qitashebei', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '40', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('259', '交换', 'jiaohuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '144', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('260', '赠送', 'zengsong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '144', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('261', '礼品', 'lipin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '145', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('262', '杂七杂八', 'zaqizaba', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '145', '7', '', '0', null, null);
INSERT INTO `f_category` VALUES ('263', '车辆信息', 'cheliang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '0', '0', '1,5', '3', '', null);
INSERT INTO `f_category` VALUES ('264', '二手汽车买卖', 'ershouqiche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '263', '17', '13,14', '0', '', 'qc.jpg');
INSERT INTO `f_category` VALUES ('265', '租车', 'zuche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '263', '14', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('266', '摩托车/电动车/自行车', 'che', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '263', '16', '15,16', '0', '', null);
INSERT INTO `f_category` VALUES ('267', '拼车/节假日拼车回家', 'pinche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '263', '18', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('268', '代驾/陪练/驾校', 'jiaxiaopeilian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '263', '14', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('269', '汽车服务/4S店', 'qiche4s', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '263', '19', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('270', '汽车配件/其他', 'qichepeijian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '263', '15', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('271', '轿车', 'jiaoche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '264', '17', '13,14', '0', null, null);
INSERT INTO `f_category` VALUES ('272', '越野车/SUV', 'yueyeche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '264', '17', '13,14', '0', null, null);
INSERT INTO `f_category` VALUES ('273', '面包车/MPV', 'mianbaoche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '264', '17', '13,14', '0', null, null);
INSERT INTO `f_category` VALUES ('274', '跑车', 'paoche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '264', '17', '13,14', '0', null, null);
INSERT INTO `f_category` VALUES ('275', '货车/客车', 'huoche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '264', '17', '13,14', '0', null, null);
INSERT INTO `f_category` VALUES ('276', '其他二手车', 'qitache', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '264', '17', '13,14', '0', null, null);
INSERT INTO `f_category` VALUES ('277', '租车行', 'zuchexing', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '265', '14', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('278', '旅游租车', 'lvyouzuche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '265', '14', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('279', '商务租车', 'shangwuzuche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '265', '14', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('280', '出租司机', 'chuzusiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '265', '14', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('281', '其他租车', 'qitazuche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '265', '14', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('282', '电动车', 'diandongche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '266', '16', '15,16', '1', '', null);
INSERT INTO `f_category` VALUES ('283', '自行车', 'zixingche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '266', '16', '15,16', '2', '', null);
INSERT INTO `f_category` VALUES ('284', '三轮车', 'sanlunche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '266', '16', '15,16', '3', '', null);
INSERT INTO `f_category` VALUES ('285', '配件/装备', 'peijianzhuangbei', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '266', '16', '15,16', '4', '', null);
INSERT INTO `f_category` VALUES ('286', '上下班拼车', 'sxbpinche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '267', '18', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('287', '长途拼车', 'changtupinche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '267', '18', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('288', '拼车自驾游', 'lvyoupinche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '267', '18', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('289', '其他拼车', 'qitapinche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '267', '18', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('290', '代驾', 'daijia', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '268', '14', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('291', '陪练', 'peilian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '268', '14', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('292', '汽车检修', 'qichejianxiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '269', '19', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('293', '汽车保养', 'qichebaoyang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '269', '19', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('294', '4S店/经销商', '4sdian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '269', '19', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('295', '保险理赔过户', 'bxlp', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '269', '19', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('296', '其他汽车服务', 'qitaqichefuwu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '269', '19', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('297', '发动机配件', 'fdjpeijian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '270', '15', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('298', '汽车底盘', 'qichedipan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '270', '15', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('299', '车身附件', 'cheshenfujian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '270', '15', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('300', '汽车用品', 'qicheyongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '270', '15', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('301', '养护用品', 'yanghuyongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '270', '15', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('302', '视听设备', 'shitingshebei', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '270', '15', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('303', '电子电器', 'dzdq', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '270', '15', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('304', '拆车件', 'chaichejian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '270', '15', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('305', '改装配件', 'gaizhuangpeijian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '270', '15', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('306', '驾校', 'jiaxiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '268', '14', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('323', '专升本', 'zhuanshengben', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '308', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('324', '成人高考', 'chengrengaokao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '308', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('325', '自考', 'zikao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '308', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('326', '管理/MBA', 'guanli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '310', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('327', '文艺/体育培训', 'wenyitiyu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '310', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('328', '技能培训', 'jineng', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '310', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('329', '外语培训', 'waiyu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '310', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('330', 'IT培训', 'it', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '310', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('331', '少儿培训', 'shaoer', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '310', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('332', '资格认证', 'zhige', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '310', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('333', '留学', 'liuxue', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '309', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('334', '移民', 'yimin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '309', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('335', '签证', 'qianzheng', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '309', '0', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('336', '钟点工', 'zhongdiangong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '76', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('337', '家政中心', 'jiazhengzhongxin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '76', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('338', '月嫂/育婴师', 'yueshao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '76', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('339', '保姆', 'baomu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '76', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('340', '陪护工', 'peihugong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '76', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('341', '清洗保洁', 'qingxibaojie', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '76', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('342', '打孔/钻洞', 'dakong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '80', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('343', '管道疏通', 'guandao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '80', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('344', '防水补漏', 'fangshuibulou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '80', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('345', '下水道疏通', 'xiashuidao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '80', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('346', '马桶疏通', 'matong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '80', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('347', '空调拆装', 'kongdiaochaizhuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '78', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('348', '公司搬家', 'gongsibanjia', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '78', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('349', '设备搬迁', 'shebeibanqian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '78', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('350', '搬家搬场', 'banjiabanchang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '78', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('351', '长途搬家搬运', 'chaugtubanyun', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '78', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('352', '起重吊装', 'qizhongdiaozhuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '78', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('353', '国际快递', 'guoji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '70', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('354', '货运/物流', 'huoyun', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '70', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('355', '国内快递', 'guonei', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '70', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('356', '笔记本维修', 'bijibenweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '81', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('357', '手机维修', 'shoujiweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '81', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('358', '数据恢复', 'shujuhuifu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '81', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('359', '数码维修', 'shumaweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '81', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('360', '外卖配送', 'waimai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '71', '11', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('361', '送水', 'songshui', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '71', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('362', '液化气配送', 'yehuaqi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '71', '11', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('363', '跑腿服务', 'paotui', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '71', '11', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('364', '其他配送', 'qitapeisong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '71', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('365', '油烟机维修', 'youyanjiweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '82', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('366', '电视机维修', 'dianshijiweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '82', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('367', '热水器维修', 'reshuiqiweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '82', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('368', '空调维修/清洗', 'kongtiaoweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '82', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('369', '洗衣机维修', 'xiyijiweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '82', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('370', '冰箱维修', 'bingxiangweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '82', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('371', '其他家电维修', 'qitaweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '82', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('372', '家装', 'jiazhuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '79', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('373', '工装', 'gongzhuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '79', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('374', '水电工', 'shuidiangong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '79', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('375', '泥工', 'nigong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '79', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('376', '施工队', 'shigongdui', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '79', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('377', '室内装饰', 'shineizhuangshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '79', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('379', '电路维修', 'dianluweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '73', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('380', '家具维修/拆装', 'jiajuweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '73', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('381', '门窗维修', 'menchuangweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '73', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('382', '其他', 'qitafangwuweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '73', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('383', 'KTV/夜总会', 'yezhonghui', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '75', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('384', '剧场/舞厅', 'juchang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '75', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('385', '酒吧', 'jiuba', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '75', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('386', '咖啡厅/茶馆', 'kafeiting', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '75', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('387', '台球', 'taiqiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '75', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('388', '桌游/游戏厅', 'youxiting', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '75', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('389', '网吧', 'wangba', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '75', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('390', '电影院', 'dianyingyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '75', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('391', '舞蹈', 'wudao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '77', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('392', '跆拳道', 'quandao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '77', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('393', '游泳馆', 'youyongguan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '77', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('394', '拳击/武术', 'quanji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '77', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('395', '羽毛球', 'yumaoqiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '77', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('397', '活动庆典', 'huodongqingdian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '83', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('398', '乐队演出', 'leduiyanchu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '83', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('399', '场地布置', 'changdibuzhi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '83', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('400', '展览展会', 'zhanlanzhanhui', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '83', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('401', '活动策划', 'huodongcehua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '83', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('402', '礼仪模特', 'liyimote', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '83', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('404', '丰胸瘦身', 'fengxiongshoushen', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '86', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('405', '美甲', 'meijia', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '86', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('407', '旅馆/招待所', 'lvguan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '84', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('408', '星级宾馆', 'xjbinguan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '84', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('410', '商业摄影', 'shangyesheying', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '85', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('411', '儿童摄影', 'ertongsheying', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '85', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('412', '相框相册制作', 'xangkuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '85', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('413', '彩扩冲印', 'chongyin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '85', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('414', '艺术写真', 'yishuxiezhen', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '85', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('415', '摄像录像', 'luxiang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '85', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('416', '旅游线路', 'lvyouxianlu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '88', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('417', '自助游', 'zizhuyou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '88', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('418', '旅行社', 'lvxingshe', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '88', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('419', '度假村', 'dujiacun', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '88', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('420', '农家乐', 'nongjiale', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '88', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('421', '户外拓展', 'huwaituozhan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '88', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('423', '招商加盟', 'zhaoshang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '#ff0000', '', '422', '11', '7,8', '3', '', null);
INSERT INTO `f_category` VALUES ('424', '工商注册/财务代理', 'gongshang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '1', '', null);
INSERT INTO `f_category` VALUES ('425', '担保/保险/投资', 'danbaotouzhi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '2', '', null);
INSERT INTO `f_category` VALUES ('426', '印刷/包装', 'yinshua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '3', '', null);
INSERT INTO `f_category` VALUES ('427', '网站制作/推广', 'website', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '4', '', null);
INSERT INTO `f_category` VALUES ('428', '喷绘/制卡/字牌', 'penhuizhika', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '6', '', null);
INSERT INTO `f_category` VALUES ('474', '速记', 'suji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '430', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('430', '翻译/速记', 'fanyisuji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '10', '', null);
INSERT INTO `f_category` VALUES ('431', '商标专利', 'shanbiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '9', '', null);
INSERT INTO `f_category` VALUES ('432', '网络布线及维护', 'wangluobuxian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '12', '', null);
INSERT INTO `f_category` VALUES ('462', '喷绘', 'penhui', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '428', '11', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('434', '办公设备维修/租赁', 'bangongweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '11', '', null);
INSERT INTO `f_category` VALUES ('435', '法律咨询', 'falvzixun', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '13', '', null);
INSERT INTO `f_category` VALUES ('436', '其它服务', 'qitafuwu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '14', '', null);
INSERT INTO `f_category` VALUES ('437', '公司注册', 'gongsizhuce', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '424', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('438', '代办审批', 'daibanshenpi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '424', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('439', '工商年检', 'gongshangnianjian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '424', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('440', '代理记账', 'dailijizhang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '424', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('441', '保险', 'baoxian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '425', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('442', '投资', 'touzi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '425', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('443', '担保', 'danbao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '425', '11', '7,8', '-1', '', null);
INSERT INTO `f_category` VALUES ('444', '包装', 'baozhuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '426', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('445', '纸类印刷', 'zhileiyinshua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '426', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('446', '无碳复写', 'wutanfuxie', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '426', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('447', '丝网印刷', 'siwangyinshua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '426', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('448', '数码印刷', 'shumayinshua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '426', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('449', '不干胶印刷', 'buganjiaoyinshua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '426', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('450', '包装袋印刷', 'baozhuangdaiyinshua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '426', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('451', '网站制作', 'wangzhanzhizuo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '427', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('452', '网站推广', 'wangzhantuiguang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '427', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('453', '其他网络服务', 'qitawlfw', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '427', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('454', '设计策划', 'shejicehua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '422', '11', '7,8', '5', '', null);
INSERT INTO `f_category` VALUES ('455', '动画/影视制作', 'donghuazhizuo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '454', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('456', '广告策划', 'guanggaocehua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '454', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('457', '平面设计', 'pmsj', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '454', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('458', '媒体发布', 'meitifabu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '454', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('459', '品牌策划', 'pinpaicehua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '454', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('460', '装潢设计', 'zhsj', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '454', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('461', '其他设计', 'qtsj', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '454', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('463', '广告招牌', 'guanggaozhaopai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '428', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('464', 'led制作', 'led', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '428', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('465', '制卡', 'zhika', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '428', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('466', '仓储/托运/空运', 'changchu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '70', '11', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('467', '空车配货', 'kongchepeihuo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '70', '11', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('471', '商标注册', 'shangbiaozhuce', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '431', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('472', '专项审批', 'zhuanxiangshenpi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '431', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('473', '其他商标专利', 'qitashangbiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '431', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('475', '翻译', 'fanyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '430', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('476', '安防监控', 'anfangjiankong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '432', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('477', '综合布线', 'zonghebuxian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '432', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('478', '其他网络布线及维护', 'qitawangluo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '432', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('479', '复印机维修', 'fuyinjiweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '434', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('480', '打印机维修', 'dayinjiweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '434', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('481', '加粉加墨', 'jiafenjiamo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '434', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('482', '环保机械', 'huanbaojixie', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '423', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('483', '网络教育', 'wangluojiaoyu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '423', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('484', '美容保健', 'meirongbaojian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '423', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('485', '特色创新', 'tesechuangxin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '423', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('486', '家居建材', 'jiajujiancai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '423', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('487', '饰品礼品', 'shipinlipin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '423', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('488', '餐饮小吃', 'canyinxiaochi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '423', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('489', '服装鞋帽', 'fuzhuangxiemao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '423', '11', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('490', '其它加盟', 'qitajiameng', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '423', '11', '7,8', '10', '', null);
INSERT INTO `f_category` VALUES ('493', '销售助理', 'xiaoshouzhuli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('494', '房产经纪人', 'jingjiren', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('495', '销售经理/主管', 'xiaoshoujingli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('496', '销售总监', 'xiaoshouzongjian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('497', '医药代表', 'yiyaodaibiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('498', '汽车销售', 'qichexiaoshou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('499', '网络销售', 'wangluoxiaoshou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('500', '区域主管/渠道经理', 'quyuzhuguan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('501', '团购业务员/经理', 'tuangouyewuyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('502', '其他销售职位', 'qitaxs', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '45', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('505', '前台/接待/总机', 'qiantai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '43', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('506', '后勤', 'houqin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '43', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('507', '行政助理/专员', 'zhulizhuanyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '43', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('508', '行政经理/主管', 'xingzhengjinglizhuguan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '43', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('509', '人事专员/助理', 'renshizhuanyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '43', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('510', '人事经理/主管', 'renshijingli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '43', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('511', '培训讲师/主管', 'peixunjiangshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '43', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('514', '学徒工', 'xuetugong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('515', '洗车工', 'xichegong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('516', '维修安装工', 'weixiuanzhuanggong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('517', '油漆工', 'youqigong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('518', '钳工', 'qiangong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('519', '车床/磨床/铣床', 'chechuang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('520', '切割/焊工', 'hangong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('521', '包装工', 'baozhuanggong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '42', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('524', '传菜员', 'chuancaiyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '56', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('525', '配菜/打荷', 'peicai', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '56', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('526', '洗碗工', 'xiwangong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '56', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('527', '迎宾/接待', 'yingbin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '56', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('528', '大堂经理/领班', 'datangjingli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '56', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('529', '导游/计调', 'daoyou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '56', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('530', '其它', 'qitacanyin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '56', '9', '7,8', '10', '', null);
INSERT INTO `f_category` VALUES ('533', '出纳', 'chuna', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '46', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('534', '统计员', 'tongjiyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '46', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('537', '家政', 'jiazheng１', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '47', '9', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('544', '化妆师', 'huazhuangshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '50', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('545', '美体师', 'meitishi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '50', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('546', '助理学徒', 'zhulixuetu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '50', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('547', '足疗保健', 'zuliaobaojian', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '50', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('548', '推拿按摩', 'tuinaanmo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '50', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('550', '主持', 'zhuchi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '48', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('551', '司仪', 'siyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '48', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('552', '礼仪', 'liyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '48', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('553', 'DJ', 'dj', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '48', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('554', '舞蹈演员', 'wudaoyanyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '48', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('555', '其它公关', 'qitagongguan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '48', '9', '7,8', '10', '', null);
INSERT INTO `f_category` VALUES ('558', '商务司机', 'shangwusiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '151', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('559', '其他司机', 'qitasiji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '151', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('562', '药剂师', 'yaojishi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '51', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('563', '其他医疗职位', 'qitayiliao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '51', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('566', '软件工程师/程序员', 'chengxuyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('567', '硬件工程师', 'yingjiangcs', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('568', '网页设计/制作', 'wangyesheji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('569', '语音/视频/图形', 'shipinyinpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('570', '网站运营', 'wangzhanyunying', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('571', '网站编辑', 'wangzhanbianji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('572', '网络管理员', 'wangluoguanliyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('573', '网络与信息安全工程师', 'xinxianquan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('574', '通信技术工程师', 'tongxingcs', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('575', '项目/产品经理', 'chanpinjingli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('576', '其他计算机职位', 'qitajisuanji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '54', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('579', '促销/导购员', 'daogou', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '55', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('580', '理货员/陈列员', 'lihuoyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '55', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('581', '店长/卖场经理', 'dianzhang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '55', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('582', '防损员/保安', 'fangshun', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '55', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('583', '其他超市职位', 'qitachaoshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '55', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('586', '培训策划', 'pxch', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '52', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('587', '教学/教务管理', 'jiaoxueguanli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '52', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('588', '校长', 'xiaozhang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '52', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('589', '招生/课程顾问', 'zhaoshengguwen', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '52', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('594', '跟单员', 'gendanyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '44', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('595', '配货员', 'peihuoyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '44', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('596', '跟车配货人员', 'genchepeihuo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '44', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('597', '其他贸易人员', 'qitamaoyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '44', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('600', '信用卡/银行卡业务', 'xinyongka', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '49', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('601', '股票/期货操盘手', 'gupiao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '49', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('602', '其他金融人员', 'qitajinrong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '49', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('605', '其他农/林/牧/渔职位', 'qitanonglin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '152', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('606', '建筑/房产/装修/物业', 'jianzhufangchan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '27', '', null);
INSERT INTO `f_category` VALUES ('607', '工程项目管理', 'gongchengguanli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('608', '建筑工程师/建造师', 'jianzaoshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('609', '工程监理', 'gongchengjianli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('610', '造价师/预算师', 'zaojiashi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('611', '安全管理/安全员', 'anquanyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('612', '园艺/园林/景观设计', 'yuanyi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '606', '9', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('613', '室内外装潢设计', 'snsj', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('614', '给排水/制冷/暖通', 'jipaisui', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('615', '材料员/资料员', 'cailiaoyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('616', '房地产开发/策划', 'fangchancehua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('617', '物业管理', 'wuyeguanli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('618', '物业维修', 'wuyeweixiu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('619', '其他建筑/装修职位', 'qitajianzhu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '606', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('620', '仓储物流', 'wuliu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '21', '', null);
INSERT INTO `f_category` VALUES ('621', '仓管', 'cangguan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '620', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('622', '搬运工', 'banyungong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '620', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('623', '配送员', 'peisongyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '620', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('624', '设计/摄影/创意', 'sheji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '5', '', null);
INSERT INTO `f_category` VALUES ('633', '电子/电气/仪器仪表', 'dianzidianqi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '27', '', null);
INSERT INTO `f_category` VALUES ('625', '室内设计', 'shineisheji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '624', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('626', '动画设计', 'donghuasheji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '624', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('627', '广告设计', 'guanggaosheji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '624', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('628', '创意策划', 'chuangyicehua', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '624', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('629', '服装设计', 'fuzhuangsheji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '624', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('630', '后期制作', 'houqizhizuo', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '624', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('631', '摄影师', 'sheyingshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '624', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('632', '其他设计人员', 'qitasheji', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '624', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('634', '自动化工程师', 'zidonghuagcs', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '633', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('635', '电子/电气工程师', 'dianzidianqigcs', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '633', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('636', '机电/机械工程师', 'jidiangcs', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '633', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('637', '电路工程师/技术员', 'dianlugcs', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '633', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('638', '其他电子职位', 'qitadianzi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '633', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('639', '汽车制造/服务', 'qichezhizao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '27', '', null);
INSERT INTO `f_category` VALUES ('640', '汽车修理', 'qichexiuli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '639', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('641', '汽车美容', 'qichemeirong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '639', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('642', '其他汽车服务人员', 'qitaqiche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '639', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('643', '法律相关', 'falv', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '3', '9', '7,8', '15', '', null);
INSERT INTO `f_category` VALUES ('644', '律师/法律顾问', 'lvshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '643', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('645', '律师助理', 'lvshizhuli', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '643', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('646', '其他法律职位', 'qitafalv', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '643', '9', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('647', '宠物相关', 'chongwu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '0', '0', '', '4', '', null);
INSERT INTO `f_category` VALUES ('648', '赠送/领养/配种', 'chongwuzengsong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '647', '20', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('649', '宠物用品/食品', 'chongwuyongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '647', '7', '15,16', '0', '', null);
INSERT INTO `f_category` VALUES ('650', '花鸟鱼虫/其他', 'huaniao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '647', '7', '15,16', '0', '', null);
INSERT INTO `f_category` VALUES ('651', '宠物店/服务', 'chongwufuwu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '647', '14', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('652', '摩托车', 'motuoche', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '266', '16', '15,16', '0', '', null);
INSERT INTO `f_category` VALUES ('653', '领养', 'cwlingyang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '648', '20', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('654', '配种', 'cwpeizhong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '648', '20', '7,8', '0', null, null);
INSERT INTO `f_category` VALUES ('655', '赠送', 'cwzengsong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '648', '20', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('656', '狗粮', 'gouliang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '649', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('657', '狗用品', 'gouyongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '649', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('658', '猫粮', 'maoliang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '649', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('659', '猫用品', 'maoyongpin', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '649', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('660', '宠物玩具', 'chongwuwanju', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '649', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('661', '宠物服饰', 'chongwufushi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '649', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('662', '其它宠物用品', 'qitacwyp', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '649', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('663', '观赏鱼', 'guanshangyu', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '650', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('664', '观赏鸟', 'guanshangniao', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '650', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('665', '奇石盆景', 'qishipenjing', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '650', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('666', '其它宠物', 'qitacw', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '650', '7', '15,16', '0', null, null);
INSERT INTO `f_category` VALUES ('667', '宠物医院', 'cwyiyuan', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '651', '14', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('668', '宠物美容', 'cwmeirong', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '651', '14', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('669', '宠物摄影', 'cwsheying', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '651', '14', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('670', '宠物寄养', 'cwjiyang', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '651', '14', '7,8', '0', '', null);
INSERT INTO `f_category` VALUES ('671', '其它宠物服务', 'qitacwfw', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', '', '', '651', '14', '7,8', '0', '', null);

-- ----------------------------
-- Table structure for `f_codes`
-- ----------------------------
DROP TABLE IF EXISTS `f_codes`;
CREATE TABLE `f_codes` (
  `id` int(11) NOT NULL auto_increment,
  `title` char(20) NOT NULL,
  `flag` char(50) NOT NULL,
  `code` longtext NOT NULL,
  `description` char(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_codes
-- ----------------------------
INSERT INTO `f_codes` VALUES ('1', '列表页图文列表', 'listBlock', '<ul class=\"mianlist pic_list\">\r\n<?php foreach($info as $row){?>     \r\n      <li>\r\n          <span class=\"fl pl_pic\"><img width=\"80\" height=\"60\" src=\"<?php echo $row[\'tpic\']?>\"/></span>\r\n           <div class=\"fl pl_title\">\r\n           <a target=\"_blank\" href=\"<?php echo site_url(\"$row[pinyin]/$row[infoid].html\")?>\"><?php echo highlight($row[\'title\'],$keyword)?></a>\r\n           <?php if($row[\'zj\']==\'中介\'){?><em class=\"org ml5\">中介</em><?php }?>\r\n           <?php if($row[\'gongxu\']==\'求购\'){?><em class=\"org ml5\">求购</em><?php }?>\r\n           <?php if($row[\'fbr\']==\'商家\'){?><em class=\"org ml5\">商家</em><?php }?>\r\n          <em class=\"fl\"></em><br/>\r\n          <em>\r\n            <?php if($row[\'qy\']){?><?php echo $row[\'qy\']?><?php }?>\r\n            <?php if($first_cat[\'pinyin\']==\'jiaoyi\'){?>/<?php echo $category[$row[\'cid\']][\'title\']?><?php }?>\r\n            <?php if($row[\'lx\']){?>/<?php echo $row[\'lx\']?><?php }?>\r\n            <?php if($row[\'wylx\']){?>/<?php echo $row[\'wylx\']?><?php }?>\r\n            <?php if($row[\'housearea\']){?>/<?php echo $row[\'housearea\']?><?php }?>\r\n            <?php if($row[\'chengse\']){?>/<?php echo $row[\'chengse\']?><?php }?>\r\n          </em>\r\n     </div>\r\n      <span class=\"fr ml_time\"><?php echo $row[\'refreshtime\']?></span>\r\n      <span class=\"fr pl_price_redfw\"><?php echo $row[\'price\']?></span>\r\n      </li>\r\n<?php }?>\r\n</ul>', '列表页图文列表');
INSERT INTO `f_codes` VALUES ('12', '招聘求职Tab切换', 'searchTab', '<ul class=\"list_head clearfix ml10\">\r\n  <?php if($pinyin==\'zhaopin\'){?>\r\n    <li class=\"active\"><a >企业招聘</a></li>\r\n  <?php }else{?>\r\n    <li><a href=\"<?php echo site_url(\"zhaopin/\") ?>\">企业招聘</a></li>\r\n  <?php }if($pinyin==\'qiuzhi\'){?>\r\n    <li class=\"active\"><a >求职专区</a></li>\r\n  <?php }else{?>\r\n    <li><a href=\"<?php echo site_url(\"qiuzhi/\") ?>\">求职专区</a></li>\r\n  <?php }?>                \r\n</ul>', '招聘求职Tab切换');
INSERT INTO `f_codes` VALUES ('11', '子分类(不含3级分类)', 'class_nav', '<div class=\"tj_type_list\"> \r\n  <ul>\r\n    <?php foreach($children as $row){?>\r\n        <li>\r\n            <a href=\"<?php echo site_url(\"$row[pinyin]/\")?>\"><?php echo $row[\'title\']?></a>\r\n        </li>\r\n    <?php }?>\r\n  </ul>\r\n  <div class=\"blank5\"></div>\r\n</div>', '子分类(不含3级分类)');
INSERT INTO `f_codes` VALUES ('7', '列表页文字列表', 'listBlock', '<ul class=\"mianlist wordlist\">\r\n<?php foreach($info as $row){?>\r\n  <li>\r\n    <div class=\"fl\">\r\n      <a target=\"_blank\" href=\"<?php echo site_url(\"$row[pinyin]/$row[infoid].html\")?>\"><?php echo $row[\'title\']?></a>\r\n      <?php if($row[\'qy\']){?><em><?php echo $row[\'qy\']?></em><?php }?>\r\n      <?php if($row[\'job\']){?><em><?php echo $row[\'job\']?></em><?php }?>\r\n      <?php if($row[\'zj\']==\'中介\'){?><em class=\"org ml5\">中介</em><?php }?>\r\n      <?php if($row[\'gongxu\']==\'求购\'){?><em class=\"org ml5\">求购</em><?php }?>\r\n      <?php if($row[\'fbr\']==\'商家\'){?><em class=\"org ml5\">商家</em><?php }?>\r\n    </div>\r\n    <span class=\"ml_time fr\"><?php echo $row[\'refreshtime\']?></span>\r\n    <span class=\"fr pl_price_redfw\">\r\n        <?php\r\n              if($row[\'age\']) echo $row[\'age\'];\r\n              elseif($row[\'price\']) echo $row[\'price\'];\r\n              elseif($row[\'wage\']) echo $row[\'wage\'];\r\n          ?>\r\n    </span>\r\n    \r\n  </li>\r\n<?php }?>\r\n</ul>', '列表页文字列表');
INSERT INTO `f_codes` VALUES ('8', '内容页文字列表', 'view_listBlock', '<ul class=\"shopper_list\">\r\n<?php foreach($info as $row){?>\r\n  <li>\r\n      <p class=\"fl\"><a target=\"_blank\" href=\"<?php echo site_url(\"$second_cat[pinyin]/$row[infoid].html\")?>\"><?php echo cut_str($row[\'title\'],25)?></a></p>\r\n      <p class=\"fr mr5\"><?php echo $row[\'refreshtime\']?></p>\r\n  </li>\r\n<?php }?>\r\n</ul>', '内容页文字列表');
INSERT INTO `f_codes` VALUES ('5', '内容页图文列表', 'view_listBlock', '<p class=\"f14 b_b\">\r\n  <span class=\"fl w450\">标题</span>\r\n  <span class=\"fl w140 text_center\">价格</span>\r\n  <span class=\"fl ml_time text_center\">发表时间</span>\r\n</p>\r\n<ul class=\"pic_list\">\r\n<?php foreach($info as $row){?>     \r\n      <li>\r\n          <span class=\"fl pl_pic\"><img width=\"80\" height=\"60\" src=\"<?php echo $row[\'tpic\']?>\"/></span>\r\n           <div class=\"fl clearfix pl_title\">\r\n           <a target=\"_blank\" href=\"<?php echo site_url(\"$second_cat[pinyin]/$row[infoid].html\")?>\"><?php echo cut_str($row[\'title\'],25)?></a>\r\n           <?php if($row[\'zj\']==\'中介\'){?><em class=\"org ml5\">中介</em><?php }?>\r\n           <?php if($row[\'gongxu\']==\'求购\'){?><em class=\"org ml5\">求购</em><?php }?>\r\n           <?php if($row[\'fbr\']==\'商家\'){?><em class=\"org ml5\">商家</em><?php }?>\r\n          <em class=\"fl\"></em><br/>\r\n          <em>\r\n            <?php if($row[\'qy\']){?><?php echo $row[\'qy\']?><?php }?>\r\n            <?php if($first_cat[\'pinyin\']==\'jiaoyi\'){?>/<?php echo $category[$row[\'cid\']][\'title\']?><?php }?>\r\n            <?php if($row[\'lx\']){?>/<?php echo $row[\'lx\']?><?php }?>\r\n            <?php if($row[\'wylx\']){?>/<?php echo $row[\'wylx\']?><?php }?>\r\n            <?php if($row[\'housearea\']){?>/<?php echo $row[\'housearea\']?><?php }?>\r\n            <?php if($row[\'chengse\']){?>/<?php echo $row[\'chengse\']?><?php }?>\r\n          </em>\r\n     </div>\r\n      <span class=\"fr ml_time\"><?php echo $row[\'refreshtime\']?></span>\r\n      <span class=\"fr pl_price_redfw\"><?php echo $row[\'price\']?></span>\r\n      </li>\r\n<?php }?>\r\n</ul>', '内容页图文列表');
INSERT INTO `f_codes` VALUES ('9', '房屋列表页子分类', 'class_nav', '<div class=\"type_list\"> \r\n<ul class=\"type\">\r\n    <li class=\"mr20\">\r\n        <h2><a href=\"<?php echo site_url(\"chuzu/\")?>\">住房出租：</a></h2>\r\n        <span>\r\n            <a href=\"<?php echo site_url(\"chuzu/?wylx=1\")?>\">普通住宅</a>\r\n            <a href=\"<?php echo site_url(\"chuzu/?wylx=2\")?>\">商品房</a>\r\n            <a href=\"<?php echo site_url(\"chuzu/?wylx=3\")?>\">公寓</a>\r\n            <a href=\"<?php echo site_url(\"chuzu/?wylx=4\")?>\">别墅</a>\r\n            <a href=\"<?php echo site_url(\"chuzu/?wylx=5\")?>\">民房</a>\r\n            <a href=\"<?php echo site_url(\"chuzu/?wylx=6\")?>\">其它</a>\r\n        </span>              \r\n    </li>\r\n</ul>\r\n<ul class=\"type\">\r\n    <li class=\"mr20\">\r\n        <h2><a href=\"<?php echo site_url(\"chushou/\")?>\">住房出售：</a></h2>\r\n        <span>\r\n            <a href=\"<?php echo site_url(\"chushou/?price=0_30\")?>\">30万以下</a>\r\n            <a href=\"<?php echo site_url(\"chushou/?price=30_50\")?>\">30-50万</a>\r\n            <a href=\"<?php echo site_url(\"chushou/?price=50_80\")?>\">50-80万</a>\r\n            <a href=\"<?php echo site_url(\"chushou/?price=80_100\")?>\">80-100万</a>\r\n            <a href=\"<?php echo site_url(\"chushou/?price=100_200\")?>\">100-200万</a>\r\n            <a href=\"<?php echo site_url(\"chushou/?price=200_0\")?>\">200万以上</a>\r\n        </span>            \r\n    </li>\r\n</ul>\r\n<ul class=\"type\">\r\n    <li class=\"mr20\">\r\n        <h2><a href=\"<?php echo site_url(\"qiuzhu/\")?>\">房产求租/求购：</a></h2>\r\n        <span>\r\n            <a href=\"<?php echo site_url(\"qiuzhu/?fwhx=1\")?>\">一居室</a>\r\n            <a href=\"<?php echo site_url(\"qiuzhu/?fwhx=2\")?>\">二居室</a>\r\n            <a href=\"<?php echo site_url(\"qiuzhu/?fwhx=3\")?>\">三居室</a>\r\n            <a href=\"<?php echo site_url(\"qiuzhu/?fwhx=4\")?>\">四居室</a>\r\n            <a href=\"<?php echo site_url(\"qiuzhu/?fwhx=5\")?>\">别墅</a>\r\n            <a href=\"<?php echo site_url(\"qiuzhu/?fwhx=6\")?>\">其它户型</a>\r\n        </span>                \r\n    </li>\r\n</ul>\r\n<ul class=\"type\">\r\n    <li class=\"mr20\">\r\n        <h2><a href=\"<?php echo site_url(\"xiezilou/\")?>\">写字楼/店面/仓库/厂房：</a></h2>\r\n        <span>\r\n            <a href=\"<?php echo site_url(\"xiezilou/?lx=1\")?>\">写字楼</a>\r\n            <a href=\"<?php echo site_url(\"xiezilou/?lx=2\")?>\">店面</a>\r\n            <a href=\"<?php echo site_url(\"xiezilou/?lx=3\")?>\">仓库</a>\r\n            <a href=\"<?php echo site_url(\"xiezilou/?lx=4\")?>\">厂房</a>\r\n        </span>             \r\n    </li>\r\n</ul>\r\n<ul class=\"type\">\r\n    <li class=\"mr20\">\r\n        <h2><a href=\"<?php echo site_url(\"qitafangwu/\")?>\">其它房屋信息：</a></h2>\r\n        <span>\r\n            <a href=\"<?php echo site_url(\"qitafangwu/?qy=1\")?>\">市中区</a>\r\n            <a href=\"<?php echo site_url(\"qitafangwu/?qy=2\")?>\">任城区</a>\r\n            <a href=\"<?php echo site_url(\"qitafangwu/?qy=3\")?>\">高新区</a>\r\n            <a href=\"<?php echo site_url(\"qitafangwu/\")?>\">更多</a>\r\n        </span>         \r\n    </li>    \r\n</ul>\r\n<div class=\"blank5\"></div>\r\n</div>', '房屋列表页子分类');
INSERT INTO `f_codes` VALUES ('13', '二手汽车买卖列表', 'listBlock', '<ul class=\"mianlist pic_list\">\r\n<?php foreach($info as $row){?>     \r\n      <li>\r\n          <span class=\"fl pl_pic\"><img width=\"80\" height=\"60\" src=\"<?php echo $row[\'tpic\']?>\"/></span>\r\n          <div class=\"fl pl_title\">\r\n          <a target=\"_blank\" href=\"<?php echo site_url(\"$row[pinyin]/$row[infoid].html\")?>\"><?php echo highlight($row[\'title\'],$keyword)?></a>\r\n          <?php if($row[\'qy\']){?><?php echo $row[\'qy\']?><?php }?><?php if($row[\'fbr\']==\'商家\'){?><em class=\"org ml5\">商家</em><?php }?>\r\n          <br/>\r\n          <em>\r\n            排量 <?php echo $row[\'pl\']?>/<?php echo $row[\'clys\']?>/购于 <?php echo $row[\'spsj\']?>/已行驶 <?php echo $row[\'xslc\']?>\r\n          </em>\r\n     </div>\r\n      <span class=\"fr ml_time\"><?php echo $row[\'refreshtime\']?></span>\r\n      <span class=\"fr pl_price_redfw\"><?php echo $row[\'price\']?></span>\r\n      </li>\r\n<?php }?>\r\n</ul>', '二手汽车买卖');
INSERT INTO `f_codes` VALUES ('14', '二手汽车买卖内容页列表', 'view_listBlock', '<p class=\"f14 b_b\">\r\n  <span class=\"fl w450\">标题</span>\r\n  <span class=\"fl w140 tac\">价格</span>\r\n  <span class=\"fl ml_time tac\">发表时间</span>\r\n</p>\r\n<ul class=\"pic_list\">\r\n<?php foreach($info as $row){?>     \r\n      <li>\r\n          <span class=\"fl pl_pic\"><img width=\"80\" height=\"60\" src=\"<?php echo $row[\'tpic\']?>\"/></span>\r\n           <div class=\"fl clearfix pl_title\">\r\n           <a target=\"_blank\" href=\"<?php echo site_url(\"$second_cat[pinyin]/$row[infoid].html\")?>\"><?php echo cut_str($row[\'title\'],25)?></a>\r\n          <?php if($row[\'qy\']){?><?php echo $row[\'qy\']?><?php }?><?php if($row[\'fbr\']==\'商家\'){?><em class=\"org ml5\">商家</em><?php }?>\r\n          <br/>\r\n          <em>\r\n            <?php echo $row[\'clys\']?>/<?php echo $row[\'spsj\']?>/<?php echo $row[\'pl\']?>/<?php echo $row[\'xslc\']?>\r\n          </em>\r\n     </div>\r\n      <span class=\"fr ml_time tac\"><?php echo $row[\'refreshtime\']?></span>\r\n      <span class=\"fr pl_price_redfw tac\"><?php echo $row[\'price\']?></span>\r\n      </li>\r\n<?php }?>\r\n</ul>', '');
INSERT INTO `f_codes` VALUES ('15', '跳蚤市场图文列表页', 'listBlock', '<ul class=\"mianlist pic_list\">\r\n<?php foreach($info as $row){?>     \r\n      <li>\r\n          <span class=\"fl pl_pic\"><img width=\"80\" height=\"60\" src=\"<?php echo $row[\'tpic\']?>\"/></span>\r\n           <div class=\"fl clearfix pl_title\">\r\n           <a target=\"_blank\" href=\"<?php echo site_url(\"$second_cat[pinyin]/$row[infoid].html\")?>\"><?php echo cut_str($row[\'title\'],25)?></a>\r\n          <?php if($row[\'qy\']){?><?php echo $row[\'qy\']?><?php }?><?php if($row[\'fbr\']==\'商家\'){?><em class=\"org ml5\">商家</em><?php }?>\r\n          <br/>\r\n          <em>\r\n            <?php echo $row[\'chengse\']?>/<?php echo $category[$row[\'cid\']][\'title\']?>\r\n          </em>\r\n     </div>\r\n      <span class=\"fr ml_time tac\"><?php echo $row[\'refreshtime\']?></span>\r\n      <span class=\"fr pl_price_redfw tac\"><?php echo $row[\'price\']?></span>\r\n      </li>\r\n<?php }?>\r\n</ul>', '');
INSERT INTO `f_codes` VALUES ('16', '跳蚤市场内容页列表', 'view_listBlock', '<p class=\"f14 b_b\">\r\n  <span class=\"fl w450\">标题</span>\r\n  <span class=\"fl w140 text_center\">价格</span>\r\n  <span class=\"fl ml_time text_center\">发表时间</span>\r\n</p>\r\n<ul class=\"pic_list\">\r\n<?php foreach($info as $row){?>     \r\n      <li>\r\n          <span class=\"fl pl_pic\"><img width=\"80\" height=\"60\" src=\"<?php echo $row[\'tpic\']?>\"/></span>\r\n           <div class=\"fl clearfix pl_title\">\r\n           <a target=\"_blank\" href=\"<?php echo site_url(\"$second_cat[pinyin]/$row[infoid].html\")?>\"><?php echo cut_str($row[\'title\'],25)?></a>\r\n          <?php if($row[\'qy\']){?><?php echo $row[\'qy\']?><?php }?><?php if($row[\'fbr\']==\'商家\'){?><em class=\"org ml5\">商家</em><?php }?>\r\n          <br/>\r\n          <em>\r\n            <?php echo $row[\'chengse\']?>/<?php echo $category[$row[\'cid\']][\'title\']?>\r\n          </em>\r\n     </div>\r\n      <span class=\"fr ml_time tac\"><?php echo $row[\'refreshtime\']?></span>\r\n      <span class=\"fr pl_price_redfw tac\"><?php echo $row[\'price\']?></span>\r\n      </li>\r\n<?php }?>\r\n</ul>', '');

-- ----------------------------
-- Table structure for `f_company`
-- ----------------------------
DROP TABLE IF EXISTS `f_company`;
CREATE TABLE `f_company` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `mingcheng` varchar(50) NOT NULL,
  `hangye` varchar(50) NOT NULL,
  `leixing` varchar(50) NOT NULL,
  `guimo` varchar(20) NOT NULL,
  `jieshao` text NOT NULL,
  `realname` varchar(10) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(20) default NULL,
  `address` varchar(50) NOT NULL,
  `service` text,
  `userlicense` text,
  `dateline` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_company
-- ----------------------------
INSERT INTO `f_company` VALUES ('3', '3', '新雨科技', '互联网/电子商务', '私营', '1000人以上', '互联网服务', '唐国伟', '15006570631', 'tgw2000@163.com', '山东省济宁市', '  ', '', '1387354947');

-- ----------------------------
-- Table structure for `f_config`
-- ----------------------------
DROP TABLE IF EXISTS `f_config`;
CREATE TABLE `f_config` (
  `setname` char(50) NOT NULL,
  `value` char(255) NOT NULL,
  `sort` int(10) NOT NULL default '0',
  `bz` char(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_config
-- ----------------------------
INSERT INTO `f_config` VALUES ('webname', '济宁分类信息', '1', '网站名称');
INSERT INTO `f_config` VALUES ('webdir', '', '2', '网站所在目录，根目录请留空');
INSERT INTO `f_config` VALUES ('tplname', 'default', '3', '模板目录');
INSERT INTO `f_config` VALUES ('uploads', 'uploads', '4', '上传目录');
INSERT INTO `f_config` VALUES ('keywords', '', '5', '');
INSERT INTO `f_config` VALUES ('description', '', '6', '');
INSERT INTO `f_config` VALUES ('icp', '', '7', 'ICP备案号');
INSERT INTO `f_config` VALUES ('closesystem', '0', '8', '为0表示正常打开，1表示暂时关闭');
INSERT INTO `f_config` VALUES ('close_tips', '网站正在维护，暂时关闭，请稍后访问！', '9', '关闭提示信息');
INSERT INTO `f_config` VALUES ('posttimelimit', '60', '10', '发布信息时间间隔');
INSERT INTO `f_config` VALUES ('uc', '1', '11', '为0表示不整合ucenter,为1表示整合');

-- ----------------------------
-- Table structure for `f_fields`
-- ----------------------------
DROP TABLE IF EXISTS `f_fields`;
CREATE TABLE `f_fields` (
  `fid` smallint(6) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '' COMMENT '字段名',
  `field` varchar(40) NOT NULL default '' COMMENT '数据库字段',
  `field_type` varchar(20) NOT NULL default '' COMMENT '数据库字段类型',
  `input_type` varchar(20) NOT NULL default '' COMMENT '用户输入类型',
  `rules` mediumtext NOT NULL,
  `available` char(2) NOT NULL COMMENT '是否可用',
  `required` char(2) NOT NULL COMMENT '是否必填',
  `search` char(2) NOT NULL COMMENT '是否参与搜索',
  `search_type` char(50) NOT NULL,
  `description` varchar(255) NOT NULL default '',
  `sort` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_fields
-- ----------------------------
INSERT INTO `f_fields` VALUES ('110', '商家名称', 'sangjia', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', '', '', '', '', '2');
INSERT INTO `f_fields` VALUES ('111', '成色', 'chengse', 'int', 'radio', 'a:2:{s:6:\"length\";s:2:\"10\";s:7:\"choices\";s:18:\"1=全新\r\n2=二手\";}', 'on', 'on', '', '', '', '4');
INSERT INTO `f_fields` VALUES ('31', '房屋面积', 'housearea', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:9:\"平方米\";}', 'on', '', '', '', '', '12');
INSERT INTO `f_fields` VALUES ('34', '物业', 'wylx', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:67:\"1=普通住宅\r\n2=商品房\r\n3=公寓\r\n4=别墅\r\n5=民房\r\n6=其它\";}', 'on', 'on', 'on', 'label', '', '4');
INSERT INTO `f_fields` VALUES ('36', '装修', 'makes', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:38:\"1=毛坯\r\n2=简易\r\n3=中档\r\n4=高档\";}', 'on', 'on', '', '', '', '2');
INSERT INTO `f_fields` VALUES ('37', '户型', 'fwhx', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:78:\"1=单间\r\n2=1室1厅\r\n3=2室1厅\r\n4=2室2厅\r\n5=3室1厅\r\n6=3室2厅\r\n7=其它\";}', 'on', 'on', 'on', 'label', '', '3');
INSERT INTO `f_fields` VALUES ('38', '配套设施', 'equipment', 'varchar', 'checkbox', 'a:2:{s:6:\"length\";s:3:\"255\";s:7:\"choices\";s:211:\"1=水电煤\r\n2=宽带\r\n3=有线电视\r\n4=床铺\r\n5=管道气\r\n6=厨具\r\n7=家俱\r\n8=防盗门\r\n9=电梯\r\n10=电话\r\n11=冰箱\r\n12=洗衣机\r\n13=热水器\r\n14=空调\r\n15=暖气\r\n16=饮水机\r\n17=车库\r\n18=院子\";}', 'on', '', '', '', '', '7');
INSERT INTO `f_fields` VALUES ('39', '是否中介', 'zj', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:18:\"1=个人\r\n2=中介\";}', 'on', 'on', 'on', 'nav', '', '0');
INSERT INTO `f_fields` VALUES ('86', '售价', 'sell_price', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:2:\"10\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:6:\"万元\";}', 'on', 'on', '', '', '', '9');
INSERT INTO `f_fields` VALUES ('90', '房屋朝向', 'direction', 'int', 'select', 'a:2:{s:6:\"length\";s:2:\"10\";s:7:\"choices\";s:38:\"1=东面\r\n2=南面\r\n3=西面\r\n4=北面\";}', 'on', '', '', '', '', '8');
INSERT INTO `f_fields` VALUES ('92', '类型', 'lx', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:41:\"1=写字楼\r\n2=店面\r\n3=仓库\r\n4=厂房\";}', 'on', 'on', 'on', 'label', '', '2');
INSERT INTO `f_fields` VALUES ('93', '发布人', 'fbr', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:18:\"1=个人\r\n2=商家\";}', 'on', 'on', 'on', 'nav', '', '1');
INSERT INTO `f_fields` VALUES ('94', '期望户型', 'fwhx', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:76:\"1=一居室\r\n2=两居室\r\n3=三居室\r\n4=四居室\r\n5=别墅\r\n6=其它类型\";}', 'on', 'on', 'on', 'label', '', '2');
INSERT INTO `f_fields` VALUES ('95', '价格', 'price', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:6:\"万元\";}', 'on', 'on', '', '', '', '5');
INSERT INTO `f_fields` VALUES ('98', '详细类别', 'leibie', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:41:\"1=写字楼\r\n2=店面\r\n3=仓库\r\n4=厂房\";}', 'on', 'on', '', '', '', '1');
INSERT INTO `f_fields` VALUES ('99', '供需', 'gongxu', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:18:\"1=求租\r\n2=求购\";}', 'on', 'on', 'on', 'label', '', '0');
INSERT INTO `f_fields` VALUES ('59', '楼层总数', 'floorall', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:3:\"层\";}', 'on', '', '', '', '', '10');
INSERT INTO `f_fields` VALUES ('60', '所在楼层', 'floor', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:3:\"层\";}', 'on', '', '', '', '', '9');
INSERT INTO `f_fields` VALUES ('81', '详细地址', 'address', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:2:\"40\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '6');
INSERT INTO `f_fields` VALUES ('83', '房屋产权', 'fwcq', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:82:\"1=商品房\r\n2=安居房\r\n3=经济适用房\r\n4=使用权房\r\n5=期房\r\n6=房改房\";}', 'on', 'on', 'on', 'label', '', '5');
INSERT INTO `f_fields` VALUES ('114', '租金', 'price', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:7:\"元/月\";}', 'on', 'on', '', '', '', '4');
INSERT INTO `f_fields` VALUES ('141', '出租方式', 'fangsi', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:18:\"1=整租\r\n2=合租\";}', 'on', 'on', '', '', '', '3');
INSERT INTO `f_fields` VALUES ('142', '押金方式', 'deposit', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', '', '', '', '', '11');
INSERT INTO `f_fields` VALUES ('143', '期望户型', 'hx', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:66:\"1=一居室\r\n2=两居室\r\n3=三居室\r\n4=四居室\r\n5=其它类型\";}', 'on', '', '', '', '', '0');
INSERT INTO `f_fields` VALUES ('144', '票价', 'piaojia', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:3:\"元\";}', 'on', 'on', '', '', '', '5');
INSERT INTO `f_fields` VALUES ('146', '始发站', 'begin', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:2:\"10\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '2');
INSERT INTO `f_fields` VALUES ('147', '到达站', 'end', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:2:\"10\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '3');
INSERT INTO `f_fields` VALUES ('148', '航班/车次', 'chechi', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:2:\"20\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '4');
INSERT INTO `f_fields` VALUES ('149', '发车时间', 'gotime', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '6');
INSERT INTO `f_fields` VALUES ('150', '单位名称', 'company', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:2:\"45\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '1');
INSERT INTO `f_fields` VALUES ('151', '单位地址', 'dwdz', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:2:\"45\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '2');
INSERT INTO `f_fields` VALUES ('152', '招聘职位', 'subType', 'int', 'radio', 'a:2:{s:6:\"length\";s:2:\"10\";s:7:\"choices\";s:0:\"\";}', 'on', 'on', '', '', '', '4');
INSERT INTO `f_fields` VALUES ('153', '招聘人数', 'number', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:2:\"10\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:3:\"人\";}', 'on', 'on', '', '', '', '1');
INSERT INTO `f_fields` VALUES ('154', '学历要求', 'education', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:64:\"1=不限\r\n2=中专/高中\r\n3=大专\r\n4=本科\r\n5=硕士及以上\";}', 'on', 'on', '', '', '', '3');
INSERT INTO `f_fields` VALUES ('189', '工作经验', 'gzjy', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:78:\"1=不限\r\n2=1年以下\r\n3=1-2年\r\n4=3-5年\r\n5=6-7年\r\n6=8-10年\r\n7=10年以上\";}', 'on', 'on', '', '', '', '2');
INSERT INTO `f_fields` VALUES ('156', '单位性质', 'xingzhi', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:330:\"1=国有企业\r\n2=国家机关·事业单位\r\n3=有限责任公司\r\n4=科研设计单位\r\n5=金融单位\r\n6=中高等院校\r\n7=医疗卫生\r\n8=部队\r\n9=中外合资·合作\r\n10=港澳合资·合作\r\n11=外商独资\r\n12=港澳台商投资股份有限公司\r\n13=社会团体\r\n14=乡镇企业\r\n15=私营企业\r\n16=其它性质企业\";}', 'on', '', '', '', '', '7');
INSERT INTO `f_fields` VALUES ('157', '单位规模', 'guimo', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:86:\"1=20人以下\r\n2=20-100人\r\n3=100-300人\r\n4=300-500人\r\n5=500-1000人\r\n6=1000人以上\";}', 'on', '', '', '', '', '8');
INSERT INTO `f_fields` VALUES ('158', '所属行业', 'hangye', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:1461:\"1=计算机\r\n2=互联网/电子商务\r\n3=电器/电子/微电子\r\n4=通信(设备/运营/增值服务)/电信业\r\n5=培训机构/教育/科研院所/科技开发\r\n6=机械制造/机电/重工(制造及设备)\r\n7=能源（电力/石油）/水利\\\\\">能源（电力/石油）/水利\r\n8=化学化工/制药/生物工程\r\n9=轻工/原材料及加工（金属/木材/家具/橡胶/塑料/玻璃/陶瓷/建材）\r\n10=纺织品业（服饰鞋帽/家纺用品/皮具等）\r\n11=文化/艺术\r\n12=广告/策划/会展/公关\r\n13=房地产开发/建筑与工程/房地产中介\r\n14=物业管理/商业中心\r\n15=家居/室内设计/装潢\r\n16=中介服务(人才交流/商标专利/职业介绍)\r\n17=专业服务(信息咨询/财会/法律等)\r\n18=金融业(投资/保险/证券/银行/基金)\r\n19=贸易/进出口/外贸媒体/新闻出版/文化传播\r\n20=印刷/包装/造纸\r\n21=生活消费品(食品/饮料/日化/副食/烟酒等)\r\n22=家电业\r\n23=办公设备/办公用品\r\n24=旅游/酒店/餐饮服务\r\n25=批发/零售/物资供锁\r\n26=交通/运输/仓储物流\r\n27=文化娱乐/运动/休闲/文体\r\n28=医疗/保健/美容/卫生服务\r\n29=医疗设备/器械\r\n30=环境保护\r\n31=矿产/石油/采掘/冶炼/原材料\r\n32=仪器/仪表/工业自动化/电气\r\n33=汽车/摩托车(制造/维护/配件/销售/服务)\r\n34=服务业/商业服务\r\n35=农/林/牧/渔\r\n36=航空/航天研究与制造\r\n37=政府/市政/公共事业/非营利机构\r\n38=其它\";}', 'on', '', '', '', '', '9');
INSERT INTO `f_fields` VALUES ('159', '单位网址', 'homepage', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:2:\"45\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', '', '', '', '', '10');
INSERT INTO `f_fields` VALUES ('160', '单位介绍', 'description', 'mediumtext', 'text', 'a:4:{s:6:\"length\";s:0:\"\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', '', '', '', '', '11');
INSERT INTO `f_fields` VALUES ('161', '年龄', 'age', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:2:\"10\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:3:\"岁\";}', 'on', 'on', '', '', '', '3');
INSERT INTO `f_fields` VALUES ('162', '性别', 'sex', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:18:\"1=男性\r\n2=女性\";}', 'on', 'on', '', '', '', '2');
INSERT INTO `f_fields` VALUES ('163', '我的职业', 'job', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:91:\"1=在校学生\r\n2=求职中\r\n3=上班一族\r\n4=公司高管\r\n5=自由职业\r\n6=创业人士\";}', 'on', 'on', '', '', '', '3');
INSERT INTO `f_fields` VALUES ('164', '我的籍贯', 'birthplace', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '4');
INSERT INTO `f_fields` VALUES ('165', '个人爱好', 'Interests', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:2:\"45\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', '', '', '', '', '5');
INSERT INTO `f_fields` VALUES ('166', '供需', 'gongxu', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:18:\"1=转让\r\n2=求购\";}', 'on', 'on', 'on', 'label', '', '2');
INSERT INTO `f_fields` VALUES ('168', '月薪', 'wage', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:82:\"1=2000元以下\r\n2=2000-3000元\r\n3=3000-5000元\r\n4=5000-10000元\r\n5=10000元以上\";}', 'on', 'on', 'on', 'label', '', '3');
INSERT INTO `f_fields` VALUES ('169', '年龄', 'age', 'varchar', 'select', 'a:2:{s:6:\"length\";s:3:\"255\";s:7:\"choices\";s:80:\"18_23=18-23岁\r\n23_28=23-28岁\r\n28_33=28-33岁\r\n33_40=33-40岁\r\n40_0=40岁以上\";}', '', '', 'on', 'label', '', '6');
INSERT INTO `f_fields` VALUES ('172', '价格', 'price', 'int', 'select', 'a:2:{s:6:\"length\";s:2:\"10\";s:7:\"choices\";s:150:\"0_100=100元以下\r\n100_200=100-200元\r\n200_500=200-500元\r\n500_1000=500-1000元\r\n1000_2000=1000-2000元\r\n2000_5000=2000-3500元\r\n3500_0=3500元以上\";}', '', '', 'on', 'label', '价格辅助查询字段', '5');
INSERT INTO `f_fields` VALUES ('171', '售价', 'price', 'varchar', 'select', 'a:2:{s:6:\"length\";s:3:\"255\";s:7:\"choices\";s:106:\"0_30=30万以下\r\n30_50=30-50万\r\n50_80=50-80万\r\n80_100=80-100万\r\n100_200=100-200万\r\n200_0=200万以上\";}', '', '', 'on', 'label', '', '4');
INSERT INTO `f_fields` VALUES ('173', '区域', 'qy', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:141:\"1=市中区\r\n2=任城区\r\n3=高新区\r\n4=兖州\r\n5=曲阜\r\n6=邹城\r\n7=泗水\r\n8=微山\r\n9=鱼台\r\n10=金乡\r\n11=嘉祥\r\n12=梁山\r\n13=汶上\";}', 'on', '', 'on', 'label', '', '5');
INSERT INTO `f_fields` VALUES ('174', '类型', 'lx', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:8:\"variable\";s:1:\"1\";}', 'on', '', 'on', 'label', '', '0');
INSERT INTO `f_fields` VALUES ('175', '价格', 'price', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:2:\"20\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:3:\"元\";}', 'on', 'on', '', '', '', '3');
INSERT INTO `f_fields` VALUES ('176', '租金', 'price', 'varchar', 'select', 'a:2:{s:6:\"length\";s:3:\"255\";s:7:\"choices\";s:102:\"0_200=200元以下\r\n200_500=200-500元\r\n500_800=500-800元\r\n800_1500=800-1500元\r\n1500_0=1500元以上\";}', '', '', 'on', 'label', '辅助租金搜索字段', '4');
INSERT INTO `f_fields` VALUES ('177', '期望区域', 'qy', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:141:\"1=市中区\r\n2=任城区\r\n3=高新区\r\n4=兖州\r\n5=曲阜\r\n6=邹城\r\n7=泗水\r\n8=微山\r\n9=鱼台\r\n10=金乡\r\n11=嘉祥\r\n12=梁山\r\n13=汶上\";}', 'on', '', 'on', 'label', '', '3');
INSERT INTO `f_fields` VALUES ('179', '期望地段', 'address', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '2');
INSERT INTO `f_fields` VALUES ('180', '期望价格', 'price', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '4');
INSERT INTO `f_fields` VALUES ('181', '期望面积', 'housearea', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '0');
INSERT INTO `f_fields` VALUES ('182', '地址', 'address', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '0');
INSERT INTO `f_fields` VALUES ('183', '时间', 'time', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '0');
INSERT INTO `f_fields` VALUES ('184', '学历', 'education', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:99:\"1=技校\r\n2=初中及以下\r\n3=中专/高中\r\n4=大专\r\n5=本科\r\n6=研究生\r\n7=博士生及以上\";}', 'on', 'on', 'on', 'label', '', '0');
INSERT INTO `f_fields` VALUES ('185', '培训方式', 'pxfs', 'varchar', 'checkbox', 'a:2:{s:6:\"length\";s:3:\"255\";s:7:\"choices\";s:50:\"1=脱产班\r\n2=函授班\r\n3=周末班\r\n4=网络班\";}', 'on', 'on', 'on', 'label', '', '0');
INSERT INTO `f_fields` VALUES ('186', '培训周期', 'pxzq', 'varchar', 'checkbox', 'a:2:{s:6:\"length\";s:3:\"255\";s:7:\"choices\";s:71:\"1=1个月以内\r\n2=1-3个月\r\n3=3-6个月\r\n4=6个月-1年\r\n5=1年以上\";}', 'on', 'on', 'on', 'label', '', '0');
INSERT INTO `f_fields` VALUES ('187', '培训时间', 'pxsj', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', '', '', '', '', '0');
INSERT INTO `f_fields` VALUES ('188', '工资', 'wage', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:142:\"1=面议\r\n2=1000元以下\r\n3=1000-2000元\r\n4=2000-3000元\r\n5=3000-5000元\r\n6=5000-8000元\r\n7=8000-12000元\r\n8=12000-20000元\r\n9=20000元以上\";}', 'on', 'on', 'on', 'label', '', '3');
INSERT INTO `f_fields` VALUES ('190', '发布人', 'fbr', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:24:\"1=公司直招\r\n2=代招\";}', 'on', '', 'on', 'nav', '', '4');
INSERT INTO `f_fields` VALUES ('191', '期望工资', 'wage', 'int', 'select', 'a:2:{s:6:\"length\";s:2:\"10\";s:7:\"choices\";s:142:\"1=面议\r\n2=1000元以下\r\n3=1000-2000元\r\n4=2000-3000元\r\n5=3000-5000元\r\n6=5000-8000元\r\n7=8000-12000元\r\n8=12000-20000元\r\n9=20000元以上\";}', 'on', 'on', '', '', '', '1');
INSERT INTO `f_fields` VALUES ('192', '姓名', 'xingming', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '2');
INSERT INTO `f_fields` VALUES ('193', '工作经验', 'gzjy', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:68:\"1=1年以下\r\n2=1-2年\r\n3=3-5年\r\n4=6-7年\r\n5=8-10年\r\n6=10年以上\";}', 'on', 'on', 'on', 'label', '', '0');
INSERT INTO `f_fields` VALUES ('194', '求职意向', 'qzyx', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:588:\"1=销售/市场/顾问\r\n2=行政/人事/后勤\r\n3=普工/技工\r\n4=餐饮/酒店/旅游\r\n5=财务/会计/出纳\r\n6=客服\r\n7=贸易/采购/商务\r\n8=仓储/物流\r\n9=美容师/美发师/按摩师\r\n10=零售/促销/导购\r\n11=家政保洁/安保\r\n12=医护人员\r\n13=互联网/计算机/通信\r\n14=设计/摄影/创意\r\n15=建筑/房产/物业\r\n16=教育/家教/培训\r\n17=游戏代练/游戏推广员\r\n18=金融/银行/证券/投资\r\n19=法律\r\n20=司机\r\n21=汽车制造/服务\r\n22=电子/电气/仪器仪表\r\n23=农/林/牧/渔业\r\n24=公关/演艺/吧丽/DJ\r\n25=兼职/促销/实习生\";}', 'on', 'on', 'on', 'label', '', '7');
INSERT INTO `f_fields` VALUES ('195', '居住区域', 'qy', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:141:\"1=市中区\r\n2=任城区\r\n3=高新区\r\n4=兖州\r\n5=曲阜\r\n6=邹城\r\n7=泗水\r\n8=微山\r\n9=鱼台\r\n10=金乡\r\n11=嘉祥\r\n12=梁山\r\n13=汶上\";}', 'on', '', '', '', '', '8');
INSERT INTO `f_fields` VALUES ('196', '现居住地', 'address', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:2:\"30\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', '', '', '', '', '9');
INSERT INTO `f_fields` VALUES ('197', '价格', 'price', 'varchar', 'select', 'a:2:{s:6:\"length\";s:3:\"255\";s:7:\"choices\";s:177:\"0_100=100元以下\r\n100_200=100-200元\r\n200_500=200-500元\r\n500_1000=500-1000元\r\n1000_2000=1000-2000元\r\n2000_5000=2000-5000元\r\n5000_10000=5000-10000元\r\n1000_0=10000元以上\";}', '', '', 'on', 'label', '价格辅助搜索字段', '0');
INSERT INTO `f_fields` VALUES ('198', '价格', 'price', 'int', 'select', 'a:2:{s:6:\"length\";s:2:\"10\";s:7:\"choices\";s:145:\"0_1=1万元以内\r\n1_2=1-2万\r\n2_3=2-3万\r\n3_5=3-5万\r\n5_8=5-8万\r\n8_12=8-12万\r\n12_18=12-18万\r\n18_24=18-24万\r\n24_40=24-40万\r\n40_0=40万以上\";}', '', '', 'on', 'label', '价格辅助搜索字段', '0');
INSERT INTO `f_fields` VALUES ('199', '车辆颜色', 'clys', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:147:\"1=黑色\r\n2=白色\r\n3=银灰色\r\n4=深灰色\r\n5=咖啡色\r\n6=红色\r\n7=蓝色\r\n8=绿色\r\n9=黄色\r\n10=橙色\r\n11=香槟色\r\n12=多彩色\r\n13=其它\";}', 'on', 'on', '', '', '', '0');
INSERT INTO `f_fields` VALUES ('200', '行驶里程', 'xslc', 'int', 'text', 'a:4:{s:6:\"length\";s:2:\"10\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:9:\"万公里\";}', 'on', 'on', '', '', '', '0');
INSERT INTO `f_fields` VALUES ('201', '车龄', 'cheling', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:68:\"1=1年以内\r\n2=1-3年\r\n3=3-5年\r\n4=5-8年\r\n5=8-10年\r\n6=10年以上\";}', 'on', 'on', 'on', 'label', '', '0');
INSERT INTO `f_fields` VALUES ('202', '看车地点', 'address', 'varchar', 'text', 'a:4:{s:6:\"length\";s:3:\"255\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '0');
INSERT INTO `f_fields` VALUES ('203', '发布人', 'fbr', 'int', 'radio', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:30:\"1=我是车主\r\n2=我是乘客\";}', 'on', 'on', 'on', 'nav', '', '0');
INSERT INTO `f_fields` VALUES ('206', '排量', 'pl', 'varchar', 'text', 'a:4:{s:6:\"length\";s:2:\"20\";s:4:\"size\";s:0:\"\";s:5:\"value\";s:0:\"\";s:5:\"units\";s:0:\"\";}', 'on', 'on', '', '', '', '0');
INSERT INTO `f_fields` VALUES ('207', '上牌时间', 'spsj', 'int', 'select', 'a:2:{s:6:\"length\";s:1:\"2\";s:7:\"choices\";s:223:\"1=1995年以前\r\n2=1995年\r\n3=1996年\r\n4=1997年\r\n5=1998年\r\n6=1999年\r\n7=2000年\r\n8=2001年\r\n9=2002年\r\n10=2003年\r\n11=2004年\r\n12=2005年\r\n13=2006年\r\n14=2007年\r\n15=2008年\r\n16=2009年\r\n17=2010年\r\n18=2011年\r\n19=2012年\";}', 'on', 'on', '', '', '', '0');

-- ----------------------------
-- Table structure for `f_info`
-- ----------------------------
DROP TABLE IF EXISTS `f_info`;
CREATE TABLE `f_info` (
  `infoid` int(8) NOT NULL auto_increment,
  `userid` int(10) NOT NULL default '0',
  `cid` int(8) NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` mediumtext,
  `tpic` varchar(255) default NULL,
  `imgcount` int(10) NOT NULL default '0',
  `createtime` int(10) NOT NULL default '0' COMMENT '发布日期',
  `refreshtime` int(10) NOT NULL default '0' COMMENT '刷新日期',
  `color` varchar(20) default NULL,
  `realname` varchar(10) NOT NULL,
  `mobile` varchar(30) default NULL,
  `qq` varchar(12) default NULL,
  `postip` varchar(20) NOT NULL,
  `hits` int(10) NOT NULL default '0',
  `status` int(10) NOT NULL default '1' COMMENT '\r\n1:正常\r\n2:待审,3:已删除',
  PRIMARY KEY  (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=1602 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info
-- ----------------------------
INSERT INTO `f_info` VALUES ('2', '3', '14', '中区武装部房屋出售', '中区武装部房屋出售', '', '0', '1259760838', '1261932441', '', '苏先生', '6353612', '', '127.0.0.1', '82', '1');
INSERT INTO `f_info` VALUES ('3', '3', '15', '求租长虹小区、置城国际附近房屋', '求租长虹小区、置城国际附近房屋，联系电话：13805378860', '', '0', '1267450795', '1259674795', '', '戴女士', '3713432', '', '127.0.0.1', '67', '1');
INSERT INTO `f_info` VALUES ('4', '3', '15', '求购冠亚星城一期地下车位', '求购冠亚星城一期地下车位20-30平方米', '', '0', '1267450922', '1259674560', '', '朱先生', '3713432', '120885811', '127.0.0.1', '30', '1');
INSERT INTO `f_info` VALUES ('5', '3', '17', '出租声远舞台附近车库300元', '地址：声远舞台向北100米，建设路东，师专附中宿舍院内车库一间，面积23平米，可做办公室、仓库用，可装宽带（有中国电信、中国网通光缆），月租金300元。', '', '0', '1273024167', '1269528842', '', '尚老师', '2666808', '', '127.0.0.1', '80', '1');
INSERT INTO `f_info` VALUES ('6', '3', '14', '出租出售岱庄医院门口东门面房', '出租出售岱庄医院门口东门面房120平方米，价格40万，联系人：刘先生', '', '0', '1289482412', '1382176004', '', '刘先生', '13805376400', '', '127.0.0.1', '103', '1');
INSERT INTO `f_info` VALUES ('7', '3', '16', '百丰大厦写字楼出租', '金宇大市场附近，百丰大厦，一间50平方米办公室出租，精装修，带空调、宽带、有线，有独立卫生间，价格面议。', '', '0', '1287665584', '1259674451', '', '唐先生', '13562717367', '120885811', '127.0.0.1', '56', '1');
INSERT INTO `f_info` VALUES ('8', '3', '13', '八里营村开发区厂房出租', '面积800平方米，交通便利，水电齐全，年租金2-3万。', '', '0', '1287752166', '1271600595', '', '刘先生', '3713432', '', '127.0.0.1', '141', '1');
INSERT INTO `f_info` VALUES ('9', '3', '13', '博物馆北临4楼 68平方 2室1厅 600元半年一交', '博物馆北临4楼68平方2室1厅600元半年一交', '', '0', '1272343681', '1269564892', '', '汪女士', '6353612', '120885811', '127.0.0.1', '1429', '1');
INSERT INTO `f_info` VALUES ('24', '3', '146', '低价出售 多普达 C750手机送1G内存', '多普达C750，240x320 QVGA高清屏幕，128/256M内存，带WIFI。T版十四天机，99成新。支持EDGE、WIFI,滑轮导航. 包装 全套都有哦。{两块电板，数据线， 耳麦 ，充电器，说明书，光盘』，要买的朋友联系哦！     <br />\r\n     <br />\r\n买机子 就送 1G 的内存卡', '/uploads/info/201310/3_138300863930459_100X75.jpg', '4', '1287498270', '1387277592', '', '金康', '15006570631', '120885811', '127.0.0.60', '171', '1');
INSERT INTO `f_info` VALUES ('1584', '4', '41', '低价转让2012款港版苹果4手机', '2012年中旬买的，港版，黑色。目前闲置在手一段时间。无任何瑕疵的地方。配正版充电器，二手耳机。价格在1000-1500元。可商议。图片上的壳是我自己装的，机可验', '/uploads/info/201310/4_138300912421951_100X75.jpg', '3', '1383009185', '1384330585', null, '吴先生', '15961402809', '908521001', '127.0.0.60', '20', '1');
INSERT INTO `f_info` VALUES ('23', '3', '13', '秀水城附近一楼住房150平方米', '', '', '0', '1267450922', '1268975428', '', '小王', '15006570631', '120885811', '127.0.0.1', '80', '1');
INSERT INTO `f_info` VALUES ('21', '3', '166', '17寸液晶台式电脑出售', '本人现有一台台式电脑出售，电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n配置如下：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n17寸液晶显示器&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\nCPU：AMD2800+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n内存条：金士顿1G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n硬盘：迈拓160G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n显卡：独立7300&nbsp;GF&nbsp;显卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n玩游戏（魔兽、CF、地下城勇士、机战、劲舞团、卡丁车等）都不卡，办公软件（Office&nbsp;2007、网页三剑客、visual&nbsp;studio&nbsp;2008等）都不成问题。炒股、学习、办公足以！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n价格：1200元', '', '0', '1287750732', '1381389468', '#f54100', '小王', '15006570631', '120885811', '127.0.0.1', '1136', '1');
INSERT INTO `f_info` VALUES ('25', '3', '27', '低价出自用胶片相机海鸥DF2000，长焦', '很好用的单反相机，配tokins&nbsp;看不见？请刷新.地宝网mm长焦镜头一个带镜头前盖，kenko&nbsp;uv镜一个，镜头内少量霉点但并不影响成像质量。相机性能完好，内部测光准确，适合入门单反的练习者，收藏亦可。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n价格不刀，爽快者送闪光灯！', '', '0', '1273644355', '1259674818', '', '胡先生', '15006570631', '120885811', '127.0.0.1', '110', '1');
INSERT INTO `f_info` VALUES ('26', '3', '28', '01年吉利轿车两厢转让', '非营运，手续齐全，车况良好，红色车身，银色裙边。因本人换面包车转让。售价9500元，不诚或中介勿扰', '', '0', '1259761301', '1259674901', '', '尹先生', '13355168097', '', '127.0.0.1', '22', '1');
INSERT INTO `f_info` VALUES ('27', '3', '29', '天翼手机长聊卡/中国电信无线固定电话', '中国电信无线固定电话(CDMA)&nbsp;&nbsp;&nbsp;<br />\r\n用于133&nbsp;153&nbsp;189卡&nbsp;&nbsp;&nbsp;<br />\r\n适用对象:&nbsp;家庭用户&nbsp;商铺用户&nbsp;仓库电话&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;<br />\r\n华为ETS2222+无线移动电话机(仅限南昌地区购买)&nbsp;&nbsp;&nbsp;<br />\r\n为方便广大企业和住户的需求，南昌电信公司现推出天翼商话，安装电话有了新的选择！！！华为CDMA无线固话，预存350元话费，就免费送一部无线座机！！&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;<br />\r\n★&nbsp;含350元话费（首次到帐50元，每月返还15元，分20个月返还）&nbsp;&nbsp;&nbsp;<br />\r\n★&nbsp;无月租，市话长途均0.1元/分&nbsp;&nbsp;&nbsp;<br />\r\n★座机还可以收发短信(0.1元/条)&nbsp;&nbsp;&nbsp;<br />\r\n★&nbsp;无需拉线，即买即用方便快捷&nbsp;&nbsp;&nbsp;<br />\r\n★可开通企业个性彩铃&nbsp;&nbsp;&nbsp;<br />\r\n一、业务简介&nbsp;&nbsp;&nbsp;<br />\r\n天翼商话业务是在南昌电信推出一项全新业务，终端的外形类似传统的固定电话机，初期统一终端型号为华为ETS2222+。无需室内布线，可象手机一样随意移动。&nbsp;&nbsp;&nbsp;<br />\r\n二、宣传卖点&nbsp;&nbsp;&nbsp;<br />\r\n1、让“固定电话”动起来：&nbsp;&nbsp;&nbsp;<br />\r\n●可移动的固定电话，最大限度地满足用户使用桌面电话的习惯；&nbsp;&nbsp;&nbsp;<br />\r\n●移机不换号，针对用户可能频繁变换办公地址、变换经营场所，帮助用户摆脱有线的束缚，轻松享受快乐无限的通信新生活；&nbsp;&nbsp;&nbsp;<br />\r\n●无需室内布线，可完全保持您室内整洁美观。&nbsp;&nbsp;&nbsp;<br />\r\n2、超低话费：&nbsp;&nbsp;&nbsp;<br />\r\n●无初装费，即买即用；&nbsp;&nbsp;&nbsp;<br />\r\n●0月租；&nbsp;&nbsp;&nbsp;<br />\r\n●市话长途一个价：0.1元/分钟&nbsp;&nbsp;&nbsp;<br />\r\n●座机也能发短信。&nbsp;&nbsp;&nbsp;<br />\r\n4、预存话费、白拿话机。&nbsp;&nbsp;&nbsp;<br />\r\n三、终端售后服务流程&nbsp;&nbsp;&nbsp;<br />\r\n1、售后服务标准：保修条款和限制保修条款，参阅业务通知。&nbsp;&nbsp;&nbsp;<br />\r\n2、售后流程：如出现故障，统一到南昌电信手机维修服务中心进行检测、换机。&nbsp;&nbsp;&nbsp;<br />\r\n3、华为客户服务热线电话：800&nbsp;830&nbsp;8300&nbsp;/&nbsp;4008&nbsp;308&nbsp;300；&nbsp;&nbsp;&nbsp;<br />\r\n4-促销方案&nbsp;&nbsp;&nbsp;<br />\r\n用户预存350元话费，免费获得一部终端，首次到账50元，其余300话费分20个月返还到用户的账户，每月月初返还15元。&nbsp;&nbsp;&nbsp;<br />\r\n预存话费&nbsp;赠机活动&nbsp;预存话费返还方式&nbsp;赠送增值业务', '', '0', '1267450922', '1268785001', '', '熊兵兵', '13307910512', '', '127.0.0.1', '35', '1');
INSERT INTO `f_info` VALUES ('28', '3', '166', '出售一台自用HP双核笔记本电脑和几个手机', 'HPv3000<br />\r\nAMD双核64*2 TL-50 1600MHZ 14.1显示器<br />\r\n1G内存 80G硬盘 DVD光驱 6150显卡（最大可以到512M显存）玩魔兽世界都可以全开特效，更别说其他游戏了， 事先说明电池不经用了，大概半个小时左右，其他一切都跟新的一样，整机9.5成新,谈的好送你无线鼠键套和BENQ原装笔记本包包（480元一个哦)出售几台自用手机，全带发票！！！！<br />\r\n<br />\r\n多普达6800（全套都在，CDMA手机，全套9.5成新，09年7月18日购入）699 三星I718(机头+电板+内存卡，GSM手机，7成新，08年1月购入）450诺基亚5310（机头+电板+充电器+内存卡，GSM手机，8.5成新，09年2月购入）已出售金鹏A5156（全套都在，CDMA+GSM，双模手机，9成新，09年5月购入）已出售同威A68(机头+电板，小灵通，9成新，07年11月购入，给钱就卖）80 唯奥X316（机头+电板，小灵通，9.5成新，08年1月购入，给钱就卖）80 UT108（机头+电源，小灵通，8成新，07年购入，10块就卖）10UT斯达康G680（机头+电板+内存卡，GSM手机，8.5成新）120 以上任何机子支持换机，不过我只想换NOKIA的，如果有好的我加钱无所谓 最后一天了，不记成本大甩卖了，卖给新大地收手机的也是卖，卖给地友也是卖，大家一起来抢吧，你看重上面的手机报个价格，合适就给你', '', '0', '1273503166', '1267864142', '#f54100', '小万', '13307910512', '120885811', '127.0.0.1', '101', '1');
INSERT INTO `f_info` VALUES ('30', '3', '13', '附院附近 多套住房出租 供暖', '', '', '0', '1267450922', '1265241953', '', '', '2300988', '', '127.0.0.1', '8', '1');
INSERT INTO `f_info` VALUES ('31', '3', '14', '名苑东区有住房一套低价出售', '', '', '0', '1267450922', '1267966845', '', '赵女士', '2927209', '', '127.0.0.1', '26', '1');
INSERT INTO `f_info` VALUES ('32', '3', '30', '奈良美智作品“梦游娃娃”情人节最后惊喜！', '动态的哦&nbsp;<br />\r\n<br />\r\n上海路肯德基旁格子铺上货出售中。。欢迎大家热烈抢购哦！&nbsp;联系本人可优惠<br />\r\n<br />\r\n【材质】高档搪胶<br />\r\n【尺寸】站高约26cm+透明礼盒包装<br />\r\n【特价】138元/只<br />\r\n【说明】此款娃娃为动态的，往后拉一下，里边的发条就绷紧了，聚集了能量，手放了之后，她就会往前跑。所以不需要电池。另外，颜色、样式、大小、包装等和《蜗居》里的完全一样！<br />\r\n————————————————————<br />\r\n<br />\r\n声明：这是高仿版的，不是正版的，正版的在市场上已经没有销售了，价值在元左右，属于稀有收藏品。<br />\r\n<br />\r\n送圆筒透明盒，外包都用。<br />\r\n<br />\r\n如果有意购买,可与我电话联系&nbsp;！！<br />\r\n市内加（10元）可考虑送货上门。', '', '0', '1278135068', '1265243690', '', '小良', '13576039972', '', '127.0.0.1', '30', '1');
INSERT INTO `f_info` VALUES ('33', '3', '59', '只是为了找个彼此相爱的人。平淡生活', '真诚是基础，我相信每个人的脚上都有一双鞋，缘分是天注定。虽然我目前没有，但我仍坚信去等我的爱情。相信人间真善美的东西，总保持一份乐观，我是个简单的人<br />\r\n热爱生活，向往浪漫，喜欢自由，懂得品味，随和,开朗和热情的性格，偶尔也有点小脾气；喜欢旅游贴近自然，也喜欢在安静的空间里做些简单的事情。喜欢自由自在，简单快乐的生活。<br />\r\n<br />\r\n<br />\r\n因为，受到传统教育，我不大善于游走和背叛。包括爱情和友谊。<br />\r\n汶川的地震，让我明白了，爱情的真正定义：不会因为困难而彼此分开，不会因为灾难而彼此放弃，不会因为坚守而断了守候的理由。不会因为看到死亡而对爱情产生怀疑。爱情是该相知相守的，爱情该是相濡以沫的，爱情是该生死界上两手相扶的，爱情是永远对生活抱有希望的。这是我对爱情的看法，也是我对爱情的憧憬，同样是我对爱情的坚定等待的信心。<br />\r\n<br />\r\n相守相依，是爱情的最终演化，直到彼此相扶、相互依赖。我渴望这样的爱情。直到老，依然可以互相搀扶去看朝阳。我很相信，善待自己，才会善待生活。我在过去几年中，一直在对身边人讲，生活是一面镜子，你给生活一份善良，它便回报你两倍的善良。性格开朗。爱好文学。思想上进，有责任心', '', '0', '1278063467', '1267966316', '#f54100', '故乡的云', '13576039972', '', '127.0.0.1', '11', '1');
INSERT INTO `f_info` VALUES ('34', '3', '60', '找真心过日子的女孩', '以前的我也很认真的爱过，但后来我才发现那个人是不属于我的，我也知道感情的事是不能强求，所以后来我放弃了，但我现在想说，如果你是位温柔的女孩，并且愿意给我一片蔚蓝天空，请好好珍惜我。因为我值得。等你来爱我。。。。<br />\r\n我在乎生命中经历的酸甜苦辣，在乎人生中随处而见的真诚和感动，我不完美可是我懂得珍惜生命中的每一位好朋友！！！！！！有意者可联系', '', '0', '1267450922', '1265379800', '', '浩', '13576039972', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('35', '3', '61', '寻找在南昌工作的过年不回贵州老乡一起过年', '本人无不良嗜好，在南昌工作因工作原因过年不能回家！想寻找在南昌工作，过年不回家的朋友一起过年！最好是贵州的20~30岁之间的朋友，最好是女生！希望有感兴趣的朋友看到信息联系我！非诚勿扰！', '', '0', '1267450922', '1265380145', '#f54100', '', '2333322', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('36', '3', '62', '找能说话聊天谈心的朋友！', '整天傻傻的我呆在家里实在不知道做些什么，心情也跟着天气一样变坏了，每天除了买菜，做饭，搞卫生就是整天对着电视，电脑。哎！生活实在很无聊，连说话的朋友也寥寥无几，今天来地宝试试，希望能交到一些聊得来的朋友！注意本人并非征婚，也不喜欢交一些比我小很多的朋友，因为那样话题有距离，所以请谅解！本人只交25至35岁，有正当职业朋友，男女不限，当然女性更好！声明：如果你是在外玩的或是泡吧混的请绕道！谢谢！&nbsp;电话暂不方便公开，QQ全天在线！', '', '0', '1277688101', '1265380347', '', '小燕子', '13311111111', '', '127.0.0.1', '9', '1');
INSERT INTO `f_info` VALUES ('37', '3', '533', '长期招收美甲学员，成绩优异可推荐工作', '你还在为找工作担忧吗？还在为生计奔波吗？还在为创业项目发愁吗？快快加入我们这个美丽的事业！现在全国美甲行业已经形成规模，业内美甲师奇缺，为顺应市场发展需求，我们美媛时尚现招收美甲学员。<br />\r\n本人系正规专业美甲学校毕业高级美甲师，持有“中国劳动局认证高级美甲师证书”，经验丰富，现对外长期招收美甲学员，传授最新专业美甲技术，真正实用的美甲技术。一对一辅导，实践中学习，随到随学，包学会为止，学会后推荐就业！辅导开业，免费提供1年技术支持。学徒期后可留店实习工作，待遇优厚！<br />\r\n初级美甲培训：500元<br />\r\n美甲概论、消毒杀菌、手型与甲型的选择，修甲，指甲油的使用和指甲油与肤色的选择，标准手足部护理，贴片甲制作、基础彩绘在指甲上的排列及搭配等。。。<br />\r\n彩绘类：<br />\r\n（一）手部彩绘制作：<br />\r\n1、色彩的了解及掌握&nbsp;2、渐变色的制作及运用<br />\r\n3、点、线、面的练习&nbsp;<br />\r\n4、图案的练习（圆、尖五瓣花，心形花，色块，豹纹，斑马纹，小玫瑰，大玫瑰花，樱桃，樱花，.....）<br />\r\n5、图案的位置练习&nbsp;6、饰品的运用和粘贴<br />\r\n7、勾绘练习&nbsp;8、拓印花型练习<br />\r\n9、画法式&nbsp;10、甲油的使用方法<br />\r\n<br />\r\n中级美甲培训：1500元<br />\r\n除以上初级课程，中级彩绘、手足部透明水晶甲，中级彩绘，各式光疗：<br />\r\n（羽毛，雪花，蝴蝶结，蝴蝶，草莓，七星瓢虫，海豚，金鱼，翠儿，椰树，哈喽KITTY，中国娃娃！各类卡通.......），最新日韩圆笔彩绘，中国民间彩绘....光疗类：<br />\r\n（一）手部光疗甲制作：<br />\r\n1、自然甲光疗加固制作&nbsp;2、半贴片光疗甲制作<br />\r\n3、浅贴片甲制作&nbsp;4、单色光疗甲制作<br />\r\n5、彩色光疗甲制作&nbsp;6、法式光疗甲制作<br />\r\n7、镭射光疗甲制作&nbsp;8、彩色渐变光疗甲制作<br />\r\n（二）足部光疗甲制作：<br />\r\n1、自然甲光疗加固制作&nbsp;2、单色光疗甲制作<br />\r\n3、彩色光疗甲制作&nbsp;4、法式光疗甲制作<br />\r\n三、卸除：<br />\r\n（一）手部指甲卸除：<br />\r\n1、贴片指甲卸除&nbsp;2、水晶甲卸除<br />\r\n3、光疗甲卸除&nbsp;4、甲油卸除<br />\r\n4、饰品卸除<br />\r\n（二）足部指甲卸除：<br />\r\n1、贴片指甲卸除&nbsp;2、水晶甲卸除<br />\r\n3、光疗甲卸除&nbsp;4、甲油卸除<br />\r\n4、饰品卸除<br />\r\n四、水晶甲、雕花<br />\r\n（一)水晶甲制作<br />\r\n(二）水晶雕花<br />\r\n（三)水晶甲的卸除<br />\r\n<br />\r\n高级全能课程传授：（学费2600）除以上课程，高级课程还将传授<br />\r\n最新的花式水晶指甲有AB效果水晶甲、缤纷内雕甲、冰花琉璃甲、陶瓷水晶甲的制作、花式光疗指甲的制作、水晶甲和光疗的卸除、足部水晶甲和光疗（贴片、法式贴片）甲的制作、透明闪粉延长光疗的制作、法式光疗甲的制作、彩胶光疗甲、单色过渡、双色过渡、光疗雕花、光疗镭射粉甲制作、光疗贝壳甲、光疗干花甲、足部光疗甲、贴片光疗、单色延长、闪光、渐变甲的制作.', '', '0', '1267450922', '1269018634', '', '程小姐', '13987645353', '', '127.0.0.1', '23', '1');
INSERT INTO `f_info` VALUES ('38', '3', '409', '婚纱礼服出租、定做', '　　本店专业提供婚纱、礼服、敬酒服出租，量身定做，来样定做。价格公道，款式新颖。庆开业，优惠多多。欢迎各位准新娘来本店试穿！<br />\r\n<br />\r\n　　主要服务项目：批发、零售、出租、量身定做婚纱、礼服、敬酒服。出售婚鞋、头纱、手套、披肩、裙撑。专业新娘化妆，跟妆，个性婚庆，司仪摄像。承接公司团体年会妆。专业新娘化妆师培训、个人彩妆培训。<br />\r\n<br />\r\n　　完美新娘，你最闪亮！', '', '0', '1267863863', '1267863863', '', '程小姐', '13576039972', '120885811', '127.0.0.1', '24', '1');
INSERT INTO `f_info` VALUES ('39', '3', '87', '大型雕刻、喷绘、写真、灯箱、字牌等广告制', '大型喷绘写真、雕刻、易拉宝，X展架，PP纸，相纸等,户外媒体广告、霓虹灯制作、吸塑字、名片、标牌、效果图设计、展览展示工程、店面装修等！广告代理发布,科普宣传栏广告、专业印刷装订、专业安装户外灯布&nbsp;、条幅，灯箱,蜘蛛人，&nbsp;、贴三面翻，会场布景，开张布景，招牌制作安装。LED灯，吸塑灯箱。&nbsp;PVC卡&nbsp;...&nbsp;全市最低价，打造一流的服务。欢迎新老客户来电咨询', '', '0', '1267450922', '1268017263', '', '郑总', '15006570631', '120885811', '127.0.0.1', '22', '1');
INSERT INTO `f_info` VALUES ('40', '3', '63', '彩色名片3元/盒 送货上门 诚信服务', '南昌新雅彩印厂印刷彩色名片&nbsp;10盒同版3元/盒&nbsp;5盒同版3.8元/盒，2盒同版7.5元/盒（300g的双面铜版纸)&nbsp;<br />\r\n<br />\r\n另印无碳联单、宣传彩页、代金券、DM单、不干胶、服装吊牌、PVC卡、信纸信封等等。<br />\r\n可上门服务洽谈、接稿，南昌市内可送货上门，超快速，高质量，讲诚信！竭诚为您服务！量大优惠，交货及时，质量有保证！<br />\r\n<br />\r\n名片自行设计、文字和图片自主备好，推荐CorelDRAW&nbsp;8.0版本。自行设计者，保证内容准确性，我处不负责核对内容的准确性。<br />\r\n备&nbsp;注：所有彩色名片印刷属于拼版印制，颜色与电脑显示颜色有5%-10%色差属正常现象，如出现此问题概不退货！', '', '0', '1267450922', '1265382992', '', '', '13576039972', '120885811', '127.0.0.1', '17', '1');
INSERT INTO `f_info` VALUES ('41', '3', '168', '免费无线上网卡，免费上网', '请个别商家不要诋毁别人的产品,提高自已的产品,什么下载240KB懂电脑的人都知道下载速度跟带宽有关!!!<br />\r\n跟ADSL有关,&nbsp;友情提醒,注意假货<br />\r\n<br />\r\n出售无线上网卡卡皇，卡皇终极版带屏蔽罩，防电磁干扰，带天线的无线网卡，功率更强，距离更远,官方给出的数据<br />\r\n可视范围可达3000米,穿墙的话信号打折,比自带的网卡强，客户注意，<br />\r\n本款无线主芯片为8187L,并采用了高功率WIFI模块，SMA接口可拆换天线，只要你<br />\r\n所在地区有热点,就能让你免费上网,，，如果你所在的地区比较偏，，想接收更远的<br />\r\n信号，可以选配高增益雷达定向天线，效果好不好,天线来说话,不梭泡,天线图是第2张，&nbsp;我本人在南昌市区装了<br />\r\nN套,欢迎咨询不清楚地方请电话咨询&nbsp;年底清货，特价销售，正品卡皇', '', '0', '1270893044', '1270893044', '', '小猫', '13987645353', '', '127.0.0.1', '46', '1');
INSERT INTO `f_info` VALUES ('42', '14', '28', '出让各种大小排量跑车及小羊低价国产踏板车', '各种款式进口本田2手DIO50&nbsp;铃木AG100&nbsp;1500左右一辆！05蛋蛋！滑板车！小越野！大小排量公赛！yamaha海豚250&nbsp;纯水川崎250&nbsp;雅玛哈&nbsp;铃木AG—100CC&nbsp;街车王：盗匪&nbsp;74A&nbsp;75A—250&nbsp;77A400（+VC）&nbsp;CBR&nbsp;19&nbsp;CBR&nbsp;22&nbsp;97年川崎ZZR250&nbsp;ZXR250&nbsp;ZXR400V&nbsp;本田VFR&nbsp;400&nbsp;阿普利亚RS50（小跑款和太子款）。如要看图片请在我QQ空间看现车，QQ：&nbsp;咨询电话：&nbsp;东升刚子.QQ<br />\r\n。青山路百货大楼斜对面。<br />\r\n另<br />\r\n承接省内外各类大小排量跑车，改装，维修，美容，等业务。大量出售各类品牌车发动机及相关配件', '/uploads/201304/6_12707392438551_100X75.jpg', '4', '1270893073', '1270893073', '', '刚子', '15006570637', '120885813', '127.0.0.1', '414', '1');
INSERT INTO `f_info` VALUES ('43', '4', '166', '酷睿T5550双核自带摄像头笔记本出售', '清华同方锋锐&nbsp;K411<br />\r\n屏幕尺寸&nbsp;14.1英寸&nbsp;<br />\r\n屏幕分辨率&nbsp;1280×800&nbsp;<br />\r\n背光技术&nbsp;TFT&nbsp;WXGA&nbsp;<br />\r\n处理器型号&nbsp;酷睿2双核&nbsp;T5550&nbsp;1.83GHz&nbsp;2级缓存2m<br />\r\n内存&nbsp;1G<br />\r\n硬盘容量&nbsp;120GB&nbsp;SATA&nbsp;5400转<br />\r\n显卡芯片&nbsp;SIS307&nbsp;256M<br />\r\n4个USB&nbsp;4合一读卡器<br />\r\n自带摄像头<br />\r\n光驱DVD<br />\r\n<br />\r\n原装包&nbsp;充电器&nbsp;说明书&nbsp;保修卡&nbsp;发票&nbsp;此机是3年全国保修&nbsp;还有将近1年的保修<br />\r\n<br />\r\n外观9成新&nbsp;本来就是黑色的&nbsp;没任何磨损&nbsp;所以看不出旧<br />\r\n<br />\r\n办公没任何问题，CPU很强的，比网上的都好。办公炒股游戏都可以', '/uploads/201304/5_127091145314158_100X75.jpg', '2', '1270911521', '1270911521', '', '', '3711234', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('44', '4', '166', '9新高配笔记本出售', '基本配置<br />\r\n<br />\r\n处理器&nbsp;迅驰2代&nbsp;1.6GHz&nbsp;<br />\r\n二级缓存:&nbsp;2M<br />\r\n内存&nbsp;768M，(可升级)。<br />\r\n硬盘&nbsp;40G&nbsp;(可升级)。<br />\r\n显卡：64M。<br />\r\n4个USB接口。<br />\r\n内置光驱<br />\r\n显示屏&nbsp;15.1&nbsp;英寸（宽屏）&nbsp;<br />\r\n能上网、看电影、股票、小说等等。<br />\r\n玩穿越火线等3D游戏没有问题，很流畅。<br />\r\n是玩游戏、看电影的好选择。有诚意的来看看，可当场试机。<br />\r\n看机可打电话.', '/uploads/201304/5_12709120484480_100X75.jpg', '1', '1270912091', '1270912091', '', '王同学', '15006570664', '', '127.0.0.1', '63', '1');
INSERT INTO `f_info` VALUES ('45', '4', '168', '电脑城 蹭网卡 各种品牌笔记本全市最低价', '本公司为了回报广大新老客户的厚爱和支持，让广大顾客能买到实惠而又实用的电脑；特别推出以下机型；<br />\r\n<br />\r\n实用型<br />\r\nCPU：AMD&nbsp;240<br />\r\n主板：华硕<br />\r\n硬盘：320G<br />\r\n光驱：华硕DVD<br />\r\n内存：2g<br />\r\n显示器：19液晶<br />\r\n机箱电源：350W大风扇<br />\r\n键盘鼠标：防水套装&nbsp;<br />\r\n参考价钱：2099<br />\r\n<br />\r\n家用型<br />\r\nCPU：酷睿e5300双核<br />\r\n主板：华硕<br />\r\n硬盘：320G<br />\r\n内存：2G<br />\r\n光驱：华硕DVD<br />\r\n显示器：19寸高清<br />\r\n机箱电源；350W静电王<br />\r\n键盘鼠标：双飞燕套装<br />\r\n参考价钱：2399<br />\r\n<br />\r\n游戏型<br />\r\nCPU：AMD&nbsp;8650三核<br />\r\n主板：华硕m4a78<br />\r\n光驱：华硕DVD<br />\r\n硬盘：500G<br />\r\n内存：2G<br />\r\n显示器：19寸高清液显<br />\r\n显卡；七彩虹9600GT黄金板<br />\r\n机箱电源：350W静音王<br />\r\n键盘鼠标：双飞燕套装<br />\r\n参考价钱：2699<br />\r\n<br />\r\n高配型<br />\r\nCPU：AMD&nbsp;8650三核<br />\r\n主板；华硕<br />\r\n光驱：华硕DVD<br />\r\n硬盘：500G<br />\r\n内存；4G<br />\r\n显示器：22寸高清<br />\r\n显卡；七彩虹9600GT黄金版<br />\r\n机箱电源：长城<br />\r\n键盘鼠标；双飞燕防水套装<br />\r\n参考价钱：3899<br />\r\n另外有华硕&nbsp;惠普&nbsp;联想&nbsp;等优势价格笔记本。有需要可以联系<br />\r\n以上产品硬件均保修三年，三个月内免费上门技术服务，！<br />\r\n行情多变！以上价钱只作参考价，具体价钱以当天购买为准！<br />\r\n市区可以考虑送货上门安装<br />\r\n另有销售无线蹭网卡。价格有优势<br />\r\n应本店发展急需在校业务员，工资面仪。&nbsp;硬件更换另议。<br />\r\n地址：南昌市东方电脑城', '', '0', '1270912479', '1270912479', '', '李先生', '13356789431', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('46', '4', '165', '18.5寸液晶显示器一台出售400元', '9新的19寸宽屏液晶电脑显示器！！就一台&nbsp;就一台&nbsp;一台便宜卖&nbsp;不讨价还价！<br />\r\n<br />\r\n保证新屏，5万小时可靠性指标！&nbsp;注意是瑕疵屏（是屏幕上面有几根线、不影响使用寿命和质量。<br />\r\n【规&nbsp;格&nbsp;参&nbsp;数】&nbsp;<br />\r\n产品性能指标：<br />\r\n索尼<br />\r\n类型&nbsp;TFT-LCD&nbsp;<br />\r\n尺寸:&nbsp;　18.5寸&nbsp;宽<br />\r\n显示模式&nbsp;SXGA&nbsp;<br />\r\n点距（毫米）&nbsp;0.294&nbsp;<br />\r\n颜色的数字&nbsp;16.2M&nbsp;<br />\r\n对比度&nbsp;800:1&nbsp;<br />\r\n亮度&nbsp;500&nbsp;<br />\r\n最大分辨率、刷新率：1440×900<br />\r\n响应速度:&nbsp;　4ms<br />\r\n水平可视角度:&nbsp;　180度<br />\r\n垂直可视角度:&nbsp;　140度<br />\r\n具有完整的包装<br />\r\n接口&nbsp;15针普通接口<br />\r\n<br />\r\n配件&nbsp;显示器1台,电源线,&nbsp;<br />\r\n选择液晶的三大理由：<br />\r\n1.&nbsp;功耗低、省电费：一般CRT显示器功耗有100W，而液晶显示器只有35W，以每天开10小时，电费1元/度计算，一年下来用液晶可省240元电费，还可缓解目前电力紧张局面。<br />\r\n2.有利于健康：液晶显示器无电磁辐射、无闪烁，眼睛不会感到劳累干涩，这对长期以来因CRT显示器而受到对皮肤和眼睛乃至身体健康影响的人员来讲无疑是最大的福音。<br />\r\n3.审美：CRT显示器太大太重，太占用桌面空间，也不美观，不符合现代美学的房间装潢布局', '/uploads/201304/5_127091298426921_100X75.jpg', '4', '1270913093', '1270913093', '', '李小姐', '13356789543', '', '127.0.0.1', '16', '1');
INSERT INTO `f_info` VALUES ('47', '4', '169', '韩版迷你汽车鼠标', '颜色：红，白，蓝，黑，银；共五种色,USB接口<br />\r\n<br />\r\n现处理价30元，质量绝对没问题！！！可以当面验货<br />\r\n<br />\r\n鼠标的滚珠，是7彩灯，晚上看很漂亮！！！<br />\r\n<br />\r\n车前是蓝灯，车后是亮红色尾灯，<br />\r\n<br />\r\n一车在手，让你有着驾驭的享受！！！！<br />\r\n<br />\r\n适合各种笔记本和台式电脑&nbsp;一个也送货，数量不多，请抓紧时间哟！', '', '0', '1270913832', '1270913832', '', '李小姐', '13356789431', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('48', '4', '166', '出自用IBM T43本本', 'IBM&nbsp;T43经典本本<br />\r\n处理器迅迟1.86G<br />\r\n内存1G<br />\r\n硬盘40G<br />\r\n光驱DVD<br />\r\n成色非常好<br />\r\n显卡128M', '/uploads/201304/5_127091416925102_100X75.jpg', '4', '1270914826', '1270914826', '', '小张', '3711234', '', '127.0.0.1', '15', '1');
INSERT INTO `f_info` VALUES ('49', '4', '165', '高档盈通A780主机22寸液显大量批发', '新到高档盈通A780主机大量批发&nbsp;70套<br />\r\n主板：盈通A780&nbsp;<br />\r\nCPU：4850+<br />\r\n内存：2G<br />\r\n显卡：盈通9600GT&nbsp;512M<br />\r\n品牌机电<br />\r\n批发：1300元<br />\r\n<br />\r\n<br />\r\n主板：昂达NF5&nbsp;50套<br />\r\nCPU：4000+<br />\r\n内存：1G<br />\r\n显卡：8600GT&nbsp;256M<br />\r\n品牌机电<br />\r\n批发：750元<br />\r\n<br />\r\n<br />\r\n主板：盈通NF5<br />\r\nCPU：4400+<br />\r\n内存：2G<br />\r\n显卡：盈通2600XT<br />\r\n品牌机电<br />\r\n批发：950元&nbsp;<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n主板：精英945<br />\r\nCPU；P43.0<br />\r\n内存：1G<br />\r\n显卡：8600GT&nbsp;256M<br />\r\n品牌机箱电源<br />\r\n批发：780<br />\r\n单卖：830<br />\r\n<br />\r\n<br />\r\n主板:昂达NF5<br />\r\nCPU:3800+<br />\r\n内存:1G<br />\r\n显卡:昂达7600GS&nbsp;256M<br />\r\n多彩机电<br />\r\n批发:650元<br />\r\n单卖:700元<br />\r\n<br />\r\n<br />\r\n<br />\r\n液晶显示器<br />\r\n9.9成新22寸AOC&nbsp;09年生产&nbsp;850批发&nbsp;10台<br />\r\n9.8成新22寸易美逊&nbsp;H2216W&nbsp;850批发&nbsp;120台<br />\r\n<br />\r\n9.5成新22寸HKC&nbsp;820元批发&nbsp;30台<br />\r\n9.5成新19寸宽屏宏基&nbsp;X191W&nbsp;600批发&nbsp;80台<br />\r\n9.5成新19寸宽屏易美逊&nbsp;H192W+&nbsp;580批发&nbsp;35台<br />\r\n9成新19寸标屏TOPVIEW&nbsp;550批发&nbsp;20台<br />\r\n9成新19寸标屏长城&nbsp;钢化玻璃&nbsp;550批发&nbsp;100台<br />\r\n<br />\r\n<br />\r\n<br />\r\n交换机<br />\r\n大量千兆交换机清仓<br />\r\n华为千兆交换机&nbsp;24口<br />\r\n<br />\r\n路由<br />\r\n200B+&nbsp;1000元&nbsp;可带&nbsp;100台以上<br />\r\n3300B+&nbsp;1500元&nbsp;可带100台以上<br />\r\n<br />\r\n<br />\r\n服务器<br />\r\n大量服务器清仓<br />\r\n可带20台&nbsp;的服务器<br />\r\n可带50台的服务器<br />\r\n可带100台的服务器&nbsp;<br />\r\n可带200台的服务器<br />\r\n<br />\r\n大量双飞燕键盘鼠标耳迈&nbsp;23元一套<br />\r\n普通的15元一套<br />\r\n<br />\r\n大量摄像头清仓处理<br />\r\n<br />\r\n网吧钢铁桌&nbsp;批发70元一个位置<br />\r\n网吧椅子&nbsp;批发65元一个翻新过&nbsp;没翻新的35元一个', '', '0', '1270915131', '1270915131', '', '李小姐', '13356789543', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('50', '4', '146', '自用智能手机380和台式电脑580低价售', '台式电脑(价格:580)<br />\r\nCPU:Celeron&nbsp;2.26<br />\r\n内存:512M(可加到2G)<br />\r\n硬盘:ST80G<br />\r\n显卡:64M<br />\r\n主板:845<br />\r\n光驱:DVD<br />\r\n显示器:17寸带<br />\r\n<br />\r\n联系电话:刘QQ:(不常在线)<br />\r\n<br />\r\n还有手机一起要出掉,UT斯达康6700&nbsp;智能手机,去年买的,现在觉得电信的不好用,想换移动的要的可以给个价,合适就一起出了.配件齐全&nbsp;价格380元', '/uploads/201304/5_12709155454378_100X75.jpg', '3', '1270915565', '1270915565', '', '刘', '13574737373', '', '127.0.0.1', '15', '1');
INSERT INTO `f_info` VALUES ('51', '3', '166', '夏日空调房上网必备带风扇折叠笔记本电脑桌', '炎炎夏日快到了，想躺在空调房上网，但又没有电脑桌怎么办。我们可以帮你解决这个问题。本店新到E-table笔记本电脑桌。全折叠，出差也可以带着走。。全国统一零售价150元&nbsp;本店进行促销现价只要95元（南昌市内免费送货上门）', '', '0', '1270958251', '1270958251', '', '张生', '13356789431', '', '127.0.0.1', '19', '1');
INSERT INTO `f_info` VALUES ('52', '3', '32', '便宜售“金海马”健身半年卡', '本人有&nbsp;金海马健身俱乐部&nbsp;“半年卡”&nbsp;2张，&nbsp;官方报价800块1张，现因有事500块1张或950块2张转出去，有需要的朋友联系本人Q聊：&nbsp;注明是购卡...&nbsp;。此卡购买者可从激活日开始算时间，半年内无限次数健身。&nbsp;非常适合去金海马健身的朋友。机会不多，&nbsp;售完不再有。<br />\r\n需要卡的朋友联系本人Q聊：,&nbsp;注明是购卡&nbsp;(本人长期隐身在线)<br />\r\n本卡可享受的健身项目有:拉丁、瑜珈、肚皮舞、街舞、健身操、民族舞等各种形体舞操;动感单车、有氧器械、跑步机、力量训练、斯洛克、桑拿淋浴;免费看电影、上网聊天、乒乓球羽毛球。有空调开放和游泳馆还有网球等场所，&nbsp;绝对高档。<br />\r\n凭卡还可免费享受桑拿，冷热水冲凉沐浴设备….免费的沐浴露、洗发水、理容用品、拖鞋等~~~~&nbsp;<br />\r\n<br />\r\n全南昌可有三家店都可以用。&nbsp;分别是三个店（步行街的炫谷青年街4楼，青山湖金色水岸5楼，南昌市财富广场6楼）三个店都可以通用，不限次数...<br />\r\n<br />\r\n非诚勿扰，不接受讨价还价者。&nbsp;谢谢~', '', '0', '1270958496', '1270958496', '', '李先生', '13356789543', '', '127.0.0.1', '48', '1');
INSERT INTO `f_info` VALUES ('53', '3', '14', '樱花宿舍售房，红星新苑售房，光明小区售房', '光明售房;6~7层120平方，储10平，53万.。皇营滨海：3楼3室1厅110平方，储17平，43万', '', '0', '1271175597', '1271175597', '', '张女士', '13395377058', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('54', '3', '15', '求租一套三室一厅（中介勿扰）', '床，热水器，空调,中介勿扰', '', '0', '1271175866', '1271175866', '', '董小姐', '15153712750', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('55', '4', '13', '运河盛世14楼3室2厅，中装修，供暖新房', '', '', '0', '1271176273', '1271176273', '', '薛先生', '13583792836', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('56', '4', '16', '秀水城向南100米，商务、办公、住宿于一', '位于21楼，总数27层，新房，未住，精装修，面积92.5平方米，水电煤暖、闭路、宽带齐全，有专用停车位，价格面议。', '', '0', '1271176577', '1271176577', '', '江先生', '13371244985', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('57', '3', '13', '银都花园精装修房屋出租', '木地板，双层玻璃，高质护栏，海尔整体厨房，全友家私，吉斯沙发，3张床，3套橱子，书桌，宽带，电话，太阳能、洗衣机、冰箱、电视等齐全。小区内有2处幼儿园，1处小学，周边游小学、高中、初中数处，赛马特、银座、大润发、儿童乐园近在咫尺，就医、就学、出行、购物、娱乐十分方便，对面派出所，停车方便，可拎包入住。', '', '0', '1271207983', '1271207983', '', '张女士', '13675377182', '', '127.0.0.1', '52', '1');
INSERT INTO `f_info` VALUES ('58', '3', '13', '东发小区4＊2＊1 家具家电 600元', '水电&nbsp;煤&nbsp;有线&nbsp;宽带&nbsp;抽油烟机&nbsp;洗衣机&nbsp;衣柜&nbsp;热水器&nbsp;床&nbsp;电视机', '', '0', '1271208387', '1271208387', '', '王女士', '13793784299', '', '127.0.0.1', '5', '1');
INSERT INTO `f_info` VALUES ('59', '3', '13', '出租建设路中区政府对面6楼套间办公室', '水、电、写字桌、椅子', '', '0', '1271213142', '1271213142', '', '朱先生', '15725072903', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('60', '3', '13', '南站附近有房出租', '水电&nbsp;煤&nbsp;简单家具', '', '0', '1271226252', '1271226252', '', '王女士', '13793784299', '', '127.0.0.1', '5', '1');
INSERT INTO `f_info` VALUES ('61', '3', '13', '碧水云天有現房出租', '空调.热水器.水.电.煤.供暖.电視', '', '0', '1271232534', '1271232534', '', '李先生', '2738926', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('62', '3', '13', '阳光润泽园七楼精装修房出租', '床，衣橱，车位，太阳能，暖气', '', '0', '1271233572', '1271233572', '', '陈女士', '13053764908', '', '127.0.0.1', '5', '1');
INSERT INTO `f_info` VALUES ('63', '3', '13', '红星小区4楼两室一厅供暖家具家电850/月', '另售&nbsp;科苑小区6楼供暖&nbsp;精装&nbsp;130平方三室两厅储藏室10平方&nbsp;47万大市证&nbsp;三室向阳', '', '0', '1271235930', '1271235930', '', '尹女士', '15215375378', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('64', '3', '16', '利隆大厦商务中心招租', '济宁利隆大厦专业写字楼招租<br />\r\n&nbsp;&nbsp;&nbsp;利隆大厦商务中心地处市区黄金地段，周邻市二院、爱客多超市、百花公园、楼下多路公交站牌，交通便利。楼内设施齐全，全方位安全实时监控，专业化管理，内设车棚，楼前车位，24小时保安值勤，面积69--110平方米可选，环境优雅，统一物业管理，高性价比。是市区商务办公首选场所，欢迎前来参观、洽谈！<br />\r\n黄金地段沿街营业房招租<br />\r\n&nbsp;&nbsp;&nbsp;利隆大厦沿街营业房位于市区黄金地段，交通便利，周邻市二院、银座、百花公园、爱客多超市，是财富旺角。现租赁到期调整招租，面积256.8——513.6平方米，灵活空间组合，自由选择面积(茶类经营、茶饮西餐厅、品牌药店、金融、品牌服装专卖可优先考虑)，浓厚商业氛围让您发财有地，财源广进。', '', '0', '1271236718', '1271236718', '', '王女士', '3163399', '', '127.0.0.1', '6', '1');
INSERT INTO `f_info` VALUES ('65', '3', '14', '郭家花园房屋出售', '包括储藏室价格（储藏室4万元）', '', '0', '1271239166', '1271239166', '', '胡女士', '13583752013', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('66', '3', '14', '科苑小区楼房出售免税', '', '', '0', '1271239401', '1271239401', '', '嘉园房产', '2124777', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('67', '3', '14', '琵琶山小区3楼暖房急售', '市党校100平供暖宿舍39万大市证,煤,闭,暖,储,院内能仃车,传达室,大市证', '', '0', '1271239745', '1271239745', '', '张先生', '2102832', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('69', '3', '13', '金宇路置城国际一大型办公场所出租', '环境优雅，装修豪华，办公区域分割合理，适合企业办公用，入即可使用', '', '0', '1271269048', '1271269048', '', '李总', '13145378217', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('70', '3', '13', '龙行小区，十五中西邻，两室600元', '床，衣橱，热水器', '', '0', '1271269297', '1271269297', '', '杨先生', '13854701867', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('71', '3', '15', '求购公路之家沿街住宅楼', '2室或三室都可,水电暖市证', '', '0', '1271270182', '1271270182', '', '孟先生', '13153711287', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('72', '3', '13', '秦庄小区房屋出租', '全套家具、彩电、空调、太阳能、电脑', '', '0', '1271309370', '1271309370', '', '高女士', '15864136988', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('73', '3', '13', '附院附近 2室1厅 装修 家具 太阳能 550元', '水电煤简装,家具太阳能', '', '0', '1271309722', '1271309722', '', '李女士', '2859601', '', '127.0.0.1', '4', '1');
INSERT INTO `f_info` VALUES ('74', '3', '161', '对讲机批发零售', '批发各种型号对讲机、车载台、摩托罗拉对讲机、建伍对讲机、八重洲对讲机、BF北峰对讲机、HLT好灵通对讲机、TYT特易通对讲机、FDX飞达信对讲机,HD鸿达对讲机，TM九重州对讲机，九伯通对讲机；各种对讲机配件，驰尔达对讲机，RONWAY隆威对讲机，等等', '', '0', '1271310870', '1271310870', '', '徐兵', '15963757222', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('75', '3', '170', '瑞星杀毒软件仅售60元', '瑞星杀毒软件，两年升级版！仅售60元！<br />\r\n每天前20名拨打电话预订者享受系统故障保修半年待遇！', '', '0', '1276510359', '1271311048', '', '李经理', '15063737618', '', '127.0.0.1', '53', '1');
INSERT INTO `f_info` VALUES ('76', '3', '146', '优惠价!移动手机卡,充值卡3.8折批发', '优惠价！移动手机卡，充值卡3.8折批发<br />\r\n<br />\r\n<br />\r\n全国通用(移动-联通-电信)手机充值卡，游戏点卡，Q币卡，石化卡(加油卡)一律3.8折出售！实值话费100％保障,假一赔十！100面值￥38元,面值50元批￥19元,面值200元批￥76元，面值300元批￥114元。量少可办理特快专递服务宗旨:以质量求生存,以技术求信誉,以信誉迎客户,以联合求发展。最优质的产品；最优惠的价格,欢迎广大客户光临.充值卡有效期到2011年12月31日!欲购从速！', '', '0', '1273731447', '1271312247', '', '张先生', '13929576216', '85126035', '127.0.0.1', '7', '1');
INSERT INTO `f_info` VALUES ('77', '3', '146', '金立S606全新转让', '我是在4月10号买的金立S606，手续齐全，本人用惯诺基亚智能手机了，突然用了一个非智能的，有点适应不了，想再买一部诺基亚智能电话，所以现在出售本机！价钱可以商量！', '', '0', '1276510230', '1271312810', '', '张先生', '15106479960', '', '127.0.0.1', '5', '1');
INSERT INTO `f_info` VALUES ('78', '14', '146', '出售自用OPPOA1009成新', '09年10月份自己在天策买的!&nbsp;无任何毛病！发票全部都可给你！济宁中区可当面交易!', '/uploads/201304/6_127131317610180_100X75.jpg', '2', '1271554811', '1271554811', '', 'aa2041498', '18753700511', '', '127.0.0.1', '33', '1');
INSERT INTO `f_info` VALUES ('79', '4', '146', '港行有保修发票包装5800支持3G和WIFL', '原装电池&nbsp;商务电池&nbsp;充电器&nbsp;坐冲&nbsp;线控耳机&nbsp;拨片挂绳&nbsp;手写笔&nbsp;包装&nbsp;发*票说明书&nbsp;三码合一&nbsp;机器三无屏幕完美贴膜&nbsp;没花屏和听筒毛病<br />\r\n价格1280&nbsp;讲价的就不要加了&nbsp;谢谢', '/uploads/201304/5_127131353922255_100X75.jpg', '4', '1271313595', '1271313595', '', '', '13173170008', '', '127.0.0.1', '12', '1');
INSERT INTO `f_info` VALUES ('80', '4', '146', '因急需用钱.低价出售 港版 精仿8G N95一部', '比普通仿的要好.懂行的都晓得 高仿也分好几个版本的.', '', '0', '1271313783', '1381645291', '', '唐先生', '15206766444', '', '127.0.0.30', '8', '1');
INSERT INTO `f_info` VALUES ('81', '4', '146', '自用9.999新魅族M8,出手了,上图了', '自己用的机器，一直带套，前后贴膜，可以说无任何磨损，和新的没两样，成色看图片，1300不刀了，换也行，因本人用不惯触摸屏的，所以出手，免刀，勒价的免开尊口！', '/uploads/info/201310/4_13829262049096_100X75.jpg', '4', '1273670626', '1383008201', '', '常先生', '15253755789', '120885811', '127.0.0.60', '278', '1');
INSERT INTO `f_info` VALUES ('82', '4', '38', '纯棉T恤批发', '服装批发&nbsp;www.123400.com&nbsp;淘依依服饰&nbsp;2010年新款&nbsp;厂家自产自销&nbsp;<br />\r\n专业生产批发时尚T恤&nbsp;8元时尚T恤批发&nbsp;日韩女装&nbsp;韩版长款&nbsp;短袖T恤&nbsp;打底衫&nbsp;<br />\r\n，吊带,卫衣外套&nbsp;时尚韩版火爆T恤&nbsp;一系列服装批发&nbsp;5元-15元！款式多样，质量绝对保证！可任意选款选色&nbsp;支持支付宝交易&nbsp;货到付款！', '/uploads/201304/5_1271314611649_100X75.jpg', '4', '1271314706', '1271314706', '', '', '13760878186', '', '127.0.0.1', '14', '1');
INSERT INTO `f_info` VALUES ('83', '4', '38', '《夏娃之秀内衣价格{图}夏娃之秀魔力挺》三星出售', '浙江永康市三星礼品制造有限公司提供-夏娃之秀黄金甲。<br />\r\n夏娃之秀魔力挺,,夏娃之秀魔力挺,阿朵代言,一穿就挺.它通过下厚上薄的托胸设计,与胸部完美贴合,穿上它,就能随走动开始按摩胸部,你的乳房边呼吸边波动.现在二、问：文胸为什么会有肉感？<br />\r\n答：因为夏娃之秀文胸罩杯采用精选橡胶树乳汁精炼而成，加以人体学、仿生学为理论指导，设计出重量感、手感与人体乳房的比例为1：1：1，肉感仿真度在95%以上，能达到与乳房浑然一体的效果，穿着特别舒适，完全没有重量感觉。<br />\r\n三、问：文胸为什么需要有重量感？<br />\r\n答：肉感包括重量感，与人体相同比例的重量；第一、能带给女性全新亲肤的感觉，自然、动感、有弹性；第二、逼真的感觉带给女性更多的自信。第三、女性穿着文胸，有适当的重量使得乳房不易移位。<br />\r\n四、问：文胸有孔就能透气吗？<br />\r\n答：现在大部分透气文胸的罩杯孔都是直的，只能让其中一部分肌肤透气，而采用天然橡胶，并利用仿生学蜂窝原理，科学的设计出六百个有方向排列的透气孔，孔管有一定长度，加之橡胶柔软质感，女性在走动就能有效自动透气、对流换氧。<br />\r\n五、问：按摩对乳房的好处？<br />\r\n答：按摩保健功能能有效的促进血液循环，夏娃之秀利用柔软天然材质，不压迫乳房，使女性在日常生活中就能达到抚摸式不间断按摩，称之为完美按摩效果。<br />\r\n官方网址：www.sxzz369.com', '/uploads/201304/5_127131496628584_100X75.jpg', '4', '1272073320', '1382921281', '', '', '13588614508', '', '127.0.0.1', '106', '1');
INSERT INTO `f_info` VALUES ('84', '4', '38', '网络批发外贸牛仔裤 货到付款', '网络批发外贸牛仔裤&nbsp;货到付款<br />\r\nwww.020jeans.com<br />\r\n有需求的朋友请直接与我们在线客服联系！<br />\r\n我们支持先拿一两件样板看品质后再批发&nbsp;批发支持支付宝货到付款！安全可靠', '/uploads/201304/5_127131546625306_100X75.jpg', '1', '1272073149', '1272073149', '', '', '13711442053', '', '127.0.0.1', '41', '1');
INSERT INTO `f_info` VALUES ('85', '4', '38', '全新款春夏装上架啦', '全新款春夏女装上架啦，10件就可以批发（可混批），品牌女装一件即可代发货', '/uploads/201304/5_12713158856405_100X75.jpg', '3', '1271555303', '1271555303', '', '', '15814632864', '', '127.0.0.1', '211', '1');
INSERT INTO `f_info` VALUES ('86', '4', '587', '分管销售工作副总', '负责公司的销售及策划', '', '0', '1275192843', '1275192869', '', '', '4487202', '', '127.0.0.1', '6', '1');
INSERT INTO `f_info` VALUES ('87', '3', '523', '济宁圣佳商标注册办事人员', '济宁市圣佳商标事务所现分别开展：商标注册、专利申请、版权、包装设计、企业工商登记、年检、变更、注销及香港公司登记申请。&nbsp;为济宁市各大企业承办企业管理、法律顾问、品牌保护、评估等综合服务。现因业务需要急招一名办事员、一名会计人员，女性，年龄25-35岁，联系人：丁老师，地址：济宁市古槐路30号大市工商局一楼', '', '0', '1271806439', '1271806439', '', '魏老师', '0537-2897107', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('88', '3', '554', '济宁豪门私人俱乐部向社会诚招商务文员 - 1000元', '工作描述：职位要求：福利待遇：150生活补助+五险公司简介：外资固定电话：2487266联系人：付经理', '', '0', '1277722308', '1271806835', '', '付经理', '2487266', '', '127.0.0.1', '4', '1');
INSERT INTO `f_info` VALUES ('89', '3', '602', '摩托罗拉公司招聘文员', '摩托罗拉公司招聘文员<br />\r\n要求年龄18-30周岁&nbsp;形象气质佳&nbsp;身体健康&nbsp;熟悉办公室软件有爱岗敬业精神待遇基本工资1800元&nbsp;有补助有奖金&nbsp;月薪在2500左右&nbsp;包食宿&nbsp;有班车上保险外地户口五险8小时正常班&nbsp;双休日&nbsp;可享受国家法定节假日主要负责各种资料、文件、档案的收集、收发、制作、打印、复印和存档保管工作，熟练应用office办公软件，熟练word等相关软件；对工作认真负责、细致、严谨，有良好的条理性、较强的记忆力；积极进取，聪颖好学，工作心态稳定、踏实肯干，有良好的团队精神包食宿&nbsp;有班车上五险。&nbsp;面试请携带身份证原件、身份证复印件三张、一寸照片三张,管住管住,保五险.有意者请联系我们，孙先生，&nbsp;地点：天津塘沽.', '', '0', '1271807125', '1271807125', '', '孙先生', '18920779168', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('90', '3', '554', '兖州阳光纸制品加工厂招聘', '大专以上学历，男性，未婚,形象好；行政管理相关专业,两年以上工作经验；有较强的组织协调能力。', '', '0', '1271807468', '1271807468', '', '', '0537-3333056', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('91', '3', '546', '会计--济宁科圣科技有限公司', '技能要求：&nbsp;有会计资格证，有中级会计师资格证书者优先&nbsp;有会计公司工作经验,熟练操作财务软件&nbsp;良好沟通能力，具有敬业精神&nbsp;招聘外勤会计:&nbsp;1、相貌端正，吃苦耐劳，能承担高强度工作。&nbsp;2、良好的沟通及独立处理问题的能力。&nbsp;3、具有财务及税务知识。&nbsp;4、具有会计公司工作经验者优先考虑,薪金面议.&nbsp;主要工作内容：&nbsp;到客户处送取一些票据，到税务所或工商所办一些事情；&nbsp;去税务申报纳税；去银行缴纳税款；&nbsp;与客户联系取送资料；&nbsp;辅助会计工作；', '', '0', '1271807697', '1271807697', '', '', '15305475493', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('92', '3', '602', '济宁润发房产开发有限公司招会计', '会计学专业科以上学历,具有2年以上房地产开发企业会计工作经验；熟悉房地产运作流程及相关政策法规；完整从事过一个或以上地产项目的会计核算,细心踏实,具有较强沟通协调能力和良好的职业道德操守；能熟练使用Excel等办公软件,熟悉用友财务软件者优先。', '', '0', '1271807974', '1271807974', '', '', '15305475493', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('93', '3', '508', '主管会计（济宁邹城）', '财会专业，统招大专以上学历，三年以上工作经验，有会计证，具有生产型企业经验优先考虑', '', '0', '1271808261', '1271808261', '', '', '0537-5619878', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('94', '3', '536', '招聘客服经理', '要求；熟悉电脑应用，沟通能力强，有团对精神。<br />\r\n整体厨房在一二级城市已经非常普及，在三级市场刚刚兴起，嘉祥又没有公司化运作的。所以愿与有志之士共同创业！', '', '0', '1271820585', '1271820585', '', '郝先生', '13153768699', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('95', '3', '604', '招聘女营业员', '女，年龄18-35岁，月薪700元加提成。', '', '0', '1271906143', '1271906143', '', '冯经理', '13563714816', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('96', '3', '617', '招聘会计5名', '招聘会计5名，年龄：20岁左右，中专以上学历，有会计上岗证优先，能熟练操纵电脑，男女不限，月薪：1000元以上。主管会计1名，年龄：28-40岁，男士，中专以上学历，有会计上岗证，3年以上工作经验，月薪：1000元以上', '', '0', '1271906757', '1271906757', '', '李老师', '2108888', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('97', '3', '501', '美的电器济宁经销处招聘商超营业员10名', '美的电器济宁经销处招聘商超营业员10名！<br />\r\n要求：女性，年龄35岁以下，形象气质佳，有商超工作经验优先！<br />\r\n工作地点：华润苏果超市、九龙家电、苏宁电器大卖场、天安家电<br />\r\n待遇：试用期一个月，试用期过后每月560元底薪提成', '', '0', '1271907405', '1271907405', '', '徐经理', '13953709300', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('98', '3', '611', '济宁心智教育高薪招聘专兼职', '自习老师：晚7点到9点&nbsp;负责学生的作业检查&nbsp;科目数学&nbsp;物理&nbsp;化学<br />\r\n<br />\r\n单科授课老师：周末&nbsp;负责学生的科目加强&nbsp;出卷考题与讲解<br />\r\n<br />\r\n市场推广：负责本中心业务的推广，教材&nbsp;教务&nbsp;心智开发&nbsp;渠道开发<br />\r\n<br />\r\n信息专员：负责采集客户信息&nbsp;终端业务开发&nbsp;市场信息&nbsp;网络营销', '', '0', '1271912530', '1271912530', '', '高波', '13563714260', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('99', '3', '531', '诚聘办公人员2名', '未婚，年龄24岁以下，专科以上学历，熟练计算机全方面操作，有一定的语言表达能力，普通话标准，有一年以上办公工作经验者优先，底薪800-1000元加补助。', '', '0', '1271919362', '1271919362', '', '李女士', '0537-2600372', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('100', '3', '516', '招聘文秘、出纳', '招聘文秘、出纳各1名，女性，中专以上学历，年龄：21-28岁，最好电算化专业。工资具体面议', '', '0', '1271919362', '1271919362', '', '马经理', '15666175170', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('101', '3', '514', '招聘商超业务', '年龄18-22周岁，男女不限，最低月薪1500元。', '', '0', '1271919362', '1271919362', '', '郑先生', '15866062578', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('102', '3', '536', '诚聘售后服务人员', '年龄30岁以下，专科以上学历，语言表达能力强，能吃苦耐劳，能长期出差驻外，有1年以上机械（挖掘机、推土机、汽车机电维修）销售工作经验者优先，底薪1200元加提成。', '', '0', '1271919363', '1271919363', '', '李女士', '0537-2600372', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('103', '3', '612', '诚聘销售人员', '年龄25岁以下，专科以上学历，语言表达能力强，能长期出差驻外，有1年以上机械销售工作经验者优先，底薪1500元加奖金加提成加生活补助。', '', '0', '1271919363', '1271919363', '', '李女士', '0537-2600372', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('104', '3', '533', '工程公司招聘保安', '男，年龄45岁以下，有工作经验者优先，工作责任心强，身体健康，月工资1400元。<br /><br /><br />', '', '0', '1271919363', '1271919363', '', '王女士', '3163399', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('105', '3', '542', '中信银行招聘客户经理', '要求：大专以上学历，男女不限，年龄：23-30岁，底薪：900元，五险一金，双休。有意者请发送个人简历至：wdxyk@163.com，谢绝来访。', '', '0', '1271919364', '1271919364', '', '史经理', '0537-3201231', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('106', '3', '513', '元森贸易有限公司招聘会计', '年龄26岁以下，能出差，有一年以上工作经验，底薪1000元可面议。', '', '0', '1271919364', '1271919364', '', '李女士', '2381857', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('107', '3', '555', '！专兼职 急 办公 出纳   跟车 司机····', '<br /><br />长期招发传单人员一天30-40元日结！男女不限<br /><br /><br /><br />办公10名 男女不限 月薪800-1500元<br /><br /><br /><br />仓管8名 男女不限 月薪800-1500元<br /><br /><br /><br />普工60名 男女不限 月薪1200-2000元<br /><br /><br /><br />出纳会计5名 月薪800-2000元<br /><br /><br /><br />装卸工20名 一天60-100元<br /><br /><br /><br />跟车10名 男1000-1500元<br /><br /><br /><br />大小车司机10名 月薪1000-3000元<br /><br /><br /><br />保安10名月薪900-1300元（无押金<br /><br /><br /><br />以上人员均8小时单休 提供食宿<br /><br /><br /><br /> <br />联系电话：15263707465  <br />', '', '0', '1271919365', '1271919365', '', '刘经理', '15263707465', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('108', '3', '584', '湖上人家', '湖上人家——中国首家渔家文化主题酒店，旗舰店现因工作需要，现招聘以下优秀工作人员：<br />服务员，女，工资1500元以上；<br />保安2名，年龄18-25岁，男女不限，工资1000-1500元；<br />迎宾6名，工资1200元以上；<br />服务部经理2名，工资2500元以上。<br />以上人员包食宿，加工龄工资，加住房补助，加伙食补助，每月4天休班。', '', '0', '1271919365', '1271919365', '', '张经理', '13854768368', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('109', '3', '518', '招聘收银员', '男女不限，年龄：18-40岁，能长期工作，上正常班，月薪：700元加提成。', '', '0', '1271919365', '1271919365', '', '张女士', '15305472119', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('110', '3', '554', '炫风国术招聘跆拳道教练一名', '要求：有代课经验，技术过硬，有责任心，女性优先，月薪：1000元以上提成优厚。', '', '0', '1271919366', '1271919366', '', '王先生', '2662619', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('111', '3', '516', '济宁卫康胶业招聘电子商务人员1名', '招聘电子商务人员1名，要求：计算机或电子商务专业，有工作经验者优先，试用期月薪：1000元，试用期后根据工作情况调整工资，电话营销人员2名，男士优先，试用期月薪：1000元，试用期后工资加提成。工业会计一名，要求：3年以上工作经验，工资面议。', '', '0', '1271919366', '1271919366', '', '司小姐', '2891116', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('112', '3', '523', '诚聘区域经理、部门助理', '公司属于世界500强企业，由于公司业绩的稳步提升，为了更好的服务老客户，建立健全售后服务体系，特招聘售后服务专员，经理助理。要求有耐性，善于交流。（本部分内勤和外勤）<br />本部主要致力于老客户的地址变更、电话变更、账号变更、受益人变更、保费的收缴、理赔等新老客户的售后服务工作为每一位想成功的人士提供发挥个人能力的平台，以诚相待，待遇优厚，详情请公司面谈！', '', '0', '1271919367', '1271919367', '', '江先生', '15275779763', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('113', '3', '566', '手工招聘', '招专兼职手工加工人员，简单容易，无需学习，免费供料，现金结算，时间自由，可带回家制作，步骤简单。适合闲置在家和兼职的女士制作。日收入20至30左右。招十二县市加盟商。', '', '0', '1271919367', '1271919367', '', '李女士', '15953746416', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('114', '3', '608', '招聘美容师', '年龄不限，女，最低月薪800元。', '', '0', '1271919367', '1271919367', '', '李女士', '13518650979', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('115', '3', '586', '招聘微机操作员', '发布产品销售信息及网络推广，有一定文字功底，底薪1000元加销售提成。', '', '0', '1271919368', '1271919368', '', '陆先生', '13287272999', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('116', '3', '521', '诚聘优秀老师及工作人员—志强机器人教育学校招生 （5-16岁', '师范类  物理系  通讯工程  电子的相关专业者优先', '', '0', '1271919368', '1271919368', '', '王校长', '15253716999', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('117', '3', '617', '月薪3000元诚招优秀售楼员', '年龄22-28周岁，女，有相关工作经验，形象气质佳。', '', '0', '1271919369', '1271919369', '', '乔经理', '0537-2166615', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('118', '3', '559', '！火车票售票', '火车票售票处招聘售票员，18-40岁，无家庭负担，有责任心，敬业爱岗，试用期800元，8小时单休，长白班。<br /><br /><br /><br />办公10名，男女不限，月薪800-1500元<br /><br /><br /><br />出纳10名，女性，月薪1000-1500元<br /><br /><br /><br />信息发布员5名， 月薪1000-1300元<br /><br /><br /><br />仓库管理员10名，男女不限，月薪1000-1500元<br /><br /><br /><br />保安10名，男女不限，月薪1000-3000元<br /><br /><br /><br />以上人员均8小时单休，提供食宿 <br />联系电话：2060690  <br />', '', '0', '1271920102', '1271920102', '', '李经理', '2060690', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('119', '3', '538', '招聘置业顾问', '年龄23-28岁，男女不限，有工作经验，最低月薪1000元加提成。', '', '0', '1271920103', '1271920103', '', '杭女士', '2058888', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('120', '3', '556', '急招洗车工', '年龄：18-40岁，男女不限，男性包住宿，有中餐，月薪：1000元。', '', '0', '1271920103', '1271920103', '', '杜小姐', '2337484', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('121', '3', '541', '招聘操盘手', '要求：金融、证券相关专业，大专以上学历，年龄：23岁以上，男女不限，有无工作经验均可，底薪：1000元具体面议。', '', '0', '1271920105', '1271920105', '', '王女士', '13953700910', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('122', '3', '610', '济宁心智教育高薪招聘专兼职', '<br />自习老师：晚7点到9点 负责学生的作业检查 科目数学 物理 化学<br />单科授课老师：周末 负责学生的科目加强 出卷考题与讲解<br />市场推广：负责本中心业务的推广，教材 教务 心智开发 渠道开发<br />信息专员：负责采集客户信息 终端业务开发 市场信息 网络营销<br /> <br />', '', '0', '1271920105', '1271920105', '', '高波', '13563714260', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('123', '3', '592', '济宁鸿文博雅招聘', '我单位主要代理君乐宝常温牛奶和喜洋洋与灰太狼儿童饮料，因业务发展需要诚聘传统渠道配送业务4名，要求：高中以上学历，有快速消费品经验，年龄20-35岁，男女不限，薪资待遇：底薪600元加补助，每月收入不低于1500元。另外我单位还招喜洋洋与灰太狼系列产品的市区及县市区二级批发商。', '', '0', '1271920107', '1271920107', '', '陈经理', '18954051088', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('124', '3', '547', '建宇电器招聘办公人员3名、司机2名', '聘办公人员3名，男女不限，2年以上相关工作经验，每周休息一天半，月薪：800元左右。司机2名，部队复员军人优先，2年以上小车经验，35岁以下。月薪：1000元左右。', '', '0', '1271920108', '1271920108', '', '付先生', '3281987', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('125', '3', '525', '招聘司机2名', '双证齐全，工资1000-1500元。', '', '0', '1271920109', '1271920109', '', '王先生', '2660895', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('126', '3', '520', '招聘小车驾驶员', '要求：3年以上驾龄，每月两天休息，底薪：1000元加出差补助。工作地点：嘉祥。', '', '0', '1271920109', '1271920109', '', '陆先生', '13371229999', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('127', '3', '520', '售后！！', '年龄在25岁左右，有一定的责任心，工作态度务实', '', '0', '1271920110', '1271920110', '', '王经理', '13508972286', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('128', '3', '600', '招聘平面设计员', '月薪1000-1200元', '', '0', '1271920110', '1271920110', '', '段先生', '13963702618', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('129', '3', '563', '招聘业务员2名', '要求：男性，五官端正，通话流利，应届毕业生，月薪：1400元。', '', '0', '1271920111', '1271920111', '', '徐经理', '2998854', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('130', '3', '616', '诚招业务人员及代理商', '热爱金融行业，应界毕业生，有股票、期货、保险等金融行业工作经验者优先考虑，一经录用，待遇丰厚！<br />同时欢迎广大投资者前来咨询，您的稳定收益是我们的目标，公司着重于的客户培训及客户维护方面，让您真正把握市场规律，轻松获利！！！<br />详情请登陆山东外汇网—特色服务！！！<br />', '', '0', '1271920111', '1271920111', '', '宋先生', '15054879919', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('131', '3', '541', '美的电器济宁经销处招聘商超营业员10名', '美的电器济宁经销处招聘商超营业员10名！<br /><br />要求：女性，年龄35岁以下，形象气质佳，有商超工作经验优先！<br /><br />工作地点：华润苏果超市、九龙家电、苏宁电器大卖场、天安家电<br />待遇：试用期一个月，试用期过后每月560元底薪提成', '', '0', '1271920112', '1271920112', '', '徐经理', '13953709300', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('132', '3', '505', '济宁疯狂英语培训中心招聘', '济宁疯狂英语培训中心招聘<br />1。教务教学管理人员2名<br />2。宣传策划部主管1名<br />3。技术部人员2名<br />4。课程顾问3名<br />5。会计1名<br /><br />备注：应聘人员须携带一寸照片一张，学历证明复印件一份', '', '0', '1271920112', '1271920112', '', '李老师', '0537-2236008', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('133', '3', '590', '招聘大车驾驶员10名，铲车驾驶员1名', '', '', '0', '1271920113', '1271920113', '', '孔主任', '0537-3281800', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('134', '3', '531', '梁宝寺煤矿招工', '肥城矿务局梁宝寺煤矿招聘井下采掘工人；<br /><br />要求：男性；年龄18—35周岁；初中以上学历；身体条件健康；无传染性疾病；无纹身。<br /><br />待遇：月薪4500元以上；享受“五险”。<br />', '', '0', '1271920113', '1271920113', '', '陈经理', '18753757567', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('135', '3', '556', '招聘商务代表数名', '要求：女性，五官端正，通话流利，具体良好的团队精神及良好的应变能力和沟通协调能力，月薪：1500元加提成。', '', '0', '1271920114', '1271920114', '', '徐经理', '2998854', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('136', '3', '496', '招聘业务人员、驾驶员', '业务人员，工资1000-2000元，主要是商场业务人员，产品是清风纸业，有经验者优先。驾驶员，工资800-1500元，双证齐全。', '', '0', '1271920114', '1271920114', '', '张先生', '15563750777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('137', '3', '600', '招聘＊四轮定位工：二', '济宁市瑞丰（轿车轮胎销售）公司，现<br />招聘＊四轮定位工：二名，男性，初中以上学历，能直接上岗，独立工作，年龄35岁以下，上岗后收入1600元-2000元，可办理劳动保险。<br />', '', '0', '1271920114', '1271920114', '', '张经理', '13605370090', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('138', '3', '593', '机械公司招聘内勤', '女，1。60米以上，相貌端正，年龄28-35岁，已婚者优先，电脑操作熟练，精通办公软件，沟通能力强，接触新事物能力强，试用期800元，转正后有五险。', '', '0', '1271920115', '1271920115', '', '张女士', '0537-2084788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('139', '3', '529', '招聘＊普通工人：二名', '济宁市瑞丰（轿车轮胎销售）公司，现<br />招聘＊普通工人：二名，男性，初中学历，30岁以下，上岗后收入1500元以上，可办理劳动保险。<br />', '', '0', '1271920115', '1271920115', '', '张经理', '13605370090', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('140', '3', '617', '招聘会计', '能独立开增值税发票，月薪900元加提成。', '', '0', '1271920115', '1271920115', '', '李先生', '13355121001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('141', '3', '527', '招聘学徒工、电焊工', '学徒工，月薪1200元〈br〉〈br〉电焊工，月薪1500-1800元', '', '0', '1271920116', '1271920116', '', '段先生', '13963702618', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('142', '3', '561', '招聘司机两名', '要求：双证，40岁以下，月薪：2000元以上。', '', '0', '1271920116', '1271920116', '', '张经理', '13605373558', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('143', '3', '615', '急招电焊工 学徒工', '立德轻钢：急招电焊工<br />       要求：熟练手把焊，精通氩弧焊，有工作经验者优先，工资待遇： 1300元，上人身意外保险，包住<br /><br />       学徒工：要求为人正直，工作认真，服从领导安排，工资待遇：700，上人身意外保险，包住<br />   地址：济宁市任城区五里屯农校附近<br />   本人经营的是门面房，目前主要彩钢板房安装，下半年主要经营不锈钢，求职不诚者忽扰<br />', '', '0', '1271920116', '1271920116', '', '李经理', '13012642733', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('144', '3', '593', '济宁天地源建设工程有限公司招聘', '技术员，可以是应届毕业生，专科学历，男性，底薪：800元。预算员，5年以上工作经验，底薪：3000元加奖金。', '', '0', '1271920116', '1271920116', '', '孙小姐', '2657896', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('145', '3', '493', '魔兽世界游戏代练', '熟悉魔兽世界代练，效益工资1000-3000元。', '', '0', '1271920117', '1271920117', '', '吴先生', '15953714890', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('146', '3', '510', '高薪诚聘办公，平面设计及业务人员', '高薪诚聘办公，平面设计及业务人员数名，男女不限，待遇面议。非诚勿扰！<br /><br />公司给你提供一个发展的机会！', '', '0', '1271920117', '1271920117', '', '宫经理', '13355378815', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('147', '3', '524', '招聘＊营业员：二', '济宁市瑞丰（轿车轮胎销售）公司，现<br />招聘＊营业员：二名，初中以上学历，35岁以下，上岗后收入1600元-2200元，可办理劳动保险。<br />', '', '0', '1271920118', '1271920118', '', '张经理', '13605370090', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('148', '3', '596', '招聘罐车司机', '要求：有a证和上岗证，月薪：2800元包吃住。', '', '0', '1271920118', '1271920118', '', '张先生', '15563156789', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('149', '3', '559', '招聘幼师和保育员', '有无经验均可，月薪800-1000元。', '', '0', '1271920119', '1271920119', '', '徐女士', '13181349326', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('150', '3', '578', '月薪2500-3000元', '招男女工30名，月薪2500--3000元。招电焊工、司机月薪2000--3000元，招小车司机2名月薪1000--1200元。', '', '0', '1271920119', '1271920119', '', '户经理', '2998581', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('151', '3', '538', '聘办公室客服，微机操作人员', '鲁抗辰欣药业聘办公室客服2名，从事过药品工作一年以上，具有较强的沟通协调能力，熟悉电脑操作，待遇底薪加提成，每天8小时工作制', '', '0', '1271920119', '1271920119', '', '李经理', '13235372528', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('152', '3', '606', '如家酒店连锁诚聘美国纳斯达克上市公司', '总经理助理1名，底薪2900元（有星级酒店管理经验3年以上，且有营销经验者优先）<br />前台值班经理2名，底薪1800元（有星级酒店前台管理经验2年以上者）<br />餐厅服务员2名，底薪900元，男女不限<br />工程维修人员2名，底薪1300元，具备电工证。<br />以上人员一经录用，待遇从优，按国家规定交纳四险。<br /><br />联系电话：13863716852  0537-2712555 fax:0537-2712111。<br /><br />地址：济宁市古槐路24号（古槐商务楼南楼）<br /><br />', '', '0', '1271920119', '1271920119', '', '冯经理', '13863716852', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('153', '3', '592', '聘业务主管，办公室客服', '鲁抗辰欣药业新特药，12县市区聘业务人员20名，待遇优厚，条件：从事药品工作2年以上，具有较强的沟通协调能力，具有良好的销售网络，专兼职均可。', '', '0', '1271920120', '1271920120', '', '李经理', '13235372528', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('154', '3', '588', '亲亲宝贝招聘营业员、收银员', '亲亲宝贝招聘营业员20名，收银员5名，年龄：35岁以下，女性，月薪：1500元左右。', '', '0', '1271920120', '1271920120', '', '付经理', '2020646', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('155', '3', '495', '半天班月薪1500元', '招男女工30名，每天50元，日结工资专兼职均可，最好拿回家加工。', '', '0', '1271920121', '1271920121', '', '宫主管', '2726695', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('156', '3', '539', '招聘厨师', '2名，厨师1名，帮厨1名，有1年以上工作经验，包食宿，工资1200元，具体面议。', '', '0', '1271920122', '1271920122', '', '张女士', '2868566', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('157', '3', '526', '银行招聘合同制', '招营业厅接待员18名月薪1000--2600元，签定合同，办理五险一金。', '', '0', '1271920122', '1271920122', '', '尚经理', '13053756967', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('158', '3', '551', '济宁轻舟装饰诚聘', '招聘岗位：<br />市场部电话营销员：要求，声音柔美，具有较好的语言表达和沟通能力，敬业爱岗，热爱生活。具有简单电脑操作基础。年龄不限。<br /><br />企业网站推广专员：要求，具有基本的电脑专业知识，能够熟练的使用操作电脑，具有一定文字表达能力，具有3年以上的上网经验', '', '0', '1271920123', '1271920123', '', '张经理', '15563750229', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('159', '3', '548', '快递公司招办公人员', '招办公月薪800--1200元，招送快递10名月薪1200--2000元，招司机包吃住1500--3000元。', '', '0', '1271920123', '1271920123', '', '王经理', '2721266', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('160', '3', '503', '中央百货品牌童装招聘业务员', '女，年龄30岁以下，高中或中专以上学历，月薪730元加提成，有意者请联系李女士。', '', '0', '1271920123', '1271920123', '', '李女士', '13705471487', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('161', '3', '610', '招聘会计一名', '具备基本会计知识，有会计证，25岁以上，男女不限，最低月薪1000-1200元之间。', '', '0', '1271920123', '1271920123', '', '张先生', '13290300789', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('162', '3', '542', '装饰公司高薪诚聘', '因公司发展需要，现招聘以下人员：<br />业务员20名，业务经理2名，设计师2名，工程监理2名。<br />有家装工作经验者优先，月薪1000元加提成加奖金加季度奖加业绩奖。', '', '0', '1271920124', '1271920124', '', '王经理', '13508971085', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('163', '3', '535', '招聘业务代表', '2人，有工作经验，底薪1000元，具体面议。', '', '0', '1271920125', '1271920125', '', '徐经理', '2795658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('164', '3', '541', '高薪诚聘操作女工', '18-35岁，月薪1000元。', '', '0', '1271920127', '1271920127', '', '王女士', '13953781442', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('165', '3', '523', '紧急招聘氩弧焊焊工、车工、装配钳工、普工各5名', '有工作经验者优先，具体面议。', '', '0', '1271920127', '1271920127', '', '史经理', '2314222', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('166', '3', '574', '诚聘市场助理1名', '全日制大专以上学历，市场营销、传播、新闻或管理类优先，有1年以上营销工作经验，熟悉操作办公软件，会photoshop，有良好数据分析处理能力，责任心强，有较强策划和执行能力，语言表达能力好。', '', '0', '1271920127', '1271920127', '', '尚女士', '2316177', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('167', '3', '612', '招贤纳士', '经济危机导致全球企业的不景气，裁员风暴致使工人纷纷下岗，大学生再就业已成难题，企业本着造福社会大众，服务人民群众，让更多下岗工人再就业，能在岗位上展现其才能，为更多大中专学生谋生路，实现其人生价值的宗旨，特面向社会公开招聘科长秘书，办公室内勤，人事助理，区域主管，储备干部，售后服务人员若干名，有意者请速致电人事部孔经理', '', '0', '1271920128', '1271920128', '', '孔经理', '13583721013', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('168', '3', '506', '济宁浩德电器招聘会计', '有工作经验，试用期1000元。', '', '0', '1271920128', '1271920128', '', '王老师', '13153789690', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('169', '3', '516', '装饰公司招聘业务员、业务经理', '因公司发展需要，现招聘业务员20名、业务经理2名，男女不限，年龄22-35岁，初中以上学历，从事装饰行业经验者优先录用，待遇：底薪1000加提成加奖金加业绩奖。', '', '0', '1271920128', '1271920128', '', '王经理', '13508971085', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('170', '3', '595', '高薪诚聘房地产副总、办公室人员、营销策划等职位', '高薪诚聘房地产副总，要求：工程类、工民建专业、中级资格以上，有3-10年房地产开发及运作从业经验，年薪：10-30万。<br />办公室人员，要求：本科以上学历，熟练操作计算机设备，有很好的文底，擅长房产合同的书写，有房地产工作经验者优先考虑。<br />营销策划，本科以上学历，相关专业毕业，房产从业经验3年以上。<br />预算员2名：建筑类专业，本科以上学历，有预算员资格证书，中级以上职称，具有多年水电暖及土建预算工作经验，土建和安装各一名。<br />项目总工、施工员、技术员、质检员共8名：要求建筑类专业，大专以上学历，中级以上职称，有相关资格证书，有多年相关工作经验。<br />高级工程师：具有高级职称。<br />要求：应聘人员须将个人简历、电话发至公司邮箱：yunhezhiye＠163.com<br />或者拨打办公室电话：2320178找张女士联系。面试时需带身份证、学历证书。<br />公司地址：新世纪广场对面天工大厦9楼', '', '0', '1271920128', '1271920128', '', '张女士', '2320178', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('171', '3', '615', '招聘仓库主管一名', '要求：有3年以上工作经验，熟悉仓库流程及账务，会电脑，有责任心，有一定的管理经验，年龄25岁以上，中区户口，待遇：2000元，有养老保险。', '', '0', '1271920129', '1271920129', '', '耿先生', '15163796111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('172', '3', '569', '山东瑞中医药有限公司招聘帮厨一名', '男女不限，年龄45岁以下，700-800元左右', '', '0', '1271920129', '1271920129', '', '李老师', '2108888', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('173', '3', '520', '售后服务部、世界500强企业诚聘英才', '由于公司业绩的稳步提升，为了更好的服务老客户，建立健全售后服务体系，特招聘售后服务专员，经理助理。要求有耐性，善于交流。<br />本部主要致力于老客户的地址变更、电话变更、账号变更、受益人变更、保费的收缴、理赔等新老客户的售后服务工作。（可以做专职和兼职）说明：兼职是以顾问为主要工作，不限时间。为每一位想成功的人士提供发挥个人能力的平台，以诚相待，待遇优厚，详情请公司面谈！<br /> 为想成功、想晋升的人士提供平台，世界500强企业愿与您共创美好未来！', '', '0', '1271920130', '1271920130', '', '姬老师', '13615377709', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('174', '3', '616', '年薪10万元招聘大区经理', '大区经理，有3年以上团队管理经验。<br />销售经理，年薪3-5万元。', '', '0', '1271920130', '1271920130', '', '李经理', '2165288', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('175', '3', '571', '高薪急聘项目经理', '有2年以上项目管理经验，有商业操盘经验者优先，底薪2000元加销售额千分之三提成。', '', '0', '1271920131', '1271920131', '', '石经理', '0537-2788811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('176', '3', '584', '！火车票售票员', '火车票售票处招聘售票员，18-40岁，无家庭负担，有责任心，敬业爱岗，试用期800元，8小时单休，长白班。<br /><br />办公10名，男女不限，月薪800-1500元<br /><br />出纳10名，女性，月薪1000-1500元<br /><br />信息发布员5名， 月薪1000-1300元<br /><br />仓库管理员10名，男女不限，月薪1000-1500元<br /><br />保安10名，男女不限，月薪1000-3000元<br /><br />以上人员均8小时单休，提供食宿', '', '0', '1271920131', '1271920131', '', '李经理', '2060690', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('177', '3', '532', '售后服务部诚聘经理助理、售后服务专员', '公司属于世界500强企业，由于公司业绩的稳步提升，为了更好的服务老客户，建立健全售后服务体系，特招聘售后服务专员，经理助理。要求有耐性，善于交流。（本部门分内勤和外勤）<br /><br />本部主要致力于老客户的地址变更、电话变更、账号变更、受益人变更、保费的收缴、理赔等新老客户的售后服务工作。（可以做专职和兼职）说明：兼职是以顾问为主要工作，不限时间。为每一位想成功的人士提供发挥个人能力的平台，以诚相待，待遇优厚，详情请公司面谈！', '', '0', '1271920131', '1271920131', '', '江先生', '15275779763', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('178', '3', '587', '药品销售人员，微机操作人员', '具有较强的语言表达能力，从事药品销售工作2年以上，有药品销售网络的优先，熟练掌握微机操作，有意者请致电', '', '0', '1271920132', '1271920132', '', '李经理', '13235372528', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('179', '3', '574', '！招专职 兼职人员', '<br /><br /><br />长期招发传单人员一天30-40元日结！男女不限<br /><br />办公10名 男女不限 月薪800-1500元<br /><br />仓管8名 男女不限 月薪800-1500元<br /><br />普工60名 男女不限 月薪1200-2000元<br /><br />出纳会计5名 月薪800-2000元<br /><br />装卸工20名 一天60-100元<br /><br />跟车10名 男1000-1500元<br /><br />大小车司机10名 月薪1000-3000元<br /><br />保安10名月薪900-1300元（无押金<br /><br />以上人员均8小时单休 提供食宿<br /><br />', '', '0', '1271920133', '1271920133', '', '梁经理', '15263707465', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('180', '3', '593', '招聘优秀营业员', '要求：责任心强、有工作经验者优先，待遇优厚，底薪：800元加提成，享受公休，有养老保险。', '', '0', '1271920133', '1271920133', '', '葛先生', '13608917917', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('181', '3', '611', '九龙家电招聘营业员', '底薪800提成奖金。两月后加底薪<br />年龄：20-35，高中<br />爱岗敬业，有经验者优先。<br />', '', '0', '1271920134', '1271920134', '', '郑', '13053748036', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('182', '3', '518', '霍家街小学附近小餐桌辅导中心诚聘英才', '为扩大小餐桌辅导中心招生规模，现面向社会招聘辅导管理老师2名。<br /><br />要求：高度的责任心和耐心，中专以上学历，有教学经验的退休教师优先录用，和家长有良好沟通能力的可优先录用。<br /><br />工作时间：早10：00到晚7：00。中间有休息，双休。<br /><br />待遇：提供中晚两餐，试用期一个月工资600元，试用期过后加奖金<br />', '', '0', '1271920135', '1271920135', '', '曹老师', '13181331997', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('183', '3', '522', '会计实战培训----专业老师与学员一对一（带学员，包会）', '招会计学员（真正快速踏入会计行业）<br />★财务专家与学员面对面★全面性掌握会计工作★推荐工作★学员满意度最高<br />为帮助会计爱好者、应届会计学大学生能够顺利参加工作，突破在会计界缺乏实践经验，缺乏企业所需的专业技能，特设一个捷径：会计实战培训（实践实务的结合），让你真真正正体会到如何下手做账，如何快速踏入会计行业。济宁商道财务管理公司举办会计实战培训班。商道财务管理公司凭借雄厚的师资力量、领先的实践经验、严谨的教学作风、灵活多样的教学方式，赢得了数万名新老学员的赞赏。商道财务培训部现已成为会计就业前最权威的会计实战培训教育基地。<br />◆招生对象<br />会计实战班：大中专院校应届毕业生或已经获得会计各个职称不会实际操作、熟悉基本科目的学员想更深一步了解会计、从事会计或出纳工作的学员；想快速进入会计行业的人士；不熟悉全套账务、纳税申报实务、增值税发票认证、财务软件应用的财务人员。学费1000<br />会计实践班：基本功掌握扎实，缺少名师做指点，接受能力比较强的学员。<br />会计主管培训：  学费3000<br />培训内容：<br />　1、工业企业全套账务处理；<br />　2、商贸企业全套账务处理；<br />　3、服务业全套账务处理；<br />　4、增值税、营业税、企业所得税、个人所得税计算、报表填制和网上申报；<br />　5、金蝶和用友软件使用；<br />◆师资介绍<br />杨大明：济宁商道财税咨询有限公司创办人，早年毕业于天津工业大学会计专业，1998年开始从事财务咨询、审计工作，1998取得中国注册会计师资格，在工业、流通业、服务业等行业从事财务会计工作，在济宁多家大型公司担任财务经理和审计经理职务，目前为上海刻度管理顾问有限公司合伙人，每年为60余家企业提供审计及咨询服务。<br />张霞：上海会计指导中心创办人，早年毕业安徽财贸学院会计专业，1999会计年开始从事会计工作，2000年取得会计师职称。在工业、流通业、服务业等行业从事财务会计工作，在多家大型公司担任财务经理和审计经理职务，在会计核算和纳税实务，工商事务方面经验丰富。<br />于艳平：会计师，10年工作经验，精通工业、商业会计会计核算，且有多年会计培训经验。<br />其他专职老师均具体丰富的会计实操经验和纳税实务经验。<br />◆开课时间<br />设有上午班、下午班、晚上班，学员可自由选择时间学习。<br />★有专职教师辅导★随到随学★课时累计<br />', '', '0', '1271920135', '1271920135', '', '梁女士', '15963720811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('184', '3', '577', '招聘驾驶员10名、销售人员10名', '招聘驾驶员10名、月薪：1200元加提成。销售人员10名，月薪：800元加提成。', '', '0', '1271920135', '1271920135', '', '汤经理', '13053718233', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('185', '3', '499', '招聘精英人才', '内勤：最好是财校毕业<br />司机：双证齐全，有2年以上驾龄，月薪1200元加提成。<br />跟车工：年龄30岁以下<br />专职会计：工作经验10年以上，年龄40岁以下，月薪1500-2000元。', '', '0', '1271920136', '1271920136', '', '徐经理', '2795658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('186', '3', '613', '多关注一点，多沟通一次，舞尽人生精彩！', '商务教育招生员：男女不限；年龄18-35；学历不限；形象气质佳；沟通、接受能力强；有志于个人发展的青年。<br />试用期30天，试用期月薪900元加提成；转正后1500元加提成。优秀者签订合同，购买三险一金<br />人才电话：0537-2312760；13805372760', '', '0', '1271920136', '1271920136', '', '李先生', '0537-2312760', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('187', '3', '508', '济南利民制药招各县业务员', '济南利民责任有限公司在济宁地区各县市招聘业务员，月薪：1000元加提成。其他面谈。', '', '0', '1271920136', '1271920136', '', '李经理', '18653721288', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('188', '3', '579', '招聘家教', '辅导初一学生，擅长数学、英语、市中区，每小时20元。', '', '0', '1271920136', '1271920136', '', '郜先生', '15953710998', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('189', '3', '511', '老街驿站咖啡吧诚招管理经理/服务员', '管理经理1名：月薪2000元以上，有咖啡馆或娱乐场所工作经验者优先。<br />服务员：男女不限，月薪1200元加提成，可包住。', '', '0', '1271920137', '1271920137', '', '何先生', '13905370873', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('190', '3', '503', '微机操作员、司机', '微机操作员（3名），工作内容：主要操作喷绘机、雕刻机，要求能吃苦耐劳，有工作责任心，有电脑基础，包培训。薪资1000元。<br />司机（2名），要求能吃苦耐劳，有工作责任心，有装饰装修基础者优先，薪资800元。<br />', '', '0', '1271920137', '1271920137', '', '齐', '2169060', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('191', '3', '559', '翰林教育招聘业务员及发放简章人员', '月薪：1000元加提成。', '', '0', '1271920137', '1271920137', '', '杜老师', '13287291069', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('192', '3', '581', '招聘普工', '招聘普工，底薪：1100元。', '', '0', '1271920138', '1271920138', '', '王先生', '2390496', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('193', '3', '514', '济宁市鲁宁运输有限公司招聘办公室内勤', '会普通话，形象气质佳，会电脑，有工作经验，月薪1500元，中午有午餐，每周休息一天。', '', '0', '1271920138', '1271920138', '', '马会计', '2616099', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('194', '3', '516', '招聘驾驶员', '招聘面包车驾驶员、开车兼工作，月薪：1000-1600元。', '', '0', '1271920139', '1271920139', '', '杨先生', '2308099', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('195', '3', '513', '诚聘汽车4s店市场策划、驾驶员', '市场策划：计算机操作熟练，有过汽车行业广告宣传、策划方面的工作经验者优先考虑，试用期月薪800-1000元。<br />驾驶员：工作认真仔细，踏实，有一年以上驾车经验，能服从领导安排，有一定的团队协作精神，试用期月薪800-1000元。', '', '0', '1271920139', '1271920139', '', '张女士', '15863718376', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('196', '3', '498', '济宁京华眼科医院招聘', '招聘司机，要求：b证，有开公交车经验者优先，女士优先，底薪：1000元。<br />护士，有职业证书，月薪：800元以上；<br />验光配镜，相关专业，底薪800元以上；<br />医学影像，相关专业者优先，月薪800元以上<br />药师，有职业证书，底薪800元以上，大专以上文凭；<br />企划人员，学历不限，有营销经验者优先，底薪600元以上加提成。', '', '0', '1271920140', '1271920140', '', '刘小姐', '13705375294', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('197', '3', '568', '专卖店招聘店员（收银员） 底薪1000－1200加奖金', '开业五年来，承蒙社会各界人士的厚爱，发展迅速。现因业务需要，急聘营业员（收银员）一名。环境幽雅、工作轻松。<br /><br />工作时间：早8：00－－－晚6：00<br /><br />每月有4天公休日。<br /><br /><br /><br /><br /><br />要求：形象气质佳，语言表达能力强，年龄23岁以下。董微机操作者优先。', '', '0', '1271920141', '1271920141', '', '王经理', '15106722009', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('198', '3', '538', '亲亲宝贝招聘营业员', '年龄25岁以上，生育过小孩者优先，<br />月薪1500元以上。', '', '0', '1271920141', '1271920141', '', '付女士', '2020646', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('199', '3', '524', '招聘厂家业务员', '从事过奶粉销售经验者优先，女性，月薪：1500元左右。', '', '0', '1271920142', '1271920142', '', '付女士', '2020646', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('200', '3', '564', '亲亲宝贝招聘育婴员', '年龄28岁以上，生育过小孩者优先，工作时间8：30-18：00<br />月薪1000元左右。', '', '0', '1271920142', '1271920142', '', '付女士', '2020646', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('201', '3', '543', '招聘促销员', '23-35岁，高中或中专以上学历，月薪800元。', '', '0', '1271920143', '1271920143', '', '史经理', '18953738765', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('202', '3', '517', '亲亲宝贝招聘出纳兼文员', '有工作经验者优先，月薪1200元左右。', '', '0', '1271920143', '1271920143', '', '付女士', '2020646', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('203', '3', '557', '三元科技诚聘监控技术人员', '因业务拓展需要，现诚聘监控工程安装与设计施工人员6名，<br />应聘要求：<br />1、男，年龄20-30岁，身体健康，能吃苦耐劳，品德优良。<br />2、计算机经验丰富，对监控系统工程的安装与施工至少一年以上工作经验。<br />3、月薪面议。<br />', '', '0', '1271920144', '1271920144', '', '尹小姐', '13963738936', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('204', '3', '570', '物流公司招聘驾驶员', '招聘驾驶员，双证，4年以上驾龄，9米6车，专线。底薪：2000元。<br />', '', '0', '1271920144', '1271920144', '', '郑先生', '13953717055', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('205', '3', '497', '招办公、话务员，双休', '招办公、话务员共12名月薪800--2000元，招调查员、宣传员月薪1500--3000元，8小时工作制，双休。', '', '0', '1271920145', '1271920145', '', '陈主任', '2663391', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('206', '3', '592', '月薪1500-3000元，五险一金', '招办公、仓管、跟车、小车司机月薪1500--2600元，招男女工200名月薪1500--3000元，8小时工作制，签定合同 ，办理保险，招大车司机包吃住2000--4000元。', '', '0', '1271920146', '1271920146', '', '孙经理', '2721266', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('207', '3', '512', '招聘宣传人员', '', '', '0', '1271920146', '1271920146', '', '丁先生', '13792368234', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('208', '3', '495', '济宁网络超市招聘兼职业务员', '有业务销售经验者优先，底薪300元加提成。', '', '0', '1271920147', '1271920147', '', '张先生', '15615377578', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('209', '3', '555', '农行招聘办公内勤', '招内勤月薪1000--2600元，签定合同，办理保险。', '', '0', '1271920147', '1271920147', '', '付经理', '2863779', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('210', '3', '584', '招聘宣传人员 全职长期', '现在招聘宣传人员4名，全职长期，工资1000--2000，具体面谈，', '', '0', '1271920147', '1271920147', '', '段老师', '2093318', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('211', '3', '607', '招聘面包车驾驶员', '招聘面包车驾驶员，吃苦耐劳，开车并干活，月薪：800-1600元。', '', '0', '1271920149', '1271920149', '', '杨经理', '2308099', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('212', '3', '510', '招聘技术网管', '最好是中区，月薪1000-1200元。', '', '0', '1271920149', '1271920149', '', '韩女士', '15092766681', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('213', '3', '521', '拓普教育招聘初中辅导老师', '拓普教育招聘初中辅导老师，3名，兼职。', '', '0', '1271920150', '1271920150', '', '毛老师', '18953760180', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('214', '3', '506', '山东衡天招标咨询有限公司招聘', '山东衡天招标咨询有限公司招聘以下人员：<br /><br />文员3名;网络信息档案管理员3名;<br /><br />主持人3名;<br /><br />信息员6名;<br /><br />经营部经理6名;<br /><br />区域经理6名;<br /><br />专业会计3名;<br /><br />出纳3名;<br /><br />司机3名，要求：3年以上工作经验。<br /><br />高管3名，10年以上工作经验。<br /><br />文秘3名<br /><br />总经理助理3名，3年以上工作经验，<br /><br />工程造价专业技术人员6名，3年以上工作经验。<br /><br />注册咨询造价师5名，3年以上工作经验。<br /><br />招标代理专业技术人员2名，3年以上工作经验者优先。<br /><br />副总经理2名，5年以上工作经验。<br /><br />综合班主任3名，5年以上工作经验。<br /><br />技术总监3名，5年以上工作经验。<br /><br />政府采购业务部主任3名，5年以上工作经验。<br /><br />办事处主任3名，5年以上工作经验。<br /><br />房地产营销策划人员3名，3年以上工作经验。<br /><br />注册咨询师、注册评估师、注册造价师、注册监理师各3名，3年以上工作经验。<br /><br />要求：<br /><br />1、应聘人员品貌端正、吃苦耐劳、沟通能力强、普通话标准、有一定的社会资源、有开拓精神、组织协调能力强。<br /><br />2、应聘人员专科以上学历，至少一年以上工作经验，有相关、相同经验或专业者优先。<br /><br />月薪1000元以上，岗位不同工资不同，其他面议。', '', '0', '1271920150', '1271920150', '', '徐老师、冯老师', '2284666', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('215', '3', '617', '诚聘服务员/保洁员/门卫', '服务员：底薪1000元<br />保洁员/门卫：底薪700元<br />以上人员包吃<br />', '', '0', '1271920150', '1271920150', '', '吴经理', '15153719032', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('216', '3', '595', '中国网库济宁分公司招聘', '商务代表30名：月薪1200元<br />县城经理13名：年薪10万元<br />主管2名：有相关工作经验，月薪1400元。<br />内勤2名：月薪800元<br />客户经理8名：月薪1500-3000元。', '', '0', '1271920151', '1271920151', '', '刘先生', '15605378077', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('217', '3', '518', '银座商场招聘售货员一名', '18-25岁，高中以上学历，月薪800-1200元。', '', '0', '1271920151', '1271920151', '', '许女士', '13355375311', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('218', '3', '559', '中国电信代理商招聘销售人员', '公司现招聘电信综合业务营销人员，<br />有意请联系，15345370150，3152955<br /><br /><br />非诚勿扰，', '', '0', '1271920151', '1271920151', '', '宋经理', '0537-3152955', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('219', '3', '506', '河北养元六个核桃招聘济宁市区流通业务代表', '年龄22-35岁，下岗待业者优先，能吃苦耐劳。月薪：1000元加提成。', '', '0', '1271920152', '1271920152', '', '张经理', '13395377619', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('220', '3', '540', '招聘电子商务人员', '计算机专业或电子商务专业均可，大专以上学历，应往届均可，试用期工资800元。', '', '0', '1271920152', '1271920152', '', '谢经理', '0537-2659090', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('221', '3', '607', '天益名茶高薪招聘营业员', '初中以上文化程度，年龄20-26岁，有一年以上销售经验，底薪1100元加提成和奖金。', '', '0', '1271920153', '1271920153', '', '王先生', '13805379529', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('222', '3', '502', '中国联通3g时代手机数码广场诚聘', '会计1名，月薪800-1000元，能独立做帐。<br />司机1名，月薪1000元，有3年以上驾龄。<br />营业员20名，底薪加提成1000元以上，形象气质佳。<br />', '', '0', '1271920153', '1271920153', '', '韩经理', '15605378886', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('223', '3', '555', '商贸公司招聘送货员  非诚勿扰', '要求：40岁以下，男，最低月薪900-1200元，提供午餐，周日休息。非诚勿扰。', '', '0', '1271920154', '1271920154', '', '李女士', '18653676999', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('224', '3', '579', '招聘加工中心熟练工', '要求：加工中心专业，有相关工作经验者优先，月薪：1200-2000元。', '', '0', '1271920155', '1271920155', '', '张先生', '13181300251', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('225', '3', '528', '招聘电脑维修工', '电脑上门服务人员5名，能吃苦耐劳，服从管理，沟通能力强，有一定工作经验。<br />硬件维修人员2名，熟悉电脑硬件及显示器硬件及维修，有相关工作经验，月薪1200加提成<br />办公文员1名，女性，30岁以下，熟悉办公软件，打字快，有工作经验。', '', '0', '1271920155', '1271920155', '', '龙先生', '15153706537', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('226', '3', '537', '招聘二保焊工', '因发展需要招聘以下人员：铆焊工（二氧化碳气体保护焊）20名，月薪1500-3000元。折弯工，5名，月薪1500-3000元。数控下料，5名，月薪1500-3000元。龙门加工中心操作工，2名，月薪1500-3000元。喷漆工，2名，月薪1000-2000元。前处理（磷化操作工），化工技校毕业优先，2名，月薪1000-1500元。35岁以下，男性，初中以上学历。', '', '0', '1271920155', '1271920155', '', '张先生', '13181300251', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('227', '3', '602', '麦乐园音乐广场高薪诚聘', '招聘以下岗位：<br /><br />1、公关客服经理，数名，有ktv工作经验，与客户沟通能力强，15000元以上。<br /><br />2、公关人员，50名，形象好，气质佳，万元以上。可兼职。无管理费无押金。（可免费提供住宿）<br /><br />以上岗位，只要您有能力，就有高的工资。能力=工资。期侍您的到来。<br /><br />3、招保安人员，男，3名，月薪1000元以上。8小时。轻松简单', '', '0', '1271920156', '1271920156', '', '何经理', '13884724636', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('228', '3', '502', '招聘机械检品员', '大专或以上学历，年龄35岁以下，男女不限，月薪1000-2000元。', '', '0', '1271920157', '1271920157', '', '张先生', '13181300251', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('229', '3', '597', '招聘', '', '', '0', '1271920157', '1271920157', '', '商经理', '13562717786', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('230', '3', '549', '招聘机械加工工段长', '大专以上学历，机械专业，男性，月薪1000-3000元。', '', '0', '1271920157', '1271920157', '', '张先生', '13181300251', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('231', '3', '548', '！办公 出纳 普工', '<br /><br />办公10名 男女不限 月薪800-1500元<br /><br /><br /><br />仓管8名 男女不限 月薪800-1500元<br /><br /><br /><br />普工60名 男女不限 月薪1200-2000元<br /><br /><br /><br />出纳会计5名 月薪800-2000元<br /><br /><br /><br />装卸工20名 一天60-100元<br /><br /><br /><br />跟车10名 男1000-1500元<br /><br /><br /><br />大小车司机10名 月薪1000-3000元<br /><br /><br /><br />保安10名月薪900-1300元（无押金）<br /><br /><br /><br />以上人员均8小时单休 提供食宿<br /><br /><br />', '', '0', '1271920158', '1271920158', '', '任经理', '2060690', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('232', '3', '543', '诚聘老师 办公室 及工作人员', '师范类  物理系 通讯工程 毕业优先', '', '0', '1271920158', '1271920158', '', '王校长', '15253716999', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('233', '3', '553', '华安客房招聘房务员/收银员若干名', '收银员：月薪1200元左右<br />房务员：月薪1000元左右<br />包吃住，有公休', '', '0', '1271920158', '1271920158', '', '许经理', '15898608787', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('234', '3', '613', '招聘导医', '形象气质佳，25岁以下，护理学历，月薪800元左右。', '', '0', '1271920159', '1271920159', '', '党主任', '2238001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('235', '3', '610', '济宁银座佳悦酒店礼品部招聘', '营业员2名，18-26岁，形象气质佳，有相关工作经验者优先，月薪800元加奖金。<br />业务员4名，有1年以上业务工作经验者，月薪800元加提成加奖金。', '', '0', '1271920159', '1271920159', '', '魏先生', '13153723919', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('236', '3', '618', '工程公司招聘办公文员', '女，35岁以下，能熟练打字、制表，有工作经验者优先，工资1000元。', '', '0', '1271920160', '1271920160', '', '王女士', '3163399', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('237', '3', '585', '中国柳工济宁分公司招聘会计2名', '本科以上学历，年龄40岁以下，有责任心，工作能力强，形象气质佳，月薪1200元。', '', '0', '1271920160', '1271920160', '', '胡先生', '13954783865', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('238', '3', '615', '招聘驻外（上海）文员', '女，大专以上学历，电脑操作熟练，能够熟练使用办公自动化软件及设备，有财务基础知识者优先，试用期月薪1500元，转正后月薪2000元，公司提供食宿，有意者请致电联系。', '', '0', '1271920161', '1271920161', '', '李老师', '2116799', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('239', '3', '563', '山东瑞中医药有限公司招聘驾驶员', '有上岗证，驾驶证b证以上，2年以上驾龄，男，45岁以下，最低月薪1000元以上。', '', '0', '1271920162', '1271920162', '', '李老师', '2108888', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('240', '3', '580', '软件公司招聘', '店面销售人员3名，18-25岁，底薪800元加提成。<br />业务主管1名，18-25岁，月薪1000-1500元。<br />', '', '0', '1271920162', '1271920162', '', '蒋先生', '13953770058', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('241', '3', '561', '齐鲁制药招聘otc销售精英', '有成熟的医药otc和第三终端销售网络，丰富的市场经验，25岁以上，底薪1000元加提成加200元通讯交通补助，转正后办理福利保险。<br />工作地区：济宁、枣庄、菏泽。', '', '0', '1271920162', '1271920162', '', '楚经理', '2812666', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('242', '3', '502', '招聘保洁人员4名', '40岁以下，月薪600元。', '', '0', '1271920163', '1271920163', '', '沙女士', '13355163520', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('243', '3', '498', '诚聘办公、设计及业务人员', '招聘办公、设计及业务人员，底薪1000元加提成，能力突出着，待遇面议。非诚勿扰！', '', '0', '1271920163', '1271920163', '', '宫经理', '13355378815', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('244', '3', '601', '铁通公司招聘派单员', '年龄18-45岁，从事保险行业退休职工优先，底薪1000元，报名时间4月19-30日。', '', '0', '1271920163', '1271920163', '', '邓主任', '15615871097', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('245', '3', '541', '银座手表招聘女营业员', '年龄18-23岁，中专以上学历，要求：有健康证。工资900元加提成。', '', '0', '1271920164', '1271920164', '', '谢经理', '13905377552', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('246', '3', '541', '招聘中小学专职辅导教师', '师范类专业，爱学敬业，有爱心和责任心，待遇优厚，月薪1000元。', '', '0', '1271920164', '1271920164', '', '苏老师', '6677788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('247', '3', '570', '招聘车工、机械操作工、钳工、焊工、学徒工', '车工，月薪1800元以上；机械操作工，1500元以上；焊工，1800元以上。', '', '0', '1271920165', '1271920165', '', '孔先生', '15964123344', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('248', '3', '534', '济宁远大教育招聘英日韩法兼职教师', '职位要求：<br />师范类学校毕业，本科及本科以上 <br />英语教师须持有专业8级证书<br />日语教师须持有jpt1级证书<br />韩语教师须持有topik6级证书<br />普通话标准，形象气质佳<br />热爱教学事业，有责任心，有耐心，善于与学员沟通。<br />有相关工作经验者优先<br /><br />工作职责：<br />具备良好的师德，认真授课<br />积极配合参与学校定期召开的教学研讨会<br />服从学校排课安排<br /><br />有意向者请把简历发送到邮箱5337feiyang＠sina。com，在简历中表明个人联系电话（最好是手机）和个人邮箱，以方便及时通知面试。<br />面试时间：每周二、周五14：30 <br />地址：济宁市琵琶山北路29号（二院西临）', '', '0', '1271920165', '1271920165', '', '翟老师', '0537-2316565', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('249', '3', '521', '诚招十二县市区业务人员及代理商', '热爱金融行业，应界毕业生，有股票、期货、保险等金融行业工作经验者优先考虑，一经录用，待遇丰厚，公司可提供专业培训！<br />同时欢迎广大投资者前来咨询，您的稳定收益是我们的目标，公司着重于的客户培训及客户维护方面，让您真正把握市场规律，轻松获利！！！<br />详情请登陆山东外汇网—特色服务！！！<br />', '', '0', '1271920166', '1271920166', '', '宋先生', '15054879919', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('250', '3', '552', '招聘业务人员', '年龄18-25岁，10-15名，男女不限，底薪800元加提成。', '', '0', '1271920167', '1271920167', '', '付先生', '13863793845', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('251', '3', '615', '招聘店员', '大学钢琴专业毕业，形象好，有责任心，有亲和力，月薪1000元。', '', '0', '1271920168', '1271920168', '', '刘老师', '2921719', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('252', '3', '548', '济宁鸿信电子科技有限公司', '业务员：2名，中专以上学历，有相关经验者优先，月薪1000---4000元', '', '0', '1271920168', '1271920168', '', '申女士', '15253766116', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('253', '3', '560', '招聘魔兽世界游戏代练', '熟悉魔兽世界游戏代练，效绩工资，月薪1000-3000元。', '', '0', '1271920168', '1271920168', '', '吴先生', '15953714890', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('254', '3', '549', '诚聘优秀老师及中小学有直接关系的人士—小博士机器人教育学校招', '', '', '0', '1271920169', '1271920169', '', '王校长', '15253716999', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('255', '3', '535', '多个岗位虚位以待', '因本公司规模扩大，现面向社会公开招聘：主管、行政助理，业务助理，内勤、微机操作员、售后服务专员，区域拓展人员，有意者请速打电话。月薪：1200元以上。', '', '0', '1271920171', '1271920171', '', '孔经理', '13583721013', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('256', '3', '498', '诚聘英语老师，办公室文员', '英语教师：大专及以上学历，英语专业，大学英语6级以上水平，口语较好，责任心强，热爱教育事业，有教学经验者优先。<br /><br /><br /><br />办公室文员：大专及以上学历，专业不限，沟通及应变能力强，吃苦耐劳，形象气质佳，有工作经验者优先。<br /><br />注：以上岗位均提供住宿，签合同办理保险。<br /><br /><br /><br />请把简历以电子版形式发送到下面邮箱:zhangjun1018。com＠163。com', '', '0', '1271920172', '1271920172', '', '张老师', '15969971955', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('257', '3', '527', '中国平安金融集团（世界500强集团）高薪诚聘', '业务精英、储备干部，25-45岁，高中以上学历，月薪3000元以上。<br />经理助理、人事专员，25-35岁，高中以上学历，月薪2000元以上。<br />电话回访员，25岁以下，月薪面议。<br />有强烈的事业心，责任感和团队合作精神，一经录用五险一金，待遇优厚，能力优秀者工资可达上万元。', '', '0', '1271920172', '1271920172', '', '仲小姐', '15020765698', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('258', '3', '606', '肥城矿业集团定向委培招工', '肥城矿业集团定向委培（2010年秋季）招工简章<br />     一、招收对象：初中以上文凭（应往届大中专毕业生、技校生和高中生）<br />     二、招收条件：年龄17-33周岁，男生，身体健康，无生理缺陷，无传染病，无纹身，符合体检标准，有严重违法记录、被学校或企业除名者不得报名。<br />     三、招收工种：综采综掘专业，学制两年，在校学校一年，带薪实习一年。下矿实习时，企业与学生签订正式劳动合同，享受同等职工所有工资、保险待遇。<br />     四、收费标准：综采综掘专业收费标准为：每生每年缴纳学费2000元，住宿费500元，报名体检费100元，合计2600元。学生在校学校期间，有肥矿集团总公司每月补助生活费100元，每生每年可享受国家助学金1500元。学习期满考核合格后，颁发由山东省劳动和社会保障厅验印的《技工学校毕业证》和《中华人民共和国职业资格证书》。<br />     五、毕业安置后职工待遇：学习一年后，由肥城矿务局（集团总公司）人力资源部按大中专毕业生统一分配，定向安置在肥城矿业集团下属煤矿：济宁嘉祥梁宝寺煤矿、梁山扬营煤矿、单县陈蛮庄煤矿、肥城曹庄煤矿、肥城白庄等大型煤矿。（2009年春季和秋季定向委培生已于2010年3月由集团总公司分配到所属煤矿工作）。<br />     六、肥城矿业集团简介：山东肥城矿业集团是大型国有企业，是山东省煤炭系统唯一分配本系统大中专毕业生的单位，有员工五万多人，矿井10对，年产煤炭2000多万吨，职工去年平均收入3。8万元，综采综掘职工收入6。3万元，是肥城市利税第一大户。<br />     七、报名时间：2010年4月5日起开始报名，额满为止。<br />     八、报名地址：邹城市科技大厦（邹城市人才市场楼下）岗山路739号。<br />     九、联系人：邵科长。咨询联系电话：0537-5238999 手机：13884727556<br /><br /><br /><br /><br />', '', '0', '1271920172', '1271920172', '', '邵科长', '0537-5238999', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('259', '3', '549', '开启律师事务所急招派单人员', '退伍军人、保险业务者、应届毕业生、下岗职工优先，报名时间：4月20-25日，月薪1000元。', '', '0', '1271920173', '1271920173', '', '李先生', '7303111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('260', '3', '554', '移动公司招聘', '招营业员、收银共6名月薪800--1500元，招话务员3名月薪900--1800元，招发传单30元/天。', '', '0', '1271920173', '1271920173', '', '孔主任', '2863779', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('261', '3', '609', '办公室客服', '相貌端正、敬岗爱业、责任心强、积极上进。', '', '0', '1271920173', '1271920173', '', '赵先生', '13176772758', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('262', '3', '608', '世界500强企业招聘', '话务员3名，业务助理2名，月薪1000元左右。<br />业务精英5名，根据个人能力3000-5000元。<br />一经录用五险一金。', '', '0', '1271920173', '1271920173', '', '朱女士', '13605371062', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('263', '3', '556', '海尔集团招正式工', '招办公、仓管、跟车、小车司机月薪1500--2600元，招男女工200名月薪2000--3000元，签定合同，办理五险一金。招司机包吃住2000--5000元。', '', '0', '1271920174', '1271920174', '', '孙经理', '15253716097', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('264', '3', '569', '玛奇朵婚纱礼服馆招聘店员、化妆师', '玛奇朵婚纱礼服馆招聘店员、化妆师，有经验者优先，工资底薪加提成（700-2000元）。', '', '0', '1271920174', '1271920174', '', '贾女士', '13406832688', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('265', '3', '548', '尚品酒窖高薪诚聘客户经理', '男女不限，年龄40岁以下，有酒水销售经验或一定人际关系者优先。工资：1500元底薪加提成，交五险。', '', '0', '1271920175', '1271920175', '', '郑经理', '15853739737', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('266', '3', '503', '招聘缝纫机工', '缝纫机工：有工作经验者优先，月薪可面议，招聘30-50名。', '', '0', '1271920176', '1271920176', '', '苏经理', '13562772223', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('267', '3', '521', '招聘网吧收银员', '简单计算机操作，月薪1000元以上。', '', '0', '1271920176', '1271920176', '', '韩经理', '15963062688', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('268', '3', '586', '聘专兼职美术教师', '聘专职  兼职美术教师，要求形象好，普通话好，美术专业热爱教育，踏实上进，能长期做', '', '0', '1271920177', '1271920177', '', '赵', '15653732565', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('269', '3', '531', '济宁金石广告公司诚招优秀设计师', '', '', '0', '1271920177', '1271920177', '', '商经理', '13355150333', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('270', '3', '559', '济宁市如泰仓储设备有限公司诚招业务精英！', '公司因开拓市场现招业务人员数名，要求有团队精神，有开拓能力，有相关行业工作经验者优先！工资、福利待遇请面试时面谈，以上仅为参考。<br />有意者请电话联系，公司约定时间组织统一面试。', '', '0', '1271920178', '1271920178', '', '骆先生', '0537-2653866', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('271', '3', '599', '招聘平面设计人员', '业务熟练，有工作经验，打字速度快，最低月薪1000元，具体面议。', '', '0', '1271920178', '1271920178', '', '张先生', '13053787197', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('272', '3', '587', '招聘钣金喷漆工（梁山）', '月薪：2000-6000元。', '', '0', '1271920178', '1271920178', '', '高先生', '13792321929', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('273', '3', '552', '九龙家电招聘导购员', '年龄：20-35岁，爱岗敬业，诚信，底薪：800元加提成。', '', '0', '1271920179', '1271920179', '', '郑女士', '13053748036', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('274', '3', '595', '金策公交传媒聘平面设计一名', '月薪1000元以上，限女性。', '', '0', '1271920180', '1271920180', '', '孟先生', '2894567', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('275', '3', '500', '招聘售楼员', '招聘有上进心、沟通能力强、最好有相关工作经验，形象气质佳，有意者请投简历至邮箱：cyfc1993＠126。com底薪：800元加提成，转正后办理保险。：', '', '0', '1271920181', '1271920181', '', '胡女士', '2787779', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('276', '3', '614', '招聘俄语翻译', '工作年限2年以上，口语流利，机械方面者优先，最低月薪1800元，具体面议。', '', '0', '1271920181', '1271920181', '', '张先生', '13563748741', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('277', '3', '546', '北京红缨教育加盟园招聘有经验的幼教', '位于济宁市东郊三贾村。新建园，北京红缨加盟园。小班化管理。每班20-25名孩子。3位老师。招聘有工作经验的幼师专业或学前教育专业的老师。要求：<br />\r\n1、有责任心、有耐心。<br />\r\n2、敬业、爱岗。<br />\r\n3、外表端正、普通话好。<br />\r\n4、能歌善舞、会弹钢琴者优先。<br />\r\n5、个人素质高、无不良习惯。<br />\r\n<br />\r\n待遇1、负责食宿。<br />\r\n2、统一园服。<br />\r\n3、在本园工作一年以上老和医疗保险。<br />\r\n联系电话：13655377789、13375378600冯', '', '0', '1271997608', '1381299255', '', '冯园长', '13375378600', '', '127.0.0.1', '8', '1');
INSERT INTO `f_info` VALUES ('278', '3', '496', '美国上市公司如家连锁酒店诚聘', '总经理助理一名，年龄在25-35岁，从事星级酒店3年以上，具备前厅、销售及客房管理经验者优先，月薪2900元。<br />值班经理2名，年龄22-30岁，从事星级酒店两年以上，具备前厅、客房、餐厅管理经验者优先，月薪1800元。<br />餐厅服务员2名，男女不限，月薪900元。<br />工程人员2名，具备电工证，年龄45岁以下，从事过酒店工作者优先，月薪1300元。<br />客房服务人员3名，年龄45岁以下，能吃苦耐劳，月薪900元。', '', '0', '1271920182', '1271920182', '', '冯经理', '13863716852', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('279', '3', '506', '中国重汽济宁公司招聘正式工', '招聘条件；18--26周岁之间，身体健康无传染病，无纹身，无不良嗜好<br />报名须知；持身份证，毕业证，户籍证明，照片。<br />待遇    ；签订合同缴纳五险一金。', '', '0', '1271920182', '1271920182', '', '吴经理', '18663765969', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('280', '3', '520', '招聘收银员1名，接待1名，店长1名', '20-26岁，有工作经验，口齿伶俐，会普通话，形象气质佳，10小时工作制，月薪800-1500元，非诚勿扰。', '', '0', '1271920183', '1271920183', '', '张先生', '13792307778', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('281', '3', '508', '山东瑞中医药有限公司招聘财务人员5名', '中专以上学历，男女不限，年龄20岁左右，能熟练操作电脑，无家庭负担，有会计上岗证者优先。', '', '0', '1271920183', '1271920183', '', '李老师', '2108888', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('282', '3', '593', '运河城品牌女装招聘服务员5名', '18-25岁，两班倒，有工作经验，口齿伶俐，会普通话，形象气质佳，月薪600元加提成，非诚勿扰！', '', '0', '1271920184', '1271920184', '', '李小姐', '13583707778', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('283', '3', '581', '招聘济宁市终端业务人员', '主要产品：大好大炒货、香约奶茶，男女不限，年龄20-35岁，能吃苦耐劳，高中毕业，基本薪资待遇1200-2000元。', '', '0', '1271920184', '1271920184', '', '段先生', '13012602976', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('284', '3', '604', '招聘服务人员', '招聘服务人员，工作时间：下午2:00到晚上11:30，月薪：800元。其他不限。', '', '0', '1271920184', '1271920184', '', '张女士', '15605375505', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('285', '3', '497', '秀水瑞丽鞋店招聘营业员', '18-28岁，月薪1000元以上。', '', '0', '1271920185', '1271920185', '', '赵先生', '15963707773', '', '127.0.0.1', '4', '1');
INSERT INTO `f_info` VALUES ('286', '3', '517', '招聘钻铣工', '招聘钻铣工，待遇1000-3000元。', '', '0', '1271920185', '1271920185', '', '张先生', '13181300251', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('287', '3', '500', '惠普维修站招聘工程师！！！！！！', '熟悉计算机软硬件，对打印机、笔记本维修有较好基础。<br /><br />主要从事客户硬件故障处理，欢迎有能力的朋友加入。<br /><br />主要是负责惠普打印机，笔记本维修，清华同方电脑硬件维修。<br />', '', '0', '1271920186', '1271920186', '', 'hp维修站', '3937123', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('288', '3', '13', '贵和商场附近单位房，家具家电齐全，800', '家具家电齐全，非常干净，不是老楼', '', '0', '1271925428', '1271925428', '', '常', '13562793111', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('289', '3', '13', '舜泰园小区精装修新房，全套家具家电，整体厨房，木地板，3室向', '家具家电全套，精装新房，整体厨房，木地板', '', '0', '1271927100', '1271927100', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('290', '3', '13', '银都新房出租', '部分家具', '', '0', '1271927100', '1271927100', '', '甄先生', '13054975918', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('291', '3', '13', '天马附近 4＊2＊2', '代销楼盘 房屋出租房屋出售 房屋抵押贷款 专业保洁免费为你发布房屋出房屋出售等各种信息 贵宾热线 ：15953717271', '', '0', '1271927101', '1271927101', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('292', '3', '13', '置城国际 办公 1200元', '', '', '0', '1271927101', '1271927101', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('293', '3', '13', '解放路紧邻高层176平，精装修，床，空调，宽带，厨具', '精装修，床，空调，宽带，厨具', '', '0', '1271927102', '1271927102', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('294', '3', '13', '商校北单位宿舍  供暖 550元', '', '', '0', '1271927102', '1271927102', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('295', '3', '13', '矿山宿舍 450元', '代销楼盘 房屋出租房屋出售 房屋抵押贷款 专业保洁免费为你发布房屋出房屋出售等各种信息 贵宾热线 ：15953717271', '', '0', '1271927102', '1271927102', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('296', '3', '13', '东闸小区单位暖房，精装修，家具家电齐全，1300（含物业）停', '精装修，家具家电齐全', '', '0', '1271927102', '1271927102', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('297', '3', '13', '2院紧邻合租160，男孩，电视，机顶盒，床。衣橱。沙发。太阳', '', '', '0', '1271927102', '1271927102', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('298', '3', '13', '银资小区5＊3＊2  供暖', '代销楼盘 房屋出租房屋出售 房屋抵押贷款 专业保洁免费为你发布房屋出房屋出售等各种信息 贵宾热线 ：15953717271', '', '0', '1271927103', '1271927103', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('299', '3', '13', '房屋出租 450元', '代销楼盘 房屋出租房屋出售 房屋抵押贷款 专业保洁免费为你发布房屋出房屋出售等各种信息 贵宾热线 ：15953717271', '', '0', '1271927104', '1271927104', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('300', '3', '13', '府河小区1楼，装修，家具家电齐全，单位房，门卫，停车方便', '精装修，家具家电齐全', '', '0', '1271927104', '1271927104', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('301', '3', '13', '明珠小区暖房1300，装修，电视，空调，热水器，洗衣机，冰箱', '装修，家具家电齐全', '', '0', '1271927104', '1271927104', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('302', '3', '13', '体育馆附近', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927105', '1271927105', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('303', '3', '13', '长城工业园、出租450元', '代销楼盘 房屋出租房屋出售 房屋抵押贷款 专业保洁免费为你发布房屋出房屋出售等各种信息 贵宾热线 ：15953717271', '', '0', '1271927105', '1271927105', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('304', '3', '13', '九龙家电南邻500，床，桌子，热水器，宽带，灶具', '不诚勿扰', '', '0', '1271927105', '1271927105', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('305', '3', '13', '府河小区3楼，家具全套，电视，空调，热水器，太阳能，整体厨房', '停车方便，家具齐全，空调电视热水器太阳能，厨具', '', '0', '1271927106', '1271927106', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('306', '3', '13', '都市春天合租350，女孩，精装修，家具家电齐全，宽带', '宽带，家具家电齐全', '', '0', '1271927106', '1271927106', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('307', '3', '13', '枣店阁小区800，家具家电齐全，非常干净', '柜机空调，热水器，冰箱，家具全套，卧室木地板', '', '0', '1271927106', '1271927106', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('308', '3', '13', '军分区出租房屋', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927108', '1271927108', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('309', '3', '13', '房屋出租', '代销楼盘 房屋出租房屋出售 房屋抵押贷款 专业保洁免费为你发布房屋出房屋出售等各种信息 贵宾热线 ：15953717271', '', '0', '1271927108', '1271927108', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('310', '3', '13', '都市春天 1＊3＊2＊2  车库', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927108', '1271927108', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('311', '3', '13', '阳光润泽园附近 出租高档住宅', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927108', '1271927108', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('312', '3', '13', '冠亚星城  精装', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927109', '1271927109', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('313', '3', '13', '置城国际 家具家电 阳面 750元', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927109', '1271927109', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('314', '3', '13', '运河盛世11＊3＊2精装', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927109', '1271927109', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('315', '3', '13', '明珠小区3＊2＊1 供暖精装，木地板', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927109', '1271927109', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('316', '3', '13', '水晶花园 精装 供暖', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927110', '1271927110', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('317', '3', '13', '碧水云天 16＊1＊1  供暖 精装', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927111', '1271927111', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('318', '3', '13', '置城国际 办公家具齐全 650元', '', '', '0', '1271927111', '1271927111', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('319', '3', '13', '阳光润泽园4＊3＊2木地板 精装', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927111', '1271927111', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('320', '3', '13', '置城中央公园 供暖 家具家电 1800元', '', '', '0', '1271927112', '1271927112', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('321', '3', '13', '出租别墅 精装 供暖', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927112', '1271927112', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('322', '3', '13', '置城国际家具家电 阳面 750元', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927112', '1271927112', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('323', '3', '13', '出租高档房屋', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927113', '1271927113', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('324', '3', '13', '开泰花园 家具家电 800元', '', '', '0', '1271927113', '1271927113', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('325', '3', '13', '世纪广场附近有房出租  精装 165平方', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927113', '1271927113', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('326', '3', '13', '鲁兴欣苑8＊2＊1 供暖 整体厨房 850元', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927114', '1271927114', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('327', '3', '13', '运河城附近 供暖 家具 1200元', '', '', '0', '1271927114', '1271927114', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('328', '3', '13', '枣店阁 家具家电 1100元', '', '', '0', '1271927114', '1271927114', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('329', '3', '13', '舜泰园 供暖 家具 家电 1600元', '', '', '0', '1271927115', '1271927115', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('330', '3', '13', '秀水城 家具家电 精装 800元', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927115', '1271927115', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('331', '3', '13', '液压件小区房屋出租', '', '', '0', '1271927115', '1271927115', '', '马女士', '13863762126', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('332', '3', '13', '联华附近 家具家电 850元', '', '', '0', '1271927115', '1271927115', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('333', '3', '13', '楼房出租', '', '', '0', '1271927115', '1271927115', '', '马女士', '13863762126', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('334', '3', '13', '龙城美墅 供暖 家具家电 1500元', '', '', '0', '1271927116', '1271927116', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('335', '3', '13', '海关路单位宿舍 供暖 家具家电齐全 1100元', '', '', '0', '1271927116', '1271927116', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('336', '3', '13', '新世纪花园', '', '', '0', '1271927117', '1271927117', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('337', '3', '13', '水岸盛世 供暖 家具家电 1800元', '', '', '0', '1271927117', '1271927117', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('338', '3', '13', '育才中学附近 家具家电 1200元', '', '', '0', '1271927117', '1271927117', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('339', '3', '13', '舜泰园小区', '', '', '0', '1271927118', '1271927118', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('340', '3', '13', '气象局附近 家具家电 1000元', '', '', '0', '1271927118', '1271927118', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('341', '3', '13', '枣店阁 家具家电 900元', '', '', '0', '1271927118', '1271927118', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('342', '3', '13', '舜泰园小区', '车位每月70元', '', '0', '1271927119', '1271927119', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('343', '3', '13', '火炬南路', '', '', '0', '1271927119', '1271927119', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('344', '3', '13', '古槐北路 家具 650元', '', '', '0', '1271927119', '1271927119', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('345', '3', '13', '霍家街 供暖 家具家电 1400元', '', '', '0', '1271927120', '1271927120', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('346', '3', '13', '铁塔寺一室一厅家具全家电干净', '', '', '0', '1271927120', '1271927120', '', '唐老师', '05372152268', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('347', '3', '13', '置城国际阳面', '', '', '0', '1271927121', '1271927121', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('348', '3', '13', '圣华园小区120平方，5楼，2＊2＊1，每月1600元，有暖', '', '', '0', '1271927121', '1271927121', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('349', '3', '13', '山推三分厂', '', '', '0', '1271927121', '1271927121', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('350', '3', '13', '阳光花园 550元', '', '', '0', '1271927122', '1271927122', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('351', '3', '13', '鲁兴小区车库', '', '', '0', '1271927122', '1271927122', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('352', '3', '13', '合租吉祥小区3楼，3＊1＊1，每月260元，主卧，找女性，有', '', '', '0', '1271927123', '1271927123', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('353', '3', '13', '长城工业园 家具齐全 600元', '', '', '0', '1271927123', '1271927123', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('354', '3', '13', '邮电小区5楼家具家电齐全每月800元', '', '', '0', '1271927123', '1271927123', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('355', '3', '13', '邮电小区1楼100平方3室1厅家具家电齐全1200元', '', '', '0', '1271927124', '1271927124', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('356', '3', '13', '阳光花园70平方，2＊1＊1，3楼，每月550元，房间干净，', '', '', '0', '1271927125', '1271927125', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('357', '3', '13', '核桃园武装部宿舍1楼家具家电齐全带院出租', '如交一年房租可优惠', '', '0', '1271927125', '1271927125', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('358', '3', '13', '经纬大厦附近单位宿舍5楼，105平方，3＊1＊1，每月850', '', '', '0', '1271927126', '1271927126', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('359', '3', '13', '合租古皆园20平方，2楼，2＊1＊1，每月350元，有床、热', '', '', '0', '1271927127', '1271927127', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('360', '3', '13', '合租琵琶山2楼，75平方，3＊1＊1，每月240元，限女性，', '', '', '0', '1271927128', '1271927128', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('361', '3', '13', '合租琵琶山2楼，75平方，3＊1＊1，每月240元，限女性，', '', '', '0', '1271927128', '1271927128', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('362', '3', '13', '冠亚星城  精装供暖', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927130', '1271927130', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('363', '3', '13', '金梭小区有房出租', '', '', '0', '1271927131', '1271927131', '', 'jninfo', '2124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('364', '3', '13', '新世纪花园140平方，3＊2＊1，5楼，每月1700元，适合', '', '', '0', '1271927131', '1271927131', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('365', '3', '13', '冠亚星城  精装供暖 家具家电', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927131', '1271927131', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('366', '3', '13', '置城中央花园70平方，2＊1＊1，每月1600元，全套家具家', '', '', '0', '1271927132', '1271927132', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('367', '3', '13', '明珠小高层有房出租', '', '', '0', '1271927132', '1271927132', '', 'jninfo', '2124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('368', '3', '13', '合租化纤厂宿舍97平方，6楼。2＊2＊1，每月240元，有1', '', '', '0', '1271927132', '1271927132', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('369', '3', '13', '合租太白西路龙城美墅西临65平方，2＊1＊1，2楼，大间每月', '都是阳间、有沙发、橱子、床、电视', '', '0', '1271927133', '1271927133', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('370', '3', '13', '舜泰园 精装 供暖', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927133', '1271927133', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('371', '3', '13', '世纪广场附近出租高档住宅', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线;15953717271', '', '0', '1271927133', '1271927133', '', '李欣悦李可', '15953717271', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('372', '3', '13', '舜泰园北区85平方，2＊1＊1，6楼，每月700元，豪华装修', '', '', '0', '1271927134', '1271927134', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('373', '3', '13', '合租太白小区80平方，3＊1＊1，8平方储藏室，180元/月', '', '', '0', '1271927134', '1271927134', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('374', '3', '13', '新华路鲁抗紧邻30平方，2楼，每月200元，水电、宽带、铺地', '', '', '0', '1271927135', '1271927135', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('375', '3', '13', '金茂康桥有房出租', '', '', '0', '1271927135', '1271927135', '', 'jninfo', '2124777', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('376', '3', '13', '郭家花园40平方，4楼，每月430元，有水电、床、电视', '', '', '0', '1271927136', '1271927136', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('377', '3', '13', '长虹小区85平方，2＊1＊1，3楼，每月1000元，有水电气', '', '', '0', '1271927137', '1271927137', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('378', '3', '13', '开泰花园三室', '家具，家电', '', '0', '1271927138', '1271927138', '', '梅老师', '15106370273', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('379', '3', '13', '置城国际多套，600-1200元价位不等', '家具，家电齐全', '', '0', '1271927138', '1271927138', '', '梅老师', '15106370273', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('380', '3', '13', '洸河花园100平方，3＊2＊2，2楼，每月800元，有水电气', '', '', '0', '1271927138', '1271927138', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('381', '3', '13', '育才网通宿舍137平方，3楼，3＊2＊1，每月2200元，有', '', '', '0', '1271927138', '1271927138', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('382', '3', '13', '合租吉祥小区85平方，3＊1＊1，6楼，每月240元，有水电', '', '', '0', '1271927139', '1271927139', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('383', '3', '13', '古楷园小区', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271927139', '1271927139', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('384', '3', '13', '里能舜泰园小区', '', '', '0', '1271927140', '1271927140', '', '梅老师', '15106370273', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('385', '3', '13', '（非中介求合租 限女性）东银座附近齐鑫花园小区有主卧室出租有', '小区 安全整洁 设施完备管理到位', '', '0', '1271927141', '1271927141', '', '孙女士', '13791775259', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('386', '3', '13', '非中介！世纪联华太东市场附近楼房，找女生合租', '要求：女生，正常时间上下班，无不良嗜好', '', '0', '1271927141', '1271927141', '', '卢', '15853799651', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('387', '3', '13', '网通宿舍3楼水电暖气家具家电齐全房出租', '', '', '0', '1271927142', '1271927142', '', '李女士', '13355136116', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('388', '3', '13', '中亿欣苑', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271927142', '1271927142', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('389', '3', '13', '银都花园153平方，4＊2＊2，5楼，20平方储藏室，110', '', '', '0', '1271927143', '1271927143', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('390', '3', '13', '古皆园80平方，3＊1＊1，每月750元，空房', '', '', '0', '1271927143', '1271927143', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('391', '3', '13', '中区武装部家属院   有阁楼', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271927143', '1271927143', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('392', '3', '13', '安阜街', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271927144', '1271927144', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('393', '3', '13', '圣景园', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271927144', '1271927144', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('394', '3', '13', '古槐北路中区公安局宿舍80平方，3＊1＊1，2楼，每月650', '', '', '0', '1271927145', '1271927145', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('395', '3', '13', '舜泰园134平方，22楼，2＊2＊1，每月1300元，铺地砖', '', '', '0', '1271927145', '1271927145', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('396', '3', '13', '二院宿舍', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271927145', '1271927145', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('397', '3', '13', '明珠小区', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271927146', '1271927146', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('398', '3', '13', '合租建设路大象集团附近中国银行后，75平方、3＊1＊1，35', '水电、床、电视、宽带、桌椅、电暖气', '', '0', '1271927146', '1271927146', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('399', '3', '13', '水岸盛世 供暖 1200元', '', '', '0', '1271927147', '1271927147', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('400', '3', '13', '合租太白小区80平方，3＊1＊1，8平方储藏室，180元/月', '', '', '0', '1271927147', '1271927147', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('401', '3', '13', '（非中介求合租）东银座附近齐鑫花园小区有主卧室出租  限女性', '小区 安全整洁 设施完备管理到位', '', '0', '1271927148', '1271927148', '', '孙女士', '13791775259', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('402', '3', '13', '合租枣店阁80平方，5楼，3＊1＊1，每月230元，有水电宽', '', '', '0', '1271927148', '1271927148', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('403', '3', '13', '置城国际', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271927148', '1271927148', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('404', '3', '13', '合租太白小区80平方，3＊1＊1，8平方储藏室，180元/月', '', '', '0', '1271927149', '1271927149', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('405', '3', '13', '丹桂园130平方，7楼，每月1000元，3＊1＊1共12，封', '', '', '0', '1271927150', '1271927150', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('406', '3', '13', '袜厂宿舍', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271927150', '1271927150', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('407', '3', '13', '古槐路博物馆对面单位宿舍126平方，3＊2＊1，5楼，有家具', '', '', '0', '1271927150', '1271927150', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('408', '3', '13', '合租博古庄80平方，3＊1＊1，2楼，每月150元，有床、衣', '', '', '0', '1271927151', '1271927151', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('409', '3', '13', '新世纪广场附近有房出租', '环境好 位置好物业管理完善 适合办公', '', '0', '1271927152', '1271927152', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('410', '3', '13', '明珠花园 家具家电 1000元', '', '', '0', '1271927152', '1271927152', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('411', '3', '13', '都市春天 1＊3＊2 精装  家具家电齐全 2300元', '环境好 位置好物业管理完善 适合办公', '', '0', '1271927152', '1271927152', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('412', '3', '13', '光明小区5楼，146平方，28平方车库，3＊2＊1，每月20', '', '', '0', '1271927153', '1271927153', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('413', '3', '13', '鲁兴欣苑93平方，18楼，2＊1＊1，每月800元，电梯高层', '', '', '0', '1271927154', '1271927154', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('414', '3', '13', '海关路国土资源局附近  家具家电 1130元', '', '', '0', '1271927154', '1271927154', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('415', '3', '13', '齐鑫花园 供暖 800元', '', '', '0', '1271927155', '1271927155', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('416', '3', '13', '兴唐金茂对过 供暖 家具家电 1500元', '', '', '0', '1271927156', '1271927156', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('417', '3', '13', '阳光花园', '', '', '0', '1271927156', '1271927156', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('418', '3', '13', '实小附近', '', '', '0', '1271927156', '1271927156', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('419', '3', '13', '苏宁电器南邻800，装修，家具家电，房子非常干净', '家具家电齐全', '', '0', '1271927157', '1271927157', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('420', '3', '13', '凌云小区房屋出租', '家具、家电、沙发、橱子、太阳能、油烟机、电视、洗衣机、床、电脑桌齐全', '', '0', '1271927158', '1271927158', '', '王女士', '13854777977', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('421', '3', '13', '谢营小区 家具家电 900元', '', '', '0', '1271927158', '1271927158', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('422', '3', '13', '附属医院附近 供暖 1100元', '', '', '0', '1271927159', '1271927159', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('423', '3', '13', '舜泰园120平方，2楼，3＊2＊1，每月2000元，有全套家', '', '', '0', '1271927159', '1271927159', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('424', '3', '13', '舜泰园7楼，102平方，3＊2＊2，每月1600元，有全套家', '', '', '0', '1271927159', '1271927159', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('425', '3', '13', '齐鑫花园1楼，装修，热水器，车库，沙发，床，，，', '', '', '0', '1271927160', '1271927160', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('426', '3', '13', '2院紧邻合租160，男孩，电视，床，衣橱，沙发，太阳能，厨具', '家具家电，不诚勿扰', '', '0', '1271927160', '1271927160', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('427', '3', '13', '森泰御城房屋合租（非中介）', '有电梯、铺地、很干净、新房、油烟机、煤气灶、电视', '', '0', '1271927161', '1271927161', '', '尹女士', '15005378886', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('428', '3', '13', '贵和商场附近单位房，家具家电齐全，800', '不诚勿扰', '', '0', '1271927161', '1271927161', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('429', '3', '13', '东闸小区装修，新家具家电齐全，1000', '家具家电齐全', '', '0', '1271927162', '1271927162', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('430', '3', '13', '解放路单位宿舍暖房出租4＊3＊1  1000', '', '', '0', '1271927162', '1271927162', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('431', '3', '13', '明珠小区3楼，沙发，床，电视，800', '电视，沙发，床', '', '0', '1271927163', '1271927163', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('432', '3', '13', '益民小区  3＊2＊1   热水器  油烟机  850元', '', '', '0', '1271927163', '1271927163', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('433', '3', '13', '盛世朝阳 90平方 简装  1200元', '环境好 位置好物业管理完善', '', '0', '1271927163', '1271927163', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('434', '3', '13', '丹桂苑 供暖 1200元', '', '', '0', '1271927163', '1271927163', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('435', '3', '13', '枣店阁小区单位房800，空调，热水器冰箱，家具齐全，非常干净', '家具家电，干净，不诚勿扰', '', '0', '1271927164', '1271927164', '', '常', '13562793111', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('436', '3', '13', '快活林附近精装房出租', '', '', '0', '1271927164', '1271927164', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('437', '3', '13', '2院东临合租160，男孩，床，衣橱，电视，厨具，沙发，太阳能', '不诚勿扰', '', '0', '1271927164', '1271927164', '', '常', '13562793111', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('438', '3', '13', '府河小区650，2床，铺地，暖气', '2床', '', '0', '1271927165', '1271927165', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('439', '3', '13', '舜泰园 复式 供暖 家具家电 2800元', '', '', '0', '1271927165', '1271927165', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('440', '3', '13', '大润发南邻单位暖房，精装修，简单家具', '家具，装修，门卫', '', '0', '1271927166', '1271927166', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('441', '3', '13', '水产路东首  3＊3＊2 装修房  800', '', '', '0', '1271927166', '1271927166', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('442', '3', '13', '解放路单位宿舍暖房出租2＊3＊1  1000', '', '', '0', '1271927166', '1271927166', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('443', '3', '13', '济邹花园 精装房出租', '', '', '0', '1271927167', '1271927167', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('444', '3', '13', '霍家街附近 供暖 1500元', '', '', '0', '1271927167', '1271927167', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('445', '3', '13', '科苑小区4楼120平，家具，暖气，1000', '家具，暖气', '', '0', '1271927167', '1271927167', '', '常', '13562793111', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('446', '3', '13', '建设新村1＊1＊1    500', '', '', '0', '1271927167', '1271927167', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('447', '3', '13', '府河小区1楼，精装修，家具家电齐全，1000', '家具家电齐全，单位暖房，停车方便', '', '0', '1271927167', '1271927167', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('448', '3', '13', '鲁兴花园1＊1＊1  600', '', '', '0', '1271927168', '1271927168', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('449', '3', '13', '建设新村全家具家电出租', '', '', '0', '1271927169', '1271927169', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('450', '3', '13', '红星小区单位暖房，2楼，家具家电，800', '3床，衣橱，沙发，茶几，厨具，电视，空调，热水器', '', '0', '1271927169', '1271927169', '', '常', '13562793111', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('451', '3', '13', '置城国际 家具家电齐全 900元', '', '', '0', '1271927170', '1271927170', '', '陈然', '15820078075', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('452', '3', '13', '声远舞台附近建设北路中国银行后一向阳房间出租（找单身女孩合租', '', '', '0', '1271927171', '1271927171', '', '徐老师', '13181300909', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('453', '3', '13', '新世纪花园豪华装修153平方2600', '', '', '0', '1271927172', '1271927172', '', '阳光房产', '13176751838', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('454', '3', '13', '舜泰园供暖房新房出租', '新房豪华装修', '', '0', '1271927172', '1271927172', '', '隋女士', '18605370652', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('455', '3', '13', '山推1区装修家具家电齐全750', '', '', '0', '1271927173', '1271927173', '', '阳光房产', '13176751838', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('456', '3', '13', '齐鑫花园铺地带车库1000', '可供家具', '', '0', '1271927173', '1271927173', '', '阳光房产', '13176751838', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('457', '3', '13', '黄营 家具齐全 900元', '', '', '0', '1271927173', '1271927173', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('458', '3', '13', '冠亚星城豪华装修家具家电齐全2500', '', '', '0', '1271927174', '1271927174', '', '阳光房产', '13176751838', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('459', '3', '13', '大润发附近豪华装修家具家电齐全1000', '', '', '0', '1271927174', '1271927174', '', '阳光房产', '13176751838', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('460', '3', '13', '建设新村', '', '', '0', '1271927175', '1271927175', '', 'ma', '13176763402', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('461', '3', '13', '齐鑫花园1楼，100平方，2＊2＊1，每月1000元，有27', '', '', '0', '1271927176', '1271927176', '', '戴女士', '13805378860', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('462', '3', '13', '银都花园房屋出租', '', '', '0', '1271927176', '1271927176', '', '甄先生', '13054975918', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('463', '3', '13', '汽车南站附近', '', '', '0', '1271927176', '1271927176', '', 'ma', '13176763402', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('464', '3', '13', '阳光花园 家具 750元', '', '', '0', '1271927176', '1271927176', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('465', '3', '13', '皇营小区', '', '', '0', '1271927177', '1271927177', '', 'ma', '13176763402', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('466', '3', '13', '海关宿舍 家具家电齐全 1600元', '', '', '0', '1271927177', '1271927177', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('467', '3', '13', '博古庄4楼4室1厅，精装修，全家具家电吉 房出租', '', '', '0', '1271927178', '1271927178', '', '薛先生', '13583792836', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('468', '3', '13', '运河盛世14楼3室2厅，中装修，供暖，新房出租', '', '', '0', '1271927178', '1271927178', '', '薛先生', '13583792836', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('469', '3', '13', '都市春天 供暖 2000元', '', '', '0', '1271927178', '1271927178', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('470', '3', '13', '太和桥小区', '更多租房售房信息敬请电话咨询；联系电话；小灵通；0537------2700668，代办二手房贷款，家庭保洁，管道疏通，公安局备案的开换锁。', '', '0', '1271927179', '1271927179', '', '任先生，田女士', '0537-2700668', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('471', '3', '13', '百丰大厦 办公 800元', '', '', '0', '1271927179', '1271927179', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('472', '3', '13', '运河小区3楼3室1厅[100平米]，精装修房，全家具家电房出', '', '', '0', '1271927179', '1271927179', '', '薛先生', '13583792836', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('473', '3', '13', '吉安小区2楼3室1厅装修，全家具家电，精装修干净房出租', '', '', '0', '1271927180', '1271927180', '', '薛先生', '13583792836', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('474', '3', '13', '电力二处 供暖 2500元', '', '', '0', '1271927180', '1271927180', '', '陈然', '15820078075', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('475', '3', '13', '苏宁电器南邻兴隆桥附近', '更多租房售房信息敬请电话咨询；联系电话；小灵通；0537------2700668，代办二手房贷款，家庭保洁，管道疏通，公安局备案的开换锁。', '', '0', '1271927180', '1271927180', '', '任先生，田女士', '0537-2700668', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('476', '3', '13', '贵和附近求男士合租', '更多租房售房信息敬请电话咨询；联系电话；小灵通；0537------2700668，代办二手房贷款，家庭保洁，管道疏通，公安局备案的开换锁。', '', '0', '1271927181', '1271927181', '', '任先生，田女士', '0537-2700668', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('477', '3', '13', '解放路门面房', '更多租房售房信息敬请电话咨询；联系电话；小灵通；0537------2700668，代办二手房贷款，家庭保洁，管道疏通，公安局备案的开换锁。', '', '0', '1271927181', '1271927181', '', '任先生，田女士', '0537-2700668', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('478', '3', '13', '置城国际 家具家电齐全 800元', '', '', '0', '1271927181', '1271927181', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('479', '3', '13', '长城工业园 家具 600元', '', '', '0', '1271927182', '1271927182', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('480', '3', '13', '铁塔寺小区带家具，空调，热水器', '', '', '0', '1271927182', '1271927182', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('481', '3', '13', '解放路多套急租', '更多租房售房信息敬请电话咨询；联系电话；小灵通；0537------2700668，代办二手房贷款，家庭保洁，管道疏通，公安局备案的开换锁。', '', '0', '1271927182', '1271927182', '', '任先生，田女士', '0537-2700668', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('482', '3', '13', '丹桂苑 办公家具 1500元', '', '', '0', '1271927183', '1271927183', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('483', '3', '13', '电视台附近 家具 1000元', '', '', '0', '1271927183', '1271927183', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('484', '3', '13', '草桥市场西邻', '', '', '0', '1271927184', '1271927184', '', '吴老师', '2995662', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('485', '3', '13', '兴隆桥附近', '更多租房售房信息敬请电话咨询；联系电话；小灵通；0537------2700668，代办二手房贷款，家庭保洁，管道疏通，公安局备案的开换锁。', '', '0', '1271927184', '1271927184', '', '任先生，田女士', '0537-2700668', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('486', '3', '13', '银资小区', '更多租房售房信息敬请电话咨询；联系电话；小灵通；0537------2700668，代办二手房贷款，家庭保洁，管道疏通，公安局备案的开换锁。', '', '0', '1271927184', '1271927184', '', '任先生，田女士', '0537-2700668', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('487', '3', '13', '来鹤南小区4楼3室1厅复式全家具家电， 吉房出租', '阁楼60平米。', '', '0', '1271927185', '1271927185', '', '薛先生', '13583792836', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('488', '3', '13', '绿地附近', '单位宿舍', '', '0', '1271930372', '1271930372', '', 'jninfo', '2337396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('489', '3', '13', '舜泰园小区精装修新房，全套家具家电，整体厨房，木地板，3室向', '家具家电全套，精装新房，整体厨房，木地板', '', '0', '1271930372', '1271930372', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('490', '3', '13', '2院紧邻合租160，男孩，电视，机顶盒，床。衣橱。沙发。太阳', '', '', '0', '1271930374', '1271930374', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('491', '3', '13', '东闸小区单位暖房，精装修，家具家电齐全，1300（含物业）停', '精装修，家具家电齐全', '', '0', '1271930374', '1271930374', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('492', '3', '13', '都市豪庭 供暖 2000元', '', '', '0', '1271930375', '1271930375', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('493', '3', '13', '工人医院附近 1300元', '', '', '0', '1271930375', '1271930375', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('494', '3', '13', '明珠小区暖房1300，装修，电视，空调，热水器，洗衣机，冰箱', '装修，家具家电齐全', '', '0', '1271930376', '1271930376', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('495', '3', '13', '府河小区3楼，家具全套，电视，空调，热水器，太阳能，整体厨房', '停车方便，家具齐全，空调电视热水器太阳能，厨具', '', '0', '1271930377', '1271930377', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('496', '3', '13', '红星小区 家具家电齐全 1200元', '', '', '0', '1271930377', '1271930377', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('497', '3', '13', '红星小区500，床，桌，厨具，不诚勿扰', '2床，桌子，灶具', '', '0', '1271930377', '1271930377', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('498', '3', '13', '柳行小区', '', '', '0', '1271930385', '1271930385', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('499', '3', '13', '圣华园小区120平方，5楼，2＊2＊1，每月1600元，有暖', '', '', '0', '1271930388', '1271930388', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('500', '3', '13', '新世纪花园车库26平方出租', '', '', '0', '1271930389', '1271930389', '', '宫老师', '218119613082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('501', '3', '13', '合租吉祥小区3楼，3＊1＊1，每月260元，主卧，找女性，有', '', '', '0', '1271930390', '1271930390', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('502', '3', '13', '银座附近 500元', '', '', '0', '1271930390', '1271930390', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('503', '3', '13', '阳光花园70平方，2＊1＊1，3楼，每月550元，房间干净，', '', '', '0', '1271930391', '1271930391', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('504', '3', '13', '开泰花园 550元', '', '', '0', '1271930392', '1271930392', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('505', '3', '13', '经纬大厦附近单位宿舍5楼，105平方，3＊1＊1，每月850', '', '', '0', '1271930393', '1271930393', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('506', '3', '13', '刘庄小区平房15平方可当仓库200元', '', '', '0', '1271930394', '1271930394', '', '宫老师', '218119613082628667', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('507', '3', '13', '合租琵琶山2楼，75平方，3＊1＊1，每月240元，限女性，', '', '', '0', '1271930394', '1271930394', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('508', '3', '13', '合租古皆园20平方，2楼，2＊1＊1，每月350元，有床、热', '', '', '0', '1271930394', '1271930394', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('509', '3', '13', '合租琵琶山2楼，75平方，3＊1＊1，每月240元，限女性，', '', '', '0', '1271930395', '1271930395', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('510', '3', '13', '新世纪花园140平方，3＊2＊1，5楼，每月1700元，适合', '', '', '0', '1271930397', '1271930397', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('511', '3', '13', '置城中央花园70平方，2＊1＊1，每月1600元，全套家具家', '', '', '0', '1271930398', '1271930398', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('512', '3', '13', '合租化纤厂宿舍97平方，6楼。2＊2＊1，每月240元，有1', '', '', '0', '1271930398', '1271930398', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('513', '3', '13', '合租太白西路龙城美墅西临65平方，2＊1＊1，2楼，大间每月', '都是阳间、有沙发、橱子、床、电视', '', '0', '1271930399', '1271930399', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('514', '3', '13', '舜泰园北区85平方，2＊1＊1，6楼，每月700元，豪华装修', '', '', '0', '1271930400', '1271930400', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('515', '3', '13', '合租太白小区80平方，3＊1＊1，8平方储藏室，180元/月', '', '', '0', '1271930401', '1271930401', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('516', '3', '13', '新华路鲁抗紧邻30平方，2楼，每月200元，水电、宽带、铺地', '', '', '0', '1271930402', '1271930402', '', '戴女士', '13805378860', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('517', '3', '13', '长虹小区85平方，2＊1＊1，3楼，每月1000元，有水电气', '', '', '0', '1271930403', '1271930403', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('518', '3', '13', '育才网通宿舍137平方，3楼，3＊2＊1，每月2200元，有', '', '', '0', '1271930403', '1271930403', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('519', '3', '13', '洸河花园100平方，3＊2＊2，2楼，每月800元，有水电气', '', '', '0', '1271930404', '1271930404', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('520', '3', '13', '合租吉祥小区85平方，3＊1＊1，6楼，每月240元，有水电', '', '', '0', '1271930405', '1271930405', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('521', '3', '13', '（非中介求合租 限女性）东银座附近齐鑫花园小区有主卧室出租有', '小区 安全整洁 设施完备管理到位', '', '0', '1271930407', '1271930407', '', '孙女士', '13791775259', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('522', '3', '13', '仙北小区6＊2＊1 精装 300元合租', '', '', '0', '1271930407', '1271930407', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('523', '3', '13', '霍家小学附近 100平2＊3＊1 1400元', '', '', '0', '1271930407', '1271930407', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('524', '3', '13', '实小附近 4＊3＊1 家具 85平 800元', '', '', '0', '1271930407', '1271930407', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('525', '3', '13', '洸河花园32平方，每月400元，有水电、家具、橱子、沙发、床', '', '', '0', '1271930407', '1271930407', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('526', '3', '13', '银都花园153平方，4＊2＊2，5楼，20平方储藏室，110', '', '', '0', '1271930408', '1271930408', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('527', '3', '13', '都市春天 门面房2层', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271930408', '1271930408', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('528', '3', '13', '古槐北路中区公安局宿舍80平方，3＊1＊1，2楼，每月650', '', '', '0', '1271930410', '1271930410', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('529', '3', '13', '纺织品批发市场南邻百货站宿舍   4＊2＊2', '', '', '0', '1271930410', '1271930410', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('530', '3', '13', '舜泰园134平方，22楼，2＊2＊1，每月1300元，铺地砖', '', '', '0', '1271930410', '1271930410', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('531', '3', '13', '中区公安局附近2＊3＊1 铺地 650  元  80平', '', '', '0', '1271930410', '1271930410', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('532', '3', '13', '合租建设路大象集团附近中国银行后，75平方、3＊1＊1，35', '水电、床、电视、宽带、桌椅、电暖气', '', '0', '1271930411', '1271930411', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('533', '3', '13', '合租太白小区80平方，3＊1＊1，8平方储藏室，180元/月', '', '', '0', '1271930411', '1271930411', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('534', '3', '13', '合租枣店阁80平方，5楼，3＊1＊1，每月230元，有水电宽', '', '', '0', '1271930413', '1271930413', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('535', '3', '13', '丹桂园130平方，7楼，每月1000元，3＊1＊1共12，封', '', '', '0', '1271930414', '1271930414', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('536', '3', '13', '置城中央花园11＊2＊1 精装热水器洗衣机冰箱空调电视机抽油', '', '', '0', '1271930414', '1271930414', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('537', '3', '13', '合租太白小区80平方，3＊1＊1，8平方储藏室，180元/月', '', '', '0', '1271930414', '1271930414', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('538', '3', '13', '古槐路博物馆对面单位宿舍126平方，3＊2＊1，5楼，有家具', '', '', '0', '1271930415', '1271930415', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('539', '3', '13', '体育馆附近好房出租  家具家电  800元', '', '', '0', '1271930415', '1271930415', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('540', '3', '13', '合租博古庄80平方，3＊1＊1，2楼，每月150元，有床、衣', '', '', '0', '1271930416', '1271930416', '', '戴女士', '13805378860', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('541', '3', '13', '工人文化宫小区2＊2＊1床家具空调热水器有线 水电煤暖', '', '', '0', '1271930417', '1271930417', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('542', '3', '13', '光明小区172平方，1楼，4＊2＊2，每月2000元，全套家', '', '', '0', '1271930417', '1271930417', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('543', '3', '13', '光明小区5楼，146平方，28平方车库，3＊2＊1，每月20', '', '', '0', '1271930418', '1271930418', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('544', '3', '13', '都市豪庭30平方车库，每月350元', '', '', '0', '1271930418', '1271930418', '', '戴女士', '13805378860', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('545', '3', '13', '鲁兴欣苑93平方，18楼，2＊1＊1，每月800元，电梯高层', '', '', '0', '1271930418', '1271930418', '', '戴女士', '13805378860', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('546', '3', '13', '都市豪庭10楼，100平方，2＊2＊1，每月800元，空房，', '', '', '0', '1271930421', '1271930421', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('547', '3', '13', '解放路60平方，2楼，2＊1＊1，每月700元，有餐桌、沙发', '', '', '0', '1271930422', '1271930422', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('548', '3', '13', '舜泰园7楼，102平方，3＊2＊2，每月1600元，有全套家', '', '', '0', '1271930422', '1271930422', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('549', '3', '13', '舜泰园120平方，2楼，3＊2＊1，每月2000元，有全套家', '', '', '0', '1271930423', '1271930423', '', '戴女士', '13805378860', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('550', '3', '13', '解放路60平方，2楼，2＊1＊1，每月700元，有餐桌、沙发', '', '', '0', '1271930424', '1271930424', '', '戴女士', '13805378860', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('551', '3', '13', '纺织品批发市场南邻百货站宿舍', '', '', '0', '1271930424', '1271930424', '', '王艳', '13793784299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('552', '3', '13', '开泰花园 600元', '', '', '0', '1271930427', '1271930427', '', '陈然', '15820078075', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('553', '3', '13', '舜泰园 供暖 1000元', '', '', '0', '1271930429', '1271930429', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('554', '3', '13', '麦乐园附近刘庄居委宿舍', '', '', '0', '1271930431', '1271930431', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('555', '3', '13', '银都花园单位宿舍出租  650', '', '', '0', '1271930432', '1271930432', '', '李女士徐女士', '1367637362613235376699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('556', '3', '13', '都市豪庭 供暖 1500元', '', '', '0', '1271930432', '1271930432', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('557', '3', '13', '置城国际在线床热水器空调宽带600', '', '', '0', '1271930432', '1271930432', '', '阳光房产', '13176751838', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('558', '3', '13', '声远舞台附近建设北路中国银行后一向阳房间出租（找单身女孩合租', '', '', '0', '1271930433', '1271930433', '', '徐老师', '13181300909', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('559', '3', '13', '都市春天 供暖 1200元', '', '', '0', '1271930433', '1271930433', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('560', '3', '13', '银都小区750', '', '', '0', '1271930433', '1271930433', '', '阳光房产', '13176751838', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('561', '3', '13', '冠亚星城 供暖 2000元', '', '', '0', '1271930434', '1271930434', '', '陈然', '15820078075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('562', '3', '13', '琵琶山小区门面房   无转让费', '', '', '0', '1271930435', '1271930435', '', '阳光房产', '13176751838', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('563', '3', '13', '都市春天134平方，4楼，3＊2＊1，每月1200元，电梯高', '', '', '0', '1271930435', '1271930435', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('564', '3', '13', '都市春天134平方，4楼，3＊2＊1，每月1200元，电梯高', '', '', '0', '1271930436', '1271930436', '', '戴女士', '13805378860', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('565', '3', '13', '齐鑫花园复式900', '', '', '0', '1271930436', '1271930436', '', '阳光房产', '13176751838', '', '127.0.0.1', '8', '1');
INSERT INTO `f_info` VALUES ('566', '3', '13', '红星东路房屋出租650', '', '', '0', '1271930436', '1271930436', '', '阳光房产', '13176751838', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('567', '3', '13', '齐鑫花园1楼，100平方，2＊2＊1，每月1000元，有27', '', '', '0', '1271930437', '1271930437', '', '戴女士', '13805378860', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('568', '3', '13', '＊＊＊都市春天高层出租＊＊＊', '', '', '0', '1271930439', '1271930439', '', '刘先生', '13665375375', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('569', '3', '13', '运河小区3楼3室1厅[100平米]，精装修房，全家具家电房出', '', '', '0', '1271930440', '1271930440', '', '薛先生', '13583792836', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('570', '3', '13', '舜泰园好房出租', '更多租房售房信息敬请电话咨询；联系电话；小灵通；0537------2700668，代办二手房贷款，家庭保洁，管道疏通，公安局备案的开换锁。', '', '0', '1271931105', '1271931105', '', '任先生，田女士', '0537-2700668', '', '127.0.0.1', '4', '2');
INSERT INTO `f_info` VALUES ('571', '3', '350', '万家福搬家公司', '服务项目；专业从事家庭.大小型企业、办公室、工厂、写字楼、个人搬家，专业拆装空调，拆装家具，管道疏通。有着多年丰富搬家经验，“专业服务，安全快捷，合理利润，顾客至上的经营理念。', '', '0', '1271934089', '1271934089', '', '宋先生', '13792351871', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('572', '3', '351', '顺达搬家公司', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务', '', '0', '1271934772', '1271934772', '', '马先生', '13518652230', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('573', '3', '349', '宏祥搬家公司 济宁市全市价格最低 24小时服务', '承接家庭、工厂、办公室，长途、短途运输，24小时服务。', '', '0', '1271934772', '1271934772', '', '马先生', '15715371615', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('574', '3', '351', '吉运搬家公司', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934772', '1271934772', '', '马先生', '2817055', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('575', '3', '349', '诚和搬家服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934772', '1271934772', '', '马先生', '2352930', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('576', '3', '349', '顺祥搬家公司济宁市全市价格最低24小时服务', '承接家庭、工厂、办公室，长途、短途运输，24小时服务。', '', '0', '1271934773', '1271934773', '', '杨女士', '15715371738', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('577', '3', '348', '万通搬家公司服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934773', '1271934773', '', '李先生', '130826222999', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('578', '3', '351', '顺达搬家公司', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934773', '1271934773', '', '马先生', '13518652230', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('579', '3', '348', '天顺搬家服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934773', '1271934773', '', '马先生', '13518652230', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('580', '3', '348', '天意搬家公司', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934774', '1271934774', '', '杨先生', '2198918', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('581', '3', '350', '步步高搬家服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934775', '1271934775', '', '张先生', '2351067', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('582', '3', '349', '田园搬家，服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934776', '1271934776', '', 'jninfo田先生', '0537-2235515', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('583', '3', '349', '如意搬家服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934777', '1271934777', '', '马先生', '2337458', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('584', '3', '349', '宏祥搬家公司 济宁市全市价格最低 24小时服务', '承接家庭、工厂、办公室，长途、短途运输，24小时服务', '', '0', '1271934777', '1271934777', '', '马先生', '15715371615', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('585', '3', '351', '诚信搬家公司', '为了更好的服务于济宁人民 本公司新上一辆全封闭式货车', '', '0', '1271934777', '1271934777', '', '陈经理', '2264406', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('586', '3', '348', '济宁正和搬家服务中心', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934778', '1271934778', '', '张先生', '0537-2367792', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('587', '3', '351', '平安搬家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934779', '1271934779', '', '田先生', '0537-2236155', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('588', '3', '350', '如意搬家服务万家', '集居民搬家，集体、事业单位搬迁，钢琴搬运，家居拆装，公司拥有专业技术员工，确保24小时，安全快捷，为您服务。', '', '0', '1271934780', '1271934780', '', '马先生', '2337458', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('589', '3', '348', '转让搬家公司', '十年老店 因转行急转 年收入8万左右', '', '0', '1271934780', '1271934780', '', '陈', '15653733380', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('590', '3', '350', '诚信搬家', '承接家庭、工厂、办公室，长途、短途运输，24小时服务。', '', '0', '1271934781', '1271934781', '', '陈经理', '2830688', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('591', '3', '349', '平安搬家', '平安搬家,0537-2239713.本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务。', '', '0', '1271934782', '1271934782', '', '田先生', '0537-2236155', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('592', '3', '351', '鸿圣搬家服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934782', '1271934782', '', '王先生', '13854751556', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('593', '3', '351', '正和搬家', '正和搬家,0537-2367792.本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务。', '', '0', '1271934782', '1271934782', '', '张经理', '0537-2367792', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('594', '3', '349', '顺达搬家公司', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务。', '', '0', '1271934785', '1271934785', '', '马先生', '13518652230', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('595', '3', '350', '步步高搬家服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务。', '', '0', '1271934785', '1271934785', '', '张先生', '2351067', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('596', '3', '351', '顺溜搬家', '专业搬家。快速、安全。', '', '0', '1271934786', '1271934786', '', '李经理', '15053763226', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('597', '3', '350', '诚和搬家服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务。', '', '0', '1271934786', '1271934786', '', '马先生', '2352930', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('598', '3', '351', '喜洋洋搬家', '本公司常年搬家，有实力、有经验。短途、中长途都可接手。还承接家政保洁、空调移机等家政业务', '', '0', '1271934786', '1271934786', '', '张先生', '05372897196', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('599', '3', '348', '诚信搬家', '承接家庭搬家，厂房搬迁，疏通管道，移装空调。', '', '0', '1271934786', '1271934786', '', '陈经理', '2830688', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('600', '3', '350', '万通搬家公司服务万家', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务。', '', '0', '1271934788', '1271934788', '', '李先生', '130826222999', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('601', '3', '348', '平顺搬家公司', '服务项目：家庭搬家、办公室门市部搬迁、货物中短途搬迁运输、空调移机、管道疏通、家庭保洁等。服务宗旨：专业、安全、体贴、收费合理、信誉第一、服务周到。', '', '0', '1271934788', '1271934788', '', '刘经理', '15964119220', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('602', '3', '351', '万佳搬家公司', '服务项目；专业从事家庭.大小型企业、办公室、工厂、写字楼、个人搬家，专业拆装空调，拆装家具，管道疏通。有着多年丰富搬家经验，“专业服务，安全快捷，合理利润，顾客至上的经营理念。', '', '0', '1271934789', '1271934789', '', '宋先生', '137923518713936955', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('603', '3', '351', '吉运搬家公司', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务。', '', '0', '1271934789', '1271934789', '', '马先生', '2817055', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('604', '3', '350', '永兴锁业---给新老客户拜年了！！', '永兴锁业主营开锁,修锁,换锁芯,装锁,承接济宁片区各种锁具工程,开修各种保险柜,异型锁,磁力锁,电子密码箱锁,防盗门,开启各种汽车锁,经销各种锁具配钥匙等.开锁修锁换锁芯,专业提供锁具的一切服务，朋友，如果您的轿车钥匙锁在驾驶室内或保险柜丢了钥匙、密码忘了出现故障，普通居民钥匙丢在房间内等时，来个电话，剩下的请全部交给我们.永兴锁业在此预祝您：生活开心，工作顺利！！', '', '0', '1271934789', '1271934789', '', '李工', '2661889', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('605', '3', '348', '家洁专业上门换锁芯，', '家洁专业上门更换各类锁芯，包括各种高中档防盗门，办公桌，文件柜等各种锁芯，', '', '0', '1271934790', '1271934790', '', '左林', '13675379144', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('606', '3', '348', '结缘搬家公司', '结缘搬家服务有限公司是一家集家居搬迁、企业迁移、重型机械吊装、等服务于一体的专业搬家服务有限公司。公司本着“专业服务，安全快捷，合理利润，顾客至上”的经营理念，并以“为客户最大限度创造价值”为己任，长期以来在服务好广大市民的同时，同多家大型国家级企业，外资企业保持良好的合作关系，为它们的写字楼搬迁，工厂迁移，货物配送提供了强有力的支持，并成为它们整个企业合作链条中不可缺少的一环!我们公司正以严谨的敬业精神和负责的工作态度赢的越来越多的济宁市民和企业的好评.', '', '0', '1271934799', '1271934799', '', '刘', '2820736', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('607', '3', '350', '亨达搬家公司', '亨达搬家公司是一家集家居搬迁、企业迁移等服务于一体的专业搬家公司。公司本着“专业服务，安全快捷，合理利润，顾客至上”的经营理念，并以“为客户最大限度创造价值”为己任，长期以来在服务好广大市民的同时，同多家大型国家级企业，外资企业保持良好的合作关系，为它们的写字楼搬迁，工厂迁移，货物配送提供了强有力的支持，并成为它们整个企业合作链条中不可缺少的一环!我们公司正以严谨的敬业精神和负责的工作态度赢的越来越多的济宁市民和企业的好评.', '', '0', '1271934799', '1271934799', '', '刘', '2367542', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('608', '3', '348', '顺利搬家公司&amp;amp;nbsp;&amp;amp;n', '承接家庭、工厂、办公室，长途、短途运输，24小时服务。', '', '0', '1271934802', '1271934802', '', '杨女士', '15715371738', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('609', '3', '351', '步步高搬家服务万家', '集居民搬家，集体、事业单位搬迁，钢琴搬运，家居拆装，公司拥有专业技术员工，确保24小时，安全快捷，为您服务。', '', '0', '1271934802', '1271934802', '', '张先生', '2351067', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('610', '3', '348', '诚和搬家服务万家', '集居民搬家，集体、事业单位搬迁，钢琴搬运，家居拆装，公司拥有专业技术员工，确保24小时，安全快捷，为您服务。', '', '0', '1271934802', '1271934802', '', '马先生', '2352930', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('611', '3', '350', '诚和搬家服务万家', '集居民搬家，集体、事业单位搬迁，钢琴搬运，家居拆装，公司拥有专业技术员工，确保24小时，安全快捷，为您服务', '', '0', '1271934803', '1271934803', '', '马先生', '2352930', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('612', '3', '350', '顺利搬家公司济宁市全市价格最低24小时服务', '承接家庭、工厂、办公室，长途、短途运输，24小时服务。', '', '0', '1271934804', '1271934804', '', '杨女士', '15715371738', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('613', '3', '348', '万家福搬家服务公司', '服务项目:家庭搬家、保洁、办公室门市部搬迁、货物中短途搬迁运输、空调移机、管道疏通等。服务宗旨：专业安全体贴。', '', '0', '1271934805', '1271934805', '', '宋先生', '393698813792351871', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('614', '3', '348', '三轮货运服务', '搬家送货，拉运装饰建筑垃圾，车辆类型，加长型机动三轮，拉运各种装饰板 材。', '', '0', '1271934806', '1271934806', '', 'jninfo', '15553715263', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('615', '3', '348', '顺利搬家公司济宁市全市价格最低24小时服务', '承接家庭、工厂、办公室，长途、短途运输，24小时服务', '', '0', '1271934809', '1271934809', '', '刘先生', '15715371732', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('616', '3', '349', '顺祥搬家公司济宁市全市价格最低24小时服务', '承接家庭、工厂、办公室，长途、短途运输，24小时服务', '', '0', '1271934809', '1271934809', '', '杨女士', '15715371738', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('617', '3', '348', '宏祥搬家公司', '承接家庭、工厂、办公室，长途、短途运输，24小时服务', '', '0', '1271934926', '1271934926', '', '马先生', '15715371615', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('618', '3', '348', '诚信服务', '本人有一辆客货对外出租,车厢长2.5,宽1.5,承接两吨以下的货物运输.诚信为本,互利互赢.', '', '0', '1271934811', '1271934811', '', '信诺', '15153787756', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('619', '3', '349', '新世纪搬家公司', '济宁搬家公司是集居民搬家、集体、企事业单位的搬迁、钢琴搬运、家具拆装、包装托运、空调移机、大件物品的搬运为一体的中型搬家公司之一，现有各种作业车多辆,公司拥有通过专业培训并掌握搬家技巧的员工，利用合理的调度就近派车，确保24小时及时、周到、安全快捷的为您服务。济宁搬家公司以满足客户要求为己任，以客户的满意为遵旨，为您提供优质的服务平台。如意在乎您的认可，您的满意就是对我们最大的支持，我公司全体员工竭诚为您服务', '', '0', '1271934812', '1271934812', '', '陈经理', '0537-3153289', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('620', '3', '351', '济宁市高价收冬虫夏草13520851077回收药品', '回收药品　电话 13520851077 收冬虫夏草 燕窝海参 高价回收针剂、高档针剂、进口针剂、肿瘤药品、化疗药品、冬虫夏草 保列治、舒降芝、百优解 收针剂、高档针剂、进口高价回针剂、肿瘤药品、化疗药品、肾移植药,以及合心爽、扶他林、拜斯平、普乐可复、赛思平、新山地明、开同、尹母 兰、内美通、维思通、田可、希克劳、利平止、都可喜；波立维；欣康；美多芭；西 收购药品如下:西药有马丁啉、芬必得、西斯敏、拜心同、拜糖平、达美康、糖适平、开博通、贺普丁、严迪、、络活利君沙罗达等等…… 针剂有立止血、白蛋白、泰能、罗氏芬、复达欣、西历欣、稳可信 肾移植药,以及各类中西成药和 惠尔血、善宁、金钠多、法马欣、博宁、康来特、健责、舒普深、高舒达、骁悉、美罗华、佛铁龙、美平、泰索帝、复达华、格利维、郝塞丁、康泉；泰素等等… 例如普药.糖适平,拜糖平,达美康,尿毒清颗粒.丹参滴丸.通心洛交囊.怡开 .科素亚.保列治.诺和灵.拜心同,马丁林,贺补丁,百优解,开同,希罗达,美多芭 ,普乐可复,舒降芝,欣康,波力维,蒙诺,落丁心,西比灵,扶他林,络活喜.等等 等等 临床药品,例如.立止血,白蛋白,泰能,罗氏芬,稳可信,日达仙,惠尔血,善宁 ,金纳多,法马欣,博宁,康来特,健则,舒普', '', '0', '1271934813', '1271934813', '', '季先生', '13391977179', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('621', '3', '350', '宏祥搬家公司', '本公司集居民搬家，集体、事业单位搬迁，钢琴搬运，家具拆装，公司拥有优秀的技术员工，确保24小时安全快捷为您服务.', '', '0', '1271934814', '1271934814', '', '杨先生', '15715371732', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('622', '3', '342', '专业维修，疏通管道', '维修各种管道，改造上下水，价格合理，服务周到。', '', '0', '1271938625', '1271938625', '', '王先生', '13173175132', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('623', '3', '342', '家洁管道改造中心', '家庭管道疏通:30元起价.单位及各学校管道疏通;常年雇用，价格从优．家洁社区服务中心，将会用我们的诚心来换回您的安心！家洁社区服务中心，将会用我们的服务来换回您的舒心！专业机械疏通各种下水道、厨房、卫生间、马桶、地漏、浴盆、清理化粪池淤积堵塞；钻各种强孔、地下室厕所堵漏、改装独立管道、改PP-R水管等业务，快捷及时、保证质量、价格合理，为您排忧解难是我的职责。请记住您身边的朋友：家洁！', '', '0', '1271938625', '1271938625', '', '左林', '13675379144', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('624', '3', '344', '济宁便民疏通部', '李工为您提供以下服务:1.马桶:专业疏通各种型号马桶（抹布,清洁球,塑料）等各种软硬物质所造成的堵塞.2.地漏:专业疏通各种v型,S型拐弯的地漏,（因为装修掉进水泥,沙子或头发）等种原因所造成的堵塞.3.下水道:各类家庭,酒店,公司,学校等单位的下水道,各类管道,水斗,脸盆,浴缸,水池,地漏,马桶,小便池,阴沟,窑井,化粪池等各种下水管道疏通清理,污水管道疏通清理、维修各式水龙头,马桶水箱维修及更换零配件,阀门,浴缸漏渗水.水斗,上下水管改装等,专修电马桶.以及针对单位公司内的排污管道,化粪池,油污池进行清理等,有这方面棘手的事情,请找李工,', '', '0', '1271938625', '1271938625', '', '李工', '0537-2970970', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('625', '3', '344', '专业维修改造管道', '专业维修家庭照明线路，改造自来水管道（PVC，PPR）管道等，改造上下水管道，疏通下水道，水钻打空等，加工家庭防盗网（钢筋，不锈钢）价格合理，随叫随到。', '', '0', '1271938625', '1271938625', '', '王老师', '13173175132', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('626', '3', '343', '济宁便民疏通部', '上门疏通：30元起价，各单位：常年服务，价格从优，本部从业疏通工作多年，专业机械疏通各种下水道、厨房、卫生间、马桶、地漏、浴盆、清理化粪池淤积堵塞；钻各种墙孔、地下室厕所堵漏、改装独立管道、改PP-R水管等业务，承接各类家庭,酒店,公司,学校等单位的下水道疏通,各类管道疏通,脸盆疏通,浴缸疏通,水池疏通,地漏疏通,马桶疏通,小便池疏通,等各种下水管道疏通清理,维修各式水龙头,马桶水箱,阀门,浴缸漏渗水.上下水管改装等,专修电马桶.以及针对单位公司内的排污管道,化粪池,油污池进行清理等.相信便民疏通部会给您一个温馨的满意．市内业务，１０分钟即到', '', '0', '1271938626', '1271938626', '', '李老师', '2661889', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('627', '3', '342', '开锁，装锁，修锁！！', '济宁永兴锁业批发各类锁芯，上门更换各类锁芯，包括各种防盗门，单位更衣橱，文件柜。办公桌等各种锁芯。主营开锁,修锁,换锁芯,装锁,承接济宁片区各种锁具工程,开修各种保险柜,异型锁,磁力锁,电子密码箱锁,防盗门,开启各种汽车锁,经销各种锁具配钥匙等.开锁修锁换锁芯,专业提供锁具的一切服务，朋友，如果您的轿车钥匙锁在驾驶室内或保险柜丢了钥匙、密码忘了出现故障，普通居民钥匙丢在房间内等时，来个电话，剩下的请全部交给我们.必要时请出示您的有关证件，谢谢配合。', '', '0', '1271938626', '1271938626', '', '李老师', '0537-2661889', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('628', '3', '342', '专业安装维修太阳能采暖炉', '专业安装维修太阳能采暖炉，上门安装维修。', '', '0', '1271938626', '1271938626', '', '郭恩夏', '13465795548', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('629', '3', '344', '专业疏通、安装、维修各种上下水道', '专业疏通、安装、维修各种上下水道', '', '0', '1271938626', '1271938626', '', '褚先生', '2880583', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('630', '3', '344', '处理太阳能', '处理太阳能本店因更换太阳能品牌，特处理一批原代理的太阳能。型号：￠47x1.6米X15支管容水量110升处理价格（ 780元 )不包安装型号：￠58X1.8米X15支管容水量170升处理价格（880元） 不包安装 产品保修须知：㈠ 太阳能主机免费保修三年，如无质量问题收费服务。㈡ 如需本店安装 .管道管件费另算 .安装费（80元），管道管件保修一年, 详细保修见说明书:数量有限欢迎预定活动时间：2010-3-1日天韵水暖2010年3月1日', '', '0', '1271938627', '1271938627', '', '孙士彦', '0537-3156444', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('631', '3', '343', '上门维修上下水管道', '上门维修上下水管道', '', '0', '1271938627', '1271938627', '', 'jninfo', '13465795548', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('632', '3', '342', '济宁老杨专业疏通管道', '专业疏通下水道，马桶及各种淤积疏通业务，专业疏通厕所，座便器，壁漏，菜池的各种管道疏通！', '', '0', '1271938627', '1271938627', '', '杨先生', '2663934', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('633', '3', '344', '专业维修管道', '专业维修各种管道，改造疏通上下水，维修各种灯具，电器元件更换，24小时服务，价格合理。', '', '0', '1271938627', '1271938627', '', '王先生', '13173175132', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('634', '3', '344', '济宁便民疏通部--预祝新老客户新春快乐', '上门疏通：30元起价，各单位：常年服务，价格从优，本部从业疏通工作多年，专业机械疏通各种下水道、厨房、卫生间、马桶、地漏、浴盆、清理化粪池淤积堵塞；钻各种墙孔、地下室厕所堵漏、改装独立管道、改PP-R水管等业务，承接各类家庭,酒店,公司,学校等单位的下水道疏通,各类管道疏通,脸盆疏通,浴缸疏通,水池疏通,地漏疏通,马桶疏通,小便池疏通,等各种下水管道疏通清理,维修各式水龙头,马桶水箱,阀门,浴缸漏渗水.上下水管改装等,专修电马桶.以及针对单位公司内的排污管道,化粪池,油污池进行清理等.相信便民疏通部会给您一个温馨的满意．市内业务，１０分钟即到．在此便民疏通部预祝：新老客户10年合家欢乐，凡事顺事！！', '', '0', '1271938627', '1271938627', '', '李老师', '2970970', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('635', '3', '344', '永兴锁业--换锁，修锁！！', '永兴锁业主营开锁,修锁,上门更换各类换锁芯,装锁,承接济宁片区各种锁具工程,开修各种保险柜,异型锁,磁力锁,电子密码箱锁,防盗门,开启各种汽车锁,经销各种锁具配钥匙等.开锁修锁换锁芯,专业提供锁具的一切服务，朋友，如果您的轿车钥匙锁在驾驶室内或保险柜丢了钥匙、密码忘了出现故障，普通居民钥匙丢在房间内等时，来个电话，剩下的请全部交给我们.永兴锁业在此预祝您：生活开心，工作顺利！！', '', '0', '1271938628', '1271938628', '', '李工', '2661889', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('636', '3', '344', '专业维修管道', '维修改造各种自来水管道，改装上下水管道，安装热水器，价格合理，服务周到。', '', '0', '1271938628', '1271938628', '', '王先生', '13173175132', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('637', '3', '342', '处理太阳能', '处理太阳能本店因更换太阳能品牌，特处理一批原代理的太阳能。型号：￠47x1.5米X15支管容水量105升处理价格（ 780元 )不包安装型号：￠58X1.8米X15支管容水量170升处理价格（880元） 不包安装 产品保修须知：㈠ 太阳能主机免费保修三年，如无质量问题收费服务。㈡ 如需本店安装 .管道管件费另算 .安装费（60元），管道管件保修一年, 详细保修见说明书:数量有限欢迎预定活动时间：2010-3-1日天韵水暖2010年3月1日', '', '0', '1271938628', '1271938628', '', '孙士彦', '0537-3156444', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('638', '3', '344', '昊宇碳纤维电暖器节能先锋', '昊宇碳纤维电暖器最经济.最省钱的新世纪取暖换代产品一:产品简介碳纤维电暖器是采用世界最先进的发热体---高级碳纤维,运用最先进的技术加工制作而成的碳纤维电暖器。外壳采用航空战略铝合金材料抗氧化，美观大方.散热快。直接将电能转换为热能，是以辐射方式传热的新型高级取暖器。同时具有对人体起到远红外保健和辐射理疗作用，能是人感到春天般的温暖。二:产品特点安全环保经济节能热效率高舒适保健质量可靠用途广泛遥控操作 定时定温使用方便 。三:综合造价低，占用空间少。自动温度控制器控温。三个月采暖费用每平方平均大约为8—12元，使用寿命30年，保修三年，免费送货安装。四：是现代人们生活.取暖的最佳选择。换一种 采 暖 方 式 营造财 富 一生诚 招 加 盟 代 理 商山东省碳纤维工程研究中心监制山东潍坊巨能开发有限公司出品经营地址：济宁市健康路八中学校对过（天韵水暖）电话：315644415163796456', '', '0', '1271938629', '1271938629', '', '孙经理', '0537-3156444', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('639', '3', '344', '实在人管道安装维修', '改造家庭、单位自来水管道、PPC\\PPR材质、质量好、服务诚、疏通管道，随叫随到。', '', '0', '1271938629', '1271938629', '', '魏老师', '13793771102', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('640', '3', '342', '永兴锁业---换锁，修锁！！', '永兴锁业主营开锁,修锁,上门更换各类换锁芯,装锁,承接济宁片区各种锁具工程,开修各种保险柜,异型锁,磁力锁,电子密码箱锁,防盗门,开启各种汽车锁,经销各种锁具配钥匙等.开锁修锁换锁芯,专业提供锁具的一切服务，朋友，如果您的轿车钥匙锁在驾驶室内或保险柜丢了钥匙、密码忘了出现故障，普通居民钥匙丢在房间内等时，来个电话，剩下的请全部交给我们.永兴锁业在此预祝您：生活开心，工作顺利！！', '', '0', '1271938629', '1271938629', '', '李老师', '2661889', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('641', '3', '342', '188元电热水器安到家', '188元电热水器安到家 功能与特点：待水箱满水后，关闭阀门，对水压低或经常停水的地区更具有独到之处。自动控温：在温度调节盘上标有0度-80度，用户可任意调节所需温度，到温度后，自动报警，断电后使用更安全。水位显示：在箱体侧边，设有透明水位管，用户可随时观察水位。可移喷头：喷头可以上下，左右摆动，也可取下冲洗，使用极为方便。', '', '0', '1271938629', '1271938629', '', '孙经理', '0537-3156444', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('642', '3', '344', '上门专业安装太阳能采暖炉', '本店经营范围：名牌春兰太阳能电采暖炉，燃煤炉，各种暖气片； 家用天燃气炉具，油烟机； 热水器（260元)', '', '0', '1271938629', '1271938629', '', '郭先生', '13465795548', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('643', '3', '343', '济宁便民疏通部', '上门疏通：30元起价，各单位：常年服务，价格从优，本部从业疏通工作多年，专业机械疏通各种下水道、厨房、卫生间、马桶、地漏、浴盆、清理化粪池淤积堵塞；钻各种墙孔、地下室厕所堵漏、改装独立管道、改PP-R水管等业务，承接各类家庭,酒店,公司,学校等单位的下水道疏通,各类管道疏通,脸盆疏通,浴缸疏通,水池疏通,地漏疏通,马桶疏通,小便池疏通,等各种下水管道疏通清理,维修各式水龙头,马桶水箱,阀门,浴缸漏渗水.上下水管改装等,专修电马桶.以及针对单位公司内的排污管道,化粪池,油污池进行清理等.相信便民疏通部会给您一个温馨的满意．市内业务，１０分钟即到．', '', '0', '1271938630', '1271938630', '', '李工', '2970970', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('644', '3', '342', '清库处理太阳能', '清库处理太阳能本店因更换太阳能品牌，特处理一批原代理的太阳能。型号：￠47x1.5米X15支管容水量105升处理价格（ 780元 )不包安装型号：￠47X1.2米X12支管容水量80升处理价格（560元）不包安装产品保修须知：㈠ 太阳能主机免费保修三年，如无质量问题收费服务。㈡ 如需本店安装 .管道管件费另算 .安装费（60元），管道管件保修一年。㈢ 详细保修见说明书数量有限欢迎预定活动时间：2010-3-1日天韵水暖2010年3月1日', '', '0', '1271938630', '1271938630', '', '孙经理', '0537-3156444', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('645', '3', '343', '专业上门装锁，更换各类锁芯！！', '主营开锁,修锁,换锁芯,装锁,承接各种锁具工程,批发各类锁芯,上门专业更换各类锁芯,包括各种高中档防盗门等民用锁,保险柜,各种办公桌,文件柜,等各种锁芯,市内业务10分钟即到.', '', '0', '1271938630', '1271938630', '', '李工', '2970970', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('646', '3', '343', '水电暖安装维修、装饰装修、管道疏通、上门服务！', '水路工程：水暖维修、管道保温、自来水管、PPR管件、pvc管件、下水道疏通、水钻打过墙眼、安装维修上下水管道！电路工程：家庭明暗线路安装及维修、商场照明及综合布线、灯具/开关/插座安装及维修工程！装饰装修：室内、外装饰装修，墙面乳胶漆，制作、维修家具门窗等零星工程！ 其它工程：上门开锁、清洗油烟机、维修燃气灶、刻章、电气焊、制作防护网、门头制作、货架制作等工程！让您一个电话，不再有烦恼，余下的事情由我们去完成！专业队伍、诚信服务、上门及时、收费合理！本公司愿单位企业进行长期维修物业方面的长期合作！', '', '0', '1271938631', '1271938631', '', '杨', '13853707327', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('647', '3', '344', '专业疏通管道维修，全市最低，24小时服务！', '专业疏通管道维修，全市最低，24小时服务！', '', '0', '1271938631', '1271938631', '', '马先生', '2281044', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('648', '3', '343', '万邦专业疏通维修管道', '专业疏通改造上下水管，移装空调。', '', '0', '1271938631', '1271938631', '', '马女士', '2315721', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('649', '3', '342', '巨龙装饰：水电维修、装饰装修、上门服务！', '济宁巨龙装饰服务项目：水电维修、装饰装修、上门服务！水路工程：水暖维修、自来水管、PPR管件、pvc管件、下水道疏通、水钻打过墙眼、安装维修上下水管道！电路工程：家庭明暗线路安装及维修、商场照明及综合布线、灯具/开关/插座安装及维修工程！装饰装修：室内、外装饰装修，墙面乳胶漆、制作家具与其它零星工程！其它工程：电气焊、制作防护网、门头制作、货架制作等工程！让您一个电话，不再有烦恼，余下的事情由我们去完成！专业队伍、诚信服务、上门及时、收费合理！本公司愿单位企业进行长期维修物业方面的长期合作！联系方式：13853707327杨qq:1259835897', '', '0', '1271938631', '1271938631', '', '杨', '13853707327', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('650', '3', '342', '便民维修服务', '专业维修家庭照明线路，改造自来水管道（PVC，PPR）管道等，改造上下水管道，疏通下水道，水钻打空等，加工家庭防盗网（钢筋，不锈钢）价格合理，随叫随到。', '', '0', '1271938632', '1271938632', '', '王老师', '13173175132', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('651', '3', '344', '家洁社区服务中心', '家庭管道疏通:30元起价.单位及各学校管道疏通;常年雇用，价格从优．家洁社区服务中心，将会用我们的诚心来换回您的安心！家洁社区服务中心，将会用我们的服务来换回您的舒心！疏通下水道、疏通马桶、疏通疑难下水道、专业管道疏通、马桶疏通、疏通地漏、疏通浴缸、十水道堵塞、疏通厕所、水管疏通、马桶堵塞 、脸盆疏通、污水管道疏通、管道清洗、、马桶维修、维修马桶、马桶水箱漏水、马桶漏水、厕所疏通、下水道疏通、高压清洗、化粪池清掏，有这方面的问题，请记住您身边的朋友：家洁社区服务中心！！', '', '0', '1271938632', '1271938632', '', '左林', '13675379144', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('652', '3', '343', '专业维修改造', '专业维修家庭照明线路，改造自来水管道（PVC，PPR）管道等，改造上下水管道，疏通下水道，水钻打空等，加工家庭防盗网（钢筋，不锈钢）价格合理，随叫随到。', '', '0', '1271938632', '1271938632', '', '王老师', '13173175132', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('653', '3', '343', '济宁便民疏通部', '李工为您提供以下服务:1.马桶:专业疏通各种型号马桶（抹布,清洁球,塑料）等各种软硬物质所造成的堵塞.2.地漏:专业疏通各种v型,S型拐弯的地漏,（因为装修掉进水泥,沙子或头发）等种原因所造成的堵塞.3.下水道:各类家庭,酒店,公司,学校等单位的下水道,各类管道,水斗,脸盆,浴缸,水池,地漏,马桶,小便池,阴沟,窑井,化粪池等各种下水管道疏通清理,污水管道疏通清理、维修各式水龙头,马桶水箱维修及更换零配件,阀门,浴缸漏渗水.水斗,上下水管改装等,专修电马桶.以及针对单位公司内的排污管道,化粪池,油污池进行清理等,有这方面棘手的事情,请找便民疏通。相信便民疏通会给您一个温馨的满意。', '', '0', '1271938632', '1271938632', '', '李工', '2661889', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('654', '3', '486', '昊宇碳纤维电暖器诚招代理商', '昊宇碳纤维电暖器最经济.最省钱的新世纪取暖换代产品一:产品简介碳纤维电暖器是采用世界最先进的发热体---高级碳纤维,运用最先进的技术加工制作而成的碳纤维电暖器。外壳采用航空战略铝合金材料抗氧化，美观大方.散热快。直接将电能转换为热能，是以辐射方式传热的新型高级取暖器。同时具有对人体起到远红外保健和辐射理疗作用，能是人感到春天般的温暖。二:产品特点安全环保经济节能热效率高舒适保健质量可靠用途广泛遥控操作 定时定温使用方便 。三:综合造价低，占用空间少。自动温度控制器控温。三个月采暖费用每平方平均大约为8—12元，使用寿命30年，保修三年，免费送货安装。四：是现代人们生活.取暖的最佳选择。换一种 采 暖 方 式 营造财 富 一生诚 招 加 盟 代 理 商山东省碳纤维工程研究中心监制山东潍坊巨能开发有限公司出品经营地址：济宁市健康路八中学校对过（天韵水暖）电话：315644415163796456', '', '0', '1271938632', '1271938632', '', '孙经理', '0537-3156444', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('655', '3', '343', '大华家政服务中心', '本中心竭诚为你空调，热水器，油烟机的安装，维修，[澳柯玛热水器厂家定点售后中心]。管道安装，维修北京英豪阳光太阳能济宁地区代理，2007年全国质量评比第三，网址；2007年太阳能热利用产品品牌推荐。2008年奥运热水承办单位，特诚招济宁地区代理。本中心批，零兼营，承接大，中小型冷，热水工程', '', '0', '1271938633', '1271938633', '', '陈小姐', '2172981', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('656', '3', '344', '济宁自己人家政服务有限公司', '您需要疏通维修服务吗，来找自己人吧，济宁自己人家政服务有限服务公司为您提供专业的疏通维修服务！！！', '', '0', '1271938633', '1271938633', '', '王先生', '2380833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('657', '3', '343', '老周管道维修疏通', '专业疏通各种管道，维修修理管道，清理化粪池，水转打孔，专业服务，价格合理。', '', '0', '1271938633', '1271938633', '', '马女士', '2860269', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('658', '3', '344', '济宁自己人家政服务有限公司', '济宁自己人家政服务有限公司为您提供专业的管道疏通维修！！！', '', '0', '1271938634', '1271938634', '', '王先生', '2380833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('659', '3', '343', '专业管道疏通', '本公司维修、安装、改道自来水管道，疏通下水道等，价格合理，服务周到，24小时为您服务！', '', '0', '1271938634', '1271938634', '', '马先生', '13518652230', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('660', '3', '343', '济宁自己人家政服务有限公司', '济宁自己人家政服务有限公司为您提供专业的疏通维修服务，您的小事，我们的大事，自己人为您办事！！！', '', '0', '1271938635', '1271938635', '', '王先生', '2380833', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('661', '3', '342', '晨阳管道安装维修公司', '晨阳管道安装维修公司承接大中小型管道安装，改上下水管道及管道疏通工程安装队技术强，备有大型台钻及各种水钻（承接各种大中小打孔工程），备有切割机，电镐，承接路面切割挖沟工程，您的满意就是我们服务的宗旨！', '', '0', '1271938635', '1271938635', '', '张经理', '13954778658', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('662', '3', '342', '专业维修改造', '专业维修安装家庭照明电路，安装维修改造自来水管道，（PVC PPR）管道等，价格合理，服务周到。', '', '0', '1271938635', '1271938635', '', '王老师', '13173175132', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('663', '3', '342', '老周专业疏通', '专业疏通、维修、改造各种管道。移装空调。专业技术，周到服务！！！', '', '0', '1271938635', '1271938635', '', '马女士', '2860269', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('664', '3', '342', '小张管道维修疏通', '本人有多年的管道维修经验，承接各种管道维修疏通，备有各种台钻及各种水钻.钻头，承接各种大中小打孔工程。', '', '0', '1271938635', '1271938635', '', '小张', '13954778658', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('665', '3', '343', '永兴锁业', '永兴锁业经济宁市工商局准许的专业开锁部，批发各类锁芯,上门专业更换各类锁芯,专业开启各种防盗门锁、民用门锁、车用锁、以及各种商用锁具，包括保险箱、电脑保险柜、档案柜、老板台锁、办公桌文具锁、密码箱、及各种锁具。专业上门更换各类锁芯，永兴锁业２４小时为您服务，必要时请您出示有关证件，谢谢配合，', '', '0', '1271938636', '1271938636', '', '李工', '0537-2970970', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('666', '3', '344', '便民疏通部', '本部从业疏通工作多年，专业机械疏通各种下水道、厨房、卫生间、马桶、地漏、浴盆、清理化粪池淤积堵塞；钻各种墙孔、地下室厕所堵漏、改装独立管道、改PP-R水管等业务，承接各类家庭,酒店,公司,学校等单位的下水道疏通,各类管道疏通,脸盆疏通,浴缸疏通,水池疏通,地漏疏通,马桶疏通,小便池疏通,等各种下水管道疏通清理,维修各式水龙头,马桶水箱,阀门,浴缸漏渗水.上下水管改装等,专修电马桶.以及针对单位公司内的排污管道,化粪池,油污池进行清理等.相信便民疏通部会给您一个温馨的满意．市内业务，１０分钟即到．', '', '0', '1271938637', '1271938637', '', '李工', '2661889', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('667', '3', '317', '个人招聘家教', '本科师范类学校毕业，主要教初二数学、英语。', '', '0', '1271940112', '1271940112', '', '王女士', '3163399', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('668', '3', '314', '免费高效学习方法培训', '超智慧全脑开发课程：超级记忆力（文字 数字 英语） 超级速度（全科）全脑高效学习 （全科）来到精英特，想学习不好都很难！招生对象：小学 初中 高中 报名电话：13563714260 15963733001免费体验 免费试听！常年招生 随到随学！', '', '0', '1271940113', '1271940113', '', '高波', '13563714260', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('669', '3', '314', '辅导好成绩·辅导好孩子', '艺考生文化课辅导·中考强化班·单科加强班·全科作业辅导·特色心理素质提升班·小班授课 专职师资，我们提升孩子的心理状态和素质，提高成绩 从心开始！优惠活动正在进行中！请家长给孩子一个心的明天吧！报名电话;15963733001 赵老师 13563714260 高老师', '', '0', '1271940113', '1271940113', '', '高波', '13563714260', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('670', '3', '315', '金苹果培训中心招聘专兼职老师', '初中英语数学、小学英语数学、少儿英语培训，专兼职均可，需长期工作，要求：有耐心，有诚信。有意者请电话联系。上班时间：周一至周六每晚3小时及周六、周日白天培训课，工资600-1500元.', '', '0', '1271940113', '1271940113', '', '女士', '13181316079', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('671', '3', '313', '个人招聘家教', '要求：女，年龄30岁以下，全日制本科师范类专业毕业，主要教初二英语、数学。', '', '0', '1271940113', '1271940113', '', '王女士', '3163399', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('672', '3', '311', '爱心大嫂专业提供月嫂，育儿嫂，家政', '您的家事我的大事，爱心大嫂家政服务造福千家万户。', '', '0', '1271940114', '1271940114', '', '李女士', '2779977', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('673', '3', '315', '在职初中数学教师求家教', '在职初中数学教师，10年教龄，教学经验丰富。', '', '0', '1271940114', '1271940114', '', '吴老师', '15898656626', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('674', '3', '311', '爱心大嫂——专业月嫂、专业育儿嫂、专业家政', '爱心大嫂家政服务，造福千家万户，您最贴心的家政服务。', '', '0', '1271940114', '1271940114', '', '李老师', '2779977', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('675', '3', '313', '宏发保洁公司服务千万家', '专业擦玻璃、擦地面、厨房、卫生间、墙面的清洁、地面打蜡。', '', '0', '1271940114', '1271940114', '', '常女士', '15910005114', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('676', '3', '313', '家教', '学习化学有困难的同学，请与我联系，以一对一的方式辅导你，保证辅导效果', '', '0', '1271940115', '1271940115', '', '马', '15953458426', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('677', '3', '311', '在职教师找家教', '本人毕业于曲阜师范大学，在职教师，有多年教学经验。', '', '0', '1271940115', '1271940115', '', '张老师', '15969976226', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('678', '3', '311', '辅导！让成绩提上来！', '精英特辅导中心对小学生·中学生·高中生开展了成绩提升班，每周各科突破班，解疑解惑班，基础班，预科班，加强班，心理班等特色培训辅导项目，让你不再为孩子的学习而担心！', '', '0', '1271940115', '1271940115', '', '高波', '13563714260', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('679', '3', '315', '09年优质小鳄鱼龟85元起价', '一：09年小鳄鱼100只龟苗4-6厘米,85元起价。二：09年自产黄缘盒龟苗508元一只。三：种龟大鳄鱼龟低价销售。', '', '0', '1271940115', '1271940115', '', '小珠', '15265732177', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('680', '3', '312', '英语家教辅导', '本人具有15年高中英语教学经验，现招收各阶段英语学习者，辅导方式一对一，本人亲自教授。', '', '0', '1271940116', '1271940116', '', '颜老师', '13625471416', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('681', '3', '313', '伯才教育—成绩提高就这么简单！', '济宁伯才家教服务中心由济宁学院（原济宁师专）本科毕业生创立，在济宁市工商局登记注册的合法咨询服务机构，开创咨询服务与辅导服务新模式，致力于打造济宁最具影响力家教咨询服务品牌。中心扎根仙营科技市场，邻济宁学院、曲阜师范大学、服务八方人士、专业为大学生专职教师介绍家教工作信息。为高中、初中、小学生及家长免费推荐优秀家教老师，现已拥有全国各大院校优秀大学生，各大学校教师资源数百名。欢迎通过现场、电话、网络等方式登记服务与需求信息。家教服务特色★ 个性化一对一上门辅导一对一推荐式免费登记★长期推荐，我中心不收家长、教师您一分钱！辅导模式★一对一咨询一对一定制一对一教育一对一管理辅导特训★1对1升学冲刺拨高特训辅导1对1夯实双基特训1对1初高中衔接课程特训1对1小初升特训精英6+1非常开心营集训24小时QQ：1278480300报名热线：138053727602312760网址：WWW.SDBOCAI.COM报名地址：济宁建设北路117号仙营居委东楼303室', '', '0', '1271940116', '1271940116', '', '李先生', '0537-2312760', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('682', '3', '314', '一切为了孩子—伯才家教', '济宁伯才家教服务中心由济宁学院（原济宁师专）本科毕业生创立，在济宁市工商局登记注册的合法咨询服务机构，开创咨询服务与辅导服务新模式，致力于打造济宁最具影响力家教咨询服务品牌。中心扎根仙营科技市场，邻济宁学院、曲阜师范大学、服务八方人士、专业为大学生专职教师介绍家教工作信息。为高中、初中、小学生及家长免费推荐优秀家教老师，现已拥有全国各大院校优秀大学生，各大学校教师资源数百名。欢迎通过现场、电话、网络等方式登记服务与需求信息。家教服务特色★ 个性化一对一上门辅导一对一推荐式免费登记★长期推荐，我中心不收家长、教师您一分钱！辅导模式★一对一咨询一对一定制一对一教育一对一管理辅导特训★1对1升学冲刺拨高特训辅导1对1夯实双基特训1对1初高中衔接课程特训1对1小初升特训精英6+1非常开心营集训24小时QQ：1278480300报名热线：138053727602312760报名地址：济宁建设北路117号仙营居委东楼303室', '', '0', '1271940117', '1271940117', '', '李先生', '0537-2312760', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('683', '3', '317', '批发太阳能，全最低价', '厂价批发，也单卖，安装，全市最低价，质量保证。型号：￠58X1.8米X15支管 16支管18管都有', '', '0', '1271940117', '1271940117', '', '房经理', '13285375920', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('684', '3', '312', '金苹果培训中心招聘老师', '初中英语数学、小学英语数学、少儿英语培训，专兼职均可，需长期工作，要求：有耐心，有诚信。有意者请电话联系。上班时间：周一至周六每晚3小时及周六、周日白天培训课，工资600-800元。', '', '0', '1271940117', '1271940117', '', '女士', '13181316079', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('685', '3', '316', '提供专业月嫂、专业育儿嫂、专业家政', '爱心大嫂家政服务，造福千家万户，您最佳的选择！', '', '0', '1271940117', '1271940117', '', '李女士', '2779977', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('686', '3', '315', '高效小学·初中学习班', '学生是不是整天学习努力但成绩就是上不去呢！你很累你很苦你很烦！家长是不是整天操碎了心，可结果却是不满意！你很累你很苦你很烦！精英特辅导中心为你解决这一切问题！我们采取好的学习方法，让孩子爱上学习，轻松学习！来到我们这里，我们可以给您：1直接提高记忆力10到20倍2直接提高阅读能力5-10倍3直接提升学习成绩1倍以上4节省很多的学习时间和金钱开设班：成绩基础巩固班（晚间全科辅导周末单科加强）结业课预科班（地理 生物 历史 物理 化学 数学 英语）全脑高效学习方法班（超级记忆 超级速读 高效学习 形象智慧图）暑假托管培训班（全科全部辅导综合能力扩展）来到精英特，想学习不好都很难！成长 成才 成功！招生对象：小学 初中 高中报名电话;13563714260 高老师15963733001 赵老师免费体验免费试听！常年招生随到随学！', '', '0', '1271940118', '1271940118', '', '高波', '13563714260', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('687', '3', '315', '金苹果培训中心招聘专兼职老师', '初中英语数学、小学英语数学、少儿英语培训，专兼职均可，需长期工作，要求：有耐心，有诚信。有意者请电话联系。上班时间：周一至周六每晚3小时及周六、周日白天培训课，工资600-1000元.', '', '0', '1271940118', '1271940118', '', '女士', '13181316079', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('688', '3', '312', '伯才家教，一切为了孩子！', '济宁伯才家教服务中心由济宁学院（原济宁师专）本科毕业生创立，在济宁市工商局登记注册的合法咨询服务机构，开创咨询服务与辅导服务新模式，致力于打造济宁最具影响力家教咨询服务品牌。中心扎根仙营科技市场，邻济宁学院、曲阜师范大学、服务八方人士、专业为大学生专职教师介绍家教工作信息。为高中、初中、小学生及家长免费推荐优秀家教老师，现已拥有全国各大院校优秀大学生，各大学校教师资源数百名。欢迎通过现场、电话、网络等方式登记服务与需求信息。家教服务特色★ 个性化一对一上门辅导一对一推荐式免费登记★长期推荐，我中心不收家长、教师您一分钱！辅导模式★一对一咨询一对一定制一对一教育一对一管理辅导特训★1对1升学冲刺拨高特训辅导1对1夯实双基特训1对1初高中衔接课程特训1对1小初升特训精英6+1非常开心营集训24小时QQ：1278480300报名热线：138053727602312760报名地址：济宁建设北路117号仙营居委东楼303室', '', '0', '1271940118', '1271940118', '', '李先生', '0537-2312760', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('689', '3', '315', '寒假生活哪里去？到李老师家学琵琶', '琵琶，这块富有灵性的木头，将成为你最忠实的“朋友”。技术、技巧磨练你的意志，旋律曲调陶冶你的情操。成名成家或是业余玩耍？功夫不负有心人，怀着一颗远离功利的平常心，你终将获得一份千金难买的精神财富。欢迎中小学学生，小朋友参加学习，你将获得毕生的财富！学琴时间：每月周六或周日学琴地点：龙泽苑收费标准：大课每月60元，小课每课100元。', '', '0', '1271940119', '1271940119', '', '李老师', '2838556', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('690', '3', '311', '在职教师找家教', '本人有着多年的教学经验!毕业于曲阜师范大学', '', '0', '1271940119', '1271940119', '', '张老师', '15969976226', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('691', '3', '314', '济宁自己人家政服务有限公司', '济宁自己人家政服务有限公司为您提供优质的家政服务，您的小事，我们的大事，自己人为您办事！！！', '', '0', '1271940119', '1271940119', '', '王先生', '2380833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('692', '3', '316', '济宁自己人家政服务有限公司', '您想找专业的家政服务员吗，来找自己人吧，济宁自己人家政服务有限公司为您提供专业的家政服务！！！', '', '0', '1271940120', '1271940120', '', '王先生', '2380833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('693', '3', '313', '爱心大嫂新春专业家庭保洁，火爆预约中！', '专业的保洁队伍，细心周到的服务，让您的家焕然一新。', '', '0', '1271940120', '1271940120', '', '李女士', '2779977', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('694', '3', '311', '低价转让适合学生小餐桌及学习辅导班使用的物品', '低价转让适合学生小餐桌及学习辅导班使用的物品学生长桌(课桌及餐桌两用)为09年7月份购置,9层多新,长为160厘米,宽为75厘米,高为65厘米,桌面及框架材质为防火材料,样式为中间隔开,两侧(都能坐人)各三个抽屉洞,桌体颜色为橡木色,美观大方实用,适合学生小餐桌及学习辅导班使用.另有一批移动白板和壁挂黑板及学生标准课桌及台式办公桌特低价处理.', '', '0', '1271940120', '1271940120', '', '李女士', '13371251860', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('695', '3', '311', '爱心大嫂提供专业月嫂、专业家政、专业保洁', '你的家事我的大事爱心大嫂家政服务造福千家万户预约电话：2779977', '', '0', '1271940120', '1271940120', '', '李女士', '2779977', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('696', '3', '316', '万邦家政专业打扫家庭卫生', '万邦家政10年家政老店专业打扫家庭卫生。', '', '0', '1271940120', '1271940120', '', '马女士', '2315721', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('697', '3', '312', '万邦家政', '专业打扫家庭、办公室、营业场所等室内、外的保洁。专业保洁，精致服务！！！', '', '0', '1271940121', '1271940121', '', '马女士', '2315721', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('698', '3', '314', '济宁自己人家政服务有限公司', '济宁自己人家政服务有限公司为您提供专业的家政服务，您的小事，我们的大事，自己人为您办事！！！', '', '0', '1271940121', '1271940121', '', '王先生', '2380833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('699', '3', '316', '三维画室招生进行中', '三维画室是一个青少年学习美术绘画的乐园。画室开办于1999年。多年来积累了一套独具特色简明有效的教学方法，针对不同起点的学生因材施教，得到了家长和学生们的广泛好评。近年来在美术特长班、美术考级、美术高考中、合格率达95‰以上。为广告公司、家装公司等有关行业培养了不少优秀美术设计师、并得到了社会的一致认可。执教老师多年来一直从事专业美术设计工作、舞台美术设计在全市具有较高的知名度和影响力。在美术教学实踐中广泛地了解和掌握学生们在学画过程中所出现的种种问题、并终结了一套针对考生的强化教学方法、使他们在学画过程中少走一些弯路、启发学生的艺术灵感。让学生在本画室学习期间，得到实质性的提高。最后真诚地希望每一位热爱美术的学生来到三维画室，帮助你实现你的理想和愿望。地址：济宁市中区银座东邻电话：15253736887QQ：1136970871', '', '0', '1271940121', '1271940121', '', '冯老师', '15253736887', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('700', '3', '316', '济宁自己人家政服务有限公司', '济宁自己人家政服有限公司为您提供优质的家政服务，您的小事，我们的大事，自己人为您办事！！！', '', '0', '1271940121', '1271940121', '', '王先生', '2380833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('701', '3', '315', '个人招聘家教', '要求30岁以下女性，大学本科以上师范类学校毕业，有教学经验者优先考虑。', '', '0', '1271940122', '1271940122', '', '王女士', '3163399', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('702', '3', '313', '餐桌招聘女辅导老师', '本餐桌招聘辅导女教师。要求；师范理科毕业生。[ 22-40岁] .辅导小学及初中学生家庭作业.小学数学 英语.初中数学 英语 物理 化学.工作时间;上午10点-2;00 下午4;30-8;30待遇;辅导老师待遇月薪800---1200元.签订常年合同。有双休,国家法定节假日放假休息.提午餐及晚餐.试用期一个月,试用期工资500元.联系电话;131767999622109962', '', '0', '1271940122', '1271940122', '', '刘老师', '13176799962', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('703', '3', '313', '济宁自己人家政服务有限公司', '您想找专业的家政服务员吗，来找自己人吧，济宁自己人家政服务有限公司为您提供专业的家政服务，您的小事，我们的大事，自己人为您办事！！！', '', '0', '1271940122', '1271940122', '', '王先生', '2380833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('704', '3', '316', '酒后代驾', '本人有驾龄6年，可提供酒后代驾服务，计时收费。', '', '0', '1271940122', '1271940122', '', '郑女士', '2602456', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('705', '3', '317', '济宁嘉园中介', '租房，售房，家政，保洁。欢迎咨询：0537-2124777', '', '0', '1271940123', '1271940123', '', '周先生', '150547309902124777', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('706', '3', '313', '育贤教育培训怒中心', '育贤教育培训中心育贤教育培训中心是专业从事中小学各科辅导及培训的正规教学机构，常年开设中小学生全课程的晚间及周末个性化辅导。另外，本中心常年招收中小学各年级各科预科班，并向家长推荐优秀教师或家教经验丰富的在校大学生上门进行家教辅导。欢迎各位家长到本中心考察监督。报名地址：苏果超市对过九巨龙大市场内瑞盛楼405室注：暑期预科班每年7月1日开班，其他各班随到随学。本中心常年开设：类别    开设班级    上课时间辅导类    晚间作业辅导讲解班    每周一至周五晚提高类    初一初二数学英语    周六周日    初三数理化英        高一高二数理化英    应考类    初四各科冲刺    每天晚上    高三各科冲刺    兴趣类    小学初中奥数班    周六周日    新概念英语班', '', '0', '1271940123', '1271940123', '', '郭老师', '13563774507', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('707', '3', '314', '金苹果培训中心招聘老师', '初中英语数学、小学英语数学、少儿英语培训，专兼职均可，需长期工作，要求：有耐心，有诚信。有意者请电话联系。上班时间：周一至周六每晚3小时及周六、周日白天培训课，工资800-1000元', '', '0', '1271940124', '1271940124', '', '女士', '13181316079', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('708', '3', '312', '专业培训跆拳道/截拳道/散打/泰拳', '济宁市李小龙武道馆专业培训跆拳道/截拳道/散打/泰拳，详细请电话联系！', '', '0', '1271940124', '1271940124', '', '杨老师', '15863746288', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('709', '3', '312', '济宁自己人家政服务有限公司', '您需要专业的家政服务人员吗？来找自己人吧，济宁自己人家政服务有限公司为您提供专业的家政服务！您的小事， 我们的大事，自己人为您办事！！！', '', '0', '1271940124', '1271940124', '', '王先生', '2380833', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('710', '3', '317', '济宁自己人家政服务有限公司', '济宁自己人家政服务有限公司为您提供最专业的家政家教服务！！！您的小事，我们的大事，自己人为您办事！！！', '', '0', '1271940124', '1271940124', '', '王先生', '2380833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('711', '3', '315', '月嫂、家政、专业保洁火热预约中', '爱心大嫂家政服务是经工商部门注册的规范化，专业化，科学化的服务中心，爱心大嫂家政服务把爱送进千家万户。', '', '0', '1271940124', '1271940124', '', '李女士', '2779977', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('712', '3', '317', '济宁自己人家政服务有限公司', '济宁自己人家政公司为您提供专业的家政服务，您的小事，我们的大事，自己人为您办事！！', '', '0', '1271940125', '1271940125', '', '王先生', '2380833', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('713', '3', '312', '济宁自己人家政服务有限公司', '济宁自己人家政服务有限公司', '', '0', '1271940125', '1271940125', '', '王先生', '2380833', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('714', '3', '315', '万邦家政', '万邦家政，专业保洁、保姆。十年家政经验，专业细致服务！！！', '', '0', '1271940125', '1271940125', '', '马女士', '2860269', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('715', '3', '313', '济宁自己人家政服务有限公司', '济宁自己人家政服务有限公司是经劳动部门许可，由工商部门注册。是一家专业从事家庭服务具独立法人资格的大型品牌企业,是服务项目最广的家政公司', '', '0', '1271940126', '1271940126', '', '王先生', '2380833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('716', '3', '314', '济宁自己人家政服务有限公司', '济宁自己人家政服务有限公司是鲁西南规模最大，服务项目最全面的家政服务公司，公司下属两个培训基地，一个家电维修部，六个线路维修部，公司有各类员工五十多个，保姆，月嫂，等家庭服务员有很多都是省市级的劳动模范。公司所有人员全部经过严格的技术培训。服务项目涉及到您工作生活的方方面面，具体项目如下：家庭打扫，开荒，陪护老人，陪护病人，儿童看护，月嫂，保姆，接送学生，代购代销，管道疏通，油烟机清洗，家教服务，刷漆服务，宠物照顾，汽车代驾，线路维修，有线维修，家电维修，木工，瓦工，劳务输出，职业中介，房屋中介，代发传单，快递等联系电话238083313280097585QQ36213048公司网站www.zjr168.zw78.com', '', '0', '1271940126', '1271940126', '', '陈先生', '2380833', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('717', '3', '311', '在职教师寻家教', '本人毕业于曲阜师范大学、有着多年教学经验', '', '0', '1271940127', '1271940127', '', '张老师', '15969976226', '', '127.0.0.1', '4', '1');
INSERT INTO `f_info` VALUES ('718', '3', '315', '济宁浩宇保洁公司', '济宁浩宇保洁公司，主要以家庭保洁，单位保洁，托管保洁，地毯，大理石，玻璃，电路维修，厂房维修，制作不锈钢，防护网等服务项目，公司总经理及全体员工24小时恭候你的光临！真诚用心为你服务', '', '0', '1271940128', '1271940128', '', '孙先生', '13562775013', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('719', '3', '314', '绿之源家庭清洗专家', '中国专业家庭清洗领先品牌全国连锁，清洗、杀菌消毒、除异味一次完成。专业免拆清洗油烟机、电脑、引水机、微波炉、空调、洗衣机、太阳能热水器、电热水器清洗，家庭保洁。完善的数据库客户管理系统，方便管理每一位服务客户，及时反馈服务信息，给所有家庭带来最贴心的服务。中国全运会指定电器清洗服务机构，网址：http://www.okqingxi.com', '', '0', '1271940129', '1271940129', '', '赵先生', '13954749233', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('720', '3', '317', '绿之源家庭清洗专家', '中国专业家庭清洗领先品牌全国连锁，清洗、杀菌消毒、除异味一次完成。专业免拆清洗油烟机、电脑、引水机、微波炉、空调、洗衣机、太阳能热水器、电热水器清洗，家庭保洁。完善的数据库客户管理系统，方便管理每一位服务客户，及时反馈服务信息，给所有家庭带来最贴心的服务。网址：http://www.okqingxi.com', '', '0', '1271940129', '1271940129', '', '赵先生', '13954749233', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('721', '3', '312', '小学家教辅导', '重点小学在职优秀教师周末家教辅导', '', '0', '1271940130', '1271940130', '', '王老师', '15854713107', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('722', '3', '317', '银都家政公司', '租房 售房 评估 贷款 过户 搬家 保洁 空调移机 为您免费发布各种信息电话2662810 手机15092662788 联系人 孟经理', '', '0', '1271940131', '1271940131', '', '孟老师', '2662810', '', '127.0.0.1', '5', '1');
INSERT INTO `f_info` VALUES ('723', '3', '592', '济宁市中区钢琴培训班诚招合作伙伴', '有钢琴等级证书，有一定的钢琴培训经验，有一定资金。底薪1000元。', '', '0', '1271946358', '1271946358', '', '陈先生', '13853730607', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('724', '3', '510', '美的微锅炉招聘驻县业务员', '年龄25-35岁，有业务经验者优先，底薪1000元加提成。', '', '0', '1271946359', '1271946359', '', '刘经理', '0537-2022098', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('725', '3', '595', '中国平安金融集体（世界500强集团）高薪诚聘', '业务精英/储备干部：25-45岁，高中以上学历，月薪3000元以上<br />经理助理/人事专员：25-35岁，高中以上学历，月薪2000元以上<br />电话回访员：年龄25岁以下，工资面议。<br />有强烈的事业心、责任感和团队合作精神，一经录用五险一金，待遇优厚，能力优秀者工资可达上万元。', '', '0', '1271946359', '1271946359', '', '仲女士', '15020765698', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('726', '3', '606', '诚聘办公文员', '有2年以上工作经验，计算机或相关专业毕业，月薪800-1500元。', '', '0', '1271946359', '1271946359', '', '刘经理', '3209796', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('727', '3', '527', '招聘普工、高级钳工', '招聘普工20名，月薪：800-1300元，招聘高级钳工5名，月薪：1500-1800元。', '', '0', '1271946360', '1271946360', '', '魏经理', '15653717888', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('728', '3', '606', '高薪急聘小挖掘机驾驶员', '有工作经验，月薪2400元包吃住。', '', '0', '1271946360', '1271946360', '', '陈先生', '13686377002', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('729', '3', '587', '如家酒店连锁诚聘精英', '总经理助理一名，年龄在25-35岁，从事星级酒店3年以上，具备前厅、销售及客房管理经验者优先，月薪2900元。<br /><br />值班经理2名，年龄22-30岁，从事星级酒店两年以上，具备前厅、客房、餐厅管理经验者优先，月薪1800元。<br /><br />会计1名，具备会计证及会计电算化证，具有酒店会计或出纳经验者优先，年龄在25岁-35岁，月薪1500元。<br /><br />餐厅服务员2名，男女不限，月薪900元。<br /><br />工程人员2名，具备电工证，年龄45岁以下，从事过酒店工作者优先，月薪1300元。<br /><br />客房服务人员3名，年龄45岁以下，能吃苦耐劳，月薪900元。', '', '0', '1271946361', '1271946361', '', '冯经理', '13863716852', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('730', '3', '548', '招聘作文教师', '师范院校大专以上学历，汉语言文学教育专业，有教师资格证书，普通话标准；个人心胸宽广，热爱教育事业，有责任心，有亲和力，有教育经验者优先。底薪800元加课时费。', '', '0', '1271946361', '1271946361', '', '刘女士', '13515370575', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('731', '3', '516', '济宁天易住房置业担保有限公司诚聘小车司机', '要求：20-25岁，家住济宁市中区，2年驾龄，月薪：800元以上。', '', '0', '1271946363', '1271946363', '', '荆部长', '13639401797', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('732', '3', '527', '秀水城瑞丽鞋店招聘营业员', '年龄：18-28岁，月薪：1000元以上。', '', '0', '1271946363', '1271946363', '', '赵小姐', '15963703637', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('733', '3', '342', '济宁自己人家政服务有限公司', '济宁自己人家政服务有限公司 ', '', '0', '1271981400', '1271981400', '', '', '13173170008', '', '127.0.0.1', '1', '2');
INSERT INTO `f_info` VALUES ('734', '3', '60', '优秀男士征婚', '最好不带孩子或带一女孩，真诚征婚，非诚勿扰！', '', '0', '1271983213', '1271983213', '', '', '13145375697', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('735', '3', '61', '优秀女孩真诚征婚', '有缘千里来相会，无缘对面不相识。我相信缘份，但不表示我不去努力！本人女24岁，身高1米7，私营企业工作。找一位成熟稳重，有责任心的男朋友。要求24-28，身高1米75以上，长相一般即可。有固定工作，中区或城边。本人真诚征婚。注：离婚者或短婚者勿扰。非诚者勿扰！QQ：1090010811邮箱：jn1090010811@163.com', '', '0', '1271984047', '1271984047', '', 'jninfo', '1090010811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('736', '3', '59', '剩男征婚', '本人诚实可靠 善解人意 心地善良 有一次不幸的婚姻 茫茫人海中寻找有缘的你', '', '0', '1271984047', '1271984047', '', '周先生', '15553738969', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('737', '3', '59', '好男孩征婚', '不真诚的别打扰我，谢谢。本人中区，有房有工作，有个姐姐，无负担。想尽快找到适合自己的女人，结束单身。', '', '0', '1271984047', '1271984047', '', '男生', '15264738182', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('738', '3', '61', '征婚', '本人未婚，重点大学毕业，事业单位，非诚勿扰！', '', '0', '1271984048', '1271984048', '', '先生', '13792385366', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('739', '3', '59', '大龄女征婚', '不知不觉到了这个年龄，如果您是一位有责任心、有事业心和上进心的未婚男士，请致电。离异者勿扰！', '', '0', '1271984048', '1271984048', '', '赵小姐', '13210798001', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('740', '3', '59', '男士征婚', '本人退伍军人，党员，离异，孩子归对方，本人在电力系统工作（综合办公室），女士婚史不限。<br>', '', '0', '1271984049', '1271984049', '', '刘先生', '13176753287', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('741', '3', '61', '中区帅哥征婚', '我是中区阳光帅气男孩，21岁，中区有房，收入稳定，想认识有缘女孩为伴', '', '0', '1271984049', '1271984049', '', '济宁男生', '15054880005', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('742', '3', '60', '男士征婚', '我相信缘分 真诚等待你的到来相信我会给你带来更多的快乐', '', '0', '1271984049', '1271984049', '', 'jninfo', '13145376517', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('743', '3', '60', '男士征婚', '应征者未婚或者离异带一女孩可以考虑，QQ：987557573，不诚勿扰', '', '0', '1271984050', '1271984050', '', '刘先生', '13176753287', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('744', '3', '61', '非诚勿扰之女士征婚', '本人是75年12月生人，未婚，户籍、工作、父母等均在兖州，虽称不上是仇人眼里出西施者，也算是身材均称，长相顺眼，体重49公斤加减两公斤，身体和心理都很健康，历史清白。以前唯一的一次感情经历留下了有点缺少安全感的后遗症，真诚期待那个能有耐心，让我产生足够信任感的真命天子的出现，本人生性驽钝面对感情总是慢别人一拍，单位时间内一颗心，只能全情投入到一份感情中去。做不到长袖善舞，因此条件不符者及善于同时脚踏两只或多只船的那些口是心非、三心二意、言而无信的高手们，请高抬贵手，尊重彼此的时间和精力（不反对确定之前的筛选）。希望你是个身心健康，真诚正直，心地善良的人，性格开朗幽默而又温柔可爱，懂我，懂得珍惜，能让我喜欢跟你呆在一起，喜欢听到你的声音，而不在意内容，能让我愿意为之改变，为之付出。彼此内心的温暖是最重要的，必需承认我是个即物质又现实的人，不要跟我讲以后你会对我怎样怎样，你能带给我什么什么，你能让我过上什么什么样的生活之类的废话。我要的是现在，而不是美丽的虚幻蓝图，如果你有了更理想的人选，请你务必及时告知我，不要让我一直像个傻子一样还对你一往情深。这也是我对自己的要求，尊重彼此的人格和自尊是最基本的为人素养。我希望我们彼此深爱而不是互相伤害。符合条件的真心人请先以短信形式或发邮件至564231811@qq.com（注明信息港）简单介绍下自己的个人情况（包括地区、婚姻状况、年龄、身高、学历、工作、收入、性格、家庭状况）等大致了解后再决定是否电联。本人情况全部属实，也希望得到完全真实的回应，条件不符者，非诚勿扰。', '', '0', '1271984050', '1271984050', '', '梁女士', '13053755503', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('745', '3', '60', '有爱心的男人征婚', '本人离异，带男孩、要求对方：未婚、短婚、条件好的带女孩也可以，有意者请联系手机或QQ：1159582310，非诚请绕行。', '', '0', '1271984050', '1271984050', '', '王先生', '15563745910', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('746', '3', '61', '男士征婚', '', '', '0', '1271984051', '1271984051', '', '李先生', '13205376710', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('747', '3', '59', '征婚', '本人男，身体健康，无不良嗜好，无家庭负担，长相一般以上，热爱生活，请拨打手机或发短信。18753799890QQ;1316854671非诚勿扰、中介勿扰！', '', '0', '1271984051', '1271984051', '', '孙先生', '2367291', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('748', '3', '61', '成熟男士真诚征婚非诚勿扰！', '本人：男，41岁，济宁中区人氏，身高：1、71米，体重：72公斤，身心健康。毕业于福州大学(本科)，形象好，气质佳。现任济宁市某公司经理之职，主营：(煤炭业)，年收入：8万元左右,车房齐备。注重文化与科学知识的修养，集文化.、气质、才华于一身。工作中积极进取，精益求精，极具责任感和事业心。懂情感，高品味，为人真诚，乐于助人，富有正义感和同情心。爱好广泛：（文艺、文学创作、书法、绘画、摄影、新闻解读、围棋、体育鉴赏等）。追寻一句格言：（在艺术中感受生活）。因种种原委，恋情屡遭变故，至今仍单身未婚，从未步入过婚礼殿堂的我很想成个家！一个充满温馨的港湾。故而，诚寻一位条件相当、身心健康、秀外慧中、勤劳善良、通情达理、富有爱心的有缘女士结为连理，携手共创美好的家园。相信缘分，婚否不限，有意者敬请来电示意。真诚期待！非诚勿扰！<br><br> 联系电话 ：15954718398<br>', '', '0', '1271984052', '1271984052', '', '王先生', '15954718398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('749', '3', '60', '28优秀男交女友', '男，28.退伍军人，济宁国企工作。市区有房，家庭无负担，身体健康，无不良嗜好，欲结交温柔善良的女士为伴。', '', '0', '1271984052', '1271984052', '', '王先生', '15092732480', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('750', '3', '61', '征婚', 'QQ：987557573', '', '0', '1271984052', '1271984052', '', '刘先生', '13176753287', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('751', '3', '59', '诚觅女友', '只要你是真诚的短信息联系', '', '0', '1271984053', '1271984053', '', '余先生', '15020716478', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('752', '3', '60', '给你我全新的世界（品味女士诚觅有缘伴侣）', '本人单身未育，年轻贤淑，端庄清雅，作风正派，家境好，重情爱<br><br>家。喜欢文学音乐。欲寻条件相仿，开朗随和，有涵养，明事理的男<br><br>士为终生伴侣，打算结婚者优先考虑。【条件好带一孩子也可】<br><br>【相约时请带证件证实身份。电话发信息13455596400，<br><br>时请注明济宁信息港。否者免聊】。<br><br>无聊者或者有家庭者请勿扰！<br><br><br><br>写给最魅力的你<br><br>上帝为了造就一部杰作<br><br>特意在你我之间洒下了<br><br>万水千山的磨难<br><br>和沁人心脾的玫瑰园<br><br><br>为嗅到永久的花香<br><br>我们开始了心痛旅途<br><br><br>一丝丝的牵挂<br><br>是黑夜里明月<br><br>一丝丝的想念<br><br>是疲惫的衾被<br><br><br>等待也是幸福<br><br>灵魂不再孤独<br><br>流失的岁月里<br><br>因为有了理想<br><br>一个人才这么美好<br><br>任凭时空的遥远<br><br>燃烧的依然是<br><br>心与心碰撞的火花<br><br><br><br>想象你那温雅的笑颜<br><br>将我所有的弱点<br><br>化为最亮丽的美景<br><br>感恩春天让我<br><br>拂去你心灵的伤痕<br><br>生命的旅途中<br><br>有你相伴<br><br>倍加珍惜你<br><br>因为这是容易受伤的心<br><br>也是梅雪意志心的期盼<br><br><br><br>渴望眼睛与眼睛的重逢<br><br>你的关注点燃生命的篝火<br><br>用真情抒写爱的篇章<br><br>祝福心愿一样的我们<br><br>在释怀中不期而遇<br><br>封存的最美的玫瑰花园<br><br>是为婚姻中最美的你飘香<br>', '', '0', '1271984053', '1271984053', '', '月上柳梢', '13455596400', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('753', '3', '60', '女士真诚征婚', '要求有正式工作，有住房、人品好、非诚勿扰！', '', '0', '1271984054', '1271984054', '', '女士', '13012651501', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('754', '3', '60', '好男人征婚', '加我Q1041736894，男，帅气，有工作有事业，中区有房，无负担，', '', '0', '1271984054', '1271984054', '', '男', '15054860707', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('755', '3', '59', '女士征婚', '本人离异未带孩子（一男孩归对方），性格温和，心地善良，端正重感情，欲寻找身体健康，有房有经济基础，有责任心生活稳定的中区男士，条件不符合者勿扰，有意者请联系手机：15666175871', '', '0', '1271984055', '1271984055', '', '赵女士', '2335179', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('756', '3', '59', '优秀女征未婚男士', '本人未婚，温柔漂亮、气质佳、身体健康，作风正派，重情爱家、预寻求，身体健康，有责任心，上进心，有房，有经济基础，身高177-185之间，体重70-80公斤，长相一般以上，对感情专一，成熟稳重的未婚男士为终生伴侣。做生意者优先考虑，真诚想结婚的人进，离异者勿扰，相约时请携带身份证，证实身份，条件不符者、不真诚者、或有家庭者勿扰。', '', '0', '1271984055', '1271984055', '', '于女士', '13290307759', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('757', '3', '61', '女士征婚', '本人离异，未带孩子（一男孩归对方）性格温和、心地善良，端正重感情，预寻求身体健康、有房有经济基础、有责任心、生活稳定的男士，条件不符合者、不真诚者勿扰，有意者请联系手机：15666175871（不要打座机打手机即可）', '', '0', '1271984055', '1271984055', '', '赵女士', '2335179', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('758', '3', '59', '诚觅40男人成家', '本人离异未带孩子（一女孩归对方)性格温和、心地善良、端庄大方、重感情。觅身体健康有房有经济基础有责任心生活稳定的中区男士。条件不符者勿扰！有意者请方便时最好下午6点后或礼拜天电话联系 <br>', '', '0', '1271984055', '1271984055', '', '孙女士', '15563495781', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('759', '3', '59', '真诚男士征婚', '本人大学毕业自组创业失败，女友弃之而去，欲寻觅35岁以下，家境良好，身体健康的女士为伴，非诚勿扰，谢绝中介！', '', '0', '1271984056', '1271984056', '', '郝先生', '13176175278', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('760', '3', '60', '26岁胖女孩真心寻觅', '我是26岁的胖女孩(体重80公斤),心地善良,农村长大,在济宁事业单位招聘制员工,找一位在济宁有住房,心地善良有责任心的男士,婚史不限', '', '0', '1271984056', '1271984056', '', '杨小姐', '15154709219', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('761', '3', '61', '优秀男士真诚征婚 ，30岁，未婚，个体QQ：10161583', '', '', '0', '1271984057', '1271984057', '', '赵先生', '13853748393', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('762', '3', '61', '中年男士征婚', '本人离异，不带孩子（男孩归对方）。高级职称，国企内退，在市区经营自己一小型私企多年。寻市区企事业单位正式工作或有一定经济基础的女士，不带孩子或带一女孩也可，有意者请手机短信联系，非诚勿扰。', '', '0', '1271984058', '1271984058', '', '先生', '15564702036', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('763', '3', '60', '嘉祥成功男士征婚', '本人离异，有子女，寻找温柔、善良、踏实，有修养的女士共享家的温馨。所在地区无要求。<br>本人事业单位兼经商。<br>QQ：1370458989', '', '0', '1271984058', '1271984058', '', '任先生', '13176799365', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('764', '3', '60', '男征女', '本人离异，有意者手机联系。', '', '0', '1271984059', '1271984059', '', '韩先生', '13176769504', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('765', '3', '60', '女孩征婚', '居家型女孩，工作稳定，温柔不乏智慧，善良不失个性，爱家庭，爱生活，爱自已，真诚征婚，非诚勿扰！', '', '0', '1271984059', '1271984059', '', '张女士', '2210982', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('766', '3', '60', '年轻公务员征婚交友', '本人27岁,83年出生,本科学历,公务员,身高1.80米,体重73公斤,帅气,热爱生活,爱好广泛,期待您回音,征婚交友均可.', '', '0', '1271984060', '1271984060', '', '王先生', '13176755210', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('767', '3', '61', '为爱征婚', '本人在大型国企工作,未婚,人品性格好,长相一般,希望在此找到有缘的你.本人电话:15092648276QQ:1023934665<br>本人真城征婚,骗子勿扰, 中介勿扰.', '', '0', '1271984061', '1271984061', '', '先生', '15092648276', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('768', '3', '59', '男士征婚 非诚勿扰', '非诚勿扰', '', '0', '1271984061', '1271984061', '', '先生', '13275371430', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('769', '3', '60', '优秀女征婚', '如果你是有责任心，事业心，上进心有房的未婚男士请致电，离异者勿扰', '', '0', '1271984062', '1271984062', '', '王女士', '15563172334', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('770', '3', '60', '征婚', '本人未婚，重点大学毕业，兖州事业单位，真心寻找有缘人', '', '0', '1271984062', '1271984062', '', '先生', '13792385366', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('771', '3', '59', '为离婚男公务员征婚', '我朋友，男，47岁，1.72米，大学文化，有房，月收入3800元，离弃，有一14岁男孩，某政法机关正科级干部，诚实善良、开朗大方、善解人意、责任心强；欲寻：30-40岁，有固定工作，高中以上文化，月收入千元以上，身边无子女，贤惠、漂亮的女士为伴。有意者请与他本人联系。他本人的手机号码为15898658960', '', '0', '1271984062', '1271984062', '', '徐先生', '15898658960', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('772', '3', '60', '征婚', '', '', '0', '1271984063', '1271984063', '', '李女士', '2871235', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('773', '3', '59', '征婚', '手机号15253708710，有事请手机联系！', '', '0', '1271984063', '1271984063', '', '张先生', '2620567', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('774', '3', '60', '济宁鹊桥会“以歌会友”单身派对火热报名中...', '中国鹊桥会-全国妇联中国妇女儿童事业发展中心“专业婚介”<br>济宁鹊桥会“以歌会友”单身派对火热报名中...<br>年龄：女28-40岁男30岁-45岁<br>时间：2010年3月21日晚上7点举行<br>地点：芭提雅<br>报名时间：3月5日--3月19日<br>证件：本人携带身份证 户口 学历证明 离异证原件及复印件<br><br>目的：为没有时间交友的您搭建一个结交异性的平台，让您在愉快的游戏和美丽的歌声中与“Ta”自然牵手，减少单纯相亲的尴尬场面。<br>朋友！您要是单身就来参加我们济宁鹊桥会单身派对吧！您只要来就有找到“Ta”的希望啊。给自己一次机会、也给“Ta”一次机会啊。赶快行动吧！青春不常在 抓紧谈恋爱。时间不等人啊！<br>● 中国鹊桥会济宁总站网站：http://jns.qqhui.com/<br>●（活动照片：http://pp.sohu.com/photosetview-34641641-26019073.html）<br>报名热线：26051772605877QQ:908210631616799685', '', '0', '1271984063', '1271984063', '', '王老师张老师', '26051772605877', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('775', '3', '60', '38岁女士征婚（征中区男士）', '本人有一女孩归男方，征中区范围内男士。人品正派，无不良爱好。QQ号码：642535095。手机：13153779160。', '', '0', '1271984064', '1271984064', '', '刘女士', '13153779160', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('776', '3', '60', '征婚', '本人离异带一女孩，希望能找到对孩子好的女性，最好是没结婚或短婚没孩子。', '', '0', '1271984064', '1271984064', '', '林先生', '15550729690', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('777', '3', '60', '暮然回首（女士征婚）', '本人人品好，性情温和，举止大方，身材高挑。要求对方：人品好、诚实稳重，有上进心，无不良嗜好，未婚或离异无子，无结婚打算者勿扰！无工作者勿扰！有意者请先短信联系。', '', '0', '1271984066', '1271984066', '', '宋女士', '13176759836', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('778', '3', '61', '女士征婚', '本人温柔大方、相貌端正、有固定工作，带一女孩。寻找事、企单位有固定收入、相貌端正、身体健康、无不良喜好男士。非诚勿扰，有意者加QQ：1137712491联系。', '', '0', '1271984066', '1271984066', '', '女士', '2205345', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('779', '3', '61', '离异男士真诚征婚', '本人在市直机关工作，有一3岁女孩，想找一位能够勤俭持家，孝顺父母的女士为伴，有意者可发短信或者QQ：20328657.', '', '0', '1271984067', '1271984067', '', '先生', '13012930722', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('780', '3', '60', '善良美丽女征婚', '有房两套,善良美丽,善解人意,带一13岁男孩,无负担.', '', '0', '1271984067', '1271984067', '', '张女士', '13355164771', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('781', '3', '61', '优秀女征婚', '不知不觉到了这个年龄想通过这个平台找到适合自己的另一半，希望我们从相识到相知到相互信任到相互依赖共度此生，非诚勿扰！', '', '0', '1271984067', '1271984067', '', '王女士', '15564702926', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('782', '3', '59', '男征婚', '', '', '0', '1271984068', '1271984068', '', '张先生', '15563744969', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('783', '3', '61', '33男士征婚', '本人离婚带一8岁女儿，中区有房。诚觅善良稳重能持家过日子孝敬老人、最好不带孩子的中区或12县区女士为伴。非诚勿扰！', '', '0', '1271984068', '1271984068', '', '张先生', '15063749997', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('784', '3', '59', '优秀女孩真诚征婚', '现寻觅23-26岁未婚男士为伴，有固定工作，有事业心，长相一般以上，非诚勿扰！', '', '0', '1271984069', '1271984069', '', '李女士', '15666755943', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('785', '3', '61', '47岁男士征婚', '一切隋愿，带女孩最好。', '', '0', '1271984069', '1271984069', '', '孙先生', '2863779', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('786', '3', '60', '离异女士征婚', '要求：有稳定工作，有上进心，不带孩子，非诚勿扰！！！', '', '0', '1271984069', '1271984069', '', '女士', '15553756406', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('787', '3', '60', '征有爱心的女性', '未婚或短婚带女孩的女性，本人离异，带男孩，要求对方温柔，贤慧，爱家，顾家，有涵养。<br>QQ:1159582310', '', '0', '1271984070', '1271984070', '', '王先生', '15563745910', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('788', '3', '59', '寻觅灵魂伴侣（女士征婚）', '本人清雅贤淑，青春亮丽，短婚未育，事业单位内退，传统重情，<br><br>相信飞越冰雪的梅魂更有内涵，飞越山巅的翅膀更加矫健。你若能<br><br>奉献你阳光的问候，我会还你山清水秀奇丽春常在的境界。<br><br>注重内在的共鸣的思想交流。寻觅随和体贴，明事理，辩是非，相互<br><br>扶持，重情正派，为真善守候的灵魂伴侣。区域不限。有意者请在<br><br>13455596400电话短信上，或者qq1063022091上留下个人资料,<br><br>情况不详者，拒绝回信息。<br><br>【相约时请带证件证实各自身份】，【有家庭者请勿打扰】<br><br>前缘今生 <br><br>人若能转世，<br><br>那么，<br><br>我们前生曾经是什么？ <br><br><br>我若曾是江南采莲的女子，<br><br>你必是我纤腕下错过的那一朵。<br><br>你若曾是那个逃学的顽童，<br><br>我必是从你袋中掉落的那颗崭新的弹珠，<br><br>在路旁草丛里，<br><br>目送你毫不知情地远去。<br><br> <br>你若曾是面壁的高僧，<br><br>我必是殿前的那一炷香，<br><br>陪伴过你一段静穆的时光。<br><br><br>因此，<br><br>今生相逢。<br><br>经历沧海桑田的时空，<br><br>凤凰涅盘，<br><br>其神沁人心脾，<br><br>其神动人心魄。<br><br>凡尘两忘，<br><br>宛如仙境。', '', '0', '1271984071', '1271984071', '', '月上柳梢', '13455596400', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('789', '3', '60', '真诚征婚女征男', '要求对方诚实稳重，有上进心，长相一般就行，本人长相一般，找美女的就不要麻烦了！其他一切随缘！', '', '0', '1271984071', '1271984071', '', 'jninfo', '15153790849', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('790', '3', '59', '老年丧偶觅真诚男士', '更多信息查询请拨打：21700092135566<br>女 52岁 1.62米 中专丧偶 国企退休 女孩已经成家 有房 气质佳<br>择：52-60岁，1.7以上，有退休，有房的中区男士，丧偶最好<br>女 52岁 1.6米 大专离婚事业单位 孩子已结婚 有房<br>择：52-58岁，1.7以上，有固定工作，有房，最好丧偶的男士<br>女：50岁1.6米 中专离婚 事业但还 孩子结婚 有房 <br>择：50-60岁，1.7以上，有房，有退休，最好子女已成家<br>女 60岁1.58米 丧偶 国企退休孩子成家 有房 <br>择：60-68岁，1.7以上，有退休，身体健康的男士<br><br> 喜洋洋婚介是经济宁市工商局、民政局批准，成立于1998年5月。是济宁开办最早、信息量最大、信誉最好、知名度最高、规模最大的专业婚介机构。 征婚信息量达2万余人，是你婚姻成功的保证。成就婚姻，当然首选合法、正规、实力雄厚的婚介机构。<br>', '', '0', '1271984071', '1271984071', '', '田老师', '21700092135566', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('791', '3', '61', '女士征婚', '本人性格开朗，诚实稳重大方，无负担', '', '0', '1271984072', '1271984072', '', '女士', '13053761207', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('792', '3', '61', '32岁男士公务员征婚', '查询更多信息请拨打：21700092135566<br>男 28岁1.76米大专中区事业单位帅有责任心<br>择：22-28岁，1.6以上，中区，有稳定工作，独生子女最好<br>男 32岁1.78米本科短婚事业单位帅 有房无子女<br>择：25-32岁，1.62以上，有工作，气质佳的有缘女士<br>男 33岁1.80米本科 离婚 公检法帅有房 有责任心<br>择：25-31岁，1.63以上，大专，未婚的有缘女士<br>男 36岁 1.73米本科 离婚公务员 有房 有车 帅气 潇洒<br>择：27-33岁，1.6以上，有稳定工作，不带小孩的女士<br>喜洋洋婚介是经济宁市工商局、民政局批准，成立于1998年5月。是济宁开办最早、信息量最大、信誉最好、知名度最高、规模最大的专业婚介机构。 征婚信息量达2万余人，是你婚姻成功的保证。成就婚姻，当然首选合法、正规、实力雄厚的婚介机构。<br>', '', '0', '1271984072', '1271984072', '', '田老师', '21700092135566', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('793', '3', '61', '征婚', '本人未婚，重点大学毕业，但愿能借助济宁信息港这个平台，在人海茫茫中找到理想的另一半！', '', '0', '1271984074', '1271984074', '', '先生', '13792385366', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('794', '3', '60', '征婚', '外在冰冷孤傲，内在热血沸腾。', '', '0', '1271984074', '1271984074', '', '林女士', '13258055337', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('795', '3', '59', '有缘相识，无缘结谊.', '本人诚实可靠，为人正直，重感情，无不良嗜好。专业摄影，驾驶，从事过5年摄影工作自己做过两年。现在在一家私企开车。婚姻状况丧偶没有小孩。想找一位有缘人共同创造美好的未来。如谈的来今年也可以结婚。有缘相识，无缘结谊.电话13173171731本人很随和哦 呵呵。', '', '0', '1271984074', '1271984074', '', '周先生', '13173171731', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('796', '3', '59', '诚觅爱心港湾', '既不回头，何不相忘<br><br>既然无缘，何须誓言<br><br>昔时想象，似水无痕<br><br>明夕何夕，窈窕淑女<br><br><br><br>我心依然<br><br>灿烂如锦<br><br>在每一个黎明我都会<br><br>升起朝霞的绚丽<br><br>今夕何夕<br><br>万水千山总是奇<br><br><br><br>万曲不关心，一曲动情魄<br><br>低头弄莲子，莲子清如水<br><br>开怀温馨，默默关注<br><br>是一种简洁明快的美<br><br><br>愿为双鸿鹄，奋翅起高飞<br><br>在天愿作比翼鸟，在地愿为连理枝<br><br>才识相通心领神会<br><br>是一种深沉含蓄的美<br><br><br>让岁月记住<br><br>永恒的话题<br><br>互为关爱包容<br><br>婚姻一定给彼此<br><br>一片全新的天地<br><br><br>qq1063022091不相干者请勿打扰。<br>', '', '0', '1271984075', '1271984075', '', '月上柳梢', '13455596400', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('797', '3', '61', '公司男老板征婚', '', '', '0', '1271984075', '1271984075', '', '谢老师', '2721266', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('798', '3', '61', '事业型离婚男士征婚', '期待有缘人。<br>QQ：1370458989', '', '0', '1271984076', '1271984076', '', '先生', '13176799365', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('799', '3', '59', '真诚征婚', '若有缘，有缘就能期待明天<br>13188829734', '', '0', '1271984076', '1271984076', '', '女士', '13305473695', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('800', '3', '61', '53岁女士征婚', '', '', '0', '1271984077', '1271984077', '', '罗女士', '13053756967', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('801', '3', '59', '互相不妨碍的密友', '有意者加QQ992783608.非诚勿扰！！', '', '0', '1271984077', '1271984077', '', '抱着你', '992783608', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('802', '3', '59', '运河不了情', '匆匆岁月年届不惑，有过幸福有过困惑。伤痕累累以后只剩一个依然坚强的我。善良诚实有爱心有才能这就是真我。想找一个能安稳过日子，同样有爱心的女士为伴。相信我的爱象运河一样深沉长久。<br>', '', '0', '1271984078', '1271984078', '', '杨先生', '13792339544', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('803', '3', '59', '公司男老板征婚', '本人有车、有住房2套', '', '0', '1271984078', '1271984078', '', '谢先生', '2721266', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('804', '3', '60', '真诚征婚', '本人离异，带10岁男孩，要求：对方、温柔、贤惠、爱家顾家、有涵养。QQ：1159582310', '', '0', '1271984078', '1271984078', '', '王先生', '15563745910', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('805', '3', '59', '优秀女征婚', '本人一直在忙工作，不知不觉到了这个年龄，想通过网络这个虚拟的平台找到真实的各一半，如果你是一个有责任心，上进心，事业心的未婚男士请致电！', '', '0', '1271984078', '1271984078', '', '王女士', '13053725115', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('806', '3', '60', '男士征婚', '离异，有一4岁男孩，有意者手机联系。', '', '0', '1271984079', '1271984079', '', '韩先生', '13176769504', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('807', '3', '60', '诚觅40男人成家', '本人离异未带孩子（一女孩归对方)性格温和、心地善良、端庄大方、重感情。觅身体健康有房有经济基础有责任心生活稳定的中区男士。条件不符者勿扰！有意者请于下午6点后或礼拜天电话联系', '', '0', '1271984080', '1271984080', '', '孙女士', '15563495781', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('808', '3', '61', '年轻有为公司老总征婚', '更多信息查询请拨打：21700092135566&lt;br&gt;男&nbsp;42岁1.75米本科&nbsp;丧偶行政机关帅气有房有车&lt;br&gt;择：25--35岁，1.6以上，有稳定收入，未育的女士为伴&lt;br&gt;男&nbsp;34岁1.74米大专&nbsp;电力系统离婚&nbsp;帅气有房&nbsp;&lt;br&gt;择：27-33岁，1.62以上，有固定工作，不带小孩的女士为伴&lt;br&gt;男：32岁&nbsp;1.83米&nbsp;本科&nbsp;离婚&nbsp;公检法潇洒帅气&nbsp;有房&lt;br&gt;择：23-29岁，1.64米以上，未婚，其他随缘&lt;br&gt;&nbsp;喜洋洋婚介是经济宁市工商局、民政局批准，成立于&lt;br&gt;&lt;br&gt;1998年5月。是济宁开办最早、信息量最大、信誉最好、&lt;br&gt;&lt;br&gt;知名度最高、规模最大的专业婚介机构。&nbsp;征婚信息量达2&lt;br&gt;&lt;br&gt;万余人，是你婚姻成功的保证。成就婚姻，当然首选合法&lt;br&gt;&lt;br&gt;、正规、实力雄厚的婚介机构。', '', '0', '1271984960', '1271984960', '', '田老师', '2170009', '', '127.0.0.1', '7', '1');
INSERT INTO `f_info` VALUES ('809', '3', '59', '祝贺“济宁鹊桥会单身派对文化节圆满成功！”', '<br> <br>祝贺“济宁鹊桥会单身派对文化节圆满成功！”<br>济宁鹊桥会首届单身派对文化节于2009年12月20日下午在济宁黄淮宾馆隆重举行。<br>主办单位：济宁市市中区总工会、妇联、团区委<br>承办单位：中国鹊桥会济宁总站（济宁鹊桥会）<br>参加人员：以机关事业、大中型企业单位职工为主，共近五百人。<br>人员学历：80%以上为大专以上学历，其中部分具有研究生学历或者硕士学位。<br>出席领导：济宁市中区妇联主席张春茹、市中区总工会副主席张磊、中区团委副书记冯延宁出席了派对文化节。张春茹主席代表主办单位讲话。<br>目的意义：市中区妇联主席张春茹在讲话中指出，目的是为了进一步解决社会各界单身人士的婚恋问题，促进和谐社会建设。希望这次活动能为大家提供一个沟通交流的平台，结识朋友，找到意中人，希望济宁鹊桥会今后充分发挥社会婚介机构的作用，增强社会责任感，诚信为本，为和谐社会建设做出自己应有的贡献！<br>活动安排：<br>1、承办单位中国鹊桥会济宁总站（济宁鹊桥会）邱娟主任致辞。<br>2、主办方代表市中区妇联主席张春茹讲话<br>3、协办方贵族天使婚纱摄影有限公司董事长李继民致祝贺词<br>济宁市电视一台“直播民生”21日晚6点05分和二台9点25分报道了活动现场，<br>济宁市市中区电视台“社会报道”21日晚7点45分报道了活动现场。<br>济宁日报“都市晨刊”和山东商报相继报道了活动内容。', '', '0', '1271984083', '1271984083', '', '王老师张老师', '26051772605877', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('810', '3', '61', '征婚', '详情手机短信咨询', '', '0', '1271984083', '1271984083', '', '韩先生', '13153738547', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('811', '3', '60', '漂亮女孩征婚', '<br>更多信息请电话咨询2135566，2170009<br>女 26岁，1.7米 大专，护士，形象好，气质佳<br>择：26-32岁，1.73米以上，大专以上学历，有房有稳定收入<br>女 26岁1.65米 大专 设计师 漂亮 中区独生女<br>择：26-30岁，1.7米以上 大专以上学历 有房 稳定收入<br>女 25岁 1.63米 中专 个体 中区 形象好 气质佳<br>择 25-30岁 ，1.7以上 企业或经商男士<br><br>喜洋洋婚介是经济宁市工商局、民政局批准，成立于1998年5月。是济宁开办最早、信息量最大、信誉最好、知名度最高、规模最大的专业婚介机构。 征婚信息量达2万余人，是你婚姻成功的保证。成就婚姻，当然首选合法、正规、实力雄厚的婚介机构。<br> 公司地址：济宁市古槐北路和常青路交叉路口往南100米路西<br>电话：21700092135566', '', '0', '1271984086', '1271984086', '', '田老师', '21700092135566', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('812', '3', '61', '女士征婚', '本人26岁，未婚，在私企工作，真诚寻找济宁地区，有房，有固定工作，月收入3000元以上，年龄26-33岁，身高1.73米以上，人品好，重家庭，重感情，有责任心的男士为伴。', '', '0', '1271984086', '1271984086', '', '徐小姐', '15153717813', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('813', '3', '61', '男征女', '详情短信咨询。', '', '0', '1271984087', '1271984087', '', '韩先生', '13153738547', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('814', '3', '61', '尘埃未定', '爱像是在寻找，目标很明确但很高很远。有缘结识，无缘结谊。QQ416785159请注明网路', '', '0', '1271984088', '1271984088', '', '先生', '131', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('815', '3', '61', '离异男士征婚', '本人在市直机关工作，有一不到3岁女孩归对方，想找一位能勤俭持家，孝顺父母，温柔体贴的女士为伴，有意者可发短信或QQ：20328657联系。', '', '0', '1271984089', '1271984089', '', '先生', '13012930722', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('816', '3', '59', '济宁市机关公务员26岁男征婚', 'qq：984461185', '', '0', '1271984090', '1271984090', '', '马先生', '15563749683', '', '127.0.0.1', '4', '1');
INSERT INTO `f_info` VALUES ('817', '3', '14', '都市豪庭137平带车库包改合同', '都市豪庭10楼103平3室2厅1卫简装60万', '', '0', '1271989479', '1271989479', '', '', '15053722648', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('818', '3', '14', '齐鲁证券宿舍房屋出售', '', '', '0', '1271991153', '1271991153', '', '孙女士', '15963769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('819', '3', '14', '核桃园门面房出售', '有非常大升值潜力', '', '0', '1271991154', '1271991154', '', '女士', '18953759686', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('820', '3', '14', '阳光花园房屋出售', '带阁楼', '', '0', '1271991154', '1271991154', '', '孙女士', '15963769898', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('821', '3', '14', '党校附近二室一厅市证免税23万', '红西小区三楼154平米车库52万免税 长安花园期房10楼三室二厅145平3900元每平米', '', '0', '1271991154', '1271991154', '', '赵', '297861613954715759', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('822', '3', '14', '接庄镇大郝村3室1厅带车库出售', '', '', '0', '1271991155', '1271991155', '', '崔先生', '15854618327', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('823', '3', '14', '冠亚星城三期房屋出售', '直接改合同开口费已交，改合同。', '', '0', '1271991155', '1271991155', '', '倪女士', '2829978', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('824', '3', '14', '房屋出售', '', '', '0', '1271991155', '1271991155', '', '李女士', '15963060888', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('825', '3', '14', '超值购房赠送阁楼', '赠送同等面积阁楼', '', '0', '1271991156', '1271991156', '', '代老师', '13666373902', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('826', '3', '14', '南苑社区2室2厅带车库房屋出售', '', '', '0', '1271991156', '1271991156', '', '张先生', '13853730417', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('827', '3', '14', '急售置城中央公园住房', '', '', '0', '1271991156', '1271991156', '', '尤先生', '13964929986', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('828', '3', '14', '菱花小区房屋出售', '家具家电，非诚勿扰！', '', '0', '1271991157', '1271991157', '', '侯女士', '2020509', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('829', '3', '14', '樱花园小区', '2楼 71平3*1暖37万吉祥5楼80平3*132万', '', '0', '1271991158', '1271991158', '', '陈老师', '3288005', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('830', '3', '14', '五里营观音阁派出所宿舍出售', '', '', '0', '1271991158', '1271991158', '', '张先生', '13563772052', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('831', '3', '14', '单位宿舍55平平3层二阳市免22万，梦圆北区85平2层精装市', '明珠135平6层暖市证暖6层58万，锦华组团143平6层暖精装市免50万', '', '0', '1271991158', '1271991158', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('832', '3', '14', '齐鑫花园供暖房', '崇文名都,二楼,97平方,车库,31万。崇文明都,一楼,104平方,有储,30万', '', '0', '1271991159', '1271991159', '', '张女士', '0537-2130210', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('833', '3', '14', '汇源小高层房屋出售', '有电梯，包一切费用', '', '0', '1271991160', '1271991160', '', '王先生', '13853717122', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('834', '3', '14', '水景花园新婚房急售【全家具，空调3个，热水器，冰箱，洗衣机】', '水景花园，10楼2室1厅，88平方米，46万元。渔山，4楼2室1厅，81平方米，供暖，38万元。', '', '0', '1271991160', '1271991160', '', '吴老师', '2995662', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('835', '3', '14', '吉安小区单位宿舍＊暖＊车库---超值', '改合同，直接办大市证。可贷款。位置好，', '', '0', '1271991161', '1271991161', '', '曾女士', '2826008', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('836', '3', '14', '府河小区单位宿舍', '金方圆为您找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271991161', '1271991161', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('837', '3', '14', '好房急售!济邹花园', '金方圆为您找到舒心的家！', '', '0', '1271991162', '1271991162', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('838', '3', '14', '东方艺校附近房屋出售', '', '', '0', '1271991163', '1271991163', '', '张先生', '13053709066', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('839', '3', '14', '森泰御城新房低价出售', '两卧室朝阳，客厅采光好，户型佳', '', '0', '1271991163', '1271991163', '', '贾先生', '13518652168', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('840', '3', '14', '新世纪花园小区住房一套出售', '有地下车位，三室两厅两卫，有大市证', '', '0', '1271991163', '1271991163', '', '商先生', '15553744444', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('841', '3', '14', '苏州西苑', '郭家花园，11楼3室2厅，133平方米，09.年上房，改合同，62万元。', '', '0', '1271991164', '1271991164', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('842', '3', '14', '运河家园凤凰城团购房', '凤凰城，4楼2室2厅，110平方米，39万元。凤凰城，5楼2室2厅，88平方米，29万元。', '', '0', '1271991164', '1271991164', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('843', '3', '14', '枣店阁小学附近', '装修', '', '0', '1271991165', '1271991165', '', '高先生', '2218988', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('844', '3', '14', '琵琶山小区房屋出售', '', '', '0', '1271991165', '1271991165', '', '女士', '2955918', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('845', '3', '14', '洸河花园住房诚售，吉祥2楼4室3厅2卫水电暖齐，精装，带全套', '房型4室3厅2卫，设计正气、通透，大市房产证、土地证，全套家电、家具及厨卫整套精装。', '', '0', '1271991165', '1271991165', '', '孟女士', '13686378590', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('846', '3', '14', '好房急售', '', '', '0', '1271991166', '1271991166', '', '王', '15863730777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('847', '3', '14', '水产路储运站职工宿舍出售', '此房产为储运站家属宿舍，有物业公司，安全便利，紧临银座超市、协和医院、济宁家居城，购物方便。无房产证', '', '0', '1271991167', '1271991167', '', '宋女士', '13655476919', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('848', '3', '14', '阳光润泽园新婚房出售', '郭家花园，11楼3室2厅，133平方米，09.年上房，改合同，62万元。', '', '0', '1271991167', '1271991167', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('849', '3', '14', '梦园南区非中介', '', '', '0', '1271991167', '1271991167', '', '王女士', '15605478636', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('850', '3', '14', '银都花园专业房产中介 租房售房 二手房贷款免费发布信息', '改合同另有菱花小区复式200平方装修储35万证 非诚勿扰', '', '0', '1271991168', '1271991168', '', '孟 老师', '15092662788', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('851', '3', '14', '文化小区', '', '', '0', '1271991168', '1271991168', '', '张', '15864111233', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('852', '3', '14', '吉安小区', '五里营4楼3室一厅精装110平方26万改合同', '', '0', '1271991169', '1271991169', '', 'jninfo王', '13863721675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('853', '3', '14', '光河花园97平方米暖房顶层房屋出售', '交通方便，绿化好，国优工程', '', '0', '1271991171', '1271991171', '', '周老师', '2238882', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('854', '3', '14', '新苑雅居小高层房屋出售', '离仙营绿地3分钟的路程，离妇幼保健院3分钟的路程，离附小也很近。', '', '0', '1271991171', '1271991171', '', '徐小姐', '13953705675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('855', '3', '14', '益民东区单位房出售（非诚勿扰）暖房即买即卖', '2明1北，明厨明卫，地上储藏室，有门卫，有双证，免税，周日预约看房，非诚勿扰', '', '0', '1271991172', '1271991172', '', '周老师', '2238882', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('856', '3', '14', '电视台71平2层暖市免35万，谢营84平市免5层31万，吉安', '洪顺99平3层暖39万，锦华组团143平暖6层50万市免另131平2层市免53万暖', '', '0', '1271991172', '1271991172', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('857', '3', '14', '苏州西苑', '水景花园，9楼3室2厅，136平方米，72万元。水景花园，10楼2室1厅，88平方米，46万元。', '', '0', '1271991172', '1271991172', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('858', '3', '14', '樱花南宿舍住房出售', '大市证，免税', '', '0', '1271991172', '1271991172', '', '闫女士', '2181948', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('859', '3', '14', '豪华别墅急售', '有两层，交通便利，含商业用地40亩，现已种植树林。', '', '0', '1271991173', '1271991173', '', '胡先生', '13954783865', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('860', '3', '14', '鲁抗宿舍附近两套住房出售', '鲁抗附近，2楼3室1厅，80平方米，供暖，32.5万元。', '', '0', '1271991173', '1271991173', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('861', '3', '14', '解放路小高层新房急售（改合同）', '', '', '0', '1271991173', '1271991173', '', '王先生', '13953775778', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('862', '3', '14', '阳光润泽园 精品暖房 包过户 市证', '阳光润泽园 145平 3*2*2 6F 上储14平 带车位 市证 68万', '', '0', '1271991173', '1271991173', '', '鲁房置换王', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('863', '3', '14', '红星西路化工试验宿舍3楼免税', '长安小区4楼2室1厅70平方18万土地证....柳行新村1楼2室1厅58平方双证免税26万..久久花', '', '0', '1271991174', '1271991174', '', '王女士', '2020296', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('864', '3', '14', '崇文名都 带车库出售', '崇文 99平 5F 上储 8平 27万 包该合同 2*2', '', '0', '1271991174', '1271991174', '', '鲁房置换王', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('865', '3', '14', '售洸河花园高档现房', '大市房产证、土地证。', '', '0', '1271991175', '1271991175', '', '寻先生', '15854713782', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('866', '3', '14', '长虹小区  带车库  免税暖房', '长虹 119平 3*2*1 车库 22平 1F 精装 市证 45万', '', '0', '1271991175', '1271991175', '', '鲁房置换王', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('867', '3', '14', '银都花园专业房产中介 租房售房 二手房贷款', '证另有4楼134平车库38平装修家具家电69万 2楼134平储18平60万证非诚勿扰', '', '0', '1271991175', '1271991175', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('868', '3', '14', '洸河花园住房诚售，吉祥2楼4室3厅2卫水电暖齐，精装，带全套', '房型设计正气，通透，大市房产证、土地证，全套家电、家具及厨卫整套精装。', '', '0', '1271991176', '1271991176', '', '孟女士', '13686378590', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('869', '3', '14', '红星西路吉房出售', '', '', '0', '1271991176', '1271991176', '', '颜女士', '15550729059', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('870', '3', '14', '冠亚星城房屋出售', '价格可面议', '', '0', '1271991176', '1271991176', '', '女士', '15053761551', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('871', '3', '14', '菱花小区', '金方圆为您找到舒心的家！非诚勿扰', '', '0', '1271991177', '1271991177', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('872', '3', '14', '好房急售!光明小区', '金方圆为您找到舒心的家！非诚勿扰', '', '0', '1271991178', '1271991178', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('873', '3', '14', '房屋出售', '有30平米车库', '', '0', '1271991179', '1271991179', '', '胡先生', '13954783865', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('874', '3', '14', '好房急售!樱花宿舍', '金方圆为您找到舒心的家！非诚勿扰', '', '0', '1271991179', '1271991179', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('875', '3', '14', '银都花园单位房暖气装修免税', '另有更多请电话2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991180', '1271991180', '', '嘉园房产', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('876', '3', '14', '阳光花园房屋出售', '有阁楼', '', '0', '1271991180', '1271991180', '', '孙女士', '15963769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('877', '3', '14', '房屋出售', '双证齐全', '', '0', '1271991181', '1271991181', '', '孙女士', '15963769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('878', '3', '14', '梦园小区南区房屋出售', '有土地证，合同房', '', '0', '1271991181', '1271991181', '', '孙先生', '13854760008', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('879', '3', '14', '检察院宿舍供暖房', '黄淮宾馆附近学区房，4楼3室1厅，76平，免税，36元。党校附近，4楼2室1厅，76平米，34万元。', '', '0', '1271991182', '1271991182', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('880', '3', '14', '光明小区供暖房，六楼三室一厅，90平方，车库，4000/平方', '市委附近 五楼三室一厅 85平方 暖气 45万 都市花园 二楼 145平方 车库 4800/平方', '', '0', '1271991182', '1271991182', '', '张女士', '0537-2130210', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('881', '3', '14', '太白小区住房出售', '免税', '', '0', '1271991182', '1271991182', '', '褚先生', '15563746035', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('882', '3', '14', '开泰花园小区免税房', '九九花园3楼3室1厅储10、85平米供暖·市证免税38万急售', '', '0', '1271991183', '1271991183', '', '张女士', '2991156', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('883', '3', '14', '领袖庄园', '明珠花园，3楼', '', '0', '1271991184', '1271991184', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('884', '3', '14', '绿地附近 单位宿舍', '二院附近单位房 147平3*2*1 3楼 储30 75万 市证 豪华装修水电双气', '', '0', '1271991185', '1271991185', '', '鲁房置换吴', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('885', '3', '14', '置城国际  阳面', '金方圆为您找到舒心的家！非诚勿扰', '', '0', '1271991185', '1271991185', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('886', '3', '14', '渔山小区 单位暖房', '西门大街单位房 92平2*1*1 5楼 39万', '', '0', '1271991186', '1271991186', '', '鲁房置换吴', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('887', '3', '14', '樱花宿舍', '金方圆为你找到舒心的家！非诚勿扰 欢迎来电！', '', '0', '1271991186', '1271991186', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('888', '3', '14', '科苑小区供暖房出售', '', '', '0', '1271991186', '1271991186', '', '高女士', '15864136988', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('889', '3', '14', '齐鑫花园125平51万急售非诚勿扰', '证 另有樱花小区5楼70平装免税28万 黄营4楼83平32万更多信息2662810', '', '0', '1271991186', '1271991186', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('890', '3', '14', '齐心花园房屋出售', '水电暖宽带齐全，防盗措施好，物业完善，可商，可住，可办公。', '', '0', '1271991187', '1271991187', '', '王先生', '18605374663', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('891', '3', '14', '梦圆小区4楼出售', '西关体育场附近5楼80平方免税35万 水景花园3楼100平方35万', '', '0', '1271991187', '1271991187', '', '杨', '139547157592978616', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('892', '3', '14', '黄家街学区房33万包过户出售', '一梯两户、大市证，两室朝阳、双阳台、防晒层，有看大门的。', '', '0', '1271991188', '1271991188', '', '田女士', '15206798768', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('893', '3', '14', '银都花园房屋出售', '', '', '0', '1271991188', '1271991188', '', '隋女士', '15053761551', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('894', '3', '14', '圣景园小区房屋出售', '两室朝阳', '', '0', '1271991189', '1271991189', '', '闫女士', '2181948', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('895', '3', '14', '新世纪广场附近房屋出售', '', '', '0', '1271991189', '1271991189', '', '辛先生', '13605377067', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('896', '3', '14', '长虹小区 带车库 新房', '', '', '0', '1271991189', '1271991189', '', '鲁房置换吴', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('897', '3', '14', '后营小区贸易中心对过房屋出售', '中区证、拆迁房', '', '0', '1271991189', '1271991189', '', '闫女士', '2181948', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('898', '3', '14', '急售长虹小区', '长虹小区 3楼117平3*2 20/车 43万免税', '', '0', '1271991190', '1271991190', '', '陈老师', '13258016176', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('899', '3', '14', '最新售房', '益民西区6楼90平31万鸿顺6楼90平31万梦圆6楼90平暖33万', '', '0', '1271991190', '1271991190', '', '夏', '2800681', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('900', '3', '14', '好楼急售', '按揭，现在可改合同，可居住可办公，升值无限，价格可商议。', '', '0', '1271991191', '1271991191', '', '李女士', '15205476827', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('901', '3', '14', '营业中旺铺转让', '', '', '0', '1271991191', '1271991191', '', '张女士', '13355132525', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('902', '3', '14', '育才西邻房屋出售', '', '', '0', '1271991192', '1271991192', '', '隋女士', '2955918', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('903', '3', '14', '吉祥小区', '附院附近，3楼3室1厅，80平方米，简装，供暖，免税，32万元。', '', '0', '1271991192', '1271991192', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('904', '3', '14', '阳光城市花园房屋出售', '', '', '0', '1271991192', '1271991192', '', '隋女士', '15053761551', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('905', '3', '14', '吉安小区【免税】', '如意小区，3楼2室1厅，83平方米，36万元。粉连，4楼1室1厅，41平方米，19.8万元。', '', '0', '1271991192', '1271991192', '', '吴老师', '2995662', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('906', '3', '14', '冠亚星城附近单位住房出售', '', '', '0', '1271991194', '1271991194', '', '杜女士', '13355101617', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('907', '3', '14', '洸河花园供暖房', '共两套。还有一个二楼。85平米42万', '', '0', '1271991194', '1271991194', '', '梦圆家政', '2856383', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('908', '3', '14', '丹桂苑小区', '金方圆为您找到舒心的家！非诚勿扰', '', '0', '1271991195', '1271991195', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('909', '3', '14', '鸿顺花园供暖房免税。', '鸿顺花园3楼3室1厅90平米储14.市证40万', '', '0', '1271991195', '1271991195', '', '梦圆家政', '2856383', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('910', '3', '14', '南苑社区两室两厅', '该合同', '', '0', '1271991196', '1271991196', '', '张先生', '13853730417', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('911', '3', '14', '银都花园专业房产中介 租房售房 二手房贷款', '证车库可做门面 另有2楼105平储16平53万 非诚勿扰', '', '0', '1271991196', '1271991196', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('912', '3', '14', '杨柳国际二居现房带车库低价出售！！', '仅有精品户型，配套车库，双卧朝阳，全新未入住。', '', '0', '1271991197', '1271991197', '', '先生', '15253737307', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('913', '3', '14', '曲阜凯伦小区新房出售', '小区环境优雅、交通便利、紧邻曲阜汽车站、24小时保安、楼宇对讲，采光好、小区配套设施齐', '', '0', '1271991197', '1271991197', '', '孔老师', '13371212604', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('914', '3', '14', '新房出售', '另有面积171平方，4室2厅2卫，售价36万元。', '', '0', '1271991197', '1271991197', '', '柳先生', '2923688', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('915', '3', '14', '都市豪庭1楼155带车库', '长安花园3楼高层141平方 3800元急售可贷款 长虹小区3楼118车库20 43万免税', '', '0', '1271991197', '1271991197', '', '小秦', '32880783288008', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('916', '3', '14', '嘉隆商业街单层门面房出售【带租约】', '房子很方正很实用，没有拐角，没有柱子，现正出租', '', '0', '1271991197', '1271991197', '', '李', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('917', '3', '14', '开发区世易尚城房屋出售', '另有一套11楼，面积165平方，3室2厅2卫，售价65.6万元。有诚意购买价格优惠。', '', '0', '1271991198', '1271991198', '', '冯先生', '15865711687', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('918', '3', '14', '售房', '其他都开通，手续齐全。', '', '0', '1271991198', '1271991198', '', '孙老师', '18605377118', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('919', '3', '14', '急售铁塔寺门面房，60平方，46万，包过户。另文化小区', '党校附近 四楼二室一厅 76平方 34万龙行小区 五楼三室一厅 75平方 31万', '', '0', '1271991199', '1271991199', '', '张女士', '0537-2130210', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('920', '3', '14', '生远舞台东高层', '开户费已交20楼89平', '', '0', '1271991199', '1271991199', '', '嘉润泰和房产', '3930799', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('921', '3', '14', '新世纪广场南邻单位暖房出售', '大市政、免税、单位房改房、实际面积大。', '', '0', '1271991200', '1271991200', '', '王老师', '13515476616', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('922', '3', '14', '银都花园专业房产中介 租房售房 二手房贷款2662810 6', '证 6楼3卧室2厅 7楼2卧室1厅 非诚勿扰', '', '0', '1271991200', '1271991200', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('923', '3', '14', '龙城水岸盛世新房急售', '所有费用都已交。', '', '0', '1271991200', '1271991200', '', '朱先生', '15963763334', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('924', '3', '14', '越河58平1层市免24万，鱼山80平3层暖市免36万，55平', '水景100平3层暖新房36万，益东110平暖该合同48万，锦华组团143平6层暖50万', '', '0', '1271991201', '1271991201', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('925', '3', '14', '丹桂苑小区现房出售', '大市证', '', '0', '1271991201', '1271991201', '', '郑先生', '13853702369', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('926', '3', '14', '梦圆南区房屋出售', '', '', '0', '1271991201', '1271991201', '', '曹女士', '13639403537', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('927', '3', '14', '东门小学后墙 暖房', '2楼 95 3*154免税', '', '0', '1271991202', '1271991202', '', '陈经理', '328800515065477844', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('928', '3', '14', '租售乔羽路长安花园沿街门面22平30平67平96平【四套】适', '适合经营餐饮，超市，网吧，门诊，医药，美容美体，发型设计，棋牌茶楼，蔬菜水果，冷鲜肉等', '', '0', '1271991204', '1271991204', '', '李', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('929', '3', '14', '银都花园专业房产中介 租房售房 二手房贷款2662810', '证 另有樱花小区5楼70平免税28万 黄营4楼83平32万更多信息2662810', '', '0', '1271991204', '1271991204', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('930', '3', '14', '汽车南站干休所新房出售', '', '', '0', '1271991204', '1271991204', '', '马先生', '13176763402', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('931', '3', '14', '光河人家自有住房出售', '', '', '0', '1271991205', '1271991205', '', '邱老师', '13355110607', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('932', '3', '14', '开泰花园高层急售、九九花园6层92平、装修、有暖气33万', '鸿顺花园2层91平39万', '', '0', '1271991205', '1271991205', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('933', '3', '14', '崇文小区 现房 出售', '急需资金周转，便宜出售。', '', '0', '1271991206', '1271991206', '', '郭先生', '13563728897', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('934', '3', '14', '大郝村房屋出售', '', '', '0', '1271991206', '1271991206', '', '崔先生', '15854618327', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('935', '3', '14', '人民影院附近单位宿舍房屋出售', '免税、大市政', '', '0', '1271991207', '1271991207', '', '焦先生', '13953712225', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('936', '3', '14', '都市豪庭大户型豪华装修带车库', '欣苑雅居4楼161平3室2厅2卫车库27平精装 暖 113万', '', '0', '1271991209', '1271991209', '', '鲁房置换29店', '15053722648', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('937', '3', '14', '汽车南站干休所新房出售', '每平米4600元', '', '0', '1271991209', '1271991209', '', '马先生', '13176763402', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('938', '3', '14', '水景花园住房诚意出售', '', '', '0', '1271991210', '1271991210', '', '贾女士', '2139687', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('939', '3', '14', '阳光润泽园房屋出售', '', '', '0', '1271991210', '1271991210', '', '陈先生', '13853781111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('940', '3', '14', '圣景园  好房急售', '金方圆为您找到舒心的家！非诚勿扰', '', '0', '1271991211', '1271991211', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('941', '3', '14', '杨柳国际新城', '另有13楼130平34万', '', '0', '1271991211', '1271991211', '', '嘉润泰和房产', '3930799', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('942', '3', '14', '刘庄小区', '单位宿舍。', '', '0', '1271991212', '1271991212', '', 'jninfo', '2337396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('943', '3', '14', '中区公安局西', '', '', '0', '1271991212', '1271991212', '', '嘉润泰和房产', '3930799', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('944', '3', '14', '洸河花园靓房诚售', '房型4室3厅2卫，设计正气、通透，大市房产证、土地证，全套家电、家具及厨卫整套精装。', '', '0', '1271991212', '1271991212', '', '孟女士', '13686378590', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('945', '3', '14', '原外经贸局宿舍（苏宁电器南邻）', '实验小学对过6楼155平 60万', '', '0', '1271991213', '1271991213', '', '张', '15864111233', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('946', '3', '14', '银都花园', '另有更多信息请电话2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991214', '1271991214', '', '嘉园房产', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('947', '3', '14', '科苑小区楼房出售免税', '另有更多请电话咨询2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991215', '1271991215', '', '嘉园房产', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('948', '3', '14', '银都花园专业房产中介 租房售房 二手房贷款2662810', '证另有4楼134平车库38平装修家具家电69万 2楼134平储18平60万证非诚勿扰', '', '0', '1271991215', '1271991215', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('949', '3', '14', '皇营小区房屋出售32万', '', '', '0', '1271991216', '1271991216', '', '孙女士', '2307790', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('950', '3', '14', '九九108平11层48万，71平5层市证28万，红星西路71', '环北130平1层暖03年62万，白屯138平3层29库31.8万，长安135平18层51万该合同', '', '0', '1271991216', '1271991216', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('951', '3', '14', '新天地花园豪宅出售', '有储藏室', '', '0', '1271991216', '1271991216', '', '李先生', '13805379686', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('952', '3', '14', '渔山小区！急售！单位房！', '金方圆为你找到舒心的家！', '', '0', '1271991217', '1271991217', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('953', '3', '14', '光和花园85平6层暖精装26万116平4层55万166平4层', '益西108平4层精23库市免55万，166平5层精装暖70万市免', '', '0', '1271991217', '1271991217', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('954', '3', '14', '枣店阁小区', '渔山小区4楼67平免税29万3室1厅', '', '0', '1271991217', '1271991217', '', '嘉润泰和房产龙行店', '3930799', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('955', '3', '14', '森泰御城急售', '铁塔寺2楼71平37万1楼78平院大概30平 暖 45万', '', '0', '1271991218', '1271991218', '', '陈老师', '328800513854794861', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('956', '3', '14', '鲁兴花园', '益民南区 93平 上储11平 3*1*1 48万 市证 免税', '', '0', '1271991219', '1271991219', '', '鲁房置换吴', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('957', '3', '14', '领袖庄园复式急售', '140+82平方 户型合理 高档社区', '', '0', '1271991219', '1271991219', '', '小秦', '15964105563', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('958', '3', '14', '东门小学附近', '东门附近还有一套3楼63平2室1厅暖储 门卫33万', '', '0', '1271991220', '1271991220', '', '鲁房置换29店', '15053722648', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('959', '3', '14', '崇文名都', '崇文 99平 5F 上储 8平 27万 包该合同 2*2', '', '0', '1271991220', '1271991220', '', '鲁房置换吴', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('960', '3', '14', '丹桂苑房屋急售46万元', '', '', '0', '1271991220', '1271991220', '', '孙女士', '2307790', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('961', '3', '14', '洸河花园诚意出售', '房型4室3厅2卫，设计正气、通透，大市房产证、土地证，全套家电、家具及厨卫整套精装。', '', '0', '1271991220', '1271991220', '', '孟女士', '13686378590', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('962', '3', '14', '森泰御城楼房急售', '另有更多信息请电话咨询2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991222', '1271991222', '', '济宁嘉园房产', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('963', '3', '14', '永兴小区新房出售（九九花园对过）', '小区环境良好、24监控、楼宇对讲、交通便利，无房产证（可办土地使用证），非诚勿扰！', '', '0', '1271991223', '1271991223', '', '刘先生', '15563740831', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('964', '3', '14', '冠亚星城', '', '', '0', '1271991223', '1271991223', '', '李女士', '0537-2800718', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('965', '3', '14', '丹桂苑小区', '', '', '0', '1271991224', '1271991224', '', '李女士', '0537-2800718', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('966', '3', '14', '科苑小区房屋出售', '免税', '', '0', '1271991224', '1271991224', '', '女士', '15053761551', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('967', '3', '14', '洸河花园住房诚意出售，吉祥2楼4室3厅2卫水电暖齐，精装，带', '房型设计正气，通透，大市房产证、土地证，全套家电、家具及厨卫整套精装。', '', '0', '1271991224', '1271991224', '', '孟女士', '13686378590', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('968', '3', '14', '刘庄小区——急！！！', '', '', '0', '1271991224', '1271991224', '', '李女士', '0537-2800718', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('969', '3', '14', '洸河花园住房诚意出售，吉祥2楼4室3厅2卫水电暖齐，精装，带', '房型设计正气，通透，大市房产证、土地证，全套家电、家具及厨卫整套精装。', '', '0', '1271991225', '1271991225', '', '孟女士', '13686378590', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('970', '3', '14', '核桃园——急！！！', '', '', '0', '1271991225', '1271991225', '', '李女士', '0537-2800718', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('971', '3', '14', '古槐家园188平现房急售', '另有更多信息请电话2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991225', '1271991225', '', '嘉园房产', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('972', '3', '14', '森泰御城急售', '森泰御城回迁房 10楼 98平 3*1 45万', '', '0', '1271991225', '1271991225', '', '陈经理', '32880053288050', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('973', '3', '14', '绿地附近', '', '', '0', '1271991226', '1271991226', '', '李女士', '0537-2800718', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('974', '3', '14', '东门2楼暖33万。公园19。8。来褐。益民东。实小房急售==', '来褐5楼2室70方30万.益东区3楼77方37万.铁塔3楼83方40', '', '0', '1271991226', '1271991226', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('975', '3', '14', '急售——绿地', '', '', '0', '1271991226', '1271991226', '', '李女士', '0537-2800718', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('976', '3', '14', '北门小区工商局宿舍房屋出售', '2006年大市证', '', '0', '1271991227', '1271991227', '', '张先生', '13721916219', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('977', '3', '14', '曲阜凯伦小区新房出售', '小区环境优雅、交通便利、紧邻曲阜汽车站、24小时保安、楼宇对讲，采光好、小区配套设施齐全。非诚勿扰', '', '0', '1271991227', '1271991227', '', '孔老师', '13371212604', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('978', '3', '14', '出售新体育馆附近6楼非顶层 3室1厅 110平方 暖气 售5', '兴隆桥7楼1室1厅 45.58平方 装修 18万元', '', '0', '1271991228', '1271991228', '', '邓女士', '2180288', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('979', '3', '14', '长虹 小区 好房急售  水电双气 新房未住  毛坯', '长虹 6F 143平 4*2*2平 市证 免税 37万 上储 7平', '', '0', '1271991228', '1271991228', '', '鲁房置换吴', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('980', '3', '14', '冠亚星城  多套精品房源', '冠亚2期 155平 4F 4*2*2 78万包改合同 冠亚2期 2F 122平 3*2*2 市证 6', '', '0', '1271991228', '1271991228', '', '鲁房置换吴', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('981', '3', '14', '银都 花园精品房源待售3楼87平 2楼115平车库56万非诚', '证 另有樱花小区5楼70平免税28万更多信息2662810', '', '0', '1271991229', '1271991229', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('982', '3', '14', '龙城水岸盛世新房准现房出售', '开户费已交', '', '0', '1271991230', '1271991230', '', '朱先生', '15963763334', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('983', '3', '14', '都市豪庭期房转让', '另有更多请电话咨询2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991230', '1271991230', '', '嘉园房产', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('984', '3', '14', '冠亚星城四期', '冠亚门面 150平 上下两层 118万 市证 崇文99平 4F车库21平30万3*1*1 都市豪', '', '0', '1271991231', '1271991231', '', '鲁房置换吴', '2738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('985', '3', '14', '科苑小区免税装修暖气', '另有更多请电话2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991231', '1271991231', '', '嘉园房产', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('986', '3', '14', '东门小区 1楼带院 暖房 急售', '博物馆对过 2楼 72平 3*1 34万免税 急售', '', '0', '1271991232', '1271991232', '', '陈经理', '328800513854794861', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('987', '3', '14', '光和花园85平暖精装市免42万，116平4层精装市证55万1', '银都100平4层暖市免48万，永泰新景湾102平5层43万，鱼山81平4层暖市免36万', '', '0', '1271991232', '1271991232', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('988', '3', '14', '置城国际花园b座精品房屋出售', '毛坯房，四室朝阳，东南角', '', '0', '1271991232', '1271991232', '', '刘先生', '13406286864', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('989', '3', '14', '洸河花园免税房', '', '', '0', '1271991233', '1271991233', '', '梦圆家政', '2856383', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('990', '3', '14', '光和花园85平6层暖精装市证26万，洪顺91平2层39万，实', '电视台157平5层25库暖70万，来鹤69平5层市免31万，古街园77平暖34万市证', '', '0', '1271991233', '1271991233', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('991', '3', '14', '琵琶山小区', '另有更多请电话2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991234', '1271991234', '', '嘉园房产', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('992', '3', '14', '杨柳国际', '负责改合同 可贷款多套89-190房屋出售 qq 1105467333', '', '0', '1271991235', '1271991235', '', '时老师', '15253737717', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('993', '3', '14', '光河花园，兴唐，九九、梦园、长安花园、开泰，永兴，益民多套房', '长安2楼105平3室2厅45万，3楼84平36万，3楼78平2室1厅32.6万，6楼78平32.6万', '', '0', '1271991235', '1271991235', '', '长安房产信息中心', '29920172728178', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('994', '3', '14', '急售菱花小区房屋出售', '免税，房产证。', '', '0', '1271991235', '1271991235', '', '孙女士', '13563750660', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('995', '3', '14', '急售曲阜新房一套', '可改合同，新房', '', '0', '1271991236', '1271991236', '', '李女士', '15953703961', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('996', '3', '14', '阳光润泽园 精品房源', '开泰花园 152平 5F 3*2*2 54万包过户另有多套精品房源欢迎电话咨询', '', '0', '1271991237', '1271991237', '', '鲁房置换吴经理', '13562738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('997', '3', '14', '杨柳国际新城新房出售', '有70平方米的复式，总面积共200平方，一次性付全款，价格可议。', '', '0', '1271991238', '1271991238', '', '蔡先生', '15563477118', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('998', '3', '14', '鲁兴花园精品房急售！！', '另外：鲁兴花园3楼100平3室1厅 车库25平 简装 52万', '', '0', '1271991239', '1271991239', '', '鲁房置换29店', '15053722648', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('999', '3', '14', '急售益民东区房屋', '', '', '0', '1271991240', '1271991240', '', '赵先生', '13518676306', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1000', '3', '14', '银都花园', '装修证 带车库全套家具家电', '', '0', '1271991240', '1271991240', '', '孟老师', '2662810', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1001', '3', '14', '单位团购房转让（复式）', '', '', '0', '1271991241', '1271991241', '', '李女士', '15965716868', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1002', '3', '14', '银都花园95平35万暖气证', '证 可贷款中介勿扰', '', '0', '1271991241', '1271991241', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1003', '3', '14', '益民西区楼房10万出售', '另有更多请电话2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991241', '1271991241', '', '济宁嘉园房产中介', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1004', '3', '14', '科苑小区', '另有更多请电话2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991241', '1271991241', '', '嘉园房产', '2124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1005', '3', '14', '水景花园 精品房', '冠亚 155平 4*2*2 4F 77万包改合同冠亚 145平 3*2*2 4F 76万 市证', '', '0', '1271991243', '1271991243', '', '鲁房置换吴经理', '13562738001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1006', '3', '14', '租售乔羽路长安花园沿街门面22平30平67平96平【四套】适', '适合经营餐饮，超市，网吧，门诊，医药，美容美体，发型设计，棋牌茶楼，蔬菜水果，冷鲜肉等', '', '0', '1271991243', '1271991243', '', 'jninfo', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1007', '3', '14', '银都瑞祥园房屋出售', '', '', '0', '1271991244', '1271991244', '', '女士', '15053761551', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1008', '3', '14', '开泰花园带阁楼房屋出售', '阁楼面积80平米', '', '0', '1271991244', '1271991244', '', '李女士', '13963793678', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1009', '3', '14', '舜泰园高层出售', '可改合同', '', '0', '1271991245', '1271991245', '', '袁女士', '13355376319', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1010', '3', '14', '银都花园商品房出售', '有大市房产证', '', '0', '1271991246', '1271991246', '', '王老师', '13563782902', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1011', '3', '14', '红星小区房屋出售', '房改房，院内有配房', '', '0', '1271991246', '1271991246', '', '隋女士', '15053761551', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1012', '3', '14', '太白小区房屋出售', '', '', '0', '1271991246', '1271991246', '', '李先生', '13953733499', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1013', '3', '14', '红星新苑房屋出售', '免税', '', '0', '1271991247', '1271991247', '', '女士', '2955918', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1014', '3', '14', '崇文名都房屋出售', '', '', '0', '1271991247', '1271991247', '', '范女士', '2979985', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1015', '3', '14', '长安花园房屋出售', '带阁楼', '', '0', '1271991248', '1271991248', '', '陈女士', '13280047616', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1016', '3', '14', '翠竹园小区房屋出售', '免税', '', '0', '1271991248', '1271991248', '', '女士', '2928695', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1017', '3', '14', '附属医院北湖区住房', '现有附属医院北湖区住房指标一套已缴纳购房款6万元，转让指标5万共计11万', '', '0', '1271991248', '1271991248', '', '孙', '15615370532', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1018', '3', '14', '梦圆小区房屋出售', '', '', '0', '1271991248', '1271991248', '', '陈女士', '13280047616', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1019', '3', '14', '曲阜新房出售', '', '', '0', '1271991249', '1271991249', '', '贾先生', '15553736616', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1020', '3', '14', '解放路小高层新房急售', '急售！', '', '0', '1271991249', '1271991249', '', '王先生', '13953775778', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1021', '3', '14', '长安小区房屋出售', '', '', '0', '1271991249', '1271991249', '', '陈女士', '13280047616', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1022', '3', '14', '金茂康桥楼房出售', '另有更多请电话2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991250', '1271991250', '', '济宁嘉园房产中介', '21247773925115', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1023', '3', '14', '开泰花园房屋出售', '水电暖闭路网线齐全，已开户，无装修，47万，含税。非诚勿扰', '', '0', '1271991251', '1271991251', '', '孙女士', '13953747166', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1024', '3', '14', '来鹤小区精装免税复式商品房出售', '6楼面积115平米，三室两厅一卫（三室朝阳），阁楼面积80平米。', '', '0', '1271991251', '1271991251', '', '翟先生', '13963700195', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1025', '3', '14', '门面房出售（中介勿扰）冠亚星城南门', '位置极佳，莫失良机。投资住房不如投资门面，本人因急需用钱，现在房子已经出租出去，有房产证。40年产权', '', '0', '1271991251', '1271991251', '', '张', '13854704766', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1026', '3', '14', '杨柳国际新城现房出售', '带阁楼，一口价，中介勿扰，已办上房，物业已交', '', '0', '1271991252', '1271991252', '', '蔡女士', '15318189826', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1027', '3', '14', '舜泰园小区房屋出售', '价格可面议，可办理过户，高层毛坯房，现房', '', '0', '1271991252', '1271991252', '', '曾女士', '15020706534', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1028', '3', '14', '小户型房屋出售', '两套相邻，非承重墙，可打通，即为80平米，单套出售8万，两套15万元，三套21万元。', '', '0', '1271991253', '1271991253', '', '王女士', '15066373456', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1029', '3', '14', '鸿顺花园2楼暖', '', '', '0', '1271991253', '1271991253', '', '鸿福中介 崔历', '2739878', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1030', '3', '14', '贵和商场附近', '', '', '0', '1271991254', '1271991254', '', 'jninfo王', '13863721675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1031', '3', '14', '济宁企事业单位团购房转让', '另有更多请电话咨询：2124777 或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991254', '1271991254', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1032', '3', '14', '刘庄小区房屋出售', '', '', '0', '1271991255', '1271991255', '', 'jninfo王', '13863721675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1033', '3', '14', '红星西路单位宿舍', '益民西区6楼3室78平方免税31万...开泰花园1楼95加车库45万...鸿sui', '', '0', '1271991255', '1271991255', '', '王女士', '2020296', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1034', '3', '14', '菱花小区多套楼房出租出售', '大市证,菱花4楼82平方25万，2楼128平方38万，1楼123平方豪华38万等', '', '0', '1271991255', '1271991255', '', '杨', '2187086', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1035', '3', '14', '中泰丰源小高层急售', '', '', '0', '1271991256', '1271991256', '', '刘小姐', '15269767700', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1036', '3', '14', '实验小学 附属中学学区单位房', '大市证免税', '', '0', '1271991256', '1271991256', '', '张', '15864111233', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1037', '3', '14', '森泰御城现房出售', '两卧室朝阳，户型极佳，客厅采光好', '', '0', '1271991257', '1271991257', '', '贾先生', '13518652168', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1038', '3', '14', '菱花小区售房', '大市证免税', '', '0', '1271991257', '1271991257', '', '杨', '15865375036', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1039', '3', '14', '阳光润泽园有房出售', '大市政', '', '0', '1271991257', '1271991257', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1040', '3', '14', '菱花小区', '市证', '', '0', '1271991257', '1271991257', '', '卢', '13012618592', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1041', '3', '14', '新世纪广场附近好房急售', '单位宿舍，一梯一户、免税！', '', '0', '1271991258', '1271991258', '', '王', '13505371991', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1042', '3', '14', '洸河路繁华路段门面房出售！', '另外：新体育馆对过1--2层门面165平165万；税务街纯一层门头宽62平68万；还有多套好门面', '', '0', '1271991260', '1271991260', '', '鲁房置换29店', '15053722648', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1043', '3', '14', '嘉祥呈祥小区一楼出售，一口价19万！', '商品销售合同可过户', '', '0', '1271991261', '1271991261', '', '岳先生', '13963738966', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1044', '3', '14', '凤凰城房屋出售', '', '', '0', '1271991261', '1271991261', '', '康先生', '15563700009', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1045', '3', '14', '因急需用钱，龙腾水岸盛世新房出售', '开口费已交，可转合同，价格可议。', '', '0', '1271991261', '1271991261', '', '朱先生', '15963763334', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1046', '3', '14', '冠亚附近单位住房三室或四室两厅70万元出售', '', '', '0', '1271991262', '1271991262', '', '张先生', '13355112000', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1047', '3', '14', '瑞和春天房屋出售', '', '', '0', '1271991262', '1271991262', '', '康先生', '15563700009', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1048', '3', '14', '霍小学区房33万包过户出售', '一梯两户、大市证，两室朝阳、双阳台、防晒层，有看大门的。', '', '0', '1271991262', '1271991262', '', '田女士', '15206798768', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1049', '3', '14', '来鹤小区复式免税商品房出售', '6楼面积115平米三室两厅一卫，阁楼面积80平米，交通方便，生活便利。', '', '0', '1271991262', '1271991262', '', '翟先生', '13963700195', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1050', '3', '14', '樱花五金附近大市证', '另有更多请电话咨询2124777或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991262', '1271991262', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1051', '3', '14', '鸿顺花园2层急售、开泰8层、96平、2＊2、36万、改合同', '光河花园4层2*2、97平、上储、43万。鸿顺花园5层、94平、带暖气42万', '', '0', '1271991263', '1271991263', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1052', '3', '14', '光河花园大面积复式楼房出售', '另有更多：嘉园房产网www.jiayfc.com', '', '0', '1271991263', '1271991263', '', 'jninfo济宁嘉园', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1053', '3', '14', '科苑小区暖房 急售', '济州花园1楼 66平 2*1 7平出储 24万改合同', '', '0', '1271991264', '1271991264', '', '陈经理', '328800515065477844', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1054', '3', '14', '开泰花园1楼带车库。。。。好位置', '光明小区1楼4室2卫车库27面议...长安小区2楼2室25.8...久久花园5楼3室2厅车库18..', '', '0', '1271991264', '1271991264', '', '王女士', '2020296', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1055', '3', '14', '济州花园 对过 单位集资房', '6楼66 2*1 有车库 24万', '', '0', '1271991265', '1271991265', '', '陈经理', '32880053288050', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1056', '3', '14', '银都花园 专业中介租房售房贷款过户 短期垫资 免费发布信息', '证装修 另有银都6楼80平35万 银都2楼105平54万更多2662810', '', '0', '1271991265', '1271991265', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1057', '3', '14', '中区招待所附近门面急售！', '另外：冠亚星城纯一层门面层高5.9米103平90万；阳光润泽园纯一层门面109平130万；还有多套门', '', '0', '1271991265', '1271991265', '', '鲁房置换29店', '15053722648', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1058', '3', '14', '明珠花园免税房 银都中介租房售房 贷款短期垫资 免费发布信息', '证免税 非诚勿扰明珠5楼88平41万 3楼88平46万 4楼88平45万', '', '0', '1271991266', '1271991266', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1059', '3', '14', '铁塔寺小区门面', '吉祥小区 5楼 80平 3*1 免税 32.5万 急售', '', '0', '1271991266', '1271991266', '', '陈经理', '328800513854794861', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1060', '3', '14', '银都花园商品暖房 专业中介租房售房 贷款过户 短期垫资', '证全套家具家电', '', '0', '1271991267', '1271991267', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1061', '3', '14', '秦庄附近单位房', '古楷园 五楼三室一厅 76平方 35万免税 都市花园 二楼三室二厅 145平方 车库 4800/平方', '', '0', '1271991267', '1271991267', '', '张女士', '0537-2130210', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1062', '3', '14', '兴唐经典复式251平方米房屋出售', '', '', '0', '1271991268', '1271991268', '', '张先生', '13305370222', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1063', '3', '14', '冠亚星城门面房出售（中介勿扰）', '位置极佳', '', '0', '1271991268', '1271991268', '', '张', '13854704766', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1064', '3', '14', '急售银都单位供暖房', '郭家花园 十一楼三室一厅 138平方 65万抗生素 三楼二室一厅 65平方 暖 26万', '', '0', '1271991268', '1271991268', '', '张女士', '0537-2130210', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1065', '3', '14', '明珠花园楼房出售', '另有更多请电话咨询：2124777 或登陆嘉园房产网www.jiayfc.com', '', '0', '1271991269', '1271991269', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1066', '3', '14', '东门暖33万。龙行16。8万。实小。工商局。太白等好房急售]', '工商局一楼暖32万院.太白一楼46方19.5万', '', '0', '1271991269', '1271991269', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1067', '3', '14', '杨柳国际i区 6楼 136平 加 87平阁楼  加车库 27', '杨柳B区 6楼带阁楼 115加 50阁楼天台 32万 改合同', '', '0', '1271991269', '1271991269', '', '陈经理', '328800515065477844', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1068', '3', '14', '来鹤小区一楼', '', '', '0', '1271991270', '1271991270', '', '徐女士', '0537-2722318', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1069', '3', '14', '阁楼140平方出售', '', '', '0', '1271991271', '1271991271', '', '孟女士', '13562713791', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1070', '3', '14', '舜泰园小区房屋出售', '可以改合同', '', '0', '1271991272', '1271991272', '', '董女士', '13355372660', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1071', '3', '14', '齐鑫花园1楼！有车库！急售！', '金方圆为您找到舒心的家！欢迎致电查询房源！', '', '0', '1271991273', '1271991273', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1072', '3', '14', '开泰花园小区房屋出售', '空调、热水器、非诚勿扰', '', '0', '1271991273', '1271991273', '', '张女士', '15092758222', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1073', '3', '14', '中医院附近住房一套出售', '整体厨房，无房产证、采光效果好', '', '0', '1271991273', '1271991273', '', '张先生', '13518678008', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1074', '3', '14', '急需用钱，赔钱卖房！', '附近有医院、学校、商业街', '', '0', '1271991273', '1271991273', '', '郑先生', '13563749185', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1075', '3', '14', '单位房急售', '土地证，可改合同', '', '0', '1271991274', '1271991274', '', '梁先生', '13583720587', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1076', '3', '14', '鸿顺花园供暖房2楼', '久久花园3楼2室1厅93平方供暖加车库17.4平方38万...益民西区6楼2室1厅78平方免税31万', '', '0', '1271991276', '1271991276', '', '王女士', '2020296', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1077', '3', '14', '光河花园，兴唐，九九、梦园、长安花园、开泰，永兴，益民多套房', '长安2楼105平3室2厅45万，3楼84平36万，3楼78平2室1厅32.6万，6楼78平32.6万', '', '0', '1271991277', '1271991277', '', '长安房产信息中心', '29920172728178', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1078', '3', '14', '崇文名都新房出售', '', '', '0', '1271991278', '1271991278', '', '岳先生', '15053715011', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1079', '3', '14', '金水湾小区', '', '', '0', '1271991278', '1271991278', '', '陈经理', '32880053288050', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1080', '3', '14', '嘉祥西苑出售两套楼房（急需用钱）', '另一套两室一厅一卫面积106平方米，售价11万。', '', '0', '1271991279', '1271991279', '', '刘女士', '15153762799', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1081', '3', '14', '豪华别墅急售', '因出国急用资金、急售。含商业用地40亩，交通便利，非诚勿扰、中介勿扰', '', '0', '1271991279', '1271991279', '', '胡先生', '13954783865', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1082', '3', '14', '明珠花园楼房出售', '另有更多请电话咨询：2124777www.jiayfc.com', '', '0', '1271991279', '1271991279', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1083', '3', '14', '银都花园有房出售', '大市证', '', '0', '1271991280', '1271991280', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1084', '3', '14', '鲁兴花园有房出售', '', '', '0', '1271991281', '1271991281', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1085', '3', '14', '好房出售', '一层一户、', '', '0', '1271991283', '1271991283', '', '王', '13505371991', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1086', '3', '14', '凌云小区房屋急售', '可改合同', '', '0', '1271991284', '1271991284', '', '杨女士', '15054756788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1087', '3', '14', '李楼新区107平4层36万07年市免，牛市69平精装20万，', '锦华组团143平6层暖精装50万，交通舍61平4层暖市证30万，仙营緑地122平暖市免48万', '', '0', '1271991284', '1271991284', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1088', '3', '14', '单位房屋出售', '有停车位', '', '0', '1271991284', '1271991284', '', '丁女士', '15853737699', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1089', '3', '14', '光和花园166平4层暖精装市免30库12储88万，116平4', '红星西路75平3层市证25万，开泰100平1层27库市证45万，中法院146平精装市证58万', '', '0', '1271991285', '1271991285', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1090', '3', '14', '古槐家园房屋出售', '教育局团购房', '', '0', '1271991285', '1271991285', '', '张先生', '15263702001', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1091', '3', '14', '皇营康桥楼房出售（森泰御城邻）', '另有更多请电话咨询：2124777www.jiayfc.com', '', '0', '1271991286', '1271991286', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1092', '3', '14', '刘庄小区东临', '市证，免税。', '', '0', '1271991286', '1271991286', '', 'jninfo', '2337396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1093', '3', '14', '绿地附近', '车位，有门卫。小区环境好。', '', '0', '1271991286', '1271991286', '', 'jninfo', '2337396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1094', '3', '14', '单位宿舍出售', '', '', '0', '1271991287', '1271991287', '', '徐女士', '13791738781', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1095', '3', '14', '房屋出售', '小区环境好有小区监控，健身设施，停车位 {中介勿扰}', '', '0', '1271991288', '1271991288', '', '陈先生', '13953732225', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1096', '3', '14', '郭家花园新房出售', '', '', '0', '1271991289', '1271991289', '', '胡女士', '13583752013', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1097', '3', '14', '曲阜华沁苑', '', '', '0', '1271991289', '1271991289', '', '张先生', '13905377287', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1098', '3', '14', '实验小学紧邻机关单位宿舍出售', '市政，免税', '', '0', '1271991290', '1271991290', '', '王老师', '2959619', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1099', '3', '14', '皇营康桥楼房出售', '另有3楼72平31.5万，森泰御城商品房2.4.5.6.10.11楼多套房源47万……', '', '0', '1271991290', '1271991290', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1100', '3', '14', '鸿顺花园、九九花园6层92平、装修36万、价格可议', '光和花园4层98平、装修、44万', '', '0', '1271991290', '1271991290', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1101', '3', '14', '九九花园', '益民西区6楼2室1厅78平方免税31万...6楼3室1厅98平方38万..郭家花园11楼138平方6', '', '0', '1271991291', '1271991291', '', '王女士', '2020296', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1102', '3', '14', '开泰花园、益民东区3层、2＊176平方、31万', '开泰花园1层100平、带车库、46万急售', '', '0', '1271991291', '1271991291', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1103', '3', '14', '兴唐附近90平2层暖07年27库市证46万，邮电舍69平5层', '明珠135平4层暖市证暖64.8万，附小108平4层45万，实小60平3层暖免精装市免34万', '', '0', '1271991292', '1271991292', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1104', '3', '14', '铁塔寺1楼免税', '', '', '0', '1271991292', '1271991292', '', '鸿福中介 崔历', '2739878', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1105', '3', '14', '开泰花园2楼吉房急售', '', '', '0', '1271991293', '1271991293', '', '鸿福中介 崔历', '2739878', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1106', '3', '14', '单位宿舍复式新房出售', '单位集中管理，一梯两户，挑空结构', '', '0', '1271991293', '1271991293', '', '李女士', '15965716868', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1107', '3', '14', '房屋出售', '紧邻仙营绿地，单位房，免税', '', '0', '1271991294', '1271991294', '', '刘老师', '2997898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1108', '3', '14', '鲁兴花园 精装修房出售！位置佳！', '金方圆房产为您找个舒心的家！更多房源欢迎来电咨询！', '', '0', '1271991294', '1271991294', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1109', '3', '14', '崇文小区房屋出售', '', '', '0', '1271991295', '1271991295', '', '张先生', '13863766326', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1110', '3', '14', '租售乔羽路长安花园沿街门面30平67平96平142平【四套】', '适合经营餐饮，超市，网吧，门诊，医药，美容美体，发型设计，棋牌茶楼，蔬菜水果，冷鲜肉等', '', '0', '1271991295', '1271991295', '', '李', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1111', '3', '14', '开泰花园小区房屋出售', '', '', '0', '1271991296', '1271991296', '', '方先生', '13854760008', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1112', '3', '14', '龙行27万。古楷园26。5万来鹤。太白。19。5等急售===', '铁塔市3楼3室暖房40万。琵琶山4楼暖82方40万', '', '0', '1271991296', '1271991296', '', 'jninfo', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1113', '3', '14', '银都花园各种户型房屋出售 房源免费发布', '证 另有3楼115平车库29平证装修56万 6楼63平25万 非诚勿扰', '', '0', '1271991297', '1271991297', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1114', '3', '14', '菱花小区2套', '证另有复试6楼7楼199平储藏12平证34万', '', '0', '1271991297', '1271991297', '', '孟', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1115', '3', '14', '益民东区免税房对外出售', '', '', '0', '1271991298', '1271991298', '', '刘老师', '13176177733', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1116', '3', '14', '济宁实验小学 附中学区房', '', '', '0', '1271991298', '1271991298', '', '张', '15864111233', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1117', '3', '14', '冠亚星城  带车位 非诚勿扰', '大市证 可以贷款', '', '0', '1271991298', '1271991298', '', '孟', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1118', '3', '14', '银都花园', '装修大市证 全套家具家电', '', '0', '1271991299', '1271991299', '', '孟', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1119', '3', '14', '置城国际花园b座房屋出售', '四室朝阳，在东南角', '', '0', '1271991299', '1271991299', '', '刘先生', '13406286864', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1120', '3', '14', '丹桂园小区房屋急售', '一次性付款可改合同', '', '0', '1271991299', '1271991299', '', '孙女士', '13176751838', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1121', '3', '14', '化工实验宿舍', '梦园新苑6楼2室2厅90平方供暖免税35万光河花园4楼116平方供暖55万梦园小区4楼2室1厅60平', '', '0', '1271991299', '1271991299', '', '王女士', '2020296', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1122', '3', '14', '菱花小区房屋急售', '房权证、免税、太阳能', '', '0', '1271991301', '1271991301', '', '孙女士', '13563750660', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1123', '3', '14', '日照望海公寓出售', '交通便利，距万平口一公里，繁华商业区，小区内绿化面积大，物业管理齐全。', '', '0', '1271991301', '1271991301', '', '张女士', '13506380919', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1124', '3', '14', '精装房出售', '', '', '0', '1271991302', '1271991302', '', 'jninfo王', '13863721675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1125', '3', '14', '开泰花园高层出售、九九花园6层92平、装修、有暖气36万价格', '开泰1层、100平带27平车库、50万、位置优越、价格可议、鸿顺花园6层85平、33万、免税', '', '0', '1271991302', '1271991302', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1126', '3', '14', '菱花小区房屋急售', '另有2楼86平方米一套免税房25万元', '', '0', '1271991303', '1271991303', '', '申女士', '2307790', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1127', '3', '14', '急售房', '价格面议', '', '0', '1271991303', '1271991303', '', '蒋先生', '15853722537', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1128', '3', '14', '丹桂园房屋急售', '', '', '0', '1271991303', '1271991303', '', '申女士', '2307790', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1129', '3', '14', '杨柳国际新城房屋出售', '阁楼面积88平方', '', '0', '1271991304', '1271991304', '', '王先生', '15064731027', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1130', '3', '14', '九九花园、九九6层2＊1、92平方、简装、33万、鸿顺6层8', '益民小区3层78平、上储03年房、31万', '', '0', '1271991304', '1271991304', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1131', '3', '14', '明珠花园翠竹园免税房出售', '全套整体厨房，名牌卫浴', '', '0', '1271991305', '1271991305', '', '赵先生', '13054991999', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1132', '3', '14', '平房出售', '独院，带配房，两证齐全，20万元（含过户费用），位置优越。', '', '0', '1271991305', '1271991305', '', '姚先生', '13963737318', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1133', '3', '14', '光和花园3楼免税85平米精装，城中花园145平1层暖27库5', '郭家花园105平17库该合同暖新房58万，锦华143平6层暖52万市免', '', '0', '1271991306', '1271991306', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1134', '3', '14', '博古庄回迁楼转让', '交房办理大市证', '', '0', '1271991307', '1271991307', '', '姜', '15265871234', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1135', '3', '14', '好房出售', '单位宿舍、安全。一层一户、安静！', '', '0', '1271991308', '1271991308', '', '王', '13505371991', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1136', '3', '14', '售房', '', '', '0', '1271991308', '1271991308', '', '李女士', '13665371606', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1137', '3', '14', '门面出售', '', '', '0', '1271991308', '1271991308', '', '赵先生', '2736388', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1138', '3', '14', '房屋出售', '全新', '', '0', '1271991309', '1271991309', '', '牛女士', '15153125954', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1139', '3', '14', '吉房出售', '免税', '', '0', '1271991310', '1271991310', '', '女士', '2869620', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1140', '3', '14', '光明小区阁楼转让', '', '', '0', '1271991310', '1271991310', '', '张先生', '13853755553', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1141', '3', '14', '科苑路明珠花园东云轩出售133平，储2间（改合同）', '紧邻育才中学科苑路与洸河路交汇处，价格包含办房产证，直接改合同，不用交税', '', '0', '1271991310', '1271991310', '', '魏先生', '18605373099', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1142', '3', '14', '都市豪庭', '', '', '0', '1271991311', '1271991311', '', 'jninfo', '2337396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1143', '3', '14', '冠亚星城108平三期现房急售', '另外：冠亚星城三期8楼113平3室2厅1卫56万', '', '0', '1271991312', '1271991312', '', '鲁房置换29分店', '15053722648', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1144', '3', '14', '市政府附近 供暖房', '仙营宾馆附近 六楼三室二厅 142平方储 免税50万 火车站附近 一楼三室一厅 105平方车库45万', '', '0', '1271991313', '1271991313', '', '张女士', '0537-2130210', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1145', '3', '14', '新苑雅居小高层出售', '', '', '0', '1271991313', '1271991313', '', '徐女士', '13953705675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1146', '3', '14', '天亿房产', '太白小区40平米顶层1室1厅15万，来鹤南区61平米2楼2室1厅25万，工人医院附近68平3楼21万', '', '0', '1271991313', '1271991313', '', '谢', '2991187', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1147', '3', '14', '光河花园，兴唐，九九、梦园、长安花园、开泰，永兴，益民多套房', '长安2楼105平3室2厅45万，3楼84平36万，3楼78平2室1厅32.6万，6楼78平32.6万', '', '0', '1271991314', '1271991314', '', '长安房产信息中心', '29920172728178', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1148', '3', '14', '崇文名都小区房屋出售', '', '', '0', '1271991314', '1271991314', '', '范女士', '2979985', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1149', '3', '14', '锦华组团143平6层暖市免50万，教育学院110平暖市证50', '益民东区95平市证43万，另134平5层精装55万市证', '', '0', '1271991315', '1271991315', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1150', '3', '14', '银都花园', '证 暖气 装修', '', '0', '1271991315', '1271991315', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1151', '3', '14', '城中花园145平1层27库暖精装07年市证58万，光合花园1', '古皆园59平2层市免26万，金陵小区67平3层市免30万，附高附近80平3层市证30万，', '', '0', '1271991315', '1271991315', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1152', '3', '14', '金茂康桥 皇营', '证', '', '0', '1271991316', '1271991316', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1153', '3', '14', '开泰花园小高层8层出售、九九花园6层92平、装修、有暖气36', '开泰1层、100平带27平车库、50万、位置优越、价格可议、鸿顺花园6层85平、33万、免税', '', '0', '1271991317', '1271991317', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1154', '3', '14', '长安花园新房出租出售 78平86平95平105平122平【多', '3楼78平2室1厅32.6万，6楼78平32.6万，4楼122平车库25平62万，1楼96平3室45', '', '0', '1271991318', '1271991318', '', '长安房产信息中心', '29920172728178', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1155', '3', '14', '吉房出售', '', '', '0', '1271991319', '1271991319', '', '张 女士', '2660389', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1156', '3', '14', '银都花园精装家具家电车库出售', '另有5楼150平精装70万，6楼138平43万……', '', '0', '1271991319', '1271991319', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1157', '3', '14', '出售楼房', '另赠65平方米阁楼、改合同', '', '0', '1271991319', '1271991319', '', '李女士', '15820078182', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1158', '3', '14', '明珠小区楼房出售', '另有5楼88平40万金茂康桥3楼72平31。5万，长虹6。7楼140平36万，阳光花园南6楼80', '', '0', '1271991320', '1271991320', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1159', '3', '14', '阳光花园南单位房暖气', '另有阳光花园2楼81平31万西红庙6楼103平+阁楼免税36万', '', '0', '1271991320', '1271991320', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1160', '3', '14', '润和春天a座12楼出售', '', '', '0', '1271991321', '1271991321', '', '曹女士', '15605376676', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1161', '3', '14', '东门一楼暖房。太白。鲁抗。红西22万。吉祥22万等急售]]]', '鲁抗4楼3室73方暖30万.鱼山3楼57方25.5万', '', '0', '1271991321', '1271991321', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1162', '3', '14', '鸿顺豪园房屋出售', '', '', '0', '1271991322', '1271991322', '', '廉先生', '13853762788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1163', '3', '14', '丹桂苑新房出售', '可改合同，可贷款，东户', '', '0', '1271991323', '1271991323', '', '王女士', '13583757266', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1164', '3', '14', '火炬路与太白路交界（丹桂园小区）房屋出售', '', '', '0', '1271991325', '1271991325', '', '李先生', '15506371111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1165', '3', '14', '益民东区100平3层暖市免50万，136平3层暖市免66万，', '卫校90平3层暖精装36万包过户，鲁抗80平4层市证27.8包过户。', '', '0', '1271991325', '1271991325', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1166', '3', '14', '光河花园1楼81平急售36万，九九花园28万', '长安花园3楼2室80平32万；长安花园96平45万；九九5楼2室78平28万；', '', '0', '1271991326', '1271991326', '', '长安房产信息中心：李', '29920172728178', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1167', '3', '14', '核桃园路营业房出售', '有很大升值潜力', '', '0', '1271991326', '1271991326', '', '吴先生', '15318173236', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1168', '3', '14', '恒丰苑小高层158平方80万。绿地106平方40万。光明15', '邮电新苑六楼 150平方 45万。科苑三楼 110平方 50万。龙翔花园一楼 103平方 车库65万', '', '0', '1271991326', '1271991326', '', '张女士', '0537-2130210', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1169', '3', '14', '火车站附近', '都市花园 七楼三室二厅 132平方 4600/平方。菱花小区 一楼三室一厅 104平方 有院 31万', '', '0', '1271991327', '1271991327', '', '张女士', '0537-2130210', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1170', '3', '14', '古槐家园', '市证。', '', '0', '1271991327', '1271991327', '', 'jninfo', '2337396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1171', '3', '14', '冠亚星城西邻单位宿舍急售', '有停车位和储藏室物业好', '', '0', '1271991327', '1271991327', '', '小秦', '15964105563', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1172', '3', '14', '森泰御城楼房出售', '更多：96平115平，134平 138平……', '', '0', '1271991328', '1271991328', '', 'jninfo', '2124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1173', '3', '14', '龙城美墅5号楼东一单元703室出售', '', '', '0', '1271991328', '1271991328', '', '赵女士', '13176751596', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1174', '3', '14', '杨柳国际新城b区多层精户型低价出售（非中介）', '带阁楼，43平方米，全名设计，户型合理，可改合同，可贷款', '', '0', '1271991328', '1271991328', '', '陈先生', '013521178075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1175', '3', '14', '开泰花园小高层出售、九九花园6层92平、装修、有暖气36万价', '开泰1层、100平带27平车库、50万、位置优越、价格可议、鸿顺花园6层85平、33万、免税', '', '0', '1271991329', '1271991329', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1176', '3', '14', '化工宿舍54方22万。吉祥一楼22万。红星一楼院30万等', '鱼山3楼57方25.5万.贵和一楼72方院子37万.东门一楼86方49', '', '0', '1271991329', '1271991329', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1177', '3', '14', '冠亚星城一期现房出售', '另有森泰御城及鲁兴欣苑 更多：嘉园房产网www.jiayfc.com', '', '0', '1271991330', '1271991330', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1178', '3', '14', '崇文名都南区小高层房屋出售', '非中介', '', '0', '1271991330', '1271991330', '', '田先生', '15653700633', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1179', '3', '14', '森泰御城现房低价出售', '两卧室朝阳，客厅采光好', '', '0', '1271991330', '1271991330', '', '贾先生', '13518652168', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1180', '3', '14', '金茂康桥楼房出售', '更多www.jiayfc.com', '', '0', '1271991331', '1271991331', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1181', '3', '14', '邮电新苑小区好房出售（非中介）', '另有小区内20平米左右门面3间，7600/平米', '', '0', '1271991331', '1271991331', '', '李女士', '2863899', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1182', '3', '14', '光和花园176平1层精装暖25库79万市免，瞬泰园130平2', '冠亚115平11层暖45万，益民东区52平6层精装18万市证，银都110平2层暖市证50万', '', '0', '1271991331', '1271991331', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1183', '3', '14', '关帝庙街2号房屋出售', '家具、双证齐全', '', '0', '1271991332', '1271991332', '', '孙先生', '15963791938', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1184', '3', '14', '租售乔羽路长安花园沿街门面67平96平142平【三套】适合餐', '适合餐饮，超市，门诊，医药，美发，网吧等，附近有光河，兴唐，梦园，鸿顺，长安等高档小区，人口居住集中', '', '0', '1271991332', '1271991332', '', '李', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1185', '3', '14', '崇文名都现房急售', '大市证', '', '0', '1271991332', '1271991332', '', '张女士', '15953490353', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1186', '3', '14', '出售住房一套', '免税', '', '0', '1271991333', '1271991333', '', '张小姐', '13325193396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1187', '3', '14', '杨柳国际新城b区多层精品户型低价出售（非中介）', '全明设计，户型合理，改合同，可贷款', '', '0', '1271991333', '1271991333', '', '李先生', '13666374344', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1188', '3', '14', '水岸盛世', '水岸盛世68平方29万。124平方65万。', '', '0', '1271991334', '1271991334', '', '徐女士', '0537-2722318', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1189', '3', '14', '红星新苑暖房出售', '双证、免税', '', '0', '1271991335', '1271991335', '', '倪女士', '2829978', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1190', '3', '14', '运河盛世小高层新房市证出售', '邮电小区4楼126平方免税房出售', '', '0', '1271991335', '1271991335', '', '宫老师', '13082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1191', '3', '14', '水岸盛世', '', '', '0', '1271991335', '1271991335', '', '徐女士', '0537-2722318', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1192', '3', '14', '单位宿舍房新房出售', '首付15万元', '', '0', '1271991336', '1271991336', '', '吴女士', '13563779232', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1193', '3', '14', '舜泰园高层房屋出售', '', '', '0', '1271991337', '1271991337', '', '刘先生', '15318178895', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1194', '3', '14', '银都小区 好房源急急急非诚勿扰', '证', '', '0', '1271991337', '1271991337', '', '孟', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1195', '3', '14', '新世纪花园1楼155平方车库20平方05年市证93万', '永泰新景湾17楼新房109平方改合同', '', '0', '1271991337', '1271991337', '', '宫老师', '13082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1196', '3', '14', '银都花园 非诚勿扰', '大市证', '', '0', '1271991337', '1271991337', '', '孟老师', '2662810', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1197', '3', '14', '西红庙6楼103平方自装阁楼免税房出售', '兴唐经典6楼142.6平方3室2厅2卫精装车位市证68万', '', '0', '1271991338', '1271991338', '', '宫老师', '13082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1198', '3', '14', '[[市委]]附近暖房35万。益民东区。32万十五中。17万急', '太百4楼50方23万.吉祥一楼47方22万', '', '0', '1271991338', '1271991338', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1199', '3', '14', '单位房急售', '', '', '0', '1271991338', '1271991338', '', '梁先生', '13583720587', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1200', '3', '14', '房屋急售', '安全、保安设施都挺好', '', '0', '1271991339', '1271991339', '', '白先生', '13705379400', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1201', '3', '14', '森泰御城多套楼房急售', '价格含车位8万 储13平全包括，另有98平，101平115平134平', '', '0', '1271991339', '1271991339', '', 'jninfo', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1202', '3', '14', '光明小区阁楼出售', '', '', '0', '1271991340', '1271991340', '', '张先生', '13853755553', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1203', '3', '14', '杨柳国际新城h区房屋出售', '非中介，价格可面议', '', '0', '1271991340', '1271991340', '', '何先生', '13863786980', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1204', '3', '14', '鸿顺花园出售、开泰3层96平、改合同、可贷款、36万新房', '恒泰园小区3层76平、39.8万、过户费低，金华小区6层84平、30万急售、', '', '0', '1271991341', '1271991341', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1205', '3', '14', '长虹小区复式楼房出售（免税）', '更多信息：www.jiayfc.com', '', '0', '1271991341', '1271991341', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1206', '3', '14', '市中区仙营绿地西临单位宿舍出售', '大市证。通风采光，所在楼层最佳。价格可面议。', '', '0', '1271991341', '1271991341', '', '周先生', '2383258', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1207', '3', '14', '益民东区76平3层市证31万03年，李楼新区104平4层市免', '阳光城市花园110平7层47万，永泰93平7层暖2万转让费', '', '0', '1271991342', '1271991342', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1208', '3', '14', '吉祥105平4层精装市免三阳45万，洪顺85平6层市免34万', '光明小区172平2层暖精装市证26库75.8万，光和花园168平1层暖精装市证78万', '', '0', '1271991343', '1271991343', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1209', '3', '14', '置城中央公园租售房屋', '三室朝阳 QQ联系方式 1055531946 注：可以改合同', '', '0', '1271991344', '1271991344', '', '杨女士', '0537-2219779', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1210', '3', '14', '凤凰城运西家园4楼92平方米出售', '', '', '0', '1271991344', '1271991344', '', '康先生', '15563700009', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1211', '3', '14', '好房出售', '银都1楼100平3*2*1车库30平52万', '', '0', '1271991345', '1271991345', '', '陈老师', '13854794861', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1212', '3', '14', '博物馆暖。益民东。十五中17万。安阜街。鲁抗。北门等房出售]', '吉祥一楼47方院22万.益东区3楼76方32万.东门一楼86暖49万', '', '0', '1271991345', '1271991345', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1213', '3', '14', '瑞和春天小区房屋出售', '', '', '0', '1271991345', '1271991345', '', '时先生', '2814488', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1214', '3', '14', '吉祥105平4层精装市免三阳45万，洪顺85平6层市免34万', '光明小区172平2层暖精装市证26库75.8万，光和花园168平1层暖精装市证78万', '', '0', '1271991346', '1271991346', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1215', '3', '14', '开泰花园沿街房出售、开泰高层1层127平方、精装修、46万、', '郭家花园小高层5层、133平方、55万、卖方负责改合同', '', '0', '1271991347', '1271991347', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1216', '3', '14', '兴唐经典南邻90平2层27平库暖市免46万06年新原房，光和', '龙城美墅56平2层22万该合同，关帝庙46平3层市免20万', '', '0', '1271991347', '1271991347', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1217', '3', '14', '银都花园商品房', '土地证 房产证齐全更多信息2662810', '', '0', '1271991348', '1271991348', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1218', '3', '14', '琵琶山小区', '市证、有税；三室朝阳', '', '0', '1271991348', '1271991348', '', '郑女士', '15163723269', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1219', '3', '14', '郭家花园125平5层暖精装55万市免，兴东新区78平暖6层2', '铁塔寺70平暖2层市免38万，龙行78平2层暖 33万，光明172平2层26库暖76万', '', '0', '1271991348', '1271991348', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1220', '3', '14', '银都花园80平暖房30万 非诚勿扰', '证 可贷款非诚勿扰扰', '', '0', '1271991349', '1271991349', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1221', '3', '14', '崇文名都小区（现改为菱云金都小区）', '价格面议', '', '0', '1271991349', '1271991349', '', '蔡先生', '13563755511', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1222', '3', '14', '南苑社区有一民房出售或出租', '出租600元/月', '', '0', '1271991350', '1271991350', '', '张先生', '13963769139', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1223', '3', '14', '益民东区77平1层2000年市证31万，古槐商务楼65平4层', '光明小区172平2层暖精装市证26库75.8万，光和花园168平1层暖精装市证78万', '', '0', '1271991350', '1271991350', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1224', '3', '14', '谢营小区（济宁大学对过）房屋出售', '', '', '0', '1271991351', '1271991351', '', '李女士', '13355165758', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1225', '3', '14', '2院东临2005年免税装修房出售', '2005年房，上储，免税', '', '0', '1271991351', '1271991351', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1226', '3', '14', '郭家花园房屋出售', '开泰96平方、2*2、3层、卖方负责改合同、可贷款', '', '0', '1271991351', '1271991351', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1227', '3', '14', '出售住房一套', '家具、家电', '', '0', '1271991352', '1271991352', '', '王先生', '13793750155', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1228', '3', '14', '租售乔羽路长安花园沿街门面67平96平142平【三套】适合餐', '适合餐饮，超市，门诊，医药，美发，网吧等，附近有光河，兴唐，梦园，鸿顺，长安等高档小区，人口居住集中', '', '0', '1271991352', '1271991352', '', '李', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1229', '3', '14', '开泰花园 吉房出售', '精装修', '', '0', '1271991352', '1271991352', '', '苏小姐', '0537-2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1230', '3', '14', '运河一楼。枣店阁。龙行17万。来褐。玉苑等房急售[[[[[[', '玉苑2楼62方26万.琵琶山5楼54方23万吉祥一楼47方院22万', '', '0', '1271991353', '1271991353', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1231', '3', '14', '科苑路明珠花园东云轩出售133平，储2间', '紧邻育才中学科苑路与洸河路交汇处，价格包含办房产证', '', '0', '1271991353', '1271991353', '', '魏先生', '18605373099', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1232', '3', '14', '欣苑雅居高层有豪华装修房出售', '兴唐金茂大厦有186平米写字楼一间，出售，7500元/平方米', '', '0', '1271991353', '1271991353', '', '殷女士', '15910000379', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1233', '3', '14', '圣德滨湖花园多层电梯公寓出售（非中介）', '', '', '0', '1271991354', '1271991354', '', '张女士', '2662778', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1234', '3', '14', '益民东区77平1层2000年市证33万，古槐商务楼65平4层', '长安70平5层18万，冠亚116平11层暖45万该合同，都市花园135.5平4层24库该合同68.8', '', '0', '1271991354', '1271991354', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1235', '3', '14', '房屋出售', '大市政', '', '0', '1271991354', '1271991354', '', '刘先生', '15866089456', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1236', '3', '14', '长虹小区复式楼房出售', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991355', '1271991355', '', '济宁嘉园房产中介', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1237', '3', '14', '阳光河畔吉房出售', '带车库，因急需用钱现低价转让可直接转让合同', '', '0', '1271991355', '1271991355', '', '张女士', '13853758555', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1238', '3', '14', '明珠花园有房出售', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991356', '1271991356', '', '济宁嘉园房产中介', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1239', '3', '14', '杨柳国际新城b区现房出售', '阁楼43平方，可按揭', '', '0', '1271991356', '1271991356', '', '陈先生', '13521178075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1240', '3', '14', '新苑雅居小区小高层出售', '', '', '0', '1271991356', '1271991356', '', '徐女士', '13953705675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1241', '3', '14', '森泰御城新房低价出售', '两卧室朝阳，客厅采光好，房间布局合理，可自建空中花园或宠物房。', '', '0', '1271991357', '1271991357', '', '贾先生', '13518652168', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1242', '3', '14', '多层电梯房急售（非中介）', '高档住宅区', '', '0', '1271991358', '1271991358', '', '张女士', '15563737333', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1243', '3', '14', '梦圆小区房屋出售', '可面议', '', '0', '1271991359', '1271991359', '', '徐老师', '15854797103', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1244', '3', '14', '开泰花园出售、开泰高层1层3室2厅127平、精装修、46万急', '益民小区1层58平方带院、25万包税、精装修、金华3层84平、34万', '', '0', '1271991360', '1271991360', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1245', '3', '14', '益民东区。鱼山58方3楼25。5万。来鹤。淮河局等房急售]]', '吉祥一楼47方22.5万院.明珠4楼50方22万.运河5楼50方21', '', '0', '1271991360', '1271991360', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1246', '3', '14', '杨柳国际新城房屋出售', '', '', '0', '1271991360', '1271991360', '', '蔡女士', '15318189826', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1247', '3', '14', '中泰丰源小高层出售，新房，急售，价格面议', '', '', '0', '1271991361', '1271991361', '', '冯先生', '18953761852', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1248', '3', '14', '低价单位集资期房出售', '', '', '0', '1271991361', '1271991361', '', '先生', '13562783682', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1249', '3', '14', '明珠小区祥和园33万，不诚勿扰', '大市证', '', '0', '1271991362', '1271991362', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1250', '3', '14', '来鹤小区', '免税', '', '0', '1271991362', '1271991362', '', '徐女士', '0537-2722318', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1251', '3', '14', '长虹小区房屋出售', '免税、大市证，各证齐全', '', '0', '1271991363', '1271991363', '', '丁女士', '0537-2997918', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1252', '3', '14', '洸和花园豪华复式楼出售', '20平方米天台，如需看房照片，请进QQ空间，QQ：1339275149', '', '0', '1271991364', '1271991364', '', '孙女士', '13805377390', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1253', '3', '14', '龙行小区免税房出售', '', '', '0', '1271991364', '1271991364', '', '孔女士', '2190108', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1254', '3', '14', '济邹路圣景小区有房出售', '大市证', '', '0', '1271991365', '1271991365', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1255', '3', '14', '银都花园有房出售', '双证齐全', '', '0', '1271991366', '1271991366', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1256', '3', '14', '长虹商品房5楼120平带车库装修 急急急', '带车库大市证 可办银行按揭', '', '0', '1271991367', '1271991367', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1257', '3', '14', '好房出售', '', '', '0', '1271991368', '1271991368', '', '杨女士', '15054756788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1258', '3', '14', '鲁抗小区76平米好户型免税房出售', '鲁抗家政另有多套好房出租', '', '0', '1271991368', '1271991368', '', '赵先生', '13863791993', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1259', '3', '14', '急售阳光花园房屋', '', '', '0', '1271991368', '1271991368', '', '郑女士', '15163723269', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1260', '3', '14', '租售乔羽路长安花园沿街门面67平96平142平【三套】适合餐', '适合餐饮，超市，门诊，医药，美发，网吧等，附近有光河，兴唐，梦园，鸿顺，长安等高档小区，人口居住集中', '', '0', '1271991369', '1271991369', '', '李', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1261', '3', '14', '鲁强小区（无里营）', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991369', '1271991369', '', 'jninfo嘉园房产', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1262', '3', '14', '都市花园172平1层35库暖83万，另124平1层暖市证56', '古皆园70平5层暖市免36万，铁塔寺70平2层精装市免40万，另66平4层市免32万', '', '0', '1271991371', '1271991371', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1263', '3', '14', '开泰花园小高层1层急售', '铁塔寺小区、7层*3*1、90平、5平方、96年房、49万', '', '0', '1271991371', '1271991371', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1264', '3', '14', '菱花小区多套楼房出租出售', '市证', '', '0', '1271991371', '1271991371', '', '菱花中介', '2187086', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1265', '3', '14', '凌云小区房屋出售', '有大市政、免税', '', '0', '1271991372', '1271991372', '', '刘女士', '2858632', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1266', '3', '14', '银都花园 金茂康桥各有31万房屋一套', '金茂6楼97平该合同 本店另有齐鑫 明珠 冠亚 琵琶山 森泰等小区信息', '', '0', '1271991372', '1271991372', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1267', '3', '14', '军分区宿舍', '渔山小区4楼67平免税29万3室1厅', '', '0', '1271991373', '1271991373', '', '嘉润泰和房产', '3930799', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1268', '3', '14', '铁塔寺小区（霍小学区）房屋出售', '价格可面议，位于霍小东西校区之间', '', '0', '1271991373', '1271991373', '', '房先生', '13964998857', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1269', '3', '14', '急售铁塔寺小区房屋', '结构很合理，两室朝阳', '', '0', '1271991373', '1271991373', '', '朱小姐', '13562707156', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1270', '3', '14', '医药公司暖房出售', '', '', '0', '1271991374', '1271991374', '', '闫女士', '2181948', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('1271', '3', '14', '舜泰园小区房屋出售', '', '', '0', '1271991374', '1271991374', '', '苏女士', '13153703870', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1272', '3', '14', '来鹤小区房屋出售', '加18平方米阳台', '', '0', '1271991374', '1271991374', '', '张先生', '13953779977', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1273', '3', '14', '明珠小区139平49万，急售', '未装修，大市证，防盗门，封阳台', '', '0', '1271991375', '1271991375', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1274', '3', '14', '梦圆南区67平3层市免27万，90平3层合同房25万，120', '博古园96平4层05年40万，益民西区65平4层25万，84平3层34万市免，80平4层33万', '', '0', '1271991375', '1271991375', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1275', '3', '14', '吉房出售', '无房产证，单位宿舍改合同，非诚勿扰！', '', '0', '1271991375', '1271991375', '', '李先生', '13365473355', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1276', '3', '14', '郭家花园95平5层暖精装38万市证，兴东新区78平暖6层29', '西城实小75平3层26万市证，九九115平4层暖市证50万，兴唐115平6层电梯暖市证55万30库', '', '0', '1271991376', '1271991376', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1277', '3', '14', '附院附近102平2层暖市证46万，霍小126平4层精装市免5', '益民西区85平5层市免36万80平4层精装市证2000年33万，吉安南区85平25库3层暖精市证47', '', '0', '1271991377', '1271991377', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1278', '3', '14', '东门49万。铁塔市22万。十五中17万。太白等房急售====', '贵和2楼91方暖46万.北门3楼57方26万', '', '0', '1271991377', '1271991377', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1279', '3', '14', '菱花小区售房', '大市证', '', '0', '1271991377', '1271991377', '', '侯女士', '2020509', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1280', '3', '14', '商品房出售', '大市政', '', '0', '1271991378', '1271991378', '', '刘老师', '13676372086', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1281', '3', '14', '银都花园 商品暖 车库中介勿扰', '证 带车库', '', '0', '1271991378', '1271991378', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1282', '3', '14', '西关体育场附近单位房', '其他更多房源：嘉园房产网：www.jiayfc.com', '', '0', '1271991379', '1271991379', '', '济宁嘉园房产中介', '212477715054730990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1283', '3', '14', '梦圆欣苑低价转让！！ 1楼', '金方圆房产为您找个舒心的家！更多房源欢迎来电咨询！', '', '0', '1271991379', '1271991379', '', '田老师', '3202811', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1284', '3', '14', '江南美食城300平1-3层1000元每平，杨柳总6层电梯3层', '益民东区73平4层暖03年35万市免，党校53平2层精装市免25.5万，李楼新区107平4层07年市', '', '0', '1271991380', '1271991380', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1285', '3', '14', '光和花园166平4层精装暖43库88万，另93平1层42。5', '李楼新村107平4层37万市民05年，古槐家园188平9层71万该合同', '', '0', '1271991381', '1271991381', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1286', '3', '14', '开泰花园新房改合同出售', '开泰花园6层复式132平、阁楼100平方、车库25平方、装修、50万、', '', '0', '1271991382', '1271991382', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1287', '3', '14', '五里营济州路口向北100米路东房屋出售', '单位宿舍，无房权证可改合同，非诚勿扰', '', '0', '1271991383', '1271991383', '', '李先生', '13365473355', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1288', '3', '14', '鲁源宿舍16万', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991383', '1271991383', '', '济宁嘉园房产中介', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1289', '3', '14', '九巨龙大市场商务公寓', '九巨龙兴盛楼，运河西边，龙行路南边，地理位置极佳。送阁楼，阁楼面积也是136平方。', '', '0', '1271991383', '1271991383', '', '王先生', '15266372528', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1290', '3', '14', '舜泰园大高层出售', '有公用停车位', '', '0', '1271991384', '1271991384', '', '杜先生', '13963771100', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1291', '3', '14', '都市豪情现房出售', '5300元每平方米', '', '0', '1271991384', '1271991384', '', '李先生', '13395371567', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1292', '3', '14', '科苑路明珠花园东云轩出售150平，储2间', '紧邻育才中学科苑路与洸河路交汇处', '', '0', '1271991384', '1271991384', '', '魏先生', '18605373099', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1293', '3', '14', '二手房出售', '搬进去即可居住，有房产证、土地分割证', '', '0', '1271991385', '1271991385', '', '马先生', '13793791977', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1294', '3', '14', '梦圆南区90平3层25万，另120平5层35万，另89平2层', '益民东区73平4层暖03年35万市免，党校53平2层精装市免25.5万，李楼新区107平4层07年市', '', '0', '1271991386', '1271991386', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1295', '3', '14', '银都花园', '证', '', '0', '1271991386', '1271991386', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1296', '3', '14', '银都花园  非诚勿扰', '证另有5楼105平47万 6楼138平42万', '', '0', '1271991386', '1271991386', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1297', '3', '14', '汽车北站单位房  非诚勿扰', '证 免税', '', '0', '1271991387', '1271991387', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1298', '3', '14', '五里营济邹路口向北100米路东房屋出售', '单位宿舍，可改合同，无房证，非诚勿扰。', '', '0', '1271991387', '1271991387', '', '李先生', '13365473355', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1299', '3', '14', '出售杨柳9楼高层（主体已经竣工）', '', '', '0', '1271991389', '1271991389', '', '苏老师', '13685472101', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1300', '3', '14', '租售乔羽路长安花园沿街门面22平30平67平96平142平2', '230平租4500售126万，320平租6000售159万，附近有光河兴唐梦园鸿顺长安等高档小区', '', '0', '1271991389', '1271991389', '', 'jninfo', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1301', '3', '14', '杨柳国际新城房屋出售', '有三套分别位于24 、25、 26层', '', '0', '1271991390', '1271991390', '', '李女士', '13854718008', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1302', '3', '14', '益民东区73平4层暖市证30万，置成68平23层市证商务39', '来鹤北85平3层暖设施市证38万，党校57平2层精装市免25.5万，另，91平3层36万', '', '0', '1271991391', '1271991391', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1303', '3', '14', '运河盛世有房出售', '大市证，可过户', '', '0', '1271991391', '1271991391', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1304', '3', '14', '龙行3楼17万。太白一楼17。5万。市委。齐鑫。等好房急售', '北门3楼2室暖房41万。铁塔3楼2室42方22万', '', '0', '1271991392', '1271991392', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1305', '3', '14', '明珠花园商品暖房 非诚勿扰15092662788', '证中介勿扰', '', '0', '1271991393', '1271991393', '', '孟', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1306', '3', '14', '长虹小区房屋出售', '', '', '0', '1271991394', '1271991394', '', '王女士', '15318185178', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1307', '3', '14', '郭家花园95平5层暖精装42万市免，水岸盛世137平17层该', '光和花园93平1层朝阳精市证40万，另100平4层市免48万，梦圆91平3层25万。益东73平30万', '', '0', '1271991394', '1271991394', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1308', '3', '14', '杨柳国际新城有多套吉房出售/出租', '面积有86-130平方米，售价26-34万，楼层有2-6层', '', '0', '1271991394', '1271991394', '', '王女士', '15318185178', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1309', '3', '14', '银都花园怡心园', '证 带车库', '', '0', '1271991396', '1271991396', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1310', '3', '14', '九九花园多层新房出售', '有大市政，车库在自己房底。', '', '0', '1271991396', '1271991396', '', '张女士', '13793759870', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1311', '3', '14', '明珠商品房 精装修 带车库急出售50万非诚勿扰', '证 带车库', '', '0', '1271991397', '1271991397', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1312', '3', '14', '香格里拉对面国贸小高层', '', '', '0', '1271991397', '1271991397', '', '陈老师', '13258016176', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1313', '3', '14', '恒泰苑小区房屋出售', '有双证，送40平方米阁楼', '', '0', '1271991398', '1271991398', '', '刘先生', '13583766244', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1314', '3', '14', '银都花园 单位房急卖', '证', '', '0', '1271991398', '1271991398', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1315', '3', '14', '崇文名都南区小高层出售', '', '', '0', '1271991398', '1271991398', '', '田先生', '15653700633', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1316', '3', '14', '望湖小区暖房、双证', '', '', '0', '1271991398', '1271991398', '', '刘', '13963738533', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1317', '3', '14', '森泰御城新房出售', '两卧室朝阳、客厅采光好、可自建空中花园或宠物房、免3年物业费、相关开口费已缴清。', '', '0', '1271991399', '1271991399', '', '贾先生', '13518652168', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1318', '3', '14', '菱花售房', '', '', '0', '1271991400', '1271991400', '', '菱花中介', '2187086', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1319', '3', '14', '东发小区有房出售', '', '', '0', '1271991400', '1271991400', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1320', '3', '14', '凌云售房', '', '', '0', '1271991401', '1271991401', '', '菱花中介', '2187086', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1321', '3', '14', '来鹤北小区', '', '', '0', '1271991401', '1271991401', '', '嘉润泰和房产', '3930799', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1322', '3', '14', '益民东区73平4层暖03年市证30万，置成68平24层市证商', '附高86平4层市免32万，啤酒厂76平3层25万。益民73平4层32万73平4层27万，58平1层', '', '0', '1271991402', '1271991402', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1323', '3', '14', '森泰，冠亚，明珠楼房出售', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991402', '1271991402', '', 'jninfo嘉园房产', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1324', '3', '14', '南苑社区急售房屋', '价格可议，可改合同', '', '0', '1271991403', '1271991403', '', '张女士', '13615372625', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1325', '3', '14', '金乡灯塔附近银行宿舍出售', '', '', '0', '1271991403', '1271991403', '', '张女士', '13153736858', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1326', '3', '14', '杨柳国际新城楼房出售', '阁楼50平方', '', '0', '1271991403', '1271991403', '', '王老师', '13854791671', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1327', '3', '14', '新房新装修急售', '因急需资金，结婚用新房，精装修急售', '', '0', '1271991403', '1271991403', '', '马小姐', '15092656566', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1328', '3', '14', '凌云小区房屋出售', '', '', '0', '1271991404', '1271991404', '', '李女士', '13686377877', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1329', '3', '14', '明珠小区房屋出售', '', '', '0', '1271991405', '1271991405', '', '高先生', '15905371966', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1330', '3', '14', '微山县文化路中段单位房出售', '', '', '0', '1271991406', '1271991406', '', '孙先生', '13676379619', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1331', '3', '14', '急售杨柳国际新城b区', '急售！！', '', '0', '1271991406', '1271991406', '', '蔡女士', '15969979826', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1332', '3', '14', '低价出售丹桂苑单位房', '同等房源市场价格3920元/平方，可以贷款，卖方负责改名费', '', '0', '1271991407', '1271991407', '', '王老师', '13583757266', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1333', '3', '14', '开泰花园', '开泰花园 152平方 车库26平方精装修 四楼三室两厅两卫65万', '', '0', '1271991407', '1271991407', '', '苏小姐', '0537-2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1334', '3', '14', '圣德滨湖花园电梯公寓出售', '个人房屋、非中介', '', '0', '1271991407', '1271991407', '', '张女士', '13668679990', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1335', '3', '14', '单位宿舍出售', '有楼宇对讲门、防盗网', '', '0', '1271991408', '1271991408', '', '徐女士', '13791738781', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1336', '3', '14', '二十里铺政府驻地楼房出售', '', '', '0', '1271991408', '1271991408', '', '王先生', '13963753600', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1337', '3', '14', '益民东区120平4层暖精装市证南大门50万，铁塔市北临100', '长安花园120平5层暖原房该合同没有其他费用42万，另，160平6-7复试原房现房该合同37万', '', '0', '1271991408', '1271991408', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1338', '3', '14', '开泰花园高层', '！！！！ 开泰花园有多套房屋出租出售！！！！！！', '', '0', '1271991409', '1271991409', '', '苏小姐', '0537-2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1339', '3', '14', '建设路北', '', '', '0', '1271991410', '1271991410', '', 'jninfo', '13475759777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1340', '3', '14', '制镜厂附近房屋出售', '价格可面议', '', '0', '1271991410', '1271991410', '', '张女士', '13853731687', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1341', '3', '14', '古槐家园北', '', '', '0', '1271991410', '1271991410', '', 'jninfo', '13475759777', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1342', '3', '14', '房屋出售', '价格可面议', '', '0', '1271991411', '1271991411', '', '张女士', '13853731687', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1343', '3', '14', '置城国际花园b座房屋出售', '四间朝阳', '', '0', '1271991411', '1271991411', '', '刘女士', '13854794563', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1344', '3', '14', '长安120平5层暖开口上房已交该合同42万，另6层10560', '光和花园93平1层朝阳精市证40万，另85平4层暖精装市免39万，梦圆91平3层25万。益民东73平', '', '0', '1271991411', '1271991411', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1345', '3', '14', '铁塔寺片区房屋出售', '有60平方米和63平方米多套，霍小学区，多层框架，起价4300元/平方米', '', '0', '1271991412', '1271991412', '', '宋先生', '15054797434', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1346', '3', '14', '益民东区73平4层市证32万，置成68平23层市证商务39万', '兴唐120平4层暖53.8万市证，长安110平1层院配房3间35万', '', '0', '1271991413', '1271991413', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1347', '3', '14', '急售苗营小学附近房屋一套', '带院。因急需用钱急售。交通便利，附近有小学，高中，幼儿园。', '', '0', '1271991413', '1271991413', '', '朱女士', '13563777086', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1348', '3', '14', '五里营济邹路口向北100米路东房屋出售', '改合同，非诚勿扰', '', '0', '1271991414', '1271991414', '', '石女士', '13665377215', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1349', '3', '14', '房屋急售', '地上储藏室', '', '0', '1271991414', '1271991414', '', '朱女士', '13563777086', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1350', '3', '14', '红星8号现房', '', '', '0', '1271991414', '1271991414', '', '巩先生', '13853776965', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1351', '3', '14', '济安桥路电厂南郭庄楼房出售', '', '', '0', '1271991415', '1271991415', '', '时先生', '15563700009', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1352', '3', '14', '明珠花园21万8千元急售', '证', '', '0', '1271991415', '1271991415', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1353', '3', '14', '来鹤北区123平5层非顶精03年市免43万，长安105平1层', '金华83平3层市证33万，置成C座商务38万，来鹤96平5层市免36万', '', '0', '1271991415', '1271991415', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1354', '3', '14', '泗水十三中附近单位房出售', '泗水、四合院', '', '0', '1271991416', '1271991416', '', '徐女士', '13963766269', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1355', '3', '14', '中亿新苑6楼7楼复试房 160平包改合同109万', '包改合同', '', '0', '1271991416', '1271991416', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1356', '3', '14', '租售乔羽路长安花园沿街门面22平30平67平96平142平2', '230平租4500售126万，320平租6000售159万，附近有光河兴唐梦园鸿顺长安等高档小区', '', '0', '1271991416', '1271991416', '', '李', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1357', '3', '14', '东发小区楼房出售（精装家具家电）', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991416', '1271991416', '', '济宁嘉园房产中介', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1358', '3', '14', '急需用钱，吉房出售', '', '', '0', '1271991417', '1271991417', '', '刘女士', '13561555000', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1359', '3', '14', '明珠小区小套房22万', 'QQ--110060555', '', '0', '1271991417', '1271991417', '', '宫先生', '15054722890', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1360', '3', '14', '冠亚星城急售', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991417', '1271991417', '', '济宁嘉园房产中介', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1361', '3', '14', '带车库商品房急售', '大市证，已上房，可改合同，价格可议。', '', '0', '1271991417', '1271991417', '', '刘女士', '2183396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1362', '3', '14', '都市花园精装出售', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991418', '1271991418', '', '济宁嘉园房产中介', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1363', '3', '14', '舜泰园 开泰花园出售', '开泰花园 一楼三室两厅两卫精装修 水电气暖 134平方，9平方储藏室。46万', '', '0', '1271991418', '1271991418', '', '苏小姐', '0537-2691398', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1364', '3', '14', '急转现房', '带阁楼，47平方米。新房，可改合同，开户费已交。', '', '0', '1271991419', '1271991419', '', '陈腾', '13521178075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1365', '3', '14', '崇文名都小高层32万出售', '', '', '0', '1271991419', '1271991419', '', '刘女士', '2858632', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1366', '3', '14', '杨柳国际新城b区16号楼房屋出售', '开口费已交清，负责改合同', '', '0', '1271991420', '1271991420', '', '陈先生', '13521178075', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1367', '3', '14', '崇文名都小高层28万出售', '', '', '0', '1271991420', '1271991420', '', '刘女士', '2858632', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1368', '3', '14', '吉祥小区房屋出售', '', '', '0', '1271991421', '1271991421', '', '王先生', '13645472989', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1369', '3', '14', '光和花园93平1层精装全朝阳41万市免。另93平1层三室二厅', '牛市58平1层精装22万，附高86平4层市免31。8万益民东区73平4层03年暖32万，另，', '', '0', '1271991421', '1271991421', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1370', '3', '14', '东发小区。火炬南路。四楼 2室1厅 89平方', '', '', '0', '1271991422', '1271991422', '', '赵女士', '13505379727', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1371', '3', '14', '世纪联华附近', '免税', '', '0', '1271991423', '1271991423', '', '段老师', '2337396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1372', '3', '14', '开泰花园', '！！！！！开泰花园有多套房屋出租出售！！！！！！！！', '', '0', '1271991423', '1271991423', '', '苏小姐', '0537-2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1373', '3', '14', '锦华组团', '有门卫', '', '0', '1271991423', '1271991423', '', '段老师', '2337396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1374', '3', '14', '益民西区免税房出售', '古槐家园附近4层3*1、86平方、储8、免税32万、益民小区1层58平方带院、25万包税、精装修、', '', '0', '1271991423', '1271991423', '', '刘小姐', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1375', '3', '14', '体育馆广场好房出售', '车库26平方 户型很合理 看房方便', '', '0', '1271991424', '1271991424', '', '小秦', '15964105563', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1376', '3', '14', '崇文名都现房低价出售', '育才中学团购房、可直接改签合同，新房现房3楼东首采光最好，最佳性价比、最佳升值潜力。', '', '0', '1271991424', '1271991424', '', '刘先生', '13791767040', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1377', '3', '14', '兴唐经典120平市证4层55万，实小142平5层暖', '北门83平暖3层41.5万，益民东区85平3层40万梦圆90平3层25万', '', '0', '1271991425', '1271991425', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1378', '3', '14', '圆梦信息中心--圆你买房梦。西城实小76平3层市证25万，光', '古槐家园188平9层71万该合同，梦圆南区90平25万，益民西区58平22万1层市证', '', '0', '1271991426', '1271991426', '', '韩先生', '2856658', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1379', '3', '14', '阳光润泽园', '九九花园135平方8楼 三室两厅水电气暖50万', '', '0', '1271991426', '1271991426', '', '苏小姐', '2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1380', '3', '14', '明珠花园暖气商品房急售有车库', '证', '', '0', '1271991427', '1271991427', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1381', '3', '14', '火车站附近有房出售', '', '', '0', '1271991427', '1271991427', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1382', '3', '14', '森泰御城房屋出售', '免3年物业费，合同可更名，相关开口费已全部交清，两卧室朝阳，客厅采光好。', '', '0', '1271991428', '1271991428', '', '贾先生', '13518652168', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1383', '3', '14', '中亿新苑有房出售', '', '', '0', '1271991428', '1271991428', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1384', '3', '14', '1400元一平方米新房出售', '超低价格出售！无房权证可改合同', '', '0', '1271991430', '1271991430', '', '于先生', '13355151118', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1385', '3', '14', '杨柳吉房出售，超值！', '先看房屋相片 请加110060555', '', '0', '1271991431', '1271991431', '', '宫先生', '15054722890', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1386', '3', '14', '阳光城市花园期房出售', '2011年交房首付17万 可贷款 120—150平米任选起步价3550元', '', '0', '1271991431', '1271991431', '', '鲁宁房产', '32871892309123', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1387', '3', '14', '梦圆南区房屋出售', '有土地证', '', '0', '1271991431', '1271991431', '', '程女士', '15153753122', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1388', '3', '14', '出售舜泰园新房', '全朝阳，A户型，可直接过户', '', '0', '1271991431', '1271991431', '', '孙先生', '13853786111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1389', '3', '14', '宁苑花园房屋出售', '', '', '0', '1271991432', '1271991432', '', '韩女士', '15318187217', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1390', '3', '14', '租售乔羽路长安花园沿街门面22平30平67平142平320平', '附近有光河花园，兴唐经典，梦园新苑，鸿顺花园，长安花园等高档小区，人口居住集中，人流量大', '', '0', '1271991432', '1271991432', '', '李', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1391', '3', '14', '银都花园31万', '证', '', '0', '1271991433', '1271991433', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1392', '3', '14', '明珠花园商品房92平车库24平 非诚勿扰 急急急', '证 有车库', '', '0', '1271991434', '1271991434', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1393', '3', '14', '杨柳三室一厅35万', '大市房产证可贷款！2008年底装修！', '', '0', '1271991434', '1271991434', '', '宫先生', '15054722890', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1394', '3', '14', '明珠花园带车库暖出售', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991435', '1271991435', '', '嘉园房产中介 QQ：', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1395', '3', '14', '文化小区（新体育馆北临）2楼81平方免税28万', '仙营绿地 4楼 94平方 供暖市证43万', '', '0', '1271991435', '1271991435', '', '李老师', '2997101', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1396', '3', '14', '嘉祥呈祥小区房屋出售', '', '', '0', '1271991436', '1271991436', '', '田女士', '13705374166', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1397', '3', '14', '出售水岸盛世 两室两厅 81平米 精装修 新房 40万整', '', '', '0', '1271991437', '1271991437', '', '董先生', '15964107555', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1398', '3', '14', '急售南刘庄（实验中学东临）2楼94平方25万 任城证', '可面议另有1楼 81平方有院子 23万 任城证', '', '0', '1271991438', '1271991438', '', 'jninfo', '2997101', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1399', '3', '14', '八里屯温馨花园房屋出售', '', '', '0', '1271991439', '1271991439', '', '先生', '13805373110', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1400', '3', '14', '房屋出售', '车库与储藏室连体', '', '0', '1271991439', '1271991439', '', '姜', '05372260695', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1401', '3', '14', '八里屯小区房屋出售', '', '', '0', '1271991439', '1271991439', '', '先生', '15854748430', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1402', '3', '14', '长安花园多层 1楼西头 最好的位置（靠小区南门）适合经营门诊', '2室朝阳 通阳台 落地窗 超大客厅 有飘窗 供暖 市证 全现浇结构 层高2.9米', '', '0', '1271991440', '1271991440', '', 'jninfo', '2819619', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1403', '3', '14', '运河盛世房屋出售', '', '', '0', '1271991440', '1271991440', '', '董先生', '15964107555', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1404', '3', '14', '置城中央公园b座房屋出售', '3间朝阳', '', '0', '1271991441', '1271991441', '', '刘女士', '13854794563', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1405', '3', '14', '益民西区14号楼中单元一楼西户', '储藏室免费', '', '0', '1271991442', '1271991442', '', '郭先生', '15106780672', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1406', '3', '14', '崇文名都小高层房屋出售', '', '', '0', '1271991443', '1271991443', '', '刘女士', '2858632', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1407', '3', '14', '北门小区', '', '', '0', '1271991443', '1271991443', '', '陈老师', '328806813854794861', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1408', '3', '14', '置城国际花园b座房屋出售', '三室朝阳', '', '0', '1271991444', '1271991444', '', '刘女士', '13854794563', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1409', '3', '14', '阳光润泽园有房出售', '大师证，可贷款', '', '0', '1271991444', '1271991444', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1410', '3', '14', '冠亚星城，森泰御城现房出售', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991444', '1271991444', '', '济宁嘉园房产中介', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1411', '3', '14', '来鹤南区128平方米房屋出售', '地上储藏室8平方米，阁楼90平方米（层高超过2米6的部分不少于50平方米）', '', '0', '1271991445', '1271991445', '', '吴先生', '15953493621', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1412', '3', '14', '房屋出售   非诚勿扰！！！', '非诚勿扰！！！', '', '0', '1271991445', '1271991445', '', '朱老师', '13793788295', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1413', '3', '14', '火炬路中区武装部宿舍出售', '全豪华装修，铺木地板，豪华壁纸，铝塑门窗，双层窗户，整体厨房，卫浴，适合做新房用', '', '0', '1271991446', '1271991446', '', '于先生', '13355151118', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1414', '3', '14', '置城国际房屋出售', '三室朝阳', '', '0', '1271991446', '1271991446', '', '刘女士', '13854794563', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1415', '3', '14', '红星小区有房出售', '免税，大市证', '', '0', '1271991446', '1271991446', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1416', '3', '14', '附院附近  有房卖  6楼  供暖', '还有1年半免税。中介提供看房费自理', '', '0', '1271991447', '1271991447', '', '林 铄 儿', '13563795856', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1417', '3', '14', '火炬南路新房出售', '合同房可以过户', '', '0', '1271991448', '1271991448', '', '于先生', '13355151118', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1418', '3', '14', '租售乔羽路长安花园沿街门面22平30平67平142平【四套】', '附近有光河花园，兴唐经典，梦园新苑，鸿顺花园，长安花园等高档小区，人口居住集中，人流量大', '', '0', '1271991448', '1271991448', '', '李', '2769898', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1419', '3', '14', '金宇和古槐路交汇处北200米路西房屋出售', '另有面积95平方储藏室15平方2楼出售', '', '0', '1271991449', '1271991449', '', '王先生', '13792327703', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1420', '3', '14', '党校[供暖]房低价出售===========多套房源]]]]', '粉连5楼一室45方14万。凌花5楼3室85方25万', '', '0', '1271991450', '1271991450', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1421', '3', '14', '来鹤小区一楼', '来鹤3楼74平方32万，6楼74平方阁楼50平方35万，商住69平方32万', '', '0', '1271991450', '1271991450', '', '徐女士', '0537-2722318', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1422', '3', '14', '崇文名都新房出售', '大市政、改合同', '', '0', '1271991450', '1271991450', '', '赵先生', '13705371833', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1423', '3', '14', '［［［好房待售］］］113平3室1厅益民西区33万', '中区人民法院附近78平2室1厅市证29.3万，琵琶山小区2楼84平3室1厅单位暖房38万', '', '0', '1271991450', '1271991450', '', '王先生', '13365475611', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1424', '3', '14', '银都花园', '证另有5楼71平31万 5楼132平41万 1楼138平59万 更多2662810', '', '0', '1271991451', '1271991451', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1425', '3', '14', '冠亚星城现房出售', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991451', '1271991451', '', 'jninfo嘉园房产', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1426', '3', '14', '《《免税房》》人民医院附近98平方37万', '中区人民法院附近78平2室1厅市证29.3万，琵琶山小区2楼84平3室1厅单位暖房38万', '', '0', '1271991451', '1271991451', '', '王先生', '13365475611', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1427', '3', '14', '金茂康桥 黄营', '改合同 另有黄营6楼94平车库21平装修38万 黄营6楼85平带阁楼35万', '', '0', '1271991452', '1271991452', '', '孟老师', '15092662788', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1428', '3', '14', '太东。凌花。来鹤。铁塔市。北门有多套房出售；；；；', '粉连5楼一室45方14万。鱼三5楼53方23万。北门43方18。5', '', '0', '1271991452', '1271991452', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1429', '3', '14', '冠亚星城', '改合同 另5楼152平64万', '', '0', '1271991452', '1271991452', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1430', '3', '14', '兴唐国粹城现房出售', '开口费已交、带电梯', '', '0', '1271991453', '1271991453', '', '朱先生', '13964952727', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1431', '3', '14', '军分区干休所', '5.1上房', '', '0', '1271991453', '1271991453', '', '嘉润泰和房产', '3930799', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1432', '3', '14', '杨柳现房出售', '外储15平米', '', '0', '1271991454', '1271991454', '', '刘先生', '13695375757', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1433', '3', '14', '出售南辛庄房屋一套', '大市房产证 免税中介勿扰', '', '0', '1271991454', '1271991454', '', '支', '15805375599', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1434', '3', '14', '森泰御城新房出售', '免3年物业费，可该合同，开口费已经全部交清', '', '0', '1271991454', '1271991454', '', '贾先生', '13518652168', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1435', '3', '14', '开泰花园', '！！！！！开泰花园有多套房屋出租出售！！！！！！！！！', '', '0', '1271991455', '1271991455', '', '苏小姐', '2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1436', '3', '14', '附院西邻吉房出售', '大师证，免税，非诚勿扰', '', '0', '1271991455', '1271991455', '', '张先生', '15864140716', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1437', '3', '14', '开泰花园高层', '开泰花园 98平方 2楼 两室两厅 上储8平方 水电气暖 40万 上房费已交 新房', '', '0', '1271991455', '1271991455', '', '苏小姐', '2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1438', '3', '14', '开泰花园高层', '！！！！开泰花园有多套房屋出租出售！！！！！！！！！', '', '0', '1271991456', '1271991456', '', '苏小姐', '2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1439', '3', '14', '杨柳j区临街车库出售', '', '', '0', '1271991456', '1271991456', '', '赵先生', '2736388', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1440', '3', '14', '开泰花园', '！！！！！！开泰花园有多套房屋出售出租！！！！！！！！！！', '', '0', '1271991456', '1271991456', '', '苏小姐', '2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1441', '3', '14', '永泰新景湾新房出售＊置城国际好房出售', '土地证市证齐全包括家具家电22万', '', '0', '1271991457', '1271991457', '', '宫女士', '13082628667', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1442', '3', '14', '单位集资建房转让', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991458', '1271991458', '', 'jninfo嘉园房产', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1443', '3', '14', '光河花园房屋出售', '光河花园4层两室两厅免税85平方8平方储藏室39万元', '', '0', '1271991458', '1271991458', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1444', '3', '14', '琵琶山单位暖房，2楼，免税，38万', '大市证，免税，单位暖房', '', '0', '1271991459', '1271991459', '', '常', '13562793111', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1445', '3', '14', '八铺新苑（老杨桥向南）单位房急售', '古皆园3楼 76平方 免税 33万。粉连街1楼77平免税 30万', '', '0', '1271991459', '1271991459', '', '李老师', '2997101', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1446', '3', '14', '来鹤小区复式35万，火车站近邻2楼精装修，20万', '火车站近邻2楼2室1厅，54平，08市证，精装修，房东听税', '', '0', '1301062867', '1382664386', '', '常经理', '13562793111', '', '127.0.0.60', '43', '2');
INSERT INTO `f_info` VALUES ('1447', '3', '14', '火炬南路新房出售', '储藏室可以改车库，可以改购房合同', '', '0', '1271991460', '1271991460', '', '于先生', '13355151118', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1448', '3', '14', '齐鑫花园现房新房出售', '', '', '0', '1271991461', '1271991461', '', '李先生', '15953702388', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1449', '3', '14', '琵琶山小区', '证暖 另有5楼免税房84平38万', '', '0', '1271991461', '1271991461', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1450', '3', '14', '海阔天空附近出售', '光河花园附近3层两室一厅70平方5平方储藏室26.8万', '', '0', '1271991462', '1271991462', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1451', '3', '14', '单位暖房出售', '望湖小区5楼两室一厅有暖单位房30万', '', '0', '1271991463', '1271991463', '', 'jninfo王', '13863721675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1452', '3', '14', '森泰御城2楼105平储17平39万直接签开发商合同 急卖好房', '急卖 另有冠亚7楼124平该合同58万 明珠4楼68平28万 明珠5楼68平28万', '', '0', '1271991465', '1271991465', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1453', '3', '14', '银都花园复试房218平储18平证58万 5楼68平暖21万 ', '6楼7楼复试房 另有银都4楼87平38万 5楼71平31万 5楼132平41万非诚勿扰', '', '0', '1271991465', '1271991465', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1454', '3', '14', '银都花园小区售房', '证暖 另有银都5楼132平41万 银都4楼106平43万 更多信息打电话', '', '0', '1271991466', '1271991466', '', '孟老师', '15092662788', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1455', '3', '14', '邮电新苑暖房出售', '', '', '0', '1271991467', '1271991467', '', '董先生', '15953713739', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1456', '3', '14', '长虹小区房屋出售', '送27平米的露天阳台', '', '0', '1271991467', '1271991467', '', '于先生', '13605472000', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1457', '3', '14', '购房送阁楼', '', '', '0', '1271991467', '1271991467', '', '戴老师', '13666373902', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1458', '3', '14', '李楼新区房屋出售', '', '', '0', '1271991468', '1271991468', '', '刘女生', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1459', '3', '14', '郭家花园  带车库  供暖新房', '东门3楼115平60万。古槐家园11楼188平76万。瑞和春天5楼83平39万。吉祥4楼128平56', '', '0', '1271991469', '1271991469', '', '冯女士', '24938682098616', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1460', '3', '14', '开泰花园房屋出售', '', '', '0', '1271991470', '1271991470', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1461', '3', '14', '阳光润泽园精装修房出售', '', '', '0', '1271991471', '1271991471', '', '张先生', '13355139656', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1462', '3', '14', '银都花园 明珠花园 房屋出售', '证暖 另有明珠1楼97平暖免税45万 明珠6楼87平装证32万银都1楼134平车库60万', '', '0', '1271991471', '1271991471', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1463', '3', '14', '丹桂苑小区 1楼装修 133平方 3＊2＊2 47万大市证 ', '另售 银都花园 5楼100平方2*2*1精装修48万结婚房明珠小区6楼87平2*2装修32万证', '', '0', '1271991472', '1271991472', '', '尹女士', '15553716198', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1464', '3', '14', '森泰御城 4楼90平方 简装 两室一厅 34万改合同 储藏室', '另售 银都花园 5楼100平方2*2*1精装修48万结婚房明珠小区6楼87平2*2装修32万证', '', '0', '1271991473', '1271991473', '', '尹女士', '15553716198', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1465', '3', '14', '开泰花园小高层7楼出售', '', '', '0', '1271991474', '1271991474', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1466', '3', '14', '置成中央公园18楼70平方2＊1＊1装修35万大市证', '另售 银都花园 5楼100平方2*2*1精装修48万结婚房明珠小区6楼87平2*2装修32万证', '', '0', '1271991474', '1271991474', '', '尹女士', '15553716198', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1467', '3', '14', '国翠城多层3楼105平方2＊2＊1精装修79万改合同价格可议', '另售 银都花园 5楼100平方2*2*1精装修48万结婚房明珠小区6楼87平2*2装修32万证', '', '0', '1271991474', '1271991474', '', '尹', '15553716198', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1468', '3', '14', '接庄镇政府驻地房屋出售', '', '', '0', '1271991475', '1271991475', '', '张女士', '15106760299', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1469', '3', '14', '舜态园小区高层', '两室两厅', '', '0', '1271991475', '1271991475', '', '秦先生', '13355376020', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1470', '3', '14', '冠亚星城6楼123平 7楼123平 3楼113平 5楼152', '改合同 银都花园5楼132平储藏8平41万 非诚勿扰', '', '0', '1271991475', '1271991475', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1471', '3', '14', '吉房出售', '无储藏室，可改合同，非诚勿扰', '', '0', '1271991476', '1271991476', '', '李先生', '13365473355', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1472', '3', '14', '玫瑰庄园房屋出售', '', '', '0', '1271991476', '1271991476', '', '徐女士', '13854764801', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1473', '3', '14', '五里营东发小区吉房出售', '无房产证，可改合同', '', '0', '1271991477', '1271991477', '', '李先生', '13365473355', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1474', '3', '14', '太东北门附近2楼126平方3＊1有暖气 55万大市证 急售', '另售赛马特北临4楼85平方2*2*1 储17平方 36.6万免税明珠小区2楼81平方2*2*1储', '', '0', '1271991477', '1271991477', '', '尹女士', '15553716198', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1475', '3', '14', '威海乳山银滩红山丽日园', '此方坐落在海边，可观望大海。', '', '0', '1271991477', '1271991477', '', '李老师', '13583725268', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1476', '3', '14', '鲁星新苑 太白东路', '该合同 另有银都6楼140平车库装52万 琵琶山2楼3室100平43万', '', '0', '1271991478', '1271991478', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1477', '3', '14', '文化小区五楼', '', '', '0', '1271991478', '1271991478', '', '段女士', '2865308', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1478', '3', '14', '长虹小区', '三到四楼复试，车库', '', '0', '1271991478', '1271991478', '', '段女士', '2337396', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1479', '3', '14', '杨柳国际新城有房出售', '阁楼80平方米，复式结构', '', '0', '1271991479', '1271991479', '', '钱女士', '15898605036', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1480', '3', '14', '新房出售', '', '', '0', '1271991479', '1271991479', '', '李先生', '13205377817', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1481', '3', '14', '王母阁小区房屋出售', '免税，单位房', '', '0', '1271991480', '1271991480', '', '孔女士', '2190108', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1482', '3', '14', '来鹤小区房屋出售', '', '', '0', '1271991480', '1271991480', '', '孔女士', '2190108', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1483', '3', '14', '谢营小区金宇路南房屋出售', '价格可商议，中介勿扰', '', '0', '1271991481', '1271991481', '', '杨女士', '13355178165', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1484', '3', '14', '开泰花园4楼急售', '急售，价格可协商', '', '0', '1271991481', '1271991481', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1485', '3', '14', '好房急售', '免税', '', '0', '1271991481', '1271991481', '', '孔女士', '2190108', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1486', '3', '14', '长沟镇新房出售11万', '地址：长沟镇qq：42579128带车库', '', '0', '1271991482', '1271991482', '', '魏先生', '13355129706', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1487', '3', '14', '出售房屋（中介勿扰！！！）', '封阳台，33平米独立小院，中介勿扰', '', '0', '1271991483', '1271991483', '', '毕先生', '13863799568', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1488', '3', '14', '琵琶山2楼装修供暖房107平方2＊1  41万大市证 储藏室', '都市春天5楼144平方3*2*2 储藏室10平方65万可议 古槐家园11楼120平2*1*2 50万', '', '0', '1271991484', '1271991484', '', '尹女士', '15553716198', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1489', '3', '14', '楼房出售', '有车位', '', '0', '1271991484', '1271991484', '', '张女士', '13355110690', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1490', '3', '14', '学区房出售', '铁塔寺4楼2室1厅66平方33万', '', '0', '1271991485', '1271991485', '', 'jninfo王', '13863721675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1491', '3', '14', '银都花园132平41万供暖有证', '另有明珠5楼105平装修免税43万 冠亚7楼124平57万', '', '0', '1271991485', '1271991485', '', '孟老师', '2662810', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1492', '3', '14', '新房出售', '阳光润泽园9楼3室1厅53万', '', '0', '1271991485', '1271991485', '', 'jninfo王', '13863721675', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1493', '3', '14', '置成中央公园6楼138平方3＊2＊2精装修60万全套家具家电', '另售赛马特北临4楼85平方2*2*1 储17平方 36.6万免税 琵琶山5楼3*1暖气38万免税', '', '0', '1271991486', '1271991486', '', '尹女士', '15553716198', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1494', '3', '14', '急售运西家园凤凰城房屋！', '', '', '0', '1271991487', '1271991487', '', '康先生', '15563700009', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1495', '3', '14', '开泰花园有房急售', '', '', '0', '1271991488', '1271991488', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1496', '3', '14', '离退休干部休养所院内房屋出售', '', '', '0', '1271991488', '1271991488', '', '鲁宁房产', '23091233287189', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1497', '3', '14', '金茂小区一号楼2单元6楼房屋出售', '新房', '', '0', '1271991489', '1271991489', '', '张先生', '13805377264', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1498', '3', '14', '出售森泰御城98平米，9楼。', '一次性付清42万', '', '0', '1271991489', '1271991489', '', '冯女士', '13563736252', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1499', '3', '14', '王府景小区期房出售', '黄金地段，低于市场价格出售，改协议', '', '0', '1271991489', '1271991489', '', '蒋先生', '13792376789', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1500', '3', '14', '铁塔市。鱼山。北门。古楷园。粉连好房[[[急售]]]]]]', '粉连5楼一室45方14万[个税]北门一楼2室一65方院28万', '', '0', '1271991490', '1271991490', '', '盖', '2121518', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1501', '3', '14', '房屋出售', '空调、热水器、整体厨房、暖气', '', '0', '1271991490', '1271991490', '', '张女士', '15963722222', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1502', '3', '14', '人民医院南临房屋出售', '中介勿扰，有双证', '', '0', '1271991490', '1271991490', '', '王女士', '13705477949', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1503', '3', '14', '长沟镇新房出售', '地址：长沟镇qq：42579128', '', '0', '1271991491', '1271991491', '', '魏先生', '13355129706', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1504', '3', '14', '圣德滨湖花园别墅区 绝版公寓', '高档小区，全区电子监控，毗邻光府河畔自然绿化带，最佳套房，过合同直接办大市证。具体面议', '', '0', '1271991492', '1271991492', '', 'jninfo', '2188185', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1505', '3', '14', '银都花园商品房出售 单位房', '证 另有银都5楼105平装修证48万更多信息请打电话', '', '0', '1271991492', '1271991492', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1506', '3', '14', '皇营 金茂康桥银都花园房屋专卖', '6楼130平7楼90平装修包该合同 另有6楼94平带车库38万 6楼85平带阁楼35万6楼93平33', '', '0', '1271991493', '1271991493', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1507', '3', '14', '火炬路五里营济州路口房屋出售', '可改合同，无储藏室，新房', '', '0', '1271991493', '1271991493', '', '李先生', '13365473355', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1508', '3', '14', '长沟新房出售', 'qq：42579128', '', '0', '1271991494', '1271991494', '', '魏先生', '13355129706', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1509', '3', '14', '东发小区 一楼96平方两室两厅 车库25平方 26万 精装', '太东北门 附近2楼126平方3*1有暖气55万大市证明珠小区6楼87平2*2*1装修32万大市证', '', '0', '1271991494', '1271991494', '', '尹老师', '15553716198', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1510', '3', '14', '银都花园商品房', '证 更多信息2662810 免费为您发布各种信息', '', '0', '1271991494', '1271991494', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1511', '3', '14', '西闸小区免税房出售', '三室向阳，有空调太阳能', '', '0', '1271991495', '1271991495', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1512', '3', '14', '济宁市中区东五里营玫瑰庄园新房出售', '', '', '0', '1271991496', '1271991496', '', '詹先生', '13235374444', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1513', '3', '14', '市中区中心位置现房出售', '', '', '0', '1271991496', '1271991496', '', '马先生', '13676370068', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1514', '3', '14', '都市春天5楼144平方3＊2＊2 储藏室10平方65万改合同', '另售置成中央公园 18楼70平2*1*1装修35万市证 置成公园6楼138平3*2*2精装修60万', '', '0', '1271991496', '1271991496', '', '尹女士', '15553716198', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('1515', '3', '14', '新世纪花园精装修房出售＊齐鑫花园小高层免税房出售', '07年的房，马上要办房产证不用交税最低62万过期不候', '', '0', '1271991496', '1271991496', '', '宫女士', '13082628667', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1516', '3', '14', '长沟新房出售', '', '', '0', '1271991496', '1271991496', '', '魏先生', '13355129706', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1517', '3', '14', '开泰花园', '', '', '0', '1271991499', '1271991499', '', '苏小姐', '2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1518', '3', '14', '开泰花园高层', '44万包过户没交上房费 急卖!!!', '', '0', '1271991500', '1271991500', '', '苏小姐', '2691398', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1519', '3', '14', '急售梦园小区单位房', '', '', '0', '1271991500', '1271991500', '', '梁先生', '13583720587', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1520', '3', '14', '红星小区楼房出售免税', '其它更多信息请登陆：嘉园房产信息网www.jiayfc.com', '', '0', '1271991501', '1271991501', '', 'jninfo嘉园房产', '150547309902124777', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1521', '3', '14', '银都花园2楼167平车库48平装修80万 1楼136平车库6', '证暖 另有银都6楼138万储藏16平45万 6楼140平车库装修52万', '', '0', '1271991501', '1271991501', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1522', '3', '14', '冠亚星城 7楼57，5万', '该合同 另有鲁星欣苑4楼93平36·7万', '', '0', '1271991502', '1271991502', '', '孟老师', '15092662788', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('1523', '3', '14', '益民西区免税房出售', '', '', '0', '1271991502', '1271991502', '', '刘女士', '2060018', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1524', '3', '14', '草桥口批发市场附近30万', '证 另有银都花园5楼124平42万', '', '0', '1271991503', '1271991503', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1525', '3', '14', '黄世西苑房屋出售', '', '', '0', '1271991503', '1271991503', '', '刘女士', '2060018', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1526', '3', '14', '银都小区 急急售 非诚勿扰', '大市证 带车库 另有东发5楼115平20万', '', '0', '1271991504', '1271991504', '', '孟老师', '15092662788', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1527', '3', '14', '北岱庄荣旺花园6楼95平方30平方阁楼出售价22万', '', '', '0', '1271991504', '1271991504', '', '王女士', '15318175759', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1528', '3', '14', '来鹤小区35万，6楼87平阁楼78平，上储，市证', '此房为复式，6楼87平+阁楼78平，大市证，户型合理，正常', '', '0', '1271991505', '1271991505', '', '常', '13562793111', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('1529', '3', '14', '明珠花园有房出售', '', '', '0', '1271991505', '1271991505', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1530', '3', '14', '北岱庄嘉和花园房屋出售', '大市证，中介勿扰', '', '0', '1271991505', '1271991505', '', '张先生', '13562783278', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1531', '3', '14', '阳光润泽园有房出售', '大市证', '', '0', '1271991506', '1271991506', '', '朱女士', '2979188', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1532', '3', '14', '杨柳国际新房出售', '阁楼面积47平方米 QQ：314277976', '', '0', '1271991507', '1271991507', '', '陈先生', '15092660995', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1533', '3', '14', '益民东区对过，电梯高层，车库，暖气齐全', '精装修，车库', '', '0', '1271991507', '1382814571', '', '常经理', '13562793111', '', '127.0.0.30', '255', '1');
INSERT INTO `f_info` VALUES ('1534', '3', '14', '阳光城市花园，4000/平方，转手续，期房，2011年5月上', '2011年5月上房，建行团购房，1梯2户，转手续，已经首付30%，4000/平方，房子面积143.3', '', '0', '1278030335', '1271991507', '', '常经理', '13562793111', '', '127.0.0.1', '14', '1');
INSERT INTO `f_info` VALUES ('1535', '3', '14', '森泰御城34万', '此房为回迁房', '', '0', '1271991508', '1271991508', '', '常', '13562793111', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1536', '3', '14', '任城新区附近房屋出售', '楼房有楼宇对讲门，有电动车库门，阳台有自来水，有后阳台，乘4路公交车马村站下车即到，小区已通天然气', '', '0', '1271991509', '1271991509', '', '楚先生', '13225371997', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1537', '3', '14', '银都花园 吉房急售35万 好户型', '精装修 木地板 改合同 另有6楼2室95平31万', '', '0', '1271991510', '1271991510', '', '孟老师', '15092662788', '', '127.0.0.1', '6', '1');
INSERT INTO `f_info` VALUES ('1538', '3', '14', '济宁菱花路万象写字楼出售', '', '', '0', '1271991510', '1271991510', '', '张先生', '1395375752715269405916', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('1539', '3', '14', '开泰花园4楼出售', '急售', '', '0', '1271991512', '1271991512', '', '刘女士', '2060018', '', '127.0.0.1', '4', '1');
INSERT INTO `f_info` VALUES ('1540', '3', '14', '红星小区房屋出售', '红星小区57平方，2楼，储藏室8平方，24.5万；面积56平方，3楼，2室1厅，储5平方，24万。', '', '0', '1271991513', '1271991513', '', '朱女士', '2979188', '', '127.0.0.1', '5', '1');
INSERT INTO `f_info` VALUES ('1541', '3', '568', '招聘门卫', '年龄50岁左右，初中文化，月薪600-1000元。', '', '0', '0', '1271994418', '', '谢经理', '13963787025', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1542', '3', '543', '招聘兼职会计一名', '有2年以上工作经验，能独立完成各项账务、财务工作，每周一天班，月薪300元以上，更多可面议。', '', '0', '1271994419', '1271994419', '', '张先生', '13012633976', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1543', '3', '603', '光明乳业招聘长期促销员6名/理货员2名', '年龄：18-30岁，长期促销，工资：800-1200元，工作地点：体育馆，运河城，瑞尔福。', '', '0', '1271994419', '1271994419', '', '孙先生', '13505478889', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('1544', '3', '587', '天昊凯旋诚聘', '公司是一家集广告、装饰、印刷、商贸、传媒为一体的多元化经营实体。致力于企业文化建设，为企业发展和提高影响力而努力，愿与你共赢、共享、共凯旋！因公司发展需要，特诚聘：<br /><br /><br /><br /><br /><br /><br /><br />优秀平面设计师 数名 二年以上工作经验 熟练使用相关软件。<br /><br /><br /><br />八开胶印机机工 数名 有相关工作经验者优先。<br /><br /><br />业务精英 数名 有进取精神，爱岗敬业，有驾证者优先。', '', '0', '1271994419', '1271994419', '', '刘小姐', '15166729578', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1545', '3', '550', '诚聘区域经理、经理助理', '公司属于世界500强企业，由于公司业绩的稳步提升，为了更好的服务老客户，建立健全售后服务体系特建立本部，现本部特招聘售后服务专员，经理助理。要求有耐性，善于交流。<br /><br />本部主要致力于老客户的地址变更、电话变更、账号变更、受益人变更、保费的收缴、理赔等新老客户的售后服务工作，同时为每一位想成功的人士提供发挥个人能力的平台，以诚相待，待遇优厚，详情请公司面谈！<br />', '', '0', '1271994419', '1271994419', '', '江先生', '15275779763', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1546', '3', '619', '金融系统诚聘', '<br />业务员、储备干部：年龄25-45岁，高中以上学历，有工作经验者优先，月薪3000元左右。<br />助理：年龄20-45岁，高中以上学历，有工作经验者优先，月薪3000元左右。<br />一经录用五险一金。<br />待遇：工资加提成，有正常休假。<br />', '', '0', '1271994419', '1271994419', '', '张主任', '0537-2188869', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1547', '3', '514', '新郎希努尔招聘业务精英', '有3年以上市场工作经验，月薪：1200元以上。', '', '0', '1271994420', '1271994420', '', '陆先生', '13605370789', '', '127.0.0.1', '4', '1');
INSERT INTO `f_info` VALUES ('1548', '3', '528', '急聘', '1、办公室人员，企业管理相关专业，熟练操作office等办公软件。往、应届生均可。试用期过后工资1000-1200元，办理劳动保险。', '', '0', '1271994420', '1271994420', '', '白小姐', '2655056', '', '127.0.0.1', '0', '3');
INSERT INTO `f_info` VALUES ('1549', '3', '608', '东阿阿胶保健品有限公司招聘促销员6名、业务员6名，理货员', '要求：女性，年龄：18-30岁，身高160以上，气质佳形象好，品貌端正，谈吐流畅，有保健品销售经验者优先，工资：促销员：800-1300元。业务员工资：1000-1500元。招聘长期业务员，长期促销员。工作地点：体育馆，运河城。', '', '0', '1271994420', '1271994420', '', '孙先生', '13505478889', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1550', '3', '613', '诚招区域经理、办公文员', '因公司发展需要现面向济宁十二县市区诚招区域经理，有意者请速联系！！！办公人员需5名！！！', '', '0', '1271994420', '1271994420', '', 'jninfo', '15054879919', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1551', '3', '547', '济宁卫康招聘客服人员一名', '招聘客服人员一名，要求：计算机专业毕业，熟悉网上信息发布，有工作经验者优先，试用期月薪：1000元。电话营销人员2名，试用期月薪：1000元，试用期后基本工资加提成。招聘工业会计一名，要求：有3年以上工作经验，工资面议。', '', '0', '1271994420', '1271994420', '', '司女士', '2891116', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1552', '3', '535', '济宁美林食品有限公司招聘驾驶员2名', '年龄25-40岁，男，驾龄4年以上，c1证，不要上岗证，能吃苦耐劳，责任心强，市区户口，开柳州五菱面包车，在市内给各大超市送货，工资1000元。', '', '0', '1271994421', '1271994421', '', '孙经理', '13505478889', '', '127.0.0.1', '4', '1');
INSERT INTO `f_info` VALUES ('1553', '3', '500', '化工公司招收司机', '化工公司招收司机，双证齐全，月薪1600，中午提供午餐，月休息两天，联系电话：2167888 联系人：王经理', '', '0', '1271994421', '1271994421', '', '王先生', '2167888', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1554', '3', '554', '高薪诚聘', '<br />业务精英、储备干部、培训讲师：年龄25-45岁，高中以上学历，有工作经验者优先，月薪3000元以上。<br />经理助理、人事助理：年龄20-35岁，大专以上学历，月薪2000元左右。<br />电话回访员：年龄20-33岁，普通话较好，高中以上学历，月薪1000元左右。<br />一经录用五险一金，待遇优厚，能力优秀者月薪可达上万元。<br />', '', '0', '1271994421', '1271994421', '', '张经理', '13655370225', '', '127.0.0.1', '0', '3');
INSERT INTO `f_info` VALUES ('1555', '3', '554', '幼儿园招聘幼师/保育员', '每周休息2天包食宿，底薪600-800元加提成，有工作经验者月薪可另议，年龄不限。', '', '0', '1271994422', '1271994422', '', '徐老师', '13355113636', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1556', '3', '606', '招聘业务人员/驾驶员', '业务人员：月薪1000-2000元，商超业务人员，产品为清风纸业，有工作经验者优先。<br />驾驶员:双证齐全，月薪800-1500元。', '', '0', '1271994422', '1271994422', '', '张先生', '13054986598', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1557', '3', '555', '高薪诚聘经理助理、售后服务人员', '本部主要致力于老客户的地址变更、电话变更、账号变更、受益人变更、保费的收缴、理赔等新老客户的售后服务工作。（可以做专职和兼职）说明：兼职是以顾问为主要工作，不限时间。为每一位想成功的人士提供发挥个人能力的平台，以诚相待，待遇优厚，详情面谈！<br /><br />联系电话：13963784725', '', '0', '1271994422', '1271994422', '', '王老师', '13963784725', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1558', '3', '532', '招聘全职兼职', '1、全职兼职设计师2、全职兼职业务员。月薪：1200元。', '', '0', '1271994423', '1271994423', '', '王经理', '13953789895', '', '127.0.0.1', '1', '1');
INSERT INTO `f_info` VALUES ('1559', '3', '581', '瑞尔福超市秀水城店招聘', '企划人员1名：性别不限，年龄28岁以下，月薪900元。<br />消防人员2名：男性，年龄28-35岁，月薪900元。<br />防损员5名：性别不限，年龄28岁以下，月薪900元。<br />有工作经验者优先。', '', '0', '1271994423', '1271994423', '', '闫老师/王经理', '3203999', '', '127.0.0.1', '31', '1');
INSERT INTO `f_info` VALUES ('1560', '3', '546', '招聘策划经理助理1名', '要求：具有同类工作经验1年以上，男性，月薪：1200元。', '', '0', '1271994423', '1271994423', '', '周经理', '13465378855', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1561', '3', '532', '招聘司机/业务员', '司机：有双证，年龄20-30岁，月薪1100元。<br />业务员：中专以上学历，医学专业优先，年龄20-35岁，男女不限，月薪1200元。', '', '0', '1271994423', '1271994423', '', '王经理', '13863719818', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1562', '3', '575', '急招', '饭店急招服务员数名，男女不限，月薪：800元加酒水奖，包吃。', '', '0', '1271994424', '1271994424', '', '吴先生', '15969976677', '', '127.0.0.1', '0', '1');
INSERT INTO `f_info` VALUES ('1563', '3', '606', '某幼儿园招聘幼师', '专业幼教或两年以上工作经验，年龄：18-24岁，真诚招聘所以无试用期，月薪：800-1000元。工作时间：8：00-8:30入园上班，下午5:00离园，有节假日。', '', '0', '1271994424', '1271994424', '', '姜女士', '15253788126', '', '127.0.0.1', '7', '1');
INSERT INTO `f_info` VALUES ('1564', '3', '604', '运河城西餐厅招聘厨房承包厨师', '月薪1千元左右可面议。', '', '0', '1271994425', '1387277588', '', '于先生', '2837526', '', '127.0.0.60', '14', '1');
INSERT INTO `f_info` VALUES ('1565', '3', '505', '销售代表/办公室文员/销售主管/网络制作学员/业务员/话务员', '吃苦耐劳，适应能力较强，有较强沟通能力及语言表达能力，形象气质佳，组织能力较强，', '', '0', '1271994425', '1387276466', '', '孟小姐', '0537-3285888', '', '127.0.0.60', '15', '1');
INSERT INTO `f_info` VALUES ('1566', '3', '521', '平面设计/机器操作员', '平面设计1000-1500元/月，要求有工作经验，能熟练操作相关软件；机器操作员900-1200元/月，要求能吃苦耐劳，有工作责任心，包培训。', '', '0', '1271994426', '1381873953', '', '齐', '2169060', '', '127.0.0.1', '3', '1');
INSERT INTO `f_info` VALUES ('1567', '3', '547', '诚聘电焊机装配人员', '1。女性，身体健康，初中以上学历；<br />2。能吃苦耐劳；<br />3。工作认真仔细。', '', '0', '1271994426', '1271994426', '', '常经理', '13645372544', '', '127.0.0.1', '2', '1');
INSERT INTO `f_info` VALUES ('1568', '3', '28', '出让各种大小排量跑车', '各种款式进口本田2手DIO50&nbsp;铃木AG100&nbsp;1500左右一辆！05蛋蛋！滑板车！小越野！大小排量公赛！yamaha海豚250&nbsp;纯水川崎250&nbsp;雅玛哈&nbsp;铃木AG—100CC&nbsp;街车王：盗匪&nbsp;74A&nbsp;75A—250&nbsp;77A400（+VC）&nbsp;CBR&nbsp;19&nbsp;CBR&nbsp;22&nbsp;97年川崎ZZR250&nbsp;ZXR250&nbsp;ZXR400V&nbsp;本田VFR&nbsp;400&nbsp;阿普利亚RS50（小跑款和太子款）。如要看图片请在我QQ空间看现车，QQ：&nbsp;咨询电话：&nbsp;东升刚子', '', '0', '1276577108', '1381873974', '', '胡女士', '15006570637', '120885811', '127.0.0.1', '115', '1');
INSERT INTO `f_info` VALUES ('1569', '3', '587', '济宁卫康胶业招聘电子商务人员1名', '招聘电子商务人员1名，要求：计算机或电子商务专业，有工作经验者优先，试用期月薪：1000元，试用期后根据工作情况调整工资，电话营销人员2名，男士优先，试用期月薪：1000元，试用期后工资加提成。', '', '0', '0', '1384229181', '', '司小姐', '2891116', '', '127.0.0.1', '7', '1');
INSERT INTO `f_info` VALUES ('1576', '3', '13', '嘉祥开发区麒麟花园有房出租', '', '', '0', '1289482895', '1383538438', '', '程小姐', '13355172288', '', '127.0.0.60', '49', '1');
INSERT INTO `f_info` VALUES ('1575', '3', '13', '冠亚星城北门附近出租高档房屋', '位置好 环境优美 物业完善 适合办公和居住 贵宾热线：15953717271', '', '0', '0', '1383538111', '', '李悦欣', '15953717271', '120885811', '127.0.0.60', '233', '1');
INSERT INTO `f_info` VALUES ('1577', '3', '313', '伯才家教，一切为了孩子！', '济宁伯才家教服务中心由济宁学院（原济宁师专）本科毕业生创立，在济宁市工商局登记注册的合法咨询服务机构，开创咨询服务与辅导服务新模式，致力于打造济宁最具影响力家教咨询服务品牌。中心扎根仙营科技市场，邻济宁学院、曲阜师范大学、服务八方人士、专业为大学生专职教师介绍家教工作信息。为高中、初中、小学生及家长免费推荐优秀家教老师，现已拥有全国各大院校优秀大学生，各大学校教师资源数百名。欢迎通过现场、电话、网络等方式登记服务与需求信息。家教服务特色★&nbsp;个性化一对一上门辅导一对一推荐式免费登记★长期推荐，我中心不收家长、教师您一分钱！辅导模式★一对一咨询一对一定制一对一教育一对一管理辅导特训★1对1升学冲刺拨高特训辅导1对1夯实双基特训1对1初高中衔接课程特训1对1小初升特训精英6+1非常开心营集训24小时QQ：1278480300报名热线：138053727602312760报名地址：济宁建设北路117号仙营居委东楼303室', '', '0', '1295184074', '1295184074', '', '李先生', '0537-2312760', '', '127.0.0.2', '0', '1');
INSERT INTO `f_info` VALUES ('1582', '3', '343', '济宁专业管道维修疏通', '本人有多年的管道维修经验，承接各种管道维修疏通，备有各种台钻及各种水钻.钻头，承接各种大中小打孔工程。', '', '0', '1380289542', '1382498140', null, '唐先生', '15006570631', '120885811', '127.0.0.30', '5', '1');
INSERT INTO `f_info` VALUES ('1583', '3', '13', '明珠小区三室一厅出售', '', '', '0', '1380299924', '1382819491', null, '李先生', '0537-3714335', '', '127.0.0.60', '49', '1');
INSERT INTO `f_info` VALUES ('1585', '4', '13', '钟楼勤业新村 2室1厅75平米 精装修 押一付三 设施齐全', '', '/uploads/info/201310/4_138300978821643_100X75.jpg', '5', '1383009797', '1383624260', null, '金雪萍', '15851937110', '', '127.0.0.60', '28', '1');
INSERT INTO `f_info` VALUES ('1586', '3', '292', '大众汽车配件销售', '常州凯铭特汽配是广州华宏汽配在常州新开分公司，主要经营大众系列全车配件！欢迎各修理厂来本店！财富热线：83728088 83826006\r\n营业地址：中吴大道1335号南方汽配市场C区29-30号', '/uploads/info/201311/3_1383856488316_100X75.jpg', '3', '1383856248', '1384158314', null, '小薛', '83728088', '318140246', '127.0.0.60', '27', '1');
INSERT INTO `f_info` VALUES ('1587', '3', '271', '准新车2012年大众新朗逸1,6自动', '转2012年上牌的大众新朗逸，灰色，准新车自动1,6，一手私家车，胎压监测装置，发动机电子防盗，车内中控锁，遥控钥匙，ABS防抱死，未进二手车市场！车况如新，喜欢的朋友联系看车', '/uploads/info/201311/3_138387501023028_100X75.jpg', '2', '1383874968', '1384055370', null, '李先生', '13467584523', '', '127.0.0.30', '37', '1');
INSERT INTO `f_info` VALUES ('1588', '3', '272', '转让07年的尼桑帕拉丁越野车', '现转让07年的尼桑帕拉丁越野车，两驱，手动档，2.4排量，银灰色。车况好，无事故！发动机一点杂音都没有。轻松140.配置如下，ABS,倒车雷达，方向助力，电动门窗电动后视镜，CD,空调。中控，防盗。需要的朋友请电话联系，车况非常好，这车走那些坑洼的道路，就跟走平地似的，在里面坐着都非常得劲，很适合这样的天气和跑公里，而且开着也非常大气。，开了10万公里，原车16万多，现卖6.8万', '/uploads/info/201311/3_138405580114014_100X75.jpg', '2', '1384055843', '1384055843', null, '赵先生', '13646118805', '', '127.0.0.30', '17', '1');
INSERT INTO `f_info` VALUES ('1589', '3', '277', '以租代购形式---出售汽车', '1：各类轿车，商务车出租，车型多（奔驰、宝马、保时捷，路虎，丰田、本田等系列）并提供自驾、代驾、婚庆用车、商务用车、单位用车。。\r\n2：高于市场价收购各类二手车、免费上门评估、代办保险、过户、贷款业务。\r\n3：销售、置换各类高中低档二手车，提供二手车买卖按揭贷款服务。\r\n4：办理各类房产、车辆抵押借款，利息低，手续简便，当天放', '/uploads/info/201311/3_138413820018978_100X75.gif', '1', '1384138207', '1384138207', null, '姚经理', '13196788888', '737217695', '127.0.0.60', '3', '1');
INSERT INTO `f_info` VALUES ('1590', '3', '652', '刚买两个多月的250CC公路赛跑车卖了', '众星牌250，宗申链条发动机，华丰真空轮胎。前轮是110/70-17后轮是140/70-17. 升。整车贴花，钥匙，前后碟刹，倒置减震，自己回来装了一对疝气大灯，刚跑了700多公里，上班开开的，特别拉风，回头率特高！由于工作辞了，所以卖！跑车头盔手套都有，车在新北圩塘这里，看车电话联系，图片是网上的，是一样的', '/uploads/info/201311/3_138414157124145_100X75.jpg', '2', '1384141560', '1384138788', null, '庞蔚', '13382866638', '85981266', '127.0.0.60', '14', '1');
INSERT INTO `f_info` VALUES ('1591', '3', '286', '七座长安之星面包车（全新车）上下班接送、节假日包车等', '长安之星面包车（全新车）出租：上下班接送、机场接送、送货、提货、搬家、旅游及节假日包车等，价格合理！服务周到！联系电话—15861895381（省内长短途都可以!)服务全常州！', '', '0', '1384140484', '1384140484', null, '小单', '13467584523', '', '127.0.0.60', '2', '1');
INSERT INTO `f_info` VALUES ('1592', '3', '306', '全包价4000，常州机动车驾驶员培训中心优惠招生中', '常州机动车驾驶员培训中心是常州唯一一家国营企业，属于车管所下属企业，教学正规，通过率高。学C1驾驶证学费只需4000元，车管所报名费用300元，收费采取“一费制”，中间不产生任何费用，常州市区、武进地区包接送。有训练场地，不需要另外收费。 上车时间灵活，可根据您的作息时间，安排您的练车时间。随到随学，报名后即可上车培训。 报名体检等一切手续公司均可统一安排负责办理', '', '0', '1384140704', '1384140704', null, '孙教练', '13382866638', '', '127.0.0.60', '5', '1');
INSERT INTO `f_info` VALUES ('1593', '3', '294', '帮做车贷！首付30%其他我们来搞', '帮做车贷！首付30%其他我们来搞\r\n本地外地不限\r\n你首付30%就行了\r\n奔驰 什么随便来 奥迪', '', '0', '1384151819', '1384158228', null, '钱先生', '18994997944', '', '127.0.0.60', '7', '1');
INSERT INTO `f_info` VALUES ('1594', '3', '297', '5寸导航仪，提供电子狗软件地图安装更新', '00元低价转让全新导航仪，一年保修！2013最新正式版夏季凯立德地图；5寸，7寸高清显示屏，附送2G内存卡一张，可以下载歌曲电影在导航仪播放。提供电子狗软件，导航地图安装更新。', '/uploads/info/201311/13841586265890_100X75.gif', '1', '1384158636', '1387276248', null, '周先生', '13584567505', '', '127.0.0.60', '10', '1');
INSERT INTO `f_info` VALUES ('1595', '3', '653', '求领养一只金黄色虎斑小猫，最好是刚断奶的小猫', '爱猫人士', '', '0', '1384163243', '1384163243', null, '陈先生', '13585459944', '12528233', '127.0.0.60', '1', '1');
INSERT INTO `f_info` VALUES ('1596', '3', '657', '秋冬季暖窝宠物窝 蒙古包 狗狗窝 猫窝 泰迪狗棉窝', '推荐理由：\r\nNO.1 折叠型狗窝，方便携带及储藏；\r\nNO.2 窝垫拉链设置，可拆洗，建议定期给爱宠进行清理；\r\nNO.3 窝底部有防水防滑材质，给您减少多方面的担忧；\r\nNO.4 爱您的狗狗和猫咪，就应该给他/她高档奢华的享受，选择这款窝是最佳的选择。', '/uploads/info/201311/3_13841639808631_100X75.jpg', '2', '1384164027', '1387277365', null, '姜女士', '13656121762', '1327994578', '127.0.0.60', '3', '1');
INSERT INTO `f_info` VALUES ('1597', '3', '664', '自家虎皮种鸟一对出售开春可繁殖体验下养小鸟乐趣吧！', '需要就近提取，50元包含笼子等养殖必备品！鸟经常帮洗澡很干净不咬人。因本人另有爱好才转让的！', '/uploads/info/201311/3_13841645421088_100X75.jpg', '3', '1384164649', '1386220244', null, '徐女士', '13776883322', '', '127.0.0.60', '4', '1');
INSERT INTO `f_info` VALUES ('1598', '3', '670', '常年提供各类型宠物寄养非宠物店', '提供各类型宠物寄养。小至仓鼠，大至大型犬均可。（4个月以下狗狗只接受疫苗齐全的）\r\n\r\n我们提供散养服务，不关笼子。让亲们的爱犬在寄养期间也能感到在家一样的感觉，可以满足亲们的所有合理要求。\r\n\r\n住得远的亲可以选择我们过去接，不放心的话可以记一下车牌号和身份证。', '', '0', '1384166735', '1384166735', null, '王小姐', '15166587482', '737365930', '127.0.0.60', '2', '1');
INSERT INTO `f_info` VALUES ('1599', '3', '161', '转让手绘店全部手绘产品', '本人开手绘店，现在由于业务发展需要装让手绘店全部手绘产品，包括手绘鞋子，帽子，衣服等等。\r\n价格优惠，需要的电话联系！', '/uploads/info/201312/3_138736324820195_100X75.jpg', '1', '1387363147', '1387363252', null, '成经理', '15251915088', '', '127.0.0.60', '6', '1');
INSERT INTO `f_info` VALUES ('1600', '3', '146', '自用九成新IPHONE4S国行转让', '去年购买，已过保，未拆未修，手机没有任何问题，赠送原装耳机及充电插头（非诚勿扰）', '/uploads/info/201312/3_138736340624334_100X75.jpg', '2', '1387363453', '1387363453', null, '王先生', '13775082111', '281075145', '127.0.0.60', '10', '1');
INSERT INTO `f_info` VALUES ('1601', '3', '167', 'iPad4 16G 港版 WiFi 平板电脑 原装主配', '单位抽奖抽到一个IPAD AIR 现在用的IPAD是朋友香港带回来送我的，保修到2014年的2月28号，机器几乎全新，无刮痕、无拆修，诚心出掉IPAD4', '/uploads/info/201312/3_138736365718741_100X75.jpg', '4', '1387363718', '1390727615', null, '刘先生', '18001501580', '', '127.0.0.60', '10', '1');

-- ----------------------------
-- Table structure for `f_info_1`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_1`;
CREATE TABLE `f_info_1` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `address` varchar(255) default NULL,
  `time` varchar(255) default NULL,
  `qy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_1
-- ----------------------------
INSERT INTO `f_info_1` VALUES ('1', '40', '市中区人民公园', '国庆节之后', '1');

-- ----------------------------
-- Table structure for `f_info_10`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_10`;
CREATE TABLE `f_info_10` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `age` int(10) default NULL,
  `sex` int(2) default NULL,
  `birthplace` varchar(255) default NULL,
  `Interests` varchar(255) default NULL,
  `wage` int(2) default NULL,
  `qy` int(2) default NULL,
  `job` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of f_info_10
-- ----------------------------
INSERT INTO `f_info_10` VALUES ('1', '33', '27', '1', null, null, '3', '3', '4');
INSERT INTO `f_info_10` VALUES ('2', '34', '26', '3', null, '旅游，钓鱼，游泳，交友', '3', '3', '1');
INSERT INTO `f_info_10` VALUES ('3', '35', '23', '2', '贵州', null, '3', '1', '3');
INSERT INTO `f_info_10` VALUES ('4', '36', '26', '2', null, '看书，旅游，唱歌，打羽毛球', '2', '1', '3');
INSERT INTO `f_info_10` VALUES ('5', '734', '39', '1', null, null, '1', '3', '1');
INSERT INTO `f_info_10` VALUES ('6', '735', '24', '1', null, null, '2', '1', '1');
INSERT INTO `f_info_10` VALUES ('7', '736', '27', '2', null, null, '1', '3', '5');
INSERT INTO `f_info_10` VALUES ('8', '737', '23', '2', null, null, '2', '2', '4');
INSERT INTO `f_info_10` VALUES ('9', '738', '30', '1', null, null, '2', '1', '2');
INSERT INTO `f_info_10` VALUES ('10', '739', '28', '3', null, null, '3', '3', '4');
INSERT INTO `f_info_10` VALUES ('11', '740', '34', '1', null, null, '2', '1', '2');
INSERT INTO `f_info_10` VALUES ('12', '741', '21', '2', null, null, '3', '1', '4');
INSERT INTO `f_info_10` VALUES ('13', '742', '29', '1', null, null, '1', '2', '4');
INSERT INTO `f_info_10` VALUES ('14', '743', '34', '3', null, null, '2', '2', '3');
INSERT INTO `f_info_10` VALUES ('15', '744', '34', '2', null, null, '3', '3', '2');
INSERT INTO `f_info_10` VALUES ('16', '745', '38', '3', null, null, '2', '2', '3');
INSERT INTO `f_info_10` VALUES ('17', '746', '43', '2', null, null, '3', '2', '1');
INSERT INTO `f_info_10` VALUES ('18', '747', '28', '2', null, null, '1', '1', '3');
INSERT INTO `f_info_10` VALUES ('19', '748', '42', '3', null, null, '1', '1', '4');
INSERT INTO `f_info_10` VALUES ('20', '749', '28', '2', null, null, '1', '3', '2');
INSERT INTO `f_info_10` VALUES ('21', '750', '34', '3', null, null, '3', '3', '2');
INSERT INTO `f_info_10` VALUES ('22', '751', '33', '3', null, null, '2', '1', '1');
INSERT INTO `f_info_10` VALUES ('23', '752', '42', '1', null, null, '1', '3', '2');
INSERT INTO `f_info_10` VALUES ('24', '753', '28', '3', null, null, '2', '3', '4');
INSERT INTO `f_info_10` VALUES ('25', '754', '24', '2', null, null, '3', '3', '2');
INSERT INTO `f_info_10` VALUES ('26', '755', '38', '1', null, null, '1', '1', '1');
INSERT INTO `f_info_10` VALUES ('27', '756', '28', '2', null, null, '2', '1', '1');
INSERT INTO `f_info_10` VALUES ('28', '757', '38', '3', null, null, '3', '2', '5');
INSERT INTO `f_info_10` VALUES ('29', '758', '39', '2', null, null, '1', '1', '2');
INSERT INTO `f_info_10` VALUES ('30', '759', '28', '1', null, null, '2', '2', '3');
INSERT INTO `f_info_10` VALUES ('31', '760', '26', '3', null, null, '3', '3', '5');
INSERT INTO `f_info_10` VALUES ('32', '761', '30', '3', null, null, '2', '2', '5');
INSERT INTO `f_info_10` VALUES ('33', '762', '46', '2', null, null, '1', '1', '2');
INSERT INTO `f_info_10` VALUES ('34', '763', '38', '1', null, null, '1', '3', '4');
INSERT INTO `f_info_10` VALUES ('35', '764', '36', '2', null, null, '2', '3', '3');
INSERT INTO `f_info_10` VALUES ('36', '765', '24', '2', null, null, '2', '2', '3');
INSERT INTO `f_info_10` VALUES ('37', '766', '27', '2', null, null, '2', '2', '3');
INSERT INTO `f_info_10` VALUES ('38', '767', '30', '3', null, null, '1', '2', '3');
INSERT INTO `f_info_10` VALUES ('39', '768', '28', '1', null, null, '1', '1', '4');
INSERT INTO `f_info_10` VALUES ('40', '769', '28', '1', null, null, '3', '3', '5');
INSERT INTO `f_info_10` VALUES ('41', '770', '30', '3', null, null, '2', '1', '1');
INSERT INTO `f_info_10` VALUES ('42', '771', '47', '3', null, null, '2', '1', '4');
INSERT INTO `f_info_10` VALUES ('43', '772', '36', '3', null, null, '2', '3', '3');
INSERT INTO `f_info_10` VALUES ('44', '773', '33', '3', null, null, '1', '1', '5');
INSERT INTO `f_info_10` VALUES ('45', '774', '30', '2', null, null, '3', '1', '1');
INSERT INTO `f_info_10` VALUES ('46', '775', '38', '3', null, null, '1', '2', '5');
INSERT INTO `f_info_10` VALUES ('47', '776', '27', '2', null, null, '1', '3', '4');
INSERT INTO `f_info_10` VALUES ('48', '777', '30', '2', null, null, '2', '1', '3');
INSERT INTO `f_info_10` VALUES ('49', '778', '34', '1', null, null, '3', '3', '3');
INSERT INTO `f_info_10` VALUES ('50', '779', '32', '1', null, null, '1', '2', '5');
INSERT INTO `f_info_10` VALUES ('51', '780', '39', '3', null, null, '3', '1', '1');
INSERT INTO `f_info_10` VALUES ('52', '781', '28', '1', null, null, '2', '2', '4');
INSERT INTO `f_info_10` VALUES ('53', '782', '39', '2', null, null, '3', '2', '2');
INSERT INTO `f_info_10` VALUES ('54', '783', '33', '3', null, null, '3', '3', '3');
INSERT INTO `f_info_10` VALUES ('55', '784', '23', '3', null, null, '1', '3', '2');
INSERT INTO `f_info_10` VALUES ('56', '785', '47', '1', null, null, '1', '2', '2');
INSERT INTO `f_info_10` VALUES ('57', '786', '32', '2', null, null, '2', '2', '5');
INSERT INTO `f_info_10` VALUES ('58', '787', '38', '2', null, null, '2', '2', '1');
INSERT INTO `f_info_10` VALUES ('59', '788', '42', '3', null, null, '2', '2', '4');
INSERT INTO `f_info_10` VALUES ('60', '789', '28', '1', null, null, '1', '1', '3');
INSERT INTO `f_info_10` VALUES ('61', '790', '50', '3', null, null, '1', '2', '1');
INSERT INTO `f_info_10` VALUES ('62', '791', '35', '2', null, null, '3', '2', '5');
INSERT INTO `f_info_10` VALUES ('63', '792', '32', '1', null, null, '3', '1', '3');
INSERT INTO `f_info_10` VALUES ('64', '793', '32', '2', null, null, '2', '3', '2');
INSERT INTO `f_info_10` VALUES ('65', '794', '26', '1', null, null, '2', '2', '2');
INSERT INTO `f_info_10` VALUES ('66', '795', '27', '2', null, null, '1', '2', '1');
INSERT INTO `f_info_10` VALUES ('67', '796', '42', '1', null, null, '1', '2', '1');
INSERT INTO `f_info_10` VALUES ('68', '797', '44', '1', null, null, '1', '3', '3');
INSERT INTO `f_info_10` VALUES ('69', '798', '38', '3', null, null, '3', '1', '2');
INSERT INTO `f_info_10` VALUES ('70', '799', '36', '2', null, null, '1', '1', '5');
INSERT INTO `f_info_10` VALUES ('71', '800', '53', '2', null, null, '1', '2', '5');
INSERT INTO `f_info_10` VALUES ('72', '801', '23', '3', null, null, '2', '1', '5');
INSERT INTO `f_info_10` VALUES ('73', '802', '38', '1', null, null, '2', '3', '3');
INSERT INTO `f_info_10` VALUES ('74', '803', '44', '3', null, null, '2', '3', '3');
INSERT INTO `f_info_10` VALUES ('75', '804', '36', '2', null, null, '2', '3', '2');
INSERT INTO `f_info_10` VALUES ('76', '805', '28', '1', null, null, '3', '2', '1');
INSERT INTO `f_info_10` VALUES ('77', '806', '35', '1', null, null, '2', '3', '4');
INSERT INTO `f_info_10` VALUES ('78', '807', '39', '3', null, null, '3', '2', '2');
INSERT INTO `f_info_10` VALUES ('79', '808', '34', '2', '山东济宁', null, '3', '3', '3');
INSERT INTO `f_info_10` VALUES ('80', '809', '28', '1', null, null, '3', '1', '2');
INSERT INTO `f_info_10` VALUES ('81', '810', '35', '1', null, null, '2', '1', '1');
INSERT INTO `f_info_10` VALUES ('82', '811', '21', '3', null, null, '3', '1', '2');
INSERT INTO `f_info_10` VALUES ('83', '812', '26', '1', null, null, '2', '1', '4');
INSERT INTO `f_info_10` VALUES ('84', '813', '35', '3', null, null, '1', '3', '5');
INSERT INTO `f_info_10` VALUES ('85', '814', '26', '1', null, null, '2', '1', '4');
INSERT INTO `f_info_10` VALUES ('86', '815', '32', '1', null, null, '3', '2', '4');
INSERT INTO `f_info_10` VALUES ('87', '816', '26', '3', null, null, '1', '2', '4');

-- ----------------------------
-- Table structure for `f_info_11`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_11`;
CREATE TABLE `f_info_11` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `qy` int(2) default NULL,
  `address` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_11
-- ----------------------------
INSERT INTO `f_info_11` VALUES ('1', '571', '3', '济宁市建设北路');
INSERT INTO `f_info_11` VALUES ('2', '572', '3', null);
INSERT INTO `f_info_11` VALUES ('3', '573', '1', null);
INSERT INTO `f_info_11` VALUES ('4', '574', '2', null);
INSERT INTO `f_info_11` VALUES ('5', '575', '2', null);
INSERT INTO `f_info_11` VALUES ('6', '576', '1', null);
INSERT INTO `f_info_11` VALUES ('7', '577', '1', null);
INSERT INTO `f_info_11` VALUES ('8', '578', '1', null);
INSERT INTO `f_info_11` VALUES ('9', '579', '2', null);
INSERT INTO `f_info_11` VALUES ('10', '580', '1', null);
INSERT INTO `f_info_11` VALUES ('11', '581', '2', null);
INSERT INTO `f_info_11` VALUES ('12', '582', '2', null);
INSERT INTO `f_info_11` VALUES ('13', '583', '2', null);
INSERT INTO `f_info_11` VALUES ('14', '584', '1', null);
INSERT INTO `f_info_11` VALUES ('15', '585', '1', null);
INSERT INTO `f_info_11` VALUES ('16', '586', '2', null);
INSERT INTO `f_info_11` VALUES ('17', '587', '3', null);
INSERT INTO `f_info_11` VALUES ('18', '588', '3', null);
INSERT INTO `f_info_11` VALUES ('19', '589', '3', null);
INSERT INTO `f_info_11` VALUES ('20', '590', '1', null);
INSERT INTO `f_info_11` VALUES ('21', '591', '2', null);
INSERT INTO `f_info_11` VALUES ('22', '592', '1', null);
INSERT INTO `f_info_11` VALUES ('23', '593', '3', null);
INSERT INTO `f_info_11` VALUES ('24', '594', '2', null);
INSERT INTO `f_info_11` VALUES ('25', '595', '2', null);
INSERT INTO `f_info_11` VALUES ('26', '596', '1', null);
INSERT INTO `f_info_11` VALUES ('27', '597', '3', null);
INSERT INTO `f_info_11` VALUES ('28', '598', '3', null);
INSERT INTO `f_info_11` VALUES ('29', '599', '2', null);
INSERT INTO `f_info_11` VALUES ('30', '600', '1', null);
INSERT INTO `f_info_11` VALUES ('31', '601', '2', null);
INSERT INTO `f_info_11` VALUES ('32', '602', '3', null);
INSERT INTO `f_info_11` VALUES ('33', '603', '3', null);
INSERT INTO `f_info_11` VALUES ('34', '604', '2', null);
INSERT INTO `f_info_11` VALUES ('35', '605', '1', null);
INSERT INTO `f_info_11` VALUES ('36', '606', '1', null);
INSERT INTO `f_info_11` VALUES ('37', '607', '1', null);
INSERT INTO `f_info_11` VALUES ('38', '608', '3', null);
INSERT INTO `f_info_11` VALUES ('39', '609', '3', null);
INSERT INTO `f_info_11` VALUES ('40', '610', '2', null);
INSERT INTO `f_info_11` VALUES ('41', '611', '3', null);
INSERT INTO `f_info_11` VALUES ('42', '612', '3', null);
INSERT INTO `f_info_11` VALUES ('43', '613', '3', null);
INSERT INTO `f_info_11` VALUES ('44', '614', '3', null);
INSERT INTO `f_info_11` VALUES ('45', '615', '3', null);
INSERT INTO `f_info_11` VALUES ('46', '616', '2', null);
INSERT INTO `f_info_11` VALUES ('47', '617', '1', null);
INSERT INTO `f_info_11` VALUES ('48', '618', '2', null);
INSERT INTO `f_info_11` VALUES ('49', '619', '3', null);
INSERT INTO `f_info_11` VALUES ('50', '620', '3', null);
INSERT INTO `f_info_11` VALUES ('51', '621', '2', null);
INSERT INTO `f_info_11` VALUES ('52', '622', '3', null);
INSERT INTO `f_info_11` VALUES ('53', '623', '1', null);
INSERT INTO `f_info_11` VALUES ('54', '624', '3', null);
INSERT INTO `f_info_11` VALUES ('55', '625', '2', null);
INSERT INTO `f_info_11` VALUES ('56', '626', '1', null);
INSERT INTO `f_info_11` VALUES ('57', '627', '3', null);
INSERT INTO `f_info_11` VALUES ('58', '628', '2', null);
INSERT INTO `f_info_11` VALUES ('59', '629', '1', null);
INSERT INTO `f_info_11` VALUES ('60', '630', '1', null);
INSERT INTO `f_info_11` VALUES ('61', '631', '2', null);
INSERT INTO `f_info_11` VALUES ('62', '632', '1', null);
INSERT INTO `f_info_11` VALUES ('63', '633', '2', null);
INSERT INTO `f_info_11` VALUES ('64', '634', '3', null);
INSERT INTO `f_info_11` VALUES ('65', '635', '2', null);
INSERT INTO `f_info_11` VALUES ('66', '636', '2', null);
INSERT INTO `f_info_11` VALUES ('67', '637', '3', null);
INSERT INTO `f_info_11` VALUES ('68', '638', '1', null);
INSERT INTO `f_info_11` VALUES ('69', '639', '3', null);
INSERT INTO `f_info_11` VALUES ('70', '640', '2', null);
INSERT INTO `f_info_11` VALUES ('71', '641', '2', null);
INSERT INTO `f_info_11` VALUES ('72', '642', '1', null);
INSERT INTO `f_info_11` VALUES ('73', '643', '1', null);
INSERT INTO `f_info_11` VALUES ('74', '644', '1', null);
INSERT INTO `f_info_11` VALUES ('75', '645', '1', null);
INSERT INTO `f_info_11` VALUES ('76', '646', '3', null);
INSERT INTO `f_info_11` VALUES ('77', '647', '3', null);
INSERT INTO `f_info_11` VALUES ('78', '648', '2', null);
INSERT INTO `f_info_11` VALUES ('79', '649', '1', null);
INSERT INTO `f_info_11` VALUES ('80', '650', '2', null);
INSERT INTO `f_info_11` VALUES ('81', '651', '3', null);
INSERT INTO `f_info_11` VALUES ('82', '652', '2', null);
INSERT INTO `f_info_11` VALUES ('83', '653', '2', null);
INSERT INTO `f_info_11` VALUES ('84', '654', '3', null);
INSERT INTO `f_info_11` VALUES ('85', '655', '3', null);
INSERT INTO `f_info_11` VALUES ('86', '656', '2', null);
INSERT INTO `f_info_11` VALUES ('87', '657', '3', null);
INSERT INTO `f_info_11` VALUES ('88', '658', '2', null);
INSERT INTO `f_info_11` VALUES ('89', '659', '1', null);
INSERT INTO `f_info_11` VALUES ('90', '660', '1', null);
INSERT INTO `f_info_11` VALUES ('91', '661', '2', null);
INSERT INTO `f_info_11` VALUES ('92', '662', '1', null);
INSERT INTO `f_info_11` VALUES ('93', '663', '3', null);
INSERT INTO `f_info_11` VALUES ('94', '664', '1', null);
INSERT INTO `f_info_11` VALUES ('95', '665', '2', null);
INSERT INTO `f_info_11` VALUES ('96', '666', '3', null);
INSERT INTO `f_info_11` VALUES ('97', '733', '2', null);
INSERT INTO `f_info_11` VALUES ('98', '1582', '1', '市中区建设北路');

-- ----------------------------
-- Table structure for `f_info_12`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_12`;
CREATE TABLE `f_info_12` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `fbr` int(2) default NULL,
  `chengse` int(10) default NULL,
  `gongxu` int(2) default NULL,
  `qy` int(2) default NULL,
  `lx` int(2) default NULL,
  `price` int(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_12
-- ----------------------------
INSERT INTO `f_info_12` VALUES ('1', '46', '1', '2', '1', '3', '1', '400');
INSERT INTO `f_info_12` VALUES ('2', '49', '1', '1', '1', '2', '2', '1300');

-- ----------------------------
-- Table structure for `f_info_13`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_13`;
CREATE TABLE `f_info_13` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `wage` int(10) default NULL,
  `xingming` varchar(255) default NULL,
  `sex` int(2) default NULL,
  `age` int(10) default NULL,
  `education` int(2) default NULL,
  `address` varchar(255) default NULL,
  `qy` int(2) default NULL,
  `qzyx` int(2) default NULL,
  `gzjy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_13
-- ----------------------------

-- ----------------------------
-- Table structure for `f_info_14`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_14`;
CREATE TABLE `f_info_14` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `qy` int(2) default NULL,
  `price` int(10) default NULL,
  `fbr` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_14
-- ----------------------------
INSERT INTO `f_info_14` VALUES ('1', '1589', '1', '0', '2');
INSERT INTO `f_info_14` VALUES ('2', '1592', '0', '4000', '2');
INSERT INTO `f_info_14` VALUES ('3', '1598', '0', '0', '2');

-- ----------------------------
-- Table structure for `f_info_15`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_15`;
CREATE TABLE `f_info_15` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `chengse` int(10) default NULL,
  `gongxu` int(2) default NULL,
  `qy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_15
-- ----------------------------
INSERT INTO `f_info_15` VALUES ('1', '1594', '1', '1', '0');

-- ----------------------------
-- Table structure for `f_info_16`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_16`;
CREATE TABLE `f_info_16` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `fbr` int(2) default NULL,
  `chengse` int(10) default NULL,
  `gongxu` int(2) default NULL,
  `price` int(10) default NULL,
  `qy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_16
-- ----------------------------
INSERT INTO `f_info_16` VALUES ('1', '1590', '1', '2', '1', '4500', '1');

-- ----------------------------
-- Table structure for `f_info_17`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_17`;
CREATE TABLE `f_info_17` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `gongxu` int(2) default NULL,
  `qy` int(2) default NULL,
  `clys` int(2) default NULL,
  `xslc` int(10) default NULL,
  `cheling` int(2) default NULL,
  `address` varchar(255) default NULL,
  `price` int(10) default NULL,
  `fbr` int(2) default NULL,
  `pl` varchar(20) default NULL,
  `spsj` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_17
-- ----------------------------
INSERT INTO `f_info_17` VALUES ('1', '1587', '1', '1', '3', '2', '2', '市区', '12', '2', '1.6', '19');
INSERT INTO `f_info_17` VALUES ('2', '1588', '1', '0', '4', '10', '3', '湖塘二手车市场', '6', '2', '2.4', '14');

-- ----------------------------
-- Table structure for `f_info_18`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_18`;
CREATE TABLE `f_info_18` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `qy` int(2) default NULL,
  `fbr` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_18
-- ----------------------------
INSERT INTO `f_info_18` VALUES ('1', '1591', '1', '1');

-- ----------------------------
-- Table structure for `f_info_19`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_19`;
CREATE TABLE `f_info_19` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `qy` int(2) default NULL,
  `lx` int(2) default NULL,
  `price` int(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_19
-- ----------------------------
INSERT INTO `f_info_19` VALUES ('1', '1586', '1', '1', '0');
INSERT INTO `f_info_19` VALUES ('2', '1593', '1', '0', '0');

-- ----------------------------
-- Table structure for `f_info_2`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_2`;
CREATE TABLE `f_info_2` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `floor` int(10) default NULL,
  `floorall` int(10) default NULL,
  `zj` int(2) default NULL,
  `fwhx` int(2) default NULL,
  `makes` int(2) default NULL,
  `wylx` int(2) default NULL,
  `housearea` int(10) default NULL,
  `address` varchar(255) default NULL,
  `price` int(10) default NULL,
  `fangsi` int(2) default NULL,
  `direction` int(10) default NULL,
  `equipment` varchar(255) default NULL,
  `qy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_2
-- ----------------------------
INSERT INTO `f_info_2` VALUES ('6', '9', '3', '6', '1', '2', '4', '3', '68', '0', '600', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('7', '8', '1', '6', '1', '2', '2', '3', '60', '0', '600', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('10', '23', '1', '6', '1', '3', '3', '3', '130', '0', '1200', '2', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('11', '30', '6', '6', '1', '2', '3', '2', null, '0', '600', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('12', '55', '26', '14', '1', '3', '3', '1', '130', '0', '1500', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('13', '57', '6', '6', '1', '3', '4', '2', '140', '0', '1500', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('14', '58', '6', '4', '1', '2', '3', '1', '90', '0', '600', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('15', '59', '8', '5', '1', '1', '3', '2', '50', '0', '700', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('16', '60', '3', '1', '1', '3', '2', '1', '80', '0', '600', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('17', '61', '12', '6', '1', '1', '2', '2', '53', '0', '1000', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('18', '62', null, null, '1', '3', '4', '2', null, '0', '1000', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('19', '63', '6', '4', '1', '2', '4', '2', '65', '0', '850', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('20', '69', '26', '15', '1', '3', '4', '2', '300', '0', '0', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('21', '70', '5', '3', '1', '2', '3', '1', '65', '0', '600', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('22', '72', null, '3', '1', '2', '3', '1', '76', '0', '800', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('23', '73', '6', '4', '1', '2', '3', '1', '60', '0', '550', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('24', '288', '5', '6', '1', '3', '2', '2', '80', '0', '800', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('25', '289', '19', null, '1', '3', '4', '2', '146', '0', '2300', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('26', '290', '5', '6', '1', '3', '3', '2', '153', '0', '1100', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('27', '291', '4', '6', '1', '2', '3', '2', '105', '0', '800', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('28', '292', '15', null, '1', '1', '4', '2', '75', '0', '1200', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('29', '293', '3', '12', '1', '4', '4', '2', '176', '0', '2000', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('30', '294', '2', null, '1', '3', '2', '2', '85', '0', '550', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('31', '295', '2', '5', '1', '2', '2', '2', '70', '0', '450', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('32', '296', '4', '6', '1', '2', '3', '2', '80', '0', '1300', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('33', '297', '4', '6', '1', '2', '2', '2', '70', '2', '160', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('34', '298', '5', '6', '1', '3', '2', '2', '138', '0', '750', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('35', '299', '5', '6', '1', '2', '3', '2', '80', '0', '450', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('36', '300', '1', '6', '1', '3', '4', '2', '80', '0', '1000', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('37', '301', '4', '6', '1', '2', '3', '2', '90', '0', '1300', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('38', '302', '5', '5', '1', '2', '2', '2', '70', '0', '800', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('39', '303', '3', '5', '1', '2', '2', '2', '70', '0', '450', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('40', '304', '4', '5', '1', '1', '3', '2', '50', '0', '500', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('41', '305', '3', '6', '1', '2', '3', '2', '90', '0', '1100', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('42', '306', '8', '11', '1', '4', '4', '2', '150', '0', '350', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('43', '307', '5', '6', '1', '2', '3', '2', '80', '0', '800', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('44', '308', '5', '12', '1', '4', '4', '2', '175', '0', '3000', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('45', '309', '3', '6', '1', '2', '2', '2', '76', '0', '800', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('46', '310', '1', '12', '1', '3', '4', '2', '154', '0', '2300', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('47', '311', '12', '23', '1', '3', '4', '2', '195', '0', '2800', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('48', '312', '3', '12', '1', '3', '4', '2', '145', '0', '1800', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('49', '313', '10', '23', '1', '1', '4', '2', '45', '0', '750', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('50', '314', '11', '24', '1', '3', '4', '2', '120', '0', '1800', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('51', '315', '3', '6', '1', '2', '4', '2', '90', '0', '1700', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('52', '316', '7', '12', '1', '3', '4', '2', '134', '0', '1700', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('53', '317', '16', '24', '1', '1', '4', '2', '56', '0', '1200', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('54', '318', '19', null, '1', '1', '3', '2', '43', '0', '650', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('55', '319', '4', '12', '1', '3', '4', '2', '134', '0', '1400', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('56', '320', '1', null, '1', '2', '4', '2', '70', '0', '1800', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('57', '321', '3', '5', '1', '5', '4', '2', '300', '0', '3300', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('58', '322', '10', '26', '1', '1', '4', '2', '45', '0', '750', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('59', '323', '11', '12', '1', '3', '4', '2', '176', '0', '4500', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('60', '324', '2', null, '1', '3', '2', '2', '130', '0', '800', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('61', '325', '20', '23', '1', '3', '4', '2', '165', '0', '2100', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('62', '326', '8', '26', '1', '2', '4', '2', '87', '0', '850', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('63', '327', '2', null, '1', '2', '2', '2', '76', '0', '1200', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('64', '328', '4', null, '1', '3', '4', '2', '100', '0', '1100', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('65', '329', '5', null, '1', '2', '3', '2', '116', '0', '1600', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('66', '330', '6', '6', '1', '2', '4', '2', '65', '0', '800', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('67', '331', '5', '6', '1', '2', '2', '2', '91', '0', '700', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('68', '332', '3', null, '1', '2', '2', '2', '54', '0', '850', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('69', '333', '5', '6', '1', '2', '2', '2', '75', '0', '700', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('70', '334', '10', null, '1', '1', '4', '2', '50', '0', '1500', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('71', '335', '3', null, '1', '3', '3', '2', '80', '0', '1100', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('72', '336', '5', null, '1', '2', '2', '2', '100', '0', '2000', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('73', '337', '11', null, '1', '3', '4', '2', '122', '0', '1800', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('74', '338', '2', null, '1', '3', '3', '2', '85', '0', '1200', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('75', '339', '7', null, '1', '3', '2', '2', '130', '0', '1600', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('76', '340', '2', null, '1', '2', '3', '2', '80', '0', '1000', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('77', '341', '2', null, '1', '3', '2', '2', '85', '0', '900', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('78', '342', '25', '29', '1', '3', '2', '2', '134', '0', '1300', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('79', '343', '4', '4', '1', '4', '2', '2', '200', '0', '1500', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('80', '344', '5', null, '1', '2', '2', '2', '88', '0', '650', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('81', '345', '3', null, '1', '3', '4', '2', '80', '0', '1400', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('82', '346', '4', '6', '1', '1', '2', '2', '40', '0', '580', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('83', '347', '11', null, '1', '1', '4', '2', '43', '0', '800', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('84', '348', '5', '7', '1', '2', '4', '2', '120', '0', '1600', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('85', '349', '4', '4', '1', '2', '2', '2', '80', '0', '800', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('86', '350', '3', null, '1', '2', '2', '2', '70', '0', '550', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('87', '351', '1', null, '1', '5', '2', '2', '36', '0', '500', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('88', '352', '3', '6', '1', '3', '3', '2', '20', '0', '260', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('89', '353', '5', '7', '1', '2', '2', '2', '70', '0', '600', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('90', '354', '5', '6', '1', '2', '2', '2', '65', '0', '800', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('91', '355', '1', '6', '1', '3', '4', '2', '100', '0', '1200', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('92', '356', '3', '6', '1', '2', '2', '2', '70', '0', '550', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('93', '357', '1', null, '1', '2', '4', '2', '107', '0', '1200', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('94', '358', '5', '6', '1', '3', '3', '2', '105', '0', '850', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('95', '359', '2', '6', '1', '2', '3', '2', '20', '0', '350', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('96', '360', '2', '6', '1', '3', '2', '2', '75', '0', '240', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('97', '361', '2', '6', '1', '3', '2', '2', '75', '0', '240', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('98', '362', '3', '12', '1', '3', '4', '2', '145', '0', '1800', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('99', '363', '6', null, '1', '2', '4', '2', '83', '0', '850', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('100', '364', '5', '12', '1', '3', '4', '2', '140', '0', '1700', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('101', '365', '3', '12', '1', '3', '4', '2', '145', '0', '2500', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('102', '366', null, '23', '1', '2', '4', '2', '70', '0', '1600', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('103', '367', '5', null, '1', '3', '4', '2', '198', '0', '2500', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('104', '368', '6', '6', '1', '2', '2', '2', '97', '0', '240', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('105', '369', '2', '6', '1', '2', '2', '2', '65', '0', '260', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('106', '370', '2', '12', '1', '3', '4', '2', '128', '0', '1700', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('107', '371', '2', '12', '1', '3', '4', '2', '123', '0', '2000', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('108', '372', '6', '6', '1', '2', '4', '2', '85', '0', '700', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('109', '373', null, '6', '1', '3', '3', '2', '80', '0', '180', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('110', '374', '2', '6', '1', '2', '3', '2', '30', '0', '200', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('111', '375', '2', null, '1', '3', '4', '2', '100', '0', '700', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('112', '376', '4', '6', '1', '1', '3', '2', '40', '0', '430', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('113', '377', '3', '6', '1', '2', '4', '2', '85', '0', '1000', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('114', '378', '3', '12', '1', '3', '4', '2', '126', '0', '800', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('115', '379', '13', '25', '1', '1', '4', '2', '48', '0', '750', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('116', '380', '2', null, '1', '3', '3', '2', '100', '0', '800', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('117', '381', '3', '6', '1', '3', '4', '2', '137', '0', '2200', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('118', '382', '6', '6', '1', '3', '4', '2', '85', '0', '240', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('119', '383', null, null, '1', '3', '4', '2', '82', '0', '880', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('120', '384', '13', '25', '1', '2', '4', '2', '126', '0', '1600', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('121', '385', '2', '6', '1', '3', '2', '2', '100', '0', '340', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('122', '386', '6', '6', '1', '3', '2', '2', '110', '0', '160', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('123', '387', '3', '6', '1', '3', '4', '2', '137', '0', '2200', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('124', '388', '8', '11', '1', '3', '4', '2', '145', '0', '1400', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('125', '389', '5', '6', '1', '4', '2', '2', '153', '0', '1100', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('126', '390', null, '5', '1', '3', '3', '2', '80', '0', '750', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('127', '391', '4', '4', '1', '3', '4', '2', '200', '0', '1000', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('128', '392', '3', '6', '1', '3', '4', '2', '100', '0', '1000', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('129', '393', '1', null, '1', '2', '4', '2', '87', '0', '1000', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('130', '394', '2', '6', '1', '3', '3', '2', '80', '0', '650', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('131', '395', '22', '29', '1', '2', '4', '2', '134', '0', '1300', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('132', '396', '5', '6', '1', '3', '4', '2', '108', '0', '1000', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('133', '397', '4', null, '1', '2', '4', '2', '118', '0', '1000', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('134', '398', '3', '4', '1', '3', '3', '2', '75', '0', '350', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('135', '399', '1', null, '1', '2', '3', '2', '90', '0', '1200', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('136', '400', null, '6', '1', '3', '2', '2', '80', '0', '180', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('137', '401', '2', '6', '1', '3', '2', '2', '100', '0', '340', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('138', '402', '5', '6', '1', '3', '3', '2', '80', '0', '230', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('139', '403', '8', null, '1', '1', '4', '2', '41', '0', '800', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('140', '404', null, '6', '1', '3', '3', '2', '80', '0', '180', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('141', '405', '7', '12', '1', '3', '3', '2', '130', '0', '1000', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('142', '406', '3', '6', '1', '2', '4', '2', '80', '0', '1000', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('143', '407', '5', '5', '1', '3', '3', '2', '126', '0', '1000', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('144', '408', '2', '6', '1', '3', '3', '2', '80', '0', '150', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('145', '409', '20', '23', '1', '3', '4', '2', '160', '0', '2000', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('146', '410', '6', null, '1', '2', '2', '2', '90', '0', '1000', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('147', '411', '1', '12', '1', '3', '4', '2', '155', '0', '2300', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('148', '412', '5', '7', '1', '3', '3', '2', '146', '0', '2000', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('149', '413', '18', '24', '1', '2', '3', '2', '93', '0', '800', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('150', '414', '3', '6', '1', '3', '3', '2', '80', '0', '1130', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('151', '415', '6', null, '1', '3', '2', '2', '115', '0', '800', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('152', '416', '6', null, '1', '3', '4', '2', '155', '0', '1500', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('153', '417', '3', '6', '1', '2', '2', '2', '70', '0', '550', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('154', '418', '4', '6', '1', '3', '2', '2', '85', '0', '800', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('155', '419', '5', '6', '1', '2', '3', '2', '80', '0', '800', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('156', '420', '5', '6', '1', '3', '4', '2', '108', '0', '800', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('157', '421', '4', null, '1', '3', '2', '2', '85', '0', '900', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('158', '422', '3', null, '1', '3', '2', '2', '125', '0', '1100', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('159', '423', '2', '12', '1', '3', '4', '2', '120', '0', '2000', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('160', '424', '7', '11', '1', '3', '4', '2', '102', '0', '1600', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('161', '425', '1', '6', '1', '2', '3', '2', '100', '0', '1000', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('162', '426', '4', '6', '1', '2', '2', '2', '70', '2', '160', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('163', '427', '12', '12', '1', '2', '2', '2', '103', '0', '300', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('164', '428', '5', '6', '1', '2', '3', '2', '80', '0', '800', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('165', '429', '3', '6', '1', '2', '4', '2', '80', '0', '1000', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('166', '430', '4', '6', '1', '3', '4', '2', '90', '0', '1000', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('167', '431', '3', '6', '1', '2', '3', '2', '80', '0', '800', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('168', '432', '3', '6', '1', '2', '2', '2', '70', '0', '850', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('169', '433', '2', '21', '1', '2', '2', '2', '90', '0', '1200', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('170', '434', '6', null, '1', '3', '3', '2', '115', '0', '1200', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('171', '435', '5', '6', '1', '2', '3', '2', '85', '0', '800', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('172', '436', '3', '6', '1', '3', '3', '2', '100', '0', '1000', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('173', '437', '4', '6', '1', '2', '3', '2', '70', '0', '160', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('174', '438', '6', '6', '1', '2', '3', '2', '70', '0', '650', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('175', '439', '10', null, '1', '5', '4', '2', '176', '0', '2800', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('176', '440', '6', '6', '1', '3', '4', '2', '90', '0', '1000', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('177', '441', '3', '3', '1', '3', '2', '2', '120', '0', '800', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('178', '442', '2', '6', '1', '3', '3', '2', '92', '0', '1000', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('179', '443', '2', '6', '1', '2', '3', '2', '80', '0', '800', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('180', '444', '2', null, '1', '3', '3', '2', '100', '0', '1500', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('181', '445', '4', '6', '1', '4', '3', '2', '120', '0', '1000', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('182', '446', '1', '6', '1', '1', '2', '2', '55', '0', '500', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('183', '447', '1', '6', '1', '3', '4', '2', '80', '0', '1000', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('184', '448', '1', '6', '1', '1', '2', '2', '38', '0', '600', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('185', '449', '5', '5', '1', '3', '3', '2', '90', '0', '1000', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('186', '450', '2', '6', '1', '3', '3', '2', '75', '0', '800', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('187', '451', '9', null, '1', '1', '4', '2', '45', '0', '900', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('188', '452', '3', '4', '1', '3', '3', '2', '75', '0', '350', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('189', '453', '1', null, '1', '3', '4', '2', '150', '0', '2600', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('190', '454', '22', '29', '1', '3', '4', '2', '134', '0', '1300', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('191', '455', '4', '5', '1', '2', '2', '2', '65', '0', '750', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('192', '456', '1', '7', '1', '2', '2', '2', '100', '0', '1000', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('193', '457', '5', null, '1', '2', '2', '2', '75', '0', '900', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('194', '458', '3', '12', '1', '3', '4', '2', '148', '0', '2500', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('195', '459', '4', '6', '1', '2', '3', '2', '100', '0', '1000', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('196', '460', '5', '6', '1', '3', '4', '2', '85', '0', '900', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('197', '461', '1', '6', '1', '2', '3', '2', '100', '0', '1000', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('198', '462', '5', '6', '1', '4', '4', '2', '153', '0', '1100', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('199', '463', '3', null, '1', '3', '4', '2', '85', '0', '450', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('200', '464', '5', null, '1', '3', '3', '2', '75', '0', '750', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('201', '465', '4', '6', '1', '2', '4', '2', '75', '0', '600', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('202', '466', '5', null, '1', '3', '2', '2', '130', '0', '1600', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('203', '467', '4', '6', '1', '4', '4', '2', '140', '0', '1000', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('204', '468', '14', '24', '1', '3', '3', '2', '130', '0', '1500', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('205', '469', '1', null, '1', '3', '4', '2', '155', '0', '2000', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('206', '470', '3', '6', '1', '3', '3', '2', '88', '0', '800', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('207', '471', '10', null, '1', '1', '2', '2', '60', '0', '800', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('208', '472', '3', '7', '1', '3', '4', '2', '100', '0', '1000', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('209', '473', '2', '6', '1', '3', '4', '2', '118', '0', '1400', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('210', '474', '3', null, '1', '4', '4', '2', '176', '0', '2500', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('211', '475', '3', '6', '1', '3', '3', '2', '100', '0', '1000', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('212', '476', '6', '6', '1', '3', '2', '2', '93', '0', '350', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('213', '477', '1', '6', '1', '5', '2', '2', '95', '0', '5666', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('214', '478', '7', null, '1', '1', '4', '2', '45', '0', '800', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('215', '479', '5', null, '1', '2', '3', '2', '75', '0', '600', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('216', '480', '4', '6', '1', '1', '2', '2', '45', '0', '600', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('217', '481', '2', '6', '1', '3', '3', '2', '90', '0', '1000', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('218', '482', '7', null, '1', '3', '2', '2', '142', '0', '1500', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('219', '483', '4', null, '1', '4', '3', '2', '130', '0', '1000', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('220', '484', '5', '6', '1', '1', '2', '2', '52', '0', '300', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('221', '485', '5', '5', '1', '2', '2', '2', '65', '0', '600', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('222', '486', '7', '7', '1', '2', '2', '2', '65', '0', '800', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('223', '487', '4', '5', '1', '3', '3', '2', '100', '0', '1000', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('224', '488', '4', '6', '1', '5', '3', '2', '80', '0', '800', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('225', '489', '19', null, '1', '3', '4', '2', '146', '0', '2300', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('226', '490', '4', '6', '1', '2', '2', '2', '70', '2', '160', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('227', '491', '4', '6', '1', '2', '3', '2', '80', '0', '1300', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('228', '492', '3', null, '1', '4', '1', '2', '160', '0', '2000', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('229', '493', '5', null, '1', '4', '1', '2', '200', '0', '1300', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('230', '494', '4', '6', '1', '2', '3', '2', '90', '0', '1300', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('231', '495', '3', '6', '1', '2', '3', '2', '90', '0', '1100', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('232', '496', '3', null, '1', '5', '2', '2', '113', '0', '1200', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('233', '497', '6', null, '1', '2', '1', '2', '60', '0', '500', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('234', '498', '5', '6', '1', '2', '1', '2', '90', '0', '500', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('235', '499', '5', '7', '1', '2', '4', '2', '120', '0', '1600', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('236', '500', '1', null, '1', '5', '4', '2', '26', '0', '400', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('237', '501', '3', '6', '1', '3', '3', '2', '20', '0', '260', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('238', '502', '4', null, '1', '2', '1', '2', '90', '0', '500', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('239', '503', '3', '6', '1', '2', '2', '2', '70', '0', '550', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('240', '504', '4', null, '1', '2', '1', '2', '98', '0', '550', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('241', '505', '5', '6', '1', '3', '3', '2', '105', '0', '850', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('242', '506', '1', null, '1', '5', '4', '2', '15', '0', '200', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('243', '507', '2', '6', '1', '3', '2', '2', '75', '0', '240', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('244', '508', '2', '6', '1', '2', '3', '2', '20', '0', '350', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('245', '509', '2', '6', '1', '3', '2', '2', '75', '0', '240', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('246', '510', '5', '12', '1', '3', '4', '2', '140', '0', '1700', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('247', '511', null, '23', '1', '2', '4', '2', '70', '0', '1600', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('248', '512', '6', '6', '1', '2', '2', '2', '97', '0', '240', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('249', '513', '2', '6', '1', '2', '2', '2', '65', '0', '260', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('250', '514', '6', '6', '1', '2', '4', '2', '85', '0', '700', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('251', '515', null, '6', '1', '3', '3', '2', '80', '0', '180', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('252', '516', '2', '6', '1', '2', '3', '2', '30', '0', '200', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('253', '517', '3', '6', '1', '2', '4', '2', '85', '0', '1000', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('254', '518', '3', '6', '1', '3', '4', '2', '137', '0', '2200', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('255', '519', '2', null, '1', '3', '3', '2', '100', '0', '800', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('256', '520', '6', '6', '1', '3', '4', '2', '85', '0', '240', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('257', '521', '2', '6', '1', '3', '2', '2', '100', '0', '340', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('258', '522', null, null, '1', '5', '3', '2', '80', '0', '300', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('259', '523', null, null, '1', '5', '3', '2', '100', '0', '1400', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('260', '524', null, null, '1', '5', '2', '2', '85', '0', '800', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('261', '525', null, null, '1', '5', '1', '2', '32', '0', '400', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('262', '526', '5', '6', '1', '4', '2', '2', '153', '0', '1100', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('263', '527', null, null, '1', '5', '4', '2', '172', '0', '6700', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('264', '528', '2', '6', '1', '3', '3', '2', '80', '0', '650', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('265', '529', null, null, '1', '5', '3', '2', '105', '0', '850', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('266', '530', '22', '29', '1', '2', '4', '2', '134', '0', '1300', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('267', '531', null, null, '1', '5', '2', '2', '80', '0', '650', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('268', '532', '3', '4', '1', '3', '3', '2', '75', '0', '350', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('269', '533', null, '6', '1', '3', '2', '2', '80', '0', '180', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('270', '534', '5', '6', '1', '3', '3', '2', '80', '0', '230', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('271', '535', '7', '12', '1', '3', '3', '2', '130', '0', '1000', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('272', '536', null, null, '1', '5', '4', '2', '70', '0', '1800', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('273', '537', null, '6', '1', '3', '3', '2', '80', '0', '180', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('274', '538', '5', '5', '1', '3', '3', '2', '126', '0', '1000', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('275', '539', null, null, '1', '5', '3', '2', '70', '0', '800', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('276', '540', '2', '6', '1', '3', '3', '2', '80', '0', '150', '1', '3', null, '3');
INSERT INTO `f_info_2` VALUES ('277', '541', null, null, '1', '5', '3', '2', '70', '0', '1000', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('278', '542', '1', '11', '1', '4', '1', '2', '172', '0', '2000', '1', '3', null, '9');
INSERT INTO `f_info_2` VALUES ('279', '543', '5', '7', '1', '3', '3', '2', '146', '0', '2000', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('280', '544', '1', '11', '1', '5', '1', '2', '30', '0', '350', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('281', '545', '18', '24', '1', '2', '3', '2', '93', '0', '800', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('282', '546', '10', '11', '1', '2', '1', '2', '100', '0', '800', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('283', '547', '2', '6', '1', '2', '1', '2', '60', '0', '700', '1', '3', null, '1');
INSERT INTO `f_info_2` VALUES ('284', '548', '7', '11', '1', '3', '4', '2', '102', '0', '1600', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('285', '549', '2', '12', '1', '3', '4', '2', '120', '0', '2000', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('286', '550', '2', '6', '1', '2', '1', '2', '60', '0', '700', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('287', '551', '4', '6', '1', '5', '3', '2', '105', '0', '850', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('288', '552', '5', null, '1', '3', '1', '2', '95', '0', '600', '1', '3', null, '4');
INSERT INTO `f_info_2` VALUES ('289', '553', '3', null, '1', '3', '1', '2', '117', '0', '1000', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('290', '554', '5', '6', '1', '4', '1', '2', '164', '0', '1000', '1', '3', null, '10');
INSERT INTO `f_info_2` VALUES ('291', '555', '4', '6', '1', '2', '1', '2', '87', '0', '650', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('292', '556', '3', null, '1', '3', '1', '2', '134', '0', '1500', '1', '3', null, '6');
INSERT INTO `f_info_2` VALUES ('293', '557', '16', null, '1', '1', '1', '2', '45', '0', '600', '1', '3', null, '11');
INSERT INTO `f_info_2` VALUES ('294', '558', '3', '4', '1', '3', '3', '2', '75', '0', '350', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('295', '559', '4', null, '1', '3', '3', '2', '135', '0', '1200', '1', '3', null, '5');
INSERT INTO `f_info_2` VALUES ('296', '560', '5', '6', '1', '5', '1', '2', '90', '0', '750', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('297', '561', '11', null, '1', '3', '1', '2', '190', '0', '2000', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('298', '562', '1', '6', '1', '5', '1', '2', '130', '0', '2500', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('299', '563', '4', '12', '1', '3', '1', '2', '134', '0', '1200', '1', '3', null, '2');
INSERT INTO `f_info_2` VALUES ('300', '564', '4', '12', '1', '3', '1', '2', '134', '0', '1200', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('301', '565', '6', '7', '1', '5', '1', '2', '155', '0', '900', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('302', '566', '4', '6', '1', '2', '1', '2', '75', '0', '650', '1', '3', null, '12');
INSERT INTO `f_info_2` VALUES ('303', '567', '1', '6', '1', '2', '3', '2', '100', '0', '1000', '1', '3', '1,3,5,7', '9');
INSERT INTO `f_info_2` VALUES ('304', '568', '9', '12', '1', '3', '1', '2', '136', '0', '1300', '1', '3', null, '13');
INSERT INTO `f_info_2` VALUES ('305', '569', '3', '7', '1', '3', '4', '2', '100', '0', '1000', '1', '3', null, '8');
INSERT INTO `f_info_2` VALUES ('306', '570', '5', '20', '1', '3', '1', '2', '130', '0', '1000', '1', '3', null, '7');
INSERT INTO `f_info_2` VALUES ('307', '1575', '5', '12', '1', '7', '4', '2', '156', '0', '1600', '1', '3', '', '1');
INSERT INTO `f_info_2` VALUES ('308', '1576', '4', '6', '1', '7', '3', '2', '156', '嘉祥开发区', '600', '1', '3', '1,2,3', '10');
INSERT INTO `f_info_2` VALUES ('310', '1583', '3', '6', '1', '5', '2', '1', '80', '市中区光河路明珠小区', '1500', '1', '0', '1,2,5,8,17', '1');
INSERT INTO `f_info_2` VALUES ('311', '1585', '0', '0', '1', '5', '4', '2', '65', '大仓路勤业新村', '1200', '1', '1', '', '1');

-- ----------------------------
-- Table structure for `f_info_20`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_20`;
CREATE TABLE `f_info_20` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `qy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_20
-- ----------------------------
INSERT INTO `f_info_20` VALUES ('1', '1593', '1');
INSERT INTO `f_info_20` VALUES ('2', '1595', '1');

-- ----------------------------
-- Table structure for `f_info_3`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_3`;
CREATE TABLE `f_info_3` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `address` varchar(255) default NULL,
  `fwhx` int(2) default NULL,
  `wylx` int(2) default NULL,
  `makes` int(2) default NULL,
  `housearea` int(10) default NULL,
  `price` int(10) default NULL,
  `zj` int(2) default NULL,
  `floorall` int(10) default NULL,
  `floor` int(10) default NULL,
  `direction` int(10) default NULL,
  `equipment` varchar(255) default NULL,
  `qy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=740 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_3
-- ----------------------------
INSERT INTO `f_info_3` VALUES ('6', '6', '济宁市中区光河路明珠小区', '3', '1', '4', '120', '42', '1', '6', '4', '1', '1,2,3,4,5,6', '7');
INSERT INTO `f_info_3` VALUES ('10', '2', '济宁市中区武装部', '3', '3', '2', '90', '24', '1', '6', '2', '3', '1,2,4,5,6', '4');
INSERT INTO `f_info_3` VALUES ('11', '31', '名苑东区', '2', '1', '3', '95', '30', '1', '2', '6', '1', '1,2,3,4,5,8,9,15', '3');
INSERT INTO `f_info_3` VALUES ('12', '53', '樱花宿舍位于霍家街小学附近', '3', '1', '4', '132', '65', '2', '3', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('13', '65', '环城北路党校北临', '3', '1', '2', '137', '76', '1', '9', '11', '1', '1,2,3,8,9,10,15', '7');
INSERT INTO `f_info_3` VALUES ('14', '66', '科苑路', '2', '1', '2', '87', '37', '1', null, '6', null, '1,2,9,15,17', '13');
INSERT INTO `f_info_3` VALUES ('15', '67', '二院南邻', '3', '1', '4', '150', '69', '2', '3', '6', null, '1,2,3,9,10,17', '12');
INSERT INTO `f_info_3` VALUES ('16', '817', '都市豪庭（吴泰闸路）', '5', '1', '3', '137', '98', '2', '11', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('17', '818', '齐鲁证券宿舍', '2', '1', '2', '97', '48', '1', '6', '5', null, null, '6');
INSERT INTO `f_info_3` VALUES ('18', '819', '核桃园', '8', '1', '4', '41', '52', '1', null, null, null, null, '10');
INSERT INTO `f_info_3` VALUES ('19', '820', '阳光花园', '7', '1', '3', '120', '22', '2', '6', '6', null, null, '1');
INSERT INTO `f_info_3` VALUES ('20', '821', '党校附近', '8', '1', '4', '65', '23', '2', '6', '6', null, null, '13');
INSERT INTO `f_info_3` VALUES ('21', '822', '接庄镇大郝村', '3', '1', '2', '102', '22', '2', '6', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('22', '823', '光和东路', '1', '1', '2', '121', '54', '2', '11', '11', null, null, '2');
INSERT INTO `f_info_3` VALUES ('23', '824', '杨柳国际新城', '6', '1', '3', '220', '42', '2', '7', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('24', '825', '济北商贸城', '3', '1', '2', '123', '24', '1', '6', '6', null, null, '10');
INSERT INTO `f_info_3` VALUES ('25', '826', '南苑社区', '2', '1', '2', '98', '31', '2', '7', '3', null, null, '13');
INSERT INTO `f_info_3` VALUES ('26', '827', '新世纪广场西', '3', '1', '2', '133', '66', '1', '23', '12', null, null, '1');
INSERT INTO `f_info_3` VALUES ('27', '828', '菱花小区', '6', '1', '3', '84', '28', '2', '6', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('28', '829', '红星中路', '4', '1', '2', '63', '35', '1', '4', '3', null, null, '5');
INSERT INTO `f_info_3` VALUES ('29', '830', '五里营', '8', '1', '4', '143', '29', '2', '7', '6', null, null, '11');
INSERT INTO `f_info_3` VALUES ('30', '831', '市土管局78平3层精装市免40万，党校98平1层精装元46万', '8', '1', '4', '55', '22', '2', '6', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('31', '832', '中区', '3', '1', '2', '110', '45', '2', '6', '2', null, null, '5');
INSERT INTO `f_info_3` VALUES ('32', '833', '益民东区南组团', '3', '1', '2', '190', '82', '1', '12', '7', null, null, '1');
INSERT INTO `f_info_3` VALUES ('33', '834', '太白路电业局附近', '5', '1', '3', '88', '50', '1', '16', '5', null, null, '12');
INSERT INTO `f_info_3` VALUES ('34', '835', '吉安小区，太白路南，', '8', '1', '4', '132', '60', '1', '6', '5', null, null, '13');
INSERT INTO `f_info_3` VALUES ('35', '836', '海关路', '4', '1', '3', '80', '36', '1', null, '6', null, null, '1');
INSERT INTO `f_info_3` VALUES ('36', '837', '济邹路', '5', '1', '3', '107', '41', '2', '6', '6', null, null, '7');
INSERT INTO `f_info_3` VALUES ('37', '838', '煤矿机械厂宿舍', '6', '1', '3', '126', '35', '2', '6', '4', null, null, '8');
INSERT INTO `f_info_3` VALUES ('38', '839', '红星东路', '8', '1', '4', '140', '66', '2', '11', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('39', '840', '吴泰闸路88号', '4', '1', '2', '174', '150', '1', '13', '12', null, null, '9');
INSERT INTO `f_info_3` VALUES ('40', '841', '南门口玉堂附近', '5', '1', '3', '156', '68', '1', '12', '5', null, null, '1');
INSERT INTO `f_info_3` VALUES ('41', '842', '凤凰城', '4', '1', '3', '116', '42', '1', '6', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('42', '843', '造店阁小区', '8', '1', '4', '97', '36', '2', '6', '5', null, null, '4');
INSERT INTO `f_info_3` VALUES ('43', '844', '琵琶山小区', '3', '1', '2', '137', '55', '1', '6', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('44', '845', '洸河花园', '3', '1', '2', '164', '109', '1', '6', '2', null, null, '4');
INSERT INTO `f_info_3` VALUES ('45', '846', '新世纪广场附近”科院小区', '6', '1', '3', '140', '54', '2', '6', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('46', '847', '水产路', '8', '1', '4', '130', '36', '2', '5', '1', null, null, '1');
INSERT INTO `f_info_3` VALUES ('47', '848', '香港大厦附近', '8', '1', '4', '111', '52', '2', '12', '5', null, null, '6');
INSERT INTO `f_info_3` VALUES ('48', '849', '梦园南区', '4', '1', '3', '78', '23', '1', '6', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('49', '850', '红星东路', '3', '1', '2', '95', '35', '1', '6', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('50', '851', '自来水公司附近', '8', '1', '4', '80', '35', '2', '6', '2', null, null, '10');
INSERT INTO `f_info_3` VALUES ('51', '852', '吉安小区', '5', '1', '3', '65', '29', '2', '6', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('52', '853', '光河花园', '5', '1', '3', '97', '43', '1', '4', '4', null, null, '4');
INSERT INTO `f_info_3` VALUES ('53', '854', '新苑雅居', '2', '1', '2', '163', '70', '2', '12', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('54', '855', '益民东区', '4', '1', '3', '105', '50', '1', '6', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('55', '856', '红星路与济安桥路90平1层暖30万', '8', '1', '4', '71', '35', '1', '6', '2', null, null, '4');
INSERT INTO `f_info_3` VALUES ('56', '857', '太白路玉堂附近', '7', '1', '3', '156', '9', '2', '16', '9', null, null, '1');
INSERT INTO `f_info_3` VALUES ('57', '858', '樱花南宿舍', '8', '1', '4', '57', '21', '2', '3', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('58', '859', '汶上县', '7', '1', '3', '600', '300', '1', null, null, null, null, '13');
INSERT INTO `f_info_3` VALUES ('59', '860', '太白西路', '7', '1', '4', '80', '28', '1', '6', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('60', '861', '解放路附近', '3', '1', '2', '138', '52', '1', '12', '12', null, null, '5');
INSERT INTO `f_info_3` VALUES ('61', '862', '吴泰闸', '5', '1', '3', '134', '64', '1', '11', '3', null, null, '12');
INSERT INTO `f_info_3` VALUES ('62', '863', '红星西路阳光花园对过', '6', '1', '3', '54', '22', '2', '4', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('63', '864', '高新区', '1', '1', '2', '103', '35', '1', '6', '2', null, null, '1');
INSERT INTO `f_info_3` VALUES ('64', '865', '洸河花园', '5', '1', '3', '140', '92', '1', '6', '3', null, null, '8');
INSERT INTO `f_info_3` VALUES ('65', '866', '高新区', '5', '1', '3', '120', '43', '1', '6', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('66', '867', '红星 东路', '8', '1', '4', '105', '50', '2', '6', '5', null, null, '12');
INSERT INTO `f_info_3` VALUES ('67', '868', '洸河花园', '1', '1', '2', '164', '109', '1', '6', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('68', '869', '红星西路与济安桥路口东北角', '8', '1', '4', '90', '30', '1', '6', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('69', '870', '冠亚星城', '8', '1', '4', '118', '68', '2', '17', '12', null, null, '1');
INSERT INTO `f_info_3` VALUES ('70', '871', '凯赛大桥东临', '2', '1', '2', '82', '26', '1', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('71', '872', '吴太闸路附近', '1', '1', '2', '110', '47', '2', '7', '67', null, null, '6');
INSERT INTO `f_info_3` VALUES ('72', '873', '桂园小区', '4', '1', '2', '160', '110', '1', '5', '1', null, null, '10');
INSERT INTO `f_info_3` VALUES ('73', '874', '太白东路', '8', '1', '4', '47', '20', '2', '5', '5', null, null, '8');
INSERT INTO `f_info_3` VALUES ('74', '875', '红星东路', '3', '1', '2', '80', '36', '2', '6', '5', null, null, '2');
INSERT INTO `f_info_3` VALUES ('75', '876', '阳光花园', '3', '1', '2', '120', '22', '1', '6', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('76', '877', '齐鲁证券宿舍', '8', '1', '4', '97', '48', '2', '6', '5', null, null, '10');
INSERT INTO `f_info_3` VALUES ('77', '878', '光河路', '6', '1', '3', '86', '25', '2', '6', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('78', '879', '共青团路经纬附近', '6', '1', '3', '85', '42', '2', '4', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('79', '880', '中区', '4', '1', '2', '40', '17', '1', '6', '3', null, null, '3');
INSERT INTO `f_info_3` VALUES ('80', '881', '邻竹竿巷街', '8', '1', '4', '62', '25', '2', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('81', '882', '洸河西路 开泰花园小区', '6', '1', '3', '96', '38', '2', '6', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('82', '883', '吴泰闸路', '5', '1', '3', '138', '78', '1', '12', '9', null, null, '7');
INSERT INTO `f_info_3` VALUES ('83', '884', '绿地附近 单位宿舍', '6', '1', '3', '70', '36', '1', '4', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('84', '885', '金宇路火炬路交界', '5', '1', '3', '47', '20', '1', '23', '15', null, null, '7');
INSERT INTO `f_info_3` VALUES ('85', '886', '渔山小区 单位宿舍', '2', '1', '2', '99', '52', '1', '6', '5', null, null, '7');
INSERT INTO `f_info_3` VALUES ('86', '887', '太白东路', '7', '1', '4', '47', '20', '2', '5', '5', null, null, '2');
INSERT INTO `f_info_3` VALUES ('87', '888', '科苑小区', '4', '1', '2', '82', '42', '1', null, '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('88', '889', '太白 东路', '6', '1', '3', '125', '51', '2', '12', '3', null, null, '3');
INSERT INTO `f_info_3` VALUES ('89', '890', '太白东路原山推对过', '8', '1', '4', '145', '64', '1', '12', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('90', '891', '梦圆北区', '5', '1', '3', '78', '25', '1', null, '4', null, null, '11');
INSERT INTO `f_info_3` VALUES ('91', '892', '环城西路', '8', '1', '4', '80', '33', '2', '6', '6', null, null, '4');
INSERT INTO `f_info_3` VALUES ('92', '893', '银都花园', '8', '1', '4', '105', '50', '2', '6', '5', null, null, '4');
INSERT INTO `f_info_3` VALUES ('93', '894', '圣景园小区塑料制品厂宿舍', '7', '1', '4', '87', '36', '1', '7', '1', null, null, '5');
INSERT INTO `f_info_3` VALUES ('94', '895', '西闸社区', '8', '1', '4', '75', '33', '1', '6', '5', null, null, '13');
INSERT INTO `f_info_3` VALUES ('95', '896', '长虹小区 带车库 新房', '4', '1', '3', '120', '43', '1', '6', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('96', '897', '后营小区贸易中心对过', '4', '1', '2', '80', '38', '1', '5', '5', null, null, '13');
INSERT INTO `f_info_3` VALUES ('97', '898', '长虹小区', '8', '1', '4', '93', '34', '2', '6', '4', null, null, '1');
INSERT INTO `f_info_3` VALUES ('98', '899', '红星西路', '6', '1', '3', '54', '22', '2', '4', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('99', '900', '中区汽车北站黄金地段', '1', '1', '2', '80', '27', '1', '26', '12', null, null, '2');
INSERT INTO `f_info_3` VALUES ('100', '901', '龙行路1号，苏果超市对过', '7', '1', '3', '80', '13', '1', null, null, null, null, '12');
INSERT INTO `f_info_3` VALUES ('101', '902', '育才西邻', '1', '1', '2', '70', '31', '1', null, '4', null, null, '12');
INSERT INTO `f_info_3` VALUES ('102', '903', '古槐路一中西校区附近', '8', '1', '4', '105', '45', '2', '6', '4', null, null, '4');
INSERT INTO `f_info_3` VALUES ('103', '904', '阳光城市花园', '6', '1', '3', '110', '47', '1', null, '7', null, null, '7');
INSERT INTO `f_info_3` VALUES ('104', '905', '太白西路工人医院附近', '2', '1', '2', '65', '29', '1', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('105', '906', '冠亚星城附近', '1', '1', '2', '164', '70', '2', '27', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('106', '907', '洸河花园', '4', '1', '3', '85', '42', '1', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('107', '908', '太白路火炬路交叉口', '1', '1', '2', '104', '55', '1', '11', '10', null, null, '13');
INSERT INTO `f_info_3` VALUES ('108', '909', '鸿顺花园', '8', '1', '4', '98', '49', '2', '6', '1', null, null, '1');
INSERT INTO `f_info_3` VALUES ('109', '910', '老杨桥南', '1', '1', '2', '99', '31', '1', '7', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('110', '911', '红星 东路', '2', '1', '2', '114', '60', '1', '6', '3', null, null, '12');
INSERT INTO `f_info_3` VALUES ('111', '912', '杨柳国际', '2', '1', '2', '93', '38', '1', '6', '4', null, null, '6');
INSERT INTO `f_info_3` VALUES ('112', '913', '凯伦小区', '6', '1', '3', '188', '56', '1', '6', '3', null, null, '3');
INSERT INTO `f_info_3` VALUES ('113', '914', '济北新区，新327国道北乘4路车下车即到', '2', '1', '2', '120', '22', '2', '6', '5', null, null, '3');
INSERT INTO `f_info_3` VALUES ('114', '915', '吴泰闸路北建设路东', '8', '1', '4', '155', '105', '2', '12', null, null, null, '4');
INSERT INTO `f_info_3` VALUES ('115', '916', '红星西路爱客多超市北临，嘉隆商业街', '8', '1', '4', '35', '34', '2', '1', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('116', '917', '吴泰闸东路', '8', '1', '4', '165', '64', '2', '12', '10', null, null, '7');
INSERT INTO `f_info_3` VALUES ('117', '918', '开泰花园40号楼东4单元11楼东户', '2', '1', '2', '203', '65', '1', '12', '11', null, null, '1');
INSERT INTO `f_info_3` VALUES ('118', '919', '中区', '5', '1', '3', '80', '35', '2', '6', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('119', '920', '红星中路', '4', '1', '2', '136', '80', '1', null, '20', null, null, '7');
INSERT INTO `f_info_3` VALUES ('120', '921', '新世纪广场南邻', '7', '1', '3', '103', '52', '2', '7', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('121', '922', '红星东路', '7', '1', '3', '150', '45', '2', '6', '6', null, null, '4');
INSERT INTO `f_info_3` VALUES ('122', '923', '龙城水岸盛世', '4', '1', '2', '74', '36', '1', '26', '10', null, null, '7');
INSERT INTO `f_info_3` VALUES ('123', '924', '光和花园85平6层暖精装26万116平4层暖55万', '8', '1', '4', '58', '24', '2', '6', '1', null, null, '10');
INSERT INTO `f_info_3` VALUES ('124', '925', '丹桂苑小区', '2', '1', '2', '104', '55', '1', '11', '10', null, null, '1');
INSERT INTO `f_info_3` VALUES ('125', '926', '梦圆南区', '5', '1', '3', '74', '25', '2', '5', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('126', '927', '东门小区', '8', '1', '4', '51', '23', '2', '6', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('127', '928', '光河花园西邻,兴唐经典北邻，长安花园沿街门面', '1', '1', '2', '67', '60', '1', '2', '1', null, null, '6');
INSERT INTO `f_info_3` VALUES ('128', '929', '红星东路', '7', '1', '4', '87', '43', '1', '6', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('129', '930', '汽车南站干休所', '7', '1', '3', '102', '47', '2', '26', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('130', '931', '光河路益民西区西邻洸河人家', '8', '1', '4', '148', '78', '2', '6', '4', null, null, '4');
INSERT INTO `f_info_3` VALUES ('131', '932', '开泰花园', '1', '1', '2', '126', '44', '2', null, '12', null, null, '3');
INSERT INTO `f_info_3` VALUES ('132', '933', '崇文大道北临', '4', '1', '2', '132', '37', '1', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('133', '934', '大郝村', '8', '1', '4', '102', '22', '2', '6', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('134', '935', '古槐路', '6', '1', '3', '41', '17', '2', '3', '3', null, null, '8');
INSERT INTO `f_info_3` VALUES ('135', '936', '都市豪庭', '3', '1', '2', '155', '105', '1', '11', '1', null, null, '1');
INSERT INTO `f_info_3` VALUES ('136', '937', '汽车南站干休所', '5', '1', '3', '102', '47', '1', '26', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('137', '938', '水景花园', '7', '1', '4', '88', '50', '2', '17', '5', null, null, '3');
INSERT INTO `f_info_3` VALUES ('138', '939', '吴泰闸路香港大厦东', '8', '1', '4', '130', '62', '2', '10', '5', null, null, '7');
INSERT INTO `f_info_3` VALUES ('139', '940', '冀州路', '1', '1', '2', '87', '36', '1', null, '1', null, null, '9');
INSERT INTO `f_info_3` VALUES ('140', '941', '金宇东路', '1', '1', '2', '130', '33', '1', '25', '9', null, null, '4');
INSERT INTO `f_info_3` VALUES ('141', '942', '刘庄小区', '3', '1', '2', '80', '35', '1', '6', '3', null, null, '5');
INSERT INTO `f_info_3` VALUES ('142', '943', '吴泰闸路', '2', '1', '2', '85', '3505', '1', '6', '5', null, null, '8');
INSERT INTO `f_info_3` VALUES ('143', '944', '洸河花园', '1', '1', '2', '164', '109', '1', '6', '2', null, null, '1');
INSERT INTO `f_info_3` VALUES ('144', '945', '太白路南邻', '6', '1', '3', '98', '43', '2', '6', '4', null, null, '12');
INSERT INTO `f_info_3` VALUES ('145', '946', '银都花园', '6', '1', '3', '166', '68', '2', '6', '5', null, null, '7');
INSERT INTO `f_info_3` VALUES ('146', '947', '科苑路', '2', '1', '2', '85', '37', '1', '6', null, null, null, '11');
INSERT INTO `f_info_3` VALUES ('147', '948', '红兴东路', '8', '1', '4', '137', '61', '2', '6', '4', null, null, '11');
INSERT INTO `f_info_3` VALUES ('148', '949', '皇营小区', '8', '1', '4', '82', '32', '1', '6', '4', null, null, '6');
INSERT INTO `f_info_3` VALUES ('149', '950', '西红庙81平6层市证35万，王母阁83平4层市证35万', '5', '1', '3', '108', '48', '2', '12', '11', null, null, '12');
INSERT INTO `f_info_3` VALUES ('150', '951', '吴泰闸路新天地花园（济宁电业局宿舍）', '4', '1', '3', '320', '140', '1', '6', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('151', '952', '古槐路西', '7', '1', '3', '133', '43', '1', '6', '6', null, null, '3');
INSERT INTO `f_info_3` VALUES ('152', '953', '附高86平4层市免32万，兴唐经典120平4层暖55万', '7', '1', '3', '85', '26', '2', '6', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('153', '954', '15中西', '8', '1', '4', '80', '39', '2', '6', '1', null, null, '6');
INSERT INTO `f_info_3` VALUES ('154', '955', '红星东路', '7', '1', '4', '98', '44', '1', '12', '4', null, null, '1');
INSERT INTO `f_info_3` VALUES ('155', '956', '鲁兴153平 4*2 精装 6F 52万', '2', '1', '2', '100', '52', '1', '6', '3', null, null, '8');
INSERT INTO `f_info_3` VALUES ('156', '957', '吴泰闸路北建设路东', '8', '1', '4', '220', '111', '1', '12', '11', null, null, '9');
INSERT INTO `f_info_3` VALUES ('157', '958', '东门小学附近（樱花园）', '7', '1', '4', '71', '37', '2', '6', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('158', '959', '崇文名都 99平 4F 车库21平 30吴 3*1*1', '2', '1', '2', '103', '35', '1', '6', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('159', '960', '太白东路', '8', '1', '4', '127', '46', '2', '18', '8', null, null, '3');
INSERT INTO `f_info_3` VALUES ('160', '961', '洸河花园', '8', '1', '4', '164', '109', '2', '6', '2', null, null, '4');
INSERT INTO `f_info_3` VALUES ('161', '962', '红星东路', '6', '1', '3', '142', '69', '2', '12', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('162', '963', '九九花园对过，大唐中学西邻', '2', '1', '2', '98', '30', '1', '7', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('163', '964', '冠亚星城', '4', '1', '3', '150', '73', '2', null, '9', null, null, '9');
INSERT INTO `f_info_3` VALUES ('164', '965', '丹桂苑', '7', '1', '3', '134', '51', '2', null, '9', null, null, '10');
INSERT INTO `f_info_3` VALUES ('165', '966', '科苑小区', '8', '1', '4', '80', '42', '2', '6', '2', null, null, '9');
INSERT INTO `f_info_3` VALUES ('166', '967', '洸河花园', '3', '1', '2', '164', '109', '2', '6', '2', null, null, '9');
INSERT INTO `f_info_3` VALUES ('167', '968', '开泰小区', '2', '1', '2', '81', '41', '2', null, '1', null, null, '12');
INSERT INTO `f_info_3` VALUES ('168', '969', '洸河花园', '8', '1', '4', '164', '109', '1', '6', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('169', '970', '核桃园', '4', '1', '3', '42', '24', '2', null, '2', null, null, '1');
INSERT INTO `f_info_3` VALUES ('170', '971', '中区', '7', '1', '3', '188', '73', '1', '13', '11', null, null, '13');
INSERT INTO `f_info_3` VALUES ('171', '972', '红星东路', '2', '1', '2', '115', '52', '2', '13', null, null, null, '9');
INSERT INTO `f_info_3` VALUES ('172', '973', '绿地', '3', '1', '2', '105', '48', '1', null, '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('173', '974', '东门', '7', '1', '4', '71', '33', '2', '6', '2', null, null, '4');
INSERT INTO `f_info_3` VALUES ('174', '975', '绿地', '8', '1', '4', '144', '75', '2', null, '5', null, null, '3');
INSERT INTO `f_info_3` VALUES ('175', '976', '北门小区工商局宿舍', '1', '1', '2', '89', '41', '1', null, '5', null, null, '13');
INSERT INTO `f_info_3` VALUES ('176', '977', '凯伦小区', '3', '1', '2', '188', '56', '1', '6', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('177', '978', '新体育馆', '8', '1', '4', '110', '50', '2', '7', '6', null, null, '3');
INSERT INTO `f_info_3` VALUES ('178', '979', '长虹5F 120平 精装 市证 免税 车库20平 46万', '6', '1', '3', '120', '43', '2', '6', '3', null, null, '4');
INSERT INTO `f_info_3` VALUES ('179', '980', '国税局宿舍164平 6F 70万 8月上房 可贷 卖方改合同', '7', '1', '4', '145', '76', '2', '17', '4', null, null, '7');
INSERT INTO `f_info_3` VALUES ('180', '981', '红星 东路', '1', '1', '2', '87', '43', '2', '6', '3', null, null, '3');
INSERT INTO `f_info_3` VALUES ('181', '982', '龙城水岸盛世', '6', '1', '3', '74', '35', '2', '26', '10', null, null, '3');
INSERT INTO `f_info_3` VALUES ('182', '983', '都市春天二期', '4', '1', '3', '95', '41', '2', '17', '6', null, null, '10');
INSERT INTO `f_info_3` VALUES ('183', '984', '多套精品房源 欢迎来电咨询', '7', '1', '4', '150', '75', '2', '18', '5', null, null, '3');
INSERT INTO `f_info_3` VALUES ('184', '985', '科苑路', '5', '1', '3', '85', '37', '1', '6', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('185', '986', '樱花园小区3楼 63 35万 暖', '7', '1', '3', '78', '45', '1', '6', '1', null, null, '13');
INSERT INTO `f_info_3` VALUES ('186', '987', '梦圆新苑90平2层暖27库46.8万', '2', '1', '2', '85', '42', '2', '6', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('187', '988', '新世纪广场西邻', '4', '1', '2', '138', '96', '1', '23', '13', null, null, '11');
INSERT INTO `f_info_3` VALUES ('188', '989', '洸河花园', '8', '1', '4', '85', '42', '1', '6', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('189', '990', '教育局78平3层暖市证36万，解放路138平12层52万', '4', '1', '3', '85', '26', '1', '7', '6', null, null, '1');
INSERT INTO `f_info_3` VALUES ('190', '991', '百花公园东', '1', '1', '2', '61', '14', '1', '6', '6', null, null, '13');
INSERT INTO `f_info_3` VALUES ('191', '992', '金宇东路杨柳国际新城', '2', '1', '2', '98', '35', '1', '6', '3', null, null, '5');
INSERT INTO `f_info_3` VALUES ('192', '993', '光河花园6楼62平方精装20万', '5', '1', '3', '155', '65', '1', '5', '4', null, null, '4');
INSERT INTO `f_info_3` VALUES ('193', '994', '菱花小区', '1', '1', '2', '102', '29', '1', '6', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('194', '995', '曲阜市新区复邦新都家园', '6', '1', '3', '132', '30', '2', '5', '3', null, null, '3');
INSERT INTO `f_info_3` VALUES ('195', '996', '吴太闸路', '4', '1', '2', '134', '64', '1', '11', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('196', '997', '杨柳国际新城', '8', '1', '4', '118', '30', '1', '6', '6', null, null, '13');
INSERT INTO `f_info_3` VALUES ('197', '998', '鲁兴花园', '8', '1', '4', '153', '51', '2', '7', '6', null, null, '8');
INSERT INTO `f_info_3` VALUES ('198', '999', '益民东区', '6', '1', '3', '77', '37', '1', '6', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('199', '1000', '红星东路', '2', '1', '2', '135', '69', '1', '6', '4', null, null, '2');
INSERT INTO `f_info_3` VALUES ('200', '1001', '开发区', '8', '1', '4', '280', '160', '2', '16', '16', null, null, '5');
INSERT INTO `f_info_3` VALUES ('201', '1002', '红星东路', '1', '1', '2', '95', '35', '1', '6', '6', null, null, '4');
INSERT INTO `f_info_3` VALUES ('202', '1003', '光河西路', '2', '1', '2', '60', '10', '2', '6', '5', null, null, '5');
INSERT INTO `f_info_3` VALUES ('203', '1004', '新世纪广场东 光河路', '8', '1', '4', '81', '36', '2', '6', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('204', '1005', '环城西路', '1', '1', '2', '137', '74', '1', '16', '9', null, null, '4');
INSERT INTO `f_info_3` VALUES ('205', '1006', '光河花园西邻,兴唐经典北邻，长安花园沿街门面', '7', '1', '3', '67', '60', '2', '2', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('206', '1007', '银都瑞祥园', '7', '1', '4', '105', '50', '2', '6', '5', null, null, '9');
INSERT INTO `f_info_3` VALUES ('207', '1008', '光河路', '2', '1', '2', '130', '58', '1', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('208', '1009', '新世纪广场北', '8', '1', '4', '115', '48', '2', '29', '24', null, null, '12');
INSERT INTO `f_info_3` VALUES ('209', '1010', '银都花园（红星东路）', '8', '1', '4', '95', '35', '2', '6', '6', null, null, '4');
INSERT INTO `f_info_3` VALUES ('210', '1011', '红星小区', '6', '1', '3', '55', '25', '2', '4', '1', null, null, '9');
INSERT INTO `f_info_3` VALUES ('211', '1012', '太白小区', '8', '1', '4', '75', '36', '2', '5', '2', null, null, '7');
INSERT INTO `f_info_3` VALUES ('212', '1013', '二院东临', '6', '1', '3', '135', '70', '2', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('213', '1014', '崇文大道南', '6', '1', '3', '98', '26', '2', '6', '2', null, null, '11');
INSERT INTO `f_info_3` VALUES ('214', '1015', '长安花园', '4', '1', '2', '88', '35', '2', null, '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('215', '1016', '赛马特附近', '5', '1', '3', '144', '75', '1', '6', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('216', '1017', '北湖', '3', '1', '2', '1', '11', '1', null, null, null, null, '8');
INSERT INTO `f_info_3` VALUES ('217', '1018', '梦圆小区', '6', '1', '3', '88', '26', '2', '6', '3', null, null, '12');
INSERT INTO `f_info_3` VALUES ('218', '1019', '曲阜开瑞小区', '8', '1', '4', '93', '30', '2', '7', '4', null, null, '10');
INSERT INTO `f_info_3` VALUES ('219', '1020', '解放路', '8', '1', '4', '138', '52', '1', '12', '12', null, null, '6');
INSERT INTO `f_info_3` VALUES ('220', '1021', '长安小区', '1', '1', '2', '68', '22', '1', null, '3', null, null, '8');
INSERT INTO `f_info_3` VALUES ('221', '1022', '红星东路', '5', '1', '3', '85', '36', '2', '6', '5', null, null, '13');
INSERT INTO `f_info_3` VALUES ('222', '1023', '市中区', '7', '1', '3', '117', '47', '2', '12', null, null, null, '5');
INSERT INTO `f_info_3` VALUES ('223', '1024', '来鹤小区', '1', '1', '2', '200', '48', '1', '7', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('224', '1025', '冠亚星城南门', '3', '1', '2', '78', '118', '1', null, '1', null, null, '3');
INSERT INTO `f_info_3` VALUES ('225', '1026', '杨柳国际新城', '4', '1', '2', '220', '60', '1', '6', '5', null, null, '12');
INSERT INTO `f_info_3` VALUES ('226', '1027', '舜泰园小区', '3', '1', '2', '145', '78', '2', null, null, null, null, '7');
INSERT INTO `f_info_3` VALUES ('227', '1028', '火炬路南长城工业园', '8', '1', '4', '40', '8', '2', '6', '1', null, null, '9');
INSERT INTO `f_info_3` VALUES ('228', '1029', '鸿顺花园', '8', '1', '4', '91', '39', '2', '6', '2', null, null, '1');
INSERT INTO `f_info_3` VALUES ('229', '1030', '兴隆桥小区', '1', '1', '2', '70', '35', '1', '6', '1', null, null, '12');
INSERT INTO `f_info_3` VALUES ('230', '1031', '中区开发区', '8', '1', '4', '175', '100', '2', '23', '9', null, null, '8');
INSERT INTO `f_info_3` VALUES ('231', '1032', '刘庄小区', '1', '1', '2', '72', '30', '1', '5', '4', null, null, '10');
INSERT INTO `f_info_3` VALUES ('232', '1033', '红星西路阳光花园对过', '8', '1', '4', '54', '22', '1', '4', '3', null, null, '7');
INSERT INTO `f_info_3` VALUES ('233', '1034', '菱花小区', '3', '1', '2', '82', '25', '1', '5', '1', null, null, '12');
INSERT INTO `f_info_3` VALUES ('234', '1035', '15中南邻，中泰丰源小高层', '7', '1', '3', '136', '63', '2', '12', '11', null, null, '8');
INSERT INTO `f_info_3` VALUES ('235', '1036', '浣笔泉小区', '6', '1', '3', '80', '35', '2', '4', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('236', '1037', '红星东路', '8', '1', '4', '140', '66', '2', '11', '3', null, null, '2');
INSERT INTO `f_info_3` VALUES ('237', '1038', '菱花小区', '8', '1', '4', '86', '23', '2', '6', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('238', '1039', '阳光润泽园', '1', '1', '2', '130', '57', '2', null, '1', null, null, '1');
INSERT INTO `f_info_3` VALUES ('239', '1040', '冠亚星城东', '2', '1', '2', '54', '15', '2', '5', '5', null, null, '1');
INSERT INTO `f_info_3` VALUES ('240', '1041', '海关路、', '8', '1', '4', '102', '50', '2', '6', '5', null, null, '3');
INSERT INTO `f_info_3` VALUES ('241', '1042', '洸河路（人防大厦东邻）', '4', '1', '3', '51', '86', '1', '12', '1', null, null, '10');
INSERT INTO `f_info_3` VALUES ('242', '1043', '呈祥小区', '6', '1', '3', '86', '19', '2', '5', '1', null, null, '11');
INSERT INTO `f_info_3` VALUES ('243', '1044', '凤凰城', '7', '1', '3', '92', '28', '1', '6', '4', null, null, '12');
INSERT INTO `f_info_3` VALUES ('244', '1045', '龙腾水岸盛世5号楼', '4', '1', '3', '74', '35', '2', '26', '10', null, null, '6');
INSERT INTO `f_info_3` VALUES ('245', '1046', '冠亚附近', '8', '1', '4', '164', '70', '1', '27', '6', null, null, '11');
INSERT INTO `f_info_3` VALUES ('246', '1047', '瑞和春天', '2', '1', '2', '96', '46', '1', '31', '6', null, null, '7');
INSERT INTO `f_info_3` VALUES ('247', '1048', '环城西路', '2', '1', '2', '80', '33', '1', '6', '6', null, null, '7');
INSERT INTO `f_info_3` VALUES ('248', '1049', '来鹤小区', '8', '1', '4', '200', '48', '2', '7', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('249', '1050', '火炬南路五里营', '1', '1', '2', '96', '31', '1', '6', '5', null, null, '3');
INSERT INTO `f_info_3` VALUES ('250', '1051', '济安桥路', '6', '1', '3', '91', '39', '2', '6', '2', null, null, '13');
INSERT INTO `f_info_3` VALUES ('251', '1052', '光河花园', '6', '1', '3', '330', '180', '2', '6', '4', null, null, '6');
INSERT INTO `f_info_3` VALUES ('252', '1053', '洸河东路', '6', '1', '3', '106', '54', '2', '6', '1', null, null, '11');
INSERT INTO `f_info_3` VALUES ('253', '1054', '洸河西路', '8', '1', '4', '100', '46', '2', '6', '1', null, null, '5');
INSERT INTO `f_info_3` VALUES ('254', '1055', '宁建小区', '8', '1', '4', '66', '24', '1', '6', '1', null, null, '9');
INSERT INTO `f_info_3` VALUES ('255', '1056', '红星东路', '4', '1', '2', '87', '43', '2', '6', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('256', '1057', '中区招待所附近', '8', '1', '4', '33', '39', '2', '6', '1', null, null, '12');
INSERT INTO `f_info_3` VALUES ('257', '1058', '红星东路', '4', '1', '3', '88', '42', '1', '6', '3', null, null, '13');
INSERT INTO `f_info_3` VALUES ('258', '1059', '博物管 东50米', '8', '1', '4', '59', '38', '1', '6', '1', null, null, '9');
INSERT INTO `f_info_3` VALUES ('259', '1060', '红星东路', '8', '1', '4', '134', '69', '2', '6', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('260', '1061', '中区', '8', '1', '4', '115', '55', '1', '6', '2', null, null, '1');
INSERT INTO `f_info_3` VALUES ('261', '1062', '兴唐经典', '8', '1', '4', '251', '103', '2', '11', '10', null, null, '8');
INSERT INTO `f_info_3` VALUES ('262', '1063', '冠来星城南门', '8', '1', '4', '78', '118', '2', null, '1', null, null, '5');
INSERT INTO `f_info_3` VALUES ('263', '1064', '中区', '8', '1', '4', '124', '56', '2', '6', '5', null, null, '10');
INSERT INTO `f_info_3` VALUES ('264', '1065', '光河路', '1', '1', '2', '132', '70', '1', '6', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('265', '1066', '东', '6', '1', '3', '70', '33', '2', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('266', '1067', '杨柳国际新城', '6', '1', '3', '218', '42', '2', '7', '6', null, null, '10');
INSERT INTO `f_info_3` VALUES ('267', '1068', '龙行路', '6', '1', '3', '104', '48', '2', '6', '1', null, null, '1');
INSERT INTO `f_info_3` VALUES ('268', '1069', '光明小区', '8', '1', '4', '140', '20', '2', '7', '7', null, null, '11');
INSERT INTO `f_info_3` VALUES ('269', '1070', '舜泰园小区', '4', '1', '3', '134', '57', '2', '29', '9', null, null, '4');
INSERT INTO `f_info_3` VALUES ('270', '1071', '太白东路', '8', '1', '4', '100', '53', '2', '6', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('271', '1072', '开泰花园小区', '6', '1', '3', '90', '25', '2', '7', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('272', '1073', '中医院附近', '4', '1', '3', '130', '38', '1', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('273', '1074', '南张镇政府附近', '3', '1', '2', '100', '10', '1', '6', '2', null, null, '8');
INSERT INTO `f_info_3` VALUES ('274', '1075', '光河路梦园小区', '3', '1', '2', '117', '33', '1', '6', '5', null, null, '12');
INSERT INTO `f_info_3` VALUES ('275', '1076', '洸河西路长安花园对过', '6', '1', '3', '91', '39', '2', '6', '2', null, null, '9');
INSERT INTO `f_info_3` VALUES ('276', '1077', '光河花园6楼62平方精装20万', '8', '1', '4', '155', '65', '2', '5', '4', null, null, '12');
INSERT INTO `f_info_3` VALUES ('277', '1078', '崇文名都', '6', '1', '3', '98', '30', '2', '6', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('278', '1079', '共青团南路', '4', '1', '2', '127', '55', '2', '22', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('279', '1080', '嘉祥西关前进桥西路南', '2', '1', '2', '132', '16', '2', '3', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('280', '1081', '汶上', '5', '1', '3', '600', '300', '1', null, null, null, null, '7');
INSERT INTO `f_info_3` VALUES ('281', '1082', '光河路红星路', '6', '1', '3', '132', '70', '2', '6', '3', null, null, '12');
INSERT INTO `f_info_3` VALUES ('282', '1083', '银都花园', '3', '1', '2', '155', '78', '2', '7', '1', null, null, '13');
INSERT INTO `f_info_3` VALUES ('283', '1084', '水产路', '8', '1', '4', '94', '43', '1', '6', '2', null, null, '10');
INSERT INTO `f_info_3` VALUES ('284', '1085', '红星东路', '4', '1', '3', '102', '50', '1', '6', '5', null, null, '13');
INSERT INTO `f_info_3` VALUES ('285', '1086', '凌云小区', '1', '1', '2', '146', '42', '1', '6', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('286', '1087', '李楼新区107平4层36万07年市免，牛市69平精装20万，', '3', '1', '2', '107', '36', '1', '6', '4', null, null, '11');
INSERT INTO `f_info_3` VALUES ('287', '1088', '祥和花园', '2', '1', '2', '173', '100', '2', '26', '6', null, null, '1');
INSERT INTO `f_info_3` VALUES ('288', '1089', '光和花园166平4层暖精装市免30库12储88万，116平4', '1', '1', '2', '166', '88', '1', '6', '4', null, null, '8');
INSERT INTO `f_info_3` VALUES ('289', '1090', '古槐家园', '8', '1', '4', '138', '53', '2', '26', '9', null, null, '7');
INSERT INTO `f_info_3` VALUES ('290', '1091', '红星东路', '3', '1', '2', '95', '45', '2', '6', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('291', '1092', '刘庄小区东临', '7', '1', '3', '78', '35', '1', '6', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('292', '1093', '绿地附近', '4', '1', '2', '143', '75', '1', '6', '4', null, null, '12');
INSERT INTO `f_info_3` VALUES ('293', '1094', '十五中附近', '6', '1', '3', '88', '38', '2', '6', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('294', '1095', '火车站南路 路西', '8', '1', '4', '90', '38', '2', '6', '3', null, null, '13');
INSERT INTO `f_info_3` VALUES ('295', '1096', '郭家花园', '8', '1', '4', '137', '76', '2', '11', '9', null, null, '2');
INSERT INTO `f_info_3` VALUES ('296', '1097', '春秋路', '8', '1', '4', '110', '22', '2', null, null, null, null, '4');
INSERT INTO `f_info_3` VALUES ('297', '1098', '实验小学紧邻机关单位宿舍', '8', '1', '4', '60', '34', '2', '6', '3', null, null, '4');
INSERT INTO `f_info_3` VALUES ('298', '1099', '红星东路', '8', '1', '4', '94', '36', '2', '6', '1', null, null, '10');
INSERT INTO `f_info_3` VALUES ('299', '1100', '济安桥路', '6', '1', '3', '94', '42', '2', null, '5', null, null, '8');
INSERT INTO `f_info_3` VALUES ('300', '1101', '光河西路', '7', '1', '3', '93', '38', '2', '6', '3', null, null, '5');
INSERT INTO `f_info_3` VALUES ('301', '1102', '开泰花园', '4', '1', '2', '130', '58', '2', '6', '4', null, null, '9');
INSERT INTO `f_info_3` VALUES ('302', '1103', '兴唐附近90平2层暖07年27库市证46万，邮电舍69平5层', '8', '1', '4', '90', '46', '2', '6', '2', null, null, '5');
INSERT INTO `f_info_3` VALUES ('303', '1104', '中央百货北临', '2', '1', '2', '51', '25', '1', '6', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('304', '1105', '开泰花园', '8', '1', '4', '120', '45', '2', '6', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('305', '1106', '开发区', '8', '1', '4', '280', '160', '2', '16', null, null, null, '11');
INSERT INTO `f_info_3` VALUES ('306', '1107', '市中区仙营绿地', '4', '1', '3', '142', '65', '1', '6', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('307', '1108', '水产路', '3', '1', '2', '100', '47', '2', '7', '5', null, null, '11');
INSERT INTO `f_info_3` VALUES ('308', '1109', '崇文小区', '1', '1', '2', '128', '38', '1', '6', '1', null, null, '3');
INSERT INTO `f_info_3` VALUES ('309', '1110', '光河花园西邻,兴唐经典北邻，长安花园沿街门面', '6', '1', '3', '142', '99', '1', '2', '1', null, null, '13');
INSERT INTO `f_info_3` VALUES ('310', '1111', '开泰花园小区', '1', '1', '2', '99', '38', '1', '6', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('311', '1112', '龙行', '4', '1', '2', '65', '27', '1', '6', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('312', '1113', '红星东路', '1', '1', '2', '105', '54', '1', '6', '2', null, null, '11');
INSERT INTO `f_info_3` VALUES ('313', '1114', '金宇路', '4', '1', '3', '123', '33', '1', '6', '5', null, null, '13');
INSERT INTO `f_info_3` VALUES ('314', '1115', '益民东区', '6', '1', '3', '90', '36', '2', '6', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('315', '1116', '实验小学对过小区', '8', '1', '4', '85', '43', '2', '5', '4', null, null, '7');
INSERT INTO `f_info_3` VALUES ('316', '1117', '红星东路', '3', '1', '2', '132', '72', '1', '11', '7', null, null, '13');
INSERT INTO `f_info_3` VALUES ('317', '1118', '红星东路', '8', '1', '4', '134', '70', '2', '6', '4', null, null, '2');
INSERT INTO `f_info_3` VALUES ('318', '1119', '新世纪广场西邻', '4', '1', '3', '138', '96', '1', '23', '13', null, null, '12');
INSERT INTO `f_info_3` VALUES ('319', '1120', '丹桂园小区', '1', '1', '2', '127', '46', '1', '12', '7', null, null, '10');
INSERT INTO `f_info_3` VALUES ('320', '1121', '红星西路', '6', '1', '3', '54', '22', '2', '4', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('321', '1122', '菱花小区', '1', '1', '2', '102', '29', '1', '6', '6', null, null, '6');
INSERT INTO `f_info_3` VALUES ('322', '1123', '怡海园小区', '7', '1', '3', '50', '28', '2', '7', '3', null, null, '8');
INSERT INTO `f_info_3` VALUES ('323', '1124', '梦园小区', '7', '1', '3', '85', '23', '1', '6', '6', null, null, '7');
INSERT INTO `f_info_3` VALUES ('324', '1125', '开泰花园', '7', '1', '3', '126', '46', '2', null, '12', null, null, '9');
INSERT INTO `f_info_3` VALUES ('325', '1126', '菱花小区', '8', '1', '4', '86', '26', '2', '6', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('326', '1127', '东五里营开发区长城工业园内', '8', '1', '4', '65', '11', '2', '5', '3', null, null, '7');
INSERT INTO `f_info_3` VALUES ('327', '1128', '丹桂园', '3', '1', '4', '127', '48', '1', '12', '7', null, null, '12');
INSERT INTO `f_info_3` VALUES ('328', '1129', '杨柳国际新城G区号楼西4单元', '2', '1', '2', '118', '44', '1', '6', '6', null, null, '13');
INSERT INTO `f_info_3` VALUES ('329', '1130', '光河西路', '6', '1', '3', '82', '34', '2', '6', '2', null, null, '13');
INSERT INTO `f_info_3` VALUES ('330', '1131', '明珠花园翠竹园', '7', '1', '4', '130', '80', '1', '6', '4', null, null, '8');
INSERT INTO `f_info_3` VALUES ('331', '1132', '曲阜市曲师大附近', '2', '1', '2', '135', '20', '1', null, null, null, null, '7');
INSERT INTO `f_info_3` VALUES ('332', '1133', '光和校区光和路西段', '1', '1', '2', '85', '42', '1', '6', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('333', '1134', '市中区龙兴路', '4', '1', '2', '72', '32', '2', '11', '7', null, null, '6');
INSERT INTO `f_info_3` VALUES ('334', '1135', '红星小区', '7', '1', '3', '102', '50', '2', '6', '5', null, null, '5');
INSERT INTO `f_info_3` VALUES ('335', '1136', '鸿泰小区', '8', '1', '4', '128', '22', '2', '6', '1', null, null, '6');
INSERT INTO `f_info_3` VALUES ('336', '1137', '八铺西街与王母阁路交汇处', '2', '1', '2', '32', '30', '1', null, '1', null, null, '5');
INSERT INTO `f_info_3` VALUES ('337', '1138', '建设南路电力二处院内', '5', '1', '3', '160', '80', '2', '20', '8', null, null, '5');
INSERT INTO `f_info_3` VALUES ('338', '1139', '核桃园', '1', '1', '2', '107', '56', '2', null, '4', null, null, '10');
INSERT INTO `f_info_3` VALUES ('339', '1140', '光明小区', '5', '1', '3', '140', '20', '1', '7', '7', null, null, '4');
INSERT INTO `f_info_3` VALUES ('340', '1141', '科苑路明珠花园', '8', '1', '4', '138', '65', '2', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('341', '1142', '都市豪庭', '7', '1', '3', '106', '60', '2', '12', '4', null, null, '1');
INSERT INTO `f_info_3` VALUES ('342', '1143', '冠亚星城', '2', '1', '2', '108', '48', '1', '11', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('343', '1144', '中区', '3', '1', '2', '85', '43', '1', '5', '5', null, null, '2');
INSERT INTO `f_info_3` VALUES ('344', '1145', '新苑雅居', '2', '1', '2', '163', '70', '2', '12', '2', null, null, '13');
INSERT INTO `f_info_3` VALUES ('345', '1146', '济安桥路西临', '3', '1', '2', '107', '36', '1', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('346', '1147', '光河花园6楼62平方精装20万', '7', '1', '3', '62', '20', '1', '6', '6', null, null, '10');
INSERT INTO `f_info_3` VALUES ('347', '1148', '崇文名都小区', '7', '1', '3', '98', '26', '2', '6', '2', null, null, '8');
INSERT INTO `f_info_3` VALUES ('348', '1149', '锦华组团143平6层暖市免50万，教育学院110平暖市证50', '8', '1', '4', '143', '50', '2', '6', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('349', '1150', '红星东路', '4', '1', '3', '64', '31', '1', '6', '4', null, null, '8');
INSERT INTO `f_info_3` VALUES ('350', '1151', '城中花园145平1层27库暖精装07年市证58万，光合花园1', '1', '1', '2', '145', '58', '1', '6', '1', null, null, '11');
INSERT INTO `f_info_3` VALUES ('351', '1152', '红星东路', '5', '1', '3', '72', '32', '2', '6', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('352', '1153', '开泰花园', '8', '1', '4', '96', '35', '2', '12', '8', null, null, '6');
INSERT INTO `f_info_3` VALUES ('353', '1154', '光河花园西,兴唐经典北，长安花园', '7', '1', '3', '96', '45', '2', '6', '1', null, null, '9');
INSERT INTO `f_info_3` VALUES ('354', '1155', '冠亚星城', '8', '1', '4', '123', '70', '1', null, '9', null, null, '5');
INSERT INTO `f_info_3` VALUES ('355', '1156', '红星东路', '6', '1', '3', '132', '70', '2', '6', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('356', '1157', '八里庙桥下兰庄居民楼', '5', '1', '3', '93', '15', '1', '7', '6', null, null, '4');
INSERT INTO `f_info_3` VALUES ('357', '1158', '红星东路', '4', '1', '2', '80', '33', '1', '6', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('358', '1159', '阳光花园南 兴东小区东临', '3', '1', '2', '80', '29', '2', '6', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('359', '1160', '洸河路与古槐路交界处', '6', '1', '3', '85', '40', '2', null, null, null, null, '13');
INSERT INTO `f_info_3` VALUES ('360', '1161', '东门', '7', '1', '3', '90', '49', '2', '6', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('361', '1162', '太白路消防队南', '7', '1', '3', '156', '65', '2', '20', '3', null, null, '2');
INSERT INTO `f_info_3` VALUES ('362', '1163', '太白路与火炬路交界处', '3', '1', '2', '153', '58', '1', '18', '11', null, null, '5');
INSERT INTO `f_info_3` VALUES ('363', '1164', '火炬路与太白路交界', '3', '1', '2', '153', '58', '1', '18', '15', null, null, '11');
INSERT INTO `f_info_3` VALUES ('364', '1165', '益民东区100平3层暖市免50万，136平3层暖市免66万，', '8', '1', '4', '100', '50', '1', '6', '3', null, null, '3');
INSERT INTO `f_info_3` VALUES ('365', '1166', '光河西路光河花园', '6', '1', '3', '81', '36', '2', null, null, null, null, '8');
INSERT INTO `f_info_3` VALUES ('366', '1167', '核桃园路', '4', '1', '2', '41', '52', '1', null, null, null, null, '3');
INSERT INTO `f_info_3` VALUES ('367', '1168', '中区', '8', '1', '4', '158', '80', '2', '12', '4', null, null, '9');
INSERT INTO `f_info_3` VALUES ('368', '1169', '中区', '8', '1', '4', '105', '45', '2', '6', '1', null, null, '3');
INSERT INTO `f_info_3` VALUES ('369', '1170', '古槐家园', '8', '1', '4', '151', '68', '1', '12', '9', null, null, '5');
INSERT INTO `f_info_3` VALUES ('370', '1171', '香港大厦东临', '8', '1', '4', '173', '104', '1', null, '7', null, null, '6');
INSERT INTO `f_info_3` VALUES ('371', '1172', '红星东路', '1', '1', '2', '101', '47', '1', '12', '7', null, null, '3');
INSERT INTO `f_info_3` VALUES ('372', '1173', '太白西路龙城美墅', '1', '1', '2', '138', '73', '1', '17', '7', null, null, '5');
INSERT INTO `f_info_3` VALUES ('373', '1174', '杨柳国际新城B区', '2', '1', '2', '97', '35', '1', '6', '6', null, null, '8');
INSERT INTO `f_info_3` VALUES ('374', '1175', '光河西路', '4', '1', '3', '130', '44', '2', '12', '4', null, null, '7');
INSERT INTO `f_info_3` VALUES ('375', '1176', '化', '8', '1', '4', '54', '22', '2', '4', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('376', '1177', '凯赛大桥西', '8', '1', '4', '141', '65', '2', '12', '7', null, null, '13');
INSERT INTO `f_info_3` VALUES ('377', '1178', '崇文名都南区小高层', '4', '1', '3', '108', '26', '1', '11', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('378', '1179', '红星东路', '6', '1', '3', '140', '66', '2', '11', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('379', '1180', '红星东路森泰御城', '2', '1', '2', '72', '32', '1', '6', '4', null, null, '1');
INSERT INTO `f_info_3` VALUES ('380', '1181', '仙营绿地东邻邮电新苑小区', '8', '1', '4', '84', '46', '2', '6', '2', null, null, '9');
INSERT INTO `f_info_3` VALUES ('381', '1182', '光和花园176平1层精装暖25库79万市免，瞬泰园130平2', '5', '1', '3', '176', '79', '1', '6', '1', null, null, '6');
INSERT INTO `f_info_3` VALUES ('382', '1183', '关帝庙街2号', '8', '1', '4', '60', '28', '2', '5', '5', null, null, '8');
INSERT INTO `f_info_3` VALUES ('383', '1184', '光河花园西,兴唐经典北，长安花园沿街门面', '8', '1', '4', '142', '99', '2', '2', '1', null, null, '2');
INSERT INTO `f_info_3` VALUES ('384', '1185', '光和东路崇文名都', '8', '1', '4', '130', '35', '2', '6', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('385', '1186', '王母阁附近', '4', '1', '2', '80', '23', '1', null, '3', null, null, '5');
INSERT INTO `f_info_3` VALUES ('386', '1187', '杨柳国际新城', '1', '1', '2', '101', '32', '1', '6', '6', null, null, '13');
INSERT INTO `f_info_3` VALUES ('387', '1188', '龙行路', '5', '1', '3', '64', '28', '1', '26', '7', null, null, '4');
INSERT INTO `f_info_3` VALUES ('388', '1189', '红星东路', '5', '1', '3', '94', '47', '1', '6', '4', null, null, '10');
INSERT INTO `f_info_3` VALUES ('389', '1190', '龙行路', '2', '1', '2', '143', '66', '1', '27', '11', null, null, '1');
INSERT INTO `f_info_3` VALUES ('390', '1191', '龙行路', '4', '1', '2', '64', '28', '1', '26', '7', null, null, '2');
INSERT INTO `f_info_3` VALUES ('391', '1192', '古槐北路新老327路之间', '6', '1', '3', '116', '15', '1', null, null, null, null, '7');
INSERT INTO `f_info_3` VALUES ('392', '1193', '舜泰园', '4', '1', '3', '135', '59', '2', '28', '27', null, null, '1');
INSERT INTO `f_info_3` VALUES ('393', '1194', '红星东路', '7', '1', '3', '80', '30', '2', '6', '6', null, null, '8');
INSERT INTO `f_info_3` VALUES ('394', '1195', '新世纪花园', '8', '1', '4', '155', '93', '2', '7', '1', null, null, '13');
INSERT INTO `f_info_3` VALUES ('395', '1196', '红星东路', '2', '1', '2', '80', '30', '1', '6', '6', null, null, '6');
INSERT INTO `f_info_3` VALUES ('396', '1197', '西红庙', '7', '1', '3', '103', '36', '1', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('397', '1198', '市', '8', '1', '4', '75', '35', '1', '6', '3', null, null, '2');
INSERT INTO `f_info_3` VALUES ('398', '1199', '光河路梦园小区', '1', '1', '2', '118', '35', '1', '6', '5', null, null, '12');
INSERT INTO `f_info_3` VALUES ('399', '1200', '建设南路', '4', '1', '2', '60', '28', '2', '12', '3', null, null, '4');
INSERT INTO `f_info_3` VALUES ('400', '1201', '红星东路', '3', '1', '2', '138', '76', '2', '12', '7', null, null, '12');
INSERT INTO `f_info_3` VALUES ('401', '1202', '光明小区', '3', '1', '2', '140', '20', '1', null, '7', null, null, '9');
INSERT INTO `f_info_3` VALUES ('402', '1203', '杨柳国际新城H区', '8', '1', '4', '170', '36', '2', null, '6', null, null, '1');
INSERT INTO `f_info_3` VALUES ('403', '1204', '济安桥路', '3', '1', '2', '84', '33', '1', '6', '6', null, null, '6');
INSERT INTO `f_info_3` VALUES ('404', '1205', '开发区', '8', '1', '4', '140', '36', '1', '7', '6', null, null, '4');
INSERT INTO `f_info_3` VALUES ('405', '1206', '仙营绿地西临', '7', '1', '3', '142', '73', '2', '6', '4', null, null, '6');
INSERT INTO `f_info_3` VALUES ('406', '1207', '益民东区76平3层市证31万03年，李楼新区104平4层市免', '1', '1', '2', '76', '31', '1', '6', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('407', '1208', '吉祥105平4层精装市免三阳45万，洪顺85平6层市免34万', '5', '1', '3', '105', '45', '1', '6', '4', null, null, '2');
INSERT INTO `f_info_3` VALUES ('408', '1209', '置城中央公园', '3', '1', '2', '115', '70', '1', '23', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('409', '1210', '凤凰城运西家园', '8', '1', '4', '92', '28', '2', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('410', '1211', '齐鑫花园', '3', '1', '2', '125', '53', '1', null, '3', null, null, '13');
INSERT INTO `f_info_3` VALUES ('411', '1212', '博', '7', '1', '3', '70', '34', '2', null, '2', null, null, '13');
INSERT INTO `f_info_3` VALUES ('412', '1213', '瑞和春天小区', '1', '1', '2', '96', '48', '1', '29', '6', null, null, '4');
INSERT INTO `f_info_3` VALUES ('413', '1214', '吉祥105平4层精装市免三阳45万，洪顺85平6层市免34万', '3', '1', '2', '105', '45', '1', '6', '4', null, null, '9');
INSERT INTO `f_info_3` VALUES ('414', '1215', '开泰花园', '4', '1', '3', '107', '27', '1', '5', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('415', '1216', '兴唐经典南邻90平2层27平库暖市免46万06年新原房，光和', '7', '1', '3', '90', '46', '2', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('416', '1217', '红星东路', '6', '1', '3', '105', '51', '1', '6', '2', null, null, '11');
INSERT INTO `f_info_3` VALUES ('417', '1218', '琵琶山小区', '2', '1', '2', '120', '51', '1', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('418', '1219', '郭家花园125平5层暖精装55万市免，兴东新区78平暖6层2', '1', '1', '2', '125', '55', '1', '6', '5', null, null, '7');
INSERT INTO `f_info_3` VALUES ('419', '1220', '红星东路', '1', '1', '2', '80', '30', '1', '6', '6', null, null, '10');
INSERT INTO `f_info_3` VALUES ('420', '1221', '崇文大道，崇文名都小区', '4', '1', '2', '97', '21', '1', '6', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('421', '1222', '南苑社区', '3', '1', '2', '110', '25', '2', '6', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('422', '1223', '益民东区77平1层2000年市证31万，古槐商务楼65平4层', '8', '1', '4', '77', '31', '2', '6', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('423', '1224', '谢营小区（济宁大学对过）', '2', '1', '2', '116', '44', '1', '6', '1', null, null, '5');
INSERT INTO `f_info_3` VALUES ('424', '1225', '国翠城东临', '2', '1', '2', '67', '30', '1', '6', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('425', '1226', '环城西路', '6', '1', '3', '133', '55', '2', '17', '5', null, null, '6');
INSERT INTO `f_info_3` VALUES ('426', '1227', '长虹小区', '8', '1', '4', '94', '35', '1', '6', '1', null, null, '6');
INSERT INTO `f_info_3` VALUES ('427', '1228', '光河花园西,兴唐经典北，长安花园沿街门面', '3', '1', '2', '67', '53', '1', '2', '1', null, null, '7');
INSERT INTO `f_info_3` VALUES ('428', '1229', '洸河路西首', '5', '1', '3', '152', '65', '1', '6', '4', null, null, '6');
INSERT INTO `f_info_3` VALUES ('429', '1230', '运', '6', '1', '3', '76', '33', '2', '6', '1', null, null, '1');
INSERT INTO `f_info_3` VALUES ('430', '1231', '科苑路明珠花园东云轩', '2', '1', '2', '133', '65', '1', '6', '4', null, null, '7');
INSERT INTO `f_info_3` VALUES ('431', '1232', '洸河路', '1', '1', '2', '176', '88', '1', '6', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('432', '1233', '圣德滨湖花园', '1', '1', '2', '146', '60', '1', '6', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('433', '1234', '益民东区77平1层2000年市证33万，古槐商务楼65平4层', '2', '1', '2', '77', '33', '2', '6', '1', null, null, '5');
INSERT INTO `f_info_3` VALUES ('434', '1235', '火炬路金矿附近', '8', '1', '4', '103', '22', '2', '6', '2', null, null, '7');
INSERT INTO `f_info_3` VALUES ('435', '1236', '开发区', '6', '1', '3', '140', '36', '2', '7', '6', null, null, '1');
INSERT INTO `f_info_3` VALUES ('436', '1237', '车站路', '6', '1', '3', '138', '52', '2', null, '9', null, null, '2');
INSERT INTO `f_info_3` VALUES ('437', '1238', '红星东路', '1', '1', '2', '80', '33', '1', '6', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('438', '1239', '杨柳国际新城B区', '7', '1', '3', '94', '40', '2', '6', '6', null, null, '10');
INSERT INTO `f_info_3` VALUES ('439', '1240', '光和路', '8', '1', '4', '163', '70', '2', '12', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('440', '1241', '济宁市红星东路', '6', '1', '3', '140', '66', '1', '11', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('441', '1242', '圣德滨湖花园小区电梯公寓', '2', '1', '2', '146', '58', '1', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('442', '1243', '梦圆小区', '7', '1', '3', '80', '25', '2', '6', '5', null, null, '5');
INSERT INTO `f_info_3` VALUES ('443', '1244', '光河西路', '8', '1', '4', '96', '36', '2', null, '3', null, null, '3');
INSERT INTO `f_info_3` VALUES ('444', '1245', '益东', '5', '1', '3', '76', '32', '1', '6', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('445', '1246', '杨柳国际新城', '4', '1', '3', '220', '63', '1', '6', '5', null, null, '4');
INSERT INTO `f_info_3` VALUES ('446', '1247', '中泰丰源', '8', '1', '4', '136', '1', '2', '12', '1', null, null, '10');
INSERT INTO `f_info_3` VALUES ('447', '1248', '位于老年脑血管病医院向北500米路西新327国道与金宇路之间', '3', '1', '2', '116', '37', '1', '11', null, null, null, '1');
INSERT INTO `f_info_3` VALUES ('448', '1249', '明珠小区祥和园', '1', '1', '2', '81', '33', '2', '6', '6', null, null, '11');
INSERT INTO `f_info_3` VALUES ('449', '1250', '龙行路', '1', '1', '2', '74', '35', '1', '6', '6', null, null, '10');
INSERT INTO `f_info_3` VALUES ('450', '1251', '长虹小区', '6', '1', '3', '120', '47', '2', '6', '5', null, null, '12');
INSERT INTO `f_info_3` VALUES ('451', '1252', '洸和花园', '8', '1', '4', '140', '80', '2', '6', '5', null, null, '7');
INSERT INTO `f_info_3` VALUES ('452', '1253', '龙行小区', '8', '1', '4', '49', '18', '2', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('453', '1254', '济邹路圣景小区', '1', '1', '2', '110', '47', '1', null, '2', null, null, '8');
INSERT INTO `f_info_3` VALUES ('454', '1255', '银都花园', '5', '1', '3', '98', '43', '1', null, '4', null, null, '4');
INSERT INTO `f_info_3` VALUES ('455', '1256', '金宇路', '8', '1', '4', '120', '43', '2', '6', '5', null, null, '8');
INSERT INTO `f_info_3` VALUES ('456', '1257', '冠亚星城东邻', '4', '1', '3', '146', '42', '1', '6', '3', null, null, '8');
INSERT INTO `f_info_3` VALUES ('457', '1258', '太白西路鲁抗宿舍北大门向南100米鲁抗家政', '2', '1', '2', '76', '28', '1', '5', '5', null, null, '9');
INSERT INTO `f_info_3` VALUES ('458', '1259', '阳光花园', '8', '1', '4', '81', '31', '1', '6', '2', null, null, '11');
INSERT INTO `f_info_3` VALUES ('459', '1260', '光河花园西,兴唐经典北，长安花园沿街门面', '8', '1', '4', '142', '85', '2', '2', '1', null, null, '12');
INSERT INTO `f_info_3` VALUES ('460', '1261', '火炬南路', '4', '1', '3', '98', '28', '2', '6', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('461', '1262', '都市花园172平1层35库暖83万，另124平1层暖市证56', '6', '1', '3', '172', '83', '2', '6', '1', null, null, '5');
INSERT INTO `f_info_3` VALUES ('462', '1263', '开泰花园', '8', '1', '4', '127', '46', '2', '17', '1', null, null, '13');
INSERT INTO `f_info_3` VALUES ('463', '1264', '菱花小区', '4', '1', '2', '102', '26', '1', '6', '6', null, null, '8');
INSERT INTO `f_info_3` VALUES ('464', '1265', '凌云小区靠近吴泰闸路', '8', '1', '4', '104', '36', '2', '5', '4', null, null, '12');
INSERT INTO `f_info_3` VALUES ('465', '1266', '红星东路', '3', '1', '2', '72', '31', '1', '5', '5', null, null, '6');
INSERT INTO `f_info_3` VALUES ('466', '1267', '解放路附近', '2', '1', '2', '102', '48', '1', '25', '6', null, null, '11');
INSERT INTO `f_info_3` VALUES ('467', '1268', '铁塔寺小区（，霍小学区）', '2', '1', '2', '90', '49', '2', '7', '7', null, null, '2');
INSERT INTO `f_info_3` VALUES ('468', '1269', '铁塔寺小区', '2', '1', '2', '70', '40', '1', '6', '2', null, null, '10');
INSERT INTO `f_info_3` VALUES ('469', '1270', '太白东路36号', '8', '1', '4', '98', '35', '2', '6', '5', null, null, '5');
INSERT INTO `f_info_3` VALUES ('470', '1271', '舜泰园小区', '7', '1', '3', '115', '46', '2', '29', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('471', '1272', '来鹤小区', '8', '1', '4', '80', '41', '2', '5', '1', null, null, '9');
INSERT INTO `f_info_3` VALUES ('472', '1273', '明珠小区', '6', '1', '3', '139', '49', '1', '6', '5', null, null, '4');
INSERT INTO `f_info_3` VALUES ('473', '1274', '梦圆南区67平3层市免27万，90平3层合同房25万，120', '5', '1', '3', '67', '27', '1', '6', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('474', '1275', '五里营济邹路口向北100米路东', '4', '1', '3', '85', '17', '1', '6', '5', null, null, '9');
INSERT INTO `f_info_3` VALUES ('475', '1276', '郭家花园95平5层暖精装38万市证，兴东新区78平暖6层29', '4', '1', '3', '95', '38', '2', '6', '5', null, null, '10');
INSERT INTO `f_info_3` VALUES ('476', '1277', '附院附近102平2层暖市证46万，霍小126平4层精装市免5', '6', '1', '3', '102', '46', '1', '6', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('477', '1278', '东门', '3', '1', '2', '91', '49', '1', '6', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('478', '1279', '菱花小区', '4', '1', '2', '123', '37', '1', '6', '1', null, null, '3');
INSERT INTO `f_info_3` VALUES ('479', '1280', '金茂康桥华居', '8', '1', '4', '105', '45', '1', '6', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('480', '1281', '红星路', '7', '1', '4', '97', '50', '2', '6', '2', null, null, '9');
INSERT INTO `f_info_3` VALUES ('481', '1282', '中区', '7', '1', '4', '78', '30', '2', '6', '6', null, null, '7');
INSERT INTO `f_info_3` VALUES ('482', '1283', '洸河西路', '8', '1', '4', '130', '56', '2', '6', '1', null, null, '3');
INSERT INTO `f_info_3` VALUES ('483', '1284', '江南美食城300平1-3层1000元每平，杨柳总6层电梯3层', '7', '1', '3', '104', '37', '2', '6', '3', null, null, '10');
INSERT INTO `f_info_3` VALUES ('484', '1285', '光和花园166平4层精装暖43库88万，另93平1层42.5', '2', '1', '2', '166', '88', '1', '6', '4', null, null, '6');
INSERT INTO `f_info_3` VALUES ('485', '1286', '开泰花园', '2', '1', '2', '96', '36', '1', null, '3', null, null, '12');
INSERT INTO `f_info_3` VALUES ('486', '1287', '五里营济州路口向北100米路东', '7', '1', '3', '85', '18', '2', '6', '5', null, null, '2');
INSERT INTO `f_info_3` VALUES ('487', '1288', '济安桥路西', '6', '1', '3', '60', '16', '2', '6', '6', null, null, '3');
INSERT INTO `f_info_3` VALUES ('488', '1289', '龙行路1号', '1', '1', '2', '136', '60', '1', '4', '4', null, null, '10');
INSERT INTO `f_info_3` VALUES ('489', '1290', '舜泰园', '2', '1', '2', '136', '65', '1', '28', '24', null, null, '4');
INSERT INTO `f_info_3` VALUES ('490', '1291', '都市豪情', '8', '1', '4', '153', '81', '2', null, '1', null, null, '1');
INSERT INTO `f_info_3` VALUES ('491', '1292', '科苑路与洸河路明珠花园东云轩', '5', '1', '3', '150', '63', '1', '6', '4', null, null, '10');
INSERT INTO `f_info_3` VALUES ('492', '1293', '益民东区2号楼东2单元6楼西室', '8', '1', '4', '150', '60', '1', '6', '6', null, null, '3');
INSERT INTO `f_info_3` VALUES ('493', '1294', '梦圆南区90平3层25万，另120平5层35万，另89平2层', '6', '1', '3', '90', '25', '1', '6', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('494', '1295', '红星东路', '8', '1', '4', '72', '32', '1', '6', '5', null, null, '5');
INSERT INTO `f_info_3` VALUES ('495', '1296', '红星东路', '1', '1', '2', '137', '59', '1', '6', '4', null, null, '4');
INSERT INTO `f_info_3` VALUES ('496', '1297', '建设路', '6', '1', '3', '77', '31', '2', '6', '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('497', '1298', '五里营济邹路口向北100米路东', '3', '1', '2', '85', '17', '1', '6', '5', null, null, '12');
INSERT INTO `f_info_3` VALUES ('498', '1299', '杨柳国际新城老327北', '8', '1', '4', '147', '52', '1', '24', '9', null, null, '1');
INSERT INTO `f_info_3` VALUES ('499', '1300', '光河花园西,兴唐经典北，长安花园沿街门面', '8', '1', '4', '142', '85', '2', '2', '1', null, null, '7');
INSERT INTO `f_info_3` VALUES ('500', '1301', '杨柳国际', '5', '1', '3', '110', '40', '1', null, null, null, null, '5');
INSERT INTO `f_info_3` VALUES ('501', '1302', '益民东区73平4层暖市证30万，置成68平23层市证商务39', '8', '1', '4', '73', '30', '2', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('502', '1303', '运河盛世', '4', '1', '2', '81', '41', '2', null, '16', null, null, '7');
INSERT INTO `f_info_3` VALUES ('503', '1304', '龙行', '8', '1', '4', '39', '17', '2', '6', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('504', '1305', '明珠', '7', '1', '3', '92', '50', '2', '6', '2', null, null, '11');
INSERT INTO `f_info_3` VALUES ('505', '1306', '长虹小区', '6', '1', '3', '88', '32', '2', null, '1', null, null, '2');
INSERT INTO `f_info_3` VALUES ('506', '1307', '郭家花园95平5层暖精装42万市免，水岸盛世137平17层该', '2', '1', '2', '95', '42', '1', '6', '5', null, null, '12');
INSERT INTO `f_info_3` VALUES ('507', '1308', '杨柳国际新城', '2', '1', '2', '86', '26', '1', null, null, null, null, '10');
INSERT INTO `f_info_3` VALUES ('508', '1309', '银都', '4', '1', '2', '115', '55', '1', '6', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('509', '1310', '九九花园', '8', '1', '4', '143', '66', '1', '6', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('510', '1311', '明珠', '8', '1', '4', '92', '50', '2', '6', '2', null, null, '7');
INSERT INTO `f_info_3` VALUES ('511', '1312', '曲阜市 香格里拉对面 国贸小高层', '8', '1', '4', '171', '68', '2', '12', '4', null, null, '7');
INSERT INTO `f_info_3` VALUES ('512', '1313', '新体育馆东', '8', '1', '4', '90', '40', '2', '6', '6', null, null, '6');
INSERT INTO `f_info_3` VALUES ('513', '1314', '红星路', '7', '1', '3', '137', '43', '1', '6', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('514', '1315', '崇文名都南区小高层', '2', '1', '2', '108', '26', '1', '11', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('515', '1316', '十五中南邻', '8', '1', '4', '97', '40', '2', '6', '5', null, null, '4');
INSERT INTO `f_info_3` VALUES ('516', '1317', '红星东路森泰御城5号楼', '3', '1', '2', '140', '66', '1', '11', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('517', '1318', '菱花小区', '5', '1', '3', '102', '26', '1', '6', '6', null, null, '8');
INSERT INTO `f_info_3` VALUES ('518', '1319', '东发小区', '2', '1', '2', '120', '27', '1', '6', '4', null, null, '12');
INSERT INTO `f_info_3` VALUES ('519', '1320', '凌云小区', '6', '1', '3', '99', '30', '2', '6', '1', null, null, '3');
INSERT INTO `f_info_3` VALUES ('520', '1321', '15中南', '4', '1', '3', '85', '38', '1', '6', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('521', '1322', '益民东区73平4层暖03年市证30万，置成68平24层市证商', '5', '1', '3', '73', '30', '2', '6', '4', null, null, '4');
INSERT INTO `f_info_3` VALUES ('522', '1323', '中区', '3', '1', '2', '101', '47', '2', '12', '7', null, null, '2');
INSERT INTO `f_info_3` VALUES ('523', '1324', '南苑社区', '8', '1', '4', '88', '30', '1', '6', '3', null, null, '12');
INSERT INTO `f_info_3` VALUES ('524', '1325', '金乡灯塔附近', '8', '1', '4', '75', '16', '2', '5', '5', null, null, '12');
INSERT INTO `f_info_3` VALUES ('525', '1326', '杨柳国际新城', '4', '1', '3', '91', '22', '1', '6', '6', null, null, '1');
INSERT INTO `f_info_3` VALUES ('526', '1327', '金西新苑红星西路', '4', '1', '2', '124', '45', '1', '12', '5', null, null, '8');
INSERT INTO `f_info_3` VALUES ('527', '1328', '凌云小区', '8', '1', '4', '73', '26', '1', '5', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('528', '1329', '明珠小区', '4', '1', '3', '87', '33', '1', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('529', '1330', '微山县文化路中段', '6', '1', '3', '70', '25', '2', '4', '2', null, null, '10');
INSERT INTO `f_info_3` VALUES ('530', '1331', '杨柳国际新城B区', '8', '1', '4', '220', '63', '2', null, null, null, null, '2');
INSERT INTO `f_info_3` VALUES ('531', '1332', '太白东路于火炬路交界处', '7', '1', '4', '152', '57', '1', '17', '11', null, null, '3');
INSERT INTO `f_info_3` VALUES ('532', '1333', '洸河路', '8', '1', '4', '106', '45', '1', '6', '5', null, null, '10');
INSERT INTO `f_info_3` VALUES ('533', '1334', '金宇路', '2', '1', '2', '146', '62', '2', '7', '2', null, null, '10');
INSERT INTO `f_info_3` VALUES ('534', '1335', '龙兴路路北', '4', '1', '3', '85', '38', '1', '6', '3', null, null, '3');
INSERT INTO `f_info_3` VALUES ('535', '1336', '二十里铺政府驻地', '3', '1', '2', '95', '11', '1', '6', '5', null, null, '8');
INSERT INTO `f_info_3` VALUES ('536', '1337', '益民东区120平4层暖精装市证南大门50万，铁塔市北临100', '5', '1', '3', '120', '50', '1', '6', '4', null, null, '4');
INSERT INTO `f_info_3` VALUES ('537', '1338', '洸河路', '2', '1', '2', '126', '450000', '2', '17', '1', null, null, '11');
INSERT INTO `f_info_3` VALUES ('538', '1339', '建设路北首', '5', '1', '3', '142', '45', '1', '6', '3', null, null, '12');
INSERT INTO `f_info_3` VALUES ('539', '1340', '制镜厂附近', '8', '1', '4', '70', '40', '2', '6', '2', null, null, '2');
INSERT INTO `f_info_3` VALUES ('540', '1341', '建设路北首', '4', '1', '3', '142', '45', '1', '6', '3', null, null, '8');
INSERT INTO `f_info_3` VALUES ('541', '1342', '制镜厂片区', '1', '1', '2', '53', '25', '2', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('542', '1343', '置城国际', '5', '1', '3', '138', '86', '2', null, '13', null, null, '9');
INSERT INTO `f_info_3` VALUES ('543', '1344', '长安120平5层暖开口上房已交该合同42万，另6层105+6', '7', '1', '2', '120', '42', '2', '6', '5', null, null, '11');
INSERT INTO `f_info_3` VALUES ('544', '1345', '铁塔寺片区', '4', '1', '2', '63', '25', '1', null, null, null, null, '1');
INSERT INTO `f_info_3` VALUES ('545', '1346', '益民东区73平4层市证32万，置成68平23层市证商务39万', '5', '1', '3', '73', '32', '1', '6', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('546', '1347', '苗营小学附近', '8', '1', '4', '81', '26', '2', '6', '1', null, null, '5');
INSERT INTO `f_info_3` VALUES ('547', '1348', '五里营济邹路口向北100米路东', '8', '1', '4', '85', '17', '2', '6', '5', null, null, '4');
INSERT INTO `f_info_3` VALUES ('548', '1349', '水产路储运站宿舍', '6', '1', '3', '95', '26', '1', '5', '5', null, null, '4');
INSERT INTO `f_info_3` VALUES ('549', '1350', '红星路8号', '7', '1', '3', '152', '103', '2', '17', null, null, null, '9');
INSERT INTO `f_info_3` VALUES ('550', '1351', '济安桥路电厂南郭庄', '8', '1', '4', '102', '26', '2', '6', '1', null, null, '7');
INSERT INTO `f_info_3` VALUES ('551', '1352', '明珠', '5', '1', '3', '50', '22', '1', '6', '4', null, null, '8');
INSERT INTO `f_info_3` VALUES ('552', '1353', '来鹤北区123平5层非顶精03年市免43万，长安105平1层', '2', '1', '2', '105', '38', '1', '6', '1', null, null, '7');
INSERT INTO `f_info_3` VALUES ('553', '1354', '泗水十三中附近', '6', '1', '3', '150', '25', '2', null, null, null, null, '9');
INSERT INTO `f_info_3` VALUES ('554', '1355', '太白路', '5', '1', '3', '160', '109', '1', '11', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('555', '1356', '光河花园西,兴唐经典北，长安花园沿街门面', '7', '1', '4', '142', '85', '2', '2', '1', null, null, '6');
INSERT INTO `f_info_3` VALUES ('556', '1357', '中区', '6', '1', '3', '90', '23', '2', '6', '4', null, null, '7');
INSERT INTO `f_info_3` VALUES ('557', '1358', '光河路西段', '3', '1', '2', '74', '23', '2', '5', '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('558', '1359', '赛马特南邻，明珠小学对过！', '8', '1', '4', '50', '22', '2', '6', '4', null, null, '9');
INSERT INTO `f_info_3` VALUES ('559', '1360', '光河路', '4', '1', '3', '110', '46', '1', '12', '8', null, null, '11');
INSERT INTO `f_info_3` VALUES ('560', '1361', '崇文名都', '3', '1', '2', '131', '40', '2', '6', '4', null, null, '6');
INSERT INTO `f_info_3` VALUES ('561', '1362', '常青路', '6', '1', '3', '108', '57', '2', '12', '6', null, null, '13');
INSERT INTO `f_info_3` VALUES ('562', '1363', '世纪广场附近', '1', '1', '2', '135', '60', '1', '28', '18', null, null, '1');
INSERT INTO `f_info_3` VALUES ('563', '1364', '杨柳国际新城B区16号1单元', '7', '1', '4', '97', '38', '2', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('564', '1365', '崇文名都', '3', '1', '2', '112', '32', '1', '11', '5', null, null, '1');
INSERT INTO `f_info_3` VALUES ('565', '1366', '杨柳国际新城B区16号楼', '8', '1', '4', '144', '38', '2', null, null, null, null, '6');
INSERT INTO `f_info_3` VALUES ('566', '1367', '崇文名都', '4', '1', '2', '108', '28', '1', '11', '8', null, null, '11');
INSERT INTO `f_info_3` VALUES ('567', '1368', '吉祥小区', '7', '1', '3', '96', '35', '2', null, '2', null, null, '3');
INSERT INTO `f_info_3` VALUES ('568', '1369', '光和花园93平1层精装全朝阳41万市免。另93平1层三室二厅', '1', '1', '2', '93', '41', '1', '6', '1', null, null, '7');
INSERT INTO `f_info_3` VALUES ('569', '1370', '东发小区', '4', '1', '2', '89', '26', '1', null, null, null, null, '11');
INSERT INTO `f_info_3` VALUES ('570', '1371', '世纪联华附近', '4', '1', '3', '100', '50', '1', '6', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('571', '1372', '洸河路', '3', '1', '2', '96', '40', '2', '6', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('572', '1373', '锦华组团', '4', '1', '2', '131', '66', '2', '6', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('573', '1374', '光河西路', '1', '1', '2', '80', '32', '1', '6', '6', null, null, '6');
INSERT INTO `f_info_3` VALUES ('574', '1375', '洸河路南共青团路西', '2', '1', '2', '190', '80', '2', '17', '7', null, null, '9');
INSERT INTO `f_info_3` VALUES ('575', '1376', '崇文名都', '5', '1', '3', '128', '40', '1', '6', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('576', '1377', '兴唐经典120平市证4层55万，实小142平5层暖60万', '1', '1', '2', '120', '55', '2', '6', '4', null, null, '7');
INSERT INTO `f_info_3` VALUES ('577', '1378', '圆梦信息中心--圆你买房梦。西城实小76平3层市证25万，光', '1', '1', '2', '76', '25', '1', '6', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('578', '1379', '香港大厦对过', '7', '1', '3', '133', '70', '2', '17', '8', null, null, '4');
INSERT INTO `f_info_3` VALUES ('579', '1380', '明珠', '1', '1', '2', '92', '53', '1', '6', '2', null, null, '8');
INSERT INTO `f_info_3` VALUES ('580', '1381', '火车站附近', '6', '1', '3', '54', '19', '2', '6', '2', null, null, '1');
INSERT INTO `f_info_3` VALUES ('581', '1382', '红星东路', '7', '1', '3', '140', '66', '2', '11', '3', null, null, '2');
INSERT INTO `f_info_3` VALUES ('582', '1383', '琵琶山银座', '8', '1', '4', '144', '75', '2', null, '1', null, null, '1');
INSERT INTO `f_info_3` VALUES ('583', '1384', '火炬路', '3', '1', '2', '108', '17', '2', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('584', '1385', '环境优美，交通便利', '7', '1', '3', '130', '36', '2', '6', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('585', '1386', '琵琶山路北首', '8', '1', '4', '120', '47', '1', '20', '7', null, null, '5');
INSERT INTO `f_info_3` VALUES ('586', '1387', '梦圆南区', '2', '1', '2', '88', '25', '2', '6', '5', null, null, '1');
INSERT INTO `f_info_3` VALUES ('587', '1388', '舜泰园小区', '8', '1', '4', '146', '70', '1', '29', '28', null, null, '5');
INSERT INTO `f_info_3` VALUES ('588', '1389', '宁苑花园', '5', '1', '3', '94', '35', '1', '6', '3', null, null, '13');
INSERT INTO `f_info_3` VALUES ('589', '1390', '光河花园西,兴唐经典北，长安花园沿街门面', '3', '1', '2', '67', '46', '1', '2', '1', null, null, '3');
INSERT INTO `f_info_3` VALUES ('590', '1391', '银都', '1', '1', '2', '71', '31', '1', '6', '5', null, null, '9');
INSERT INTO `f_info_3` VALUES ('591', '1392', '明珠花园', '8', '1', '4', '92', '53', '2', '6', '2', null, null, '9');
INSERT INTO `f_info_3` VALUES ('592', '1393', '环境佳，位置优', '7', '1', '3', '112', '35', '2', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('593', '1394', '光河路', '2', '1', '2', '93', '53', '1', '6', '2', null, null, '7');
INSERT INTO `f_info_3` VALUES ('594', '1395', '文化小区', '3', '1', '2', '81', '28', '1', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('595', '1396', '嘉祥呈祥小区', '4', '1', '3', '89', '19', '1', '6', '1', null, null, '12');
INSERT INTO `f_info_3` VALUES ('596', '1397', '水岸盛世', '5', '1', '3', '81', '40', '2', '28', '17', null, null, '3');
INSERT INTO `f_info_3` VALUES ('597', '1398', '南刘庄小区', '2', '1', '2', '94', '25', '1', '6', '2', null, null, '8');
INSERT INTO `f_info_3` VALUES ('598', '1399', '济安桥路与新327交汇处', '4', '1', '3', '90', '16', '1', '7', '6', null, null, '4');
INSERT INTO `f_info_3` VALUES ('599', '1400', '苗营向北济北新区', '4', '1', '2', '138', '36', '1', '7', '3', null, null, '2');
INSERT INTO `f_info_3` VALUES ('600', '1401', '济安桥路与新327交汇处', '1', '1', '2', '110', '14', '1', '7', '6', null, null, '9');
INSERT INTO `f_info_3` VALUES ('601', '1402', '光河花园西,兴唐经典北，长安花园小区', '3', '1', '2', '96', '45', '1', '6', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('602', '1403', '苏果超市北临', '4', '1', '2', '81', '40', '2', '18', '17', null, null, '9');
INSERT INTO `f_info_3` VALUES ('603', '1404', '新世纪西临', '8', '1', '4', '138', '86', '2', '24', '13', null, null, '13');
INSERT INTO `f_info_3` VALUES ('604', '1405', '益民西区', '8', '1', '4', '159', '72', '2', '6', '1', null, null, '7');
INSERT INTO `f_info_3` VALUES ('605', '1406', '崇文名都', '4', '1', '3', '108', '27', '1', '11', '8', null, null, '12');
INSERT INTO `f_info_3` VALUES ('606', '1407', '北门小区', '3', '1', '2', '84', '38', '2', '6', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('607', '1408', '置城国际', '7', '1', '3', '138', '90', '2', null, '13', null, null, '6');
INSERT INTO `f_info_3` VALUES ('608', '1409', '阳光润泽园', '5', '1', '3', '130', '60', '1', '11', '4', null, null, '12');
INSERT INTO `f_info_3` VALUES ('609', '1410', '红星东路', '8', '1', '4', '153', '66', '2', null, '10', null, null, '5');
INSERT INTO `f_info_3` VALUES ('610', '1411', '来鹤南区', '7', '1', '3', '128', '47', '1', '6', '6', null, null, '1');
INSERT INTO `f_info_3` VALUES ('611', '1412', '都市豪庭', '3', '1', '2', '137', '80', '2', '13', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('612', '1413', '火炬北路', '2', '1', '2', '93', '40', '1', '5', '3', null, null, '8');
INSERT INTO `f_info_3` VALUES ('613', '1414', '置城国际', '6', '1', '3', '138', '90', '2', null, '13', null, null, '12');
INSERT INTO `f_info_3` VALUES ('614', '1415', '红星小区', '4', '1', '3', '56', '24', '1', null, '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('615', '1416', '附院西', '7', '1', '3', '101', '42', '1', '6', '6', null, null, '6');
INSERT INTO `f_info_3` VALUES ('616', '1417', '观音阁游乐园南500米路东', '8', '1', '4', '107', '18', '2', '6', '4', null, null, '11');
INSERT INTO `f_info_3` VALUES ('617', '1418', '光河花园西,兴唐经典北，长安花园沿街门面', '8', '1', '4', '142', '85', '2', '2', '1', null, null, '7');
INSERT INTO `f_info_3` VALUES ('618', '1419', '金宇和古槐路交汇处北200米路', '7', '1', '3', '75', '29', '1', '6', '5', null, null, '10');
INSERT INTO `f_info_3` VALUES ('619', '1420', '党', '6', '1', '3', '95', '42', '2', '6', '5', null, null, '9');
INSERT INTO `f_info_3` VALUES ('620', '1421', '龙行路', '8', '1', '4', '104', '48', '1', '6', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('621', '1422', '崇文大道路北', '5', '1', '3', '128', '39', '1', '6', '3', null, null, '6');
INSERT INTO `f_info_3` VALUES ('622', '1423', '益民西区', '8', '1', '4', '113', '33', '1', '5', '5', null, null, '7');
INSERT INTO `f_info_3` VALUES ('623', '1424', '红星东路', '7', '1', '3', '115', '56', '1', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('624', '1425', '光河路', '2', '1', '2', '118', '57', '1', '17', '14', null, null, '3');
INSERT INTO `f_info_3` VALUES ('625', '1426', '人民医院附近', '7', '1', '3', '98', '37', '2', '6', '5', null, null, '7');
INSERT INTO `f_info_3` VALUES ('626', '1427', '红星东路', '8', '1', '4', '97', '31', '2', '6', '6', null, null, '8');
INSERT INTO `f_info_3` VALUES ('627', '1428', '太东', '5', '1', '3', '129', '55', '2', '6', '2', null, null, '10');
INSERT INTO `f_info_3` VALUES ('628', '1429', '光河路', '6', '1', '3', '118', '58', '2', '17', '14', null, null, '4');
INSERT INTO `f_info_3` VALUES ('629', '1430', '红星东路', '3', '1', '2', '126', '95', '2', '6', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('630', '1431', '解放路口', '6', '1', '3', '103', '47', '2', '26', '9', null, null, '8');
INSERT INTO `f_info_3` VALUES ('631', '1432', '杨柳国际G区8号楼', '8', '1', '4', '188', '30', '2', '6', '6', null, null, '6');
INSERT INTO `f_info_3` VALUES ('632', '1433', '王母阁路', '4', '1', '2', '70', '25', '1', '6', '1', null, null, '10');
INSERT INTO `f_info_3` VALUES ('633', '1434', '红星东路', '8', '1', '4', '140', '66', '2', '11', '3', null, null, '1');
INSERT INTO `f_info_3` VALUES ('634', '1435', '洸河路', '8', '1', '4', '98', '48', '1', '6', '3', null, null, '5');
INSERT INTO `f_info_3` VALUES ('635', '1436', '附院西邻', '3', '1', '2', '50', '25', '1', '6', '4', null, null, '6');
INSERT INTO `f_info_3` VALUES ('636', '1437', '洸河西路', '2', '1', '2', '131', '43', '1', '17', '3', null, null, '4');
INSERT INTO `f_info_3` VALUES ('637', '1438', '洸河西路', '3', '1', '2', '117', '38', '2', '17', '6', null, null, '10');
INSERT INTO `f_info_3` VALUES ('638', '1439', '小区大门出入口', '5', '1', '3', '25', '7', '1', null, '1', null, null, '5');
INSERT INTO `f_info_3` VALUES ('639', '1440', '洸河西路', '6', '1', '3', '79', '33', '1', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('640', '1441', '常青路', '4', '1', '3', '109', '45', '2', '22', '17', null, null, '3');
INSERT INTO `f_info_3` VALUES ('641', '1442', '中区', '4', '1', '2', '123', '3', '2', '23', '6', null, null, '13');
INSERT INTO `f_info_3` VALUES ('642', '1443', '光河花园', '3', '1', '2', '93', '43', '1', '6', '2', null, null, '9');
INSERT INTO `f_info_3` VALUES ('643', '1444', '琵琶山小区紧邻', '6', '1', '3', '84', '38', '2', '6', '2', null, null, '5');
INSERT INTO `f_info_3` VALUES ('644', '1445', '八铺新苑', '6', '1', '3', '60', '12', '2', '6', '4', null, null, '2');
INSERT INTO `f_info_3` VALUES ('645', '1446', '来鹤小区', '6', '1', '3', '165', '35', '2', '7', '6', '0', '1,2,3,4', '2');
INSERT INTO `f_info_3` VALUES ('646', '1447', '火炬南路观音阁游乐园南500米', '8', '1', '4', '108', '18', '2', '6', '4', null, null, '9');
INSERT INTO `f_info_3` VALUES ('647', '1448', '齐鑫花园', '8', '1', '4', '110', '45', '2', '5', '2', null, null, '13');
INSERT INTO `f_info_3` VALUES ('648', '1449', '琵琶山', '8', '1', '4', '87', '38', '1', '6', '5', null, null, '4');
INSERT INTO `f_info_3` VALUES ('649', '1450', '济安桥路', '6', '1', '3', '81', '29', '1', null, '3', null, null, '13');
INSERT INTO `f_info_3` VALUES ('650', '1451', '铁塔寺小区', '1', '1', '2', '145', '58', '2', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('651', '1452', '红星东路', '5', '1', '3', '105', '39', '1', '12', '2', null, null, '4');
INSERT INTO `f_info_3` VALUES ('652', '1453', '银都花园', '7', '1', '3', '218', '58', '1', '6', '6', null, null, '7');
INSERT INTO `f_info_3` VALUES ('653', '1454', '银都', '3', '1', '2', '138', '60', '1', '6', '1', null, null, '12');
INSERT INTO `f_info_3` VALUES ('654', '1455', '邮电新苑', '2', '1', '2', '166', '58', '1', '6', '6', null, null, '3');
INSERT INTO `f_info_3` VALUES ('655', '1456', '长虹小区', '1', '1', '2', '130', '35', '1', '6', '6', null, null, '6');
INSERT INTO `f_info_3` VALUES ('656', '1457', '济北商贸城', '7', '1', '3', '123', '24', '2', '6', '6', null, null, '12');
INSERT INTO `f_info_3` VALUES ('657', '1458', '新华路', '8', '1', '4', '90', '30', '2', '6', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('658', '1459', '古槐路', '8', '1', '4', '200', '63', '2', '7', '6', null, null, '3');
INSERT INTO `f_info_3` VALUES ('659', '1460', '光河西路与新化路交界处开泰中介', '5', '1', '3', '106', '45', '1', '7', '5', null, null, '1');
INSERT INTO `f_info_3` VALUES ('660', '1461', '香港大厦东', '7', '1', '3', '111', '49', '1', '11', '1', null, null, '3');
INSERT INTO `f_info_3` VALUES ('661', '1462', '红星东路', '3', '1', '2', '132', '41', '2', '5', '5', null, null, '13');
INSERT INTO `f_info_3` VALUES ('662', '1463', '太白东路南', '3', '1', '2', '133', '47', '1', '12', '1', null, null, '10');
INSERT INTO `f_info_3` VALUES ('663', '1464', '红星东路森泰御城', '6', '1', '3', '90', '34', '2', '12', '4', null, null, '2');
INSERT INTO `f_info_3` VALUES ('664', '1465', '洸河西路与新华路开泰中介', '1', '1', '2', '103', '35', '1', '14', '7', null, null, '8');
INSERT INTO `f_info_3` VALUES ('665', '1466', '世纪广场西临', '3', '1', '2', '70', '35', '1', '24', '18', null, null, '3');
INSERT INTO `f_info_3` VALUES ('666', '1467', '红星东路 路南', '1', '1', '2', '105', '79', '1', '6', '3', null, null, '12');
INSERT INTO `f_info_3` VALUES ('667', '1468', '接庄镇政府驻地', '8', '1', '4', '55', '10', '2', '6', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('668', '1469', '舜态园小区高层6号楼18层东', '6', '1', '3', '115', '50', '2', null, '16', null, null, '12');
INSERT INTO `f_info_3` VALUES ('669', '1470', '光河路', '1', '1', '2', '123', '58', '1', '11', '7', null, null, '13');
INSERT INTO `f_info_3` VALUES ('670', '1471', '五里营济邹路口向北100米路东', '4', '1', '2', '85', '17', '1', '6', '5', null, null, '1');
INSERT INTO `f_info_3` VALUES ('671', '1472', '玫瑰庄园', '8', '1', '4', '100', '20', '2', '6', '2', null, null, '9');
INSERT INTO `f_info_3` VALUES ('672', '1473', '五里营东发小区', '6', '1', '3', '110', '27', '2', '6', '4', null, null, '4');
INSERT INTO `f_info_3` VALUES ('673', '1474', '太东市场附近', '8', '1', '4', '126', '55', '1', '6', '2', null, null, '13');
INSERT INTO `f_info_3` VALUES ('674', '1475', '繁华路段', '1', '1', '2', '141', '55', '1', '12', '7', null, null, '3');
INSERT INTO `f_info_3` VALUES ('675', '1476', '太白东路', '8', '1', '4', '93', '37', '2', '26', '4', null, null, '11');
INSERT INTO `f_info_3` VALUES ('676', '1477', '文化小区', '8', '1', '4', '72', '26', '2', '6', '5', null, null, '6');
INSERT INTO `f_info_3` VALUES ('677', '1478', '长虹小区', '8', '1', '4', '280', '120', '2', '6', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('678', '1479', '杨柳国际新城', '7', '1', '3', '136', '46', '1', '6', '6', null, null, '11');
INSERT INTO `f_info_3` VALUES ('679', '1480', '曲阜新车站附近', '4', '1', '3', '94', '29', '1', '7', '4', null, null, '11');
INSERT INTO `f_info_3` VALUES ('680', '1481', '王母阁小区', '7', '1', '4', '68', '25', '2', null, '4', null, null, '9');
INSERT INTO `f_info_3` VALUES ('681', '1482', '来鹤小区', '2', '1', '2', '74', '35', '1', '6', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('682', '1483', '谢营小区金鱼路南', '3', '1', '2', '115', '45', '1', '6', '1', null, null, '12');
INSERT INTO `f_info_3` VALUES ('683', '1484', '开泰花园', '3', '1', '2', '96', '34', '1', '6', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('684', '1485', '来鹤小区', '7', '1', '4', '104', '46', '2', '6', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('685', '1486', '获麟小区2号楼', '8', '1', '4', '88', '11', '1', '6', '1', null, null, '11');
INSERT INTO `f_info_3` VALUES ('686', '1487', '永兴小区', '8', '1', '4', '78', '27', '2', '5', '1', null, null, '11');
INSERT INTO `f_info_3` VALUES ('687', '1488', '二院附近', '8', '1', '4', '107', '41', '2', null, '2', null, null, '6');
INSERT INTO `f_info_3` VALUES ('688', '1489', '来鹤路碧水云天', '2', '1', '2', '48', '23', '2', '25', '16', null, null, '6');
INSERT INTO `f_info_3` VALUES ('689', '1490', '铁塔寺小区', '1', '1', '2', '58', '27', '1', '6', '5', null, null, '7');
INSERT INTO `f_info_3` VALUES ('690', '1491', '银都花园', '1', '1', '2', '132', '41', '1', '5', '5', null, null, '9');
INSERT INTO `f_info_3` VALUES ('691', '1492', '金水湾小区', '4', '1', '3', '120', '53', '1', '16', '4', null, null, '9');
INSERT INTO `f_info_3` VALUES ('692', '1493', '世纪广场西', '3', '1', '2', '138', '60', '1', null, '6', null, null, '13');
INSERT INTO `f_info_3` VALUES ('693', '1494', '运西家园凤凰城', '8', '1', '4', '92', '26', '2', '6', '4', null, null, '3');
INSERT INTO `f_info_3` VALUES ('694', '1495', '光河西路与新华路交界处开泰中介', '1', '1', '2', '98', '41', '1', '6', '2', null, null, '11');
INSERT INTO `f_info_3` VALUES ('695', '1496', '浣笔泉北路', '7', '1', '4', '122', '63', '1', '12', '12', null, null, '2');
INSERT INTO `f_info_3` VALUES ('696', '1497', '金茂小区', '7', '1', '4', '97', '31', '2', '6', '6', null, null, '6');
INSERT INTO `f_info_3` VALUES ('697', '1498', '森泰御城', '4', '1', '2', '98', '4280', '1', null, '9', null, null, '11');
INSERT INTO `f_info_3` VALUES ('698', '1499', '光河路附小西邻', '1', '1', '2', '54', '26', '1', '32', '17', null, null, '4');
INSERT INTO `f_info_3` VALUES ('699', '1500', '铁', '4', '1', '2', '43', '22', '1', '6', '3', null, null, '7');
INSERT INTO `f_info_3` VALUES ('700', '1501', '红星东路东首黄营小区1号楼', '8', '1', '4', '100', '30', '2', '5', '4', null, null, '6');
INSERT INTO `f_info_3` VALUES ('701', '1502', '人民医院南临', '8', '1', '4', '100', '53', '1', '6', '3', null, null, '8');
INSERT INTO `f_info_3` VALUES ('702', '1503', '获麟小区2号楼', '3', '1', '2', '88', '11', '1', '6', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('703', '1504', '金宇路光府河西临置城国际东临别墅区', '8', '1', '4', '103', '50', '1', '7', '3', null, null, '11');
INSERT INTO `f_info_3` VALUES ('704', '1505', '银都花园', '5', '1', '3', '138', '60', '1', '6', '1', null, null, '4');
INSERT INTO `f_info_3` VALUES ('705', '1506', '红星东路', '7', '1', '3', '220', '45', '1', '6', '6', null, null, '5');
INSERT INTO `f_info_3` VALUES ('706', '1507', '火炬路五里营济州路口', '8', '1', '4', '85', '17', '2', '6', '5', null, null, '8');
INSERT INTO `f_info_3` VALUES ('707', '1508', '获麟小区', '7', '1', '4', '88', '11', '2', '6', '1', null, null, '8');
INSERT INTO `f_info_3` VALUES ('708', '1509', '济宁东发小区', '8', '1', '4', '96', '29', '2', '6', '1', null, null, '9');
INSERT INTO `f_info_3` VALUES ('709', '1510', '银都', '5', '1', '3', '105', '48', '1', '6', '5', null, null, '8');
INSERT INTO `f_info_3` VALUES ('710', '1511', '光河西路与新华路交界处，开泰中介', '8', '1', '4', '118', '51', '2', '6', '5', null, null, '11');
INSERT INTO `f_info_3` VALUES ('711', '1512', '济宁市中区东五里营玫瑰庄园', '2', '1', '2', '138', '23', '1', '6', '4', null, null, '1');
INSERT INTO `f_info_3` VALUES ('712', '1513', '运河文化大厦', '1', '1', '2', '110', '48', '1', '16', '9', null, null, '12');
INSERT INTO `f_info_3` VALUES ('713', '1514', '赛宝西临', '5', '1', '3', '144', '65', '1', '12', '5', null, null, '1');
INSERT INTO `f_info_3` VALUES ('714', '1515', '新世纪花园', '8', '1', '4', '155', '98', '2', '7', '1', null, null, '3');
INSERT INTO `f_info_3` VALUES ('715', '1516', '获麟小区', '8', '1', '4', '88', '12', '1', '6', '1', null, null, '10');
INSERT INTO `f_info_3` VALUES ('716', '1517', '洸河路', '8', '1', '4', '140', '65', '1', '6', '4', null, null, '7');
INSERT INTO `f_info_3` VALUES ('717', '1518', '洸河路', '3', '1', '2', '131', '44', '1', '17', '3', null, null, '2');
INSERT INTO `f_info_3` VALUES ('718', '1519', '梦园小区光河路绿地附近', '5', '1', '3', '117', '37', '2', '6', '5', null, null, '4');
INSERT INTO `f_info_3` VALUES ('719', '1520', '红星东路', '1', '1', '2', '60', '29', '2', '6', '1', null, null, '10');
INSERT INTO `f_info_3` VALUES ('720', '1521', '红星东路', '8', '1', '4', '167', '80', '2', '6', '2', null, null, '12');
INSERT INTO `f_info_3` VALUES ('721', '1522', '光河路', '7', '1', '3', '124', '58', '2', '11', '7', null, null, '8');
INSERT INTO `f_info_3` VALUES ('722', '1523', '光河西路', '8', '1', '4', '108', '50', '1', null, '4', null, null, '13');
INSERT INTO `f_info_3` VALUES ('723', '1524', '太白西路', '4', '1', '3', '76', '30', '1', '6', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('724', '1525', '红星西路', '7', '1', '3', '100', '36', '2', '6', '3', null, null, '9');
INSERT INTO `f_info_3` VALUES ('725', '1526', '红星东路', '4', '1', '2', '98', '48', '2', '6', '1', null, null, '11');
INSERT INTO `f_info_3` VALUES ('726', '1527', '荣旺花园', '4', '1', '3', '95', '22', '1', '6', '6', null, null, '10');
INSERT INTO `f_info_3` VALUES ('727', '1528', '来鹤小区', '8', '1', '4', '87', '35', '2', '7', '6', null, null, '8');
INSERT INTO `f_info_3` VALUES ('728', '1529', '明珠花园', '5', '1', '3', '87', '36', '1', null, '6', null, null, '1');
INSERT INTO `f_info_3` VALUES ('729', '1530', '北岱庄嘉和花园', '1', '1', '2', '100', '30', '2', '6', '2', null, null, '10');
INSERT INTO `f_info_3` VALUES ('730', '1531', '阳光润泽园', '4', '1', '2', '135', '60', '2', '12', '8', null, null, '8');
INSERT INTO `f_info_3` VALUES ('731', '1532', '杨柳国际新城D区', '8', '1', '4', '94', '40', '2', '6', '6', null, null, '2');
INSERT INTO `f_info_3` VALUES ('732', '1533', '益民东区对过', '5', '1', '3', '190', '75', '1', '12', '7', '0', '', '11');
INSERT INTO `f_info_3` VALUES ('733', '1534', '吴泰闸路', '1', '1', '2', '143', '57', '1', '29', '5', null, null, '7');
INSERT INTO `f_info_3` VALUES ('734', '1535', '红星东路', '4', '1', '3', '90', '34', '1', null, '4', null, null, '13');
INSERT INTO `f_info_3` VALUES ('735', '1536', '任城新区北', '2', '1', '2', '106', '26', '2', '5', '4', null, null, '5');
INSERT INTO `f_info_3` VALUES ('736', '1537', '红星东路', '3', '1', '2', '97', '35', '1', '6', '6', null, null, '3');
INSERT INTO `f_info_3` VALUES ('737', '1538', '菱花路', '8', '1', '4', '84', '25', '2', null, '3', null, null, '2');
INSERT INTO `f_info_3` VALUES ('738', '1539', '开泰花园', '7', '1', '3', '96', '34', '2', '6', '4', null, null, '12');
INSERT INTO `f_info_3` VALUES ('739', '1540', '红星小区', '8', '1', '4', '60', '30', '2', null, '1', null, null, '11');

-- ----------------------------
-- Table structure for `f_info_4`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_4`;
CREATE TABLE `f_info_4` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `gongxu` int(2) default NULL,
  `price` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `fwhx` int(2) default NULL,
  `qy` int(2) default NULL,
  `housearea` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_4
-- ----------------------------
INSERT INTO `f_info_4` VALUES ('6', '3', '1', '600元以下/月', '济宁市中区光河路明珠小区', '1', '1', '30平方');
INSERT INTO `f_info_4` VALUES ('10', '4', '2', '20-25万元', null, '2', '1', '90平方');
INSERT INTO `f_info_4` VALUES ('11', '54', '1', '不高于1000元', '红星东路', '3', '1', '60平方');
INSERT INTO `f_info_4` VALUES ('12', '71', '2', '不高于70 万元', '吴泰闸路公路之家', '3', '1', '100平左右');

-- ----------------------------
-- Table structure for `f_info_5`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_5`;
CREATE TABLE `f_info_5` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `lx` int(2) default NULL,
  `gongxu` int(2) default NULL,
  `housearea` int(10) default NULL,
  `address` varchar(255) default NULL,
  `zj` int(2) default NULL,
  `price` int(10) default NULL,
  `qy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_5
-- ----------------------------
INSERT INTO `f_info_5` VALUES ('6', '7', '1', '1', '50', '金宇大市场附近', '1', '0', '1');
INSERT INTO `f_info_5` VALUES ('10', '56', '1', '1', '92', '秀水城向南100米', '1', '0', '1');
INSERT INTO `f_info_5` VALUES ('11', '64', '1', '3', '110', '济宁利隆大厦', '2', '0', '2');

-- ----------------------------
-- Table structure for `f_info_6`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_6`;
CREATE TABLE `f_info_6` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `zj` int(2) default NULL,
  `qy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_6
-- ----------------------------
INSERT INTO `f_info_6` VALUES ('1', '5', '2', '1');

-- ----------------------------
-- Table structure for `f_info_7`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_7`;
CREATE TABLE `f_info_7` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `fbr` int(2) default NULL,
  `chengse` int(10) default NULL,
  `price` int(10) default NULL,
  `gongxu` int(2) default NULL,
  `qy` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_7
-- ----------------------------
INSERT INTO `f_info_7` VALUES ('1', '21', '2', '1', '1200', '1', '3');
INSERT INTO `f_info_7` VALUES ('2', '28', '1', '2', '2000', '1', '3');
INSERT INTO `f_info_7` VALUES ('3', '24', '1', '2', '560', '1', '3');
INSERT INTO `f_info_7` VALUES ('4', '25', '2', '1', '340', '1', '1');
INSERT INTO `f_info_7` VALUES ('5', '26', '1', '4', '9500', '1', '2');
INSERT INTO `f_info_7` VALUES ('6', '27', '1', '2', '800', '1', '1');
INSERT INTO `f_info_7` VALUES ('9', '42', '2', '3', '0', '1', '3');
INSERT INTO `f_info_7` VALUES ('7', '32', '1', '1', '115', '1', '1');
INSERT INTO `f_info_7` VALUES ('8', '41', '2', '2', '0', '1', '3');
INSERT INTO `f_info_7` VALUES ('10', '43', '1', '1', '2100', '1', '1');
INSERT INTO `f_info_7` VALUES ('11', '44', '1', '2', '1500', '1', '1');
INSERT INTO `f_info_7` VALUES ('12', '45', '2', '1', '10', '1', '1');
INSERT INTO `f_info_7` VALUES ('14', '47', '1', '1', '30', '1', '3');
INSERT INTO `f_info_7` VALUES ('15', '48', '1', '3', '2350', '1', '1');
INSERT INTO `f_info_7` VALUES ('17', '50', '1', '2', '380', '1', '2');
INSERT INTO `f_info_7` VALUES ('18', '51', '2', '1', '95', '1', '1');
INSERT INTO `f_info_7` VALUES ('19', '52', '1', '1', '500', '1', '1');
INSERT INTO `f_info_7` VALUES ('20', '74', '1', '1', '0', '1', '1');
INSERT INTO `f_info_7` VALUES ('21', '75', '2', '1', '60', '1', '2');
INSERT INTO `f_info_7` VALUES ('22', '76', '1', '1', '0', '1', '3');
INSERT INTO `f_info_7` VALUES ('23', '77', '1', '1', '950', '1', '1');
INSERT INTO `f_info_7` VALUES ('24', '78', '1', '2', '700', '1', '3');
INSERT INTO `f_info_7` VALUES ('25', '79', '1', '2', '1280', '1', '3');
INSERT INTO `f_info_7` VALUES ('26', '80', '1', '2', '400', '1', '3');
INSERT INTO `f_info_7` VALUES ('27', '81', '1', '1', '1300', '1', '1');
INSERT INTO `f_info_7` VALUES ('28', '82', '2', '1', '9', '1', '2');
INSERT INTO `f_info_7` VALUES ('29', '83', '1', '1', '38', '1', '3');
INSERT INTO `f_info_7` VALUES ('30', '84', '2', '1', '55', '1', '1');
INSERT INTO `f_info_7` VALUES ('31', '85', '1', '1', '10', '1', '3');
INSERT INTO `f_info_7` VALUES ('32', '1568', '2', '1', '0', '1', '2');
INSERT INTO `f_info_7` VALUES ('33', '46', '1', '2', '400', '1', '3');
INSERT INTO `f_info_7` VALUES ('34', '49', '1', '1', '1300', '2', '2');
INSERT INTO `f_info_7` VALUES ('35', '1584', '1', '2', '1500', '1', '1');
INSERT INTO `f_info_7` VALUES ('36', '1596', '1', '1', '90', '1', '0');
INSERT INTO `f_info_7` VALUES ('37', '1597', '1', '1', '50', '1', '1');
INSERT INTO `f_info_7` VALUES ('38', '1599', '1', '1', '0', '1', '0');
INSERT INTO `f_info_7` VALUES ('39', '1600', '1', '2', '1800', '1', '0');
INSERT INTO `f_info_7` VALUES ('40', '1601', '1', '2', '2400', '1', '0');

-- ----------------------------
-- Table structure for `f_info_8`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_8`;
CREATE TABLE `f_info_8` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `qy` int(2) default NULL,
  `pxfs` varchar(255) default NULL,
  `pxzq` varchar(255) default NULL,
  `pxsj` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_8
-- ----------------------------
INSERT INTO `f_info_8` VALUES ('1', '667', '3', '1,2,4', '3,4', null);
INSERT INTO `f_info_8` VALUES ('2', '668', '3', '1,3,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('3', '669', '3', '1,3,4', '1,4', null);
INSERT INTO `f_info_8` VALUES ('4', '670', '1', '1,3,4', '1,4', null);
INSERT INTO `f_info_8` VALUES ('5', '671', '3', '1,2,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('6', '672', '2', '1,3,4', '3,4', null);
INSERT INTO `f_info_8` VALUES ('7', '673', '1', '1,2,4', '2,4', null);
INSERT INTO `f_info_8` VALUES ('8', '674', '3', '1,2,4', '3,4', null);
INSERT INTO `f_info_8` VALUES ('9', '675', '3', '1,2,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('10', '676', '2', '1,2,4', '1,5', null);
INSERT INTO `f_info_8` VALUES ('11', '677', '1', '1,3,4', '3,4', null);
INSERT INTO `f_info_8` VALUES ('12', '678', '3', '1,2,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('13', '679', '3', '1,3,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('14', '680', '1', '1,3,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('15', '681', '2', '1,3,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('16', '682', '2', '1,3,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('17', '683', '3', '1,3,4', '2,4', null);
INSERT INTO `f_info_8` VALUES ('18', '684', '1', '1,2,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('19', '685', '2', '1,2,4', '1,5', null);
INSERT INTO `f_info_8` VALUES ('20', '686', '2', '1,3,4', '3,4', null);
INSERT INTO `f_info_8` VALUES ('21', '687', '2', '1,2,4', '1,4', null);
INSERT INTO `f_info_8` VALUES ('22', '688', '3', '1,2,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('23', '689', '2', '1,2,4', '2,4', null);
INSERT INTO `f_info_8` VALUES ('24', '690', '3', '1,3,4', '1,4', null);
INSERT INTO `f_info_8` VALUES ('25', '691', '2', '1,2,4', '3,4', null);
INSERT INTO `f_info_8` VALUES ('26', '692', '3', '1,3,4', '1,4', null);
INSERT INTO `f_info_8` VALUES ('27', '693', '2', '1,2,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('28', '694', '3', '1,3,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('29', '695', '1', '1,2,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('30', '696', '1', '1,3,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('31', '697', '2', '1,2,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('32', '698', '2', '1,2,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('33', '699', '3', '1,3,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('34', '700', '1', '1,3,4', '2,4', null);
INSERT INTO `f_info_8` VALUES ('35', '701', '2', '1,2,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('36', '702', '1', '1,2,4', '3,4', null);
INSERT INTO `f_info_8` VALUES ('37', '703', '2', '1,3,4', '1,5', null);
INSERT INTO `f_info_8` VALUES ('38', '704', '2', '1,3,4', '2,4', null);
INSERT INTO `f_info_8` VALUES ('39', '705', '2', '1,3,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('40', '706', '3', '1,3,4', '1,5', null);
INSERT INTO `f_info_8` VALUES ('41', '707', '1', '1,2,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('42', '708', '2', '1,3,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('43', '709', '2', '1,3,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('44', '710', '2', '1,2,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('45', '711', '3', '1,2,4', '2,4', null);
INSERT INTO `f_info_8` VALUES ('46', '712', '3', '1,2,4', '3,4', null);
INSERT INTO `f_info_8` VALUES ('47', '713', '2', '1,3,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('48', '714', '3', '1,3,4', '1,4', null);
INSERT INTO `f_info_8` VALUES ('49', '715', '2', '1,3,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('50', '716', '2', '1,2,4', '2,4', null);
INSERT INTO `f_info_8` VALUES ('51', '717', '1', '1,3,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('52', '718', '2', '1,2,4', '1,5', null);
INSERT INTO `f_info_8` VALUES ('53', '719', '1', '1,2,4', '3,4', null);
INSERT INTO `f_info_8` VALUES ('54', '720', '3', '1,3,4', '1,5', null);
INSERT INTO `f_info_8` VALUES ('55', '721', '1', '1,3,4', '3,5', null);
INSERT INTO `f_info_8` VALUES ('56', '722', '3', '1,3,4', '2,5', null);
INSERT INTO `f_info_8` VALUES ('57', '1577', '3', '1,2,4', '3,4', null);

-- ----------------------------
-- Table structure for `f_info_9`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_9`;
CREATE TABLE `f_info_9` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `number` int(10) default NULL,
  `education` int(2) default NULL,
  `wage` int(2) default NULL,
  `qy` int(2) default NULL,
  `gzjy` int(2) default NULL,
  `fbr` int(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `infoid` (`infoid`)
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of f_info_9
-- ----------------------------
INSERT INTO `f_info_9` VALUES ('1', '37', '10', '1', '4', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('2', '86', '1', '3', '4', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('3', '87', '3', '1', '3', '2', '4', '2');
INSERT INTO `f_info_9` VALUES ('4', '88', '3', '1', '2', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('5', '89', '3', '3', '2', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('6', '90', '3', '1', '4', '2', '4', '2');
INSERT INTO `f_info_9` VALUES ('7', '91', '3', '1', '3', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('8', '92', '2', '1', '4', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('9', '93', '1', '3', '3', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('10', '94', '5', '2', '1', '2', '2', '1');
INSERT INTO `f_info_9` VALUES ('11', '95', '3', '1', '2', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('12', '96', '5', '2', '2', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('13', '97', '10', '1', '1', '1', '5', '2');
INSERT INTO `f_info_9` VALUES ('14', '98', '1', '3', '2', '2', '2', '2');
INSERT INTO `f_info_9` VALUES ('15', '99', '2', '2', '1', '2', '4', '2');
INSERT INTO `f_info_9` VALUES ('16', '100', '2', '2', '3', '2', '2', '2');
INSERT INTO `f_info_9` VALUES ('17', '101', '2', '2', '3', '1', '3', '1');
INSERT INTO `f_info_9` VALUES ('18', '102', '1', '1', '2', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('19', '103', '1', '1', '1', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('20', '104', '1', '1', '4', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('21', '105', '2', '2', '3', '2', '2', '2');
INSERT INTO `f_info_9` VALUES ('22', '106', '2', '2', '1', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('23', '107', '2', '2', '1', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('24', '108', '1', '1', '4', '2', '5', '1');
INSERT INTO `f_info_9` VALUES ('25', '109', '1', '1', '4', '2', '2', '1');
INSERT INTO `f_info_9` VALUES ('26', '110', '1', '1', '2', '3', '1', '2');
INSERT INTO `f_info_9` VALUES ('27', '111', '1', '1', '2', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('28', '112', '1', '1', '1', '3', '4', '2');
INSERT INTO `f_info_9` VALUES ('29', '113', '2', '2', '1', '3', '3', '1');
INSERT INTO `f_info_9` VALUES ('30', '114', '1', '1', '3', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('31', '115', '3', '3', '2', '3', '2', '1');
INSERT INTO `f_info_9` VALUES ('32', '116', '1', '1', '1', '2', '3', '2');
INSERT INTO `f_info_9` VALUES ('33', '117', '1', '1', '4', '2', '2', '1');
INSERT INTO `f_info_9` VALUES ('34', '118', '1', '1', '4', '1', '2', '2');
INSERT INTO `f_info_9` VALUES ('35', '119', '2', '2', '2', '2', '4', '2');
INSERT INTO `f_info_9` VALUES ('36', '120', '1', '1', '2', '2', '5', '2');
INSERT INTO `f_info_9` VALUES ('37', '121', '2', '2', '4', '2', '2', '2');
INSERT INTO `f_info_9` VALUES ('38', '122', '1', '1', '1', '3', '1', '2');
INSERT INTO `f_info_9` VALUES ('39', '123', '3', '3', '4', '2', '2', '1');
INSERT INTO `f_info_9` VALUES ('40', '124', '2', '2', '3', '1', '1', '2');
INSERT INTO `f_info_9` VALUES ('41', '125', '1', '1', '3', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('42', '126', '1', '1', '2', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('43', '127', '1', '1', '2', '3', '1', '2');
INSERT INTO `f_info_9` VALUES ('44', '128', '2', '2', '4', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('45', '129', '2', '2', '1', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('46', '130', '1', '1', '2', '3', '4', '1');
INSERT INTO `f_info_9` VALUES ('47', '131', '1', '1', '1', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('48', '132', '2', '2', '2', '3', '1', '2');
INSERT INTO `f_info_9` VALUES ('49', '133', '3', '3', '3', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('50', '134', '2', '2', '2', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('51', '135', '2', '2', '2', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('52', '136', '1', '1', '1', '1', '5', '1');
INSERT INTO `f_info_9` VALUES ('53', '137', '1', '1', '1', '1', '1', '2');
INSERT INTO `f_info_9` VALUES ('54', '138', '1', '1', '1', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('55', '139', '2', '2', '4', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('56', '140', '3', '3', '4', '2', '5', '1');
INSERT INTO `f_info_9` VALUES ('57', '141', '2', '2', '4', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('58', '142', '1', '1', '2', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('59', '143', '2', '2', '4', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('60', '144', '1', '1', '4', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('61', '145', '3', '3', '4', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('62', '146', '1', '1', '2', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('63', '147', '2', '2', '4', '3', '1', '2');
INSERT INTO `f_info_9` VALUES ('64', '148', '1', '1', '1', '2', '4', '2');
INSERT INTO `f_info_9` VALUES ('65', '149', '3', '3', '3', '3', '2', '1');
INSERT INTO `f_info_9` VALUES ('66', '150', '2', '2', '2', '1', '2', '2');
INSERT INTO `f_info_9` VALUES ('67', '151', '2', '2', '1', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('68', '152', '2', '2', '4', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('69', '153', '1', '1', '1', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('70', '154', '1', '1', '3', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('71', '155', '2', '2', '1', '3', '2', '1');
INSERT INTO `f_info_9` VALUES ('72', '156', '2', '2', '3', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('73', '157', '2', '2', '3', '3', '3', '1');
INSERT INTO `f_info_9` VALUES ('74', '158', '1', '1', '2', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('75', '159', '2', '2', '1', '2', '2', '2');
INSERT INTO `f_info_9` VALUES ('76', '160', '2', '2', '1', '2', '4', '2');
INSERT INTO `f_info_9` VALUES ('77', '161', '2', '2', '4', '1', '1', '2');
INSERT INTO `f_info_9` VALUES ('78', '162', '2', '2', '4', '2', '5', '2');
INSERT INTO `f_info_9` VALUES ('79', '163', '2', '2', '4', '1', '1', '1');
INSERT INTO `f_info_9` VALUES ('80', '164', '1', '1', '3', '2', '5', '1');
INSERT INTO `f_info_9` VALUES ('81', '165', '2', '2', '2', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('82', '166', '2', '2', '2', '1', '5', '2');
INSERT INTO `f_info_9` VALUES ('83', '167', '3', '3', '2', '3', '1', '1');
INSERT INTO `f_info_9` VALUES ('84', '168', '2', '2', '4', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('85', '169', '1', '1', '1', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('86', '170', '1', '1', '2', '1', '1', '2');
INSERT INTO `f_info_9` VALUES ('87', '171', '2', '2', '3', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('88', '172', '2', '2', '1', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('89', '173', '3', '3', '3', '2', '3', '2');
INSERT INTO `f_info_9` VALUES ('90', '174', '3', '3', '1', '1', '2', '2');
INSERT INTO `f_info_9` VALUES ('91', '175', '1', '1', '1', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('92', '176', '2', '2', '1', '3', '4', '1');
INSERT INTO `f_info_9` VALUES ('93', '177', '2', '2', '3', '1', '1', '1');
INSERT INTO `f_info_9` VALUES ('94', '178', '1', '1', '2', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('95', '179', '1', '1', '1', '3', '1', '1');
INSERT INTO `f_info_9` VALUES ('96', '180', '1', '1', '3', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('97', '181', '1', '1', '3', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('98', '182', '2', '2', '2', '3', '2', '2');
INSERT INTO `f_info_9` VALUES ('99', '183', '2', '2', '3', '2', '3', '2');
INSERT INTO `f_info_9` VALUES ('100', '184', '1', '1', '3', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('101', '185', '2', '2', '2', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('102', '186', '1', '1', '2', '2', '2', '2');
INSERT INTO `f_info_9` VALUES ('103', '187', '1', '1', '1', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('104', '188', '1', '1', '2', '1', '5', '2');
INSERT INTO `f_info_9` VALUES ('105', '189', '2', '2', '2', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('106', '190', '3', '3', '3', '1', '1', '1');
INSERT INTO `f_info_9` VALUES ('107', '191', '3', '3', '4', '3', '4', '2');
INSERT INTO `f_info_9` VALUES ('108', '192', '2', '2', '3', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('109', '193', '3', '3', '2', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('110', '194', '3', '3', '3', '2', '5', '1');
INSERT INTO `f_info_9` VALUES ('111', '195', '2', '2', '3', '1', '5', '2');
INSERT INTO `f_info_9` VALUES ('112', '196', '1', '1', '2', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('113', '197', '3', '3', '1', '2', '5', '2');
INSERT INTO `f_info_9` VALUES ('114', '198', '1', '1', '1', '3', '4', '2');
INSERT INTO `f_info_9` VALUES ('115', '199', '1', '1', '2', '1', '3', '1');
INSERT INTO `f_info_9` VALUES ('116', '200', '2', '2', '4', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('117', '201', '2', '2', '2', '3', '1', '1');
INSERT INTO `f_info_9` VALUES ('118', '202', '3', '3', '4', '3', '1', '2');
INSERT INTO `f_info_9` VALUES ('119', '203', '2', '2', '1', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('120', '204', '3', '3', '4', '3', '4', '2');
INSERT INTO `f_info_9` VALUES ('121', '205', '2', '2', '2', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('122', '206', '1', '1', '4', '3', '4', '2');
INSERT INTO `f_info_9` VALUES ('123', '207', '2', '2', '2', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('124', '208', '2', '2', '4', '2', '5', '2');
INSERT INTO `f_info_9` VALUES ('125', '209', '3', '3', '1', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('126', '210', '1', '1', '4', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('127', '211', '2', '2', '2', '2', '3', '2');
INSERT INTO `f_info_9` VALUES ('128', '212', '2', '2', '2', '2', '5', '1');
INSERT INTO `f_info_9` VALUES ('129', '213', '1', '1', '1', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('130', '214', '1', '1', '3', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('131', '215', '1', '1', '1', '2', '3', '2');
INSERT INTO `f_info_9` VALUES ('132', '216', '2', '2', '4', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('133', '217', '1', '1', '2', '1', '5', '1');
INSERT INTO `f_info_9` VALUES ('134', '218', '2', '2', '4', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('135', '219', '2', '2', '1', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('136', '220', '1', '1', '1', '3', '1', '1');
INSERT INTO `f_info_9` VALUES ('137', '221', '2', '2', '4', '2', '4', '2');
INSERT INTO `f_info_9` VALUES ('138', '222', '2', '2', '1', '1', '2', '2');
INSERT INTO `f_info_9` VALUES ('139', '223', '1', '1', '3', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('140', '224', '2', '2', '2', '3', '2', '1');
INSERT INTO `f_info_9` VALUES ('141', '225', '3', '3', '4', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('142', '226', '1', '1', '3', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('143', '227', '2', '2', '2', '3', '1', '2');
INSERT INTO `f_info_9` VALUES ('144', '228', '2', '2', '2', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('145', '229', '1', '1', '3', '1', '5', '1');
INSERT INTO `f_info_9` VALUES ('146', '230', '2', '2', '4', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('147', '231', '2', '2', '2', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('148', '232', '1', '1', '2', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('149', '233', '3', '3', '1', '1', '2', '2');
INSERT INTO `f_info_9` VALUES ('150', '234', '2', '2', '4', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('151', '235', '1', '1', '2', '2', '2', '1');
INSERT INTO `f_info_9` VALUES ('152', '236', '3', '3', '1', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('153', '237', '1', '1', '4', '1', '1', '1');
INSERT INTO `f_info_9` VALUES ('154', '238', '2', '2', '1', '1', '5', '1');
INSERT INTO `f_info_9` VALUES ('155', '239', '2', '2', '3', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('156', '240', '1', '1', '4', '3', '1', '1');
INSERT INTO `f_info_9` VALUES ('157', '241', '3', '3', '3', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('158', '242', '1', '1', '4', '1', '1', '2');
INSERT INTO `f_info_9` VALUES ('159', '243', '3', '3', '2', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('160', '244', '1', '1', '3', '3', '4', '2');
INSERT INTO `f_info_9` VALUES ('161', '245', '2', '2', '3', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('162', '246', '2', '2', '1', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('163', '247', '1', '1', '2', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('164', '248', '2', '2', '3', '3', '1', '1');
INSERT INTO `f_info_9` VALUES ('165', '249', '3', '3', '1', '3', '1', '1');
INSERT INTO `f_info_9` VALUES ('166', '250', '2', '2', '2', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('167', '251', '1', '1', '4', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('168', '252', '2', '2', '2', '3', '2', '2');
INSERT INTO `f_info_9` VALUES ('169', '253', '3', '3', '2', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('170', '254', '2', '2', '1', '2', '3', '2');
INSERT INTO `f_info_9` VALUES ('171', '255', '1', '1', '1', '1', '5', '2');
INSERT INTO `f_info_9` VALUES ('172', '256', '2', '2', '3', '2', '5', '1');
INSERT INTO `f_info_9` VALUES ('173', '257', '1', '1', '1', '1', '5', '2');
INSERT INTO `f_info_9` VALUES ('174', '258', '2', '2', '1', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('175', '259', '2', '2', '4', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('176', '260', '3', '3', '3', '3', '2', '1');
INSERT INTO `f_info_9` VALUES ('177', '261', '1', '1', '1', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('178', '262', '1', '1', '2', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('179', '263', '1', '1', '1', '2', '2', '1');
INSERT INTO `f_info_9` VALUES ('180', '264', '1', '1', '1', '1', '5', '2');
INSERT INTO `f_info_9` VALUES ('181', '265', '2', '2', '1', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('182', '266', '1', '1', '2', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('183', '267', '3', '3', '3', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('184', '268', '3', '3', '3', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('185', '269', '2', '2', '2', '2', '5', '1');
INSERT INTO `f_info_9` VALUES ('186', '270', '3', '3', '4', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('187', '271', '2', '2', '2', '1', '3', '2');
INSERT INTO `f_info_9` VALUES ('188', '272', '1', '1', '2', '1', '1', '2');
INSERT INTO `f_info_9` VALUES ('189', '273', '2', '2', '4', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('190', '274', '2', '2', '4', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('191', '275', '1', '1', '2', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('192', '276', '2', '2', '2', '1', '3', '1');
INSERT INTO `f_info_9` VALUES ('193', '277', '1', '1', '1', '1', '5', '1');
INSERT INTO `f_info_9` VALUES ('194', '278', '3', '3', '1', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('195', '279', '2', '2', '3', '3', '4', '1');
INSERT INTO `f_info_9` VALUES ('196', '280', '2', '2', '3', '2', '5', '1');
INSERT INTO `f_info_9` VALUES ('197', '281', '3', '3', '4', '2', '5', '2');
INSERT INTO `f_info_9` VALUES ('198', '282', '2', '2', '2', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('199', '283', '2', '2', '3', '2', '2', '2');
INSERT INTO `f_info_9` VALUES ('200', '284', '2', '2', '1', '1', '2', '1');
INSERT INTO `f_info_9` VALUES ('201', '285', '2', '2', '4', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('202', '286', '1', '1', '2', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('203', '287', '2', '2', '3', '1', '3', '1');
INSERT INTO `f_info_9` VALUES ('204', '723', '3', '3', '1', '2', '3', '2');
INSERT INTO `f_info_9` VALUES ('205', '724', '1', '1', '2', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('206', '725', '2', '2', '1', '3', '2', '1');
INSERT INTO `f_info_9` VALUES ('207', '726', '1', '1', '1', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('208', '727', '3', '3', '2', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('209', '728', '1', '1', '3', '3', '4', '2');
INSERT INTO `f_info_9` VALUES ('210', '729', '3', '3', '4', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('211', '730', '1', '1', '3', '2', '4', '1');
INSERT INTO `f_info_9` VALUES ('212', '731', '2', '2', '1', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('213', '732', '3', '3', '4', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('214', '1541', '1', '1', '1', '3', '3', '1');
INSERT INTO `f_info_9` VALUES ('215', '1542', '2', '2', '3', '1', '2', '2');
INSERT INTO `f_info_9` VALUES ('216', '1543', '3', '3', '2', '3', '2', '1');
INSERT INTO `f_info_9` VALUES ('217', '1544', '3', '3', '3', '2', '1', '2');
INSERT INTO `f_info_9` VALUES ('218', '1545', '2', '2', '4', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('219', '1546', '3', '3', '2', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('220', '1547', '1', '1', '1', '3', '1', '2');
INSERT INTO `f_info_9` VALUES ('221', '1548', '1', '1', '1', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('222', '1549', '3', '3', '3', '2', '2', '2');
INSERT INTO `f_info_9` VALUES ('223', '1550', '1', '1', '1', '3', '2', '1');
INSERT INTO `f_info_9` VALUES ('224', '1551', '2', '2', '1', '1', '1', '2');
INSERT INTO `f_info_9` VALUES ('225', '1552', '3', '3', '2', '3', '4', '2');
INSERT INTO `f_info_9` VALUES ('226', '1553', '1', '1', '3', '2', '1', '1');
INSERT INTO `f_info_9` VALUES ('227', '1554', '2', '2', '3', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('228', '1555', '1', '1', '4', '2', '3', '2');
INSERT INTO `f_info_9` VALUES ('229', '1556', '3', '3', '3', '3', '5', '1');
INSERT INTO `f_info_9` VALUES ('230', '1557', '1', '1', '4', '3', '3', '2');
INSERT INTO `f_info_9` VALUES ('231', '1558', '1', '1', '1', '1', '2', '2');
INSERT INTO `f_info_9` VALUES ('232', '1559', '1', '1', '1', '3', '1', '2');
INSERT INTO `f_info_9` VALUES ('233', '1560', '3', '3', '4', '1', '5', '2');
INSERT INTO `f_info_9` VALUES ('234', '1561', '2', '2', '1', '1', '4', '1');
INSERT INTO `f_info_9` VALUES ('235', '1562', '3', '3', '4', '1', '2', '2');
INSERT INTO `f_info_9` VALUES ('236', '1563', '3', '3', '1', '1', '4', '2');
INSERT INTO `f_info_9` VALUES ('237', '1564', '3', '3', '3', '3', '5', '2');
INSERT INTO `f_info_9` VALUES ('238', '1565', '3', '3', '2', '1', '5', '1');
INSERT INTO `f_info_9` VALUES ('239', '1566', '3', '3', '2', '3', '4', '1');
INSERT INTO `f_info_9` VALUES ('240', '1567', '3', '3', '3', '2', '3', '1');
INSERT INTO `f_info_9` VALUES ('241', '1569', '2', '1', '3', '3', '5', '1');

-- ----------------------------
-- Table structure for `f_info_photos`
-- ----------------------------
DROP TABLE IF EXISTS `f_info_photos`;
CREATE TABLE `f_info_photos` (
  `userid` int(11) NOT NULL default '0',
  `title` char(100) default NULL,
  `path` char(255) NOT NULL,
  `infoid` int(11) NOT NULL default '0',
  `dateline` int(11) NOT NULL default '0',
  `sort` int(11) NOT NULL default '0',
  `flag` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_info_photos
-- ----------------------------
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091416925102_100X75.jpg', '48', '1270914826', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091425013359_100X75.jpg', '48', '1270914826', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091475114908_100X75.jpg', '48', '1270914826', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091481817349_100X75.jpg', '48', '1270914826', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_12709155454378_100X75.jpg', '50', '1270915565', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091555425675_100X75.jpg', '50', '1270915565', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091556215912_100X75.jpg', '50', '1270915565', '0', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/201304/6_127131317610180_100X75.jpg', '78', '1271554811', '0', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/201304/6_127131317922189_100X75.jpg', '78', '1271554811', '0', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/201304/5_127131353922255_100X75.jpg', '79', '1271313595', '0', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/201304/5_12713135421532_100X75.jpg', '79', '1271313595', '0', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/201304/5_12713135461157_100X75.jpg', '79', '1271313595', '0', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/201304/5_12713135648922_100X75.jpg', '79', '1271313595', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138387501321789_100X75.jpg', '1587', '1384055370', '1', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138387501023028_100X75.jpg', '1587', '1384055370', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138386128831349_100X75.jpg', '1586', '1384158314', '2', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_1271314611649_100X75.jpg', '82', '1271314706', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127131463911818_100X75.jpg', '82', '1271314706', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_12713146151690_100X75.jpg', '82', '1271314706', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_12713146459243_100X75.jpg', '82', '1271314706', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127131496628584_100X75.jpg', '83', '1272073320', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127131497027329_100X75.jpg', '83', '1272073320', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127131497429286_100X75.jpg', '83', '1272073320', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127131496327595_100X75.jpg', '83', '1272073320', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127131546625306_100X75.jpg', '84', '1272073149', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_12713158856405_100X75.jpg', '85', '1271555303', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127131588823898_100X75.jpg', '85', '1271555303', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127131589223435_100X75.jpg', '85', '1271555303', '0', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_138300979311879_100X75.jpg', '1585', '1383624260', '4', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_138300912510197_100X75.jpg', '1584', '1384330585', '2', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_138300912525740_100X75.jpg', '1584', '1384330585', '1', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_138300912421951_100X75.jpg', '1584', '1384330585', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/6_12707392438551_100X75.jpg', '42', '1270893073', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/6_127073925419220_100X75.jpg', '42', '1270893073', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/6_127073925916317_100X75.jpg', '42', '1270893073', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/6_127073926327058_100X75.jpg', '42', '1270893073', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091145314158_100X75.jpg', '43', '1270911521', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_1270911458111_100X75.jpg', '43', '1270911521', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_12709120484480_100X75.jpg', '44', '1270912091', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091298426921_100X75.jpg', '46', '1270913093', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091301229870_100X75.jpg', '46', '1270913093', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_127091304125167_100X75.jpg', '46', '1270913093', '0', '0');
INSERT INTO `f_info_photos` VALUES ('1', null, '/uploads/201304/5_12709130607644_100X75.jpg', '46', '1270913093', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138385648832453_100X75.jpg', '1586', '1384158314', '1', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_1383856488316_100X75.jpg', '1586', '1384158314', '0', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_1383009793550_100X75.jpg', '1585', '1383624260', '3', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_138300979124961_100X75.jpg', '1585', '1383624260', '2', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_13830097912408_100X75.jpg', '1585', '1383624260', '1', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_138300978821643_100X75.jpg', '1585', '1383624260', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201310/3_13830086406998_100X75.jpg', '24', '1387081374', '3', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201310/3_138300864024945_100X75.jpg', '24', '1387081374', '2', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201310/3_138300864021272_100X75.jpg', '24', '1387081374', '1', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201310/3_138300863930459_100X75.jpg', '24', '1387081374', '0', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_13830081964957_100X75.jpg', '81', '1383008201', '3', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_138292620631046_100X75.jpg', '81', '1383008201', '2', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_138292620616673_100X75.jpg', '81', '1383008201', '1', '0');
INSERT INTO `f_info_photos` VALUES ('4', null, '/uploads/info/201310/4_13829262049096_100X75.jpg', '81', '1383008201', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138405580114014_100X75.jpg', '1588', '1384055843', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138405580225375_100X75.jpg', '1588', '1384055843', '1', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138413820018978_100X75.gif', '1589', '1384138207', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_13841415731718_100X75.jpg', '1590', '1384138788', '1', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138414157124145_100X75.jpg', '1590', '1384138788', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/13841586265890_100X75.gif', '1594', '1386220441', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_13841639808631_100X75.jpg', '1596', '1384164027', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138416398219748_100X75.jpg', '1596', '1384164027', '1', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138416454421694_100X75.jpg', '1597', '1384164687', '2', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_138416454432633_100X75.jpg', '1597', '1384164687', '1', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201311/3_13841645421088_100X75.jpg', '1597', '1384164687', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201312/3_138736324820195_100X75.jpg', '1599', '1387363252', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201312/3_138736340624334_100X75.jpg', '1600', '1387363453', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201312/3_138736340927951_100X75.jpg', '1600', '1387363453', '1', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201312/3_138736365718741_100X75.jpg', '1601', '1387363718', '0', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201312/3_1387363658458_100X75.jpg', '1601', '1387363718', '1', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201312/3_138736365832571_100X75.jpg', '1601', '1387363718', '2', '0');
INSERT INTO `f_info_photos` VALUES ('3', null, '/uploads/info/201312/3_138736365822104_100X75.jpg', '1601', '1387363718', '3', '0');

-- ----------------------------
-- Table structure for `f_message`
-- ----------------------------
DROP TABLE IF EXISTS `f_message`;
CREATE TABLE `f_message` (
  `msgid` int(10) unsigned NOT NULL auto_increment,
  `fromuid` mediumint(8) unsigned NOT NULL default '0',
  `touid` mediumint(8) unsigned NOT NULL default '0',
  `folder` enum('all','inbox','outbox') NOT NULL default 'all',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `subject` char(80) NOT NULL default '',
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msgid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_message
-- ----------------------------
INSERT INTO `f_message` VALUES ('15', '1', '2', 'all', '1', '1367123819', '媒体：中印军队“帐篷对峙”已十日仍未好转', '安倍晋三又放出两句狠话。一是他在23日说，“向钓鱼岛派驻公务员或建造港口等各种选择时常在我的脑海中”。二是他24日谈到参拜靖国神社时说：“我阁僚不会向任何威胁屈服。”值得注意的是，这名中国人眼里满口好斗语言、缺少起码稳健的日本首相，目前在选民中享有70%以上罕见高支持率。', '0');
INSERT INTO `f_message` VALUES ('18', '1', '1', 'inbox', '0', '1367193699', '', '测试短信功能', '15');
INSERT INTO `f_message` VALUES ('19', '1', '1', 'inbox', '0', '1367193981', '', '呵呵，不错，支持！', '15');
INSERT INTO `f_message` VALUES ('16', '2', '2', 'inbox', '1', '1367123819', '', '回复测试一下', '15');
INSERT INTO `f_message` VALUES ('17', '1', '2', 'inbox', '1', '1367123819', '', '很好，很不错', '15');

-- ----------------------------
-- Table structure for `f_models`
-- ----------------------------
DROP TABLE IF EXISTS `f_models`;
CREATE TABLE `f_models` (
  `mid` smallint(6) unsigned NOT NULL auto_increment,
  `title` varchar(20) character set utf8 NOT NULL,
  `sort` tinyint(3) NOT NULL default '0',
  `fields` char(255) NOT NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of f_models
-- ----------------------------
INSERT INTO `f_models` VALUES ('1', '同城活动模型', '7', '182,173,183');
INSERT INTO `f_models` VALUES ('2', '住房出租模型', '2', '81,90,38,141,60,59,37,31,36,114,176,173,34,39');
INSERT INTO `f_models` VALUES ('3', '住房出售模型', '3', '81,90,38,60,59,37,31,36,173,95,171,34,39');
INSERT INTO `f_models` VALUES ('4', '房产求租/求购模型', '4', '179,94,99,181,180,177');
INSERT INTO `f_models` VALUES ('5', '写字楼/店面/仓库/厂房模型', '5', '81,166,31,92,175,173,39');
INSERT INTO `f_models` VALUES ('6', '其它房屋类型', '6', '173,39');
INSERT INTO `f_models` VALUES ('7', '跳蚤市场模型', '7', '111,93,166,172,175,173');
INSERT INTO `f_models` VALUES ('8', '教育培训模型', '8', '185,187,186,173');
INSERT INTO `f_models` VALUES ('9', '企业招聘模型', '9', '154,190,189,153,173,188');
INSERT INTO `f_models` VALUES ('10', '交友征婚模型', '10', '169,161,164,165,163,173,162,168');
INSERT INTO `f_models` VALUES ('11', '生活/商务服务模型', '11', '182,173');
INSERT INTO `f_models` VALUES ('12', '车辆信息模型', '7', '111,93,166,174,175,173');
INSERT INTO `f_models` VALUES ('13', '个人求职模型', '9', '196,161,184,193,195,194,162,191,192');
INSERT INTO `f_models` VALUES ('14', '服务模型', '8', '93,175,173');
INSERT INTO `f_models` VALUES ('15', '车辆信息模型2', '7', '111,166,173');
INSERT INTO `f_models` VALUES ('16', '车辆信息模型3', '7', '111,93,166,175,197,173');
INSERT INTO `f_models` VALUES ('17', '车辆信息模型4', '0', '202,201,199,93,166,206,95,198,173,207,200');
INSERT INTO `f_models` VALUES ('18', '车辆信息模型5', '0', '203,173');
INSERT INTO `f_models` VALUES ('19', '车辆信息模型6', '0', '174,175,173');
INSERT INTO `f_models` VALUES ('20', '宠物赠送模型', '0', '173');

-- ----------------------------
-- Table structure for `f_options`
-- ----------------------------
DROP TABLE IF EXISTS `f_options`;
CREATE TABLE `f_options` (
  `oid` int(10) unsigned NOT NULL auto_increment,
  `fid` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  `options` char(255) default NULL,
  PRIMARY KEY  (`oid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_options
-- ----------------------------
INSERT INTO `f_options` VALUES ('1', '174', '165', '1=组装机\r\n2=品牌机\r\n3=其它');
INSERT INTO `f_options` VALUES ('2', '174', '166', '1=惠普\r\n2=戴尔\r\n3=联想\r\n4=IBM\r\n5=三星\r\n6=宏基\r\n7=索尼\r\n8=东芝\r\n9=苹果\r\n10=富士通\r\n11=华硕\r\n12=神舟\r\n13=清华同方\r\n14=其它');
INSERT INTO `f_options` VALUES ('3', '174', '169', '1=移动硬盘\r\n2=路由器\r\n3=耳麦\r\n4=摄像头\r\n5=音响/音箱\r\n6=U盘\r\n7=键盘/鼠标\r\n8=其它');
INSERT INTO `f_options` VALUES ('4', '174', '292', '1=汽车维修\r\n2=汽车检测');
INSERT INTO `f_options` VALUES ('5', '174', '293', '1=汽车装饰\r\n2=洗车\r\n3=汽车打蜡\r\n4=汽车烤漆\r\n5=汽车美容');
INSERT INTO `f_options` VALUES ('6', '174', '295', '1=汽车保险\r\n2=汽车理赔\r\n3=代办过户');

-- ----------------------------
-- Table structure for `f_report`
-- ----------------------------
DROP TABLE IF EXISTS `f_report`;
CREATE TABLE `f_report` (
  `id` int(8) NOT NULL auto_increment,
  `infoid` int(8) NOT NULL default '0',
  `title` varchar(50) NOT NULL,
  `type` int(11) NOT NULL default '0',
  `content` varchar(255) NOT NULL,
  `dateline` int(11) NOT NULL,
  `fromname` varchar(20) default NULL,
  `mobile` varchar(20) default NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_report
-- ----------------------------
INSERT INTO `f_report` VALUES ('8', '9', '博物馆北临4楼 68平方 2室1厅 600元半年一交', '1', '', '1261820295', null, null, '127.0.0.1');
INSERT INTO `f_report` VALUES ('7', '9', '博物馆北临4楼 68平方 2室1厅 600元半年一交', '1', '', '1261649071', null, null, '127.0.0.1');
INSERT INTO `f_report` VALUES ('6', '21', '17寸液晶台式电脑出售', '1', '', '1260857395', null, null, '127.0.0.1');
INSERT INTO `f_report` VALUES ('9', '21', '17寸液晶台式电脑出售', '1', '', '1261977130', null, null, '127.0.0.1');
INSERT INTO `f_report` VALUES ('10', '1568', '出让各种大小排量跑车', '1', '', '1277620809', null, null, '127.0.0.1');
INSERT INTO `f_report` VALUES ('11', '81', '自用9.999新魅族M8,出手了,上图了', '1', '', '1378009047', null, null, '127.0.0.2');
INSERT INTO `f_report` VALUES ('12', '1575', '冠亚星城北门附近出租高档房屋', '1', '虚假信息', '1381376246', 'tgw2000', '15006570631', '127.0.0.60');

-- ----------------------------
-- Table structure for `f_user`
-- ----------------------------
DROP TABLE IF EXISTS `f_user`;
CREATE TABLE `f_user` (
  `userid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) NOT NULL default '0' COMMENT 'ucenter中用户id',
  `username` varchar(20) NOT NULL,
  `userpwd` varchar(50) NOT NULL,
  `email` varchar(50) default NULL,
  `avatar` varchar(50) default NULL,
  `mobile` varchar(20) default NULL,
  `qq` varchar(20) default NULL,
  `disabled` int(10) default '0' COMMENT '0正常，1禁用',
  `email_flag` int(10) default '0' COMMENT '0没有验证，1表示已经验证',
  `usercard` text,
  `type` int(10) default '0' COMMENT '0:个人帐号,1:企业帐号',
  `regtime` int(10) default NULL,
  `lastlogintime` int(10) default '0',
  `lastloginip` varchar(20) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_user
-- ----------------------------
INSERT INTO `f_user` VALUES ('3', '1', 'tgw2000', '5a0125f57141596d9c2bb22ea692b21f', 'tgw2000@126.com', '', '15006570631', '120885811', '0', '1', '', '0', '1380943830', '1390290052', '127.0.0.60');
INSERT INTO `f_user` VALUES ('4', '2', 'tgw2001', '112b37ff282a9e41b4fb187f1a8d7f15', 'tgw2000@163.com', null, '15006570637', '120885811', '0', '0', '', '0', '1381023440', '1384330809', '127.0.0.60');
INSERT INTO `f_user` VALUES ('6', '2', 'tgw2002', '112b37ff282a9e41b4fb187f1a8d7f15', 'tgw2000@163.com', null, null, null, '0', '0', null, '0', '1381896730', '1381896730', '127.0.0.60');
INSERT INTO `f_user` VALUES ('5', '7', '可爱多', '112b37ff282a9e41b4fb187f1a8d7f15', 'tgw2000@163.com', null, null, null, '0', '0', null, '0', '1381743676', '1381920327', '127.0.0.60');
INSERT INTO `f_user` VALUES ('7', '16', '哈西阳', '112b37ff282a9e41b4fb187f1a8d7f15', 'tgw2000@163.com', null, null, null, '0', '0', null, '0', '1382187915', '1382187915', '127.0.0.60');
