/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : fenlei

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2014-02-09 04:15:27
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
INSERT INTO `f_category` VALUES ('585', '培训师/讲师', 'jiangshi', 'a:3:{s:4:\"list\";s:0:\"\";s:4:\"view\";s:0:\"\";s:4:\"post\";s:0:\"\";}', null, null, '52', '9', '7,8', '0'