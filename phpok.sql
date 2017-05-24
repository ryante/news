/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : phpok

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2017-05-24 20:01:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pk_adm
-- ----------------------------
DROP TABLE IF EXISTS `pk_adm`;
CREATE TABLE `pk_adm` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID，系统自增',
  `account` varchar(50) NOT NULL COMMENT '管理员账号',
  `pass` varchar(100) NOT NULL COMMENT '管理员密码',
  `email` varchar(50) NOT NULL COMMENT '管理员邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核1正常2管理员锁定',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统管理员',
  `vpass` varchar(50) NOT NULL COMMENT '二次验证密码，两次MD5加密',
  `fullname` varchar(100) NOT NULL COMMENT '姓名',
  `close_tip` varchar(255) NOT NULL COMMENT '关闭窗口前弹出的提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员信息';

-- ----------------------------
-- Records of pk_adm
-- ----------------------------
INSERT INTO `pk_adm` VALUES ('1', 'admin', '3dcbd5e080b63ed9c631d35a5f95fc14:47', 'admin', '1', '1', '', '', '');

-- ----------------------------
-- Table structure for pk_adm_popedom
-- ----------------------------
DROP TABLE IF EXISTS `pk_adm_popedom`;
CREATE TABLE `pk_adm_popedom` (
  `id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '权限ID，对应popedom表里的id',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员权限分配表';

-- ----------------------------
-- Records of pk_adm_popedom
-- ----------------------------

-- ----------------------------
-- Table structure for pk_all
-- ----------------------------
DROP TABLE IF EXISTS `pk_all`;
CREATE TABLE `pk_all` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `identifier` varchar(100) NOT NULL COMMENT '标识串',
  `title` varchar(200) NOT NULL COMMENT '分类名称',
  `ico` varchar(255) NOT NULL COMMENT '图标',
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通１系统',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否前台调用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='分类管理';

-- ----------------------------
-- Records of pk_all
-- ----------------------------
INSERT INTO `pk_all` VALUES ('4', '1', 'about_web', '网站相关', 'images/ico/copyright.png', '0', '1');
INSERT INTO `pk_all` VALUES ('115', '1', 'about_us', '我们相关', 'images/ico/applications.png', '0', '1');

-- ----------------------------
-- Table structure for pk_attr
-- ----------------------------
DROP TABLE IF EXISTS `pk_attr`;
CREATE TABLE `pk_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `title` varchar(100) NOT NULL COMMENT '属性名称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='产品属性';

-- ----------------------------
-- Records of pk_attr
-- ----------------------------
INSERT INTO `pk_attr` VALUES ('1', '1', '颜色', '10');
INSERT INTO `pk_attr` VALUES ('3', '1', '尺码', '20');
INSERT INTO `pk_attr` VALUES ('8', '1', '版本', '30');

-- ----------------------------
-- Table structure for pk_attr_values
-- ----------------------------
DROP TABLE IF EXISTS `pk_attr_values`;
CREATE TABLE `pk_attr_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '属性ID',
  `title` varchar(200) NOT NULL COMMENT '参数名称',
  `pic` varchar(200) NOT NULL COMMENT '参数图片',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `val` varchar(255) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='属性参数管理';

-- ----------------------------
-- Records of pk_attr_values
-- ----------------------------
INSERT INTO `pk_attr_values` VALUES ('1', '1', '红色', '', '10', 'red');
INSERT INTO `pk_attr_values` VALUES ('3', '1', '绿色', '', '20', 'green');
INSERT INTO `pk_attr_values` VALUES ('4', '1', '蓝色', '', '30', 'blue');
INSERT INTO `pk_attr_values` VALUES ('5', '1', '黑色', '', '40', 'black');
INSERT INTO `pk_attr_values` VALUES ('6', '1', '白色', '', '50', 'white');
INSERT INTO `pk_attr_values` VALUES ('7', '3', 'M', '', '10', '');
INSERT INTO `pk_attr_values` VALUES ('8', '3', 'L', '', '20', '');
INSERT INTO `pk_attr_values` VALUES ('9', '3', 'XL', '', '30', '');
INSERT INTO `pk_attr_values` VALUES ('10', '3', 'XXL', '', '40', '');
INSERT INTO `pk_attr_values` VALUES ('29', '8', '标准版(3G RAM+32G ROM)标配', '', '10', '2499');
INSERT INTO `pk_attr_values` VALUES ('30', '8', '标准版(3G RAM+32G ROM)套装', '', '20', '2549');
INSERT INTO `pk_attr_values` VALUES ('31', '8', '高配版(3G RAM+64G ROM)标配', '', '30', '3199');
INSERT INTO `pk_attr_values` VALUES ('32', '8', '高配版(3G RAM+64G ROM)套装', '', '40', '3249');
INSERT INTO `pk_attr_values` VALUES ('33', '1', '金色', '', '60', 'gold');
INSERT INTO `pk_attr_values` VALUES ('34', '8', '16G ROM', '', '50', 'MZ16G');
INSERT INTO `pk_attr_values` VALUES ('35', '8', '32G ROM', '', '60', 'MZ32G');
INSERT INTO `pk_attr_values` VALUES ('36', '1', '灰色', '', '70', 'gray');
INSERT INTO `pk_attr_values` VALUES ('37', '8', '64G ROM', '', '70', '64G');

-- ----------------------------
-- Table structure for pk_cart
-- ----------------------------
DROP TABLE IF EXISTS `pk_cart`;
CREATE TABLE `pk_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `session_id` varchar(255) NOT NULL COMMENT 'SESSION_ID号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示游客',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of pk_cart
-- ----------------------------
INSERT INTO `pk_cart` VALUES ('251', 'ijl165dghg45f3nrhmqbf5gv17', '0', '1495526148');

-- ----------------------------
-- Table structure for pk_cart_product
-- ----------------------------
DROP TABLE IF EXISTS `pk_cart_product`;
CREATE TABLE `pk_cart_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `cart_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购物车ID号',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `title` varchar(255) NOT NULL COMMENT '产品名称',
  `price` float NOT NULL COMMENT '产品单价',
  `qty` int(11) NOT NULL DEFAULT '0' COMMENT '产品数量',
  `ext` text NOT NULL COMMENT '扩展属性',
  `weight` float unsigned NOT NULL DEFAULT '0' COMMENT '重量',
  `volume` float unsigned NOT NULL DEFAULT '0' COMMENT '体积',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `is_virtual` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0实物1虚拟或服务',
  `unit` varchar(50) NOT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车里的产品信息';

-- ----------------------------
-- Records of pk_cart_product
-- ----------------------------

-- ----------------------------
-- Table structure for pk_cate
-- ----------------------------
DROP TABLE IF EXISTS `pk_cate`;
CREATE TABLE `pk_cate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID，0为根分类',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1正常使用',
  `title` varchar(200) NOT NULL COMMENT '分类名称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '分类排序，值越小越往前靠',
  `tpl_list` varchar(255) NOT NULL COMMENT '列表模板',
  `tpl_content` varchar(255) NOT NULL COMMENT '内容模板',
  `psize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '列表每页数量',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `identifier` varchar(255) NOT NULL COMMENT '分类标识串',
  `tag` varchar(255) NOT NULL COMMENT '自身Tag设置',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `site_id` (`site_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=593 DEFAULT CHARSET=utf8 COMMENT='分类管理';

-- ----------------------------
-- Records of pk_cate
-- ----------------------------
INSERT INTO `pk_cate` VALUES ('8', '1', '7', '1', '极客早知道', '10', '', '', '0', '', '', '', 'jikezaozhidao', '公司 新闻');
INSERT INTO `pk_cate` VALUES ('7', '1', '0', '1', '资讯', '10', '', '', '0', '', '', '', 'information', '');
INSERT INTO `pk_cate` VALUES ('68', '1', '7', '1', '产品观察', '25', '', '', '0', '', '', '', 'chanpinguancha', '');
INSERT INTO `pk_cate` VALUES ('592', '1', '7', '1', '极客之选', '30', '', '', '0', '', '', '', 'jikezhixuan', '');

-- ----------------------------
-- Table structure for pk_collection_files
-- ----------------------------
DROP TABLE IF EXISTS `pk_collection_files`;
CREATE TABLE `pk_collection_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '采集项目ID',
  `lid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `fid` int(10) unsigned NOT NULL COMMENT '标签ID',
  `ext` varchar(10) NOT NULL COMMENT '扩展',
  `srcurl` varchar(255) NOT NULL COMMENT '原src文件地址',
  `newurl` varchar(255) NOT NULL COMMENT '新图片地址',
  PRIMARY KEY (`id`),
  KEY `lid` (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pk_collection_files
-- ----------------------------

-- ----------------------------
-- Table structure for pk_collection_format
-- ----------------------------
DROP TABLE IF EXISTS `pk_collection_format`;
CREATE TABLE `pk_collection_format` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `lid` mediumint(9) NOT NULL COMMENT '采集的ID',
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签ID',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `lid` (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pk_collection_format
-- ----------------------------

-- ----------------------------
-- Table structure for pk_collection_list
-- ----------------------------
DROP TABLE IF EXISTS `pk_collection_list`;
CREATE TABLE `pk_collection_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` mediumint(8) unsigned NOT NULL COMMENT '采集器ID',
  `url` varchar(255) NOT NULL COMMENT '网址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未采集1已采集2已发布',
  `postdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pk_collection_list
-- ----------------------------

-- ----------------------------
-- Table structure for pk_collection_tags
-- ----------------------------
DROP TABLE IF EXISTS `pk_collection_tags`;
CREATE TABLE `pk_collection_tags` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cid` mediumint(8) unsigned NOT NULL COMMENT '采集器ID',
  `title` varchar(200) NOT NULL COMMENT '字段主题',
  `identifier` varchar(100) NOT NULL COMMENT '字段名',
  `tags_type` enum('var','string') NOT NULL DEFAULT 'var' COMMENT '字段类型',
  `rules` varchar(255) NOT NULL COMMENT '固定字符',
  `rules_start` varchar(255) NOT NULL COMMENT '采集内容开始标范围',
  `rules_end` varchar(255) NOT NULL COMMENT '采集内容结束',
  `del` text NOT NULL COMMENT '删除文字，任意值用(*)表示，一行一条规则',
  `del_url` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '删除网址',
  `del_html` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除HTML，级别最高，如果设为1，所有HTML代码将被去除',
  `del_font` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '清除font信息',
  `del_table` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '清除table信息',
  `del_span` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '清除span信息',
  `del_bold` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '清除加粗信息',
  `suburl_start` varchar(255) NOT NULL COMMENT '内容分页开始',
  `suburl_end` varchar(255) NOT NULL COMMENT '内容分页结束',
  `post_save` enum('safe','html','int','float','datetime','img') NOT NULL DEFAULT 'safe' COMMENT '发布格式化',
  `translate` varchar(100) NOT NULL DEFAULT '0' COMMENT '翻译',
  `re1` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不保留原文1保留原文',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pk_collection_tags
-- ----------------------------
INSERT INTO `pk_collection_tags` VALUES ('1', '1', '主题', 'title', 'var', '', '<title>', '</title>', '', '1', '1', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('2', '1', '发布时间', 'dateline', 'var', '', '', '', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('3', '1', '状态', 'status', 'string', '1', '', '', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('4', '1', '隐藏', 'hidden', 'string', '0', '', '', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('5', '1', '查看次数', 'hits', 'var', '', '', '', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('6', '1', 'SEO标题', 'seo_title', 'var', '', '', '', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('7', '1', 'SEO关键字', 'seo_keywords', 'var', '', '', '', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('8', '1', 'SEO描述', 'seo_desc', 'var', '', '', '', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('9', '1', 'Tag标签', 'tag', 'var', '', '', '', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('10', '1', 'integral', 'integral', 'var', '', '', '', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('11', '1', '缩略图', 'thumb', 'var', '', '<div>', '</div>', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('12', '1', '摘要', 'note', 'var', '', '<div>', '</div>', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');
INSERT INTO `pk_collection_tags` VALUES ('13', '1', '内容', 'content', 'var', '', '<div>', '</div>', '', '1', '0', '1', '1', '0', '0', '', '', 'safe', '0', '0');

-- ----------------------------
-- Table structure for pk_currency
-- ----------------------------
DROP TABLE IF EXISTS `pk_currency`;
CREATE TABLE `pk_currency` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '货币ID',
  `code` varchar(3) NOT NULL COMMENT '货币标识，仅限三位数的大写字母',
  `val` float(13,8) unsigned NOT NULL COMMENT '货币转化',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `title` varchar(50) NOT NULL COMMENT '名称',
  `symbol_left` varchar(24) NOT NULL COMMENT '价格左侧',
  `symbol_right` varchar(24) NOT NULL COMMENT '价格右侧',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不隐藏1隐藏',
  `code_num` varchar(5) NOT NULL COMMENT '币种数值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='货币管理';

-- ----------------------------
-- Records of pk_currency
-- ----------------------------
INSERT INTO `pk_currency` VALUES ('1', 'CNY', '6.16989994', '10', '人民币', '', '元', '1', '0', '165');
INSERT INTO `pk_currency` VALUES ('2', 'USD', '1.00000000', '20', '美金', 'US$', '', '1', '0', '840');
INSERT INTO `pk_currency` VALUES ('3', 'HKD', '7.76350021', '30', '港元', 'HK$', '', '1', '0', '344');
INSERT INTO `pk_currency` VALUES ('4', 'EUR', '0.76639998', '40', '欧元', 'EUR', '', '1', '0', '978');
INSERT INTO `pk_currency` VALUES ('5', 'GBP', '0.64529997', '50', '英镑', '￡', '', '1', '0', '826');
INSERT INTO `pk_currency` VALUES ('7', 'AUD', '1.00000000', '60', '澳币', 'A$', '', '1', '0', '036');

-- ----------------------------
-- Table structure for pk_email
-- ----------------------------
DROP TABLE IF EXISTS `pk_email`;
CREATE TABLE `pk_email` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID，0表示全部网站',
  `identifier` varchar(255) NOT NULL COMMENT '发送标识',
  `title` varchar(200) NOT NULL COMMENT '邮件主题',
  `content` text NOT NULL COMMENT '邮件内容',
  `note` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='邮件内容';

-- ----------------------------
-- Records of pk_email
-- ----------------------------
INSERT INTO `pk_email` VALUES ('4', '1', 'register_code', '获取会员注册资格', '<p>您好，{$email}</p><p>您将注册成为网站【{$config.title} 】会员，请点击下面的地址，进入下一步注册：</p><p><br/></p><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><p><a href=\"{$link}\" target=\"_blank\">{$link}</a></p><p>（此链接24小时内有效）</p></blockquote><p><br/></p><p><br/></p><p>感谢您对本站的关注，茫茫人海中，能有缘走到一起。</p>', '');
INSERT INTO `pk_email` VALUES ('5', '1', 'getpass', '取回密码操作', '<p>您好，{$user.account}</p><p>您执行了忘记密码操作功能，请点击下面的链接执行下一步：</p><p><br /></p><p><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><p><a href=\"{$link}\" target=\"_blank\">{$link}</a></p></blockquote><br /></p><p>感谢您对本站的支持，有什么问题您在登录后可以咨询我们的客服。</p>', '');
INSERT INTO `pk_email` VALUES ('6', '1', 'project_save', '主题添加通知', '<p>您好，管理员</p><blockquote><p>您的网站（<a href=\"http://{$sys.url}\" target=\"_self\">{$sys.url}</a>）新增了一篇主题，下述是主题的基本信息：<br/></p><p>主题名称：{$rs.title}</p><p>项目类型：{$page_rs.title}</p><p><br/></p><p>请登录网站查询</p></blockquote>', '');
INSERT INTO `pk_email` VALUES ('7', '1', 'order_admin', '网站有新订单【{$order.sn}】', '<p>您好，管理员</p><blockquote><p>您的网站：{$sys.url} 收到一份新的订单，订单号是：{$order.sn}，请登录网站后台进行核验。</p></blockquote>', '');
INSERT INTO `pk_email` VALUES ('8', '1', 'user_order_create', '我们已收到您的订单【{$order.sn}】，欢迎您随时关注订单状态', '<p><strong>尊敬的{$fullname}，您好：</strong><br/></p><p><br/></p><p>感谢您在<span style=\"color: rgb(0, 112, 192);\">{$config.title}</span>（{$sys.url}）购物。</p><p>我们已经收到您的订单<span style=\"color: rgb(0, 112, 192);\">{$order.sn}</span>，建议您选择<span style=\"color: rgb(0, 112, 192);\">在线支付</span>的支付配送方式。订单信息以个人中心里的“<span style=\"color: rgb(0, 112, 192);\"><strong>我的订单</strong></span>”信息为准，您也可以随时进入订单详细进行查看修改等操作。</p><p><br/></p><p><strong>重要说明：</strong></p><p>本邮件仅表明销售方已收到了您提交的订单；销售方收到你的订单信息后，只有在销售方将您的订单中订购的商品从仓库实际直接向您发出时（以商品出库为标志），方视为您与销售方之间就实际直接向您发出的商品建立了合同关系；<br/>如果您在一份订单里订购了多种商品并且销售方只给您发出了部分商品时，您与销售方之间仅就实际直接向您发出的商品建立了合同关系；只有在销售方实际直接向您发出了订单中订购的其他商品时，您和销售方之间就订单中该其他已实际直接向您发出的商品建立了合同关系。<br/>您可以随时登陆您在京东注册的账户，查询您的订单状态。更多内容请见最新的京东网站用户注册协议及京东网站各类购物规则，我们建议您不时地浏览阅读。</p><p><br/></p><p><strong>账户安全提醒：</strong><br/>互联网账号存在被盗风险，为了保障您的账号及资金安全，我们提醒您访问 我的账户- &gt; 修改密码，尽量使用复杂密码，如字母+数字+特殊符号等。</p>', '');
INSERT INTO `pk_email` VALUES ('9', '1', 'sms_order_create', '会员下单成功后，短信通知', '<p>您的订单：{$order.sn} 已成功提交，请您及时完成支付操作。超过24小时未支付订单将会自动删除。感谢您对我们的支持！</p>', '');
INSERT INTO `pk_email` VALUES ('10', '1', 'order_user_paid', '您的订单【{$order.sn}】已支付成功', '<p><strong>尊敬的{$fullname}，您好：</strong></p><p style=\"white-space: normal;\">感谢您在<span style=\"color: rgb(0, 112, 192);\">{$config.title}</span>（{$sys.url}）购物。</p><p style=\"white-space: normal;\">您的订单<span style=\"color: rgb(0, 112, 192);\">{$order.sn}</span>已成功支付，请耐心等候，我们管理员正在核验付款信息。</p><p style=\"white-space: normal;\">订单信息以个人中心里的“<span style=\"color: rgb(0, 112, 192);\"><strong>我的订单</strong></span>”信息为准，您也可以随时进入订单详细进行查看修改等操作。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>重要说明：</strong></p><p style=\"white-space: normal;\">本邮件仅表明销售方已收到了您提交的订单；销售方收到你的订单信息后，只有在销售方将您的订单中订购的商品从仓库实际直接向您发出时（以商品出库为标志），方视为您与销售方之间就实际直接向您发出的商品建立了合同关系；<br/>如果您在一份订单里订购了多种商品并且销售方只给您发出了部分商品时，您与销售方之间仅就实际直接向您发出的商品建立了合同关系；只有在销售方实际直接向您发出了订单中订购的其他商品时，您和销售方之间就订单中该其他已实际直接向您发出的商品建立了合同关系。<br/>您可以随时登陆您在京东注册的账户，查询您的订单状态。更多内容请见最新的京东网站用户注册协议及京东网站各类购物规则，我们建议您不时地浏览阅读。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>账户安全提醒：</strong><br/>互联网账号存在被盗风险，为了保障您的账号及资金安全，我们提醒您访问 我的账户- &gt; 修改密码，尽量使用复杂密码，如字母+数字+特殊符号等。</p><p><br/></p>', '');
INSERT INTO `pk_email` VALUES ('11', '1', 'order_admin_paid', '客户{$user.user}订单【{$orser.sn}】付款成功', '<p>您好，管理员，请登录网站后台 {$sys.url} 核验订单【{$orser.sn}】支付是否成功</p>', '');
INSERT INTO `pk_email` VALUES ('12', '1', 'sms_order_paid', '订单付款成功后的通知', '<p>您的订单：{$order.sn} 已成功付款，我们正在核验中，请耐心等候！</p>', '');
INSERT INTO `pk_email` VALUES ('13', '1', 'order_user_shipped', '您的订单【{$order.sn}】已发货', '<p style=\"white-space: normal;\"><strong>尊敬的{$fullname}，您好：</strong><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">感谢您在<span style=\"color: rgb(0, 112, 192);\">{$config.title}</span>（{$sys.url}）购物。</p><p style=\"white-space: normal;\">您的订单<span style=\"color: rgb(0, 112, 192);\">{$order.sn}</span>已经发货，请保持您的电话畅通，以方便快递人员能与您取得联系。</p><p style=\"white-space: normal;\">订单信息以个人中心里的“<span style=\"color: rgb(0, 112, 192);\"><strong>我的订单</strong></span>”信息为准，您也可以随时进入订单详细进行查看修改等操作。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>重要说明：</strong></p><p style=\"white-space: normal;\">本邮件仅表明销售方已收到了您提交的订单；销售方收到你的订单信息后，只有在销售方将您的订单中订购的商品从仓库实际直接向您发出时（以商品出库为标志），方视为您与销售方之间就实际直接向您发出的商品建立了合同关系；<br/>如果您在一份订单里订购了多种商品并且销售方只给您发出了部分商品时，您与销售方之间仅就实际直接向您发出的商品建立了合同关系；只有在销售方实际直接向您发出了订单中订购的其他商品时，您和销售方之间就订单中该其他已实际直接向您发出的商品建立了合同关系。<br/>您可以随时登陆您在京东注册的账户，查询您的订单状态。更多内容请见最新的京东网站用户注册协议及京东网站各类购物规则，我们建议您不时地浏览阅读。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>账户安全提醒：</strong><br/>互联网账号存在被盗风险，为了保障您的账号及资金安全，我们提醒您访问 我的账户- &gt; 修改密码，尽量使用复杂密码，如字母+数字+特殊符号等。</p><p><br/></p>', '');
INSERT INTO `pk_email` VALUES ('14', '1', 'sms_order_shipped', '订单发货短信通知', '您的订单：{$order.sn} 已经发货，请保持电话畅通，以方便快递人员能与您取得联系。', '');
INSERT INTO `pk_email` VALUES ('15', '1', 'order_admin_recerved', '订单【{$order.sn}】已确认收货', '<p>您好，管理员，客户已对订单【{$order.sn}】执行确认收货操作，请登录后台核验</p>', '');
INSERT INTO `pk_email` VALUES ('16', '1', 'email_code', '【{$config.title}】邮件验证码', '<p>你的验证码是：{$code}，三十分钟内有效，请及时输入</p>', '');
INSERT INTO `pk_email` VALUES ('17', '1', 'sms_code', '短信验证码', '您的验证码：{$code}，请在10分钟内输入【微光互助】', '');
INSERT INTO `pk_email` VALUES ('18', '1', 'sms_paid_admin', '订单成功后管理员', '订单：{$order.sn}，客户已支付成功，请检查', '');
INSERT INTO `pk_email` VALUES ('34', '1', 'login_email', '会员登录验证码', '<p>您的登录验证码是：</p><p><br/></p><p>    {$code}<br/></p><p><br/></p>', '');
INSERT INTO `pk_email` VALUES ('35', '1', 'sms_sendcloud_code', '4575', 'code:{$code}', 'SendCloud使用的验证码');
INSERT INTO `pk_email` VALUES ('36', '1', 'sms_aliyun_test', 'SMS_49105038', 'customer:{$user.user}', '阿里云短信测试');
INSERT INTO `pk_email` VALUES ('37', '1', 'sms_61825160', 'SMS_61825160', 'code:{$code}', '阿里去：验证码');
INSERT INTO `pk_email` VALUES ('38', '1', 'email_toall', '您的留言 #{$rs.id}，管理员已经回复', '<p>您好：{$rs.fullname}，您在我们网站上的留言，管理员已经回复了，您可以下面链接进行查看：</p><blockquote><p><a href=\"{$sys.url}{$rs.id}.html\" target=\"_blank\">{$sys.url}{$rs.id}.html</a><br/></p></blockquote><p>感谢您对我们网站（{$config.title}）的认可。</p><p><br/></p><p>您的支持是我们发展的动力</p><p><img src=\"{$sys.url}res/201704/22/auto_1092.png\" style=\"width: 500px;\"/></p>', '留言回复通知');

-- ----------------------------
-- Table structure for pk_express
-- ----------------------------
DROP TABLE IF EXISTS `pk_express`;
CREATE TABLE `pk_express` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID，为0所有站点使用',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `company` varchar(255) NOT NULL COMMENT '公司名称',
  `homepage` varchar(255) NOT NULL COMMENT '官方网站',
  `code` varchar(100) NOT NULL COMMENT '接口标识，用于读取logistics文件夹下的接口文件',
  `rate` int(11) NOT NULL DEFAULT '6' COMMENT '查询频率，用于减少请求',
  `ext` text NOT NULL COMMENT '扩展数据保存',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='快递平台管理';

-- ----------------------------
-- Records of pk_express
-- ----------------------------
INSERT INTO `pk_express` VALUES ('1', '1', '宅急送-官方', '北京宅急送快运股份有限公司', 'http://www.zjs.com.cn/', 'zjs', '4', 'a:3:{s:18:\"logisticProviderID\";s:14:\"NanFang_LianHe\";s:7:\"keyseed\";s:36:\"86AF9251-F3A4-40AF-B9CC-7E509B303F9A\";s:12:\"fixed_string\";s:13:\"z宅J急S送g\";}');
INSERT INTO `pk_express` VALUES ('4', '1', '顺丰速运', '顺丰速运(集团)有限公司', 'http://www.sf-express.com/', 'showapi', '4', 'a:3:{s:6:\"app_id\";s:4:\"4485\";s:10:\"app_secret\";s:32:\"95a43a307f51416980ff86cae4c70f4e\";s:7:\"app_com\";s:8:\"shunfeng\";}');

-- ----------------------------
-- Table structure for pk_ext
-- ----------------------------
DROP TABLE IF EXISTS `pk_ext`;
CREATE TABLE `pk_ext` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `module` varchar(100) NOT NULL COMMENT '模块',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` text NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  PRIMARY KEY (`id`),
  KEY `module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=826 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of pk_ext
-- ----------------------------
INSERT INTO `pk_ext` VALUES ('221', 'project-148', '二维码图片', 'barcode', 'varchar', '请上传相应的二维码图片', 'upload', '', '', '', '255', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `pk_ext` VALUES ('805', 'list-1757', '企业名称', 'company', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";}');
INSERT INTO `pk_ext` VALUES ('806', 'list-1757', '公司地址', 'address', 'varchar', '请填写您的办公地址', 'text', '', 'safe', '', '79', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `pk_ext` VALUES ('807', 'list-1757', 'Email', 'email', 'varchar', '请填写联系邮箱，用户方便客户与您取得联系', 'text', '', 'safe', '', '50', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:0:\"\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `pk_ext` VALUES ('229', 'project-45', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `pk_ext` VALUES ('227', 'project-87', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `pk_ext` VALUES ('218', 'project-43', '英文标题En-Title', 'entitle', 'varchar', '', 'text', '', 'safe', '', '10', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";}');
INSERT INTO `pk_ext` VALUES ('219', 'project-43', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:6:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"0\";}');
INSERT INTO `pk_ext` VALUES ('230', 'project-150', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";}');
INSERT INTO `pk_ext` VALUES ('231', 'all-37', '百度分享代码', 'baidu', 'longtext', '', 'code_editor', '', 'html_js', '', '10', 'a:2:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"300\";}');
INSERT INTO `pk_ext` VALUES ('236', 'project-96', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `pk_ext` VALUES ('237', 'project-151', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `pk_ext` VALUES ('238', 'cate-204', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}');
INSERT INTO `pk_ext` VALUES ('239', 'project-152', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `pk_ext` VALUES ('240', 'cate-205', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}');
INSERT INTO `pk_ext` VALUES ('241', 'cate-206', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}');
INSERT INTO `pk_ext` VALUES ('244', 'project-144', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}');
INSERT INTO `pk_ext` VALUES ('246', 'project-142', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}');
INSERT INTO `pk_ext` VALUES ('259', 'cate-207', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}');
INSERT INTO `pk_ext` VALUES ('808', 'list-1757', '客服电话', 'tel', 'varchar', '请填写客服电话，建议填写400号', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `pk_ext` VALUES ('809', 'list-1757', '联系人', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `pk_ext` VALUES ('276', 'cate-70', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}');
INSERT INTO `pk_ext` VALUES ('277', 'project-151', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}');
INSERT INTO `pk_ext` VALUES ('810', 'list-1756', '图片', 'pic', 'varchar', '此图片仅在首页调用中显示，限制宽高为120x150', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:5:\"image\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `pk_ext` VALUES ('811', 'list-1756', '摘要', 'note', 'longtext', '支持HTML，仅在首页显示，请注意长度', 'editor', '', 'html', '', '20', 'a:13:{s:5:\"width\";s:0:\"\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:0:\"\";s:9:\"btn_video\";s:0:\"\";s:8:\"btn_file\";s:0:\"\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:6:\"simple\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}');
INSERT INTO `pk_ext` VALUES ('812', 'list-1757', '邮编', 'zipcode', 'varchar', '请填写六位数字的邮编号码', 'text', '', 'safe', '', '30', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}');
INSERT INTO `pk_ext` VALUES ('815', 'cate-582', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `pk_ext` VALUES ('817', 'all-115', '客服QQ', 'qq', 'varchar', '', 'text', '', 'safe', '', '150', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}');
INSERT INTO `pk_ext` VALUES ('818', 'all-115', '联系电话', 'tel', 'varchar', '', 'text', '', 'safe', '', '89', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}');
INSERT INTO `pk_ext` VALUES ('819', 'all-115', '联系地址', 'address', 'varchar', '', 'text', '', 'safe', '', '79', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";}');
INSERT INTO `pk_ext` VALUES ('820', 'all-115', '邮箱', 'email', 'varchar', '', 'text', '', 'safe', '', '130', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";b:0;}');
INSERT INTO `pk_ext` VALUES ('821', 'all-115', '微信二维码', 'qrcode', 'varchar', '上传二维码图片', 'upload', '', 'safe', '', '255', 'a:8:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"0\";s:15:\"upload_compress\";s:1:\"0\";s:18:\"upload_compress_wh\";s:3:\"500\";}');
INSERT INTO `pk_ext` VALUES ('822', 'all-4', '页脚版权', 'copyright', 'longtext', '', 'textarea', '', 'html', '', '255', 'a:2:{s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";}');
INSERT INTO `pk_ext` VALUES ('823', 'cate-8', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `pk_ext` VALUES ('824', 'cate-68', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');
INSERT INTO `pk_ext` VALUES ('825', 'cate-592', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');

-- ----------------------------
-- Table structure for pk_extc
-- ----------------------------
DROP TABLE IF EXISTS `pk_extc`;
CREATE TABLE `pk_extc` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容值ID，对应ext表中的id',
  `content` longtext NOT NULL COMMENT '内容文本',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展字段内容维护';

-- ----------------------------
-- Records of pk_extc
-- ----------------------------
INSERT INTO `pk_extc` VALUES ('822', 'Copyright © 2017 geektube.cn 版权所有 粤ICP备000000000号');
INSERT INTO `pk_extc` VALUES ('809', '苏先生');
INSERT INTO `pk_extc` VALUES ('808', '15818533971');
INSERT INTO `pk_extc` VALUES ('807', 'admin@phpok.com');
INSERT INTO `pk_extc` VALUES ('806', '广东深圳市罗湖区东盛路辐照中心7栋3楼');
INSERT INTO `pk_extc` VALUES ('805', '深圳市锟铻科技有限公司');
INSERT INTO `pk_extc` VALUES ('810', 'res/201409/03/5b0086d14de1bbf2.jpg');
INSERT INTO `pk_extc` VALUES ('811', '<p>深圳市锟铻科技有限公司（Shenzhen Kunwu Technology Co., Ltd.）创立于2014年，专注于企业网站技术的研究和开发，是国内最有影响力的企业网站技术提供商。</p><p>锟铻科技成长的过程，就是服务客户并和客户一起不断成功的过程！我们用心、努力作好每一件事，满怀信心迎接每一次挑战。</p>');
INSERT INTO `pk_extc` VALUES ('229', '1007');
INSERT INTO `pk_extc` VALUES ('227', '1006');
INSERT INTO `pk_extc` VALUES ('218', 'News');
INSERT INTO `pk_extc` VALUES ('219', '');
INSERT INTO `pk_extc` VALUES ('221', '629');
INSERT INTO `pk_extc` VALUES ('230', '<h3>正品行货</h3><p>商城向您保证所售商品均为正品行货，自营商品开具机打发票或电子发票。</p><h3>全国联保</h3><p>凭质保证书及发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由京东联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！ </p><p>注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</p><h3>无忧退换货</h3><p>客户购买自营商品7日内（含7日，自客户收到商品之日起计算），在保证商品完好的前提下，可无理由退货。（部分商品除外，详情请见各商品细则）</p>');
INSERT INTO `pk_extc` VALUES ('231', '<div class=\"bdsharebuttonbox\"><a href=\"#\" class=\"bds_more\" data-cmd=\"more\">分享到：</a><a href=\"#\" class=\"bds_qzone\" data-cmd=\"qzone\" title=\"分享到QQ空间\">QQ空间</a><a href=\"#\" class=\"bds_tsina\" data-cmd=\"tsina\" title=\"分享到新浪微博\">新浪微博</a><a href=\"#\" class=\"bds_tqq\" data-cmd=\"tqq\" title=\"分享到腾讯微博\">腾讯微博</a><a href=\"#\" class=\"bds_weixin\" data-cmd=\"weixin\" title=\"分享到微信\">微信</a></div><script>window._bd_share_config={\"common\":{\"bdSnsKey\":{},\"bdText\":\"\",\"bdMini\":\"2\",\"bdMiniList\":false,\"bdPic\":\"\",\"bdStyle\":\"1\",\"bdSize\":\"32\"},\"share\":{\"bdSize\":16}};with(document)0[(getElementsByTagName(\'head\')[0]||body).appendChild(createElement(\'script\')).src=\'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=\'+~(-new Date()/36e5)];</script>');
INSERT INTO `pk_extc` VALUES ('237', '');
INSERT INTO `pk_extc` VALUES ('238', '本区以讨论各种感情，各类人生为核心主题心灵鸡汤无处不在，不在于多少，只在于感悟懂了就是懂了，不懂仍然不懂');
INSERT INTO `pk_extc` VALUES ('236', '545');
INSERT INTO `pk_extc` VALUES ('239', '545');
INSERT INTO `pk_extc` VALUES ('240', '围绕我公司提供的产品进行讨论广开言路，我公司会虚心接纳，完善产品');
INSERT INTO `pk_extc` VALUES ('241', '吐吐糟，发发牢骚，八卦精神无处不在笑一笑，十年少，在这个快节奏的时代里，这里还有一片净土供您休息不是我不爱，只是世界变化快^o^');
INSERT INTO `pk_extc` VALUES ('244', 'Photos');
INSERT INTO `pk_extc` VALUES ('246', 'Links');
INSERT INTO `pk_extc` VALUES ('259', '关于常见问题');
INSERT INTO `pk_extc` VALUES ('276', 'Categories');
INSERT INTO `pk_extc` VALUES ('277', 'Download');
INSERT INTO `pk_extc` VALUES ('812', '518000');
INSERT INTO `pk_extc` VALUES ('817', '405140865');
INSERT INTO `pk_extc` VALUES ('818', '020-6953515');
INSERT INTO `pk_extc` VALUES ('819', '广东天河XXX');
INSERT INTO `pk_extc` VALUES ('820', 'admin@qqq.com');
INSERT INTO `pk_extc` VALUES ('821', '1201');
INSERT INTO `pk_extc` VALUES ('823', '1209');
INSERT INTO `pk_extc` VALUES ('824', '1212');
INSERT INTO `pk_extc` VALUES ('825', '1211');

-- ----------------------------
-- Table structure for pk_fav
-- ----------------------------
DROP TABLE IF EXISTS `pk_fav`;
CREATE TABLE `pk_fav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `note` varchar(255) NOT NULL COMMENT '摘要',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `lid` int(11) NOT NULL COMMENT '关联主题',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='会员收藏夹';

-- ----------------------------
-- Records of pk_fav
-- ----------------------------
INSERT INTO `pk_fav` VALUES ('8', '23', '', 'MySQL出错代码', '1005：创建表失败1006：创建数据库失败1007：数据库已存在，创建数据库失败1008：数据库不存在，删除数据库失败1009：不能删除数据库文件导致删除数据库失败1010：不能删除…', '1459322370', '1370');

-- ----------------------------
-- Table structure for pk_fields
-- ----------------------------
DROP TABLE IF EXISTS `pk_fields`;
CREATE TABLE `pk_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` varchar(100) NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  `area` text NOT NULL COMMENT '使用范围，多个应用范围用英文逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of pk_fields
-- ----------------------------
INSERT INTO `pk_fields` VALUES ('6', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:11:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";}', 'all,cate,module,project,user,usergroup');
INSERT INTO `pk_fields` VALUES ('7', '图片', 'pictures', 'varchar', '支持多图', 'upload', '', 'safe', '', '50', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user');
INSERT INTO `pk_fields` VALUES ('8', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `pk_fields` VALUES ('128', '附件', 'dfiles', 'varchar', '支持多个附件', 'upload', '', '', '', '255', 'a:3:{s:7:\"cate_id\";s:2:\"11\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user,usergroup');
INSERT INTO `pk_fields` VALUES ('11', '链接', 'link', 'longtext', '手动指定外部链接时，伪静态链接可以留空', 'url', '', 'safe', '', '90', 'a:1:{s:5:\"width\";s:3:\"500\";}', 'all,cate,module,project,user');
INSERT INTO `pk_fields` VALUES ('12', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}', 'all,cate,module,project');
INSERT INTO `pk_fields` VALUES ('13', '性别', 'gender', 'varchar', '', 'radio', '', 'safe', '女', '120', 'a:3:{s:11:\"option_list\";b:0;s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";s:8:\"男女\";}', 'all,cate,module,project,user');
INSERT INTO `pk_fields` VALUES ('14', '邮箱', 'email', 'varchar', '', 'text', '', 'safe', '', '130', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";b:0;}', 'all,cate,module,project,user');
INSERT INTO `pk_fields` VALUES ('37', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_self', '100', 'a:1:{s:11:\"option_list\";s:5:\"opt:6\";}', 'cate,module,project');
INSERT INTO `pk_fields` VALUES ('30', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,cate,module,project,user');
INSERT INTO `pk_fields` VALUES ('31', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project');
INSERT INTO `pk_fields` VALUES ('127', '附件', 'dfile', 'varchar', '', 'upload', '', '', '', '255', 'a:3:{s:7:\"cate_id\";s:2:\"11\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `pk_fields` VALUES ('35', '文档', 'doc', 'varchar', '支持在线办公室的文档', 'upload', '', 'safe', '', '80', 'a:3:{s:11:\"upload_type\";s:8:\"document\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";}', 'all,cate,module,project');
INSERT INTO `pk_fields` VALUES ('36', '视频', 'video', 'varchar', '支持并推荐您使用FlV格式视频', 'upload', '', 'int', '', '110', 'a:3:{s:7:\"cate_id\";s:2:\"16\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"0\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `pk_fields` VALUES ('60', '客服QQ', 'qq', 'varchar', '', 'text', '', 'safe', '', '150', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,cate,module,project,user');
INSERT INTO `pk_fields` VALUES ('116', '广告内容', 'ad', 'longtext', '', 'editor', '', 'html_js', '', '255', 'a:12:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";i:1;s:9:\"btn_image\";i:1;s:9:\"btn_video\";i:1;s:8:\"btn_file\";b:0;s:8:\"btn_page\";b:0;s:8:\"btn_info\";b:0;s:7:\"is_read\";b:0;s:5:\"etype\";s:6:\"simple\";s:7:\"btn_tpl\";b:0;s:7:\"btn_map\";b:0;}', 'all,cate,module,project');
INSERT INTO `pk_fields` VALUES ('75', '联系地址', 'address', 'varchar', '', 'text', '', 'safe', '', '79', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";}', 'all,module,user');
INSERT INTO `pk_fields` VALUES ('76', '联系电话', 'tel', 'varchar', '', 'text', '', 'safe', '', '89', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,module,project,user');
INSERT INTO `pk_fields` VALUES ('77', '邮编', 'zipcode', 'varchar', '请填写六位数字的邮编号码', 'text', '', 'safe', '', '30', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,module,cate');
INSERT INTO `pk_fields` VALUES ('79', 'LOGO', 'logo', 'varchar', '网站LOGO，规格：88x31', 'text', '', 'safe', '', '160', 'a:2:{s:8:\"form_btn\";s:5:\"image\";s:5:\"width\";s:3:\"500\";}', 'all,cate,module,project');
INSERT INTO `pk_fields` VALUES ('80', '图片', 'pic', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";s:5:\"image\";s:5:\"width\";s:3:\"500\";}', 'all,cate,module,project,user');
INSERT INTO `pk_fields` VALUES ('81', '统计', 'statjs', 'varchar', '', 'code_editor', '', 'html_js', '', '255', 'a:2:{s:5:\"width\";s:3:\"500\";s:6:\"height\";s:2:\"80\";}', 'all');
INSERT INTO `pk_fields` VALUES ('82', '备案号', 'cert', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all');
INSERT INTO `pk_fields` VALUES ('95', '发货时间', 'sendtime', 'varchar', '设置发货时间', 'text', '', 'time', '', '255', 'a:2:{s:8:\"form_btn\";s:4:\"date\";s:5:\"width\";s:3:\"300\";}', 'module');
INSERT INTO `pk_fields` VALUES ('96', '企业名称', 'company', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";}', 'all,module,project,user');
INSERT INTO `pk_fields` VALUES ('106', '管理员回复', 'adm_reply', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"180\";s:7:\"is_code\";b:0;s:9:\"btn_image\";i:1;s:9:\"btn_video\";i:1;s:8:\"btn_file\";i:1;s:8:\"btn_page\";b:0;s:8:\"btn_info\";b:0;s:7:\"is_read\";b:0;s:5:\"etype\";s:6:\"simple\";s:7:\"btn_tpl\";b:0;s:7:\"btn_map\";b:0;}', 'module');
INSERT INTO `pk_fields` VALUES ('112', '赞', 'good', 'varchar', '设置点赞次数', 'text', '', 'int', '', '20', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"100\";}', 'module');
INSERT INTO `pk_fields` VALUES ('113', '省市', 'province_city', 'longtext', '', 'select', '', 'safe', '', '255', 'a:4:{s:11:\"option_list\";s:5:\"opt:2\";s:11:\"is_multiple\";s:1:\"0\";s:5:\"width\";b:0;s:10:\"ext_select\";b:0;}', 'all,cate,module,project,user,usergroup');
INSERT INTO `pk_fields` VALUES ('114', '手机号', 'mobile', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,cate,module,project,user,usergroup');
INSERT INTO `pk_fields` VALUES ('117', '规格参数', 'spec', 'longtext', '', 'param', '', '', '', '255', 'a:2:{s:6:\"p_name\";s:30:\"名称型号流量大小\";s:6:\"p_type\";s:1:\"1\";}', 'module');
INSERT INTO `pk_fields` VALUES ('118', '产品属性', 'spec_single', 'longtext', '', 'param', '', '', '', '255', 'a:2:{s:6:\"p_name\";s:119:\"型号推荐用途平台显卡类型网卡类型速度核心数二级缓存显示芯片显存容量\";s:6:\"p_type\";s:1:\"0\";}', 'module');
INSERT INTO `pk_fields` VALUES ('119', '页脚版权', 'copyright', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";b:0;s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";b:0;s:8:\"btn_file\";b:0;s:8:\"btn_page\";b:0;s:8:\"btn_info\";b:0;s:7:\"is_read\";b:0;s:5:\"etype\";s:6:\"simple\";s:7:\"btn_tpl\";b:0;s:7:\"btn_map\";b:0;}', 'all,module');
INSERT INTO `pk_fields` VALUES ('120', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `pk_fields` VALUES ('129', '二维码', 'qrcode', 'varchar', '上传二维码图片', 'upload', '', '', '', '255', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user');
INSERT INTO `pk_fields` VALUES ('130', '百度分享代码', 'bdshare', 'longtext', '放置百度分享代码框', 'code_editor', '', 'html_js', '', '255', 'a:2:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"300\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `pk_fields` VALUES ('122', '子标题', 'subtitle', 'varchar', '', 'text', '', '', '', '20', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `pk_fields` VALUES ('124', '自定义链接', 'linkurl', 'varchar', '请填写链接地址，外链请输入http://或https://', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";s:3:\"url\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `pk_fields` VALUES ('125', '背景颜色', 'bgcolor', 'varchar', '实现在不支持CSS3的情况与背景融合', 'text', '', '', 'FFFFFF', '255', 'a:4:{s:8:\"form_btn\";s:5:\"color\";s:5:\"width\";s:0:\"\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `pk_fields` VALUES ('126', '省市县', 'pca', 'varchar', '省市县信息调用', 'pca', '', '', '', '255', 'a:1:{s:8:\"savetype\";s:1:\"0\";}', 'module');
INSERT INTO `pk_fields` VALUES ('131', '规格参数', 'parameter', 'longtext', '', 'param', '', 'safe', '', '255', 'a:3:{s:6:\"p_name\";s:108:\"网络制式机身内存分辨率摄像头无线和网络机身尺寸（mm）机身重量（g）\";s:6:\"p_type\";s:1:\"0\";s:7:\"p_width\";s:0:\"\";}', 'module');
INSERT INTO `pk_fields` VALUES ('132', '包装清单', 'package', 'longtext', '', 'textarea', '', '', '', '255', 'a:2:{s:5:\"width\";s:3:\"500\";s:6:\"height\";s:3:\"100\";}', 'module');
INSERT INTO `pk_fields` VALUES ('133', '手机版标题', 'm_title', 'varchar', '标题较短，请根据实际情况使用', 'text', '', '', '', '255', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');

-- ----------------------------
-- Table structure for pk_freight
-- ----------------------------
DROP TABLE IF EXISTS `pk_freight`;
CREATE TABLE `pk_freight` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID，自增ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `title` varchar(100) NOT NULL COMMENT '模板名称，便于后台管理',
  `type` enum('weight','volume','number','fixed') NOT NULL DEFAULT 'weight' COMMENT 'weight重量volume体积number数量fixed固定值',
  `currency_id` int(11) NOT NULL DEFAULT '0' COMMENT '货币ID',
  `taxis` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='物流运费模板管理';

-- ----------------------------
-- Records of pk_freight
-- ----------------------------
INSERT INTO `pk_freight` VALUES ('1', '1', '计重运费模板', 'weight', '1', '10');
INSERT INTO `pk_freight` VALUES ('2', '1', '体积运费模板', 'volume', '1', '20');
INSERT INTO `pk_freight` VALUES ('3', '1', '基于数量的运费模板', 'number', '1', '30');
INSERT INTO `pk_freight` VALUES ('4', '1', '固定运费模板', 'fixed', '1', '40');

-- ----------------------------
-- Table structure for pk_freight_price
-- ----------------------------
DROP TABLE IF EXISTS `pk_freight_price`;
CREATE TABLE `pk_freight_price` (
  `zid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区域ID',
  `unit_val` varchar(20) NOT NULL COMMENT '单位量，如0.5kg，或1个或1立方米，取决于系统设定',
  `price` varchar(50) NOT NULL DEFAULT '0' COMMENT '运费价格，最低为0，不能为负数',
  PRIMARY KEY (`zid`,`unit_val`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单位体积价格';

-- ----------------------------
-- Records of pk_freight_price
-- ----------------------------
INSERT INTO `pk_freight_price` VALUES ('1', '1', '10');
INSERT INTO `pk_freight_price` VALUES ('2', '1', '10');
INSERT INTO `pk_freight_price` VALUES ('3', '1', '10');
INSERT INTO `pk_freight_price` VALUES ('4', '1', '10');
INSERT INTO `pk_freight_price` VALUES ('5', '1', '11');
INSERT INTO `pk_freight_price` VALUES ('6', '1', '15');
INSERT INTO `pk_freight_price` VALUES ('7', '1', '11');
INSERT INTO `pk_freight_price` VALUES ('8', '1', '30');
INSERT INTO `pk_freight_price` VALUES ('1', '2', '17');
INSERT INTO `pk_freight_price` VALUES ('2', '2', '17');
INSERT INTO `pk_freight_price` VALUES ('3', '2', '24');
INSERT INTO `pk_freight_price` VALUES ('4', '2', '24');
INSERT INTO `pk_freight_price` VALUES ('5', '2', '22');
INSERT INTO `pk_freight_price` VALUES ('6', '2', '27');
INSERT INTO `pk_freight_price` VALUES ('7', '2', '22');
INSERT INTO `pk_freight_price` VALUES ('8', '2', '30');
INSERT INTO `pk_freight_price` VALUES ('8', '3', '10*N');
INSERT INTO `pk_freight_price` VALUES ('7', '3', '10*N');
INSERT INTO `pk_freight_price` VALUES ('6', '3', '10*N');
INSERT INTO `pk_freight_price` VALUES ('5', '3', '10*N');
INSERT INTO `pk_freight_price` VALUES ('4', '3', '10*N');
INSERT INTO `pk_freight_price` VALUES ('3', '3', '10*N');
INSERT INTO `pk_freight_price` VALUES ('2', '3', '8*N');
INSERT INTO `pk_freight_price` VALUES ('1', '3', '7*N');
INSERT INTO `pk_freight_price` VALUES ('10', '0.5', '10');
INSERT INTO `pk_freight_price` VALUES ('11', '0.5', '20');
INSERT INTO `pk_freight_price` VALUES ('10', '1', '12*N');
INSERT INTO `pk_freight_price` VALUES ('11', '1', '35');
INSERT INTO `pk_freight_price` VALUES ('10', '1.5', '13*N');
INSERT INTO `pk_freight_price` VALUES ('11', '1.5', '45');
INSERT INTO `pk_freight_price` VALUES ('12', 'fixed', '10');
INSERT INTO `pk_freight_price` VALUES ('24', 'fixed', '20');

-- ----------------------------
-- Table structure for pk_freight_zone
-- ----------------------------
DROP TABLE IF EXISTS `pk_freight_zone`;
CREATE TABLE `pk_freight_zone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `title` varchar(100) NOT NULL COMMENT '名称',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `note` varchar(255) NOT NULL COMMENT '简单说明该区域信息',
  `area` longtext NOT NULL COMMENT '省份+城市',
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='运费模板区域设置';

-- ----------------------------
-- Records of pk_freight_zone
-- ----------------------------
INSERT INTO `pk_freight_zone` VALUES ('1', '3', '华东', '10', '包括省市有上海，江苏，浙江，安徽，江西', 'a:5:{s:9:\"上海市\";a:1:{s:9:\"上海市\";b:1;}s:9:\"江苏省\";a:13:{s:9:\"南京市\";b:1;s:9:\"无锡市\";b:1;s:9:\"徐州市\";b:1;s:9:\"常州市\";b:1;s:9:\"苏州市\";b:1;s:9:\"南通市\";b:1;s:12:\"连云港市\";b:1;s:9:\"淮安市\";b:1;s:9:\"盐城市\";b:1;s:9:\"扬州市\";b:1;s:9:\"镇江市\";b:1;s:9:\"泰州市\";b:1;s:9:\"宿迁市\";b:1;}s:9:\"浙江省\";a:11:{s:9:\"杭州市\";b:1;s:9:\"宁波市\";b:1;s:9:\"温州市\";b:1;s:9:\"嘉兴市\";b:1;s:9:\"湖州市\";b:1;s:9:\"绍兴市\";b:1;s:9:\"金华市\";b:1;s:9:\"衢州市\";b:1;s:9:\"舟山市\";b:1;s:9:\"台州市\";b:1;s:9:\"丽水市\";b:1;}s:9:\"安徽省\";a:17:{s:9:\"合肥市\";b:1;s:9:\"芜湖市\";b:1;s:9:\"蚌埠市\";b:1;s:9:\"淮南市\";b:1;s:12:\"马鞍山市\";b:1;s:9:\"淮北市\";b:1;s:9:\"铜陵市\";b:1;s:9:\"安庆市\";b:1;s:9:\"黄山市\";b:1;s:9:\"滁州市\";b:1;s:9:\"阜阳市\";b:1;s:9:\"宿州市\";b:1;s:9:\"巢湖市\";b:1;s:9:\"六安市\";b:1;s:9:\"亳州市\";b:1;s:9:\"池州市\";b:1;s:9:\"宣城市\";b:1;}s:9:\"江西省\";a:11:{s:9:\"南昌市\";b:1;s:12:\"景德镇市\";b:1;s:9:\"萍乡市\";b:1;s:9:\"九江市\";b:1;s:9:\"新余市\";b:1;s:9:\"鹰潭市\";b:1;s:9:\"赣州市\";b:1;s:9:\"吉安市\";b:1;s:9:\"宜春市\";b:1;s:9:\"抚州市\";b:1;s:9:\"上饶市\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('2', '3', '华北', '20', '包含北京，天津，山西，山东，河北，内蒙古', 'a:6:{s:9:\"北京市\";a:1:{s:9:\"北京市\";b:1;}s:9:\"天津市\";a:1:{s:9:\"天津市\";b:1;}s:9:\"河北省\";a:11:{s:12:\"石家庄市\";b:1;s:9:\"唐山市\";b:1;s:12:\"秦皇岛市\";b:1;s:9:\"邯郸市\";b:1;s:9:\"邢台市\";b:1;s:9:\"保定市\";b:1;s:12:\"张家口市\";b:1;s:9:\"承德市\";b:1;s:9:\"沧州市\";b:1;s:9:\"廊坊市\";b:1;s:9:\"衡水市\";b:1;}s:9:\"山西省\";a:11:{s:9:\"太原市\";b:1;s:9:\"大同市\";b:1;s:9:\"阳泉市\";b:1;s:9:\"长治市\";b:1;s:9:\"晋城市\";b:1;s:9:\"朔州市\";b:1;s:9:\"晋中市\";b:1;s:9:\"运城市\";b:1;s:9:\"忻州市\";b:1;s:9:\"临汾市\";b:1;s:9:\"吕梁市\";b:1;}s:18:\"内蒙古自治区\";a:12:{s:15:\"呼和浩特市\";b:1;s:9:\"包头市\";b:1;s:9:\"乌海市\";b:1;s:9:\"赤峰市\";b:1;s:9:\"通辽市\";b:1;s:15:\"鄂尔多斯市\";b:1;s:15:\"呼伦贝尔市\";b:1;s:15:\"巴彦淖尔市\";b:1;s:15:\"乌兰察布市\";b:1;s:9:\"兴安盟\";b:1;s:15:\"锡林郭勒盟\";b:1;s:12:\"阿拉善盟\";b:1;}s:9:\"山东省\";a:17:{s:9:\"济南市\";b:1;s:9:\"青岛市\";b:1;s:9:\"淄博市\";b:1;s:9:\"枣庄市\";b:1;s:9:\"东营市\";b:1;s:9:\"烟台市\";b:1;s:9:\"潍坊市\";b:1;s:9:\"济宁市\";b:1;s:9:\"泰安市\";b:1;s:9:\"威海市\";b:1;s:9:\"日照市\";b:1;s:9:\"莱芜市\";b:1;s:9:\"临沂市\";b:1;s:9:\"德州市\";b:1;s:9:\"聊城市\";b:1;s:9:\"滨州市\";b:1;s:9:\"荷泽市\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('3', '3', '华中', '30', '包括湖南，湖北，河南', 'a:3:{s:9:\"河南省\";a:17:{s:9:\"郑州市\";b:1;s:9:\"开封市\";b:1;s:9:\"洛阳市\";b:1;s:12:\"平顶山市\";b:1;s:9:\"安阳市\";b:1;s:9:\"鹤壁市\";b:1;s:9:\"新乡市\";b:1;s:9:\"焦作市\";b:1;s:9:\"濮阳市\";b:1;s:9:\"许昌市\";b:1;s:9:\"漯河市\";b:1;s:12:\"三门峡市\";b:1;s:9:\"南阳市\";b:1;s:9:\"商丘市\";b:1;s:9:\"信阳市\";b:1;s:9:\"周口市\";b:1;s:12:\"驻马店市\";b:1;}s:9:\"湖北省\";a:14:{s:9:\"武汉市\";b:1;s:9:\"黄石市\";b:1;s:9:\"十堰市\";b:1;s:9:\"宜昌市\";b:1;s:9:\"襄樊市\";b:1;s:9:\"鄂州市\";b:1;s:9:\"荆门市\";b:1;s:9:\"孝感市\";b:1;s:9:\"荆州市\";b:1;s:9:\"黄冈市\";b:1;s:9:\"咸宁市\";b:1;s:9:\"随州市\";b:1;s:30:\"恩施土家族苗族自治州\";b:1;s:9:\"神农架\";b:1;}s:9:\"湖南省\";a:14:{s:9:\"长沙市\";b:1;s:9:\"株洲市\";b:1;s:9:\"湘潭市\";b:1;s:9:\"衡阳市\";b:1;s:9:\"邵阳市\";b:1;s:9:\"岳阳市\";b:1;s:9:\"常德市\";b:1;s:12:\"张家界市\";b:1;s:9:\"益阳市\";b:1;s:9:\"郴州市\";b:1;s:9:\"永州市\";b:1;s:9:\"怀化市\";b:1;s:9:\"娄底市\";b:1;s:30:\"湘西土家族苗族自治州\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('4', '3', '华南', '40', '包括广东，广西，福建，海南', 'a:4:{s:9:\"福建省\";a:9:{s:9:\"福州市\";b:1;s:9:\"厦门市\";b:1;s:9:\"莆田市\";b:1;s:9:\"三明市\";b:1;s:9:\"泉州市\";b:1;s:9:\"漳州市\";b:1;s:9:\"南平市\";b:1;s:9:\"龙岩市\";b:1;s:9:\"宁德市\";b:1;}s:9:\"广东省\";a:21:{s:9:\"广州市\";b:1;s:9:\"韶关市\";b:1;s:9:\"深圳市\";b:1;s:9:\"珠海市\";b:1;s:9:\"汕头市\";b:1;s:9:\"佛山市\";b:1;s:9:\"江门市\";b:1;s:9:\"湛江市\";b:1;s:9:\"茂名市\";b:1;s:9:\"肇庆市\";b:1;s:9:\"惠州市\";b:1;s:9:\"梅州市\";b:1;s:9:\"汕尾市\";b:1;s:9:\"河源市\";b:1;s:9:\"阳江市\";b:1;s:9:\"清远市\";b:1;s:9:\"东莞市\";b:1;s:9:\"中山市\";b:1;s:9:\"潮州市\";b:1;s:9:\"揭阳市\";b:1;s:9:\"云浮市\";b:1;}s:21:\"广西壮族自治区\";a:14:{s:9:\"南宁市\";b:1;s:9:\"柳州市\";b:1;s:9:\"桂林市\";b:1;s:9:\"梧州市\";b:1;s:9:\"北海市\";b:1;s:12:\"防城港市\";b:1;s:9:\"钦州市\";b:1;s:9:\"贵港市\";b:1;s:9:\"玉林市\";b:1;s:9:\"百色市\";b:1;s:9:\"贺州市\";b:1;s:9:\"河池市\";b:1;s:9:\"来宾市\";b:1;s:9:\"崇左市\";b:1;}s:9:\"海南省\";a:2:{s:9:\"海口市\";b:1;s:9:\"三亚市\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('5', '3', '东北', '50', '包括辽宁，吉林，黑龙江', 'a:3:{s:9:\"辽宁省\";a:14:{s:9:\"沈阳市\";b:1;s:9:\"大连市\";b:1;s:9:\"鞍山市\";b:1;s:9:\"抚顺市\";b:1;s:9:\"本溪市\";b:1;s:9:\"丹东市\";b:1;s:9:\"锦州市\";b:1;s:9:\"营口市\";b:1;s:9:\"阜新市\";b:1;s:9:\"辽阳市\";b:1;s:9:\"盘锦市\";b:1;s:9:\"铁岭市\";b:1;s:9:\"朝阳市\";b:1;s:12:\"葫芦岛市\";b:1;}s:9:\"吉林省\";a:9:{s:9:\"长春市\";b:1;s:9:\"吉林市\";b:1;s:9:\"四平市\";b:1;s:9:\"辽源市\";b:1;s:9:\"通化市\";b:1;s:9:\"白山市\";b:1;s:9:\"松原市\";b:1;s:9:\"白城市\";b:1;s:24:\"延边朝鲜族自治州\";b:1;}s:12:\"黑龙江省\";a:13:{s:12:\"哈尔滨市\";b:1;s:15:\"齐齐哈尔市\";b:1;s:9:\"鸡西市\";b:1;s:9:\"鹤岗市\";b:1;s:12:\"双鸭山市\";b:1;s:9:\"大庆市\";b:1;s:9:\"伊春市\";b:1;s:12:\"佳木斯市\";b:1;s:12:\"七台河市\";b:1;s:12:\"牡丹江市\";b:1;s:9:\"黑河市\";b:1;s:9:\"绥化市\";b:1;s:18:\"大兴安岭地区\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('6', '3', '西北', '60', '包括陕西，甘肃，宁夏，青海，新疆', 'a:5:{s:9:\"陕西省\";a:10:{s:9:\"西安市\";b:1;s:9:\"铜川市\";b:1;s:9:\"宝鸡市\";b:1;s:9:\"咸阳市\";b:1;s:9:\"渭南市\";b:1;s:9:\"延安市\";b:1;s:9:\"汉中市\";b:1;s:9:\"榆林市\";b:1;s:9:\"安康市\";b:1;s:9:\"商洛市\";b:1;}s:9:\"甘肃省\";a:14:{s:9:\"兰州市\";b:1;s:12:\"嘉峪关市\";b:1;s:9:\"金昌市\";b:1;s:9:\"白银市\";b:1;s:9:\"天水市\";b:1;s:9:\"武威市\";b:1;s:9:\"张掖市\";b:1;s:9:\"平凉市\";b:1;s:9:\"酒泉市\";b:1;s:9:\"庆阳市\";b:1;s:9:\"定西市\";b:1;s:9:\"陇南市\";b:1;s:21:\"临夏回族自治州\";b:1;s:21:\"甘南藏族自治州\";b:1;}s:9:\"青海省\";a:8:{s:9:\"西宁市\";b:1;s:12:\"海东地区\";b:1;s:21:\"海北藏族自治州\";b:1;s:21:\"黄南藏族自治州\";b:1;s:21:\"海南藏族自治州\";b:1;s:21:\"果洛藏族自治州\";b:1;s:21:\"玉树藏族自治州\";b:1;s:30:\"海西蒙古族藏族自治州\";b:1;}s:21:\"宁夏回族自治区\";a:5:{s:9:\"银川市\";b:1;s:12:\"石嘴山市\";b:1;s:9:\"吴忠市\";b:1;s:9:\"固原市\";b:1;s:9:\"中卫市\";b:1;}s:24:\"新疆维吾尔自治区\";a:18:{s:15:\"乌鲁木齐市\";b:1;s:15:\"克拉玛依市\";b:1;s:15:\"吐鲁番地区\";b:1;s:12:\"哈密地区\";b:1;s:21:\"昌吉回族自治州\";b:1;s:27:\"博尔塔拉蒙古自治州\";b:1;s:27:\"巴音郭楞蒙古自治州\";b:1;s:15:\"阿克苏地区\";b:1;s:33:\"克孜勒苏柯尔克孜自治州\";b:1;s:12:\"喀什地区\";b:1;s:12:\"和田地区\";b:1;s:24:\"伊犁哈萨克自治州\";b:1;s:12:\"塔城地区\";b:1;s:15:\"阿勒泰地区\";b:1;s:12:\"石河子市\";b:1;s:12:\"阿拉尔市\";b:1;s:15:\"图木舒克市\";b:1;s:12:\"五家渠市\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('7', '3', '西南', '70', '包括重庆，云南，贵州，西藏，四川', 'a:5:{s:9:\"重庆市\";a:1:{s:9:\"重庆市\";b:1;}s:9:\"四川省\";a:21:{s:9:\"成都市\";b:1;s:9:\"自贡市\";b:1;s:12:\"攀枝花市\";b:1;s:9:\"泸州市\";b:1;s:9:\"德阳市\";b:1;s:9:\"绵阳市\";b:1;s:9:\"广元市\";b:1;s:9:\"遂宁市\";b:1;s:9:\"内江市\";b:1;s:9:\"乐山市\";b:1;s:9:\"南充市\";b:1;s:9:\"眉山市\";b:1;s:9:\"宜宾市\";b:1;s:9:\"广安市\";b:1;s:9:\"达州市\";b:1;s:9:\"雅安市\";b:1;s:9:\"巴中市\";b:1;s:9:\"资阳市\";b:1;s:27:\"阿坝藏族羌族自治州\";b:1;s:21:\"甘孜藏族自治州\";b:1;s:21:\"凉山彝族自治州\";b:1;}s:9:\"贵州省\";a:9:{s:9:\"贵阳市\";b:1;s:12:\"六盘水市\";b:1;s:9:\"遵义市\";b:1;s:9:\"安顺市\";b:1;s:12:\"铜仁地区\";b:1;s:33:\"黔西南布依族苗族自治州\";b:1;s:12:\"毕节地区\";b:1;s:30:\"黔东南苗族侗族自治州\";b:1;s:30:\"黔南布依族苗族自治州\";b:1;}s:9:\"云南省\";a:16:{s:9:\"昆明市\";b:1;s:9:\"曲靖市\";b:1;s:9:\"玉溪市\";b:1;s:9:\"保山市\";b:1;s:9:\"昭通市\";b:1;s:9:\"丽江市\";b:1;s:9:\"思茅市\";b:1;s:9:\"临沧市\";b:1;s:21:\"楚雄彝族自治州\";b:1;s:30:\"红河哈尼族彝族自治州\";b:1;s:27:\"文山壮族苗族自治州\";b:1;s:27:\"西双版纳傣族自治州\";b:1;s:21:\"大理白族自治州\";b:1;s:30:\"德宏傣族景颇族自治州\";b:1;s:24:\"怒江傈僳族自治州\";b:1;s:21:\"迪庆藏族自治州\";b:1;}s:15:\"西藏自治区\";a:7:{s:9:\"拉萨市\";b:1;s:12:\"昌都地区\";b:1;s:12:\"山南地区\";b:1;s:15:\"日喀则地区\";b:1;s:12:\"那曲地区\";b:1;s:12:\"阿里地区\";b:1;s:12:\"林芝地区\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('8', '3', '港澳台', '80', '包括包港，澳门，台湾', 'a:3:{s:21:\"香港特别行政区\";a:1:{s:21:\"香港特别行政区\";b:1;}s:21:\"澳门特别行政区\";a:1:{s:21:\"澳门特别行政区\";b:1;}s:9:\"台湾省\";a:1:{s:9:\"台湾省\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('10', '1', 'zoom1', '10', '广东深圳', 'a:1:{s:9:\"广东省\";a:1:{s:9:\"深圳市\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('11', '1', 'zoom2', '20', '福建及广东', 'a:2:{s:9:\"福建省\";a:9:{s:9:\"福州市\";b:1;s:9:\"厦门市\";b:1;s:9:\"莆田市\";b:1;s:9:\"三明市\";b:1;s:9:\"泉州市\";b:1;s:9:\"漳州市\";b:1;s:9:\"南平市\";b:1;s:9:\"龙岩市\";b:1;s:9:\"宁德市\";b:1;}s:9:\"广东省\";a:20:{s:9:\"广州市\";b:1;s:9:\"韶关市\";b:1;s:9:\"珠海市\";b:1;s:9:\"汕头市\";b:1;s:9:\"佛山市\";b:1;s:9:\"江门市\";b:1;s:9:\"湛江市\";b:1;s:9:\"茂名市\";b:1;s:9:\"肇庆市\";b:1;s:9:\"惠州市\";b:1;s:9:\"梅州市\";b:1;s:9:\"汕尾市\";b:1;s:9:\"河源市\";b:1;s:9:\"阳江市\";b:1;s:9:\"清远市\";b:1;s:9:\"东莞市\";b:1;s:9:\"中山市\";b:1;s:9:\"潮州市\";b:1;s:9:\"揭阳市\";b:1;s:9:\"云浮市\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('12', '4', '一线城市', '10', '', 'a:4:{s:9:\"北京市\";a:1:{s:9:\"北京市\";b:1;}s:9:\"天津市\";a:1:{s:9:\"天津市\";b:1;}s:9:\"上海市\";a:1:{s:9:\"上海市\";b:1;}s:9:\"广东省\";a:1:{s:9:\"深圳市\";b:1;}}');
INSERT INTO `pk_freight_zone` VALUES ('24', '4', '偏远地区', '20', '', 'a:1:{s:24:\"新疆维吾尔自治区\";a:18:{s:15:\"乌鲁木齐市\";b:1;s:15:\"克拉玛依市\";b:1;s:15:\"吐鲁番地区\";b:1;s:12:\"哈密地区\";b:1;s:21:\"昌吉回族自治州\";b:1;s:27:\"博尔塔拉蒙古自治州\";b:1;s:27:\"巴音郭楞蒙古自治州\";b:1;s:15:\"阿克苏地区\";b:1;s:33:\"克孜勒苏柯尔克孜自治州\";b:1;s:12:\"喀什地区\";b:1;s:12:\"和田地区\";b:1;s:24:\"伊犁哈萨克自治州\";b:1;s:12:\"塔城地区\";b:1;s:15:\"阿勒泰地区\";b:1;s:12:\"石河子市\";b:1;s:12:\"阿拉尔市\";b:1;s:15:\"图木舒克市\";b:1;s:12:\"五家渠市\";b:1;}}');

-- ----------------------------
-- Table structure for pk_gateway
-- ----------------------------
DROP TABLE IF EXISTS `pk_gateway`;
CREATE TABLE `pk_gateway` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID，为0表示所有站点可用',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不可用1可用',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1表示默认使用',
  `type` varchar(50) NOT NULL COMMENT '类型，gateway文件夹的子文件夹',
  `code` varchar(50) NOT NULL COMMENT '路由引挈',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `note` varchar(255) NOT NULL COMMENT '功能备注',
  `ext` text NOT NULL COMMENT '扩展参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='第三方网关路由引挈';

-- ----------------------------
-- Records of pk_gateway
-- ----------------------------
INSERT INTO `pk_gateway` VALUES ('1', '1', '1', '1', 'sms', 'duanxincm', '莫名短信', '10', '', 'a:4:{s:7:\"account\";s:8:\"70206743\";s:8:\"password\";s:8:\"40782502\";s:6:\"server\";s:22:\"http://api.duanxin.cm/\";s:6:\"mobile\";s:11:\"15818533971\";}');
INSERT INTO `pk_gateway` VALUES ('3', '1', '1', '1', 'email', 'smtp', 'SMTP邮件发送', '10', '', 'a:8:{s:6:\"server\";s:11:\"smtp.qq.com\";s:4:\"port\";s:2:\"25\";s:7:\"account\";s:15:\"admin@phpok.com\";s:8:\"password\";s:0:\"\";s:7:\"charset\";s:4:\"utf8\";s:3:\"ssl\";s:2:\"no\";s:8:\"fullname\";s:9:\"苏相锟\";s:5:\"email\";s:15:\"admin@phpok.com\";}');

-- ----------------------------
-- Table structure for pk_gd
-- ----------------------------
DROP TABLE IF EXISTS `pk_gd`;
CREATE TABLE `pk_gd` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `identifier` varchar(100) NOT NULL COMMENT '标识串',
  `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片高度',
  `mark_picture` varchar(255) NOT NULL COMMENT '水印图片位置',
  `mark_position` varchar(100) NOT NULL COMMENT '水印位置',
  `cut_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '图片生成方式，支持缩放法、裁剪法、等宽、等高及自定义五种，默认使用缩放法',
  `quality` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '图片生成质量，默认是100',
  `bgcolor` varchar(10) NOT NULL DEFAULT 'FFFFFF' COMMENT '补白背景色，默认是白色',
  `trans` tinyint(3) unsigned NOT NULL DEFAULT '65' COMMENT '透明度',
  `editor` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通1默认插入编辑器',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='上传图片自动生成方案';

-- ----------------------------
-- Records of pk_gd
-- ----------------------------
INSERT INTO `pk_gd` VALUES ('2', 'thumb', '320', '320', '', 'bottom-right', '1', '80', 'FFFFFF', '0', '0');
INSERT INTO `pk_gd` VALUES ('12', 'auto', '0', '0', 'res/201502/26/36afa2d3dfe37cbd.png', 'bottom-right', '0', '80', 'FFFFFF', '0', '1');

-- ----------------------------
-- Table structure for pk_list
-- ----------------------------
DROP TABLE IF EXISTS `pk_list`;
CREATE TABLE `pk_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0为根主题，其他ID对应list表的id字段',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `module_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '网站ID',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核，1已审核',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0显示，1隐藏',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `tpl` varchar(255) NOT NULL COMMENT '自定义的模板',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `tag` varchar(255) NOT NULL COMMENT 'tag标签',
  `attr` varchar(255) NOT NULL COMMENT '主题属性',
  `replydate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后回复时间',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示管理员发布',
  `identifier` varchar(255) NOT NULL COMMENT '内容标识串',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '财富基于，用于计算财富的基础量',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `site_id` (`site_id`,`identifier`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1879 DEFAULT CHARSET=utf8 COMMENT='内容主表';

-- ----------------------------
-- Records of pk_list
-- ----------------------------
INSERT INTO `pk_list` VALUES ('1875', '0', '0', '21', '41', '1', '这是幻灯片标题一', '1495504526', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('713', '0', '0', '23', '42', '1', '资讯中心', '1383355842', '30', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1870', '0', '0', '23', '42', '1', '其它', '1495446171', '40', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1869', '713', '0', '23', '42', '1', '极客之选', '1495446116', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1876', '0', '0', '21', '41', '1', '这是幻灯片标题二', '1495504560', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1874', '0', '8', '22', '43', '1', '三星 S8 国行 5688 元起售，提供电池更换服务；共享洗衣机也来了，洗一桶衣物 20 元起 | 极客早知道', '1495448533', '0', '1', '0', '69', '', '', '', '', 'AI,人工智能,微软小冰,微软', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1252', '0', '0', '61', '142', '1', 'phpok官网', '1390465160', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1868', '713', '0', '23', '42', '1', '产品观察', '1495446100', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1261', '0', '0', '61', '142', '1', '启邦互动', '1393321211', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1262', '0', '0', '61', '142', '1', '联迅网络', '1393321235', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1263', '0', '0', '61', '142', '1', '梦幻网络', '1393321258', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1264', '0', '0', '61', '142', '1', '中国站长站', '1393321288', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1265', '0', '0', '61', '142', '1', 'A5站长网', '1393321321', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1266', '0', '0', '61', '142', '1', '中国站长', '1393321365', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1267', '0', '0', '61', '142', '1', '落伍者', '1393321391', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1268', '0', '0', '61', '142', '1', '源码之家', '1393321413', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1767', '0', '211', '68', '144', '1', '华为P7', '1458701998', '0', '1', '0', '4', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1768', '0', '211', '68', '144', '1', '魅族MX5', '1458702037', '0', '1', '0', '4', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1766', '0', '211', '68', '144', '1', 'vivo Xplay5', '1458701947', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1877', '0', '0', '21', '41', '1', '这是幻灯片标题三', '1495504576', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1285', '0', '0', '46', '96', '1', '测试留言', '1399239571', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1867', '713', '0', '23', '42', '1', '极客早知道', '1495446077', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1300', '0', '0', '23', '147', '1', '关于我们', '1409554964', '10', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1878', '0', '0', '23', '42', '1', '首页', '1495522043', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1302', '0', '0', '23', '147', '1', '资讯中心', '1409554988', '30', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1303', '0', '0', '23', '147', '1', '在线留言', '1409554999', '40', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1304', '0', '0', '23', '147', '1', '联系我们', '1409555008', '50', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1305', '0', '0', '64', '148', '1', 'PHPOK销售客服', '1409747629', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1753', '0', '582', '24', '45', '1', '小米(MI) 小米5 全网通4G手机 双卡双待', '1452570664', '0', '1', '0', '38', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1310', '0', '198', '65', '151', '1', '主题复制插件', '1412136071', '0', '1', '0', '83', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1311', '0', '204', '66', '152', '1', '测试论坛功能', '1412391521', '0', '1', '0', '9', '', '', '', '', '', '', '0', '23', '', '0');
INSERT INTO `pk_list` VALUES ('1334', '0', '204', '66', '152', '1', '测试', '1413063267', '0', '1', '0', '11', '', '', '', '', '', '', '0', '23', '', '0');
INSERT INTO `pk_list` VALUES ('1872', '0', '68', '22', '43', '1', '微软小冰发布诗集的背后，人工智能由模仿到创造的跨越', '1495446933', '0', '1', '0', '7', '', '', '', '', 'AI人工智能,微软,微软小冰', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1873', '0', '592', '22', '43', '1', '这个让你扛在肩上的移动电源，可不只给手机充电那么简单！', '1495447051', '0', '1', '0', '40', '', '', '', '', '户外,旅行,黑科技,充电宝,移动电源,人工智能', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1769', '0', '211', '68', '144', '1', '小米5', '1458702065', '0', '1', '0', '7', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1765', '0', '211', '68', '144', '1', 'Apple iPhone 5SE', '1458701924', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1871', '0', '8', '22', '43', '1', '贾跃亭辞任乐视网总经理，iPhone 8 模具曝光 | 极客早知道 2017 年 5 月 22 日', '1495446748', '0', '1', '0', '53', '', '', '', '', 'iPhone 8,贾跃亭,乐视,人工智能', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1427', '0', '0', '64', '148', '1', '前台客服', '1446469762', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1756', '0', '0', '40', '87', '1', '公司简介', '1458467228', '10', '1', '0', '105', '', '', '', '', '', '', '0', '0', 'aboutus', '0');
INSERT INTO `pk_list` VALUES ('1757', '0', '0', '40', '87', '1', '联系我们', '1458474081', '40', '1', '0', '17', '', '', '', '', '', '', '0', '0', 'contactus', '0');
INSERT INTO `pk_list` VALUES ('1758', '0', '0', '40', '87', '1', '发展历程', '1458486519', '20', '1', '0', '22', '', '', '', '', '', '', '0', '0', 'development-course', '0');
INSERT INTO `pk_list` VALUES ('1759', '0', '0', '40', '87', '1', '工作环境', '1458486574', '30', '1', '0', '22', '', '', '', '', '', '', '0', '0', 'work', '0');
INSERT INTO `pk_list` VALUES ('1760', '0', '583', '24', '45', '1', '魅族 MX5 移动联通双4G手机 双卡双待', '1458626730', '0', '1', '0', '262', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1761', '0', '584', '24', '45', '1', '华为 P7 移动4G手机', '1458667195', '0', '1', '0', '12', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1762', '0', '585', '24', '45', '1', 'vivo Xplay5 全网通4G手机 4GB+128GB 双卡双待', '1458668060', '0', '1', '0', '20', '', '', '', '', '', '', '1480393813', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1763', '0', '216', '24', '45', '1', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '1458669038', '0', '1', '0', '244', '', '', '', '', '', '', '1480398396', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1772', '0', '0', '61', '142', '1', 'PHPOK.Com', '1459324936', '0', '1', '0', '0', '', '', '', '', '', '', '0', '23', '', '0');
INSERT INTO `pk_list` VALUES ('1802', '0', '0', '75', '386', '1', 'P2016033177U00023001', '1465808130', '0', '1', '0', '2', '', '', '', '', '', '', '0', '23', '', '0');
INSERT INTO `pk_list` VALUES ('1853', '0', '0', '0', '0', '0', '回家倒计时生成器', '0', '0', '0', '0', '0', '', '', '', '<p>春节越来越近了~</p><p>回家！回家！回家！</p><p><br></p><p>家里那些好吃的我都已经列好了！</p><p>甚至还做了个<strong><span style=\"color: rgb(255, 76, 0);\">回家倒计时生成器</span></strong></p><p><br></p><p>填上家乡和回家的日子就可以啦！</p><p><br></p><p><img src=\"http://mmbiz.qpic.cn/mmbiz_gif/JtllPS4fcwic7Px9XKbj', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1854', '0', '0', '0', '0', '0', '微信气泡狗正式进驻 iMessage！欢迎来斗图！', '0', '0', '0', '0', '0', '', '', '', '<p><img src=\"http://mmbiz.qpic.cn/mmbiz_jpg/JtllPS4fcwibxKU7wg3V1qmJGyKVKeHqUXXIo4Hj97JuxroR1rBL3Do7Tpqde0cHicDCsZBwtQ5WibDpjaDDB0iboQ/0?wx_fmt=jpeg\" alt=\"\"></p><section style=\"box-sizing: border-box; background-color: rgb(255, 255, 255);\"><section class=', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1855', '0', '0', '0', '0', '0', '微信职场表情特辑', '0', '0', '0', '0', '0', '', '', '', '<p><span style=\"color: rgb(255, 255, 255);\">0</span><br></p><p><img src=\"http://mmbiz.qpic.cn/mmbiz/JtllPS4fcw9D1hSianGGwUYoaicloMY0Un5TRmQicl9oE5ibF64WVnWvDicqb28DL7TjsZbL3XtHEThml1icBof3GZsA/0?wx_fmt=jpeg\" alt=\"\"></p><p><img src=\"http://mmbiz.qpic.cn/mm', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1856', '0', '0', '0', '0', '0', '十五到，微信表情陪你闹元宵', '0', '0', '0', '0', '0', '', '', '', '<section style=\"box-sizing: border-box; background-color: rgb(255, 255, 255);\"><section class=\"Powered-by-XIUMI V5\" style=\"   box-sizing: border-box; \"><section class=\"\" style=\"   box-sizing: border-box; \"><img src=\"http://mmbiz.qpic.cn/mmbiz/JtllPS4fcwib', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1857', '0', '0', '0', '0', '0', '女生节特辑丨送给女孩们的小福利', '0', '0', '0', '0', '0', '', '', '', '<section style=\"box-sizing: border-box; background-color: rgb(255, 255, 255);\"><section class=\"Powered-by-XIUMI V5\" style=\"box-sizing: border-box;\"><section class=\"\" style=\"   box-sizing: border-box; \"><section class=\"\" style=\"box-sizing: border-box;\"><se', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1858', '0', '0', '0', '0', '0', '元宵节，阿绿阿白和汤圆更配哦', '0', '0', '0', '0', '0', '', '', '', '<section style=\"box-sizing: border-box; background-color: rgb(255, 255, 255);\"><section class=\"Powered-by-XIUMI V5\" style=\"   box-sizing: border-box; \"><section class=\"\" style=\" margin-top: 10px; margin-bottom: 10px;  box-sizing: border-box; \"><section cl', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1859', '0', '0', '0', '0', '0', '【玩转新春朋友圈】喜庆的自拍怎么发？', '0', '0', '0', '0', '0', '', '', '', '<p style=\"text-align: center;\"><span style=\"color: rgb(61, 170, 214); \"></span><span style=\"color: rgb(61, 170, 214); line-height: 1.6;\">小伙伴们！</span></p><p style=\"text-align: center;\"><span style=\"color:#3daad6\">明天就大年三十啦</span></p><p style=\"text-align: ce', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1860', '0', '0', '0', '0', '0', '功夫熊猫和气泡狗给大家拜年啦！！', '0', '0', '0', '0', '0', '', '', '', '<p style=\"max-width: 100%; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25.6px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);\">最近气泡狗阿绿和阿白认识了大明星朋友—<s', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1861', '0', '0', '0', '0', '0', '能讨到多少红包就看此贴了...', '0', '0', '0', '0', '0', '', '', '', '<p style=\"text-align: center;\">总有些话憋在心里说不出口</p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\">比如说</p><p style=\"text-align: center;\">赏个红包吧</p><p><br></p><p style=\"text-align: center;\">但有了下面的法宝</p><p style=\"text-align: center;\">谈钱，就不伤', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1862', '0', '0', '0', '0', '0', '【温情腊八】从一碗满满的腊八粥开始', '0', '0', '0', '0', '0', '', '', '', '<p><br></p><p style=\"text-align: center; \"><span style=\"color: rgb(0, 122, 170); \">农历十二月初八是我们的腊八节~</span></p><p style=\"text-align: center; \"><span style=\"color: rgb(0, 122, 170); \">对很多人说</span></p><p style=\"text-align: center; \"><span style=\"color: rgb(0,', '', '', '0', '0', '', '0');
INSERT INTO `pk_list` VALUES ('1863', '0', '0', '0', '0', '0', '2016怎么high就看此帖了', '0', '0', '0', '0', '0', '', '', '', '<section style=\"box-sizing: border-box; background-color: rgb(255, 255, 255);\"><section class=\"Powered-by-XIUMI V5\" style=\"box-sizing: border-box;\"><section class=\"\" style=\"   box-sizing: border-box; \"><section class=\"\" style=\"box-sizing: border-box;\"><se', '', '', '0', '0', '', '0');

-- ----------------------------
-- Table structure for pk_list_21
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_21`;
CREATE TABLE `pk_list_21` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `link` longtext NOT NULL COMMENT '链接',
  `target` varchar(255) NOT NULL DEFAULT '_self' COMMENT '链接方式',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片播放器';

-- ----------------------------
-- Records of pk_list_21
-- ----------------------------
INSERT INTO `pk_list_21` VALUES ('1875', '1', '41', '0', '#', '_self', '1206');
INSERT INTO `pk_list_21` VALUES ('1876', '1', '41', '0', '#', '_blank', '1207');
INSERT INTO `pk_list_21` VALUES ('1877', '1', '41', '0', '#', '_blank', '1208');

-- ----------------------------
-- Table structure for pk_list_22
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_22`;
CREATE TABLE `pk_list_22` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` longtext NOT NULL COMMENT '内容',
  `note` longtext NOT NULL COMMENT '摘要',
  `linkurl` varchar(255) NOT NULL DEFAULT '' COMMENT '稿源',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章资讯';

-- ----------------------------
-- Records of pk_list_22
-- ----------------------------
INSERT INTO `pk_list_22` VALUES ('1399', '1', '43', '68', '', '<p ></p><ul><li >PTFE膜材&mdash;&mdash;耐久性强，使用寿命在30年以上</li><li >PTFE膜材&mdash;&mdash;是永久性建筑的首选材料</li><li >PTFE膜材&mdash;&mdash;超自洁，防火材料</li><li >PTFE膜材&mdash;&mdash;专业化的加工工艺，严格的施工规程<br /> 膜结构建筑中最常用的膜材料。PTFE膜材料是指在极细的玻璃纤维（3微米）编织成的基布上涂上PTFE（聚四氟乙烯）树脂而形成的复合材料。PVC膜材料是指在聚酯纤维编织的基布上涂上PVC（聚氟乙烯）树脂而形成的复合材料。</li></ul>', '', '');
INSERT INTO `pk_list_22` VALUES ('1400', '1', '43', '68', '', '<p ></p><ul><li >PTFE膜材&mdash;&mdash;耐久性强，使用寿命在30年以上</li><li >PTFE膜材&mdash;&mdash;是永久性建筑的首选材料</li><li >PTFE膜材&mdash;&mdash;超自洁，防火材料</li><li >PTFE膜材&mdash;&mdash;专业化的加工工艺，严格的施工规程<br /> 膜结构建筑中最常用的膜材料。PTFE膜材料是指在极细的玻璃纤维（3微米）编织成的基布上涂上PTFE（聚四氟乙烯）树脂而形成的复合材料。PVC膜材料是指在聚酯纤维编织的基布上涂上PVC（聚氟乙烯）树脂而形成的复合材料。</li></ul>', '', '');
INSERT INTO `pk_list_22` VALUES ('1401', '1', '43', '68', '', '<p ></p><pid=\"MyContent\"><p>  2020年东京奥运会和残奥会筹备委员会公布了作为东京奥运会主会场的新国立竞技场的概念图。</p><p>　　国际奥委会全会当地时间9月7日在阿根廷首都布宜诺斯艾利斯投票选出2020年夏季奥运会的主办城市。日本东京最终击败西班牙马德里和土耳其伊斯坦布尔，获得2020年夏季奥运会举办权。</p><p></p><p ></p><p align=\"center\"><img id=\"23416362\" align=\"center\" src=\"res/201509/02/1441090082_0_293.jpg\" width=\"602\" height=\"276\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416363\" align=\"center\" src=\"res/201509/02/1441090082_1_175.jpg\" width=\"600\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416364\" align=\"center\" src=\"res/201509/02/1441090082_2_260.jpg\" width=\"598\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p align=\"center\"></p><p >据了解，日本新国家体育场效果图是由东京奥运会审查委员会从全球募集的众多设计图中评选而出，该设计图出自的伊拉克女建筑家扎哈-哈迪德之手，从效果图来看，日本新国家体育场外观采用了全新的流线型设计，审查委员会给予了&ldquo;内部空间感强烈，与东京都城市空间相呼应&rdquo;、&ldquo;可开闭式天窗增加了体育场的实用性&rdquo;等高度评价。</p><p >根据计算，日本新国家体育场的扩建总花费将达到1300亿日元（约人民币78亿元），预计竣工时间为2019年3月，该体育场作为2020年东京奥运会比赛主会场，届时奥运会的开幕式、闭幕式、足球、田径等项目都将在该会场举行。</p><p ></p><p></p><p></p><p></p><p></p></p><p ></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1402', '1', '43', '68', '', '<p ><span >2014年，建筑节能与科技工作按照党中央、国务院关于深化改革的总体要求，围绕贯彻落实党的十八大、十八届三中全会关于生态文明建设的战略部署和住房城乡建设领域中心工作，创新机制、整合资源、提高效率、突出重点、以点带面，积极探索集约、智能、绿色、低碳的新型城镇化发展道路，着力抓好建筑节能和绿色建筑发展，努力发挥科技对提升行业发展水平的支撑和引领作用。</span></p><p >　　大力推进绿色建筑发展 实施&ldquo;建筑能效提升工程&rdquo;</p><p >　　研究制订&ldquo;建筑能效提升工程路线图&rdquo;，明确中长期发展目标、原则、总体思路和策略以及政策取向，为制订&ldquo;十三五&rdquo;建筑节能规划奠定基础。</p><p >　　继续抓好《绿色建筑行动方案》的贯彻落实工作。继续实施绿色生态城区示范，加大绿色建筑和绿色基础设施建设推广力度，强化质量管理。重点做好政府办公建筑、政府投资的学校、医院、保障性住房等公益性建筑强制执行绿色建筑标准工作。</p><p >　　稳步提升新建建筑节能质量和水平。做好新修订发布的民用建筑节能设计标准贯彻实施工作。加大抓好新建建筑在施工阶段执行标准的监管力度。总结国际国内先进经验，开展高标准建筑节能示范区试点。强化民用建筑规划阶段节能审查、节能评估、民用建筑节能信息公示、能效测评标识等制度。</p><p >　　继续开展既有居住建筑节能改造。确保完成北方采暖区既有居住建筑供热计量及节能改造1.7亿平方米以上，督促完成节能改造的既有居住建筑全部实行供热计量收费。力争完成夏热冬冷地区既有居住建筑节能改造1800万平方米以上。</p><p >　　提高公共建筑节能运行管理与改造水平。进一步做好省级公共建筑能耗动态监测平台建设工作。推动学校、医院等公益性行业和大型公共建筑节能运行与管理。指导各地分类制订公共建筑能耗限额标准，研究建立基于能耗限额的公共建筑节能管理制度。加快推行合同能源管理。积极探索能效交易等节能新机制。<img src=\"res/201509/02/1441090074_0_254.jpg\" border=\"0\" alt=\"\" /></p><p >　　推进区域性可再生能源建筑规模化应用。总结光伏建筑一体化示范项目经验，扩大自发自用光伏建筑应用规模。继续抓好可再生能源示范省、市、县(区)工作，推动资源条件具备的省(区、市)针对成熟的可再生能源应用技术尽快制定强制性推广政策。</p><p >　　加强和完善绿色建筑评价管理工作。修订印发《绿色建筑评价标识管理办法》和《绿色建筑评价技术细则》。加大对绿色建筑标识评价的指导监督力度，加强绿色建筑评价标准贯彻实施培训，引导和支持地方出台鼓励绿色建筑发展的政策措施。</p><p ><span >转载钢构之窗</span></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1403', '1', '43', '68', '', '<p ><span >建筑钢结构的发展揭开城市发展新篇章</span></p><p ><br /><br /> 建筑钢结构产业的发展是我国经济实力和科技水平快速发展的具体体现。近年来，在高层重型钢结构、大跨度空间钢结构、轻钢结构、钢-混凝土组合结构、钢结构住宅的共同发展推动下，我国城市经济快速发展。这些钢结构的广泛运用展示和证明了它的建筑魅力，以及无限的发展空间。<br /><br /><strong>　　高层重型钢结构成为城市的重要标志<br /></strong><br />高层钢结构建筑是一个国家经济实力和科技水平的反映，也往往被当作是一个城市的重要标志性建筑。在超高层建筑中往往采用部分钢结构或全钢结构建造，超高层建筑的发展体现了我国建筑科技水平、材料工业水平和综合技术水平的提高。</p><p ><img src=\"res/201509/02/1441090069_0_873.jpg\" alt=\"\" /></p><p >　　建筑钢结构揭开城市发展新篇章</p><p >　　从20世纪80年代至今我国已建成和在建高层钢结构达80多幢，总面积约600万平方米，钢材用量60多万吨。高层、超高层建筑的楼板和屋盖具有很大的平面刚度，是竖向钢柱与剪力墙或筒体的平面抗侧力构件，能使钢柱与各竖向构件起到变形协调作用。北京和上海新建和在建高层钢结构房屋数量超过了10幢。如上海环球金融中心101层，高492米，用钢量6.5万吨，中关村金融中心建筑面积11万平方米，高度为150米，用钢量1.5万吨。今后，全国每年将有200万平方米至300万平方米高层钢结构建筑施工，用钢量约45万吨。<br /><br /><strong>　　大跨度空间钢结构持续发展</strong><br /><br />近年来，以网架和网壳为代表的空间结构继续大量发展，不仅用于民用建筑，而且用于工业厂房、候机楼、体育馆、大剧院、博物馆等。开发空间钢结构的新材料、新结构、新技术、新节点、新工艺，实现大跨度与超大跨度空间钢结构的抗风抗震工程建设。展望未来，应在重点、热点、难点的科技领域开拓和发展各类新型、适用、美观的空间钢结构，并且无论在使用范围、结构型式、安装施工工法等方面均具有中国建筑结构的特色。如杭州、成都、西安、长春、上海、北京、武汉、济南、郑州等地的飞机航站楼、机库、会展中心等建筑，都采用圆钢管、矩型钢管制作为空间桁架、拱架及斜拉网架结构，其新颖和富有现代特色的风格使它们成为所在中心城市的标志性建筑。<br /><br />据中国钢结构协会空间结构分会统计：网架和网壳的生产已趋于平稳状态，每年建造1500座，约250万平方米，用钢约7万吨，悬索和膜结构目前处于发展阶段，用量还不大，专家预计每年将以20%的速度增加。随着我国经济建设的蓬勃发展和人民生活水平的不断提高，根据实际需要将在我国研究、设计、制作和安装150米至200米，甚至将大于200米的大跨度与超跨度的空间钢结构。</p><p ><strong>　揭开轻</strong><strong>钢结构</strong><strong>新的篇章</strong><br /><br />轻钢结构是相对于重钢结构而言的，其类型有门式刚架、拱型波纹钢屋盖结构等，用钢量（不含钢筋用量）一般为每平方米30公斤。门式刚架房屋跨度一般不超过40米，个别达到70多米，单跨或多跨均用，以单层为主，也可用于二层或三层建筑，拱型波纹钢屋盖结构跨度一般为8米，每平方米自重仅为20公斤，每年增长约100万平方米，用钢4万吨。门式刚架和拱型波纹钢屋盖都有相应的设计施工规程、专用软件和通用图集。<br /><br />自进入20世纪90年代以来，我国钢结构建筑的发展十分迅速，特别是一些代表城市标志性高层建筑的建成，为钢结构在我国的发展揭开了新的一页。如世界第三高的金茂大厦已竣工，现已投入运营。据了解，世界第一高度的上海浦东环球金融中心，高460米，建筑面积为31万平方米，现正在加紧建设中。由外商投资的大连总统大厦，正在加紧筹建之中，共95层，建成后其高度将名列世界前茅。</p><p ></p><p ><img src=\"res/201509/02/1441090069_1_435.jpg\" alt=\"\" /></p><p >　　建筑钢结构的发展 揭开城市发展新篇章</p><p ><br /><br />轻钢结构的发展则更是如火如荼，特别在工业厂房的建设中则更为迅猛。从钢结构制造加施工企业数量的大幅增长就可见一斑，如上海市的钢结构制造和施工单位已由原来的几十家发展到现在的400多家，仅上海的宝钢地区就有近百家的钢结构制造厂。<br /><br /><strong>　　钢-混凝土组合结构发展迅速</strong><br /><br />钢-混凝土组合结构是充分发挥钢材和混凝土两种材料各自优点的合理组合，不但具有优良的静、动力工作性能，而且能大量节约钢材、降低工程造价和加快施工进度，同时，对环境污染也较小，符合我国建筑结构发展的方向。<br /><br />钢-混凝土组合结构在我国发展十分迅速，已广泛应用于冶金、造船、电力、交通等部门的建筑中，并以迅猛的势头进入桥梁工程和高层、超高层建筑中。<br /><br />我国已采用钢-混凝土组合结构建成了许多大型的公路拱桥，如广州丫鬓沙大桥，桥长360米，重庆万州长江大桥，跨度420米，前者为钢管混凝土拱桥，后者为劲性钢管混凝土骨架拱桥。全国建成的组合结构拱桥已超过300座。在高层建筑方面，建成了全部采用组合结构的超高层建筑--深圳赛格广场大厦，高291.6米，属世界最高的钢-混凝土组合结构。全国已建成的采用组合结构的高层建筑也已超过40幢。<br /><br />钢-混凝土组合中的薄壁型钢主要有百叶薄壁型钢和装配式薄壁型钢等形式。其中，许多类型均能与混凝土有效地结合，共同承受外界弯矩和剪力，有的类型为装配式截面，布置较为灵活，可适用于不同截面尺寸的轻钢组合梁，并可作为标准型材批量生产，但在浇混凝土之前必须用框架固定其形状，有的为箱形薄壁型钢截面，与混凝土的粘结性能较差，一般只起到模板的作用。此外，还可根据实际需要，在薄壁型钢混凝土梁中配置一定数量的纵向钢筋，以进一步提高其抗弯刚度和极限承载力。<br /><br /><strong>　　钢结构住宅的发展走向</strong><br /><br />钢结构住宅具有强度高、自重轻、抗震性能好、施工速度快、结构构件尺寸小、工业化程度高的特点，同时钢结构又是可重复利用的绿色环保材料，因此钢结构住宅符合国家产业政策的推广项目。随着国家禁用实心粘土砖和限制使用空心粘土砖政策的推出，加快住宅产业化进程、积极推广钢结构住宅体系已迫在眉睫。但我国的钢结构住宅尚处于探索起步阶段，这种体系在钢结构防火、梁柱节点做法、楼板形式、配套墙体材料、经济性及市场可接受程度上尚有许多不完善之处。<br /><br />因此，发挥钢结构住宅的自身优势，可提高住宅的综合效益：一是用钢结构建造的住宅重量是钢筋混凝土住宅重量的1/2左右，可满足住宅大开间的需要，使用率也比钢筋混凝土住宅提高4%左右。二是抗震性能好，其延性优于钢筋混凝土。从国内外震后调查结果看，钢结构住宅建筑倒塌数量是最少的。三是钢结构构件、墙板及有关部品都在工厂制作，其质量可靠，尺寸精确，安装方便，易与相关部品配合，因此，不仅减少了现场工作量，而且也缩短了施工工期。钢结构住宅工地实质上是工厂产品的组装和集成场所，再补充少量无法在工厂进行的工序项目，符合产业化的要求。四是钢结构住宅是环保型的建筑，可以回收循环利用，污染很少，符合推进住宅产业化和发展节能省地型住宅的国家政策。</p><p ></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1404', '1', '43', '68', '', '<p ><p id=\"zoom2\"><p><font3 face=\"Verdana\"></font3>2013中国上海国际膜结构应用与工程技术展览</p><p><font3 face=\"Verdana\"></font3>同期举办：第二十四届中国国际绿色建筑建材博览会<br /> 第十五届中国上海国际园林、景观及别墅配套设施展览会<br /> 时间：2013年8月15日-17日 地点：上海新国际博览中心（龙阳路2345号）<br /><span class=\"Apple-converted-space\"></span><br /> 组织单位： 协办单位：<br /> 中国膜结构建筑行业专委会 上海市城乡建设和交通委员会<br /> 中国钢结构协会空间结构分会 中国房地产企业管理协会<br /> 中国风景园林绿化协会 上海市房地产协 <br /> 上海市园林景观学会 媒体推广：<br /> 香港博亚国际展览集团 中国膜结构网<br /> 承办单位： 《别墅》杂志<span class=\"Apple-converted-space\"></span><br /> 上海京慕展览策划有限公司《景观设计》杂志<br /><span class=\"Apple-converted-space\"></span><br /> 目前，在全球范围内索膜结构无论在工程界还是在科研领域均处于热潮中。近年来，我国建筑市场对索膜建筑技术的需求明显有大幅度增长的趋势，国外各大著名索膜技术专业公司纷纷登陆我国，刺激了我国索膜建筑事业的发展。现代建筑环境是现代城市，现代文化与社会，现代人的生活和观念的综合表象。展现人的个性化，自娱性和多元性环境空间方面，膜结构以其独具魅力的建筑形式，必将会在环境建设中得到越来越广泛的应用。由于新材料、新形式的不断出现，膜结构具有强大的生命力，必将是21世纪建筑结构发展的主流。它的应用范围不仅限于体育或展览建筑，已向房屋建筑的各个方面扩展，因而具有广阔的发展前景。在中国，膜结构的开发与研究还刚刚起步，因此当务之急是学习并引进国外先进技术，开发生产我国自己的膜材，解决设计中存在的问题，膜结构在中国也将会得到越来越多的应用。故此，特举办&ldquo;2013中国上海国际膜结构应用与工程技术展览会&rdquo;，为行业搭建一次合作、交流的平台。</p></p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1405', '1', '43', '68', '', '<p ><imgborder=\"0\" alt=\"\" width=\"913\" height=\"4495\" src=\"res/201509/02/1441090048_0_167.png\" /></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1406', '1', '43', '68', '', '<p >住建部发布了《城镇污水再生利用技术指南(试行)》(以下简称《技术指南》)用以指导城镇污水处理再生利用的规划、设施建设运行和管理。《技术指南》涵盖城镇污水再生利用技术路线、城镇污水再生处理技术、城镇污水再生处理工艺方案、城镇污水再生利用工程建设与设施运行维护、城镇污水再生利用风险管理等内容。</p><p ><strong >　　污水再生处理技术：常规处理、深度处理和消毒</strong></p><p >　　《技术指南》详细介绍了城镇污水再生处理技术，主要包括常规处理、深度处理和消毒。常规处理包括一级处理、二级处理和二级强化处理。主要功能为去除SS、溶解性有机物和营养盐(氮、磷)。深度处理包括混凝沉淀、介质过滤(含生物过滤)、膜处理、氧化等单元处理技术及其组合技术，主要功能为进一步去除二级(强化)处理未能完全去除的水中有机污染物、SS、色度、嗅味和矿化物等。消毒是再生水生产环节的必备单元，可采用液氯、氯气、次氯酸盐、二氧化氯、紫外线、臭氧等技术或其组合技术。</p><p >　　《技术指南》强调，城市污水再生处理系统应优先发挥常规处理在氮磷去除方面的功能，一般情况下应避免在深度处理中专门脱氮。</p><p ><strong >　　单元处理技术有机组合 保证不同用途水质要求</strong></p><p >　　《技术指南》指出，再生水的主要用途包括工业、景观环境、绿地灌溉、农田灌溉、城市杂用和地下水回灌等。污水再生处理工艺方案应根据不同用途的水质要求，选择不同的单元技术进行组合，并考虑工艺的可行性、整体流程的合理性、工程投资与运行成本以及运行管理方便程度等多方面因素，同时宜具有一定的前瞻性。《技术指南》针对各种不同用途给出了具体的工艺方案建议。对于向服务区域内多用户供水的城镇污水再生处理设施，供水水质应符合用水量最大的用户的水质要求;个别水质要求更高的用户，可自行增加处理措施，直至达到其水质要求。</p><p ><strong >　　风险管理核心：保证城镇污水再生利用的水质安全</strong></p><p >　　《技术指南》在城镇污水再生利用风险管理中强调，城镇污水再生利用必须保证再生水水源水质水量的可靠、稳定与安全，水源宜优先选用生活污水或不包含重污染工业废水在内的城市污水。要加强对污水接入城镇排水管网的许可管理，禁止含重金属、有毒有害有机物和病原微生物超标的工业或医疗等污水进入排水管网。</p><p >　　城镇污水再生利用的核心问题是水质安全。污水再生处理、存储及输配设施运营单位应具备相应的水质检测能力。另外，应制定针对重大事故和突发事件的应急预案，建立相应的应急管理体系，并按规定定期开展培训和演练。</p><p ><strong >　　城镇污水再生利用工程建设与设施运行维护</strong></p><p >　　在工程建设方面，《技术指南》指出，工程建设包括再生处理设施、再生水储存设施及再生水输配管网的建设，《技术指出》对选址、设计、设备选择、施工、验收等环节均提出指导建议。</p><p >　　在设施运行维护管理方面，《技术指南》指出，污水再生处理设施运营单位应加强对来水水质的日常监测，应依据污水排放&mdash;污水处理&mdash;再生水利用三者之间的水质关系，以及再生水用途和水质要求，建立水源水质控制目标。同时，应定期对储存设施进行检查，防止再生水泄漏或污染物入渗;定期对存储的再生水水质、水量进行监测，防止水质恶化;再生水作为城市河道或其他景观水系用水时，在汛期时，应服从统一调度，确保排水排涝畅通。</p><p ><strong >　　城镇污水再生利用 要合理布局统筹规划</strong></p><p >　　城镇污水再生利用规划是城镇排水与污水处理规划的重要内容。《技术指南》指出，污水处理厂的建设应考虑再生利用的需求，统一规划、统筹建设，对于暂时没有再生水需求的地方可以在污水处理厂规划过程中预留深度处理设施位置和接口。污水再生处理、储存和输配设施的布局应综合考虑水源和再生水用户的分布，统筹规划。再生水可通过压力管网、河道或供水车等方式输送至用户，管网的布置形式可选择环状或枝状管网，枝状管网末端需设置泄水设施;应考虑输配过程的加压、消毒及维护抢修站点用地等。再生水的储存和输配可充分利用城市景观水系。</p><p ><span >来源：中国污水处理工程网</span></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1407', '1', '43', '68', '', '<p ><span >摘　要: 本文主要介绍了选择中小规模城市污水处理厂工艺流程的依据、原则和方法, 并根据不同的条件推荐了适用的工艺流程。</span></p><p >关键词: 城市污水处理; 工艺流程; 原则; 方法</p><p ><br />1　前言</p><p >根据我国发展规划, 2010 年全国设市城市和建制镇的污水平均处理率不低于50% , 设市城市的污水处理率不低于60% , 重点城市的污水处理率不低于70%。为了引导城市污水处理及污染防治技术的发展, 加快城市污水处理设施的建设, 2000 年5 月国家建设部、环境保护局和科技部联合印发了《城市污水处理及污染防治技术政策》。本文将结合该政策的内容, 主要研究日处理能力为10 万m 3 以下, 特别是1～ 5 万m 3.d 规模的城市污水处理厂适用的各种处理工艺流程的比较和选择, 从而确定不同条件下适用的较优工艺流程。</p><p >1　中小规模城市污水处理厂工艺流程概述</p><p >二级生物处理指利用水中的微生物来去除污水中的碳源有机物, 二级强化生物处理是指除利用微生物来去除污水中的碳源有机物外, 还需去除污水中的<span class=\"keyword\">氮</span>和磷。城市污水二级及二级强化处理一般以好氧生物处理为主, 好氧处理可分为活性污泥法和生物膜法两大类。<br />活性污泥法是利用河川自净原理, 人工创建的生化净化污水处理方法。中小规模城市污水厂适用的方法主要有AB 法、SBR 法、氧化沟法、AO 法、 A 2O 法、水解好氧法等。</p><p >生物膜法是利用土壤自净原理发展起来的, 通过附着在各种载体上的生物膜来处理污水的好氧生物处理法, 主要包括生物转盘、生物滤池和生物接触氧化法等工艺。</p><p >2　污水处理工艺流程选择的依据和原则</p><p >2. 1　污水处理级别的确定</p><p >选择污水处理工艺流程时首先应按受纳水体的性质确定出水水质要求, 并依此确定处理级别, 排水应达到国家排放标准(GB8978- 1996)。<br />设市城市和重点流域及水资源保护区的建制镇必须建设二级污水处理设施; 受纳水体为封闭或半封闭水体时, 为防治富营养化, 城市污水应进行二级强化处理, 增强除磷脱<span class=\"keyword\">氮</span>的效果; 非重点流域和非水源保护区的建制镇, 根据当地的经济条件和水污染控制要求, 可先行一级强化处理, 分期实现二级处理。</p><p >2. 2　工艺流程选择应考虑的技术因素</p><p >处理规模; 进水水质特性, 重点考虑有机物负荷、<span class=\"keyword\">氮</span>磷含量; 出水水质要求, 重点考虑对<span class=\"keyword\">氮</span>磷的要求以及回用要求; 各种污染物的去除率; 气候等自然条件, 北方地区应考虑低温条件下稳定运行; 污泥的特性和用途。 2. 3　工艺流程选择应考虑的技术经济因素〔3〕批准的占地面积, 征地价格; 基建投资; 运行成本; 自动化水平, 操作难易程度, 当地运行<span class=\"keyword\">管</span>理能力。</p><p >2. 4　工艺流程选择的原则</p><p >保证出水水质达到要求; 处理效果稳定, 技术成熟可靠、先进适用; 降低基建投资和运行费用, 节省电耗; 减小占地面积; 运行<span class=\"keyword\">管</span>理方便, 运转灵活; 污泥需达到稳定; 适应当地的具体情况; 可积极稳妥地选用污水处理新技术。</p><p >3　污水处理工艺流程的比较和选择方法〔2、3、4、5〕</p><p >在选定污水处理工艺流程时可以采用下面介绍的一种或几种比较方法。</p><p >3. 1　技术比较</p><p >在方案初选时可以采用定性的技术比较, 城市污水处理工艺应根据处理规模、水质特性、排放方式和水质要求、受纳水体的环境功能以及当地的用地、气候、经济等实际情况和要求, 经全面的技术比较和初步经济比较后优选确定。</p><p >方案选择比较时需要考虑的主要技术经济指标包括: 处理单位水量投资、削减单位污染物投资、处理单位水量电耗和成本、削减单位污染物电耗和成本、占地面积、运行性能可靠性、<span class=\"keyword\">管</span>理维护难易程度、总体环境效益等。</p><p >定性比较时可以采用有定论的结论和经验值等, 而不必进行详细计算。几种常用生物处理方法的比较见表1。</p><img alt=\"\" src=\"res/201509/02/1441090034_0_765.jpg\"/><p ><br />3. 2　经济比较</p><p >在选定最终采用的工艺流程时, 应选择2～ 3 种工艺流程进行全面的定量化的经济比较。可以采用年成本法或净现值法进行比较。</p><p >3. 2. 1　年成本法。将各方案的基建投资和年经营费用按标准投资收益率, 考虑复利因素后, 换算成使用年限内每年年末等额偿付的成本- 年成本, 比较年成本最低者为经济可取的方案。</p><p >3. 2. 2　净现值法。将工程使用整个年限内的收益和成本(包括投资和经营费) 按照适当的贴现率折算为基准年的现值, 收益与成本现行总值的差额即净现值, 净现值大的方案较优。</p><p >3. 2. 3　多目标决策法。多目标决策是根据模糊决策的概念, 采用定性和定量相结合的系统评价法。按工程特点确定评价指标, 一般可以采用5 分制评分, 效益最好的为5 分, 最差的为1 分。同时, 按评价指标的重要性进行级差量化处理(加权) , 分为极重要、很重要、重要、应考虑、意义不大五级。取意义不大权重为1 级, 依次按2n- 1 进级, 再按加权数算出评价总分, 总分最高的为多目标系统的最佳方案。评价指标项目及权重应根据项目具体情况合理确定。</p><p >例如确定某城市污水处理厂工艺流程时采用了表2 所示的评价指标及权重:</p><img alt=\"\" src=\"res/201509/02/1441090034_1_947.jpg\"/><p >进行工艺流程选择时, 可以先根据污水处理厂的建设规模, 进水水质特点和排放所要求的处理程度, 排除不适用的处理工艺, 初选2～ 3 种流程, 然后再针对初选的处理工艺进行全面的技术经济对比后确定最终的工艺流程。</p><p >4　中小规模城市污水厂处理工艺流程选择的探讨〔6、7、8〕</p><p >4. 1　根据进水有机物负荷选择处理工艺</p><p >进水BOD5 负荷较高(如&gt; 250m g.L ) 或生化性能较差时, 可以采用AB 法或水解- 生物接触氧化法、水解- SBR 法等; 进水BOD5 负荷较低时可以采用SBR 法或常规活性污泥法等。</p><p >4. 2　根据处理级别选择处理工艺</p><p >二级处理工艺可选用氧化沟法、SBR 法、水解好氧法、AB 法和生物滤池法等成熟工艺技术, 也可选用常规活性污泥法; 二级强化处理要求除磷脱<span class=\"keyword\">氮</span>, 工艺流程除可以选用AO 法、A 2O 法外, 也可选用具有除磷脱<span class=\"keyword\">氮</span>效果的氧化沟法、CA SS 法和水解- 接触氧化法等; 在投资有限的非重点流域县城, 可以先建设一级强化处理厂, 采用水解工艺、生物絮凝吸附(即AB 法的A 段) 和混凝沉淀等物化强化一级处理, 待资金等条件成熟后再续建后续生物处理工艺, 形成水解好氧法、AB 法等完整工艺。</p><p >4. 3　根据回用要求选择处理工艺</p><p >严重缺水地区要求污水回用率较高, 应选择 BOD5 和SS 去除率高的污水处理工艺, 例如采用氧化沟或SBR 工艺, 使BOD5 和SS 均达到20m g.L 以下甚至更低, 则回用处理只需要直接过滤就可以达到生活杂用水标准, 整个污水处理及回用厂流程非常简捷、经济。</p><p >如果出水将在相当长的时期内用于农灌, 解决缺水问题, 则处理目标可以以去除有机物为主, 适当保留肥效。</p><p >4. 4　根据气候条件选择处理工艺</p><p >冰冻期长的寒冷地区应选用水下曝气装置, 而不宜采用表面曝气; 生物处理设施需建在室内时, 应采用占地面积小的工艺, 如UN ITAN K 等; 水解池对水温变化有较好的适应性, 在低水温条件下运行稳定, 北方寒冷地区可选择水解池作为预处理; 较温暖的地区可选择各种氧化沟和SBR 法。</p><p >4. 5　根据占地面积选择处理工艺</p><p >地价贵、用地紧张的地区可采用SBR 工艺(尤其是UN TAN K) ; 在有条件的地区可利用荒地、闲地等可利用的条件, 采用各种类型的土地处理和稳定塘等自然净化技术, 但在北方寒冷地区不宜采用。用水解池作为稳定塘的预处理, 可以改善污水的生化性能, 减小稳定塘的面积。</p><p >4. 6　根据基建投资选择处理工艺</p><p >为了节省投资, 应尽量采用国内成熟的, 设备国产化率较高的工艺。</p><p >基建投资较小的处理工艺有水解- SBR 法、 SBR 法及其变型、水解- 活性污泥法等。用水解池作预处理可以提高对有机物的去除率, 并改善后续二级处理构筑物污水的生化性能, 可使总的停留时间比常规法少30%。采用水解- 好氧处理工艺高效节能, 其出水水质优于常规活性污泥法。<br />氧化沟法在用于以去除碳源污染物为目的二级处理时, 与各种活性污泥法相比, 优势不明显, 但用于还须去除<span class=\"keyword\">氮</span>磷的二级强化处理时, 则投资和运行费用明显降低。</p><p >4. 7　根据运行费用选择处理工艺</p><p >节省运行费用的途径有降低电耗、减少污泥量、减少操作<span class=\"keyword\">管</span>理人员等。电耗较低的流程有自然净化、氧化沟、生物滤池、水解好氧法等, 污泥量较少的有氧化沟和SBR 等, 自动化程度高、<span class=\"keyword\">管</span>理简单的流程有SBR 等。综合比较, 在基建费相当的条件下, 运行费用较低的处理方法有氧化沟、SBR、水解好氧法等。</p><p >4. 8　污泥处理</p><p >中小规模城市污水处理厂产生的污泥可进行堆肥处理和综合利用, 采用延时曝气的氧化沟法、SBR 法等技术的污水处理设施, 污泥需达到稳定化。</p><p >4. 9　可以推广应用的新工艺</p><p >在尽量采用成熟可靠工艺流程的同时, 也要研究开发适用于北方地区中小污水厂的新工艺, 或审慎采用国内外新开发的高效经济的先进工艺技术。城市污水处理新工艺应向简单、高效、经济的方向发展, 各类构筑物从工艺和结构上都应向合建一体化发展。</p><p >目前可以重点考虑应用和推广使用的流程有一体化氧化沟技术、CA SS 、UN ITAN K 和膜法等。</p><p >5　结束语</p><p >城市污水处理工艺应根据污水水质特性、排放水质要求, 以及当地的用地、气候、经济等实际情况, 经全面的技术经济比较后优选确定。处理水量在10 万m 3 以下的城市污水处理厂可以优先考虑的处理工艺有水解- SBR 法、SBR 法、氧化沟法、AB 法、水解- 接触氧化法、AO 法等, 如果条件适宜也可采用稳定塘等自然净化工艺。来源：谷腾水网</p><pid=\"leftDiv\" ><pid=\"left2\" class=\"itemFloat\" ><br /></p></p><pid=\"rightDiv\" ><pid=\"right2\" class=\"itemFloat\" ><br /></p></p><p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1408', '1', '43', '68', '', '<p ><p ><pclass=\"MsoNormal\" align=\"left\"><span >钢结构因其自身优点，在桥梁、工业厂房、高层建筑等现代建筑中得到广泛应用。在大量的工程建设过程中，钢结构工程也暴露出不少质量通病。本文主要针对辽宁近年来在钢结构主体验收及竣工验收中的常见问题及整改措施谈一些看法。</span></p><pclass=\"MsoNormal\" align=\"center\"><b ><span >一、钢结构工程施工过程中的部分问题及解决方法</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">1</span></b><b ><span >、构件的生产制作问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span >门式钢架所用的板件很薄，最薄可用到</span><st1:chmetcnv w:st=\"on\" tcsc=\"0\" numbertype=\"1\" negative=\"False\" hasspace=\"False\" sourcevalue=\"4\" unitname=\"毫米\"><span lang=\"EN-US\">4</span><span >毫米</span></st1:chmetcnv><span >。多薄板的下料应首选剪切方式而避免用火焰切割。因为用火焰切割会使板边产生很大的波浪变形。目前</span><span lang=\"EN-US\">H</span><span >型钢的焊接大多数厂家均采用埋弧自动焊或半自动焊。如果控制不好宜发生焊接变形，使构件弯曲或扭曲。</span></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">2</span></b><b ><span >、柱脚安装问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(1)</span><span >预埋件</span><span lang=\"EN-US\">(</span><span >锚栓</span><span lang=\"EN-US\">)</span><span >问题现象：整体或布局偏移；标高有误；丝扣未采取保护措施。直接造成钢柱底板螺栓孔不对位，造成丝扣长度不够。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >措施：钢结构施工单位协同土建施工单位一起完成预埋件工作，混凝土浇捣之前。必须复核相关尺寸及固定牢固。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(2)</span><span >锚栓不垂直现象：框架柱柱脚底板水平度差，锚栓不垂直，基础施工后预埋锚栓水平误差偏大。柱子安装后不在一条直线上，东倒西歪，使房屋外观很难看，给钢柱安装带来误差，结构受力受到影响，不符合施工验收规范要求。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >措施：锚栓安装应坚持先将底板用下部调整螺栓调平，再用无收缩砂浆二次灌浆填实，国外此法施工。所以锚栓施工时，可采用出钢筋或者角钢等固定锚栓。焊成笼状，完善支撑，或采取其他一些有效措施，避免浇灌基础混凝土时锚栓移一位。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(3)</span><span >锚栓连接问题现象：柱脚锚栓未拧紧，垫板未与底板焊接；部分未露</span><span lang=\"EN-US\">2</span><span >～</span><span lang=\"EN-US\">3</span><span >个丝扣的锚栓。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >措施：应采取焊接锚杆与螺帽；在化学锚栓外部，应加厚防火涂料与隔热处理，以防失火时影响锚固性能；应补测基础沉降观测资料。</span></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">3</span></b><b ><span >、连接问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(1)</span><span >高强螺栓连接</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >螺栓装备面不符合要求，造成螺栓不好安装，或者螺栓紧固的程度不符合设计要求。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：</span></p><pclass=\"MsoNormal\" align=\"left\"><span >①表面有浮锈、油污等杂质，螺栓孔璧有毛刺、焊瘤等。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >②螺栓安装面虽经处理仍有缺陷。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span >①高强螺栓表面浮锈、油污以及螺栓孔璧毛病，应逐个清理干净。使用前必须经防锈处理，使拼装用的螺栓，不得在正式拼装时使用。螺栓应由专人保管和发放。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >②处理装配面应考虑到施工安装顺序，防止重复进行，并尽量在吊装之前处理。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >螺栓丝扣损伤，螺杆不能自由旋入螺母，影响螺栓的装配。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：丝扣严重锈蚀。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span >①使用前螺栓应进行挑选，清洗除锈后作预配。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >②丝扣损伤的螺栓不能做临时螺栓使用，严禁强行打进螺孔。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >③预先选配的螺栓组件应按套存放，使用时不得互换。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(2)</span><span >现场焊缝现象：质量难以保证；设计要求全焊透的一、二级焊缝未采用超声波探伤；楼面主梁与柱未施焊；未采用引弧板施焊。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：钢结构施焊前，对焊条的合格证进行检查，按设计要求选用焊含条，按说明书和操作规程要求使用焊条，焊缝表面不得有裂纹、焊瘤，一、二级焊缝不得有气孔、夹渣、弧坑裂纹，一级焊缝不得有咬边、未满焊等缺陷，一、二级焊缝按要求进行无损检测，在规定的焊缝及部位要检查焊工的钢印。不合格的焊缝不得擅自处理，定出修改工艺后再处理，同一部位的焊缝返修次数不宜超过两次。</span></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">4</span></b><b ><span >、构件的变形问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(1)</span><span >构件在运输时发生变形，出现死弯或缓弯，造成构件无法进行安装。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >构件制作时因焊接产生的变形，一般呈现缓弯。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >构件待运时，支垫点不合理，如上下垫木不垂直等或堆放场地发生沉陷，使构件产生死弯或缓变形。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3)</span><span >构件运输中因碰撞而产生变形，一般呈现死弯。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >预防措施：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >构件制作时，采用减小焊接变形的措施。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >组装焊接中，采用反方向变形等措施，组装顺序应服从焊接顺序，使用组装胎具，设置足够多的支架，防止变形。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3)</span><span >待运及运输中，注意垫点的合理配置。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >构件死弯变形，一般采用机械矫正法治理。即用千斤顶或其他工具矫正或辅以氧乙炔火焰烤后矫正。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >结构发生缓弯变形时，采取氧乙炔火焰加热矫正。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(2)</span><span >钢梁构件拼装后全长扭曲超过允许值，造成钢梁的安装质量不良。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >拼接工艺不合理。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >拼装节点尺寸不符合设计要求。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >拼装构件要设拼装工作台，定为焊时要将构件底面找平，防止翘曲。拼装工作台应各支点水平，组焊中要防止出现焊接变形。尤其是梁段或梯道的最后组装，要在定位焊后调整变形，注意节点尺寸要符合设计，否则易造成构件扭曲。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >自身刚性较差的构件，翻身施焊前要进行加固，构件翻身后也应进行找平，否则构件焊后无法矫正。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(3)</span><span >构件起拱，数值大干或小于设计数值。构件起拱数值小时，安装后梁下挠；起拱数值大时，易产生挤面标高超标。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >构件尺寸不符合设计要求。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >架设过程中，未根据实测值与计算值的出入进行修正。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3)</span><span >跨径小的桥梁，起拱度较小，拼装时忽视。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >严格按钢结构构件制作允许偏差进行各步检验。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >在架设过程中，杆件且装完毕，以及工地接头施工结束后，都进行上拱度测量，并在施工中对其他进行调整。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3)</span><span >在小拼装过程，应严格控制累计偏差，注意采取措施，消除焊接收缩量的影响。</span></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">5</span></b><b ><span >、钢结构安装问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(1)</span><span >钢柱底脚有空隙预控措施钢柱吊装前，应严格控制基础标高，测量准确，并按其测量值对基础表面仔细找平；如采用二次灌浆法，在柱脚底板开浇灌孔</span><span lang=\"EN-US\">(</span><span >兼作排气孔</span><span lang=\"EN-US\">)</span><span >，利用钢垫板将钢柱底部不平处垫平，并预先按设计标高安置好柱脚支座钢板，然后采取二次灌浆。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(2)</span><span >钢柱位移预控措施浇筑混凝土基础前，应用定型卡盘将预埋螺栓按设计位置卡住，以防浇灌混凝土时发生位移；柱低钢板预留孔应放大样，确定孔位后再作预留孔。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(3)</span><span >柱垂直偏差过大预控措施钢柱应按计算的吊挂点吊装就位，且必须采用二点以上的吊装方法，吊装时应进行临时固定，以防吊装变形；柱就位后应及时增设临时支撑；对垂直偏差，应在固定前予以修正。</span></p><pclass=\"MsoNormal\" align=\"center\"><b ><span >二、结论</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span >只有在施工管理过程中，加强对技术人员、工人对规范标准和操作规程的培训学习，切实做好开工前的准备，加强施工过程中的质量控制和监督检查，积极发挥施工、监理等各方面的作用，做好各分项工程的工序验收工作，才能保证钢结构工程的整体质量。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\"><o:p></o:p></span></p><pclass=\"MsoNormal\" align=\"left\"><span >信息来源：中国焊接网</span><spanlang=\"EN-US\"><o:p></o:p></span></p></p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1409', '1', '43', '68', '', '<p ></p><p ></p><p >绿色建筑评价标准<br />　　<br />　　1、在建筑的全寿命周期内，最大限度地节约资源(节能、节地、节水、节材)、保护环境和减少污染，为人们提供健康、适用和高效的使用空间，与自然和谐共生的建筑。<br />　　<br />　　2、节能能源：充分利用太阳能，采用节能的建筑围护结构以及采暖和空调，减少采暖和空调的使用。根据自然通风的原理设置风冷系统，使建筑能够有效地利用夏季的主导风向。建筑采用适应当地气候条件的平面形式及总体布局<br />　　<br />　　3、可再生能源：指从自然界获取的、可以再生的非化石能源，包括风能、太阳能、水能、生物质能、地热能和海洋能等。<br />　　<br />　　4、节约资源：在建筑设计、建造和建筑材料的选择中，均考虑资源的合理使用和处置。要减少资源的使用，力求使资源可再生利用。节约水资源，包括绿化的节约用水。<br />　　<br />　　5、可再利用材料：指在不改变所回收物质形态的前提下进行材料的直接再利用，或经过再组合、再修复后再利用的材料。<br />　　<br />　　6、可再循环利用材料：指已经无法进行再利用的产品通过改变其物质形态，生产成为另一种材料，使其加入物质的多次循环利用过程中的材料。<br />　　<br />　　7、以节约和适用的原则确定绿色建筑标准。<br />　　<br />　　8、绿色建筑建设应选用质量合格并符合使用要求的材料和产品，严禁使用国家或地方管理部门禁止、限制和淘汰的材料和产品。<br />　　<br />　　9、回归自然：绿色建筑外部要强调与周边环境相融合，和谐一致、动静互补，做到保护自然生态环境。<br />　　<br />　　10：建筑场地选址无洪灾、泥石流及含氡土壤的威胁，建筑场地安全范围内无电磁辐射危害和火、爆、有毒物质等危险源。<br />　　<br />　　11、住区建筑布局保证室内外的日照环境、采光和通风的要求，满足《城市居住区规划设计规范》GB50180中有关住宅建筑日照标准的要求。<br />　　<br />　　12、绿化种植适应当地气候和土壤条件的乡土植物，选用少维护、耐候性强、病虫害少，对人体无害的植物。<br />　　<br />　　13、建筑内部不使用对人体有害的建筑材料和装修材料。<br />　　<br />　　14、绿色建筑应尽量采用天然材料。建筑中采用的木材、树皮、竹材、石块、石灰、油漆等，要经过检验处理，确保对人体无害。<br />　　<br />　　良好的居住环境对室内和室外的要求都很高，绿色建筑能给人舒适和健康的生活居住环境，绿色建筑的建造并不等于高价和高成本，也不仅仅限于新建筑，最主要的是要环保、无害。</p><p ></p><p >　来源:0731房产网综合整理</p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1410', '1', '43', '68', '', '<p ><strong>美国回收材料打造&ldquo;资源保护屋&rdquo;</strong><p>　　美国政府的《超级基金法》规定&ldquo;任何生产有工业废弃物的企业，必须自行妥善处理，不得擅自随意倾卸&rdquo;。该法规从源头上限制了建筑垃圾的产生量，促使各企业自觉寻求建筑垃圾资源化利用途径。</p><p>　　近一段时间以来，美国住宅营造商协会开始推广一种&ldquo;资源保护屋&rdquo;，其墙壁就是用回收的轮胎和铝合金废料建成的，屋架所用的大部分钢料是从建筑工地上回收来的，所用的板材是锯末和碎木料加上20%的聚乙烯制成，屋面的主要原料是旧的报纸和纸板箱。这种住宅不仅积极利用了废弃的金属、木料、纸板等回收材料，而且比较好地解决了住房紧张和环境保护之间的矛盾。</p><p>　<strong>　法国将废物整体管起来</strong></p><p>　　法国CSTB公司是欧洲首屈一指的&ldquo;废物及建筑业&rdquo;集团，专门统筹在欧洲的&ldquo;废物及建筑业&rdquo;业务。公司提出的废物管理整体方案有两大目标：一是通过对新设计建筑产品的环保特性进行研究，从源头控制工地废物的产量；二是在施工、改善及清拆工程中，对工地废物的生产及收集作出预测评估，以确定相关回收应用程序，从而提升废物管理层次。</p><p>　　该公司以强大的数据库为基础，使用软件工具对建筑垃圾进行从产生到处理的全过程分析控制，以协助相关机构针对建筑物使用寿命期的不同阶段作出决策。例如，可评估建筑产品的整体环保性能；可依据有关执行过程、维修类别，以及不同的建筑物清拆类型，对某种产品所产生的废物量进行评估；可向顾问人员、总承建商，以及承包机构(客户)，就某一产品或产品系列对环保及健康的影响提供相关概览资料；可以对废物管理所需的程序及物料作出预测；可根据废物的最终用途或质量制订运输方案；就任何使用&ldquo;再造&rdquo;原料的新工艺，在技术、经济及环境方面的可行性作出评定，而且可估计产品的性能。</p><p><strong>　　荷兰有效分类建筑垃圾</strong></p><p>　　在荷兰，目前已有70%的建筑废物可以被循环再利用，但是荷兰政府希望将这一比例增加到90%。因此，他们制定了一系列法律，建立限制废物的倾卸处理、强制再循环运行的质量控制制度。荷兰建筑废物循环再利用的重要副产品是筛砂。由于砂很容易被污染，其再利用是有限制的。针对于此，荷兰采用了砂再循环网络，由拣分公司负责有效筛砂，即依照其污染水平进行分类，储存干净的砂，清理被污染的砂。</p><p>　　总体来讲，上述这些国家大多施行的是&ldquo;建筑垃圾源头削减策略&rdquo;，即在建筑垃圾形成之前，就通过科学管理和有效的控制措施将其减量化；对于产生的建筑垃圾则采用科学手段，使其具有再生资源的功能。</p><p>　　而对于已经过预处理的建筑垃圾，还有一些国家则运往&ldquo;再资源化处理中心&rdquo;，采用焚烧法进行集中处理，如德国西门子公司开发的干馏燃烧垃圾处理工艺，可使垃圾中的各种可再生材料十分干净地被分离出来，实现回收再利用，对于处理过程中产生的燃气则用于发电，每吨垃圾经干馏燃烧处理后仅剩下2到3公斤的有害重金属物质，从而有效地解决了垃圾占用大片耕地的问题。</p><p><strong>　　日本立法实现建筑垃圾循环利用</strong></p><p>　　由于国土面积小、资源相对匮乏，日本的构造原料价格比欧洲都要高。因此日本人将建筑垃圾视为&ldquo;建筑副产品&rdquo;，十分重视将其作为可再生资源而重新开发利用。比如港埠设施，以及其他改造工程的基础设施配件，都可以利用再循环的石料，代替相当数量的自然采石场砾石材料。</p><p>　　1977年，日本政府就制定了《再生骨料和再生混凝土使用规范》，并相继在各地建立了以处理混凝土废弃物为主的再生加工厂，生产再生水泥和再生骨料。1991年，日本政府又制定了《资源重新利用促进法》，规定建筑施工过程中产生的渣土、混凝土块、沥青混凝土块、木材、金属等建筑垃圾，必须送往&ldquo;再资源化设施&rdquo;进行处理。日本对于建筑垃圾的主导方针是：尽可能不从施工现场排出建筑垃圾；建筑垃圾要尽可能重新利用；对于重新利用有困难的则应适当予以处理</p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1411', '1', '43', '68', '', '<p >深圳宝安国际机场 T3 航站楼概念方案为美国兰德隆布朗公司和杨莫岚设计公司联合体设计，在此方案的基础上，通过国际招标，选定意大利 mFUKSASarch 建筑事务所的建筑方案，北京市建筑设计研究院中标为国内配合单位。在 2006~2008年期间，扩建工程指挥部进行了填海工程，以配合 T3航站楼的建设。T3航站楼南北长 1128m、东西宽 640m，建筑面积达55 万平方米左右，为目前国内最大单体面<br />积的航站楼之一。 T3 航站楼主体结构采用钢筋混凝土框架结构，整个航站楼的混凝土结构共分为 10 块。屋顶为不规则曲面，采用网壳结构。屋顶结构共分七块，包括主指廊D、次指廊G和H、交叉指廊C、过渡区B以及大厅A。典型屋顶结构的特点如下：<br />（1） 主指廊D块和次指廊G、 H块屋顶 这三部分屋顶网壳均采用斜交斜放的双层筒壳， 网壳曲面延伸到二层楼面 （标<br />高4.4m），与下部混凝土支承结构对应，屋顶结构每隔18m设一支座铰接于混凝土异形柱，并且在与支座对应的屋顶部位，<br />设置两片加强桁架作为主要受力体系。沿结构横向剖面，支座间距均为44.8m，主指廊最宽处为61.1m左右，次指廊最宽处<br />为 54.9m 左右。网壳主网格尺寸为 5.4m，为配合屋顶幕墙的需要，还布置有加密的檩条，檩条与主网格之间铰接。因屋顶<br />曲面造型的需要， 沿筒壳纵向和横向均变厚度，主指廊 （D块） 网壳最厚处为8.8m， 次指廊（G和H块） 网壳最厚处为4.2m。<br />因筒壳面内刚度较大且筒壳较长，为减小屋顶的温度内力，沿筒壳的纵向布置了弹簧支座。同时弹簧支座也减小了由于屋顶<br />分块和混凝土分块不对应、下部混凝土和上部筒壳变形不一致造成的上、下部相互影响。 <br />（2）交叉指廊C块屋顶 交叉指廊部分的屋顶由主指廊和次指廊屋顶交叉形成， 也是采用带加强桁架的斜交斜放网壳<br />结构。其中主指廊方向屋顶长度为162m，包括4榀落在2层楼面上（标高＋4.4m）的加强桁架；次指廊方向长度为199m，包括 10 榀落在 2 层楼面上的加强桁架。另外沿主指廊方向存在 108m 跨度的室内大厅，为此在室内大厅布置了 4 个落在三层楼面（标高+8.8m）的摇摆柱，在摇摆柱上方沿主指廊方向设置了两榀加强桁架。为提高结构刚度、减小关键加强桁架的内力（红色虚线圈出<br />的为加强桁架），设置16根水平拉杆将加强桁架与3层楼面的混凝土结<br />构拉接。 <br />（3）大厅屋顶A块 大厅屋顶跨越E、A和F共三块混凝土结构，东西方向长约640m，南北方向宽约320m，投影面积约为12.3万m2。屋顶支承结构的柱网为36m&times;36m和36m&times;27m两种，由钢筒体、框架柱、<br />摇摆柱以及一榀加强拱架组成屋顶支承体系，承担屋顶的竖向荷载、水平荷载以及幕墙的各种荷载。这里的框架柱均下端与混凝土结构铰接、上端与屋顶网架刚接，这种柱子的受力特点也与柱子下端横截面小、上端横截面大的截面形式一致。屋顶结构采用斜交斜放曲面网架，网格尺寸5.4m，网架高度3.6m。另外与屋顶支承体系的柱网配合，还设有正交正放加强桁架，加强桁架的网格尺寸为4.5m。 目前该工程正在设计中，还有很多问题需要研究，例如满足建筑外观要求、具有一定减震、减小温度内力作用的弹簧铰<br />支座。在长 640m、宽 320m的大厅区采用钢筒体+上端刚接、下端铰接的框架柱+摇摆柱的结构体系，有很多问题都是未遇<br />见的、其设计标准也需要进行性能化研究。</p><p ></p><p ></p><p ><em>转载</em></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1412', '1', '43', '68', '', '<p ><img src=\"res/201509/02/1441090016_0_396.jpg\" border=\"0\" alt=\"\" /></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1413', '1', '43', '68', '', '<p >在新中国成立60周年之际，建设科技正处于大发展的阶段。在科学发展观指导下，可持续发展的理念日益深入人心，建设行业的各领域无不突出着节能的宗旨，建筑节能成为当今建设科技发展的重要主题，并不断进步，与建筑节能有关的科学技术取得了丰硕成果。高度重视建筑节能，正是今天建设科技和建设行业的一大特点。<p>　<strong>　21世纪建设科技的主旋律</strong></p><p>　　我国的建筑节能，起步于上世纪80年代。改革开放后，建筑业在墙体改革及新型墙体材料方面有了发展。与此同时，一批高能耗的高档旅馆、公寓和商场出现了。如何在发展中降低建筑能耗，使之与当时能源供应较紧缺的现状相协调，成为相关部门关注的重点。为此，建筑节能工作首先从减少采暖能耗开始，1986年建设部颁布了《民用建筑节能设计标准》，要求新建居住建筑，在1980年当地通用设计能耗水平基础上节能30%%，《民用建筑节能设计标准》是我国第一部建筑节能设计标准，它的颁布，开启了我国建筑节能新阶段。以它提出的指标为目标，建筑节能的设计、节能技术纷纷发展起来，一系列的标准和法规先后制定。</p><p>　　20世纪90年代，建筑节能的地位进一步提高，节能工作有效开展。1990年，建设部提出&ldquo;节能、节水、节材、节地&rdquo;的战略目标。1994年在《中国21世纪议程》中，建筑节能作为项目之一被郑重提出;从1994年起，国家对北方节能建筑实施免征固定资产投资方向调节税，一批节能小区相继建成。1995年《民用建筑节能设计标准》修订并于次年执行，修订后的《民用建筑节能设计标准》将第二阶段建筑节能指标提高到50%%。同年，建设部发布《建筑节能&ldquo;九五&rdquo;计划和2010年规划》，这个专门的规划以及1996年9月建设部发布的《建筑节能技术政策》和《市政公用事业节能技术政策》，为其后建筑节能的发展明确了方向，同时也表明建筑节能地位的空前提高。建筑节能的地位最终由1998年1月1日实施的《中华人民共和国节约能源法》确定下来，建筑节能成为这部法律中明确规定的内容。</p><p>　　21世纪的到来，在科学发展观的指引下，建设领域明确了必须走资源节约型、环境友好型的新型工业化道路，建设科技工作将&ldquo;四节一环保&rdquo;作为科技攻关的主要方向，取得了明显效果。目前我国已初步建立起了以节能50%%为目标的建筑节能设计标准体系，部分地区执行更高的65%节能标准。2008年《民用建筑能效测评标识管理暂行办法》、《民用建筑节能条例》等施行，《民用建筑节能条例》的颁布，标志着我国民用建筑节能标准体系已基本形成，基本实现对民用建筑领域的全面覆盖。</p><p>　　在国务院办公厅《2009年节能减排工作安排》中规定，2009年底施工阶段执行节能强制性标准比例提高到90%以上。除新建建筑外，既有建筑的节能改造也有效开展起来，并取得了一批成果和经验。而兼顾土地资源节约、室内环境优化、居住人的健康、节能节水节材等方面的目标绿色建筑，成为新世纪建筑节能发展的亮点。</p><p><strong>　　建筑节能技术飞速发展</strong></p><p>　　在建筑节能逐步成为建设科技主旋律的过程中，相关的节能技术也有了长足进步。</p><p>　　在建设部组织下，&ldquo;九五&rdquo;期间实施了&ldquo;2000年小康型城乡住宅科技产业工程&rdquo;，&ldquo;十五&rdquo;期间组织实施了&ldquo;小城镇科技发展重大专项&rdquo;、&ldquo;居住区与小城镇建设关键技术研究&rdquo;、&ldquo;绿色建筑关键技术研究&rdquo;等，&ldquo;十一五&rdquo;期间实施了&ldquo;建筑节能关键技术研究与示范&rdquo;、&ldquo;现代建筑设计与施工关键技术研究&rdquo;、&ldquo;既有建筑综合改造关键技术研究与示范&rdquo;、&ldquo;可再生能源与建筑集成技术研究与示范&rdquo;等项目，这些科研攻关项目的组织实施，使一系列建筑节能的重大、关键、共性技术得到突破，形成了一大批科技成果。</p><p>　　建筑节能的各项技术都达到很高水平。</p><p>　　降低建筑能耗，首先要从围护结构、外墙、屋面、外门窗来实现。墙体改革的调查研究开始于上世纪70年代，80年代以来，新型墙体材料和高保温材料不断涌现，混凝土空心砌块、聚苯乙烯泡沫板等材料，逐渐替代了传统墙体材料，在建筑节能中发挥了重要作用。同时，我国广泛开展研究建筑外墙保温技术，近年来，各种外墙外保温技术系统日益成熟并在工程中应用，显示出良好前景。</p><p>　　此外还有建筑门窗。门窗传热系数的高低，决定了能耗的高低，要降低能耗，就必须提高门窗的热工性能，增加门窗的隔热保温性能。近20年来，为满足节能需求，外窗玻璃产品及工艺水平迅速发展，由之前采用普通单层玻璃、双层玻璃发展到中空、充气、LOW-E玻璃，塑钢型材、钢化玻璃等也广泛应用，取代了传统的钢窗和铝合金门窗。</p><p>　　建筑能耗的降低，还有赖于暖通技术和设备。为实现采暖系统的节能，上世纪80年代我国研发了平衡供暖技术及其产品、锅炉运行管理技术与产品。在散热器方面，上世纪90年代以来各种新型散热器纷纷得到开发，这些新产品比传统的铸铁散热器，具有金属热强度高、散热性能好、承压能力高、造型美观、工艺性好、安装方便等优点。</p><p>　　进入新世纪后，随着既有建筑节能改造的开展，供热改革成为建筑节能的重要内容。为适应改革的需要，室温可调和采暖计量收费技术及产品有了进一步的发展。采暖系统的单管顺流系统变为双管系统，散热器恒温阀及热表的应用已经十分普及。</p><p>　　技术是保证建筑节能得以实现的关键，多年来我国建筑节能技术的发展，让人们对&ldquo;十一五&rdquo;期间实现建筑节能1.6亿吨标准煤的目标充满信心。</p><p><strong>　　绿色建筑成果丰硕</strong></p><p>　　绿色建筑是生态环境与建筑有机结合，在建筑生命周期内最大限度地节约资源、保护环境，为人们提供高效、舒适空间的建筑。近10年来，绿色节能建筑成为建筑节能中的一大亮点，体现了新世纪建筑节能更高的追求目标。</p><p>　　进入21世纪后，绿色建筑评价体系逐步建立，保证了绿色建筑的健康发展。2001年建设部住宅产业化促进中心编制了《绿色生态住宅小区建设要点与技术导则》，2004年建设部针对北京奥运会，开展了&ldquo;绿色奥运建筑评估体系&rdquo;课题研究，形成了我国第一套绿色建筑项目标准。同年8月建设部颁布实施《全国绿色建筑创新奖管理办法》，次年，首届全国绿色建筑创新奖揭晓，40个项目获得此项殊荣，中国在推进智能与绿色建筑方面迈出了坚实的一步。2005年，历时5年编制完成的《绿色建筑技术导则》颁布施行，自此，绿色建筑的评定有了明确依据。&ldquo;十五&rdquo;期间，重点攻关计划&ldquo;绿色建筑规划设计导则和评估体系研究&rdquo;项目完成。2006年，建设部组织编制了《绿色建筑评价标准》。2007年8月，《绿色建筑评价技术细则》和《绿色建筑评价标识管理办法》出台，2008年6月住房和城乡建设部为进一步规范和细化绿色建筑评价标识工作，根据评价标识工作实际情况，编制了《绿色建筑评价技术细则补充说明(规划设计部分)》，制定了《绿色建筑评价标识使用规定》，进一步完善了绿色建筑设计评价标识的申报评价程序。</p><p>　　一系列工作，建立了适合我国国情的绿色建筑评价体系，有力地推动了绿色建筑技术发展。经过多年的攻关和研究，绿色建筑形成了六大技术体系评价标准：节地与室外环境、节能与能源利用、节水与水资源利用、节材与材料资源利用、室内环境质量及运营管理。通过对建筑的节能、节水、节地、节材和室内环境的具体性能进行实测，给出数据，实现定量化检测标准，达到标准的即为绿色建筑。</p><p>　　2008年8月，住房城乡建设部建筑节能与科技司向首批绿色建筑设计评价标识项目颁发了证书，上海世博会世博中心工程等6个项目获得了行业主管部门认可的第一批绿色建筑设计评价标识，标志着由政府部门主导的绿色建筑评价正式启动，结束了我国依赖国外标准进行绿色建筑评价的历史。</p><p>　　回顾建筑节能的历程，可以看到，这项利国利民的事业，紧跟时代步伐，取得了举世瞩目的成就。而这一切，没有党和政府的重视，是不可想象的。也正因此，人们完全有理由对建筑节能的前景充满信心。</p><p></p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1414', '1', '43', '68', '', '<p ><p align=\"center\"><img title=\"8月30日拍摄的世博轴膜结构工程（局部）。 8月30日，上海世博园区世博轴膜结构工程全面完成。世博轴工程采用全新建筑形式，其屋顶设计为长约840米、宽约97米的巨型索膜结构，形如蓝天下的朵朵白云，并在整个索膜覆盖的结构中设置了6个巨型圆锥状钢结构&ldquo;阳光谷&rdquo;，让自然光透过&ldquo;阳光谷&rdquo;倾泻而下，满足部分地下空间的采光，体现环保和节约的理念。据介绍，世博轴索膜结构厚度仅为1毫米，使用寿命可达30年。新华社发 \"height=\"175\" src=\"res/201509/02/1441090001_0_548.jpg\" width=\"402\" alt=\"\" /></p><p> 8月30日拍摄的世博轴膜结构工程（局部）。 8月30日，上海世博园区世博轴膜结构工程全面完成。世博轴工程采用全新建筑形式，其屋顶设计为长约840米、宽约97米的巨型索膜结构，形如蓝天下的朵朵白云，并在整个索膜覆盖的结构中设置了6个巨型圆锥状钢结构&ldquo;阳光谷&rdquo;，让自然光透过&ldquo;阳光谷&rdquo;倾泻而下，满足部分地下空间的采光，体现环保和节约的理念。据介绍，世博轴索膜结构厚度仅为1毫米，使用寿命可达30年。新华社发</p><p align=\"center\"><img title=\" 8月30日拍摄的世博轴膜结构工程全景（拼图）。 新华社发\" src=\"res/201509/02/1441090001_1_697.jpg\" alt=\"\" /></p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1415', '1', '43', '68', '', '<p ></p><ul><li >PTFE膜材&mdash;&mdash;耐久性强，使用寿命在30年以上</li><li >PTFE膜材&mdash;&mdash;是永久性建筑的首选材料</li><li >PTFE膜材&mdash;&mdash;超自洁，防火材料</li><li >PTFE膜材&mdash;&mdash;专业化的加工工艺，严格的施工规程<br /> 膜结构建筑中最常用的膜材料。PTFE膜材料是指在极细的玻璃纤维（3微米）编织成的基布上涂上PTFE（聚四氟乙烯）树脂而形成的复合材料。PVC膜材料是指在聚酯纤维编织的基布上涂上PVC（聚氟乙烯）树脂而形成的复合材料。</li></ul>', '', '');
INSERT INTO `pk_list_22` VALUES ('1416', '1', '43', '68', '', '<p><strong><span >  <span >ETFE建筑</span></span></strong><span ><span >膜</span><span >材是一种乙烯</span><span >-</span><span >四氟乙烯的共聚物</span><span >.ETFE膜材的厚度通常小于0.20mm，是一种透明膜材.</span></span></p><p><span ><span >   用ETFE原料制成的膜材料替代传统的玻璃和其他高分子采光板用于大型建筑物的屋面或墙体材料，显示出无可比拟的优势。</span></span></p><p><span ><span > ETFE膜使用寿命至少为25-35年,</span><span > ETFE</span><span >膜达到</span><span >B1</span><span >、</span><span >DIN4102防火等级标准，燃烧时也不会滴落。且该膜质量很轻，每平方米只有0.15-0.35公斤。这种特点使其即使在由于烟、火引起的膜融化情况下也具有相当的优势。</span></span></p><p><span ><span > 与玻璃不同的是ETFE具有很好的隔热介质，单层膜可以在无色膜材上印刷不同图案，可调节室内光线。</span></span></p><p><p ><img src=\"res/201509/02/1441090077_0_111.jpg\" border=\"0\" alt=\"\" /></p><p ><img src=\"res/201509/02/1441090077_1_885.jpg\" border=\"0\" alt=\"\" /></p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1417', '1', '43', '68', '', '<p class=\"MsoNormal\" ><b><span lang=\"EN-US\" >2014</span></b><b><span >第三届中国（广州）国际建筑钢结构、空间结构及金属材料设备展览会</span></b><b><span lang=\"EN-US\" ><o:p></o:p></span></b></p><p class=\"MsoNormal\" ><b><span lang=\"EN-US\" >The 3<sup>rd</sup><st1:country-region w:st=\"on\">China</st1:country-region>(<st1:city w:st=\"on\">Guangzhou</st1:city>) International Exhibition for<st1:place w:st=\"on\"><st1:placename w:st=\"on\">Steel</st1:placename><st1:placename w:st=\"on\">Construction &amp; Metal</st1:placename><st1:placetype w:st=\"on\">Building</st1:placetype></st1:place>Materials<o:p></o:p></span></b></p><p class=\"MsoNormal\" ><span >地点：中国进出口商品交易会&middot;琶洲展馆<span lang=\"EN-US\"></span></span><b><span >时间</span></b><span >：<st1:chsdate w:st=\"on\" isrocdate=\"False\" islunardate=\"False\" day=\"12\" month=\"5\" year=\"2014\"><span lang=\"EN-US\">2014</span>年<span lang=\"EN-US\">5</span>月<span lang=\"EN-US\">12</span>日</st1:chsdate><span lang=\"EN-US\">-14</span>日</span></p><p class=\"MsoNormal\" ><b><span lang=\"EN-US\" ><o:p></o:p></span></b></p><pclass=\"Section1\" ><p class=\"MsoNormal\" align=\"left\" ><v:line id=\"_x0000_s1026\" strokeweight=\"1.5pt\" to=\"549.7pt,3.1pt\" from=\"-7.95pt,3.1pt\" ></v:line><b><span >主办单位：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" align=\"left\" ><span >亚洲建筑技术联盟协会<span lang=\"EN-US\"></span>中国市政工程协会<span lang=\"EN-US\"></span>中国贸促会建设行业分会集成建筑委员会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >广东省空间结构学会<span lang=\"EN-US\"></span>粤港经济合作交流促进会<span lang=\"EN-US\"></span>香港鸿威展览集团<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span >协办单位：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" align=\"left\" ><span >中国贸促会建设行业分会国际交流中心<span lang=\"EN-US\"></span>东莞市建筑金属结构行业协会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span >国际机构：</span></b><span lang=\"EN-US\" ><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" ><span >美国钢结构协会<span lang=\"EN-US\"></span>澳大利亚钢结构协会<span lang=\"EN-US\"></span>加拿大钢结构协会<span lang=\"EN-US\"></span>韩国钢结构协会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >智利钢结构协会<span lang=\"EN-US\"></span>日本钢结构协会<span lang=\"EN-US\"></span>墨西哥钢结构协会<span lang=\"EN-US\"></span>新西兰钢结构协会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >新加坡钢结构协会<span lang=\"EN-US\"></span>法国驻广州总领事馆商务处<span lang=\"EN-US\"></span>美国钢铁协会<span lang=\"EN-US\"></span>欧洲钢结构协会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >新西兰驻广州总领事馆<span lang=\"EN-US\"></span>新西兰大型工程研究会<span lang=\"EN-US\"></span>西班牙安达卢西亚自治区政府贸促会上海代表处<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >尼日利亚联邦共和国驻上海总领事馆<span lang=\"EN-US\"></span>日本建筑钢骨协会<span lang=\"EN-US\"></span>丹麦未来产业化可持续建筑和城市发展组织</span><span lang=\"EN-US\" ><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span >承办单位：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" ><span >广州市鸿威展览服务有限公司<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" ><b><span >支持单位：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" align=\"left\" ><span >广东省住房和城乡建设厅<span lang=\"EN-US\"></span>浙江省钢结构行业协会<span lang=\"EN-US\"></span>江苏省建筑钢结构混凝土协会钢结构分会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >四川省金属结构行业协会<span lang=\"EN-US\"></span>辽宁省建筑金属结构协会<span lang=\"EN-US\"></span>福建建筑业协会金属结构与建材分会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >安徽省钢结构协会<span lang=\"EN-US\"></span>河南省钢结构协会<span lang=\"EN-US\"></span>山西省土建学会空间结构专业委员会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >香港建筑金属结构协会<span lang=\"EN-US\"></span>澳门金属结构协会<span lang=\"EN-US\"></span>山东省勘察设计协会钢结构分会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >上海市金属结构行业协会<span lang=\"EN-US\"></span>天津市钢结构学会<span lang=\"EN-US\"></span>北京市建设工程物资协会钢结构分会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span >支持媒体：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" align=\"left\" ><span >广东电视台、南方电视台、中国建设报、中华建筑报、建筑时报、广东建设报、羊城晚报、新浪地产、搜房网、中国钢结构网、中国钢结构资讯网、钢结构在线、中国生态环境与节能建设网、建筑钢结构网、钢结构网、广东建设信息网、钢构之窗、《钢结构》杂志、《中国住宅设施》、《中国钢结构产业》、《钢结构资源》、商务时报品牌钢构周刊、《钢结构与设备》杂志<span lang=\"EN-US\">...</span>各协会（学会）刊物及网站等一百多家海内外媒体<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span lang=\"EN-US\" ><o:p></o:p></span></b></p></p><p ><b><span lang=\"EN-US\" ><br clear=\"all\"/></span></b></p><p class=\"MsoNormal\" align=\"center\" ><b><i><span >以钢代木，保护地球生态资源；以钢代砼，促进绿色环保建筑</span></i></b></p><p ><span ><p class=\"MsoNormal\" ><strong>参展范围<o:p></o:p></strong></p><p class=\"MsoNormal\" ><span >1、钢结构及钢铁产品，包括建筑金属结构、钢结构、轻钢结构、重钢结构、海洋结构、预应力结构、钢砼组合结构、空间网架结构、拉膜结构等空间结构；重钢、轻钢、H型钢、无缝钢管、工字型钢、冷弯型钢、特殊钢材等；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >2、建筑钢结构板材、板件，包括中厚板、压型板、采光板、夹芯板、不锈钢薄板、镜面板、艺术板、镀钛板、彩色涂层板等板材；不锈钢棒、线、管材等；彩钢、钢结构预制品等；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >3、钢结构连接产品和设备，包括各种固件锚栓及标准和非标准紧固件，螺栓，栓钉，铆钉，锚夹具；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >4、建筑钢结构安全防护工业体系，包括涂料、防腐、保温、隔热、防水、防火耐火产品及防爆技术；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >5、新型住宅房屋技术及配套装饰、装修产品类：新型房屋设计、建设单位、新型结构产品、墙体、屋面、门窗、龙骨、幕墙、楼层板、吊顶、遮阳系统、通风设备；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >6、铝合金、塑钢、非金属装饰性材料及相关技术和设备类：铝合金、塑钢、复合材料等装饰性构件和板材、玻璃制品；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >7、立体车库设备、钢结构门业；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >8、金属钢结构加工配套设备及检测设备类，包括各种成型加工设备、焊接设备、焊接材料、切割、铸造、数控技术及五金电动工具、施工安装机具、喷涂设备、涂锈设备、钢材检验、探伤设备等；桥梁、塔桅、容器、管道的制造加工设备；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >9、计算机设计、分析、计算与CAD绘图软件类：各类钢结构设计、分析、计算软件；项目管理、投标及工程预算软件；加工中心与结构样图CAD工作站等；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >10、节能节地型建筑（钢结构住宅试点工程、实验基地）；钢结构领域新成果（名人、名企、名项目）；钢结构工程招标；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >11、设计及施工展示（大型场馆、会议中心、大型公共建筑的设计技术及方案，大型施工公司示范工程）；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >12、建筑设计及房地产项目规划设计区：建筑设计院所、优秀建筑设计项目、优秀房地产规划项目、技术咨询单位样板工程</span></p></span></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1418', '1', '43', '68', '', '<p ></p><h2>青口镇文体中心外立面膜结构工程（重新招标）</h2><pclass=\"gg-xl-fbsj\">来源：中国国际招标网 发布时间：2014.02.21</p><!--div class=\"gg-jdb\"><img src=\"res/201509/02/1441090066_0_157.gif\" width=\"292\" height=\"82\"/></a></div--><!--有权限--><pclass=\"gg-conte\"><p ><palign=\"left\">招 标 公 告</p><palign=\"left\">1. 招标条件</p><palign=\"left\">本招标项目青口镇文体中心外立面膜结构工程（重新招标）已由闽侯县发展和改革局以侯发改审批[2013]44号批准建设，项目业主为闽侯县青口镇人民政府，建设资金来自财政拨款，招标人为闽侯县青口镇小城镇综合改革建设试点指挥部，委托的招标代理单位为福建省闽建工程造价咨询有限公司。项目已具备招标条件，现对该项目的设计、施工进行国内公开招标。</p><palign=\"left\">2. 项目概况和招标范围</p><palign=\"left\">2.1. 建设地点：青口镇壶山村；</p><palign=\"left\">2.2. 工程建设规模：青口镇文体中心的综合馆气枕包覆面积约5300㎡，游泳馆气枕包覆面积约3300㎡，综合馆和游泳馆中部PTFE雨棚覆盖面积约2000㎡；最高控制价为18845308元 ；</p><palign=\"left\">2.3. 招标范围和内容： 青口镇文体中心外立面膜结构工程施工，内容包括 ETFE 充气膜 结构、PTFE雨棚的二次深化设计、材料供应、膜结构工程制作及安装等全部相关工程施工 ，具体详见工程量清单和施工图纸；</p><palign=\"left\">2.4. 工期要求：总工期：150个日历天；其中各关键节点的工期要求为：无；</p><palign=\"left\">2.5. 工程质量要求：符合设计、国家工程施工质量验收规范合格标准；</p><palign=\"left\">2.6. 本项目（标段）招标有关的单位：</p><palign=\"left\">2.6.1. 咨询单位：福建省闽建工程造价咨询有限公司；</p><palign=\"left\">2.6.2.设计单位：城市建设研究院；</p><palign=\"left\">2.6.3.代建单位：无 ；</p><palign=\"left\">2.6.4.监理单位：待定。</p><palign=\"left\">3. 投标人资格要求及审查办法</p><palign=\"left\">3.1.本招标项目要求投标人具备建设行政主管部门核发有效的三级及以上钢结构工程专业承包施工资质和《施工企业安全生产许可证》；投标人同时具备中国钢结构协会空间结构分会核发有效的膜结构工程设计二级及以上资质和膜结构工程承包二级及以上资质。</p><palign=\"left\">3.2.投标人拟担任本招标项目的项目经理应具备有效的不低于二级建筑工程专业注册建造师执业资格(含临时执业证书)注册建造师执业资格，并持有有效的安全生产考核合格证书（B证）；依据闽建筑[2013]41号和闽建筑[2014]6号文规定：（1）已按规定在2013年12月31日前提出延续注册申请或者已办理完延续注册的二级临时注册建造师；已按规定在2014年2月28日前提出延续注册申请或者已办理完延续注册的一级建造师临时注册建造师；（2）已提出申请但还未办理完成延续注册的二级及以上临时注册建造师，投标人应在投标文件中附有省住房和城乡建设厅行政服务中心出具的延续注册受理单证明并加盖投标人公章，否则按资格审查不合格处理。</p><palign=\"left\">3.3. 本招标项目 接受 联合体投标，自愿组成联合体的应由 具备 三级及以上钢结构工程专业承包施工资质 的企业为主办方，且各方均应具备承担招标项目的相应资质条件，相同专业单位组成的联合体的，按照资质等级较低的单位确定资质等级。</p><palign=\"left\">3.4.投标人&ldquo;类似工程业绩&rdquo;要求：投标人至少有1项业绩；&ldquo;类似工程业绩&rdquo;是指（下同）：自本招标公告发布之日的前5年内（不含发布招标公告当日）完成的并经竣工验收合格的单项合同工程造价不少于500万元的ETFE充气膜结构工程的国内（不含港澳台地区）施工项目。注：根据闽建筑（2011）39号文要求，本招标项目（工程）所称的类似工程业绩应符合以下条件之一：（1）在福建省行政区域内完成的业绩或抢险救灾中由福建省组织在省外完成的业绩；（2）在福建省外完成的业绩，必须是通过互联网且不需任何权限即可在工程所在地的建设行政主管部门政务网站查询得到，而且查询到的数据应能满足本招标项目（工程）的要求。</p><palign=\"left\">3.5. 投标人应在人员、设备、资金等方面具有承担本招标项目（标段）施工的能力，具体要求详见招标文件；</p><palign=\"left\">3.6. 本招标项目招标人对投标人的资格审查采用的方式：资格后审。</p><palign=\"left\">3.7. 投标时，投标人和拟派本工程项目管理班子成员没有因违法违规被有关行政监督部门取消或限制本招标项目的投标。</p><palign=\"left\">3.8.投标人具备已通过年检合格有效的企业法人营业执照，企业注册资本金金额应超过3769062元（即本项目最高控制价&times;20%的金额）。</p><palign=\"left\">4. 招标文件的获取</p><palign=\"left\">4.1. 凡有意参加投标者，请于 2014 年 2 月 24 日至 2014 年 2 月 28日（法定公休日、法定节假日除外），每天上午 9 时 00 分至 12 时 00 分，下午 13 时 00 分至 16 时 30 分（北京时间，下同），到<u>闽侯县建设工程交易中心</u> 福建省闽建工程造价咨询有限公司 <u>代表处（地址：闽侯县科技中心内闽侯县行政服务中心负一楼</u> ） 购买招标文件；</p><palign=\"left\">4.2. 招标文件每份售价 200元，（含工程量清单、工程控制价、电子光盘等），售后不退。投标人若需要购买本项目施工图纸的，可向招标人提出申请，招标人在三个工作日内提供购买的施工图纸，图纸售价不高于《福建省物价局转发国家计委关于印发</p><palign=\"left\">5. 评标办法</p><palign=\"left\">本招标项目采用的评标办法： 经评审的最低投标价中标法 。</p><palign=\"left\">6. 投标保证金的提交</p><palign=\"left\">6.1. 投标保证金提交的时间：投标截止时间之前；</p><palign=\"left\">6.2.投标保证金提交的方式：从投标人企业基本账户以电汇或银行转账的形式汇达投标保证金指定账户；或按榕建招[2013]38号文规定交存年度投标保证金；</p><palign=\"left\">6.3. 投标保证金提交的金额：人民币叁拾陆万元。</p><palign=\"left\">7. 投标文件的递交</p><palign=\"left\">7.1. 投标文件递交的截止时间（投标截止时间）： 2014 年 3 月 18 日 10 时 00 分，提交地点为闽侯县建设工程交易中心本项目开标室 ；<u>在递交纸质投标文件的同时，投标人拟派出的委托代理人出示授权委托书原件和身份证原件，项目经理应当持注册建造师执业证书（或建造师临时执业证书）原件、身份证原件、购买招标文件凭证（一份凭证仅代表一个投标人）原件到场核验登记，否则其投标文件将不予接收。</u></p><palign=\"left\">7.2. 逾期送达的或未送达指定地点或投标文件密封不符合规定要求的投标文件，招标人不予受理。</p><palign=\"left\">8. 发布公告的媒介</p><palign=\"left\">本次招标公告同时在 福建招标与采购网（ http://www.fjbid.gov.cn ） 、福州市建设工程招标投标网（ www.fzztb .org）、闽侯招标网（www.mhztb.com）及闽侯县建设工程交易中心公示栏 上发布。</p><palign=\"left\">9. 联系方式</p><palign=\"left\">招标人：闽侯县青口镇小城镇综合改革建设试点指挥部；</p><palign=\"left\">地址：闽侯县青口镇工业路1号，邮编：350119；</p><palign=\"left\">电 话：0591-22770987</p><palign=\"left\">联系人：林主任。</p><palign=\"left\">招标代理机构：福建省闽建工程造价咨询有限公司</p><palign=\"left\">地址：福州市工业路451号鼓楼科技商务中心大厦六层，邮编：350002；</p><palign=\"left\">电话：0591-87605650-819，传真：0591-87623982；</p><palign=\"left\">联系人：林工。</p><palign=\"left\">投标保证金银行帐号：</p><palign=\"left\">开户银行：民生银行福州闽侯支行；</p><palign=\"left\">帐户名称：闽侯县建设工程交易中心；</p><palign=\"left\">帐 号：1516 0142 1000 0041 。</p><palign=\"left\">（应在汇款凭证上注明&ldquo;闽侯房建招2014011&rdquo;投标保证金，如因投标人汇款凭证未注明项目招标编号造成银行无法识别投标保证金到账情况或识别错误的，其责任由投标人自行承担。）</p><palign=\"left\">交易中心名称： 闽侯县建设工程交易中心 ；</p><palign=\"left\">电 话： 0591-22063699 ；</p><palign=\"left\">地 址： 闽侯县科技中心内闽侯县行政服务中心负一楼 。</p></p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1419', '1', '43', '68', '', '<p ><br class=\"Apple-interchange-newline\" /><p align=\"center\"></p><center><imgid=\"597978\" title=\"\" border=\"0\" align=\"center\" src=\"res/201509/02/1441090061_0_691.jpg\" sourcename=\"本地文件\" sourcedescription=\"编辑提供的本地文件\" alt=\"\" /></center><p></p><p></p><p >大连体育场，2754个气枕附着在体育新城中心体育场周围的钢结构桁架上，白天或夜晚在阳光或LED灯的照射下，蓝白相间的膜气枕将会形成海浪翻滚的大景观，将把本市这座海滨城市的特点充分展现在世人面前。据了解，中心体育场外膜结构工程将在5月底全部完工。昨天，记者走进中心体育场进行了一番探访。</p><p >蓝白相间的条块将中心体育场从空中&ldquo;包裹&rdquo;起来，远看，犹如大海中的波浪在翻滚。蓝色条块就像蓝色的海面一样，白色条块象征翻滚着的白色浪花。近看，在偌大的圆形体育场四周布满了脚手架，蓝色条块和白色条块由众多气枕组成，将圆形的体育场在纵向也形成圆弧形状，若一幢巨型战鼓悬于半空。</p><p >进入体育场内部，看台上坐椅林立，广场上的塑胶跑道和中间的绿色球场已经显现出来。往上看，圆穹形的膜结构将看台全部覆盖。&ldquo;观看比赛时，自然是风吹不着，雨淋不到。 &rdquo;中心体育场外膜结构工程施工单位，是曾参与北京水立方膜结构工程施工的本市民营企业大连伟霖膜结构工程有限公司，该公司高级工程师刘昌伟说，大连中心体育场还有内膜，将会从内部把眼前的纵横交错的钢结构桁架全部包裹起来。</p><p >目前，仅有西南部接近1万平方米的外膜结构还没有完工。本月底外膜结构将全部完工。</p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1420', '1', '43', '68', '', '<p ><p><b>膜结构</b><span >主要适用场所：体育场馆,体育场看台,主席台,相关遮阳遮雨膜结构; 高速公路收费站,加油站,停车场,公交站台,机场,地铁站,游乐园,休闲广场,观景台,舞台空,停车场膜结构；小区入口、车库入口、通道走廊、城市标志入口；高速公路收费站空间膜结构、加油站膜结构、博览会展厅膜结构、购物中心、售货亭、商业步行街、批发中心、临时会场张拉膜结构、休闲场所张拉膜结构景观膜结构、泳池遮阳膜，景观膜结构、大门出入张拉膜、小品膜、标志性膜结构建筑等。</span></p><p><span class=\"Apple-converted-space\"></span><br /></p><p><imgborder=\"0\" width=\"675\" height=\"670\" alt=\"\" src=\"res/201509/02/1441090045_0_444.jpg\" /></p><p><p >膜结构主要适用场所：运动场、体育馆、体育看台张拉膜结构; 博物馆张拉膜、音乐广场索膜结构、游乐园、休闲广场张拉膜结构、观景台张拉膜、舞台空间膜结构、停车场膜结构；高速公路收费站空间膜结构、加油站膜结构、博览会展厅膜结构、购物中心、售货亭、商业步行街、批发中心、临时会场张拉膜结构、休闲场所张拉膜结构景观膜结构、泳池遮阳膜，景观膜结构、大门出入张拉膜、小品膜、标志性膜结构建筑等。</p><p ></p><p ></p><p ></p></p></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1421', '1', '43', '68', '', '<p ></p><ul><li >PTFE膜材&mdash;&mdash;耐久性强，使用寿命在30年以上</li><li >PTFE膜材&mdash;&mdash;是永久性建筑的首选材料</li><li >PTFE膜材&mdash;&mdash;超自洁，防火材料</li><li >PTFE膜材&mdash;&mdash;专业化的加工工艺，严格的施工规程<br /> 膜结构建筑中最常用的膜材料。PTFE膜材料是指在极细的玻璃纤维（3微米）编织成的基布上涂上PTFE（聚四氟乙烯）树脂而形成的复合材料。PVC膜材料是指在聚酯纤维编织的基布上涂上PVC（聚氟乙烯）树脂而形成的复合材料。</li></ul>', '', '');
INSERT INTO `pk_list_22` VALUES ('1422', '1', '43', '68', '', '<p ></p><pid=\"MyContent\"><p>  2020年东京奥运会和残奥会筹备委员会公布了作为东京奥运会主会场的新国立竞技场的概念图。</p><p>　　国际奥委会全会当地时间9月7日在阿根廷首都布宜诺斯艾利斯投票选出2020年夏季奥运会的主办城市。日本东京最终击败西班牙马德里和土耳其伊斯坦布尔，获得2020年夏季奥运会举办权。</p><p></p><p ></p><p align=\"center\"><img id=\"23416362\" align=\"center\" src=\"res/201509/02/1441090082_0_293.jpg\" width=\"602\" height=\"276\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416363\" align=\"center\" src=\"res/201509/02/1441090082_1_175.jpg\" width=\"600\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416364\" align=\"center\" src=\"res/201509/02/1441090082_2_260.jpg\" width=\"598\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p align=\"center\"></p><p >据了解，日本新国家体育场效果图是由东京奥运会审查委员会从全球募集的众多设计图中评选而出，该设计图出自的伊拉克女建筑家扎哈-哈迪德之手，从效果图来看，日本新国家体育场外观采用了全新的流线型设计，审查委员会给予了&ldquo;内部空间感强烈，与东京都城市空间相呼应&rdquo;、&ldquo;可开闭式天窗增加了体育场的实用性&rdquo;等高度评价。</p><p >根据计算，日本新国家体育场的扩建总花费将达到1300亿日元（约人民币78亿元），预计竣工时间为2019年3月，该体育场作为2020年东京奥运会比赛主会场，届时奥运会的开幕式、闭幕式、足球、田径等项目都将在该会场举行。</p><p ></p><p></p><p></p><p></p><p></p></p><p ></p>', '', '');
INSERT INTO `pk_list_22` VALUES ('1871', '1', '43', '8', '1202', '<article><div class=\"topic-cover\"><img alt=\"贾跃亭辞任乐视网总经理，iPhone 8 模具曝光 | 极客早知道 2017 年 5 月 22 日\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/7b/8f/7b8f71114d5f6a739042415be1d81416.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" class=\"js-lazy loaded\"/></div><div class=\"article-content\"><h2>要闻：贾跃亭辞任乐视网总经理，梁军接任<br/></h2><p><strong>来源：新浪科技</strong></p><p>乐视网昨天下午发布公告，贾跃亭申请辞去总经理职务，专任董事长一职。贾跃亭辞去总经理职务后，将继续担任公司董事长、董事会战略委员会主任委员、提名委员会委员、审计委员会委员等职务。此外，公司财务总监杨丽杰辞职，将不再担任任何职务，董事会同意聘任张巍为财务总监。</p><p>在今日下午举行的媒体沟通会上，贾跃亭也解释了近日关于乐视网的多个问题。</p><p><strong>乐视姓孙还是姓贾？</strong></p><p>贾跃亭表示，这个问题压根儿不用回答，如果你们相信那个谣言，孙总（孙宏斌）就不会投乐视了。正式看中了乐视独有的优势，甚至是代表下一个时代的优势，才会投资上市公司。</p><p><strong>乐视裁员的具体计划是什么？</strong></p><p>贾跃亭表示，从去年 10 月乐视流动性出现问题之后，我们就在考虑组织变革，裁员也是我们组织变革的一个部分。「与其说裁员，更准确地说是人员优化。」</p><p><strong>乐视体育：</strong></p><p>对于乐视体育未来的规划，贾跃亭表示，希望能够更加聚焦，更加专注于价值创造，让乐视体育尽快达到合理的投入产出比。「乐视体育最核心的价值还是用户，如何更大规模地扩大体育会员的数量，扩大体育用户数量，这是乐视体育下个阶段非常重要的重点。」</p><p><strong>乐视手机：</strong></p><p>贾跃亭提到，手机是去年我们风波的导火索之一，一方面我们创造了很多的奇迹，第一年就销售了 1000 多万台，在业界是很罕见的，但同时由于我们对流动性管理的预判能力不足，对损益情况的判断性也不是特别准，导致后续资金的跟进不是特别及时，导致手机在去年第四季度出现了准休克的状态，这也是对我们很好的一次经验教训。</p><p><strong>乐视汽车：</strong></p><p>贾跃亭在会上表示，汽车融资，A 轮的融资很快就会正式启动了，应该不会太久，2017 年之内有可能正式完成，当然我们最快的速度先把产品生产出来，让大家体验到什么才是真正的互联网汽车。</p><p><strong>易到：</strong></p><p>关于易到公司问题，贾跃亭表示，易到看似风波不断，但已经进入快速增长期，且不需要大量资金。易到乐视接手一年半以来，已经有了质的变化，不久大家将看到较大的提升。他表示，易到三周前已经拿到网约车牌照，将成为触底后第一个反弹的业务。</p><p><strong>点评：贾跃亭辞任乐视网总经理，公司财务总监也辞职了，乐视这次要「改朝换代」了吗？</strong></p><h2>要闻：苹果 iPhone 8 / 7s 模具多图曝光</h2><p><strong>来源：IT 之家</strong></p><p>如无意外，苹果 iPhone 8 将在今年 9 月正式发布，目前已经快到 6 月份，关于 iPhone 8 的爆料消息已经具备相当的可信度。</p><p>总体来看，目前关于 iPhone 8 的消息有两点令人印象深刻：其一是正面全面屏，背面材质将回归玻璃；其二是后置垂直双摄的设计。近日，有疑似供应链人士放出了 iPhone 8 最新的模具照片，此外还有 iPhone 7s 和 iPhone 7s Plus 的模具也被曝光。</p><p>近日，微博网友 @ 汉汉堂堂 和 @ 杨恩泽 Eanling 曝光了 iPhone 8 的多张最新模具照片，并表示「手机壳开始生产，真实数据模型机也到了」，根据照片上的信息，iPhone 8 的外观和之前的爆料差不多，后置垂直双摄。</p><p><img alt=\"iphone-8-concept-renders.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/2d/c0/2dc0ac3f04535fcc9384227a764a01d9.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"451\"/><em>iPhone 8 渲染图</em></p><p>同时，爆料中还出现了 iPhone7s Plus 以及 iPhone7s 的模具，总体而言，iPhone8 的机身尺寸介于 iPhone7s Plus 和 iPhone7s 之间，而 iPhone7s 系列的这两款手机从模具上来看，外观设计似乎和目前的 iPhone7 系列类似。<br/></p><p><strong>点评：全面屏（OLED 面板）、双面玻璃设计、机身尺寸仅比 iPhone 7 略大一点、屏幕内光学指纹识别…… 这可能是 iPhone 4 甚至是初代 iPhone 之后最让人期待的 iPhone 了。只是对于三星之外的其它手机厂商来说，面对这样一款技术上有明显越级的 iPhone，恐怕一时半会很难拿出同档次的产品来竞争了。</strong></p><h2>大公司/互联网</h2><ul class=\" list-paddingleft-2\"><li><p><strong>圆通超 10 亿港元收购先达国际，否认再次借壳上市</strong></p></li></ul><p><strong>来源：cnbeta</strong></p><p>在 A 股市场借壳上市 8 个月后的圆通速递，此次又通过收购香港上市公司先达国际物流控股有限公司（以下简称「先达国际」）62% 股份的方式，曲线登陆港股市场。对于本次收购，圆通速递董事局主席兼总裁喻渭蛟否认是「借壳上市」。</p><p><img alt=\"09caabe5e46360e.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/3f/a0/3fa0a8a093513c93152f18a08f50c4fd.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"300\"/></p><p>据了解，先达国际是在香港上市的国际物流货物运输代理公司，主营航空货物运输代理、海运及其他物流服务，在全球上市海空运货物运输代理公司中排名前列，其货物运输代理规模亦位于香港地区前列。</p><ul class=\" list-paddingleft-2\"><li><p><strong>新特斯拉车主可通过「推荐码」享受免费充电</strong></p></li></ul><p><strong>来源：cnbeta, The Verge</strong></p><p>今年早些时候，特斯拉推出了最后一波「购新车享 Supercharger 超级充电站终身免费不限量快速充电」的服务。但在 2017 年 1 月 15 日之后购车的用户，只能获得每年 400 千瓦时的免费额度，超出部分将被收取「少量、合理的费用」。</p><p><img alt=\"6a661ee8f6d1b0b.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/fe/00/fe00767092d14ae21d2fbec77d13dd2b.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"325\"/></p><p>不过上周五的时候，特斯拉又宣布了另一种可获得免费充电服务的方式——从另一位车主朋友那里获得一个「推荐码」。</p><p>特斯拉发言人称：「从周五起，现车主可将他们免费、不限量的 Supercharger 快充服务，通过『推荐码』最多分享给另外五位朋友」。此外，购买新车的这批老车主，依然可以获得免费的 Supercharging 服务。</p><p>此前，特斯拉曾划定了 2017 年 1 月 1 日这个「截止时间」，在那之后的新车订单将不再享受免费、不限量的快充网络服务。不过之后，该公司又将新政的实施延迟了 2 周。如果没有朋友给你分享「推荐码」，那么在超出每年 400 千瓦时的之后，用户将需要付出大约每分钟 0.4 美元 / 约合 2.75 元 RMB 的费用（不同站点的充电费用略有差别）。</p><h2>新产品</h2><ul class=\" list-paddingleft-2\"><li><p><strong>红米 Pro2 短暂现身官网：骁龙 660+双摄，1199 元起</strong></p></li></ul><p><strong>来源：新浪手机</strong></p><p>小米官网已经下架红米 Pro 手机好几个月了，这意味着其继任者即将到来。传闻中的红米 Pro2 手机近期出现在小米官网上，但很快被撤下，不过还是有网友保留了截图。</p><p><img alt=\"p5wy-fyfkzhs6958405.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/46/eb/46ebfeed80c7f0c74523e54254176752.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"136\"/></p><p>截图曝光了红米 Pro2 的一些重要参数，包括骁龙 660 处理器、4100mAh 电池、5.5 英寸全高清 OLED 屏幕、1600 万像素后置双摄像头。截图还显示，红米 Pro2 售价 1199 元起，这可能是 3GB 内存版，估计还会有 4GB 版。</p><p><strong>点评：如果曝光的参数无误，红米 Pro2 的性价比可谓是「炸裂」了，不过这个「全高清 OLED 屏」…… 但愿红米这次能找到一块品质比去年的红米 Pro 稍微好点的国产 OLED 屏。</strong></p><h2>前沿科技</h2><ul class=\" list-paddingleft-2\"><li><p><strong>马斯克「无聊公司」真开始挖隧道了 3D 交通就在眼前</strong></p></li></ul><p><strong>来源：cnbeta</strong></p><p>想要上天入地的埃隆·马斯克终于开始将「魔爪」伸向了地下。为了解决拥堵问题，马斯克建立了开挖地下隧道的公司 The Boring Company（无聊公司），目的是利用高速电动轨道运送车辆，同时也为他的超高速铁路 Hyperloop 做准备。</p><p><img alt=\"641-2.jpeg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/be/9b/be9bae47c80fe7eaf805e66aa8fb6dde.jpeg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"309\"/></p><p>5 月 17 日，The Boring Company 在官网主页更新了 FAQ（问答）页面，向公众解答了大家最关心的几个问题。文章说道，解决堵车问题的关键就是道路必须 3D 立体化，这就意味着不仅是地面，还要有空中的飞行汽车和地下的多层隧道。</p><p>以为是玩笑？马斯克说干就干的行动力无人能比。除了今年 4 月底发布的概念视频，5 月 12 日马斯克还在自己的 instagram 账号上上传了一则隧道测试视频，告诉大家真的在挖隧道啦。他在简介中写道，隧道中运输车辆的速度可达到 200 公里/小时，并且可以自动切换轨道。当然，马斯克也不忘友情提醒「速度过快可能会引起晕眩」。</p><p>据了解，目前一些隧道开挖项目的成本在每英里 10 亿美元，而 The Boring Company 的目标是提高挖掘速度，并降低成本 10 倍以上。</p><h2>一条小新闻</h2><ul class=\" list-paddingleft-2\"><li><p><strong>什么值得买：一半用户每月至少可「败」8000 元</strong></p></li></ul><p><strong>来源：cnbeta</strong></p><p>即将登陆创业板 IPO 的商品导购网站什么值得买昨天公布了对网站用户画像的一份调研报告，显示其站点的用户收入构成：占比最高的是家庭月可支配收入 5000-8000 元的用户，占 28%；其次为家庭月可支配收入小于 5000 元，和位于 8000-12000 元的用户，各占 22%；接下来分别是家庭月可支配收入 1.2-1.8 万元、1.8-2.4 万元、2.4 万元以上的用户，各占 14%、7% 和 7%。</p><p><img alt=\"53883b65940b30a.png\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/28/f8/28f87fd211fd336e0c504a71733e7ea1.png?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"316\"/></p><p>由此可以得出，家庭月可支配收入在 8000 元以上的用户和以下的用户，各占「色魔张大妈」网站用户的一半。该站 CEO 那昕将家庭月可支配收入 5000-24000 元的用户定义为「新中产阶级」，认为是该站的最主要用户群体。</p><div></div><div></div></div></article>', '贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任贾跃亭辞任乐视网总经理，梁军接任', '');
INSERT INTO `pk_list_22` VALUES ('1872', '1', '43', '68', '1203', '<article><div class=\"topic-cover\"><img alt=\"微软小冰发布诗集的背后，人工智能由模仿到创造的跨越\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/6f/b1/6fb101e4d8bffe234115fdec5e9beb53.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" class=\"js-lazy loaded\"/></div><div class=\"article-content\"><p>AI 人工智能似乎正处于最好的时代，但它距离理想中的形态，恐怕还有很长的路要走。</p><p>有关人工智能，摆在研究人员面前一个非常重要的问题是：如何使人工智能能够模拟人类，进行独创性的内容生产，并不断通过学习提高自身创造水平。</p><p>正如微软工智能及微软研究事业部负责人沈向洋博士提出的关于「人工智能创造」的三原则：人工智能创造的主体，须是兼具 IQ 与 EQ 的综合体，而不仅仅是具有 IQ；人工智能创造的产物，须能成为具有独立知识产权的作品，而不仅仅是某种技术中间状态的成果；人工智能创造的过程，须对应人类某种富有创造力的行为，而不是对人类劳动的简单替代。</p><p>而现在我们所能看到的人工智能，更多处于「简单替代人类劳动」阶段。即便是在 Google Home 或者亚马逊 Echo 这样已经相对成熟的落地产品身上，依旧很难看到独立创造力的展现。</p><p><img alt=\"WR5.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/89/d2/89d2fb4d1fe573689a70e2454ae7ca51.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"360\"/></p><p>当然，虽然各大科技巨头都在布局人工智能，但大家的发力方向各不相同，产品形态也有所差异。不同于「小娜」的工作定位，小冰一向给人的印象是娱乐陪伴型助手。而这次率先让我们看到有一些「不同」的，正是后者。<br/></p><h2>它是第一个发表诗集的「非人类」作者</h2><p>5 月 16 日，微软举办媒体沟通会，展示了小冰在写作、歌唱、财经评论能力等方面的进展。三天之后的 5 月 19 日，微软联合湛庐文化发布全球首部由人工智能独立完成的诗集《阳光失了玻璃窗》，而这部诗集的作者正是小冰。</p><p><img alt=\"DSC_2064.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/56/7a/567a2c90eb340fcc8f59a164710af958.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"618.6666666666666\"/></p><p>借用湛庐文化副总编董寰对于小冰发表诗集的看法：我们都在想，如果说有一天机器具有了情感，它会思考，它具有了创造力会是什么样子呢？没有想到的是，这个时间来临的比我想象中的要快。<br/></p><p>实际上机器替代人类写文章，并不是一件特别新奇的事情。早在 2012 年就有报道称，美国出现了写稿机器人，每天都在各大网络媒体上产出报道，尤其在体育报道上表现抢眼，机器人在比赛结束「那一刻」写出来的总结性报道很快就成了各个网络媒体体育板块上拥有最高点击量的文章。</p><p>最近有关机器人写作的报道，是之前企鹅财经发布了一篇由写作机器人基于算法自动生成的的文章《8 月 CPI 同比上涨 2.0% 创 12 个月新高》，一时间引发了媒体的热议。不少编辑/记者也发出了「要丢饭碗」的感慨。</p><p>但以往机器人写出的文章，更多的是以单篇新闻报道类为主。能够形成合集并且正式出版，此次的《阳光失了玻璃窗》尚属首次。而微软小冰，也成为了第一个发表诗集的「非人类」作者。<br/></p><h2>文章存有瑕疵，但不再冷冰冰</h2><p>就产出结果来看，之前的写稿机器人和微软小冰作诗都是以文字作为呈现形式。不同的地方在于，前者的文章更像是单纯的词语堆叠，给人感觉「冷冰冰」，后者让人欣喜的地方是为文章赋予了简单的「情感」。</p><p><img alt=\"WR4.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/c6/c0/c6c0ed3c553490638724da2a9e04c67f.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"942\"/></p><p>以微软小冰创作的《是你的声音啊》为例：</p><blockquote><p>微明的灯影里</p><p>我知道她的可爱的土壤</p><p>使我的心灵成为俘虏了</p><p>我不在我的世界里</p><p>街上没有一只灯儿舞了</p><p>是最可爱的</p><p>你睁开眼睛做起的梦</p><p>是你的声音啊</p></blockquote><p>对于以上这首《是你的声音啊》，歌手创作人朱婧汐（曾参与鹿晗首张专辑创作）用「理性」和「感性」这两个词来形容。在她看来，大部分的情况下艺术创作是一个非常感性的事情。而小冰的创作完全是运用了另外一个逻辑，是基于得到的数据和信息来完成。并且速度非常快，打破了关于艺术创作到底是理性还是感性的界限。</p><p><img alt=\"DSC_2898.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/b0/4c/b04c06ac81248a5fc0a32d747db7a7cd.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"617.5066666666667\"/></p><p>另外如微软市场公共关系部的徐元春所言，小冰的很多诗句中，都会出现诸如太阳、小鸟、沙滩等词语。而这些颇具带入感的词语，正是模仿了人类在诗词创作过程中经常用到的「借物抒情」的手法。至于如何在数据库中调用这些词语，微软显然有着自己一套独特的逻辑算法。<br/></p><p>当然，阅读过微软小冰的诗集之后，实际上它的创作依旧存在诸多问题，处理一些读音相近的字词，会有偏差。比如「在」和「再」两个字的运用上，经常出现错误。</p><p>有意思的一点是，在《阳光失了玻璃窗》这本诗集中，并没有对以上提到的这些错误进行人工修正，只是在出现错误的地方用括号的方式给予了注释。对此，微软的说法是希望能够保证这本诗集的完全自主性。个人而言，能够认识到发展中的错误并且正面面对，对于未来的发展一定是有好处的。</p><h2>写诗这件事情，小冰是如何做到的</h2><p>之前采访「云知声」CTO 梁家恩先生的时候，他也曾说过，实际上 AI 人工智能走到今天，算法没有太多的秘密，可能有不同，但要想实现大幅领先，并不是一件容易地事情。而除算法之外，背后作为支撑的大数据库无疑是颇为重要的一环。</p><p>就算法而言，微软小冰基于微软提出的情感计算框架，以 EQ（情商）为主攻方向，打造具备完整感官和知识图谱的对话式人工智能。</p><p>另外据微软给出的数据显示，无论从用户数量、活跃度和交互流量来看，微软小冰均是目前全球最大规模流量的对话式人工智能产品。截至 2017 年 4 月，微软小冰已拥有超过 1 亿用户，累计对话量超过 300 亿，平均单次对话轮数（CPS）达到 23。</p><p><img alt=\"ＷＲ3GG.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/54/7f/547f1f32c2d38c626929fe4e29fddc7d.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"516\"/></p><p>微软小冰团队部署于四个国家，在 14 个平台上与用户进行交互，包括中国大陆地区的微信、QQ、微博，美国地区的 Facebook Messenger，以及日本地区的 LINE 等。除上述第三方平台外，微软小冰亦已全面内置于中文版 Windows 10 操作系统中。在数据采集上，微软小冰无疑颇具优势。</p><p>具体到作诗这件事情上，微软小冰师从 1920 年以来 519 位中国现代诗人。经过对几千首诗 10000 次的（迭代）学习，从而获得现代诗的创造力，并逐渐形成了自己的风格、偏好和行文技巧。</p><p>而小冰的写作风格，很大程度上来自于某段时间内，它所接触到的数据风格。比如给小冰学习我国 1920 年到 1940 年代的诗，它的作品会偏向于悲壮、非常伤感。</p><h2>它留给了我们更多的想象空间</h2><p>人工智能小冰写诗这件事情，让我联想到之前的谷歌 AlphaGo 大战李世石事件。从某种角度而言，事件本身可能并非最大的价值，更大的意义在于对整套逻辑算法以及背后大数据调用方式的探索，这也是为未来人工智能的发展作铺垫。</p><p>而微软小冰此次能够独立作诗的特殊性在于，它正在尝试由单纯模仿进入到创造阶段，并且通过一些典型词语，来使得其产出的文章能够富有情感。</p><p>需要说明的是，这依旧并不意味着微软小冰已经拥有了类似于人类一样独立的「情感」。从实现角度来看，它还是依靠模仿人类使用语言的表达规则，来完成抒情这件事情。只能说，通过微软小冰发表诗集这件事情，证明了它已经一只脚踏进了创造阶段，并没有进化完全。</p><p>但从目前小冰所取得的成绩来看，微软的这次尝试非常成功。而且厉害的是，未来通过不断地学习不同领域知识，不难现象，它将拥有更加强大且丰富的独立创造能力，也留给了我们更多的想象空间。</p><p>当微软小冰拥有足够多的知识储备，配合日趋缜密的逻辑算法，也许就是我们理想中的人工智能。当然，可以预见的是，这个过程是漫长且困难的。但起码目前证明，微软选择的这条路是正确的。</p><div></div><div></div></div></article>', '有关人工智能，摆在研究人员面前一个非常重要的问题是：如何使人工智能能够模拟人类，进行独创性的内容生产，并不断通过学习提高自身创造水平。', '');
INSERT INTO `pk_list_22` VALUES ('1874', '1', '43', '8', '1205', '<article><div class=\"topic-cover\"><img alt=\"三星 S8 国行 5688 元起售，提供电池更换服务；共享洗衣机也来了，洗一桶衣物 20 元起 | 极客早知道\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/c5/7d/c57d3c46ee58eba445063d9dbfde6e9c.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" class=\"js-lazy loaded\"/></div><div class=\"article-content\"><h2>要闻：三星 S8 国行 5688 元起售，提供电池更换服务</h2><p><strong>来源：<a href=\"http://digi.tech.qq.com/a/20170518/054740.htm\" target=\"_blank\">腾讯数码</a></strong></p><p>5 月 18 日，三星在古北水镇正式发布了今年的旗舰机 S8 与 S8 Plus 的国行版本。</p><p>国行版本的 S8 系列在硬件配置上与之前发布的国际版基本相同，包括正面 18.5：9 的全视曲面屏，其中 S8 为 5.6 英寸，而 S8 Plus 则为 6.1 英寸，分辨率最高可达到 2960x1440（默认分辨率为 2220x1080）。</p><p>S8 系列正面配备了虹膜识别与面部识别，其中虹膜识别拥有目前手机上最高的生物识别等级，即使在弱光环境下依然可以迅速解锁。</p><p><img alt=\"641 (2).jpeg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/e2/12/e212a16bd957d3396e2f8ab44f95660f.jpeg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"427\"/></p><p>在处理器方面，国行版的 S8 系列采用高通骁龙 835 处理器，拥有 4GB 内存与 64GB 存储，支持扩展卡存储。</p><p>在镜头方面，S8 系列的后置镜头为 1200 万像素、光圈 F1.7 的镜头，支持双像素对焦与 HDR 短曝光合成。前置镜头方面，为一枚 800 万像素，支持自动对焦与美颜模式。</p><p>与国际版不同的是，国行版本的 S8 同时推出了专属管家服务。这项服务允许用户在购机后 6 个月内以 500 元的价格更换碎屏一次，原价则为 1350 元；同时在 12 个月内，如果因电池损耗导致机器功能失常，三星会免费提供电池的更换，而在 18 个月内，用户则可以以五折的价格更换电池。</p><p><img alt=\"641 (1).jpeg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/c5/39/c539f6303ecb3b351be584acc32ab4fb.jpeg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"427\"/></p><p>在配色上，S8 推出了谜夜黑、绮梦金、雾屿蓝、烟晶灰四款颜色。其中烟晶灰会在不同的角度下显示紫色与灰色两种颜色。</p><p>价格方面，三星 S8（4GB+64GB）售价 5688 元，S8 Plus（4GB+64GB）售价 6188 元。而 6GB+128GB 皇帝版 S8 Plus 售价 6988 元。另外，三星和移动推出运营商定制版 S8 售价 5688 元。</p><p><strong>点评：相信为中国带来专属服务的 Galaxy S8 能够挽回三星中国的销量颓势。</strong></p><h2>要闻：共享洗衣机也来了，洗一桶衣物 20 元起</h2><p><strong>来源：<a href=\"http://tech.163.com/17/0518/19/CKOADQH500097U7R.html\" target=\"_blank\">网易科技</a></strong></p><p>5 月 18 日消息，继共享单车、共享充电宝、共享篮球出现后，洗衣机也开始进入「共享时代」。据视觉中国公布的一组图片显示，在徐汇区一商业广场内出现了一组公用洗衣机。公用洗衣机分为洗衣机和烘干机两种，在公用洗衣机的机身上醒目的标注了 18KG 容量的洗衣机价格为 40 元/桶，8KG 容量的洗衣机为 20 元/桶，18KG 容量的烘干机为 10 元/15 分钟。在付费方式上，市民可选择现金支付，也可以选择微信及支付宝支付。</p><p><img alt=\"d39508d756a0417989b610a0620d17c920170518194427.jpeg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/be/e5/bee58cbd6c6d38cb938f5407c3e65d13.jpeg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"367\"/></p><p><strong>点评：共享洗衣机真的不敢用，这种东西用久了，卫生问题如何保证？</strong></p><h2>大公司/互联网</h2><ul class=\" list-paddingleft-2\"><li><p><strong>阿里巴巴第四财季净利 98.5 亿元，同比增长 85％</strong></p></li></ul><p><strong>来源：<a href=\"http://www.techweb.com.cn/finance/2017-05-18/2525650.shtml\" target=\"_blank\">TechWeb</a></strong></p><p>阿里巴巴昨日发布截至 3 月 31 日的 2017 财年第四季度及全年财报。第四财季，阿里巴巴营收为人民币 385.79 亿元 (约合 56.05 亿美元)，同比增长 60%。净利润为人民币 98.52 亿元 (约合 14.31 亿美元)，较上年同期的人民币 53.14 亿元增长 85%。基于非美国通用会计准则，净利润为人民币 104.40 亿元 (约合 15.17 亿美元)，较上年同期的人民币 75.56 亿元增长 38%。</p><p><img alt=\"1479093660287.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/a1/e0/a1e0adc21d0d4487e4dcedc13a4be468.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"309\"/></p><ul class=\" list-paddingleft-2\"><li><p><strong>滴滴正式获得北京网约车牌照</strong></p></li></ul><p><strong>来源：<a href=\"http://tech.163.com/17/0518/18/CKO7BJU600097U7R.html\" target=\"_blank\">网易科技</a></strong></p><p>昨日，北京市交通委向滴滴出行正式颁发了《网络预约出租汽车经营许可证》。这也意味着，滴滴出行在北京具备线下服务资格，开展业务将更加顺畅。</p><p>根据交通运输部等 7 部委发布的《网络预约出租汽车经营服务管理暂行办法》（简称「网约车新政」）的规定，网约车平台应具备线上、线下服务能力。此前，滴滴在天津取得了网约车线上服务能力认定结果，可在全国范围通用。5 月 18 日消息，北京市交通委向滴滴出行正式颁发了《网络预约出租汽车经营许可证》。这也意味着，滴滴出行在北京具备线下服务资格，开展业务将更加顺畅。</p><ul class=\" list-paddingleft-2\"><li><p><strong>乐视大裁员「狂砍」非上市公司，乐视体育或裁 70%</strong></p></li></ul><p><strong>来源：<a href=\"http://www.cnbeta.com/articles/tech/613889.htm\" target=\"_blank\">cnBeta</a></strong></p><p>据媒体消息，波及多个乐视系公司的裁员中，乐视控股旗下品牌部门和乐视体育的裁员幅度均高达 70%，乐视控股的销售部门员工仅留一半。腾讯科技报道称，获悉乐视系大裁员将于近日落地，三家上市公司乐视或即将纳入上市公司体系的企业几乎没有大调整。非上市公司均面临大幅裁员。</p><p><img alt=\"5dba68155103884.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/fa/8c/fa8cdb6822e34b80f25c260209ef1c6a.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"337\"/></p><h2>新产品</h2><ul class=\" list-paddingleft-2\"><li><p><strong>小米电视 4 发布：4.9mm 超薄机身 3499 元起</strong></p></li></ul><p><strong>来源：<a href=\"http://tech.ifeng.com/a/20170518/44615705_0.shtml\" target=\"_blank\">凤凰科技</a></strong></p><p>5 月 18 号，小米电视在北京召开发布会，正式推出了今年的旗舰产品小米电视 4。售价为 3499 元起，而 65 英寸的小米电视 4 家庭影院版电视售价为 9999 元，小米电视 4 全系列产品于今天开启全渠道预约，6 月 1 日起将全面开售。</p><p>小米电视 4 采用了超薄的设计，屏幕整体厚度为 4.9mm，最薄处的厚度仅有 2mm，同时也采用了无边框的设计理念，配有超窄边框，点亮屏幕后能够带来较为震撼的视觉体验。</p><p><img alt=\"c75282d0be15962_size149_w1600_h1067.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/ae/88/ae88a2e4002f01b95396a4b99d31d87e.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"618.86\"/></p><p>小米电视 4 拥有 49 英寸、55 英寸、65 英寸三种种规格，采用的是三星或 LG 的原装屏幕，在显示效果上有着不错的表现。65 英寸的小米电视 4 配有多个独立蓝牙音箱，支持 5.1.2 杜比全景声音效，可以给用户带来更加震撼的观影效果。</p><ul class=\" list-paddingleft-2\"><li><p><strong>奥林巴斯发布 TG-5 三防相机</strong></p></li></ul><p><strong>来源：<a href=\"http://www.cnbeta.com/articles/tech/613891.htm\" target=\"_blank\">cnBeta</a></strong></p><p>奥林巴斯昨天宣布推出 TG-5 三防相机，提供体面的摄影质量和三防性能，承受跌落高度达到 2.1 米，压力重量 100 公斤，气温低至-10 摄氏度，防水深度 15 米，如果配合可选的 PT-05 防水外壳，防水深度甚至高达 45 米。</p><p><img alt=\"fcd3b1ef2eb2218.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/4e/8c/4e8c53ec87714207e20963e7c147d420.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"525\"/></p><h2>前沿科技</h2><ul class=\" list-paddingleft-2\"><li><p><strong>Optane DIMM 和 Cascade Lake 处理器将于 2018 年抵达</strong></p></li></ul><p><strong>来源：<a href=\"http://www.cnbeta.com/articles/tech/613907.htm\" target=\"_blank\">cnBeta</a></strong></p><p>英特尔的 Optane 内存技术展示了 3D Xpoint 内存在有限的范围内可以做的事情，但 Optane 的潜力远远超出了加速硬盘驱动器。英特尔在今年初开始向合作伙伴发送 Optane DIMM，而昨天，该公司致力于将 Optane DIMM 作为「Intel 持久存储器」产品，再加上其至强处理器可扩展的家族 Cascade Lake 处理器进行发布，这种持久存储器产品和 Cascade Lake 处理器都将在 2018 年的某个时候上市。</p><div></div><div></div></div></article>', '国行版本的 S8 系列在硬件配置上与之前发布的国际版基本相同，包括正面 18.5：9 的全视曲面屏，其中 S8 为 5.6 英寸，而 S8 Plus 则为 6.1 英寸，分辨率最高可达到 2960x1440（默认分辨率为 2220x1080）。', 'http://demo.wpcom.cn/justnews/312.html');
INSERT INTO `pk_list_22` VALUES ('1873', '1', '43', '592', '1204', '<section><article><div class=\"topic-cover\"><img alt=\"这个让你扛在肩上的移动电源，可不只给手机充电那么简单！\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/5f/b8/5fb8ff60c5ffc536a10cf4d91e0d37ee.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" class=\"js-lazy loaded\"/></div><div class=\"article-content\"><p>如今出门在外，很多人都得随身带着三大件：手机、电脑、移动电源。毫无疑问，不管你的智能手机电池有多么坚挺，续航有多么持久，不挂上这个「小吊瓶」你还真没有那么放心。至于电脑、相机什么的，就更不用说了，电源总是必须的。<br/></p><p>不过，要说现在的移动电源，一般情况下也就 10000mAh，多一点儿也就是 20000mAh（而且还不一定能给电脑充电），你可能并没有见过容量达到 116000mAh，能扛在肩上到处走的那种，今天极客之选想和大家说说的，就是这个叫做 RIVER 的有些特别的「移动电源」。</p><p class=\"gp_media gp_media_video\"><iframe frameborder=\"0\" src=\"http://player.youku.com/embed/XMjc3Mzg1NDM1Ng==\" width=\"700\" height=\"434\"></iframe></p><h2>手机、电脑、电冰箱无所不充，这才是全能电源<br/></h2><p>作为一个「大块头」移动电源，RIVER 的外形看起来并不古板，但它给人的感觉似乎更像一个「电饭煲」而不是移动电源，至少第一次看到它的时候，我就被它正面的显示屏，还有那个看起来很方便的把手吸引住了，嗯，它看上去确实不像个移动电源。</p><p><img alt=\"pxixnu5f8hnvz9rndjgh.jpg\" class=\"js-lazy loaded\" src=\"https://ocpk3ohd2.qnssl.com/uploads/image/file/7c/50/7c50c8b2e8ebce873dded928b28ce500.jpg?imageView2/2/w/744/interlace/1/q/88/ignore-error/1/\" height=\"414\"/></p><p>在介绍细节之前，我们可以先来看看，作为移动电源，RIVER 和其它产品不同的功能吧！首先，它能给小型冰箱供电，对你确实没有听错，就像这样</p></div></article></section>', '如今出门在外，很多人都得随身带着三大件：手机、电脑、移动电源。毫无疑问，不管你的智能手机电池有多么坚挺，续航有多么持久，不挂上这个「小吊瓶」你还真没有那么放心。至于电脑、相机什么的，就更不用说了，电源总是必须的。', '');

-- ----------------------------
-- Table structure for pk_list_23
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_23`;
CREATE TABLE `pk_list_23` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `link` longtext NOT NULL COMMENT '链接',
  `target` varchar(255) NOT NULL DEFAULT '_self' COMMENT '链接方式',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航';

-- ----------------------------
-- Records of pk_list_23
-- ----------------------------
INSERT INTO `pk_list_23` VALUES ('713', '1', '42', '0', 'a:2:{s:7:\"default\";s:17:\"index.php?id=news\";s:7:\"rewrite\";s:9:\"news.html\";}', '_self');
INSERT INTO `pk_list_23` VALUES ('1869', '1', '42', '0', 'a:2:{s:7:\"default\";s:34:\"index.php?id=news&cate=jikezhixuan\";s:7:\"rewrite\";s:21:\"news/jikezhixuan.html\";}', '_self');
INSERT INTO `pk_list_23` VALUES ('1870', '1', '42', '0', 'a:2:{s:7:\"default\";s:9:\"index.php\";s:7:\"rewrite\";s:0:\"\";}', '_self');
INSERT INTO `pk_list_23` VALUES ('1867', '1', '42', '0', 'a:2:{s:7:\"default\";s:36:\"index.php?id=news&cate=jikezaozhidao\";s:7:\"rewrite\";s:23:\"news/jikezaozhidao.html\";}', '_self');
INSERT INTO `pk_list_23` VALUES ('1868', '1', '42', '0', 'a:2:{s:7:\"default\";s:37:\"index.php?id=news&cate=chanpinguancha\";s:7:\"rewrite\";s:24:\"news/chanpinguancha.html\";}', '_self');
INSERT INTO `pk_list_23` VALUES ('1300', '1', '147', '0', 'a:2:{s:7:\"default\";s:21:\"index.php?id=about-us\";s:7:\"rewrite\";s:13:\"about-us.html\";}', '_self');
INSERT INTO `pk_list_23` VALUES ('1878', '1', '42', '0', 'a:2:{s:7:\"default\";s:9:\"index.php\";s:7:\"rewrite\";s:10:\"index.html\";}', '_self');
INSERT INTO `pk_list_23` VALUES ('1302', '1', '147', '0', 'a:2:{s:7:\"default\";s:17:\"index.php?id=news\";s:7:\"rewrite\";s:9:\"news.html\";}', '_self');
INSERT INTO `pk_list_23` VALUES ('1303', '1', '147', '0', 'a:2:{s:7:\"default\";s:17:\"index.php?id=book\";s:7:\"rewrite\";s:9:\"book.html\";}', '_self');
INSERT INTO `pk_list_23` VALUES ('1304', '1', '147', '0', 'a:2:{s:7:\"default\";s:23:\"index.php?id=contact-us\";s:7:\"rewrite\";s:15:\"contact-us.html\";}', '_self');

-- ----------------------------
-- Table structure for pk_list_24
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_24`;
CREATE TABLE `pk_list_24` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `pictures` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `package` longtext NOT NULL COMMENT '包装清单',
  `content` longtext NOT NULL COMMENT '内容',
  `m_title` varchar(255) NOT NULL DEFAULT '' COMMENT '手机版标题',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品';

-- ----------------------------
-- Records of pk_list_24
-- ----------------------------
INSERT INTO `pk_list_24` VALUES ('1753', '1', '45', '582', '', '1013', '手机主机电源适配器USB Type-C 数据线三包凭证入门指南插针', '<p><img src=\"res/201603/22/auto_1011.jpg\" alt=\"auto_1011.jpg\"/></p><p><img src=\"res/201603/22/auto_1010.jpg\" alt=\"auto_1010.jpg\"/></p><p><img src=\"res/201603/22/auto_1012.jpg\" alt=\"auto_1012.jpg\"/></p>', '小米5');
INSERT INTO `pk_list_24` VALUES ('1760', '1', '45', '583', '1015,1017,1016', '1015', 'MX5 手机主机 × 1USB数据线 × 1电源适配器 × 1SIM 卡顶针× 1保修证书 × 1', '', '魅族 MX5');
INSERT INTO `pk_list_24` VALUES ('1761', '1', '45', '584', '1019,1020,1018', '1018', '手机（含内置电池）*1充电器*1USB线*1耳机*1保修卡*1安全说明*1快速指南*1卡座捅针*1', '<p style=\"text-indent: 2em;\">2014年5月7日，华为在巴黎发布了2014旗舰机型P7。P7配置5英寸1080P全高清屏幕，采用金属+双玻璃结构，机身厚度仅6.5mm，支持CAT4 LTE网络，五月起在中国大陆等30多个国家及地区开售，全球售价449欧元，中国大陆售价为人民币2888元。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">华为P7正面采用5寸1080p屏，有着6.5mm的极致超薄机身，拍照方面有着前置800万+后置1300万摄像头组合，内置1.8GHz海思Kirin910T四核处理器，有着2GBRAM+16GBROM机身存储，后置不可拆卸的2500mAh电池，支持CAT4LTE4G网络。华为Ascend P7分辨率为1920X1080像素的FHD级别，显示效果非常细腻。核心方面内置一颗主频1.8GHz海思Kirin 910T四核芯处理器，以及2GB RAM+16GB ROM的内存组合，流畅运行基于Android 4.4系统的Emotion UI 2.3用户界面。<br/></p><p><br/></p>', '华为 P7');
INSERT INTO `pk_list_24` VALUES ('1762', '1', '45', '585', '1021,1022,1023,1024', '1021', '主机*1耳机*1数据线*1充电器*1取卡针*1透明保护壳*1保修卡*1用户快速入门指南*1', '<h4>双曲面屏幕</h4><p>vivo Xplay5采用了双曲面屏幕，屏幕两侧有较大的弧度，曲面的屏幕会使屏幕呈现出无边的视觉效果。</p><p>vivo Xplay5专为曲面侧屏设计了侧屏来电提醒、解锁。</p><p><br/></p><h4>侧面解锁</h4><p>解锁方面，用户在进行图标滑动至曲面屏部分时会发生明显的「变形」，当在锁屏界面滑动解锁时，手机的曲面屏会有相当明显的光晕效果。</p><p>侧屏来电提醒：当手机反扣放在桌面时，如果手机来电时，双侧曲面屏也会散发波浪光影提醒用户来电信息。</p><p><br/></p><h4>智慧引擎</h4><p>智慧引擎优化主要分为内存加速和处理器加速。根据用户的使用情况选择性地智能加载部分常用应用，并调高这些常用应用的优先级，减小被回收的几率。另外，vivo 还优化了系统代码，大幅度降低系统的内存占用，并针对性地做了缓存碎片和内存的闲时动态回收，进而腾出更多的内存空间供用户使用。</p><p><br/></p><h4>分屏多任务</h4><p>vivo Xplay5配备了分屏多任务功能。在用户进行看电影，游戏，看书时，微信QQ聊天时不需进行切换，手机可以自动分屏为功能屏幕，一边聊微信，一边看电影。</p><p>但是现在分屏多任务支持的软件还有限，如果支持更多软件，分屏功能将会更实用。</p><p><br/></p><h4>128GB存储和3600mAh</h4><p>vivo Xplay5和vivo Xplay5旗舰版均配备了128GB的存储空间和3600mAH，提供更大和更长的续航选择。</p>', 'vivo Xplay5');
INSERT INTO `pk_list_24` VALUES ('1763', '1', '45', '216', '1026,1027,1025,1028', '1025', '装有 iOS 9 的 iPhone具有线控功能和麦克风的 Apple EarPodsLightning 至 USB 连接线USB 电源适配器资料', '<p>iPhone SE是美国苹果公司推出的一款新的4英寸iPhone智能手机，该手机基本上是2013年发布的iPhone 5s的升级版本。苹果公司将该款产品命名为：iPhone SE，这意味着iPhone升级版本的名称将首次不带数字。</p><p><br/></p><p>iPhone SE由苹果公司于美国时间2016年3月21日13点在美国加州库比蒂诺总部举行发布会正式发布。 iPhone SE有玫瑰金色，有一个嵌入不锈钢标志。正面和背面底部有玻璃镜面。iPhone SE外观与iPhone 5s基本一致。iPhone SE 16G和64G的美国市场售价分别为399和499美元，中国首发售价分别为3288元4088元。</p><p><br/></p>', 'Apple iPhone 5SE');

-- ----------------------------
-- Table structure for pk_list_40
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_40`;
CREATE TABLE `pk_list_40` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关于我们';

-- ----------------------------
-- Records of pk_list_40
-- ----------------------------
INSERT INTO `pk_list_40` VALUES ('1756', '1', '87', '0', '<p>深圳市锟铻科技有限公司（Shenzhen Kunwu Technology Co., Ltd.）创立于2014年，专注于企业网站技术的研究和开发，是国内最有影响力的企业网站技术提供商。</p><p>“创新，将新技术转化为生产力”是锟铻科技的核心竞争力。凭借对软件和互联网行业的深刻理解，锟铻科技将软件技术与互联网应用相结合，将领先业界的产品理念和丰富的产品开发经验相结合，为用户提供简单、方便、安全、实用的协同应用软件产品和解决方案，帮助客户实现低成本、低风险、快起步、高效率的信息化目标。</p><p>锟铻科技成长的过程，就是服务客户并和客户一起不断成功的过程！我们用心、努力作好每一件事，满怀信心迎接每一次挑战。</p>');
INSERT INTO `pk_list_40` VALUES ('1757', '1', '87', '0', '<p>联系我们</p><p>请到后台：关于我们》联系我们那里管理相关内容</p>');
INSERT INTO `pk_list_40` VALUES ('1758', '1', '87', '0', '<table><tbody><tr class=\"firstRow\"><td width=\"117\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"color: rgb(192, 0, 0);\">2011年12月</span></td><td width=\"721\" valign=\"top\" style=\"word-break: break-all;\">phpok3.4版发布（后台更换为桌面式）</td></tr><tr><td width=\"116\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"color: rgb(192, 0, 0);\">2011年9月</span></td><td width=\"721\" valign=\"top\" style=\"word-break: break-all;\">phpok3.3完整版发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2010年8月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">phpok3.0完整版发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2008年9月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">phpok3.0精简版发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2008年5月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">phpok2.2稳定版发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"116\"><span style=\"color: rgb(192, 0, 0);\">2008年3月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">phpok2.0发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"116\"><span style=\"color: rgb(192, 0, 0);\">2007年5月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb5.2发布，同时更名为 phpok1.0版本</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2007年1月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb5.0发布（第一次实现多语言，多风格的建站系统）</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2006年10月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb4.2发布（GBK）</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2006年8月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb4.1发布（UTF-8）</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2006年6月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb4.0发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2005年11月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgWeb3.0发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2005年8月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">工作室论坛开通</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2005年7月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgWeb1.0发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2005年4月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgWeb0.54版发布</td></tr></tbody></table><p><br/></p>');
INSERT INTO `pk_list_40` VALUES ('1759', '1', '87', '0', '<p>工作环境~</p>');

-- ----------------------------
-- Table structure for pk_list_46
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_46`;
CREATE TABLE `pk_list_46` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` longtext NOT NULL COMMENT '内容',
  `adm_reply` longtext NOT NULL COMMENT '管理员回复',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言模块';

-- ----------------------------
-- Records of pk_list_46
-- ----------------------------
INSERT INTO `pk_list_46` VALUES ('1285', '1', '96', '0', '测试留言', '测试留言', '测试留言', '', '');

-- ----------------------------
-- Table structure for pk_list_61
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_61`;
CREATE TABLE `pk_list_61` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `link` longtext NOT NULL COMMENT '链接',
  `target` varchar(255) NOT NULL DEFAULT '_self' COMMENT '链接方式',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人电话',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of pk_list_61
-- ----------------------------
INSERT INTO `pk_list_61` VALUES ('1252', '1', '142', '0', 'http://www.phpok.com', '_blank', '');
INSERT INTO `pk_list_61` VALUES ('1261', '1', '142', '0', 'http://www.sz-qibang.com/', '_blank', '');
INSERT INTO `pk_list_61` VALUES ('1262', '1', '142', '0', 'http://www.17tengfei.com/', '_blank', '');
INSERT INTO `pk_list_61` VALUES ('1263', '1', '142', '0', 'http://www.7139.com', '_blank', '');
INSERT INTO `pk_list_61` VALUES ('1264', '1', '142', '0', 'http://www.chinaz.com/', '_blank', '');
INSERT INTO `pk_list_61` VALUES ('1265', '1', '142', '0', 'http://www.admin5.com/', '_blank', '');
INSERT INTO `pk_list_61` VALUES ('1266', '1', '142', '0', 'http://www.cnzz.cn/', '_blank', '');
INSERT INTO `pk_list_61` VALUES ('1267', '1', '142', '0', 'http://www.im286.com/', '_blank', '');
INSERT INTO `pk_list_61` VALUES ('1268', '1', '142', '0', 'http://www.mycodes.net/', '_blank', '');
INSERT INTO `pk_list_61` VALUES ('1772', '1', '142', '0', 'http://www.phpok.com', '_self', '15818533971');

-- ----------------------------
-- Table structure for pk_list_64
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_64`;
CREATE TABLE `pk_list_64` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `qq` varchar(255) NOT NULL DEFAULT '' COMMENT '客服QQ',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客服';

-- ----------------------------
-- Records of pk_list_64
-- ----------------------------
INSERT INTO `pk_list_64` VALUES ('1305', '1', '148', '0', '40782502');
INSERT INTO `pk_list_64` VALUES ('1427', '1', '148', '0', '150467466');

-- ----------------------------
-- Table structure for pk_list_65
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_65`;
CREATE TABLE `pk_list_65` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `note` longtext NOT NULL COMMENT '摘要',
  `fsize` varchar(255) NOT NULL DEFAULT '' COMMENT '文件大小',
  `content` longtext NOT NULL COMMENT '内容',
  `version` varchar(255) NOT NULL DEFAULT '' COMMENT '版本',
  `website` varchar(255) NOT NULL DEFAULT '' COMMENT '官方网站',
  `platform` varchar(255) NOT NULL DEFAULT '' COMMENT '适用平台',
  `devlang` varchar(255) NOT NULL DEFAULT '' COMMENT '开发语言',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '开发商',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `copyright` varchar(255) NOT NULL DEFAULT '' COMMENT '授权协议',
  `dfile` varchar(255) NOT NULL DEFAULT '' COMMENT '附件',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源下载';

-- ----------------------------
-- Records of pk_list_65
-- ----------------------------
INSERT INTO `pk_list_65` VALUES ('1310', '1', '151', '198', '​测试下载~', '5KB', '<p>测试下载~<br/></p>', '1.0', 'http://www.phpok.com', 'OS', 'PHP/MySQL', 'PHPOK.com', '624', '免费版', '1029');

-- ----------------------------
-- Table structure for pk_list_66
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_66`;
CREATE TABLE `pk_list_66` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `content` longtext NOT NULL COMMENT '内容',
  `toplevel` varchar(255) NOT NULL DEFAULT '0' COMMENT '置顶',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='论坛BBS';

-- ----------------------------
-- Records of pk_list_66
-- ----------------------------
INSERT INTO `pk_list_66` VALUES ('1311', '1', '152', '204', '<p>测试论坛功能</p>', '', '');
INSERT INTO `pk_list_66` VALUES ('1334', '1', '152', '204', '<p>测试</p>', '', '');

-- ----------------------------
-- Table structure for pk_list_68
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_68`;
CREATE TABLE `pk_list_68` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictures` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图集相册';

-- ----------------------------
-- Records of pk_list_68
-- ----------------------------
INSERT INTO `pk_list_68` VALUES ('1765', '1', '144', '211', '1025', '1025,1028,1027,1026', '');
INSERT INTO `pk_list_68` VALUES ('1766', '1', '144', '211', '1024', '1021,1023,1024,1022', '<h4 style=\"white-space: normal;\">双曲面屏幕</h4><p style=\"white-space: normal;\">vivo Xplay5采用了双曲面屏幕，屏幕两侧有较大的弧度，曲面的屏幕会使屏幕呈现出无边的视觉效果。</p><p style=\"white-space: normal;\">vivo Xplay5专为曲面侧屏设计了侧屏来电提醒、解锁。</p><p style=\"white-space: normal;\"><br/></p><h4 style=\"white-space: normal;\">侧面解锁</h4><p style=\"white-space: normal;\">解锁方面，用户在进行图标滑动至曲面屏部分时会发生明显的「变形」，当在锁屏界面滑动解锁时，手机的曲面屏会有相当明显的光晕效果。</p><p style=\"white-space: normal;\">侧屏来电提醒：当手机反扣放在桌面时，如果手机来电时，双侧曲面屏也会散发波浪光影提醒用户来电信息。</p><p style=\"white-space: normal;\"><br/></p><h4 style=\"white-space: normal;\">智慧引擎</h4><p style=\"white-space: normal;\">智慧引擎优化主要分为内存加速和处理器加速。根据用户的使用情况选择性地智能加载部分常用应用，并调高这些常用应用的优先级，减小被回收的几率。另外，vivo 还优化了系统代码，大幅度降低系统的内存占用，并针对性地做了缓存碎片和内存的闲时动态回收，进而腾出更多的内存空间供用户使用。</p><p style=\"white-space: normal;\"><br/></p><h4 style=\"white-space: normal;\">分屏多任务</h4><p style=\"white-space: normal;\">vivo Xplay5配备了分屏多任务功能。在用户进行看电影，游戏，看书时，微信QQ聊天时不需进行切换，手机可以自动分屏为功能屏幕，一边聊微信，一边看电影。</p><p style=\"white-space: normal;\">但是现在分屏多任务支持的软件还有限，如果支持更多软件，分屏功能将会更实用。</p><p style=\"white-space: normal;\"><br/></p><h4 style=\"white-space: normal;\">128GB存储和3600mAh</h4><p style=\"white-space: normal;\">vivo Xplay5和vivo Xplay5旗舰版均配备了128GB的存储空间和3600mAH，提供更大和更长的续航选择。</p>');
INSERT INTO `pk_list_68` VALUES ('1767', '1', '144', '211', '1020', '1018,1020,1019', '');
INSERT INTO `pk_list_68` VALUES ('1768', '1', '144', '211', '1015', '1015,1017,1016', '');
INSERT INTO `pk_list_68` VALUES ('1769', '1', '144', '211', '1013', '1011,1012,1010', '');

-- ----------------------------
-- Table structure for pk_list_69
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_69`;
CREATE TABLE `pk_list_69` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `attrs` longtext NOT NULL COMMENT '产品多属性',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品参考数据';

-- ----------------------------
-- Records of pk_list_69
-- ----------------------------

-- ----------------------------
-- Table structure for pk_list_74
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_74`;
CREATE TABLE `pk_list_74` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `account` varchar(255) NOT NULL DEFAULT '' COMMENT '会员账号',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='注册审核模块';

-- ----------------------------
-- Records of pk_list_74
-- ----------------------------

-- ----------------------------
-- Table structure for pk_list_75
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_75`;
CREATE TABLE `pk_list_75` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  `bankprice` varchar(255) NOT NULL DEFAULT '' COMMENT '汇款金额',
  `note` longtext NOT NULL COMMENT '摘要',
  `bankname` varchar(255) NOT NULL DEFAULT '' COMMENT '汇款银行',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='银行汇款';

-- ----------------------------
-- Records of pk_list_75
-- ----------------------------
INSERT INTO `pk_list_75` VALUES ('1802', '1', '386', '0', 'seika', '15818', 'dfaf', 'adsfasfas', '测试的');

-- ----------------------------
-- Table structure for pk_list_84
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_84`;
CREATE TABLE `pk_list_84` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `wxtype` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单类型',
  `wxcontent` varchar(255) NOT NULL DEFAULT '' COMMENT '微信内容',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信菜单';

-- ----------------------------
-- Records of pk_list_84
-- ----------------------------

-- ----------------------------
-- Table structure for pk_list_attr
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_attr`;
CREATE TABLE `pk_list_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '属性组ID',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参数ID',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '增减价格值',
  `weight` float NOT NULL DEFAULT '0' COMMENT '重量增减',
  `volume` float NOT NULL DEFAULT '0' COMMENT '体积增减值，带-号为减值',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='主题属性';

-- ----------------------------
-- Records of pk_list_attr
-- ----------------------------
INSERT INTO `pk_list_attr` VALUES ('11', '1306', '3', '8', '5.0000', '0', '0', '20');
INSERT INTO `pk_list_attr` VALUES ('10', '1306', '3', '7', '5.0000', '0', '0', '10');
INSERT INTO `pk_list_attr` VALUES ('26', '1306', '1', '4', '2.0000', '1', '0', '30');
INSERT INTO `pk_list_attr` VALUES ('25', '1306', '1', '3', '4.0000', '1', '0', '20');
INSERT INTO `pk_list_attr` VALUES ('24', '1306', '1', '1', '3.0000', '1', '0', '10');
INSERT INTO `pk_list_attr` VALUES ('34', '1753', '8', '32', '1249.0000', '0', '0', '40');
INSERT INTO `pk_list_attr` VALUES ('33', '1753', '8', '31', '1199.0000', '0', '0', '30');
INSERT INTO `pk_list_attr` VALUES ('32', '1753', '8', '30', '549.0000', '0', '0', '20');
INSERT INTO `pk_list_attr` VALUES ('31', '1753', '8', '29', '499.0000', '0', '0', '10');
INSERT INTO `pk_list_attr` VALUES ('35', '1753', '1', '5', '0.0000', '0', '0', '40');
INSERT INTO `pk_list_attr` VALUES ('36', '1753', '1', '6', '0.0000', '0', '0', '50');
INSERT INTO `pk_list_attr` VALUES ('37', '1753', '1', '33', '0.0000', '0', '0', '60');
INSERT INTO `pk_list_attr` VALUES ('38', '1760', '1', '6', '0.0000', '0', '0', '50');
INSERT INTO `pk_list_attr` VALUES ('39', '1760', '1', '36', '0.0000', '0', '0', '70');
INSERT INTO `pk_list_attr` VALUES ('40', '1760', '8', '34', '0.0000', '0', '0', '50');
INSERT INTO `pk_list_attr` VALUES ('41', '1760', '8', '35', '1000.0000', '0', '0', '60');
INSERT INTO `pk_list_attr` VALUES ('42', '1761', '1', '5', '0.0000', '0', '0', '40');
INSERT INTO `pk_list_attr` VALUES ('43', '1761', '1', '6', '0.0000', '0', '0', '50');
INSERT INTO `pk_list_attr` VALUES ('44', '1761', '8', '34', '0.0000', '0', '0', '50');
INSERT INTO `pk_list_attr` VALUES ('45', '1761', '8', '35', '100.0000', '0', '0', '60');
INSERT INTO `pk_list_attr` VALUES ('46', '1762', '1', '33', '0.0000', '0', '0', '60');
INSERT INTO `pk_list_attr` VALUES ('47', '1763', '1', '6', '0.0000', '0', '0', '50');
INSERT INTO `pk_list_attr` VALUES ('48', '1763', '1', '33', '0.0000', '0', '0', '60');
INSERT INTO `pk_list_attr` VALUES ('49', '1763', '1', '5', '0.0000', '0', '0', '40');
INSERT INTO `pk_list_attr` VALUES ('50', '1763', '8', '34', '0.0000', '0', '0', '50');
INSERT INTO `pk_list_attr` VALUES ('51', '1763', '8', '37', '800.0000', '0', '0', '70');

-- ----------------------------
-- Table structure for pk_list_biz
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_biz`;
CREATE TABLE `pk_list_biz` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '价格',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '货币ID',
  `weight` float unsigned NOT NULL DEFAULT '0' COMMENT '重量，单位是Kg',
  `volume` float unsigned NOT NULL DEFAULT '0' COMMENT '体积，单位立方米',
  `unit` varchar(50) NOT NULL COMMENT '单位',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0实物1虚拟产品',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='电子商务';

-- ----------------------------
-- Records of pk_list_biz
-- ----------------------------
INSERT INTO `pk_list_biz` VALUES ('1306', '170.0000', '1', '0', '0', '条', '0');
INSERT INTO `pk_list_biz` VALUES ('1253', '300.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1680', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1681', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1682', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1683', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1684', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1685', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1686', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1687', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1688', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1689', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1690', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1691', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1692', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1693', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1694', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1748', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1749', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1750', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1753', '2000.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1760', '1499.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1761', '999.0000', '1', '0', '0', '台', '1');
INSERT INTO `pk_list_biz` VALUES ('1762', '3698.0000', '1', '0', '0', '', '0');
INSERT INTO `pk_list_biz` VALUES ('1763', '3288.0000', '1', '0', '0', '台', '1');

-- ----------------------------
-- Table structure for pk_list_cate
-- ----------------------------
DROP TABLE IF EXISTS `pk_list_cate`;
CREATE TABLE `pk_list_cate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  PRIMARY KEY (`id`,`cate_id`),
  KEY `id` (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题绑定的分类';

-- ----------------------------
-- Records of pk_list_cate
-- ----------------------------
INSERT INTO `pk_list_cate` VALUES ('1310', '198');
INSERT INTO `pk_list_cate` VALUES ('1311', '204');
INSERT INTO `pk_list_cate` VALUES ('1334', '204');
INSERT INTO `pk_list_cate` VALUES ('1676', '68');
INSERT INTO `pk_list_cate` VALUES ('1677', '68');
INSERT INTO `pk_list_cate` VALUES ('1753', '582');
INSERT INTO `pk_list_cate` VALUES ('1760', '583');
INSERT INTO `pk_list_cate` VALUES ('1761', '584');
INSERT INTO `pk_list_cate` VALUES ('1762', '585');
INSERT INTO `pk_list_cate` VALUES ('1763', '216');
INSERT INTO `pk_list_cate` VALUES ('1765', '211');
INSERT INTO `pk_list_cate` VALUES ('1766', '211');
INSERT INTO `pk_list_cate` VALUES ('1767', '211');
INSERT INTO `pk_list_cate` VALUES ('1768', '211');
INSERT INTO `pk_list_cate` VALUES ('1769', '211');
INSERT INTO `pk_list_cate` VALUES ('1871', '8');
INSERT INTO `pk_list_cate` VALUES ('1872', '68');
INSERT INTO `pk_list_cate` VALUES ('1873', '592');
INSERT INTO `pk_list_cate` VALUES ('1874', '8');

-- ----------------------------
-- Table structure for pk_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_log`;
CREATE TABLE `pk_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `note` varchar(255) NOT NULL COMMENT '日志摘要',
  `url` varchar(255) NOT NULL COMMENT '请求网址',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `app_id` varchar(30) NOT NULL DEFAULT 'www' COMMENT '接入APP_ID',
  `ctrl` varchar(255) NOT NULL COMMENT '控制器',
  `func` varchar(255) NOT NULL COMMENT '方法',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作人',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `ip` varchar(255) NOT NULL COMMENT '登录IP',
  `referer` varchar(255) NOT NULL COMMENT '来源网址',
  `mask` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0表示系统日志，1表示手动断点日志用于调试',
  `session_id` varchar(255) NOT NULL COMMENT 'SESSION_ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='日志记录';

-- ----------------------------
-- Records of pk_log
-- ----------------------------
INSERT INTO `pk_log` VALUES ('1', 'UEsDBBQAAAAAAEmWp0oAAAAAAAAAAAAAAAAKAAAAZnJhbWV3b3JrL1BLAwQUAAAAAABJlqdKAAAAAAAAAAAAAAAAEAAAAGZyYW1ld29yay9tb2RlbC9QSwMEFAAAAAgAsYinSipAUVICDQAAIDEAABoAAABmcmFtZXdvcmsvbW9kZWwvd2VhbHRoLnBocO1ae1PbRhD/G38K1cNUNjXG0OcETF+hz7Tp9DGdTppxVUuAJn5VlmPSlhmahmBSKKQ', 'http://www.pk.com/admin.php?c=update&f=file&file=47100&_=1494481789283', '1494481791', 'admin', 'update', 'file', '1', '0', '127.0.0.1', 'http://www.pk.com/admin.php?c=update&f=main&_noCache=0.1494481785', '0', '6g9jpqnngmlvu9pffk6gc6li82');
INSERT INTO `pk_log` VALUES ('2', 'ok', 'http://www.pk.com/admin.php?c=update&f=file&file=47100&_=1494481789283', '1494481791', 'admin', 'update', 'file', '1', '0', '127.0.0.1', 'http://www.pk.com/admin.php?c=update&f=main&_noCache=0.1494481785', '0', '6g9jpqnngmlvu9pffk6gc6li82');
INSERT INTO `pk_log` VALUES ('3', '您当前是最新版本，不需要再升级', 'http://www.pk.com/admin.php?c=update&f=check&_=1494481797523', '1494481798', 'admin', 'update', 'check', '1', '0', '127.0.0.1', 'http://www.pk.com/admin.php?c=update&menu_id=45&_noCache=0.053473492560109026', '0', '6g9jpqnngmlvu9pffk6gc6li82');
INSERT INTO `pk_log` VALUES ('4', '<span class=\"red\">标识串自动生成工具</span> 设置成功', 'http://www.pk.com/admin.php?c=plugin&f=save&_noCache=0.1494481859', '1494481867', 'admin', 'plugin', 'save', '1', '0', '127.0.0.1', 'http://www.pk.com/admin.php?c=plugin&f=config&id=identifier', '0', '6g9jpqnngmlvu9pffk6gc6li82');
INSERT INTO `pk_log` VALUES ('5', 'data/cache/f3aab1022bf22c5d.zip', 'http://www.pk.com/admin.php?c=upload&f=zip&_noCache=0.1494481960&PHPSESSION=6g9jpqnngmlvu9pffk6gc6li82&id=WU_FILE_0&name=collection.zip&type=application&lastModifiedDate=Thu+May+11+2017+13%3A53%3A07+GMT%2B0800+%28%E4%B8%AD%E5%9B%BD%E6%A0%87%E5%87%86%E6%97', '1494482719', 'admin', 'upload', 'zip', '1', '0', '127.0.0.1', 'http://www.pk.com/admin.php?c=plugin&menu_id=16&_noCache=0.15990951718138424', '0', '6g9jpqnngmlvu9pffk6gc6li82');
INSERT INTO `pk_log` VALUES ('6', '<span class=\"red\">采集器</span> 安装成功', 'http://www.pk.com/admin.php?c=plugin&f=install_save&_noCache=0.1494482728', '1494482735', 'admin', 'plugin', 'install_save', '1', '0', '127.0.0.1', 'http://www.pk.com/admin.php?c=plugin&f=install&id=collection', '0', '6g9jpqnngmlvu9pffk6gc6li82');
INSERT INTO `pk_log` VALUES ('7', '<span class=\"red\">采集器</span> 设置成功', 'http://www.pk.com/admin.php?c=plugin&f=save&_noCache=0.1494482754', '1494482759', 'admin', 'plugin', 'save', '1', '0', '127.0.0.1', 'http://www.pk.com/admin.php?c=plugin&f=config&id=collection', '0', '6g9jpqnngmlvu9pffk6gc6li82');
INSERT INTO `pk_log` VALUES ('8', '未指定列表地址', 'http://www.pk.com/admin.php?c=plugin&f=exec&exec=collection_setok&id=collection&_noCache=0.1494483171', '1494483333', 'admin', 'plugin', 'exec', '1', '0', '127.0.0.1', 'http://www.pk.com/admin.php?c=plugin&f=exec&exec=collection_set&id=collection&_noCache=0.1494483168', '0', '6g9jpqnngmlvu9pffk6gc6li82');
INSERT INTO `pk_log` VALUES ('9', '验证码不能为空', 'http://www.pk.com/admin.php?c=login&f=ok', '1495180915', 'admin', 'login', 'ok', '0', '0', '127.0.0.1', 'http://www.pk.com/admin.php?c=login&_noCache=0.1495180912', '0', '32frut9t7igas08vqp0jpl3ib5');
INSERT INTO `pk_log` VALUES ('10', '管理员密码输入不正确', 'http://www.ns.com/admin.php?c=login&f=ok', '1495439682', 'admin', 'login', 'ok', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=login&_noCache=0.1495439666', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('11', '管理员登录成功', 'http://www.ns.com/admin.php?c=login&f=ok', '1495439696', 'admin', 'login', 'ok', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=login&_noCache=0.1495439666', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('12', '您当前是最新版本，不需要再升级', 'http://www.ns.com/admin.php?c=update&f=check&_=1495439696897', '1495439697', 'admin', 'update', 'check', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=index', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('13', '您已成功登录', 'http://www.ns.com/admin.php?c=login&_noCache=0.1495439666', '1495439730', 'admin', 'login', 'index', '1', '0', '127.0.0.1', '', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('14', '系统栏目不支持执行此操作', 'http://www.ns.com/admin.php?c=system&f=status&id=2&_=1495440574347', '1495440579', 'admin', 'system', 'status', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=system&menu_id=9&_noCache=0.021803327860427935', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('15', '系统栏目不支持执行此操作', 'http://www.ns.com/admin.php?c=system&f=status&id=2&_=1495441200469', '1495441219', 'admin', 'system', 'status', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=system&menu_id=9&_noCache=0.5348329445242612', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('16', '网站信息更新完成', 'http://www.ns.com/admin.php?c=all&f=save&_noCache=0.1495441295', '1495441348', 'admin', 'all', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=setting&_noCache=0.24511416723421275', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('17', '系统栏目不支持执行此操作', 'http://www.ns.com/admin.php?c=system&f=status&id=2&_=1495441412135', '1495441417', 'admin', 'system', 'status', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=system&menu_id=9&_noCache=0.7142415350696101', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('18', '网站信息更新完成', 'http://www.ns.com/admin.php?c=all&f=save&_noCache=0.1495441695', '1495441714', 'admin', 'all', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=setting&_noCache=0.033083533493484696', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('19', '管理员<span class=\"red\">admin</span>成功退出', 'http://www.ns.com/admin.php?c=logout', '1495441743', 'admin', 'logout', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?_noCache=0.1495439736', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('20', '管理员登录成功', 'http://www.ns.com/admin.php?c=login&f=ok', '1495441754', 'admin', 'login', 'ok', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=login&_noCache=0.521042', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('21', '管理员<span class=\"red\">admin</span>成功退出', 'http://www.ns.com/admin.php?c=logout', '1495441834', 'admin', 'logout', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=index', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('22', '管理员登录成功', 'http://www.ns.com/admin.php?c=login&f=ok', '1495442120', 'admin', 'login', 'ok', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=login&_noCache=0.15226', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('23', '管理员<span class=\"red\">admin</span>成功退出', 'http://www.ns.com/admin.php?c=logout', '1495442346', 'admin', 'logout', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=index', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('24', '管理员登录成功', 'http://www.ns.com/admin.php?c=login&f=ok', '1495442357', 'admin', 'login', 'ok', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=login&_noCache=0.356596', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('25', '您已成功登录', 'http://www.ns.com/admin.php?c=login&_noCache=0.356596', '1495443292', 'admin', 'login', 'index', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=logout', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('26', '管理员<span class=\"red\">admin</span>成功退出', 'http://www.ns.com/admin.php?c=logout', '1495443304', 'admin', 'logout', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=index', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('27', '管理员登录成功', 'http://www.ns.com/admin.php?c=login&f=ok', '1495443315', 'admin', 'login', 'ok', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=login&_noCache=0.357382', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('28', '扩展组配置成功', 'http://www.ns.com/admin.php?c=all&f=gset_save&_noCache=0.1495443331', '1495443388', 'admin', 'all', 'gset_save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=gset&_noCache=0.7986765193516421', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('29', '扩展全局内容设置成功', 'http://www.ns.com/admin.php?c=all&f=ext_save&_noCache=0.1495443399', '1495443412', 'admin', 'all', 'ext_save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=set&_noCache=0.1495443390&id=115', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('30', '扩展全局内容设置成功', 'http://www.ns.com/admin.php?c=all&f=ext_save&_noCache=0.1495443490', '1495443513', 'admin', 'all', 'ext_save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=set&_noCache=0.1495443456&id=115', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('31', '扩展全局内容设置成功', 'http://www.ns.com/admin.php?c=all&f=ext_save&_noCache=0.1495443625', '1495443633', 'admin', 'all', 'ext_save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=set&_noCache=0.1495443514&id=115', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('32', '数据存储成功', 'http://www.ns.com/admin.php?c=auto&__type=all-4', '1495444087', 'admin', 'auto', 'index', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=set&id=4&_noCache=0.39361475342748675', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('33', '扩展全局内容设置成功', 'http://www.ns.com/admin.php?c=all&f=ext_save&_noCache=0.1495444087', '1495444102', 'admin', 'all', 'ext_save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=set&id=4&_noCache=0.39361475342748675', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('34', '扩展全局内容设置成功', 'http://www.ns.com/admin.php?c=all&f=ext_save&_noCache=0.1495444215', '1495444226', 'admin', 'all', 'ext_save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=set&id=4&_noCache=0.809301387716912', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('35', '主题删除成功', 'http://www.ns.com/admin.php?c=list&f=del&id=520%2C712%2C755%2C1254%2C760%2C761%2C714%2C716%2C1256%2C1298%2C1299&_=1495445541834', '1495445572', 'admin', 'list', 'del', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=action&id=42&_noCache=0.3000932907744598', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('36', '您已成功登录', 'http://www.ns.com/admin.php?c=login&_noCache=0.1495439666', '1495445733', 'admin', 'login', 'index', '1', '0', '127.0.0.1', '', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('37', '标识正常，可以使用', 'http://www.ns.com/admin.php?c=cate&f=check&id=7&sign=information&_=1495445740122', '1495445744', 'admin', 'cate', 'check', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=cate&f=set&id=7&_noCache=0.1495445737', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('38', '分类信息配置成功', 'http://www.ns.com/admin.php?c=cate&f=save&_noCache=0.1495445739', '1495445744', 'admin', 'cate', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=cate&f=set&id=7&_noCache=0.1495445737', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('39', 'jikezaozhidao', 'http://www.ns.com/api.php?c=plugin&f=index&id=identifier&exec=pingyin&title=%E6%9E%81%E5%AE%A2%E6%97%A9%E7%9F%A5%E9%81%93&_noCache=0.09625041647568966&_=1495445748516', '1495445764', 'api', 'plugin', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=cate&f=set&id=8&_noCache=0.1495445745', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('40', 'chanpinguancha', 'http://www.ns.com/api.php?c=plugin&f=index&id=identifier&exec=pingyin&title=%E4%BA%A7%E5%93%81%E8%A7%82%E5%AF%9F&_noCache=0.8504994115457993&_=1495445772262', '1495445795', 'api', 'plugin', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=cate&f=set&id=68&_noCache=0.1495445769', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('41', 'jikezhixuan', 'http://www.ns.com/api.php?c=plugin&f=index&id=identifier&exec=pingyin&title=%E6%9E%81%E5%AE%A2%E4%B9%8B%E9%80%89&_noCache=0.44435046817765556&_=1495445803450', '1495445809', 'api', 'plugin', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=cate&f=set&parent_id=7&_noCache=0.1495445799', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('42', '标识正常，可以使用', 'http://www.ns.com/admin.php?c=cate&f=check&sign=jikezhixuan&_=1495445803451', '1495445811', 'admin', 'cate', 'check', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=cate&f=set&parent_id=7&_noCache=0.1495445799', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('43', '分类信息配置成功', 'http://www.ns.com/admin.php?c=cate&f=save&_noCache=0.1495445803', '1495445811', 'admin', 'cate', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=cate&f=set&parent_id=7&_noCache=0.1495445799', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('44', '主题删除成功', 'http://www.ns.com/admin.php?c=list&f=del&id=1866%2C1865%2C1864&_=1495446062606', '1495446072', 'admin', 'list', 'del', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=action&id=42&_noCache=0.5214911470557702', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('45', '网站信息更新完成', 'http://www.ns.com/admin.php?c=all&f=save&_noCache=0.1495446208', '1495446218', 'admin', 'all', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=setting&_noCache=0.6573804340455844', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('46', '附件信息获取失败，可能已经删除，请检查', 'http://www.ns.com/admin.php?c=upload&f=thumbshow&id=725&_=1495446275482', '1495446275', 'admin', 'upload', 'thumbshow', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=edit&id=1369&_noCache=0.1495446247', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('47', 'ok', 'http://www.ns.com/admin.php?c=inp&type=user&_=1495446275483', '1495446276', 'admin', 'inp', 'index', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=edit&id=1369&_noCache=0.1495446247', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('48', 'ok', 'http://www.ns.com/admin.php?c=inp&type=user&_=1495446352035', '1495446352', 'admin', 'inp', 'index', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=edit&id=1371&_noCache=0.1495446349', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('49', '附件信息获取失败，可能已经删除，请检查', 'http://www.ns.com/admin.php?c=upload&f=thumbshow&id=725&_=1495446547786', '1495446547', 'admin', 'upload', 'thumbshow', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=edit&id=1369&_noCache=0.1495446544', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('50', 'ok', 'http://www.ns.com/admin.php?c=inp&type=user&_=1495446547787', '1495446548', 'admin', 'inp', 'index', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=edit&id=1369&_noCache=0.1495446544', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('51', '主题删除成功', 'http://www.ns.com/admin.php?c=list&f=del&id=1371%2C1370%2C1369%2C1368%2C1423&_=1495446736666', '1495446744', 'admin', 'list', 'del', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=action&id=43&_noCache=0.5272174024241871', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('52', '主题删除成功', 'http://www.ns.com/admin.php?c=list&f=del&id=1278%2C1277%2C1276&_=1495504392005', '1495504397', 'admin', 'list', 'del', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=action&id=41&_noCache=0.34201929236031425', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('53', '上传的文件异常', 'http://www.ns.com/admin.php?c=upload&f=save&_noCache=0.1495504526&PHPSESSION=ijl165dghg45f3nrhmqbf5gv17&id=WU_FILE_0&name=s1.jpg&type=image%2Fjpeg&lastModifiedDate=Tue+May+23+2017+09%3A54%3A44+GMT%2B0800+%28%E4%B8%AD%E5%9B%BD%E6%A0%87%E5%87%86%E6%97%B6%E9', '1495504535', 'admin', 'upload', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=edit&pid=41&_noCache=0.1495504524', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('54', '标识正常，可以使用', 'http://www.ns.com/admin.php?c=cate&f=check&id=8&sign=jikezaozhidao&_=1495504747930', '1495504795', 'admin', 'cate', 'check', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=cate&f=set&id=8&_noCache=0.1495504731', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('55', '分类信息配置成功', 'http://www.ns.com/admin.php?c=cate&f=save&_noCache=0.1495504747', '1495504795', 'admin', 'cate', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=cate&f=set&id=8&_noCache=0.1495504731', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('56', '扩展全局内容设置成功', 'http://www.ns.com/admin.php?c=all&f=ext_save&_noCache=0.1495504893', '1495504929', 'admin', 'all', 'ext_save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=set&id=4&_noCache=0.752945553541466', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('57', '主题删除成功', 'http://www.ns.com/admin.php?c=list&f=del&id=1301&_=1495504982431', '1495504994', 'admin', 'list', 'del', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=action&id=147&_noCache=0.8070686999452137', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('58', '扩展全局内容设置成功', 'http://www.ns.com/admin.php?c=all&f=ext_save&_noCache=0.1495505132', '1495505139', 'admin', 'all', 'ext_save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=set&id=4&_noCache=0.5891852902411476', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('59', '风格方案配置成功', 'http://www.ns.com/admin.php?c=tpl&f=save&_noCache=0.1495508085', '1495508134', 'admin', 'tpl', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=tpl&f=set&_noCache=0.1495508082', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('60', '网站信息更新完成', 'http://www.ns.com/admin.php?c=all&f=save&_noCache=0.1495508181', '1495508198', 'admin', 'all', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=setting&_noCache=0.968064594816971', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('61', '未配置模板 news_list，请配置相应的模板', 'http://www.ns.com/index.php?id=news', '1495522025', 'www', 'project', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/index.php?siteId=1', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('62', '更新排序成功', 'http://www.ns.com/admin.php?c=list&f=content_sort&sort%5B1870%5D=40&_=1495522053496', '1495522060', 'admin', 'list', 'content_sort', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=list&f=action&id=42&_noCache=0.1495522043', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('63', '未配置模板 news_list，请配置相应的模板', 'http://www.ns.com/index.php?id=news&cate=jikezhixuan', '1495523749', 'www', 'project', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/index.php', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('64', '网站信息更新完成', 'http://www.ns.com/admin.php?c=all&f=save&_noCache=0.1495525823', '1495525830', 'admin', 'all', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=setting&_noCache=0.6381717829567781', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('65', '网站信息更新完成', 'http://www.ns.com/admin.php?c=all&f=save&_noCache=0.1495525831', '1495526186', 'admin', 'all', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=all&f=setting&_noCache=0.107586', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('66', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495528179', '1495528290', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=105&_noCache=0.1495528126', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('67', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495532556', '1495532861', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495528335', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('68', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495532920', '1495532924', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=105&_noCache=0.1495532915', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('69', 'shouye-jikezhidaoliebiao', 'http://www.ns.com/api.php?c=plugin&f=index&id=identifier&exec=pingyin&title=%E9%A6%96%E9%A1%B5-%E6%9E%81%E5%AE%A2%E7%9F%A5%E9%81%93%E5%88%97%E8%A1%A8&_noCache=0.7796203312127361&_=1495533530560', '1495533625', 'api', 'plugin', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495532926', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('70', 'shouye-jikezaozhidaoliebiao', 'http://www.ns.com/api.php?c=plugin&f=index&id=identifier&exec=pingyin&title=%E9%A6%96%E9%A1%B5-%E6%9E%81%E5%AE%A2%E6%97%A9%E7%9F%A5%E9%81%93%E5%88%97%E8%A1%A8&_noCache=0.3807487242094898&_=1495533530561', '1495533641', 'api', 'plugin', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495532926', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('71', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495533530', '1495533665', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495532926', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('72', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495533721', '1495533764', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495533667', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('73', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495533974', '1495534000', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495533806', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('74', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495534867', '1495534872', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495534001', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('75', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495535055', '1495535061', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495534873', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('76', 'zixunzhongxin', 'http://www.ns.com/api.php?c=plugin&f=index&id=identifier&exec=pingyin&title=%E8%B5%84%E8%AE%AF%E4%B8%AD%E5%BF%83&_noCache=0.06992965373095483&_=1495538621679', '1495538630', 'api', 'plugin', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495538615', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('77', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495538621', '1495538647', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495538615', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('78', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495538921', '1495539416', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=104&_noCache=0.1495538649', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('79', '您已成功登录', 'http://www.ns.com/admin.php?c=login&_noCache=0.1495439666', '1495604579', 'admin', 'login', 'index', '1', '0', '127.0.0.1', '', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('80', 'testceshi', 'http://www.ns.com/api.php?c=plugin&f=index&id=identifier&exec=pingyin&title=test%E6%B5%8B%E8%AF%95&_noCache=0.37273052997127243&_=1495605689736', '1495605697', 'api', 'plugin', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&_noCache=0.1495604628', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('81', 'biaoqianliebiao', 'http://www.ns.com/api.php?c=plugin&f=index&id=identifier&exec=pingyin&title=%E6%A0%87%E7%AD%BE%E5%88%97%E8%A1%A8&_noCache=0.7610792995407856&_=1495605831242', '1495605855', 'api', 'plugin', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&_noCache=0.1495605822', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('82', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495605830', '1495606053', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&_noCache=0.1495605822', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('83', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495607641', '1495607653', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=287&_noCache=0.1495606055', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('84', '数据调用中心配置成功', 'http://www.ns.com/admin.php?c=call&f=save&_noCache=0.1495607666', '1495607736', 'admin', 'call', 'save', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=call&f=set&id=287&_noCache=0.1495607654', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('85', '未配置模板 picture-player_list，请配置相应的模板', 'http://www.ns.com/index.php?id=picture-player&cate=jikezaozhidao', '1495608728', 'www', 'project', 'index', '0', '0', '127.0.0.1', 'http://www.ns.com/index.php?c=tag&title=%E5%85%AC%E5%8F%B8%20%E6%96%B0%E9%97%BB&_noCache=0.1495608721', '0', 'ijl165dghg45f3nrhmqbf5gv17');
INSERT INTO `pk_log` VALUES ('86', '字段添加成功', 'http://www.ns.com/admin.php?c=module&f=field_add&id=22&fid=124&_=1495615172790', '1495615184', 'admin', 'module', 'field_add', '1', '0', '127.0.0.1', 'http://www.ns.com/admin.php?c=module&f=fields&id=22&_noCache=0.1495615168', '0', 'ijl165dghg45f3nrhmqbf5gv17');

-- ----------------------------
-- Table structure for pk_module
-- ----------------------------
DROP TABLE IF EXISTS `pk_module`;
CREATE TABLE `pk_module` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(255) NOT NULL COMMENT '模块名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '模块排序',
  `note` varchar(255) NOT NULL COMMENT '模块说明',
  `layout` text NOT NULL COMMENT '布局',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='模块管理，每创建一个模块自动创建一个表';

-- ----------------------------
-- Records of pk_module
-- ----------------------------
INSERT INTO `pk_module` VALUES ('21', '图片轮播', '1', '20', '适用于图片播放器，图片友情链接', 'pic,link,target');
INSERT INTO `pk_module` VALUES ('22', '文章资讯', '1', '10', '适用于新闻，文章之类', 'hits,dateline,thumb');
INSERT INTO `pk_module` VALUES ('23', '自定义链接', '1', '30', '适用于导航，页脚文本导航，文字友情链接', 'link,target');
INSERT INTO `pk_module` VALUES ('24', '产品', '1', '40', '适用于电子商务中产品展示模型', 'hits,dateline,m_title,thumb');
INSERT INTO `pk_module` VALUES ('40', '单页信息', '1', '60', '适用于公司简介，联系我们', 'hits,dateline');
INSERT INTO `pk_module` VALUES ('46', '留言模块', '1', '90', '', 'dateline,fullname,email,content');
INSERT INTO `pk_module` VALUES ('61', '友情链接', '1', '100', '适用于导航，页脚文本导航，文字友情链接', 'link,target,tel');
INSERT INTO `pk_module` VALUES ('64', '客服', '1', '110', '', 'qq');
INSERT INTO `pk_module` VALUES ('65', '资源下载', '1', '70', '', 'hits,dateline,fsize,version,author,website,thumb');
INSERT INTO `pk_module` VALUES ('66', '论坛BBS', '1', '50', '', 'hits,dateline,user_id');
INSERT INTO `pk_module` VALUES ('68', '图集相册', '1', '80', '', 'hits,dateline,thumb');
INSERT INTO `pk_module` VALUES ('69', '产品参考数据', '1', '120', '', 'hits,dateline');
INSERT INTO `pk_module` VALUES ('74', '注册审核模块', '1', '130', '用户实现会员自动审核验证', 'dateline,account');
INSERT INTO `pk_module` VALUES ('75', '银行汇款', '1', '140', '', 'dateline,user_id,bankname,fullname,mobile,bankprice');
INSERT INTO `pk_module` VALUES ('84', '微信菜单', '1', '150', '', 'hits,dateline');

-- ----------------------------
-- Table structure for pk_module_fields
-- ----------------------------
DROP TABLE IF EXISTS `pk_module_fields`;
CREATE TABLE `pk_module_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `module_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` varchar(255) NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  `is_front` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0前端不可用1前端可用',
  `search` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不支持搜索1完全匹配搜索2模糊匹配搜索3区间搜索',
  `search_separator` varchar(10) NOT NULL COMMENT '分割符，仅限区间搜索时有效',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=336 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of pk_module_fields
-- ----------------------------
INSERT INTO `pk_module_fields` VALUES ('92', '21', '链接', 'link', 'longtext', '', 'text', '', 'safe', '', '90', 'a:2:{s:8:\"form_btn\";s:3:\"url\";s:5:\"width\";s:3:\"500\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('82', '22', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '10', 'a:6:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"0\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('83', '22', '内容', 'content', 'longtext', '', 'editor', '', 'html_js', '', '30', 'a:8:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"inc_tag\";s:1:\"1\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:9:{s:5:\"image\";s:1:\"1\";s:4:\"info\";s:1:\"1\";s:5:\"video\";s:1:\"1\";s:4:\"file\";s:1:\"1\";s:4:\"page\";s:1:\"1\";s:10:\"insertcode\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";s:10:\"fontfamily\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('84', '23', '链接', 'link', 'longtext', '设置导航链接', 'url', '', 'safe', '', '90', 'a:1:{s:5:\"width\";s:3:\"500\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('85', '23', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_self', '100', 'a:1:{s:11:\"option_list\";s:5:\"opt:6\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('88', '24', '图片', 'pictures', 'varchar', '设置产品的图片，支持多图，上传规格为500x500', 'upload', '', 'safe', '', '50', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('93', '21', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_blank', '100', 'a:3:{s:11:\"option_list\";s:5:\"opt:6\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";b:0;}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('131', '40', '内容', 'content', 'longtext', '', 'editor', '', 'html_js', '', '255', 'a:7:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:6:{s:5:\"image\";s:1:\"1\";s:4:\"info\";s:1:\"1\";s:10:\"insertcode\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";s:10:\"fontfamily\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('141', '46', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('142', '46', '邮箱', 'email', 'varchar', '', 'text', '', 'safe', '', '130', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('143', '46', '内容', 'content', 'longtext', '', 'textarea', '', 'safe', '', '200', 'a:2:{s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"180\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('144', '46', '管理员回复', 'adm_reply', 'longtext', '', 'editor', '', 'html_js', '', '255', 'a:7:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:3:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('200', '21', '图片', 'pic', 'varchar', '1200*573', 'upload', '', 'safe', '', '20', 'a:8:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"0\";s:15:\"upload_compress\";s:1:\"0\";s:18:\"upload_compress_wh\";s:3:\"500\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('177', '22', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:2:\"80\";}', '0', '2', '');
INSERT INTO `pk_module_fields` VALUES ('204', '61', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_self', '100', 'a:3:{s:11:\"option_list\";s:5:\"opt:6\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";s:0:\"\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('203', '61', '链接', 'link', 'longtext', '填写链接要求带上http://', 'text', '', 'safe', '', '90', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"280\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('268', '65', '附件', 'dfile', 'varchar', '', 'upload', '', 'safe', '', '60', 'a:8:{s:7:\"cate_id\";s:2:\"11\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:7:\"rar,zip\";s:11:\"upload_name\";s:12:\"压缩软件\";s:13:\"upload_binary\";s:1:\"0\";s:15:\"upload_compress\";s:1:\"0\";s:18:\"upload_compress_wh\";s:3:\"500\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('221', '65', '摘要', 'note', 'longtext', '简要描述下载信息', 'textarea', '', 'safe', '', '120', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('222', '65', '文件大小', 'fsize', 'varchar', '设置文件大小，注意填写相应的单位，如KB，MB', 'text', '', 'safe', '', '10', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('226', '65', '版本', 'version', 'varchar', '设置软件版本号', 'text', '', 'safe', '', '15', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"100\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('227', '65', '官方网站', 'website', 'varchar', '请输入软件官方网址，没有请留空，需要加 http://', 'text', '', 'safe', 'http://', '30', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('224', '65', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:7:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:3:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('228', '65', '适用平台', 'platform', 'varchar', '请填写该软件适用在哪个平台下运行', 'text', '', 'safe', '', '40', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:93:\"WinXPWin2003WinVistaWin7Win8Win2008Win2012CentOSRedHatUbuntuFreeBSDOS\";s:14:\"ext_quick_type\";s:1:\"/\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('229', '65', '开发语言及数据库', 'devlang', 'varchar', '设置该软件的开发语言及数据库', 'text', '', 'safe', '', '50', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:108:\"PHPASPJSPPerlHTMLJSMySQLAccessSQLiteOracleC++C#VBDephiJavaPythonRuby其他\";s:14:\"ext_quick_type\";s:1:\"/\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('230', '65', '开发商', 'author', 'varchar', '设置开发商名称', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('231', '65', '缩略图', 'thumb', 'varchar', '设置附件缩略图，宽高为420x420', 'upload', '', 'safe', '', '110', 'a:8:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"1\";s:15:\"upload_compress\";s:1:\"0\";s:18:\"upload_compress_wh\";s:3:\"500\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('232', '65', '授权协议', 'copyright', 'varchar', '针对这个软件设置相应的授权协议', 'radio', '', 'safe', '免费版', '70', 'a:3:{s:11:\"option_list\";b:0;s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";s:97:\"免费版共享版试用版商业版开源软件GPLLGPLApache License其他授权\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('233', '66', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:7:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:4:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";s:10:\"fontfamily\";s:1:\"1\";}}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('234', '66', '置顶', 'toplevel', 'varchar', '', 'radio', '', 'int', '', '10', 'a:3:{s:11:\"option_list\";s:6:\"opt:12\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";b:0;}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('238', '66', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('239', '68', '缩略图', 'thumb', 'varchar', '请上传300x300规格的图片，文件大小建议不超过100KB', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('240', '68', '图片', 'pictures', 'varchar', '支持多图，建议上传500x500或600x600规格的图片', 'upload', '', 'safe', '', '50', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('244', '61', '联系人电话', 'tel', 'varchar', '填写联系人电话', 'text', '', 'safe', '', '110', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"280\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('248', '69', '产品多属性', 'attrs', 'longtext', '', 'param', '', 'safe', '', '20', 'a:3:{s:6:\"p_name\";s:0:\"\";s:6:\"p_type\";s:1:\"1\";s:7:\"p_width\";s:0:\"\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('267', '68', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:7:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:3:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('269', '46', '图片', 'pic', 'varchar', '', 'upload', '', 'safe', '', '180', 'a:8:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"0\";s:15:\"upload_compress\";s:1:\"1\";s:18:\"upload_compress_wh\";s:3:\"500\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('270', '64', '客服QQ', 'qq', 'varchar', '', 'text', '', 'safe', '', '150', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('288', '24', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '20', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('292', '24', '包装清单', 'package', 'longtext', '', 'textarea', '', '', '', '70', 'a:2:{s:5:\"width\";s:3:\"500\";s:6:\"height\";s:3:\"100\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('293', '24', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '80', 'a:8:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:4:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";s:10:\"fontfamily\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('294', '24', '手机版标题', 'm_title', 'varchar', '标题较短，请根据实际情况使用', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('296', '74', '会员账号', 'account', 'varchar', '验证会员模块的账号', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('297', '75', '姓名', 'fullname', 'varchar', '请填写汇款人的姓名', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('298', '75', '手机号', 'mobile', 'varchar', '请填写汇款人的手机号', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('299', '75', '汇款金额', 'bankprice', 'varchar', '请填写您汇款的金额，建议多汇几分，以示区别', 'text', '', 'safe', '', '30', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('300', '75', '摘要', 'note', 'longtext', '填写您的备注或汇款银行上的备注信息', 'textarea', '', 'safe', '', '40', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('301', '75', '汇款银行', 'bankname', 'varchar', '请填写您汇款的银行', 'text', '', 'safe', '', '5', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `pk_module_fields` VALUES ('326', '84', '微信内容', 'wxcontent', 'varchar', '如为是跳转，请输入跳转的网址，点击事件就输入动作标识，标识限字母数字及下划线', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"600\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('325', '84', '菜单类型', 'wxtype', 'varchar', '', 'select', '', 'safe', '', '10', 'a:5:{s:11:\"option_list\";s:6:\"opt:14\";s:11:\"is_multiple\";s:1:\"0\";s:5:\"width\";s:0:\"\";s:10:\"ext_select\";s:0:\"\";s:9:\"empty_val\";s:12:\"请选择…\";}', '0', '0', '');
INSERT INTO `pk_module_fields` VALUES ('335', '22', '稿源', 'linkurl', 'varchar', '采集的地址', 'text', '', 'safe', '', '35', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '0', '0', '');

-- ----------------------------
-- Table structure for pk_opt
-- ----------------------------
DROP TABLE IF EXISTS `pk_opt`;
CREATE TABLE `pk_opt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '组ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `val` varchar(255) NOT NULL COMMENT '值',
  `taxis` int(10) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='表单列表选项';

-- ----------------------------
-- Records of pk_opt
-- ----------------------------
INSERT INTO `pk_opt` VALUES ('1', '1', '0', '女', '', '20');
INSERT INTO `pk_opt` VALUES ('2', '1', '0', '男', '1', '10');
INSERT INTO `pk_opt` VALUES ('5', '2', '0', '福建省', '福建省', '255');
INSERT INTO `pk_opt` VALUES ('6', '2', '5', '泉州市', '泉州市', '255');
INSERT INTO `pk_opt` VALUES ('7', '2', '6', '永春县', '永春县', '255');
INSERT INTO `pk_opt` VALUES ('8', '2', '7', '一都镇', '一都镇', '255');
INSERT INTO `pk_opt` VALUES ('9', '2', '8', '美岭村', '美岭村', '255');
INSERT INTO `pk_opt` VALUES ('11', '2', '0', '广东省', '广东省', '255');
INSERT INTO `pk_opt` VALUES ('12', '2', '11', '深圳市', '深圳市', '255');
INSERT INTO `pk_opt` VALUES ('13', '2', '12', '龙岗区', '龙岗区', '10');
INSERT INTO `pk_opt` VALUES ('14', '2', '12', '罗湖区', '罗湖区', '20');
INSERT INTO `pk_opt` VALUES ('15', '2', '12', '福田区', '福田区', '30');
INSERT INTO `pk_opt` VALUES ('16', '2', '12', '龙华区', '龙华区', '40');
INSERT INTO `pk_opt` VALUES ('17', '4', '0', '是', '1', '10');
INSERT INTO `pk_opt` VALUES ('18', '4', '0', '否', '', '20');
INSERT INTO `pk_opt` VALUES ('21', '6', '0', '当前窗口', '_self', '10');
INSERT INTO `pk_opt` VALUES ('22', '6', '0', '新窗口', '_blank', '20');
INSERT INTO `pk_opt` VALUES ('23', '7', '0', '启用', '1', '10');
INSERT INTO `pk_opt` VALUES ('24', '7', '0', '禁用', '', '20');
INSERT INTO `pk_opt` VALUES ('25', '8', '0', 'UTF-8', 'utf8', '20');
INSERT INTO `pk_opt` VALUES ('26', '8', '0', 'GBK', 'gbk', '10');
INSERT INTO `pk_opt` VALUES ('62', '12', '0', '不置顶', '', '10');
INSERT INTO `pk_opt` VALUES ('63', '12', '0', '一级置顶', '1', '20');
INSERT INTO `pk_opt` VALUES ('64', '12', '0', '二级置顶', '2', '30');
INSERT INTO `pk_opt` VALUES ('65', '13', '0', '三分钟', '180', '10');
INSERT INTO `pk_opt` VALUES ('66', '14', '0', '点击推事件', 'click', '10');
INSERT INTO `pk_opt` VALUES ('67', '14', '0', '跳转链接', 'view', '20');

-- ----------------------------
-- Table structure for pk_opt_group
-- ----------------------------
DROP TABLE IF EXISTS `pk_opt_group`;
CREATE TABLE `pk_opt_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID ',
  `title` varchar(100) NOT NULL COMMENT '名称，用于后台管理',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='可选菜单管理器';

-- ----------------------------
-- Records of pk_opt_group
-- ----------------------------
INSERT INTO `pk_opt_group` VALUES ('1', '性别');
INSERT INTO `pk_opt_group` VALUES ('2', '省市县多级联动');
INSERT INTO `pk_opt_group` VALUES ('4', '是与否');
INSERT INTO `pk_opt_group` VALUES ('6', '窗口打开方式');
INSERT INTO `pk_opt_group` VALUES ('7', '注册');
INSERT INTO `pk_opt_group` VALUES ('8', '邮件编码');
INSERT INTO `pk_opt_group` VALUES ('12', '置顶属性');
INSERT INTO `pk_opt_group` VALUES ('13', '等候时间');
INSERT INTO `pk_opt_group` VALUES ('14', '微信菜单类型');

-- ----------------------------
-- Table structure for pk_order
-- ----------------------------
DROP TABLE IF EXISTS `pk_order`;
CREATE TABLE `pk_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `sn` varchar(255) NOT NULL COMMENT '订单编号，唯一值',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示游客',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '金额',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '货币类型',
  `currency_rate` decimal(13,8) unsigned NOT NULL DEFAULT '1.00000000' COMMENT '货币汇率',
  `status` varchar(255) NOT NULL COMMENT '订单的最后状态',
  `status_title` varchar(255) NOT NULL COMMENT '订单状态说明',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `passwd` varchar(255) NOT NULL COMMENT '密码串',
  `ext` text NOT NULL COMMENT '扩展内容信息，可用于存储一些扩展信息',
  `note` text NOT NULL COMMENT '摘要',
  `email` varchar(255) NOT NULL COMMENT '邮箱，用于接收通知',
  `mobile` varchar(50) NOT NULL COMMENT '手机号，用于短信发送',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ordersn` (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='订单中心';

-- ----------------------------
-- Records of pk_order
-- ----------------------------
INSERT INTO `pk_order` VALUES ('13', 'P2016091173U00023003', '23', '1473581424', '8.0000', '1', '6.16989994', 'end', '订单完成', '1480395300', '2564ff8f777cef5fb3fce8f47c442ceb', '', 'fasdfasdfsadf', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('19', 'KF20161013193521BSJ', '24', '1476354952', '2000.0000', '1', '6.16989994', 'shipping', '', '0', 'e117ef9e86f571ff3a9654d4904ce20f', '', '', 'admin@phpok.com', '15818533972');
INSERT INTO `pk_order` VALUES ('20', 'KF20161013194849ELH', '25', '1476355746', '999.0000', '1', '6.16989994', 'unpaid', '', '0', '285c4bc42d63f8ad295900a3dfc4cf1b', '', '', 'demo@demo.com', '');
INSERT INTO `pk_order` VALUES ('21', 'KF2016101319534OUJ', '27', '1476355996', '999.0000', '1', '6.16989994', 'paid', '', '0', '485009ee449b9a5fa961786d867d1dc1', '', '', 'suxiangkun@126.com', '');
INSERT INTO `pk_order` VALUES ('22', 'P2016112948U00023001', '23', '1480394929', '48.0000', '1', '6.16989994', 'end', '订单完成', '1480395292', '4e15e6491ca0884fde23722648908449', '', '测蔗用的', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('23', 'P2016112919U00023002', '23', '1480395663', '3.0000', '1', '6.16989994', 'end', '订单完成', '1480397929', 'd67ce8c1fb727c81af9f6645c215f1c5', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('24', 'P2016112970U00023003', '23', '1480397971', '2.0000', '1', '6.16989994', 'paid', '付款完成', '0', '28573bb9f9e8e01b3e3dbcf9e8e6a448', 'a:3:{s:12:\"保单姓名\";s:9:\"苏相锟\";s:15:\"保单有效期\";s:8:\"12个月\";s:12:\"身份证号\";s:9:\"123456789\";}', '', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('25', 'P2016120132U00023001', '23', '1480589339', '4088.0000', '1', '1.00000000', 'create', '', '0', 'd334ece569c6d73091213ff2f6112ce1', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('26', 'P2016120136U00023002', '23', '1480589452', '3288.0000', '1', '1.00000000', 'create', '', '0', 'f15715ebb8c698b6772e709ab5f6c2aa', '', 'fasdfasdf', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('27', 'P2016120159U00023003', '23', '1480589524', '3288.0000', '1', '1.00000000', 'create', '', '0', '382311e82c9f7c761eec1578abf55f51', 'a:2:{s:8:\"fullname\";s:5:\"fasdf\";s:6:\"idcard\";s:7:\"fasdfsd\";}', 'fasdfasdf', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('28', 'P2016120160U00023004', '23', '1480589663', '3288.0000', '1', '1.00000000', 'create', '', '0', 'c8f5f8f0c8ed7c5d6fb15570fc7c2d69', 'a:2:{s:15:\"投保人姓名\";s:9:\"苏相锟\";s:18:\"投保人身份证\";s:19:\"3505251983XXXX05XXX\";}', 'dfasdfasd', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('29', 'P2016120181U00023005', '23', '1480590448', '3288.0000', '1', '1.00000000', 'create', '', '0', 'b3bc02bfee2f30355d1e5376678fbcd8', 'a:2:{s:15:\"投保人姓名\";s:5:\"fasdf\";s:18:\"投保人身份证\";s:8:\"fasdfasd\";}', '', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('30', 'P2016120721U00023001', '23', '1481082923', '3287.0000', '1', '1.00000000', 'create', '', '0', 'ee990818d86057886c54d0c8908f53d4', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('31', 'P2017010666G001', '0', '1483673968', '0.0000', '1', '1.00000000', 'create', '', '0', '5ee860cf07307ec257bee5eaf17f2255', '', '', 'admin@phpok.com', '');
INSERT INTO `pk_order` VALUES ('32', 'P2017010660G002', '0', '1483676999', '0.0000', '1', '1.00000000', 'create', '', '0', '3e29208f0376f5d75524db3ce1b0c45f', '', '', 'admin@phpok.com', '');
INSERT INTO `pk_order` VALUES ('33', 'P2017010631G003', '0', '1483677587', '4088.0000', '1', '1.00000000', 'create', '', '0', 'a6538051d54d573d62d04067992a8a02', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('34', 'P2017010610U00023004', '23', '1483677638', '3288.0000', '1', '1.00000000', 'unpaid', '等待付款', '0', '83eedf1df5a6276c55c9166e4d097d0a', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `pk_order` VALUES ('35', 'P2017012041U00029001', '29', '1484897086', '4088.0000', '1', '1.00000000', 'unpaid', '等待付款', '0', '6059f590f531624ca5d716dc69d0109b', '', '', 'admin@phpok.com', '15818533971');

-- ----------------------------
-- Table structure for pk_order_address
-- ----------------------------
DROP TABLE IF EXISTS `pk_order_address`;
CREATE TABLE `pk_order_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `country` varchar(255) NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(255) NOT NULL COMMENT '省信息',
  `city` varchar(255) NOT NULL COMMENT '市',
  `county` varchar(255) NOT NULL COMMENT '县',
  `address` varchar(255) NOT NULL COMMENT '地址信息（不含国家，省市县镇区信息）',
  `mobile` varchar(100) NOT NULL COMMENT '手机号码',
  `tel` varchar(100) NOT NULL COMMENT '电话号码',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `fullname` varchar(100) NOT NULL COMMENT '联系人姓名',
  `zipcode` varchar(50) NOT NULL COMMENT '邮编',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='订单地址库';

-- ----------------------------
-- Records of pk_order_address
-- ----------------------------
INSERT INTO `pk_order_address` VALUES ('18', '19', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `pk_order_address` VALUES ('19', '20', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `pk_order_address` VALUES ('12', '13', '中国', '广东省', '深圳市', '盐田区', '测试地址', '15818533971', '0755-1234657', 'admin@phpok.com', '测试账号', '518000');
INSERT INTO `pk_order_address` VALUES ('20', '21', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `pk_order_address` VALUES ('21', '22', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `pk_order_address` VALUES ('22', '23', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `pk_order_address` VALUES ('23', '24', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `pk_order_address` VALUES ('24', '31', '中国', '浙江省', '绍兴市', '嵊州市', 'asdf', '15818533971', '', 'admin@phpok.com', 'fadsfasdfaf', '');
INSERT INTO `pk_order_address` VALUES ('25', '32', '中国', '河北省', '秦皇岛市', '青龙满族自治县', 'fasdf', '15818533971', '', 'admin@phpok.com', 'fdasfas', '');

-- ----------------------------
-- Table structure for pk_order_express
-- ----------------------------
DROP TABLE IF EXISTS `pk_order_express`;
CREATE TABLE `pk_order_express` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID号',
  `express_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流ID号',
  `code` varchar(255) NOT NULL COMMENT '物流查询编码，可用于查询快递进度',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登记时间',
  `last_query_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次检索时间',
  `title` varchar(255) NOT NULL COMMENT '快递名称',
  `homepage` varchar(255) NOT NULL COMMENT '快递官网',
  `company` varchar(255) NOT NULL COMMENT '快递的公司全称',
  `is_end` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未结束1已结束',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单中涉及到的物流分配';

-- ----------------------------
-- Records of pk_order_express
-- ----------------------------
INSERT INTO `pk_order_express` VALUES ('4', '19', '4', '035652070464', '1476361318', '1476438520', '顺丰速运', 'http://www.sf-express.com/', '顺丰速运(集团)有限公司', '1');

-- ----------------------------
-- Table structure for pk_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `pk_order_invoice`;
CREATE TABLE `pk_order_invoice` (
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID号',
  `type` varchar(100) NOT NULL COMMENT '发票类型',
  `title` varchar(255) NOT NULL COMMENT '发票抬头',
  `content` text NOT NULL COMMENT '发票内容',
  `note` text NOT NULL COMMENT '发票的备注信息',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单发票';

-- ----------------------------
-- Records of pk_order_invoice
-- ----------------------------
INSERT INTO `pk_order_invoice` VALUES ('31', '', '', '', '');
INSERT INTO `pk_order_invoice` VALUES ('32', '', '', '', '');

-- ----------------------------
-- Table structure for pk_order_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_order_log`;
CREATE TABLE `pk_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_express_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '定单中的物流ID',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `who` varchar(255) NOT NULL COMMENT '操作人名称（可以是公司名称，也可以是用户名，可以是物流等）',
  `note` text NOT NULL COMMENT '操作内容',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='订单日志，用于了解当前的订单处理进度';

-- ----------------------------
-- Records of pk_order_log
-- ----------------------------
INSERT INTO `pk_order_log` VALUES ('114', '19', '4', '1476372011', '顺丰速运', '快件到达 【深圳集散中心】');
INSERT INTO `pk_order_log` VALUES ('32', '13', '0', '1473581424', 'admin', '订单创建成功，订单编号：P2016091173U00023003');
INSERT INTO `pk_order_log` VALUES ('33', '13', '0', '1473581424', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('113', '19', '4', '1476376873', '顺丰速运', '快件在【深圳集散中心】已装车，准备发往 【深圳黄田集散中心】');
INSERT INTO `pk_order_log` VALUES ('45', '13', '0', '1476352896', '管理员：admin', '订单（P2016091173U00023003）状态变更为：订单完成');
INSERT INTO `pk_order_log` VALUES ('46', '13', '0', '1476352904', '管理员：admin', '订单（P2016091173U00023003）状态变更为：订单完成');
INSERT INTO `pk_order_log` VALUES ('47', '13', '0', '1476352977', '管理员：admin', '订单（P2016091173U00023003）状态变更为：订单完成');
INSERT INTO `pk_order_log` VALUES ('110', '19', '4', '1476385028', '顺丰速运', '快件到达 【深圳五和集散中心】');
INSERT INTO `pk_order_log` VALUES ('63', '19', '0', '1476354952', '苏相锟(admin)', '管理员增加产品信息');
INSERT INTO `pk_order_log` VALUES ('64', '19', '0', '1476354952', '苏相锟(admin)', '管理员创建订单');
INSERT INTO `pk_order_log` VALUES ('65', '20', '0', '1476355746', '苏相锟(admin)', '管理员创建订单');
INSERT INTO `pk_order_log` VALUES ('66', '21', '0', '1476355996', '苏相锟(admin)', '管理员创建订单');
INSERT INTO `pk_order_log` VALUES ('67', '21', '0', '1476357578', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('68', '21', '0', '1476359734', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：付款完成');
INSERT INTO `pk_order_log` VALUES ('112', '19', '4', '1476378019', '顺丰速运', '快件到达 【深圳黄田集散中心】');
INSERT INTO `pk_order_log` VALUES ('70', '19', '0', '1476360719', '管理员：admin', '订单（KF20161013193521BSJ）状态变更为：');
INSERT INTO `pk_order_log` VALUES ('109', '19', '4', '1476387532', '顺丰速运', '快件在【深圳五和集散中心】已装车，准备发往 【深圳宝安深圳北站营业部】');
INSERT INTO `pk_order_log` VALUES ('108', '19', '4', '1476388813', '顺丰速运', '快件到达 【深圳宝安深圳北站营业部】');
INSERT INTO `pk_order_log` VALUES ('99', '19', '0', '1476361318', '管理员：admin', '订单（KF20161013193521BSJ）状态变更为：正在发货');
INSERT INTO `pk_order_log` VALUES ('91', '19', '0', '1476361183', '管理员：admin', '订单（KF20161013193521BSJ）状态变更为：');
INSERT INTO `pk_order_log` VALUES ('78', '19', '0', '1476360802', '管理员：admin', '订单（KF20161013193521BSJ）状态变更为：');
INSERT INTO `pk_order_log` VALUES ('119', '19', '4', '1476333811', '顺丰速运', '快件在【泉州丰泽普明工业区营业点】已装车，准备发往 【泉州清濛集散中心】');
INSERT INTO `pk_order_log` VALUES ('118', '19', '4', '1476335404', '顺丰速运', '快件到达 【泉州清濛集散中心】');
INSERT INTO `pk_order_log` VALUES ('117', '19', '4', '1476343465', '顺丰速运', '快件在【泉州清濛集散中心】已装车，准备发往 【晋江总集散中心】');
INSERT INTO `pk_order_log` VALUES ('116', '19', '4', '1476346107', '顺丰速运', '快件到达 【晋江总集散中心】');
INSERT INTO `pk_order_log` VALUES ('115', '19', '4', '1476347623', '顺丰速运', '快件在【晋江总集散中心】已装车，准备发往 【深圳集散中心】');
INSERT INTO `pk_order_log` VALUES ('106', '19', '4', '1476408099', '顺丰速运', '已签收,感谢使用顺丰,期待再次为您服务');
INSERT INTO `pk_order_log` VALUES ('111', '19', '4', '1476381561', '顺丰速运', '快件在【深圳黄田集散中心】已装车，准备发往 【深圳五和集散中心】');
INSERT INTO `pk_order_log` VALUES ('107', '19', '4', '1476398800', '顺丰速运', '正在派送途中(派件人:罗浪平,电话:18307559705)');
INSERT INTO `pk_order_log` VALUES ('98', '19', '4', '1476361318', '苏相锟(admin)', '您的订单已经拣货完毕，待出库交付顺丰速运，运单号为：035652070464');
INSERT INTO `pk_order_log` VALUES ('120', '19', '4', '1476331847', '顺丰速运', '顺丰速运 已收取快件');
INSERT INTO `pk_order_log` VALUES ('121', '21', '0', '1476519512', '苏相锟(admin)', '录入支付信息，支付方式：支付宝快捷支付，支付金额：100.00元');
INSERT INTO `pk_order_log` VALUES ('122', '21', '0', '1476519841', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：创建订单');
INSERT INTO `pk_order_log` VALUES ('123', '21', '0', '1476520676', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('124', '21', '0', '1476520676', '苏相锟(admin)', '录入支付信息，支付方式：银联支付，支付金额：200.00元');
INSERT INTO `pk_order_log` VALUES ('125', '21', '0', '1476520777', '苏相锟(admin)', '录入支付信息，支付方式：微信支付，支付金额：135.00元');
INSERT INTO `pk_order_log` VALUES ('126', '21', '0', '1476520828', '苏相锟(admin)', '录入支付信息，支付方式：支付宝快捷支付，支付金额：465.00元');
INSERT INTO `pk_order_log` VALUES ('127', '21', '0', '1476521010', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：付款完成');
INSERT INTO `pk_order_log` VALUES ('128', '21', '0', '1476521010', '苏相锟(admin)', '录入支付信息，支付方式：银行汇款，支付金额：99.00元');
INSERT INTO `pk_order_log` VALUES ('129', '21', '0', '1476521773', '苏相锟(admin)', '录入支付信息，支付方式：银行汇款，支付金额：564.00元');
INSERT INTO `pk_order_log` VALUES ('130', '20', '0', '1476521841', '管理员：admin', '订单（KF20161013194849ELH）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('131', '20', '0', '1476521841', '苏相锟(admin)', '录入支付信息，支付方式：测试，支付金额：100.00元');
INSERT INTO `pk_order_log` VALUES ('132', '13', '0', '1477989527', 'admin', '订单P2016091173U00023003支付42.84元，支付方法：积分');
INSERT INTO `pk_order_log` VALUES ('133', '13', '0', '1477989527', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('134', '0', '0', '1477989651', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('135', '0', '0', '1477989709', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('136', '0', '0', '1477989759', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('137', '13', '0', '1477989784', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('138', '13', '0', '1480247220', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('139', '13', '0', '1480247285', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('140', '13', '0', '1480247418', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('141', '13', '0', '1480247421', 'admin', '支付完成');
INSERT INTO `pk_order_log` VALUES ('142', '22', '0', '1480394929', 'admin', '订单创建成功，订单编号：P2016112948U00023001');
INSERT INTO `pk_order_log` VALUES ('143', '0', '0', '1480395033', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('144', '22', '0', '1480395165', 'admin', '订单（P2016112948U00023001）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('145', '22', '0', '1480395168', 'admin', '支付完成');
INSERT INTO `pk_order_log` VALUES ('146', '22', '0', '1480395292', '管理员：admin', '订单（P2016112948U00023001）状态变更为：订单完成');
INSERT INTO `pk_order_log` VALUES ('147', '13', '0', '1480395300', '管理员：admin', '订单（P2016091173U00023003）状态变更为：订单完成');
INSERT INTO `pk_order_log` VALUES ('148', '23', '0', '1480395663', 'admin', '订单创建成功，订单编号：P2016112919U00023002');
INSERT INTO `pk_order_log` VALUES ('149', '23', '0', '1480395663', 'admin', '订单P2016112919U00023002使用积分抵扣0.00元，共消耗积分100');
INSERT INTO `pk_order_log` VALUES ('150', '23', '0', '1480395980', 'admin', '订单P2016112919U00023002使用积分抵扣0.00元，共消耗积分100');
INSERT INTO `pk_order_log` VALUES ('151', '23', '0', '1480396030', 'admin', '订单P2016112919U00023002使用积分抵扣0.00元，共消耗积分100');
INSERT INTO `pk_order_log` VALUES ('152', '23', '0', '1480396339', 'admin', '订单P2016112919U00023002使用红包抵扣0.00元，共消耗红包100个');
INSERT INTO `pk_order_log` VALUES ('153', '23', '0', '1480396550', 'admin', '订单P2016112919U00023002使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `pk_order_log` VALUES ('154', '23', '0', '1480396676', 'admin', '订单P2016112919U00023002使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `pk_order_log` VALUES ('155', '23', '0', '1480396741', 'admin', '订单P2016112919U00023002使用红包抵扣1.00元，共消耗红包100个');
INSERT INTO `pk_order_log` VALUES ('156', '23', '0', '1480396832', 'admin', '订单P2016112919U00023002使用红包抵扣1.00元，共消耗红包100个');
INSERT INTO `pk_order_log` VALUES ('157', '23', '0', '1480396889', 'admin', '订单P2016112919U00023002使用红包抵扣1.00元，共消耗红包100个');
INSERT INTO `pk_order_log` VALUES ('158', '23', '0', '1480396966', 'admin', '订单P2016112919U00023002使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `pk_order_log` VALUES ('159', '23', '0', '1480397059', 'admin', '订单P2016112919U00023002使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `pk_order_log` VALUES ('160', '0', '0', '1480397159', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('161', '0', '0', '1480397769', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('162', '23', '0', '1480397786', 'admin', '使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `pk_order_log` VALUES ('163', '23', '0', '1480397786', 'admin', '订单（P2016112919U00023002）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('164', '23', '0', '1480397788', 'admin', '支付完成');
INSERT INTO `pk_order_log` VALUES ('165', '23', '0', '1480397929', '管理员：admin', '订单（P2016112919U00023002）状态变更为：订单完成');
INSERT INTO `pk_order_log` VALUES ('166', '24', '0', '1480397971', 'admin', '订单创建成功，订单编号：P2016112970U00023003');
INSERT INTO `pk_order_log` VALUES ('167', '24', '0', '1480397971', 'admin', '使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `pk_order_log` VALUES ('168', '0', '0', '1480398000', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('169', '0', '0', '1480398026', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('170', '24', '0', '1480398062', 'admin', '使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `pk_order_log` VALUES ('171', '24', '0', '1480398062', 'admin', '订单（P2016112970U00023003）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('172', '24', '0', '1480398064', 'admin', '支付完成');
INSERT INTO `pk_order_log` VALUES ('173', '0', '0', '1480502104', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('174', '0', '0', '1480502222', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('175', '0', '0', '1480502304', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('176', '0', '0', '1480502326', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('177', '0', '0', '1480502347', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('178', '0', '0', '1480502387', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('179', '0', '0', '1480502430', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('180', '0', '0', '1480502444', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('181', '0', '0', '1480502486', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('182', '0', '0', '1480502669', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('183', '0', '0', '1480502791', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('184', '0', '0', '1480502802', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('185', '0', '0', '1480502863', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `pk_order_log` VALUES ('186', '25', '0', '1480589339', 'admin', '订单创建成功，订单编号：P2016120132U00023001');
INSERT INTO `pk_order_log` VALUES ('187', '26', '0', '1480589452', 'admin', '订单创建成功，订单编号：P2016120136U00023002');
INSERT INTO `pk_order_log` VALUES ('188', '27', '0', '1480589524', 'admin', '订单创建成功，订单编号：P2016120159U00023003');
INSERT INTO `pk_order_log` VALUES ('189', '28', '0', '1480589663', 'admin', '订单创建成功，订单编号：P2016120160U00023004');
INSERT INTO `pk_order_log` VALUES ('190', '29', '0', '1480590448', 'admin', '订单创建成功，订单编号：P2016120181U00023005');
INSERT INTO `pk_order_log` VALUES ('191', '30', '0', '1481082923', 'admin', '订单创建成功，订单编号：P2016120721U00023001');
INSERT INTO `pk_order_log` VALUES ('192', '30', '0', '1481082923', 'admin', '使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `pk_order_log` VALUES ('193', '31', '0', '1483673968', '', '订单创建成功，订单编号：P2017010666G001');
INSERT INTO `pk_order_log` VALUES ('194', '32', '0', '1483676999', '', '订单创建成功，订单编号：P2017010660G002');
INSERT INTO `pk_order_log` VALUES ('195', '33', '0', '1483677587', '', '订单创建成功，订单编号：P2017010631G003');
INSERT INTO `pk_order_log` VALUES ('196', '34', '0', '1483677638', 'admin', '订单创建成功，订单编号：P2017010610U00023004');
INSERT INTO `pk_order_log` VALUES ('197', '34', '0', '1483677760', 'admin', '订单（P2017010610U00023004）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('198', '34', '0', '1483677767', 'admin', '订单（P2017010610U00023004）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('199', '35', '0', '1484897086', 'WX148480971245', '订单创建成功，订单编号：P2017012041U00029001');
INSERT INTO `pk_order_log` VALUES ('200', '35', '0', '1484900171', '游客', '订单（P2017012041U00029001）状态变更为：等待付款');
INSERT INTO `pk_order_log` VALUES ('201', '35', '0', '1484900186', '游客', '订单（P2017012041U00029001）状态变更为：等待付款');

-- ----------------------------
-- Table structure for pk_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `pk_order_payment`;
CREATE TABLE `pk_order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `payment_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '支付方式ID，数字表示网上业务支付，字母为财富支付',
  `title` varchar(255) NOT NULL COMMENT '支付方式名称',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '支付金额',
  `startdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始支付操作',
  `dateline` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `ext` text NOT NULL COMMENT '其他常用扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='订单支付';

-- ----------------------------
-- Records of pk_order_payment
-- ----------------------------
INSERT INTO `pk_order_payment` VALUES ('17', '13', '13', '银行汇款', '3708.0000', '1473581424', '0', '');
INSERT INTO `pk_order_payment` VALUES ('19', '21', '1', '支付宝快捷支付', '100.0000', '1476519512', '1476519512', 'a:1:{s:6:\"备注\";s:18:\"本地测试录入\";}');
INSERT INTO `pk_order_payment` VALUES ('20', '21', '3', '银联支付', '200.0000', '1476520676', '1476520676', 'a:1:{s:6:\"备注\";s:15:\"也是测试的\";}');
INSERT INTO `pk_order_payment` VALUES ('21', '21', '4', '微信支付', '135.0000', '1476520777', '1476520777', 'a:1:{s:6:\"备注\";s:12:\"测试刷新\";}');
INSERT INTO `pk_order_payment` VALUES ('24', '21', '13', '银行汇款', '564.0000', '1476521773', '1476521773', '');
INSERT INTO `pk_order_payment` VALUES ('25', '20', '', '测试', '100.0000', '1476521841', '1476521841', '');
INSERT INTO `pk_order_payment` VALUES ('27', '13', '14', 'Paypal支付', '8.0000', '1477989784', '0', '');
INSERT INTO `pk_order_payment` VALUES ('28', '13', '2', '', '8.0000', '1480247285', '0', '');
INSERT INTO `pk_order_payment` VALUES ('29', '13', 'wallet', '钱包', '8.0000', '1480247418', '1480247421', 'a:1:{s:8:\"integral\";d:8;}');
INSERT INTO `pk_order_payment` VALUES ('30', '22', 'wallet', '钱包', '48.0000', '1480395165', '1480395168', 'a:1:{s:6:\"钱包\";d:48;}');
INSERT INTO `pk_order_payment` VALUES ('31', '23', 'wallet', '钱包', '4.0000', '1480397786', '1480397788', 'a:1:{s:6:\"钱包\";d:4;}');
INSERT INTO `pk_order_payment` VALUES ('32', '24', 'wallet', '钱包', '2.0000', '1480398062', '1480398064', 'a:1:{s:6:\"钱包\";d:2;}');
INSERT INTO `pk_order_payment` VALUES ('33', '34', '16', '支付宝', '3288.0000', '1483677767', '0', '');
INSERT INTO `pk_order_payment` VALUES ('34', '35', '17', '微信支付', '4088.0000', '1484900186', '0', '');

-- ----------------------------
-- Table structure for pk_order_price
-- ----------------------------
DROP TABLE IF EXISTS `pk_order_price`;
CREATE TABLE `pk_order_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID号',
  `code` varchar(255) NOT NULL COMMENT '编码',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '金额，-号表示优惠',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COMMENT='订单金额明细清单';

-- ----------------------------
-- Records of pk_order_price
-- ----------------------------
INSERT INTO `pk_order_price` VALUES ('19', '1', 'discount', '169.0000');
INSERT INTO `pk_order_price` VALUES ('18', '1', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('17', '1', 'product', '170.0000');
INSERT INTO `pk_order_price` VALUES ('4', '2', 'product', '177.0000');
INSERT INTO `pk_order_price` VALUES ('5', '2', 'shipping', '26.0000');
INSERT INTO `pk_order_price` VALUES ('6', '2', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('7', '2', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('20', '3', 'product', '177.0000');
INSERT INTO `pk_order_price` VALUES ('21', '3', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('22', '3', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('23', '3', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('24', '4', 'product', '100.0000');
INSERT INTO `pk_order_price` VALUES ('25', '4', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('26', '4', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('27', '4', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('43', '5', 'discount', '1000.0000');
INSERT INTO `pk_order_price` VALUES ('42', '5', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('41', '5', 'product', '1499.0000');
INSERT INTO `pk_order_price` VALUES ('44', '6', 'product', '12374.0000');
INSERT INTO `pk_order_price` VALUES ('45', '6', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('46', '6', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('47', '6', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('48', '7', 'product', '532.9100');
INSERT INTO `pk_order_price` VALUES ('49', '7', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('50', '7', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('51', '7', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('52', '8', 'product', '413.1300');
INSERT INTO `pk_order_price` VALUES ('53', '8', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('54', '8', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('55', '8', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('65', '9', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('64', '9', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('63', '9', 'product', '1099.0000');
INSERT INTO `pk_order_price` VALUES ('84', '10', 'discount', '-100.0000');
INSERT INTO `pk_order_price` VALUES ('83', '10', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('82', '10', 'product', '5184.0000');
INSERT INTO `pk_order_price` VALUES ('85', '11', 'product', '4998.0000');
INSERT INTO `pk_order_price` VALUES ('86', '11', 'shipping', '10.0000');
INSERT INTO `pk_order_price` VALUES ('87', '11', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('133', '13', 'discount', '-3700.0000');
INSERT INTO `pk_order_price` VALUES ('132', '13', 'shipping', '10.0000');
INSERT INTO `pk_order_price` VALUES ('131', '13', 'product', '3698.0000');
INSERT INTO `pk_order_price` VALUES ('92', '14', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('93', '14', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('94', '14', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('95', '15', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('96', '15', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('97', '15', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('98', '16', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('99', '16', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('100', '16', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('101', '17', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('102', '17', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('103', '17', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('104', '18', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('105', '18', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('106', '18', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('107', '19', 'product', '2000.0000');
INSERT INTO `pk_order_price` VALUES ('108', '19', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('109', '19', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('110', '20', 'product', '999.0000');
INSERT INTO `pk_order_price` VALUES ('111', '20', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('112', '20', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('124', '21', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('123', '21', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('122', '21', 'product', '999.0000');
INSERT INTO `pk_order_price` VALUES ('138', '22', 'shipping', '15.0000');
INSERT INTO `pk_order_price` VALUES ('137', '22', 'product', '4088.0000');
INSERT INTO `pk_order_price` VALUES ('139', '22', 'discount', '-4055.0000');
INSERT INTO `pk_order_price` VALUES ('148', '23', 'discount', '-3285.0000');
INSERT INTO `pk_order_price` VALUES ('147', '23', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('146', '23', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('196', '24', 'discount', '-3286.0000');
INSERT INTO `pk_order_price` VALUES ('195', '24', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('194', '24', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('197', '25', 'product', '4088.0000');
INSERT INTO `pk_order_price` VALUES ('198', '25', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('199', '25', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('200', '26', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('201', '26', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('202', '26', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('203', '27', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('204', '27', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('205', '27', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('206', '28', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('207', '28', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('208', '28', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('209', '29', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('210', '29', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('211', '29', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('212', '30', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('213', '30', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('214', '30', 'discount', '-1.0000');
INSERT INTO `pk_order_price` VALUES ('215', '31', 'product', '0.0000');
INSERT INTO `pk_order_price` VALUES ('216', '31', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('217', '31', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('218', '31', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('219', '32', 'product', '0.0000');
INSERT INTO `pk_order_price` VALUES ('220', '32', 'shipping', '0.0000');
INSERT INTO `pk_order_price` VALUES ('221', '32', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('222', '32', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('223', '33', 'product', '4088.0000');
INSERT INTO `pk_order_price` VALUES ('224', '33', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('225', '33', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('226', '34', 'product', '3288.0000');
INSERT INTO `pk_order_price` VALUES ('227', '34', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('228', '34', 'discount', '0.0000');
INSERT INTO `pk_order_price` VALUES ('229', '35', 'product', '4088.0000');
INSERT INTO `pk_order_price` VALUES ('230', '35', 'fee', '0.0000');
INSERT INTO `pk_order_price` VALUES ('231', '35', 'discount', '0.0000');

-- ----------------------------
-- Table structure for pk_order_product
-- ----------------------------
DROP TABLE IF EXISTS `pk_order_product`;
CREATE TABLE `pk_order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID号',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `title` varchar(255) NOT NULL COMMENT '产品名称',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '产品单价',
  `qty` int(11) NOT NULL DEFAULT '0' COMMENT '产品数量',
  `thumb` varchar(255) NOT NULL COMMENT '产品图片地址',
  `ext` text NOT NULL COMMENT '产品扩展属性',
  `weight` varchar(50) NOT NULL COMMENT '重量',
  `volume` varchar(50) NOT NULL COMMENT '体积',
  `unit` varchar(50) NOT NULL COMMENT '单位',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `is_virtual` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0实物1虚拟或服务',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='订单的产品信息';

-- ----------------------------
-- Records of pk_order_product
-- ----------------------------
INSERT INTO `pk_order_product` VALUES ('22', '19', '1753', '小米(MI) 小米5 全网通4G手机 双卡双待', '2000.0000', '1', 'res/201603/22/6e32b648bf93b490.jpg', '', '', '', '', '', '0');
INSERT INTO `pk_order_product` VALUES ('23', '20', '1761', '华为 P7 移动4G手机', '999.0000', '1', 'res/201603/23/c941c40778124f2c.jpg', '', '', '', '台', '', '1');
INSERT INTO `pk_order_product` VALUES ('24', '21', '1761', '华为 P7 移动4G手机', '999.0000', '1', 'res/201603/23/c941c40778124f2c.jpg', '', '', '', '台', '', '1');
INSERT INTO `pk_order_product` VALUES ('16', '13', '1762', 'vivo Xplay5 全网通4G手机 4GB+128GB 双卡双待', '3698.0000', '1', 'res/201603/23/fceefc0374ff1ef2.jpg', 'a:1:{i:0;a:2:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";}}', '', '', '', '', '0');
INSERT INTO `pk_order_product` VALUES ('25', '22', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '4088.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:2:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";}i:1;a:2:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"64G ROM\";}}', '', '', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('26', '23', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:2:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";}i:1;a:2:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";}}', '', '', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('27', '24', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:2:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"黑色\";}i:1;a:2:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";}}', '', '', '台', '', '1');
INSERT INTO `pk_order_product` VALUES ('28', '25', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '4088.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"黑色\";s:3:\"val\";s:5:\"black\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"64G ROM\";s:3:\"val\";s:3:\"64G\";}}', '', '', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('29', '26', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '', '', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('30', '27', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '', '', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('31', '28', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '', '', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('32', '29', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '', '', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('33', '30', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '0', '0', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('34', '31', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', '', '0', '0', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('35', '31', '1761', '华为 P7 移动4G手机', '1099.0000', '1', 'res/201603/23/c941c40778124f2c.jpg', '', '0', '0', '台', '', '0');
INSERT INTO `pk_order_product` VALUES ('36', '31', '1753', '小米(MI) 小米5 全网通4G手机 双卡双待', '2499.0000', '1', 'res/201603/22/6e32b648bf93b490.jpg', '', '0', '0', '', '', '0');
INSERT INTO `pk_order_product` VALUES ('37', '32', '1760', '魅族 MX5 移动联通双4G手机 双卡双待', '2499.0000', '1', 'res/201603/22/c329c62e183765ad.jpg', '', '0', '0', '', '', '0');
INSERT INTO `pk_order_product` VALUES ('38', '33', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '4088.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";s:3:\"val\";s:4:\"gold\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"64G ROM\";s:3:\"val\";s:3:\"64G\";}}', '0', '0', '台', '', '1');
INSERT INTO `pk_order_product` VALUES ('39', '34', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";s:3:\"val\";s:4:\"gold\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '0', '0', '台', '', '1');
INSERT INTO `pk_order_product` VALUES ('40', '35', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '4088.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"64G ROM\";s:3:\"val\";s:3:\"64G\";}}', '0', '0', '台', '', '1');

-- ----------------------------
-- Table structure for pk_payment
-- ----------------------------
DROP TABLE IF EXISTS `pk_payment`;
CREATE TABLE `pk_payment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付款组',
  `code` varchar(100) NOT NULL COMMENT '标识ID',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `currency` varchar(30) NOT NULL COMMENT '可使用的货币ID',
  `logo1` varchar(255) NOT NULL COMMENT 'LOGO小图',
  `logo2` varchar(255) NOT NULL COMMENT 'LOGO中图',
  `logo3` varchar(255) NOT NULL COMMENT 'LOGO大图',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态0未使用1正在使用中',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `note` text NOT NULL COMMENT '付款注意事项说明',
  `param` text NOT NULL COMMENT '参数',
  `wap` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0PC端1手机端',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='支付方案';

-- ----------------------------
-- Records of pk_payment
-- ----------------------------
INSERT INTO `pk_payment` VALUES ('15', '1', 'alipay', '支付宝', 'CNY', '', '', '', '1', '10', '', 'a:4:{s:3:\"pid\";s:0:\"\";s:3:\"key\";s:0:\"\";s:5:\"email\";s:15:\"admin@phpok.com\";s:5:\"ptype\";s:25:\"create_direct_pay_by_user\";}', '0');

-- ----------------------------
-- Table structure for pk_payment_group
-- ----------------------------
DROP TABLE IF EXISTS `pk_payment_group`;
CREATE TABLE `pk_payment_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID，为0表示全部',
  `title` varchar(255) NOT NULL COMMENT '付款组名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不启用1启用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1默认组0普通组',
  `is_wap` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0是PC端，1是手机端',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='付款组管理';

-- ----------------------------
-- Records of pk_payment_group
-- ----------------------------
INSERT INTO `pk_payment_group` VALUES ('1', '1', '快捷支付', '1', '10', '0', '0');

-- ----------------------------
-- Table structure for pk_payment_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_payment_log`;
CREATE TABLE `pk_payment_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sn` varchar(255) NOT NULL COMMENT '支付编号',
  `type` varchar(100) NOT NULL COMMENT 'order订单,recharge充值other其他',
  `payment_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '支付方式，为数字时表示payment表中的主要支付方式，为字母数字混合表示财富付款',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录时间',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '货币ID',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付成功1已支付成功',
  `ext` text NOT NULL COMMENT '扩展',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='支付日志';

-- ----------------------------
-- Records of pk_payment_log
-- ----------------------------
INSERT INTO `pk_payment_log` VALUES ('1', 'P20150928001', 'order', '1', '订单：P20150928001', '1443431348', '23', '1.00', '1', '订单：P20150928001', '1', '');
INSERT INTO `pk_payment_log` VALUES ('2', 'P20150928002', 'order', '1', '订单：P20150928002', '1443432620', '23', '1.00', '1', '订单：P20150928002', '1', '');
INSERT INTO `pk_payment_log` VALUES ('3', 'P20151104001', 'order', '4', '订单：P20151104001', '1409721340', '23', '203.00', '1', '订单：P20151104001', '1', 'a:7:{s:6:\"openid\";s:28:\"oUpF8uMEb4qRXf22hE3X68TekukE\";s:10:\"trade_type\";s:5:\"JSAPI\";s:9:\"bank_type\";s:3:\"CFT\";s:9:\"total_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:14:\"transaction_id\";s:28:\"1004400740201409030005092168\";s:8:\"time_end\";s:14:\"20140903131540\";}');
INSERT INTO `pk_payment_log` VALUES ('4', 'KF20151030115123CWR', 'order', '4', '订单：', '1447821976', '23', '170.00', '1', '订单：', '0', '');
INSERT INTO `pk_payment_log` VALUES ('5', 'P2015121051U00023001', '', '4', '订单：', '1449736191', '23', '177.00', '1', '订单：', '0', '');
INSERT INTO `pk_payment_log` VALUES ('6', 'P2016022545U00023001', 'order', '12', '订单：', '1459287342', '23', '100.00', '1', '订单：', '0', '');
INSERT INTO `pk_payment_log` VALUES ('7', 'P2016033177U00023001', 'order', '13', '订单：P2016033177U00023001', '1473660928', '23', '12372.95', '1', '订单：P2016033177U00023001', '0', '');
INSERT INTO `pk_payment_log` VALUES ('8', 'P2016080435U00023001', 'order', '4', '订单：P2016080435U00023001', '1471335239', '23', '1088.00', '1', '订单：P2016080435U00023001', '0', '');
INSERT INTO `pk_payment_log` VALUES ('9', 'P2016091116U00023002', 'order', '1', '订单：P2016091116U00023002', '1473581132', '23', '3298.00', '1', '订单：P2016091116U00023002', '0', '');
INSERT INTO `pk_payment_log` VALUES ('12', 'P2016091173U00023003', 'order', 'wallet', '订单：P2016091173U00023003', '1480247418', '23', '8.00', '1', '订单：P2016091173U00023003', '1', 'a:1:{s:8:\"integral\";d:8;}');
INSERT INTO `pk_payment_log` VALUES ('13', 'P2016112948U00023001', 'order', 'wallet', '订单：P2016112948U00023001', '1480395165', '23', '48.00', '1', '订单：P2016112948U00023001', '1', 'a:1:{s:6:\"钱包\";d:48;}');
INSERT INTO `pk_payment_log` VALUES ('14', 'P2016112919U00023002', 'order', 'wallet', '订单：P2016112919U00023002', '1480397786', '23', '4.00', '1', '订单：P2016112919U00023002', '1', 'a:1:{s:6:\"钱包\";d:4;}');
INSERT INTO `pk_payment_log` VALUES ('15', 'P2016112970U00023003', 'order', 'wallet', '订单：P2016112970U00023003', '1480398062', '23', '2.00', '1', '订单：P2016112970U00023003', '1', 'a:1:{s:6:\"钱包\";d:2;}');
INSERT INTO `pk_payment_log` VALUES ('16', 'CZ583d1b9f4bb6e', 'recharge', '1', '在线充值', '1480399775', '23', '1.00', '1', '充值编号：CZ583d1b9f4bb6e', '0', 'a:1:{s:4:\"goal\";s:1:\"2\";}');
INSERT INTO `pk_payment_log` VALUES ('17', 'P2017010610U00023004', 'order', '16', '订单：P2017010610U00023004', '1483677767', '23', '3288.00', '1', '订单：P2017010610U00023004', '0', '');
INSERT INTO `pk_payment_log` VALUES ('18', 'P2017012041U00029001', 'order', '17', '订单：P2017012041U00029001', '1484900186', '29', '4088.00', '1', '订单：P2017012041U00029001', '0', '');

-- ----------------------------
-- Table structure for pk_phpok
-- ----------------------------
DROP TABLE IF EXISTS `pk_phpok`;
CREATE TABLE `pk_phpok` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `type_id` varchar(255) NOT NULL COMMENT '调用类型',
  `identifier` varchar(100) NOT NULL COMMENT '标识串，同一个站点中只能唯一',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `cateid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `ext` text NOT NULL COMMENT '扩展属性',
  `is_api` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不支持API调用，1支持',
  `sqlinfo` text NOT NULL COMMENT 'SQL语句',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`,`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=288 DEFAULT CHARSET=utf8 COMMENT='数据调用中心';

-- ----------------------------
-- Records of pk_phpok
-- ----------------------------
INSERT INTO `pk_phpok` VALUES ('18', '网站首页图片播放', '41', 'arclist', 'picplayer', '1', '1', '0', 'a:23:{s:5:\"psize\";s:1:\"5\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";s:1:\"1\";s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('19', '头部导航内容', '42', 'arclist', 'menu', '1', '1', '0', 'a:23:{s:5:\"psize\";s:2:\"80\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";s:1:\"1\";s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";s:1:\"1\";s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('20', '公司简介', '87', 'arc', 'aboutus', '1', '1', '0', 'a:13:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";i:0;s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:7:\"aboutus\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('21', '产品分类', '45', 'catelist', 'products_cate', '1', '1', '70', 'a:20:{s:5:\"psize\";b:0;s:6:\"offset\";b:0;s:7:\"is_list\";b:0;s:7:\"in_text\";b:0;s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";b:0;s:12:\"catelist_ext\";b:0;s:11:\"project_ext\";b:0;s:11:\"sublist_ext\";b:0;s:10:\"parent_ext\";b:0;s:13:\"fields_format\";b:0;s:8:\"user_ext\";b:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";b:0;s:6:\"in_sub\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('22', '最新产品', '45', 'arclist', 'new_products', '1', '1', '70', 'a:15:{s:5:\"psize\";s:1:\"8\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:6:\"fields\";s:21:\"thumb,m_title,content\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:8:\"user_ext\";i:0;s:9:\"usergroup\";i:0;s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('55', '友情链接', '142', 'arclist', 'link', '1', '1', '0', 'a:23:{s:5:\"psize\";s:2:\"30\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";s:1:\"1\";s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";s:1:\"2\";s:7:\"in_cate\";b:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('91', '新闻中心', '43', 'arclist', 'news', '1', '1', '7', 'a:23:{s:5:\"psize\";s:1:\"8\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";s:1:\"2\";s:7:\"in_cate\";b:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('92', '图集相册', '144', 'arclist', 'photo', '1', '1', '0', 'a:23:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";s:1:\"1\";s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('93', '图片滚动新闻', '43', 'arclist', 'picnews', '1', '1', '7', 'a:23:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('94', '页脚导航', '147', 'arclist', 'footnav', '1', '1', '0', 'a:23:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";s:1:\"1\";s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('95', '客服', '148', 'arclist', 'kefu', '1', '1', '0', 'a:13:{s:5:\"psize\";s:2:\"50\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('96', '售后保障', '150', 'project', 'after-sale-protection', '1', '1', '0', 'a:23:{s:5:\"psize\";b:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";s:1:\"1\";s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('97', '图集相册', '144', 'arclist', 'tujixiangce', '1', '1', '154', 'a:13:{s:5:\"psize\";s:1:\"6\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('98', '产品展示', '45', 'catelist', 'catelist', '1', '1', '70', 'a:23:{s:5:\"psize\";b:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `pk_phpok` VALUES ('99', '下载中心', '151', 'arclist', 'xiazaizhongxin', '1', '1', '197', 'a:13:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.dfile\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('282', '热门产品', '45', 'arclist', 'hot_products', '1', '1', '70', 'a:15:{s:5:\"psize\";s:1:\"5\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:11:\"l.hits DESC\";s:6:\"fields\";s:5:\"thumb\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:8:\"user_ext\";i:0;s:9:\"usergroup\";i:0;s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('104', '资讯中心', '43', 'arclist', 'zixunzhongxin', '1', '1', '7', 'a:15:{s:5:\"psize\";s:1:\"1\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:6:\"fields\";s:18:\"content,thumb,note\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:8:\"user_ext\";i:0;s:9:\"usergroup\";i:0;s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('105', '资讯中心分类', '43', 'catelist', 'news_catelist', '1', '1', '7', 'a:15:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:6:\"fields\";s:1:\"*\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:8:\"user_ext\";i:0;s:9:\"usergroup\";i:0;s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('280', '联系我们', '87', 'arc', 'contactus', '1', '1', '0', 'a:13:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:9:\"contactus\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('286', '银行汇款', '386', 'project', 'drmpjihitd', '1', '1', '0', 'a:15:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:6:\"fields\";s:1:\"*\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:8:\"user_ext\";i:0;s:9:\"usergroup\";i:0;s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `pk_phpok` VALUES ('287', '标签列表', '0', 'sql', 'biaoqianliebiao', '1', '1', '0', 'a:15:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:6:\"fields\";s:1:\"*\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:8:\"user_ext\";i:0;s:9:\"usergroup\";i:0;s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', 'select * from pk_tag order by hits desc,id asc  limit 20');

-- ----------------------------
-- Table structure for pk_plugins
-- ----------------------------
DROP TABLE IF EXISTS `pk_plugins`;
CREATE TABLE `pk_plugins` (
  `id` varchar(100) NOT NULL COMMENT '插件ID，仅限字母，数字及下划线',
  `title` varchar(255) NOT NULL COMMENT '插件名称',
  `author` varchar(255) NOT NULL COMMENT '开发者',
  `version` varchar(50) NOT NULL COMMENT '插件版本号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0禁用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '值越小越往前靠',
  `note` varchar(255) NOT NULL COMMENT '摘要说明',
  `param` text NOT NULL COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件管理器';

-- ----------------------------
-- Records of pk_plugins
-- ----------------------------
INSERT INTO `pk_plugins` VALUES ('identifier', '标识串自动生成工具', 'phpok.com', '1.0', '1', '10', '可实现以 title 的表单数据', 'a:5:{s:9:\"is_youdao\";s:1:\"1\";s:7:\"keyfrom\";s:0:\"\";s:5:\"keyid\";s:0:\"\";s:10:\"is_pingyin\";s:1:\"1\";s:5:\"is_py\";s:1:\"1\";}');
INSERT INTO `pk_plugins` VALUES ('collection', '采集器', 'phpok.com', '1.0', '0', '20', '实现网站基本信息采集，适用于网站迁移', 'a:5:{s:7:\"root_id\";s:1:\"5\";s:10:\"sysmenu_id\";i:88;s:7:\"rescate\";s:1:\"1\";s:7:\"keyfrom\";s:0:\"\";s:5:\"keyid\";s:0:\"\";}');

-- ----------------------------
-- Table structure for pk_popedom
-- ----------------------------
DROP TABLE IF EXISTS `pk_popedom`;
CREATE TABLE `pk_popedom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID，即自增ID',
  `gid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属组ID，对应sysmenu表中的ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID，仅在list中有效',
  `title` varchar(255) NOT NULL COMMENT '名称，如：添加，修改等',
  `identifier` varchar(255) NOT NULL COMMENT '字符串，如add，modify等',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=1364 DEFAULT CHARSET=utf8 COMMENT='权限明细';

-- ----------------------------
-- Records of pk_popedom
-- ----------------------------
INSERT INTO `pk_popedom` VALUES ('2', '19', '0', '配置全局', 'gset', '10');
INSERT INTO `pk_popedom` VALUES ('3', '19', '0', '内容', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('4', '29', '0', '添加', 'add', '10');
INSERT INTO `pk_popedom` VALUES ('5', '29', '0', '修改', 'modify', '20');
INSERT INTO `pk_popedom` VALUES ('6', '29', '0', '删除', 'delete', '30');
INSERT INTO `pk_popedom` VALUES ('7', '18', '0', '添加', 'add', '10');
INSERT INTO `pk_popedom` VALUES ('8', '18', '0', '编辑', 'modify', '20');
INSERT INTO `pk_popedom` VALUES ('9', '18', '0', '删除', 'delete', '30');
INSERT INTO `pk_popedom` VALUES ('10', '23', '0', '添加', 'add', '10');
INSERT INTO `pk_popedom` VALUES ('11', '23', '0', '编辑', 'modify', '20');
INSERT INTO `pk_popedom` VALUES ('12', '23', '0', '删除', 'delete', '30');
INSERT INTO `pk_popedom` VALUES ('14', '22', '0', 'GD配置', 'gd', '10');
INSERT INTO `pk_popedom` VALUES ('15', '22', '0', '附件分类维护', 'cate', '20');
INSERT INTO `pk_popedom` VALUES ('16', '22', '0', '批处理', 'pl', '30');
INSERT INTO `pk_popedom` VALUES ('17', '16', '0', '配置', 'config', '10');
INSERT INTO `pk_popedom` VALUES ('18', '16', '0', '安装', 'install', '20');
INSERT INTO `pk_popedom` VALUES ('19', '16', '0', '卸载', 'uninstall', '30');
INSERT INTO `pk_popedom` VALUES ('20', '16', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('21', '17', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('22', '13', '0', '添加', 'add', '10');
INSERT INTO `pk_popedom` VALUES ('23', '13', '0', '修改', 'modify', '20');
INSERT INTO `pk_popedom` VALUES ('24', '13', '0', '删除', 'delete', '30');
INSERT INTO `pk_popedom` VALUES ('25', '13', '0', '查看', 'list', '5');
INSERT INTO `pk_popedom` VALUES ('26', '19', '0', '查看', 'list', '5');
INSERT INTO `pk_popedom` VALUES ('33', '21', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('34', '21', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('35', '21', '0', '编辑', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('36', '21', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('37', '18', '0', '查看', 'list', '5');
INSERT INTO `pk_popedom` VALUES ('38', '23', '0', '查看', 'list', '5');
INSERT INTO `pk_popedom` VALUES ('83', '16', '0', '启用/禁用', 'status', '50');
INSERT INTO `pk_popedom` VALUES ('40', '16', '0', '查看', 'list', '5');
INSERT INTO `pk_popedom` VALUES ('41', '17', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('42', '18', '0', '扩展', 'ext', '40');
INSERT INTO `pk_popedom` VALUES ('43', '19', '0', '扩展', 'ext', '30');
INSERT INTO `pk_popedom` VALUES ('44', '14', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('45', '14', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('46', '14', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('47', '14', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('48', '25', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('49', '25', '0', '配置', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('80', '14', '0', '启用/禁用', 'status', '50');
INSERT INTO `pk_popedom` VALUES ('52', '29', '0', '查看', 'list', '5');
INSERT INTO `pk_popedom` VALUES ('53', '27', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('54', '27', '0', '配置', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('81', '19', '0', '网站', 'site', '40');
INSERT INTO `pk_popedom` VALUES ('82', '19', '0', '域名', 'domain', '50');
INSERT INTO `pk_popedom` VALUES ('58', '8', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('59', '8', '0', '维护', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('63', '6', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('64', '6', '0', '维护', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('67', '7', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('68', '7', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('69', '7', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('70', '7', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('71', '28', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('72', '28', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('73', '28', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('74', '28', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('75', '9', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('76', '9', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('77', '9', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('78', '9', '0', '启用/禁用', 'status', '40');
INSERT INTO `pk_popedom` VALUES ('79', '29', '0', '启用/禁用', 'status', '40');
INSERT INTO `pk_popedom` VALUES ('133', '30', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('134', '30', '0', '设置', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('135', '30', '0', '文件管理', 'filelist', '30');
INSERT INTO `pk_popedom` VALUES ('136', '30', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('142', '13', '0', '审核', 'status', '40');
INSERT INTO `pk_popedom` VALUES ('143', '20', '41', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('144', '20', '41', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('145', '20', '41', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('146', '20', '41', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('147', '20', '41', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('148', '20', '42', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('149', '20', '42', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('150', '20', '42', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('151', '20', '42', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('152', '20', '42', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('153', '20', '43', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('154', '20', '43', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('155', '20', '43', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('156', '20', '43', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('157', '20', '43', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('162', '31', '0', '添加站点', 'add', '40');
INSERT INTO `pk_popedom` VALUES ('159', '31', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('160', '31', '0', '删除', 'delete', '20');
INSERT INTO `pk_popedom` VALUES ('161', '31', '0', '设为默认', 'default', '30');
INSERT INTO `pk_popedom` VALUES ('165', '20', '45', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('166', '20', '45', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('167', '20', '45', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('168', '20', '45', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('169', '20', '45', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('170', '19', '0', '添加站点', 'add', '60');
INSERT INTO `pk_popedom` VALUES ('344', '32', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('345', '32', '0', '启用/禁用', 'status', '20');
INSERT INTO `pk_popedom` VALUES ('346', '32', '0', '删除', 'delete', '30');
INSERT INTO `pk_popedom` VALUES ('347', '32', '0', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('348', '32', '0', '回复', 'reply', '50');
INSERT INTO `pk_popedom` VALUES ('349', '20', '87', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('350', '20', '87', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('351', '20', '87', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('352', '20', '87', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('353', '20', '87', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('388', '20', '96', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('389', '20', '96', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('390', '20', '96', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('391', '20', '96', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('392', '20', '96', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('476', '33', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('477', '33', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('478', '33', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('479', '33', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('480', '33', '0', '启用/禁用', 'status', '50');
INSERT INTO `pk_popedom` VALUES ('601', '34', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('602', '34', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('603', '34', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('604', '34', '0', '审核', 'status', '40');
INSERT INTO `pk_popedom` VALUES ('605', '34', '0', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('606', '20', '142', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('607', '20', '142', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('608', '20', '142', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('609', '20', '142', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('610', '20', '142', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('611', '20', '142', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('612', '20', '144', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('613', '20', '144', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('614', '20', '144', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('615', '20', '144', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('616', '20', '144', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('617', '42', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('618', '42', '0', '执行', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('619', '43', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('620', '44', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('621', '45', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('622', '45', '0', '升级', 'update', '20');
INSERT INTO `pk_popedom` VALUES ('623', '45', '0', '配置升级服务器', 'set', '30');
INSERT INTO `pk_popedom` VALUES ('624', '46', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('625', '9', '0', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('626', '52', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('627', '52', '0', '添加组', 'groupadd', '20');
INSERT INTO `pk_popedom` VALUES ('628', '52', '0', '修改组', 'groupedit', '30');
INSERT INTO `pk_popedom` VALUES ('629', '52', '0', '删除组', 'groupdelete', '40');
INSERT INTO `pk_popedom` VALUES ('630', '52', '0', '添加', 'add', '50');
INSERT INTO `pk_popedom` VALUES ('631', '52', '0', '修改', 'edit', '60');
INSERT INTO `pk_popedom` VALUES ('632', '52', '0', '删除', 'delete', '70');
INSERT INTO `pk_popedom` VALUES ('633', '52', '0', '启用/禁用', 'status', '80');
INSERT INTO `pk_popedom` VALUES ('634', '52', '0', '组启用/禁用', 'groupstatus', '35');
INSERT INTO `pk_popedom` VALUES ('635', '54', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('636', '54', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('637', '54', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('638', '54', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('639', '54', '0', '审核', 'status', '50');
INSERT INTO `pk_popedom` VALUES ('640', '54', '0', '排序', 'taxis', '60');
INSERT INTO `pk_popedom` VALUES ('647', '55', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('648', '55', '0', '更新HTML', 'create', '20');
INSERT INTO `pk_popedom` VALUES ('651', '20', '147', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('652', '20', '147', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('653', '20', '147', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('654', '20', '147', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('655', '20', '147', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('656', '20', '147', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('657', '20', '148', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('658', '20', '148', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('659', '20', '148', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('660', '20', '148', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('661', '20', '148', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('662', '20', '148', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('968', '20', '0', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('967', '20', '0', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('669', '20', '150', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('670', '20', '150', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('671', '20', '151', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('672', '20', '151', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('673', '20', '151', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('674', '20', '151', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('675', '20', '151', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('676', '20', '151', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('677', '20', '152', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('678', '20', '152', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('679', '20', '152', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('680', '20', '152', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('681', '20', '152', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('682', '20', '152', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('689', '20', '144', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('690', '57', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('691', '57', '0', '创建备份', 'create', '20');
INSERT INTO `pk_popedom` VALUES ('692', '57', '0', '删除备份', 'delete', '30');
INSERT INTO `pk_popedom` VALUES ('693', '57', '0', '恢复备份', 'recover', '40');
INSERT INTO `pk_popedom` VALUES ('694', '57', '0', '优化', 'optimize', '50');
INSERT INTO `pk_popedom` VALUES ('695', '57', '0', '修复', 'repair', '60');
INSERT INTO `pk_popedom` VALUES ('696', '58', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('697', '58', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('698', '58', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('699', '58', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('700', '18', '0', '状态', 'status', '50');
INSERT INTO `pk_popedom` VALUES ('701', '59', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('702', '59', '0', '设置', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('703', '59', '0', '删除', 'delete', '30');
INSERT INTO `pk_popedom` VALUES ('704', '27', '0', '扩展', 'ext', '30');
INSERT INTO `pk_popedom` VALUES ('754', '63', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('753', '63', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('752', '63', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('751', '62', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('750', '62', '0', '编辑', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('749', '62', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('748', '62', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('755', '63', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('757', '20', '43', '评论', 'comment', '80');
INSERT INTO `pk_popedom` VALUES ('758', '66', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('759', '66', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('760', '66', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('761', '66', '0', '配置', 'setting', '40');
INSERT INTO `pk_popedom` VALUES ('762', '66', '0', '删除', 'delete', '60');
INSERT INTO `pk_popedom` VALUES ('763', '66', '0', '状态', 'status', '50');
INSERT INTO `pk_popedom` VALUES ('764', '67', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('765', '67', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('766', '67', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('767', '67', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('768', '68', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('769', '68', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('770', '68', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('771', '68', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('772', '77', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('773', '77', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('774', '77', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('775', '77', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('776', '77', '0', '状态', 'status', '50');
INSERT INTO `pk_popedom` VALUES ('777', '34', '0', '配置', 'set', '60');
INSERT INTO `pk_popedom` VALUES ('778', '31', '0', '订单配置', 'order', '50');
INSERT INTO `pk_popedom` VALUES ('779', '78', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('780', '78', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('781', '78', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('782', '78', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('783', '78', '0', '审核', 'status', '50');
INSERT INTO `pk_popedom` VALUES ('784', '78', '0', '设为默认', 'isdefault', '60');
INSERT INTO `pk_popedom` VALUES ('793', '80', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('794', '80', '0', '添加', 'add', '20');
INSERT INTO `pk_popedom` VALUES ('795', '80', '0', '修改', 'modify', '30');
INSERT INTO `pk_popedom` VALUES ('796', '80', '0', '删除', 'delete', '40');
INSERT INTO `pk_popedom` VALUES ('1311', '20', '45', '扩展', 'ext', '70');
INSERT INTO `pk_popedom` VALUES ('1310', '20', '45', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('972', '20', '0', '评论', 'comment', '80');
INSERT INTO `pk_popedom` VALUES ('971', '20', '0', '扩展', 'ext', '70');
INSERT INTO `pk_popedom` VALUES ('970', '20', '0', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('969', '20', '0', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('966', '20', '0', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('965', '20', '0', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('981', '20', '43', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('982', '20', '43', '扩展', 'ext', '70');
INSERT INTO `pk_popedom` VALUES ('983', '20', '311', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('984', '20', '311', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('985', '20', '311', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('986', '20', '311', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('987', '20', '311', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('988', '20', '312', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('989', '20', '312', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('990', '20', '312', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('991', '20', '312', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('992', '20', '312', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('993', '20', '313', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('994', '20', '313', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('995', '20', '313', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('996', '20', '313', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('997', '20', '313', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('998', '20', '313', '评论', 'comment', '80');
INSERT INTO `pk_popedom` VALUES ('999', '20', '313', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1000', '20', '313', '扩展', 'ext', '70');
INSERT INTO `pk_popedom` VALUES ('1001', '20', '314', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1002', '20', '314', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1003', '20', '314', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1004', '20', '314', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1005', '20', '314', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1006', '20', '315', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1007', '20', '315', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1008', '20', '315', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1009', '20', '315', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1010', '20', '315', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1011', '20', '316', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1012', '20', '316', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1013', '20', '317', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1014', '20', '317', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1015', '20', '318', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1016', '20', '318', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1017', '20', '319', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1018', '20', '319', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1019', '20', '320', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1020', '20', '320', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1021', '20', '320', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1022', '20', '320', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1023', '20', '320', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1024', '20', '320', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1025', '20', '321', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1026', '20', '321', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1027', '20', '321', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1028', '20', '321', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1029', '20', '321', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1030', '20', '322', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1031', '20', '322', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1032', '20', '322', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1033', '20', '322', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1034', '20', '322', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1035', '20', '322', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1036', '20', '323', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1037', '20', '323', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1038', '20', '323', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1039', '20', '323', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1040', '20', '323', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1041', '20', '323', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1042', '20', '324', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1043', '20', '324', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1044', '20', '324', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1045', '20', '324', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1046', '20', '324', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1047', '20', '324', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1048', '20', '325', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1049', '20', '325', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1050', '20', '325', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1051', '20', '325', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1052', '20', '325', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1053', '20', '325', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1054', '20', '326', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1055', '20', '326', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1056', '20', '327', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1057', '20', '327', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1058', '20', '328', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1059', '20', '328', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1060', '20', '328', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1061', '20', '328', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1062', '20', '328', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1063', '20', '328', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1064', '20', '329', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1065', '20', '329', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1066', '20', '329', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1067', '20', '329', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1068', '20', '329', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1069', '20', '330', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1070', '20', '330', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1071', '20', '330', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1072', '20', '330', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1073', '20', '330', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1074', '20', '331', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1075', '20', '331', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1076', '20', '331', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1077', '20', '331', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1078', '20', '331', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1079', '20', '331', '评论', 'comment', '80');
INSERT INTO `pk_popedom` VALUES ('1080', '20', '331', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1081', '20', '331', '扩展', 'ext', '70');
INSERT INTO `pk_popedom` VALUES ('1082', '20', '332', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1083', '20', '332', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1084', '20', '332', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1085', '20', '332', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1086', '20', '332', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1087', '20', '333', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1088', '20', '333', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1089', '20', '333', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1090', '20', '333', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1091', '20', '333', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1092', '20', '334', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1093', '20', '334', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1094', '20', '335', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1095', '20', '335', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1096', '20', '336', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1097', '20', '336', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1098', '20', '337', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1099', '20', '337', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1100', '20', '338', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1101', '20', '338', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1102', '20', '338', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1103', '20', '338', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1104', '20', '338', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1105', '20', '338', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1106', '20', '339', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1107', '20', '339', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1108', '20', '339', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1109', '20', '339', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1110', '20', '339', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1111', '20', '340', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1112', '20', '340', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1113', '20', '340', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1114', '20', '340', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1115', '20', '340', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1116', '20', '340', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1117', '20', '341', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1118', '20', '341', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1119', '20', '341', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1120', '20', '341', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1121', '20', '341', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1122', '20', '341', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1123', '20', '342', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1124', '20', '342', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1125', '20', '342', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1126', '20', '342', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1127', '20', '342', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1128', '20', '342', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1129', '20', '343', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1130', '20', '343', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1131', '20', '343', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1132', '20', '343', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1133', '20', '343', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1134', '20', '343', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1135', '20', '344', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1136', '20', '344', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1137', '20', '345', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1138', '20', '345', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1139', '20', '346', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1140', '20', '346', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1141', '20', '346', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1142', '20', '346', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1143', '20', '346', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1144', '20', '346', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1145', '20', '347', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1146', '20', '347', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1147', '20', '347', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1148', '20', '347', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1149', '20', '347', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1150', '20', '348', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1151', '20', '348', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1152', '20', '348', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1153', '20', '348', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1154', '20', '348', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1155', '20', '349', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1156', '20', '349', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1157', '20', '349', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1158', '20', '349', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1159', '20', '349', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1160', '20', '349', '评论', 'comment', '80');
INSERT INTO `pk_popedom` VALUES ('1161', '20', '349', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1162', '20', '349', '扩展', 'ext', '70');
INSERT INTO `pk_popedom` VALUES ('1163', '20', '350', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1164', '20', '350', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1165', '20', '350', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1166', '20', '350', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1167', '20', '350', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1168', '20', '351', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1169', '20', '351', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1170', '20', '351', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1171', '20', '351', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1172', '20', '351', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1173', '20', '352', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1174', '20', '352', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1175', '20', '353', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1176', '20', '353', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1177', '20', '354', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1178', '20', '354', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1179', '20', '355', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1180', '20', '355', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1181', '20', '356', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1182', '20', '356', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1183', '20', '356', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1184', '20', '356', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1185', '20', '356', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1186', '20', '356', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1187', '20', '357', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1188', '20', '357', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1189', '20', '357', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1190', '20', '357', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1191', '20', '357', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1192', '20', '358', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1193', '20', '358', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1194', '20', '358', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1195', '20', '358', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1196', '20', '358', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1197', '20', '358', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1198', '20', '359', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1199', '20', '359', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1200', '20', '359', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1201', '20', '359', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1202', '20', '359', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1203', '20', '359', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1204', '20', '360', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1205', '20', '360', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1206', '20', '360', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1207', '20', '360', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1208', '20', '360', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1209', '20', '360', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1210', '20', '361', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1211', '20', '361', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1212', '20', '361', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1213', '20', '361', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1214', '20', '361', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1215', '20', '361', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1216', '20', '362', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1217', '20', '362', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1218', '20', '363', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1219', '20', '363', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1220', '20', '364', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1221', '20', '364', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1222', '20', '364', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1223', '20', '364', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1224', '20', '364', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1225', '20', '364', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1307', '20', '87', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1308', '20', '87', '扩展', 'ext', '70');
INSERT INTO `pk_popedom` VALUES ('1309', '20', '87', '评论', 'comment', '80');
INSERT INTO `pk_popedom` VALUES ('1312', '20', '45', '评论', 'comment', '80');
INSERT INTO `pk_popedom` VALUES ('1337', '20', '386', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1338', '20', '386', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1339', '20', '386', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1340', '20', '386', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1341', '20', '386', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1342', '20', '386', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1343', '20', '386', '扩展', 'ext', '70');
INSERT INTO `pk_popedom` VALUES ('1344', '20', '386', '评论', 'comment', '80');
INSERT INTO `pk_popedom` VALUES ('1345', '34', '0', '取消', 'cancel', '70');
INSERT INTO `pk_popedom` VALUES ('1346', '34', '0', '结束', 'stop', '80');
INSERT INTO `pk_popedom` VALUES ('1347', '34', '0', '完成', 'end', '90');
INSERT INTO `pk_popedom` VALUES ('1362', '20', '391', '扩展', 'ext', '70');
INSERT INTO `pk_popedom` VALUES ('1361', '20', '391', '启用/禁用', 'status', '60');
INSERT INTO `pk_popedom` VALUES ('1360', '20', '391', '删除', 'delete', '50');
INSERT INTO `pk_popedom` VALUES ('1359', '20', '391', '修改', 'modify', '40');
INSERT INTO `pk_popedom` VALUES ('1358', '20', '391', '添加', 'add', '30');
INSERT INTO `pk_popedom` VALUES ('1357', '20', '391', '编辑', 'set', '20');
INSERT INTO `pk_popedom` VALUES ('1356', '20', '391', '查看', 'list', '10');
INSERT INTO `pk_popedom` VALUES ('1363', '20', '391', '评论', 'comment', '80');

-- ----------------------------
-- Table structure for pk_project
-- ----------------------------
DROP TABLE IF EXISTS `pk_project`;
CREATE TABLE `pk_project` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID，也是应用ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上一级ID',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '网站ID',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '指定模型ID，为0表页面空白',
  `cate` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '绑定根分类ID',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `nick_title` varchar(255) NOT NULL COMMENT '后台别称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `tpl_index` varchar(255) NOT NULL COMMENT '封面页',
  `tpl_list` varchar(255) NOT NULL COMMENT '列表页',
  `tpl_content` varchar(255) NOT NULL COMMENT '详细页',
  `is_identifier` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否自定义标识',
  `ico` varchar(255) NOT NULL COMMENT '图标',
  `orderby` text NOT NULL COMMENT '排序',
  `alias_title` varchar(255) NOT NULL COMMENT '主题别名',
  `alias_note` varchar(255) NOT NULL COMMENT '主题备注',
  `psize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0表示不限制，每页显示数量',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示管理员维护',
  `identifier` varchar(255) NOT NULL COMMENT '标识',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `subtopics` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用子主题功能',
  `is_search` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否支持搜索',
  `is_tag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '必填Tag',
  `is_biz` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0不启用电商，1启用电商',
  `is_userid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定会员',
  `is_tpl_content` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否自定义内容模板',
  `is_seo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认使用seo',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '默认货币ID',
  `admin_note` text NOT NULL COMMENT '管理员备注，给编辑人员使用的',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0显示1隐藏',
  `post_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发布模式，0不启用1启用',
  `comment_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '启用评论功能',
  `post_tpl` varchar(255) NOT NULL COMMENT '发布页模板',
  `etpl_admin` varchar(255) NOT NULL COMMENT '通知管理员邮件模板',
  `etpl_user` varchar(255) NOT NULL COMMENT '发布邮件通知会员模板',
  `etpl_comment_admin` varchar(255) NOT NULL COMMENT '评论邮件通知管理员模板',
  `etpl_comment_user` varchar(255) NOT NULL COMMENT '评论邮件通知会员',
  `is_attr` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1启用主题属性0不启用',
  `tag` varchar(255) NOT NULL COMMENT '自身Tag设置',
  `is_appoint` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '指定维护',
  `cate_multiple` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0分类单选1分类支持多选',
  `biz_attr` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '产品属性，0不使用1使用',
  `freight` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `site_id` (`site_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 COMMENT='项目管理器';

-- ----------------------------
-- Records of pk_project
-- ----------------------------
INSERT INTO `pk_project` VALUES ('41', '0', '1', '21', '0', '图片播放器', '', '10', '1', '', '', '', '0', 'images/ico/picplayer.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'picture-player', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('42', '0', '1', '23', '0', '导航菜单', '', '8', '1', '', '', '', '0', 'images/ico/menu.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '导航名称', '', '30', '0', 'menu', '', '', '', '1', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('43', '0', '1', '22', '7', '资讯中心', '', '12', '1', '', 'article_list', 'article_content', '0', 'images/ico/article.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '新闻主题', '', '1', '0', 'news', '', '', '', '0', '1', '1', '0', '0', '0', '1', '0', '', '0', '0', '0', '', '', '', '', '', '1', '新闻,资讯', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('87', '0', '1', '40', '0', '关于我们', '', '15', '0', '', '', '', '1', 'images/ico/about.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'about', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('45', '0', '1', '24', '70', '产品展示', '', '50', '0', '', '', '', '0', 'images/ico/product.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '产品名称', '', '12', '0', 'product', '', '', '', '0', '1', '0', '1', '0', '0', '0', '1', '', '0', '0', '0', '', '', '', '', '', '1', '', '0', '1', '1', '0');
INSERT INTO `pk_project` VALUES ('142', '0', '1', '61', '0', '友情链接', '', '120', '0', '', '', '', '0', 'images/ico/link.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '网站名称', '', '30', '0', 'link', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '0', 'post_link', 'project_save', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('96', '0', '1', '46', '0', '在线留言', '', '70', '0', '', '', '', '0', 'images/ico/comment.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '留言主题', '', '30', '0', 'book', '', '', '', '0', '0', '0', '0', '1', '0', '0', '0', '', '0', '1', '1', '', 'project_save', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('144', '0', '1', '68', '154', '图集相册', '', '90', '0', '', '', '', '0', 'images/ico/photo.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'photo', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('151', '0', '1', '65', '197', '下载中心', '', '100', '0', '', 'download_list', 'download_content', '0', 'images/ico/cloud.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '附件名称', '', '30', '0', 'download-center', '', '', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('147', '0', '1', '23', '0', '页脚导航', '', '35', '1', '', '', '', '0', 'images/ico/menu.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'yejiaodaohang', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('148', '0', '1', '64', '0', '在线客服', '', '130', '0', '', '', '', '0', 'images/ico/qq.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '客服类型', '', '30', '0', 'kefu', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('150', '0', '1', '0', '0', '售后保障', '', '60', '0', '', '', '', '0', 'images/ico/paper.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'shouhoukouzhang', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('152', '0', '1', '66', '201', '论坛BBS', '', '110', '0', 'bbs_index', 'bbs_list', 'bbs_detail', '0', 'images/ico/forum.png', 'ext.toplevel DESC,l.replydate DESC,l.dateline DESC,l.id DESC', '讨论主题', '', '30', '0', 'bbs', '', '', '', '0', '0', '0', '0', '1', '0', '0', '0', '', '0', '1', '1', 'bbs_fabu', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('386', '0', '1', '75', '0', '银行汇款', '', '140', '0', '', '', '', '0', 'images/ico/bank.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '订单编号', '', '30', '0', 'yinxinghuikuan', '', '', '', '0', '0', '0', '0', '1', '0', '0', '0', '', '0', '1', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `pk_project` VALUES ('391', '0', '1', '84', '0', '微信菜单', '', '150', '0', '', '', '', '0', 'images/ico/menu.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '菜单名称', '一级菜单不能超过4个汉字，二级菜单不能超过7个汉字', '30', '0', 'wxmenu', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for pk_reply
-- ----------------------------
DROP TABLE IF EXISTS `pk_reply`;
CREATE TABLE `pk_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父回复ID',
  `vouch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐评论',
  `star` tinyint(1) NOT NULL DEFAULT '3' COMMENT '星级',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `ip` varchar(255) NOT NULL COMMENT '回复人IP',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核1审核',
  `session_id` varchar(255) NOT NULL COMMENT '游客标识',
  `content` text NOT NULL COMMENT '评论内容',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `adm_content` longtext NOT NULL COMMENT '管理员回复内容',
  `adm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0为评论，非零绑定订单ID',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='主题评论表';

-- ----------------------------
-- Records of pk_reply
-- ----------------------------
INSERT INTO `pk_reply` VALUES ('42', '1762', '0', '0', '0', '23', '0.0.0.0', '1480392662', '1', 'kvvddou0472srpf83vcpd32h20', '测试下评论', '0', '', '0', '0');
INSERT INTO `pk_reply` VALUES ('43', '1762', '0', '0', '0', '23', '0.0.0.0', '1480393813', '1', 'kvvddou0472srpf83vcpd32h20', '再来测试下！', '0', '', '0', '0');
INSERT INTO `pk_reply` VALUES ('44', '1763', '0', '0', '0', '23', '0.0.0.0', '1480398396', '1', '', '测试下点评噢', '0', '', '0', '23');

-- ----------------------------
-- Table structure for pk_res
-- ----------------------------
DROP TABLE IF EXISTS `pk_res`;
CREATE TABLE `pk_res` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `folder` varchar(255) NOT NULL COMMENT '存储目录',
  `name` varchar(255) NOT NULL COMMENT '资源文件名',
  `ext` varchar(30) NOT NULL COMMENT '资源后缀，如jpg等',
  `filename` varchar(255) NOT NULL COMMENT '文件名带路径',
  `ico` varchar(255) NOT NULL COMMENT 'ICO图标文件',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `title` varchar(255) NOT NULL COMMENT '内容',
  `attr` text NOT NULL COMMENT '附件属性',
  `note` text NOT NULL COMMENT '备注',
  `session_id` varchar(100) NOT NULL COMMENT '操作者 ID，即会员ID用于检测是否有权限删除 ',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID，当该ID为时检则sesson_id，如不相同则不能删除 ',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  PRIMARY KEY (`id`),
  KEY `ext` (`ext`)
) ENGINE=MyISAM AUTO_INCREMENT=1213 DEFAULT CHARSET=utf8 COMMENT='资源ID';

-- ----------------------------
-- Records of pk_res
-- ----------------------------
INSERT INTO `pk_res` VALUES ('1040', '1', 'res/201604/03/', '0143658fa7928c1c', 'jpg', 'res/201604/03/0143658fa7928c1c.jpg', 'res/201604/03/_1040.jpg', '1459617276', '160', 'a:2:{s:5:\"width\";i:160;s:6:\"height\";i:160;}', '', 'v8tocibrgebid4pht9ksprfhd1', '23', '0', '0');
INSERT INTO `pk_res` VALUES ('1200', '1', 'res/201705/22/', 'b184e6c7568fecd7.png', 'png', 'res/201705/22/b184e6c7568fecd7.png', 'res/201705/22/_1200.png', '1495441706', 'logo', 'a:2:{s:5:\"width\";i:307;s:6:\"height\";i:72;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1201', '1', 'res/201705/22/', 'f87e5d83d1cda86b.jpg', 'jpg', 'res/201705/22/f87e5d83d1cda86b.jpg', 'res/201705/22/_1201.jpg', '1495443604', 'qrcode', 'a:2:{s:5:\"width\";i:430;s:6:\"height\";i:430;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1202', '1', 'res/201705/22/', '9fae0617e981b96a.jpg', 'jpg', 'res/201705/22/9fae0617e981b96a.jpg', 'res/201705/22/_1202.jpg', '1495446838', '7b8f71114d5f6a739042415be1d81416', 'a:2:{s:5:\"width\";i:272;s:6:\"height\";i:168;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1203', '1', 'res/201705/22/', '34697705b6c548f8.jpg', 'jpg', 'res/201705/22/34697705b6c548f8.jpg', 'res/201705/22/_1203.jpg', '1495446962', '6fb101e4d8bffe234115fdec5e9beb53', 'a:2:{s:5:\"width\";i:272;s:6:\"height\";i:168;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1204', '1', 'res/201705/22/', 'a0f4df6f77314c0c.jpg', 'jpg', 'res/201705/22/a0f4df6f77314c0c.jpg', 'res/201705/22/_1204.jpg', '1495447078', '5fb8ff60c5ffc536a10cf4d91e0d37ee', 'a:2:{s:5:\"width\";i:272;s:6:\"height\";i:168;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1205', '1', 'res/201705/22/', '9d7c6210e1b6e7f7.jpg', 'jpg', 'res/201705/22/9d7c6210e1b6e7f7.jpg', 'res/201705/22/_1205.jpg', '1495448572', 'c57d3c46ee58eba445063d9dbfde6e9c', 'a:2:{s:5:\"width\";i:272;s:6:\"height\";i:168;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1206', '1', 'res/201705/23/', 'e7d59bb1b371956a.jpg', 'jpg', 'res/201705/23/e7d59bb1b371956a.jpg', 'res/201705/23/_1206.jpg', '1495504535', 's1', 'a:2:{s:5:\"width\";i:1200;s:6:\"height\";i:573;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1207', '1', 'res/201705/23/', 'a963f33ea9235606.jpg', 'jpg', 'res/201705/23/a963f33ea9235606.jpg', 'res/201705/23/_1207.jpg', '1495504569', 's2', 'a:2:{s:5:\"width\";i:1200;s:6:\"height\";i:573;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1208', '1', 'res/201705/23/', '770937d7f4353060.jpg', 'jpg', 'res/201705/23/770937d7f4353060.jpg', 'res/201705/23/_1208.jpg', '1495504586', 's3', 'a:2:{s:5:\"width\";i:1200;s:6:\"height\";i:574;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1209', '1', 'res/201705/23/', 'ec5a5d8a87907172.jpg', 'jpg', 'res/201705/23/ec5a5d8a87907172.jpg', 'res/201705/23/_1209.jpg', '1495504779', '1ft6-1', 'a:2:{s:5:\"width\";i:800;s:6:\"height\";i:444;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1210', '1', 'res/201705/23/', '894147823c8d4938.png', 'png', 'res/201705/23/894147823c8d4938.png', 'res/201705/23/_1210.png', '1495504810', 'ux-1', 'a:2:{s:5:\"width\";i:658;s:6:\"height\";i:365;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1211', '1', 'res/201705/23/', '77aa9205a53c36a9.png', 'png', 'res/201705/23/77aa9205a53c36a9.png', 'res/201705/23/_1211.png', '1495504828', 'ux-1', 'a:2:{s:5:\"width\";i:658;s:6:\"height\";i:365;}', '', '', '0', '0', '1');
INSERT INTO `pk_res` VALUES ('1212', '1', 'res/201705/23/', '007479e610d942e1.png', 'png', 'res/201705/23/007479e610d942e1.png', 'res/201705/23/_1212.png', '1495504854', '149-1', 'a:2:{s:5:\"width\";i:480;s:6:\"height\";i:266;}', '', '', '0', '0', '1');

-- ----------------------------
-- Table structure for pk_res_cate
-- ----------------------------
DROP TABLE IF EXISTS `pk_res_cate`;
CREATE TABLE `pk_res_cate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源分类ID',
  `title` varchar(255) NOT NULL COMMENT '分类名称',
  `root` varchar(255) NOT NULL DEFAULT '/' COMMENT '存储目录',
  `folder` varchar(255) NOT NULL DEFAULT 'Ym/d/' COMMENT '存储目录格式',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1默认0非默认',
  `filetypes` varchar(255) NOT NULL COMMENT '附件类型',
  `typeinfo` varchar(200) NOT NULL COMMENT '类型说明',
  `gdtypes` varchar(255) NOT NULL COMMENT '支持的GD方案，多个GD方案用英文ID分开',
  `gdall` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1支持全部GD方案0仅支持指定的GD方案',
  `ico` tinyint(1) NOT NULL DEFAULT '0' COMMENT '后台缩略图',
  `filemax` int(10) unsigned NOT NULL DEFAULT '2' COMMENT '上传文件大小限制',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='资源分类存储';

-- ----------------------------
-- Records of pk_res_cate
-- ----------------------------
INSERT INTO `pk_res_cate` VALUES ('1', '图片', 'res/', 'Ym/d/', '1', 'png,jpg,gif', '图片', '', '1', '1', '2000');
INSERT INTO `pk_res_cate` VALUES ('11', '压缩软件', 'res/soft/', 'Y/', '0', 'rar,zip', '压缩包', '', '0', '0', '2000');
INSERT INTO `pk_res_cate` VALUES ('20', 'Excel', 'res/excel', '', '0', 'xls,xlsx', 'Excel文件', '', '0', '0', '2048');
INSERT INTO `pk_res_cate` VALUES ('21', '测试分类', 'res/', 'Ym/d/', '0', 'png,jpg,gif', '图片', '', '1', '1', '2048');
INSERT INTO `pk_res_cate` VALUES ('22', '这个也是测试的', 'res/', 'Ym/d/', '0', 'png,jpg,gif', '图片', '', '1', '1', '102400');
INSERT INTO `pk_res_cate` VALUES ('23', 'ddd', 'res/', 'Ym/d/', '0', 'png,jpg,gif', '图片', '', '1', '1', '102400');
INSERT INTO `pk_res_cate` VALUES ('24', '视频', 'res/', 'Ym/d/', '0', 'mp4,flv,mp3,mpeg', '影音文字', '', '0', '0', '2048');

-- ----------------------------
-- Table structure for pk_res_ext
-- ----------------------------
DROP TABLE IF EXISTS `pk_res_ext`;
CREATE TABLE `pk_res_ext` (
  `res_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '附件ID',
  `gd_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'GD库方案ID',
  `filename` varchar(255) NOT NULL COMMENT '文件地址（含路径）',
  `filetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后',
  PRIMARY KEY (`res_id`,`gd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='生成扩展图片';

-- ----------------------------
-- Records of pk_res_ext
-- ----------------------------
INSERT INTO `pk_res_ext` VALUES ('1040', '12', 'res/201604/03/auto_1040.jpg', '1478857209');
INSERT INTO `pk_res_ext` VALUES ('1040', '2', 'res/201604/03/thumb_1040.jpg', '1478857209');
INSERT INTO `pk_res_ext` VALUES ('1200', '12', 'res/201705/22/auto_1200.png', '1495441706');
INSERT INTO `pk_res_ext` VALUES ('1200', '2', 'res/201705/22/thumb_1200.png', '1495441706');
INSERT INTO `pk_res_ext` VALUES ('1201', '12', 'res/201705/22/auto_1201.jpg', '1495443604');
INSERT INTO `pk_res_ext` VALUES ('1201', '2', 'res/201705/22/thumb_1201.jpg', '1495443604');
INSERT INTO `pk_res_ext` VALUES ('1202', '12', 'res/201705/22/auto_1202.jpg', '1495446838');
INSERT INTO `pk_res_ext` VALUES ('1202', '2', 'res/201705/22/thumb_1202.jpg', '1495446838');
INSERT INTO `pk_res_ext` VALUES ('1203', '12', 'res/201705/22/auto_1203.jpg', '1495446962');
INSERT INTO `pk_res_ext` VALUES ('1203', '2', 'res/201705/22/thumb_1203.jpg', '1495446962');
INSERT INTO `pk_res_ext` VALUES ('1204', '12', 'res/201705/22/auto_1204.jpg', '1495447078');
INSERT INTO `pk_res_ext` VALUES ('1204', '2', 'res/201705/22/thumb_1204.jpg', '1495447078');
INSERT INTO `pk_res_ext` VALUES ('1205', '12', 'res/201705/22/auto_1205.jpg', '1495448572');
INSERT INTO `pk_res_ext` VALUES ('1205', '2', 'res/201705/22/thumb_1205.jpg', '1495448572');
INSERT INTO `pk_res_ext` VALUES ('1206', '12', 'res/201705/23/auto_1206.jpg', '1495504535');
INSERT INTO `pk_res_ext` VALUES ('1206', '2', 'res/201705/23/thumb_1206.jpg', '1495504535');
INSERT INTO `pk_res_ext` VALUES ('1207', '12', 'res/201705/23/auto_1207.jpg', '1495504569');
INSERT INTO `pk_res_ext` VALUES ('1207', '2', 'res/201705/23/thumb_1207.jpg', '1495504569');
INSERT INTO `pk_res_ext` VALUES ('1208', '12', 'res/201705/23/auto_1208.jpg', '1495504586');
INSERT INTO `pk_res_ext` VALUES ('1208', '2', 'res/201705/23/thumb_1208.jpg', '1495504586');
INSERT INTO `pk_res_ext` VALUES ('1209', '12', 'res/201705/23/auto_1209.jpg', '1495504779');
INSERT INTO `pk_res_ext` VALUES ('1209', '2', 'res/201705/23/thumb_1209.jpg', '1495504779');
INSERT INTO `pk_res_ext` VALUES ('1210', '12', 'res/201705/23/auto_1210.png', '1495504810');
INSERT INTO `pk_res_ext` VALUES ('1210', '2', 'res/201705/23/thumb_1210.png', '1495504810');
INSERT INTO `pk_res_ext` VALUES ('1211', '12', 'res/201705/23/auto_1211.png', '1495504828');
INSERT INTO `pk_res_ext` VALUES ('1211', '2', 'res/201705/23/thumb_1211.png', '1495504828');
INSERT INTO `pk_res_ext` VALUES ('1212', '12', 'res/201705/23/auto_1212.png', '1495504854');
INSERT INTO `pk_res_ext` VALUES ('1212', '2', 'res/201705/23/thumb_1212.png', '1495504854');

-- ----------------------------
-- Table structure for pk_session
-- ----------------------------
DROP TABLE IF EXISTS `pk_session`;
CREATE TABLE `pk_session` (
  `id` varchar(32) NOT NULL COMMENT 'session_id',
  `data` varchar(20485) NOT NULL COMMENT 'session 内容，最多只能放20K',
  `lasttime` int(10) unsigned NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SESSION操作';

-- ----------------------------
-- Records of pk_session
-- ----------------------------

-- ----------------------------
-- Table structure for pk_site
-- ----------------------------
DROP TABLE IF EXISTS `pk_site`;
CREATE TABLE `pk_site` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `domain_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '默认域名ID',
  `title` varchar(255) NOT NULL COMMENT '网站名称',
  `dir` varchar(255) NOT NULL DEFAULT '/' COMMENT '安装目录，以/结尾',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `content` text NOT NULL COMMENT '网站关闭原因',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1默认站点',
  `tpl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
  `url_type` enum('default','rewrite','html') NOT NULL DEFAULT 'default' COMMENT '默认，即带?等能数，rewrite是伪静态页，html为生成的静态页',
  `logo` varchar(255) NOT NULL COMMENT '网站 LOGO ',
  `meta` text NOT NULL COMMENT '扩展配置',
  `currency_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '默认货币ID',
  `register_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0关闭注册1开启注册',
  `register_close` varchar(255) NOT NULL COMMENT '关闭注册说明',
  `login_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0关闭登录1开启',
  `login_close` varchar(255) NOT NULL COMMENT '关闭登录说明',
  `adm_logo29` varchar(255) NOT NULL COMMENT '在后台左侧LOGO地址',
  `adm_logo180` varchar(255) NOT NULL COMMENT '登录LOGO地址',
  `lang` varchar(255) NOT NULL COMMENT '语言包',
  `api` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0不走接口',
  `api_code` varchar(255) NOT NULL COMMENT 'API验证串',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO主题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` text NOT NULL COMMENT 'SEO摘要',
  `biz_sn` varchar(255) NOT NULL COMMENT '订单号生成规则',
  `biz_payment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '默认支付方式',
  `upload_guest` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '游客上传权限',
  `upload_user` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员上传权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='网站管理';

-- ----------------------------
-- Records of pk_site
-- ----------------------------
INSERT INTO `pk_site` VALUES ('1', '1', '资讯站', '/', '1', '网站关闭测试', '1', '19', 'default', 'res/201705/22/b184e6c7568fecd7.png', '', '1', '1', '本系统暂停新会员注册，如需会员服务请联系QQ：40782502', '1', '本系统暂停会员登录，给您带来不便还请见谅！', 'res/201705/22/b184e6c7568fecd7.png', 'res/201705/22/b184e6c7568fecd7.png', 'cn', '0', '', '资讯站-title', '资讯站-keyword', '资讯站-note', 'prefix[P]-year-month-date-rand-user-number', '0', '1', '1');

-- ----------------------------
-- Table structure for pk_site_domain
-- ----------------------------
DROP TABLE IF EXISTS `pk_site_domain`;
CREATE TABLE `pk_site_domain` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '网站ID',
  `domain` varchar(255) NOT NULL COMMENT '域名信息',
  `is_mobile` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1此域名强制为手机版',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='网站指定的域名';

-- ----------------------------
-- Records of pk_site_domain
-- ----------------------------
INSERT INTO `pk_site_domain` VALUES ('1', '1', 'www.ns.com', '0');

-- ----------------------------
-- Table structure for pk_sysmenu
-- ----------------------------
DROP TABLE IF EXISTS `pk_sysmenu`;
CREATE TABLE `pk_sysmenu` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID，0为根菜单',
  `title` varchar(100) NOT NULL COMMENT '分类名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态0禁用1正常',
  `appfile` varchar(100) NOT NULL COMMENT '应用文件名，放在phpok/admin/目录下，记录不带.php',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠，可选0-255',
  `func` varchar(100) NOT NULL COMMENT '应用函数，为空使用index',
  `identifier` varchar(100) NOT NULL COMMENT '标识串，用于区分同一应用文件的不同内容',
  `ext` varchar(255) NOT NULL COMMENT '表单扩展',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0常规项目，1系统项目',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '0表示全局网站',
  `icon` varchar(255) NOT NULL COMMENT '图标路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='PHPOK后台系统菜单';

-- ----------------------------
-- Records of pk_sysmenu
-- ----------------------------
INSERT INTO `pk_sysmenu` VALUES ('1', '0', '设置', '1', 'setting', '50', '', '', '', '1', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('3', '0', '会员', '0', 'user', '30', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('5', '0', '内容', '1', 'index', '10', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('6', '1', '表单选项', '1', 'opt', '30', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('7', '4', '字段维护', '1', 'fields', '20', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('8', '1', '模块管理', '1', 'module', '20', '', '', '', '0', '0', 'map');
INSERT INTO `pk_sysmenu` VALUES ('9', '1', '核心配置', '1', 'system', '50', '', '', '', '1', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('13', '3', '会员列表', '1', 'user', '10', '', '', '', '0', '0', 'user');
INSERT INTO `pk_sysmenu` VALUES ('14', '3', '会员组', '1', 'usergroup', '20', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('25', '3', '会员字段', '1', 'user', '30', 'fields', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('16', '4', '插件中心', '1', 'plugin', '30', '', '', '', '0', '0', 'leaf');
INSERT INTO `pk_sysmenu` VALUES ('18', '5', '分类管理', '1', 'cate', '30', '', '', '', '0', '0', 'stack');
INSERT INTO `pk_sysmenu` VALUES ('19', '5', '全局内容', '1', 'all', '10', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('20', '5', '内容管理', '1', 'list', '20', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('22', '5', '资源管理', '1', 'res', '60', '', '', '', '0', '0', 'download');
INSERT INTO `pk_sysmenu` VALUES ('23', '5', '数据调用', '1', 'call', '40', '', '', '', '0', '0', 'rocket');
INSERT INTO `pk_sysmenu` VALUES ('27', '1', '项目管理', '1', 'project', '10', '', '', '', '0', '0', 'google-drive');
INSERT INTO `pk_sysmenu` VALUES ('28', '4', '通知模板', '1', 'email', '40', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('29', '1', '管理员维护', '1', 'admin', '80', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('30', '1', '风格管理', '1', 'tpl', '60', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('31', '1', '站点管理', '1', 'site', '90', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('32', '5', '评论管理', '1', 'reply', '50', '', '', '', '0', '0', 'bubbles');
INSERT INTO `pk_sysmenu` VALUES ('33', '2', '货币及汇率', '1', 'currency', '30', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('34', '2', '订单管理', '0', 'order', '10', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('4', '0', '工具', '1', 'tool', '40', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('45', '4', '程序升级', '1', 'update', '10', '', '', '', '0', '0', 'earth');
INSERT INTO `pk_sysmenu` VALUES ('2', '0', '商务', '1', '', '20', '', '', '', '1', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('52', '2', '付款方案', '1', 'payment', '20', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('57', '1', '数据库管理', '1', 'sql', '100', '', '', '', '0', '0', 'globe');
INSERT INTO `pk_sysmenu` VALUES ('58', '5', '标签管理', '1', 'tag', '70', '', '', '', '0', '0', 'tags');
INSERT INTO `pk_sysmenu` VALUES ('59', '1', '伪静态页规则', '1', 'rewrite', '70', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('62', '4', '附件分类管理', '1', 'rescate', '120', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('63', '4', '图片规格方案', '1', 'gd', '130', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('66', '3', '财富方案', '1', 'wealth', '40', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('67', '2', '商品属性', '1', 'options', '40', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('68', '2', '运费模板', '1', 'freight', '50', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('78', '4', '网关路由', '1', 'gateway', '110', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('77', '2', '物流快递', '1', 'express', '50', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('80', '4', '计划任务', '1', 'task', '140', '', '', '', '0', '0', '');
INSERT INTO `pk_sysmenu` VALUES ('87', '1', '日志', '1', 'log', '110', '', '', '', '1', '0', 'info');

-- ----------------------------
-- Table structure for pk_tag
-- ----------------------------
DROP TABLE IF EXISTS `pk_tag`;
CREATE TABLE `pk_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '关键字网址',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0原窗口打开，1新窗口打开',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `alt` varchar(255) NOT NULL COMMENT '链接里的提示',
  `is_global` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否全局状态1是0否',
  `replace_count` tinyint(4) NOT NULL DEFAULT '3' COMMENT '替换次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='关键字管理器';

-- ----------------------------
-- Records of pk_tag
-- ----------------------------
INSERT INTO `pk_tag` VALUES ('86', '1', 'AI人工智能', '', '0', '1', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('73', '1', 'iPhone 8', '', '0', '5', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('74', '1', '贾跃亭', '', '0', '0', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('75', '1', '乐视', '', '0', '1', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('77', '1', '户外', '', '0', '0', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('78', '1', '旅行', '', '0', '2', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('79', '1', '黑科技', '', '0', '4', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('80', '1', '充电宝', '', '0', '1', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('81', '1', '移动电源', '', '0', '6', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('82', '1', 'AI', '', '0', '100', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('83', '1', '人工智能', '', '0', '54', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('84', '1', '微软', '', '0', '2', '', '0', '3');
INSERT INTO `pk_tag` VALUES ('85', '1', '微软小冰', '', '0', '3', '', '0', '3');

-- ----------------------------
-- Table structure for pk_tag_stat
-- ----------------------------
DROP TABLE IF EXISTS `pk_tag_stat`;
CREATE TABLE `pk_tag_stat` (
  `title_id` varchar(200) NOT NULL COMMENT '主题ID，以p开头的表示项目ID，以c开头的表示分类ID',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'TAG标签ID',
  PRIMARY KEY (`title_id`,`tag_id`),
  KEY `title_id` (`title_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag主题统计';

-- ----------------------------
-- Records of pk_tag_stat
-- ----------------------------
INSERT INTO `pk_tag_stat` VALUES ('1871', '73');
INSERT INTO `pk_tag_stat` VALUES ('1871', '74');
INSERT INTO `pk_tag_stat` VALUES ('1871', '75');
INSERT INTO `pk_tag_stat` VALUES ('1871', '83');
INSERT INTO `pk_tag_stat` VALUES ('1872', '84');
INSERT INTO `pk_tag_stat` VALUES ('1872', '85');
INSERT INTO `pk_tag_stat` VALUES ('1872', '86');
INSERT INTO `pk_tag_stat` VALUES ('1873', '77');
INSERT INTO `pk_tag_stat` VALUES ('1873', '78');
INSERT INTO `pk_tag_stat` VALUES ('1873', '79');
INSERT INTO `pk_tag_stat` VALUES ('1873', '80');
INSERT INTO `pk_tag_stat` VALUES ('1873', '81');
INSERT INTO `pk_tag_stat` VALUES ('1873', '83');
INSERT INTO `pk_tag_stat` VALUES ('1874', '82');
INSERT INTO `pk_tag_stat` VALUES ('1874', '83');
INSERT INTO `pk_tag_stat` VALUES ('1874', '84');
INSERT INTO `pk_tag_stat` VALUES ('1874', '85');

-- ----------------------------
-- Table structure for pk_task
-- ----------------------------
DROP TABLE IF EXISTS `pk_task`;
CREATE TABLE `pk_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `year` varchar(9) NOT NULL COMMENT '年份',
  `month` varchar(5) NOT NULL COMMENT '月',
  `day` varchar(5) NOT NULL COMMENT '日',
  `hour` varchar(5) NOT NULL COMMENT '时',
  `minute` varchar(5) NOT NULL COMMENT '分',
  `second` varchar(5) NOT NULL COMMENT '秒',
  `exec_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始执行时间',
  `stop_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `action` varchar(100) NOT NULL COMMENT '执行动作脚本',
  `param` varchar(255) NOT NULL COMMENT '参数',
  `only_once` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1表示仅执行一次',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未锁定1已锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='计划任务';

-- ----------------------------
-- Records of pk_task
-- ----------------------------
INSERT INTO `pk_task` VALUES ('15', '*', '*', '*', '*', '42', '*', '1495627178', '1495627178', 'expired', '', '0', '0');

-- ----------------------------
-- Table structure for pk_tpl
-- ----------------------------
DROP TABLE IF EXISTS `pk_tpl`;
CREATE TABLE `pk_tpl` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(100) NOT NULL COMMENT '模板名称',
  `author` varchar(100) NOT NULL COMMENT '开发者名称',
  `folder` varchar(100) NOT NULL DEFAULT 'www' COMMENT '模板目录',
  `refresh_auto` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1自动判断更新刷新0不刷新',
  `refresh` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1强制刷新0普通刷新',
  `ext` varchar(20) NOT NULL DEFAULT 'html' COMMENT '后缀',
  `folder_change` varchar(255) NOT NULL COMMENT '更改目录',
  `phpfolder` varchar(200) NOT NULL COMMENT 'PHP执行文件目录',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='模板管理';

-- ----------------------------
-- Records of pk_tpl
-- ----------------------------
INSERT INTO `pk_tpl` VALUES ('1', '默认风格', 'phpok.com', 'www', '1', '0', 'html', 'css,images,js', 'phpinc');
INSERT INTO `pk_tpl` VALUES ('18', 'English', 'phpok.com', 'en', '1', '0', 'html', 'css,js,images', 'phpinc');
INSERT INTO `pk_tpl` VALUES ('19', 'news', 'ryante', 'news', '1', '0', 'html', 'css,js,images,picture,font', '');

-- ----------------------------
-- Table structure for pk_user
-- ----------------------------
DROP TABLE IF EXISTS `pk_user`;
CREATE TABLE `pk_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID，即会员ID',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主要会员组',
  `user` varchar(100) NOT NULL COMMENT '会员账号',
  `pass` varchar(100) NOT NULL COMMENT '会员密码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态ID，0未审核1正常2锁定',
  `regtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `email` varchar(200) NOT NULL COMMENT '邮箱，可用于取回密码',
  `mobile` varchar(50) NOT NULL COMMENT '手机或电话',
  `code` varchar(255) NOT NULL COMMENT '验证串，可用于取回密码',
  `avatar` varchar(255) NOT NULL COMMENT '会员头像',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='会员管理';

-- ----------------------------
-- Records of pk_user
-- ----------------------------
INSERT INTO `pk_user` VALUES ('23', '2', 'admin', 'e0ae361b631ce089a16f4a4c8cc8d033:5a', '1', '1438668082', '40782502@qq.com', '15818533971', '', 'res/201604/03/0143658fa7928c1c.jpg');
INSERT INTO `pk_user` VALUES ('24', '2', 'seika', '51e87180975db1b7c59a02b4b6bc3c99:3e', '1', '1439398782', 'admin@phpok.com', '15818533972', '', '');
INSERT INTO `pk_user` VALUES ('25', '2', 'demo', 'edd2f2aac34c1bb0c746876bfae9fbf8:ac', '1', '1469963807', 'demo@demo.com', '', '', '');
INSERT INTO `pk_user` VALUES ('26', '2', 'd2', 'defe12aad396f90e6b179c239de260d4:ab', '1', '1469963896', 'ddd@ddd.com', '', '', '');
INSERT INTO `pk_user` VALUES ('27', '2', 'suxiangkun', 'e8eb7ea7212ace80bbc98aa93a17904e:35', '1', '1470033757', 'suxiangkun@126.com', '', '', '');
INSERT INTO `pk_user` VALUES ('28', '2', '18928475010', '44e8f70e59e6b6a2472c241d351428a7:ed', '1', '1481105125', '', '18928475010', '8536-1481439164', '');
INSERT INTO `pk_user` VALUES ('29', '2', 'WX148480971245', 'a6c26f6a231a66b61b410d828f4ab454:03', '1', '1484809712', '', '', '', 'http://wx.qlogo.cn/mmopen/C5MIGaMvBHLg44Juo7PFGnV1Viavz6NnCQcO0UnN7tW6vXLnibFEWpSnoWrpwJnljrfibboQiaric4O8DV8iaNcng1uCjboibkmUXQz/0');

-- ----------------------------
-- Table structure for pk_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `pk_user_ext`;
CREATE TABLE `pk_user_ext` (
  `id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `gender` varchar(255) NOT NULL DEFAULT '' COMMENT '性别',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员扩展字段';

-- ----------------------------
-- Records of pk_user_ext
-- ----------------------------
INSERT INTO `pk_user_ext` VALUES ('23', '苏相锟aa', '1', '');
INSERT INTO `pk_user_ext` VALUES ('0', 'demo', '', '');
INSERT INTO `pk_user_ext` VALUES ('24', '', '', '');
INSERT INTO `pk_user_ext` VALUES ('25', '', '', '');
INSERT INTO `pk_user_ext` VALUES ('26', '', '', '');
INSERT INTO `pk_user_ext` VALUES ('27', '', '', '');
INSERT INTO `pk_user_ext` VALUES ('28', '', '', '');
INSERT INTO `pk_user_ext` VALUES ('29', 'phpok.com-苏相锟', '1', '');

-- ----------------------------
-- Table structure for pk_user_fields
-- ----------------------------
DROP TABLE IF EXISTS `pk_user_fields`;
CREATE TABLE `pk_user_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` varchar(255) NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  `is_edit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不可编辑1可编辑',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of pk_user_fields
-- ----------------------------
INSERT INTO `pk_user_fields` VALUES ('21', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', '1');
INSERT INTO `pk_user_fields` VALUES ('22', '性别', 'gender', 'varchar', '', 'radio', '', 'safe', '', '120', 'a:3:{s:11:\"option_list\";s:5:\"opt:1\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";b:0;}', '1');
INSERT INTO `pk_user_fields` VALUES ('23', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"900\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";}', '0');

-- ----------------------------
-- Table structure for pk_user_group
-- ----------------------------
DROP TABLE IF EXISTS `pk_user_group`;
CREATE TABLE `pk_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员组ID',
  `title` varchar(255) NOT NULL COMMENT '会员组名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0不使用1使用',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1为会员注册默认组',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0' COMMENT '游客组',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1开放供用户选择，0不开放',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `register_status` varchar(100) NOT NULL COMMENT '1通过0审核email邮件code邀请码mobile手机',
  `tbl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '关联验证串项目',
  `fields` text NOT NULL COMMENT '会员字段，多个字段用英文逗号隔开',
  `popedom` longtext NOT NULL COMMENT '权限，包括读写及评论审核',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员组信息管理';

-- ----------------------------
-- Records of pk_user_group
-- ----------------------------
INSERT INTO `pk_user_group` VALUES ('2', '普通会员', '1', '1', '0', '0', '10', '', '0', '', 'a:2:{i:1;s:212:\"read:43,read:87,read:41,read:42,read:147,read:45,read:150,read:96,post:96,read:144,read:151,read:152,post:152,post1:152,reply:152,reply1:152,read:142,post:142,read:148,read:386,post:386,read:389,read:390,read:391\";i:33;s:57:\"read:384,post:384,reply:384,post1:384,reply1:384,read:385\";}');
INSERT INTO `pk_user_group` VALUES ('3', '游客组', '1', '0', '1', '0', '200', '', '0', '', 'a:2:{i:1;s:501:\"read:149,read:87,read:90,read:146,read:92,read:93,read:43,read:41,read:42,read:147,read:45,read:150,read:96,post:96,read:144,read:151,read:152,read:142,post:142,read:148,read:153,read:156,read:157,read:158,post:158,post1:158,read:159,read:160,post:160,reply:160,post1:160,reply1:160,read:161,post:161,reply:161,post1:161,reply1:161,read:162,post:162,reply:162,post1:162,reply1:162,read:163,read:164,post:164,reply:164,post1:164,reply1:164,read:165,read:166,read:386,post:386,read:389,read:390,read:391\";i:33;s:57:\"read:384,post:384,reply:384,post1:384,reply1:384,read:385\";}');

-- ----------------------------
-- Table structure for pk_user_relation
-- ----------------------------
DROP TABLE IF EXISTS `pk_user_relation`;
CREATE TABLE `pk_user_relation` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `introducer` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '介绍人ID',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '介绍时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员介绍关系图';

-- ----------------------------
-- Records of pk_user_relation
-- ----------------------------
INSERT INTO `pk_user_relation` VALUES ('24', '23', '1439398782');
INSERT INTO `pk_user_relation` VALUES ('25', '23', '1469963807');
INSERT INTO `pk_user_relation` VALUES ('26', '24', '1469963896');

-- ----------------------------
-- Table structure for pk_wealth
-- ----------------------------
DROP TABLE IF EXISTS `pk_wealth`;
CREATE TABLE `pk_wealth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '财富ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `title` varchar(100) NOT NULL COMMENT '财产名称',
  `identifier` varchar(100) NOT NULL COMMENT '标识，仅限英文字符',
  `unit` varchar(100) NOT NULL COMMENT '单位名称',
  `dnum` tinyint(1) NOT NULL DEFAULT '0' COMMENT '保留几位小数，为0表示只取整数',
  `ifpay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持充值',
  `pay_ratio` float unsigned NOT NULL DEFAULT '0' COMMENT '兑换比例，即1元可以兑换多少，为0不支持充值，为1表示1：1，不支持小数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，0-255，越小越往前靠',
  `ifcash` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否抵现，即允许财富当现金使用',
  `cash_ratio` float unsigned NOT NULL DEFAULT '0' COMMENT '抵现比例，即100财富值可抵用多少元',
  `ifcheck` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核，为1时表示获取到的财富需要管理员审核后才行',
  `min_val` float unsigned NOT NULL DEFAULT '0' COMMENT '最低使用值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='财富类型';

-- ----------------------------
-- Records of pk_wealth
-- ----------------------------
INSERT INTO `pk_wealth` VALUES ('1', '1', '积分', 'integral', '点', '2', '0', '0', '1', '10', '1', '1', '0', '100');
INSERT INTO `pk_wealth` VALUES ('2', '1', '钱包', 'wallet', '元', '2', '1', '1', '1', '20', '1', '100', '1', '0');
INSERT INTO `pk_wealth` VALUES ('3', '1', '威望', 'prestige', '星', '0', '0', '0', '1', '20', '0', '0', '0', '0');
INSERT INTO `pk_wealth` VALUES ('5', '1', '红包', 'redbao', '个', '2', '0', '0', '1', '30', '1', '1', '0', '100');

-- ----------------------------
-- Table structure for pk_wealth_info
-- ----------------------------
DROP TABLE IF EXISTS `pk_wealth_info`;
CREATE TABLE `pk_wealth_info` (
  `wid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '方案ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID或会员ID或分类ID或项目ID',
  `lasttime` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次更新时间',
  `val` float unsigned NOT NULL DEFAULT '0' COMMENT '最小财富为0，不考虑负数情况',
  PRIMARY KEY (`wid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='财富内容';

-- ----------------------------
-- Records of pk_wealth_info
-- ----------------------------
INSERT INTO `pk_wealth_info` VALUES ('1', '23', '1493627586', '496');
INSERT INTO `pk_wealth_info` VALUES ('1', '24', '1479890664', '2007.8');
INSERT INTO `pk_wealth_info` VALUES ('1', '25', '1470021972', '55');
INSERT INTO `pk_wealth_info` VALUES ('1', '0', '1469963896', '5');
INSERT INTO `pk_wealth_info` VALUES ('1', '26', '1476354571', '3338');
INSERT INTO `pk_wealth_info` VALUES ('1', '27', '1476354482', '3293');
INSERT INTO `pk_wealth_info` VALUES ('2', '23', '1480398064', '38');
INSERT INTO `pk_wealth_info` VALUES ('5', '23', '1480396889', '50');
INSERT INTO `pk_wealth_info` VALUES ('1', '28', '1481105324', '5');
INSERT INTO `pk_wealth_info` VALUES ('1', '29', '1484900526', '2');

-- ----------------------------
-- Table structure for pk_wealth_log
-- ----------------------------
DROP TABLE IF EXISTS `pk_wealth_log`;
CREATE TABLE `pk_wealth_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `wid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '财富ID',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则ID',
  `goal_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '目标会员ID',
  `mid` varchar(100) NOT NULL COMMENT '主键ID关联',
  `val` int(11) NOT NULL DEFAULT '0' COMMENT '不带负号表示增加，带负号表示减去',
  `note` varchar(255) NOT NULL COMMENT '操作摘要',
  `appid` enum('admin','www','api') NOT NULL DEFAULT 'www' COMMENT '来自哪个接口',
  `dateline` int(11) NOT NULL DEFAULT '0' COMMENT '写入时间',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID，为0非会员',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID，为0非管理员',
  `ctrlid` varchar(100) NOT NULL COMMENT '控制器ID',
  `funcid` varchar(100) NOT NULL COMMENT '方法ID',
  `url` varchar(255) NOT NULL COMMENT '执行的URL',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未审核1已审核',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='财富获取或消耗日志';

-- ----------------------------
-- Records of pk_wealth_log
-- ----------------------------
INSERT INTO `pk_wealth_log` VALUES ('1', '1', '5', '23', '', '5', '会员登录', 'www', '1469445274', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('2', '1', '5', '24', '', '5', '会员登录', 'www', '1469445374', '24', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('3', '1', '5', '23', '', '5', '会员登录', 'www', '1469963756', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('4', '1', '2', '25', '', '50', '会员注册', 'api', '1469963807', '0', '1', 'register', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('5', '1', '4', '23', '', '20', '会员注册', 'api', '1469963807', '0', '1', 'register', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('6', '1', '16', '0', '', '10', '会员注册', 'api', '1469963807', '0', '1', 'register', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('7', '1', '17', '0', '', '5', '会员注册', 'api', '1469963807', '0', '1', 'register', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('8', '1', '5', '24', '', '5', '会员登录', 'www', '1469963859', '24', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('9', '1', '2', '26', '', '50', '会员注册', 'api', '1469963896', '0', '1', 'register', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('10', '1', '4', '24', '', '20', '会员注册', 'api', '1469963896', '0', '1', 'register', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('11', '1', '16', '23', '', '10', '会员注册', 'api', '1469963896', '0', '1', 'register', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('12', '1', '17', '0', '', '5', '会员注册', 'api', '1469963896', '0', '1', 'register', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('13', '1', '5', '25', '', '5', '会员登录', 'www', '1470021972', '25', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('14', '1', '5', '27', '', '5', '会员登录', 'www', '1470033786', '27', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('15', '1', '5', '23', '', '5', '会员登录', 'www', '1470033869', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('16', '1', '5', '23', '', '5', '会员登录', 'www', '1470103517', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('17', '2', '0', '23', '', '10', '管理员操作：充值测试', 'admin', '1470117181', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('18', '1', '5', '23', '', '5', '会员登录', 'www', '1470207495', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('19', '1', '5', '23', '', '5', '会员登录', 'www', '1470292107', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('20', '1', '5', '23', '', '5', '会员登录', 'www', '1471330852', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('21', '2', '0', '23', '', '-10', '财富抵现', 'www', '1471334587', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('22', '2', '0', '23', '', '10', '管理员操作：测试', 'admin', '1471334841', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('23', '2', '0', '23', '', '-10', '财富抵现', 'www', '1471334856', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('24', '2', '0', '23', '', '15', '管理员操作：充值', 'admin', '1471335089', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('25', '2', '0', '23', '', '-15', '财富抵现', 'www', '1471335103', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('26', '2', '0', '23', '', '11', '管理员操作：1111', 'admin', '1471335226', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('27', '2', '0', '23', '', '-11', '财富抵现', 'www', '1471335239', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('28', '1', '5', '23', '', '5', '会员登录', 'www', '1471405281', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('29', '1', '5', '23', '', '5', '会员登录', 'www', '1471592328', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('30', '1', '5', '23', '', '5', '会员登录', 'www', '1472782400', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('31', '1', '5', '23', '', '5', '会员登录', 'www', '1473056543', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('32', '1', '5', '23', '', '5', '会员登录', 'www', '1473130556', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('33', '1', '5', '23', '', '5', '会员登录', 'www', '1473299105', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('34', '1', '5', '23', '', '5', '会员登录', 'www', '1473553301', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('35', '1', '5', '23', '', '5', '会员登录', 'www', '1473660827', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('36', '1', '0', '23', '', '-105', '财富抵现', 'www', '1473660928', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('37', '1', '5', '23', '', '5', '会员登录', 'www', '1474273355', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('38', '1', '14', '23', '13', '0', '订单完成赚送积分', 'admin', '1476352896', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('39', '1', '14', '23', '14', '0', '订单完成赚送积分', 'admin', '1476354262', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('40', '1', '14', '23', '15', '0', '订单完成赚送积分', 'admin', '1476354313', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('41', '1', '14', '23', '16', '3288', '订单完成赚送积分', 'admin', '1476354424', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('42', '1', '14', '27', '17', '3288', '订单完成赚送积分', 'admin', '1476354482', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('43', '1', '14', '26', '18', '3288', '订单完成赚送积分', 'admin', '1476354571', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('44', '1', '18', '24', '18', '1973', '订单完成赚送积分', 'admin', '1476354571', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('45', '1', '19', '23', '18', '986', '订单完成赚送积分', 'admin', '1476354571', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('46', '1', '5', '23', '', '5', '会员登录', 'www', '1477989431', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('47', '1', '0', '23', '', '-4284', '财富抵现', 'www', '1477989527', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('48', '1', '5', '23', '', '5', '会员登录', 'api', '1479815656', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('49', '1', '5', '23', '', '5', '会员登录', 'api', '1479889514', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('50', '1', '5', '24', '', '5', '会员登录', 'api', '1479890664', '24', '0', 'login', 'email', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('51', '1', '5', '23', '', '5', '会员登录', 'www', '1479967659', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('52', '1', '5', '23', '', '5', '会员登录', 'www', '1480061079', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('53', '1', '5', '23', '', '5', '会员登录', 'www', '1480127150', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('54', '2', '0', '23', '', '100', '管理员操作：测试支付', 'admin', '1480128296', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('55', '1', '0', '23', '', '100', '管理员操作：赠送积分', 'admin', '1480128318', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('56', '1', '5', '23', '', '5', '会员登录', 'www', '1480214937', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('57', '5', '0', '23', '', '150', '管理员操作：测试', 'admin', '1480223010', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('58', '2', '0', '23', '', '-8', '支付订单：P2016091173U00023003', 'www', '1480247421', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('59', '1', '5', '23', '', '5', '会员登录', 'www', '1480312041', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('60', '1', '12', '23', '1760', '1', '阅读：魅族 MX5 移动联通双4G手机 双卡双待', 'www', '1480328563', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('61', '1', '12', '23', '1803', '1', '阅读：测试视频录入', 'www', '1480328634', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('62', '1', '13', '23', '1803', '5', '管理员审核评论：', 'admin', '1480328772', '0', '1', 'reply', 'status', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('63', '1', '12', '23', '1369', '1', '阅读：金山 WPS - 免费正版办公软件(支持Win/Linux/手机)', 'www', '1480329267', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('64', '1', '13', '23', '1369', '5', '管理员审核评论#40', 'admin', '1480329307', '0', '1', 'reply', 'status', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('65', '1', '12', '23', '1368', '1', '阅读：EverEdit - 值得关注的代码编辑器', 'www', '1480329320', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('66', '1', '13', '23', '1368', '5', '管理员编辑评论#41', 'admin', '1480329350', '0', '1', 'reply', 'edit_save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('67', '1', '15', '23', '1810', '10', '管理员编辑主题发布：测试留言', 'admin', '1480329586', '0', '1', 'list', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('68', '1', '5', '23', '', '5', '会员登录', 'www', '1480390470', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('69', '2', '0', '23', '', '-48', '支付订单：P2016112948U00023001', 'www', '1480395168', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('70', '1', '12', '23', '1763', '1', '阅读#1763', 'www', '1480395259', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('71', '1', '14', '23', '22', '48', '订单完成赚送积分', 'admin', '1480395292', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('72', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480395663', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('73', '1', '0', '23', '', '100', '管理员操作：误操作反还', 'admin', '1480395766', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('74', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480395980', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('75', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480396030', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('76', '5', '0', '23', '', '-100', '财富（红包）抵现', 'www', '1480396339', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('77', '1', '0', '23', '', '200', '管理员操作：测试返还', 'admin', '1480396497', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('78', '5', '0', '23', '', '300', '管理员操作：测试红包', 'admin', '1480396509', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('79', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480396550', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('80', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480396676', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('81', '5', '0', '23', '', '-100', '财富（红包）抵现', 'www', '1480396741', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('82', '5', '0', '23', '', '-100', '财富（红包）抵现', 'www', '1480396832', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('83', '5', '0', '23', '', '-100', '财富（红包）抵现', 'www', '1480396889', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('84', '1', '0', '23', '', '500', '管理员操作：de', 'admin', '1480396926', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('85', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480396966', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('86', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480397059', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('87', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480397786', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('88', '2', '0', '23', '', '-4', '支付订单：P2016112919U00023002', 'www', '1480397788', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('89', '1', '14', '23', '23', '3', '订单完成赚送积分', 'admin', '1480397929', '0', '1', 'order', 'end', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('90', '1', '12', '23', '1762', '1', '阅读#1762', 'www', '1480397939', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('91', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480397971', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('92', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480398062', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('93', '2', '0', '23', '', '-2', '支付订单：P2016112970U00023003', 'www', '1480398064', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('94', '1', '13', '23', '1763', '5', '管理员审核评论#44', 'admin', '1480398899', '0', '1', 'reply', 'status', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('95', '1', '13', '23', '1762', '5', '管理员审核评论#43', 'admin', '1480398911', '0', '1', 'reply', 'status', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('96', '1', '0', '23', '', '500', '管理员操作：测试用的', 'admin', '1480400004', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `pk_wealth_log` VALUES ('97', '1', '12', '23', '1348', '1', '阅读#1348', 'www', '1480401835', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('98', '1', '5', '23', '', '5', '会员登录', 'www', '1480502688', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('99', '1', '5', '23', '', '5', '会员登录', 'www', '1480581367', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('100', '1', '5', '23', '', '5', '会员登录', 'www', '1481082317', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('101', '1', '0', '23', '0', '-100', '财富（积分）抵现', 'www', '1481082923', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `pk_wealth_log` VALUES ('102', '1', '5', '28', '', '5', '会员登录', 'api', '1481105324', '28', '0', 'login', 'sms', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('103', '1', '5', '23', '', '5', '会员登录', 'api', '1481182216', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('104', '1', '5', '23', '', '5', '会员登录', 'www', '1483091256', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('105', '1', '5', '23', '', '5', '会员登录', 'api', '1483677612', '23', '0', 'login', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('106', '1', '12', '29', '1763', '1', '阅读#1763', 'www', '1484897052', '29', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('107', '1', '12', '29', '1756', '1', '阅读#1756', 'www', '1484900526', '29', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('108', '1', '5', '23', '', '5', '会员登录', 'www', '1486363410', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('109', '1', '5', '23', '', '5', '会员登录', 'api', '1487666948', '23', '0', 'login', 'save', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('110', '1', '12', '23', '1753', '1', '阅读#1753', 'www', '1487666977', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('111', '1', '5', '23', '', '5', '会员登录', 'www', '1491448424', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('112', '1', '12', '23', '1810', '1', '阅读#1810', 'www', '1491448441', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('113', '1', '12', '23', '1809', '1', '阅读#1809', 'www', '1491448447', '23', '0', 'content', 'index', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('114', '1', '5', '23', '', '5', '会员登录', 'api', '1491821379', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('115', '1', '5', '23', '', '5', '会员登录', 'api', '1492072570', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `pk_wealth_log` VALUES ('116', '1', '5', '23', '', '5', '会员登录', 'www', '1493627586', '23', '0', 'login', 'ok', '', '1');

-- ----------------------------
-- Table structure for pk_wealth_rule
-- ----------------------------
DROP TABLE IF EXISTS `pk_wealth_rule`;
CREATE TABLE `pk_wealth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `wid` int(10) unsigned NOT NULL COMMENT '财产ID',
  `action` varchar(255) NOT NULL COMMENT '触发动作',
  `val` varchar(255) NOT NULL DEFAULT '0' COMMENT '值，负值表示减，大于0表示加，支持计算如price*2',
  `goal` varchar(255) NOT NULL DEFAULT 'user' COMMENT '目标类型user用户，agent1一级代理',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='财富生成规则';

-- ----------------------------
-- Records of pk_wealth_rule
-- ----------------------------
INSERT INTO `pk_wealth_rule` VALUES ('4', '1', 'register', '20', 'introducer', '20');
INSERT INTO `pk_wealth_rule` VALUES ('2', '1', 'register', '50', 'user', '10');
INSERT INTO `pk_wealth_rule` VALUES ('5', '1', 'login', '5', 'user', '30');
INSERT INTO `pk_wealth_rule` VALUES ('12', '1', 'content', '1', 'user', '40');
INSERT INTO `pk_wealth_rule` VALUES ('13', '1', 'comment', '5', 'user', '50');
INSERT INTO `pk_wealth_rule` VALUES ('14', '1', 'payment', 'price', 'user', '60');
INSERT INTO `pk_wealth_rule` VALUES ('15', '1', 'post', '10', 'user', '70');
INSERT INTO `pk_wealth_rule` VALUES ('16', '1', 'register', '10', 'introducer2', '25');
INSERT INTO `pk_wealth_rule` VALUES ('17', '1', 'register', '5', 'introducer3', '28');
INSERT INTO `pk_wealth_rule` VALUES ('18', '1', 'payment', 'price*0.6', 'introducer', '62');
INSERT INTO `pk_wealth_rule` VALUES ('19', '1', 'payment', 'price*0.3', 'introducer2', '65');
INSERT INTO `pk_wealth_rule` VALUES ('20', '1', 'payment', 'price*0.1', 'introducer3', '68');

-- ----------------------------
-- Table structure for pk_workflow
-- ----------------------------
DROP TABLE IF EXISTS `pk_workflow`;
CREATE TABLE `pk_workflow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '指派谁来管理的管理员ID',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_end` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否结束',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `note` varchar(255) NOT NULL,
  `actting` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1正在操作处理中',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='工作流处理';

-- ----------------------------
-- Records of pk_workflow
-- ----------------------------

-- ----------------------------
-- Table structure for qinggan_adm
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_adm`;
CREATE TABLE `qinggan_adm` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID，系统自增',
  `account` varchar(50) NOT NULL COMMENT '管理员账号',
  `pass` varchar(100) NOT NULL COMMENT '管理员密码',
  `email` varchar(50) NOT NULL COMMENT '管理员邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核1正常2管理员锁定',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统管理员',
  `vpass` varchar(50) NOT NULL COMMENT '二次验证密码，两次MD5加密',
  `fullname` varchar(100) NOT NULL COMMENT '姓名',
  `close_tip` varchar(255) NOT NULL COMMENT '关闭窗口前弹出的提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员信息';

-- ----------------------------
-- Records of qinggan_adm
-- ----------------------------
INSERT INTO `qinggan_adm` VALUES ('1', 'admin', '588e57b852a16b297af73ae818065474:13', 'admin', '1', '1', '', '', '');

-- ----------------------------
-- Table structure for qinggan_adm_popedom
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_adm_popedom`;
CREATE TABLE `qinggan_adm_popedom` (
  `id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '权限ID，对应popedom表里的id',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员权限分配表';

-- ----------------------------
-- Records of qinggan_adm_popedom
-- ----------------------------

-- ----------------------------
-- Table structure for qinggan_all
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_all`;
CREATE TABLE `qinggan_all` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `identifier` varchar(100) NOT NULL COMMENT '标识串',
  `title` varchar(200) NOT NULL COMMENT '分类名称',
  `ico` varchar(255) NOT NULL COMMENT '图标',
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通１系统',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否前台调用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='分类管理';

-- ----------------------------
-- Records of qinggan_all
-- ----------------------------
INSERT INTO `qinggan_all` VALUES ('4', '1', 'copyright', '页脚版权', 'images/ico/copyright.png', '0', '1');
INSERT INTO `qinggan_all` VALUES ('37', '1', 'share', '分享代码', 'images/ico/share.png', '0', '1');

-- ----------------------------
-- Table structure for qinggan_attr
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_attr`;
CREATE TABLE `qinggan_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `title` varchar(100) NOT NULL COMMENT '属性名称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='产品属性';

-- ----------------------------
-- Records of qinggan_attr
-- ----------------------------
INSERT INTO `qinggan_attr` VALUES ('1', '1', '颜色', '10');
INSERT INTO `qinggan_attr` VALUES ('3', '1', '尺码', '20');
INSERT INTO `qinggan_attr` VALUES ('8', '1', '版本', '30');

-- ----------------------------
-- Table structure for qinggan_attr_values
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_attr_values`;
CREATE TABLE `qinggan_attr_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '属性ID',
  `title` varchar(200) NOT NULL COMMENT '参数名称',
  `pic` varchar(200) NOT NULL COMMENT '参数图片',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `val` varchar(255) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='属性参数管理';

-- ----------------------------
-- Records of qinggan_attr_values
-- ----------------------------
INSERT INTO `qinggan_attr_values` VALUES ('1', '1', '红色', '', '10', 'red');
INSERT INTO `qinggan_attr_values` VALUES ('3', '1', '绿色', '', '20', 'green');
INSERT INTO `qinggan_attr_values` VALUES ('4', '1', '蓝色', '', '30', 'blue');
INSERT INTO `qinggan_attr_values` VALUES ('5', '1', '黑色', '', '40', 'black');
INSERT INTO `qinggan_attr_values` VALUES ('6', '1', '白色', '', '50', 'white');
INSERT INTO `qinggan_attr_values` VALUES ('7', '3', 'M', '', '10', '');
INSERT INTO `qinggan_attr_values` VALUES ('8', '3', 'L', '', '20', '');
INSERT INTO `qinggan_attr_values` VALUES ('9', '3', 'XL', '', '30', '');
INSERT INTO `qinggan_attr_values` VALUES ('10', '3', 'XXL', '', '40', '');
INSERT INTO `qinggan_attr_values` VALUES ('29', '8', '标准版(3G RAM+32G ROM)标配', '', '10', '2499');
INSERT INTO `qinggan_attr_values` VALUES ('30', '8', '标准版(3G RAM+32G ROM)套装', '', '20', '2549');
INSERT INTO `qinggan_attr_values` VALUES ('31', '8', '高配版(3G RAM+64G ROM)标配', '', '30', '3199');
INSERT INTO `qinggan_attr_values` VALUES ('32', '8', '高配版(3G RAM+64G ROM)套装', '', '40', '3249');
INSERT INTO `qinggan_attr_values` VALUES ('33', '1', '金色', '', '60', 'gold');
INSERT INTO `qinggan_attr_values` VALUES ('34', '8', '16G ROM', '', '50', 'MZ16G');
INSERT INTO `qinggan_attr_values` VALUES ('35', '8', '32G ROM', '', '60', 'MZ32G');
INSERT INTO `qinggan_attr_values` VALUES ('36', '1', '灰色', '', '70', 'gray');
INSERT INTO `qinggan_attr_values` VALUES ('37', '8', '64G ROM', '', '70', '64G');

-- ----------------------------
-- Table structure for qinggan_cart
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_cart`;
CREATE TABLE `qinggan_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `session_id` varchar(255) NOT NULL COMMENT 'SESSION_ID号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示游客',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of qinggan_cart
-- ----------------------------
INSERT INTO `qinggan_cart` VALUES ('247', '5ma6debnofd5lu0e4l9lvt4h05', '23', '1493628150');
INSERT INTO `qinggan_cart` VALUES ('248', 'dus6fo8cb2m8ld08hj3oa21gi6', '0', '1495608098');

-- ----------------------------
-- Table structure for qinggan_cart_product
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_cart_product`;
CREATE TABLE `qinggan_cart_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `cart_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购物车ID号',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `title` varchar(255) NOT NULL COMMENT '产品名称',
  `price` float NOT NULL COMMENT '产品单价',
  `qty` int(11) NOT NULL DEFAULT '0' COMMENT '产品数量',
  `ext` text NOT NULL COMMENT '扩展属性',
  `weight` float unsigned NOT NULL DEFAULT '0' COMMENT '重量',
  `volume` float unsigned NOT NULL DEFAULT '0' COMMENT '体积',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `is_virtual` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0实物1虚拟或服务',
  `unit` varchar(50) NOT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='购物车里的产品信息';

-- ----------------------------
-- Records of qinggan_cart_product
-- ----------------------------

-- ----------------------------
-- Table structure for qinggan_cate
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_cate`;
CREATE TABLE `qinggan_cate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID，0为根分类',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1正常使用',
  `title` varchar(200) NOT NULL COMMENT '分类名称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '分类排序，值越小越往前靠',
  `tpl_list` varchar(255) NOT NULL COMMENT '列表模板',
  `tpl_content` varchar(255) NOT NULL COMMENT '内容模板',
  `psize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '列表每页数量',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `identifier` varchar(255) NOT NULL COMMENT '分类标识串',
  `tag` varchar(255) NOT NULL COMMENT '自身Tag设置',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `site_id` (`site_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=592 DEFAULT CHARSET=utf8 COMMENT='分类管理';

-- ----------------------------
-- Records of qinggan_cate
-- ----------------------------
INSERT INTO `qinggan_cate` VALUES ('8', '1', '7', '1', '公司新闻', '10', '', '', '0', '', '', '', 'company', '公司 新闻');
INSERT INTO `qinggan_cate` VALUES ('7', '1', '0', '1', '新闻资讯', '10', '', '', '0', '', '', '', 'information', '');
INSERT INTO `qinggan_cate` VALUES ('68', '1', '7', '1', '行业新闻', '25', '', '', '0', '', '', '', 'industry', '');
INSERT INTO `qinggan_cate` VALUES ('70', '1', '0', '1', '产品分类', '20', '', '', '0', '', '', '', 'chanpinfenlei', '');
INSERT INTO `qinggan_cate` VALUES ('154', '1', '0', '1', '图集相册', '30', '', '', '0', '', '', '', 'album', '');
INSERT INTO `qinggan_cate` VALUES ('168', '1', '70', '1', '手机', '10', '', '', '0', '', '', '', 'shouji', '');
INSERT INTO `qinggan_cate` VALUES ('180', '1', '70', '1', '产品分类二', '20', '', '', '0', '', '', '', 'chanpinfenleier', '');
INSERT INTO `qinggan_cate` VALUES ('197', '1', '0', '1', '资源下载', '40', '', '', '0', '', '', '', 'ziyuanxiazai', '');
INSERT INTO `qinggan_cate` VALUES ('198', '1', '197', '1', '软件下载', '10', '', '', '0', '', '', '', 'ruanjianxiazai', '');
INSERT INTO `qinggan_cate` VALUES ('199', '1', '197', '1', '风格下载', '20', '', '', '0', '', '', '', 'fenggexiazai', '');
INSERT INTO `qinggan_cate` VALUES ('200', '1', '197', '1', '官方插件', '30', '', '', '0', '', '', '', 'guanfangchajian', '');
INSERT INTO `qinggan_cate` VALUES ('201', '1', '0', '1', '论坛分类', '50', '', '', '0', '', '', '', 'bbs-cate', '');
INSERT INTO `qinggan_cate` VALUES ('204', '1', '201', '1', '情感驿站', '10', '', '', '0', '', '', '', 'qingganyizhan', '');
INSERT INTO `qinggan_cate` VALUES ('205', '1', '201', '1', '产品讨论', '20', '', '', '0', '', '', '', 'chanpintaolun', '');
INSERT INTO `qinggan_cate` VALUES ('206', '1', '201', '1', '水吧专区', '30', '', '', '0', '', '', '', 'shuibazhuanqu', '');
INSERT INTO `qinggan_cate` VALUES ('207', '1', '201', '1', '常见问题', '30', '', '', '0', '', '', '', 'faq', '');
INSERT INTO `qinggan_cate` VALUES ('211', '1', '154', '1', '手机美图', '10', '', '', '0', '', '', '', 'shoujimeitu', '');
INSERT INTO `qinggan_cate` VALUES ('216', '1', '168', '1', '苹果', '50', '', '', '0', '', '', '', 'apple', '');
INSERT INTO `qinggan_cate` VALUES ('219', '1', '70', '1', '产品分类三', '30', '', '', '0', '', '', '', 'chanpinfenleisan', '');
INSERT INTO `qinggan_cate` VALUES ('584', '1', '168', '1', '华为', '30', '', '', '0', '', '', '', 'huawei', '');
INSERT INTO `qinggan_cate` VALUES ('582', '1', '168', '1', '小米', '10', '', '', '0', '', '', '', 'xiaomi', '');
INSERT INTO `qinggan_cate` VALUES ('583', '1', '168', '1', '魅族', '20', '', '', '0', '', '', '', 'meizu', '');
INSERT INTO `qinggan_cate` VALUES ('585', '1', '168', '1', 'Vivo', '40', '', '', '0', '', '', '', 'vivo', '');
INSERT INTO `qinggan_cate` VALUES ('588', '1', '583', '1', '经典', '5', '', '', '0', '', '', '', 'jingdian', '');
INSERT INTO `qinggan_cate` VALUES ('589', '1', '583', '1', '旗舰', '10', '', '', '0', '', '', '', 'qijian', '');
INSERT INTO `qinggan_cate` VALUES ('590', '1', '588', '1', 'MX2', '5', '', '', '0', '', '', '', 'mx2', '');
INSERT INTO `qinggan_cate` VALUES ('591', '1', '588', '1', 'MX3', '10', '', '', '0', '', '', '', 'mx3', '');

-- ----------------------------
-- Table structure for qinggan_currency
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_currency`;
CREATE TABLE `qinggan_currency` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '货币ID',
  `code` varchar(3) NOT NULL COMMENT '货币标识，仅限三位数的大写字母',
  `val` float(13,8) unsigned NOT NULL COMMENT '货币转化',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `title` varchar(50) NOT NULL COMMENT '名称',
  `symbol_left` varchar(24) NOT NULL COMMENT '价格左侧',
  `symbol_right` varchar(24) NOT NULL COMMENT '价格右侧',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不隐藏1隐藏',
  `code_num` varchar(5) NOT NULL COMMENT '币种数值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='货币管理';

-- ----------------------------
-- Records of qinggan_currency
-- ----------------------------
INSERT INTO `qinggan_currency` VALUES ('1', 'CNY', '6.16989994', '10', '人民币', '', '元', '1', '0', '165');
INSERT INTO `qinggan_currency` VALUES ('2', 'USD', '1.00000000', '20', '美金', 'US$', '', '1', '0', '840');
INSERT INTO `qinggan_currency` VALUES ('3', 'HKD', '7.76350021', '30', '港元', 'HK$', '', '1', '0', '344');
INSERT INTO `qinggan_currency` VALUES ('4', 'EUR', '0.76639998', '40', '欧元', 'EUR', '', '1', '0', '978');
INSERT INTO `qinggan_currency` VALUES ('5', 'GBP', '0.64529997', '50', '英镑', '￡', '', '1', '0', '826');
INSERT INTO `qinggan_currency` VALUES ('7', 'AUD', '1.00000000', '60', '澳币', 'A$', '', '1', '0', '036');

-- ----------------------------
-- Table structure for qinggan_email
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_email`;
CREATE TABLE `qinggan_email` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID，0表示全部网站',
  `identifier` varchar(255) NOT NULL COMMENT '发送标识',
  `title` varchar(200) NOT NULL COMMENT '邮件主题',
  `content` text NOT NULL COMMENT '邮件内容',
  `note` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='邮件内容';

-- ----------------------------
-- Records of qinggan_email
-- ----------------------------
INSERT INTO `qinggan_email` VALUES ('4', '1', 'register_code', '获取会员注册资格', '<p>您好，{$email}</p><p>您将注册成为网站【{$config.title} 】会员，请点击下面的地址，进入下一步注册：</p><p><br/></p><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><p><a href=\"{$link}\" target=\"_blank\">{$link}</a></p><p>（此链接24小时内有效）</p></blockquote><p><br/></p><p><br/></p><p>感谢您对本站的关注，茫茫人海中，能有缘走到一起。</p>', '');
INSERT INTO `qinggan_email` VALUES ('5', '1', 'getpass', '取回密码操作', '<p>您好，{$user.account}</p><p>您执行了忘记密码操作功能，请点击下面的链接执行下一步：</p><p><br /></p><p><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><p><a href=\"{$link}\" target=\"_blank\">{$link}</a></p></blockquote><br /></p><p>感谢您对本站的支持，有什么问题您在登录后可以咨询我们的客服。</p>', '');
INSERT INTO `qinggan_email` VALUES ('6', '1', 'project_save', '主题添加通知', '<p>您好，管理员</p><blockquote><p>您的网站（<a href=\"http://{$sys.url}\" target=\"_self\">{$sys.url}</a>）新增了一篇主题，下述是主题的基本信息：<br/></p><p>主题名称：{$rs.title}</p><p>项目类型：{$page_rs.title}</p><p><br/></p><p>请登录网站查询</p></blockquote>', '');
INSERT INTO `qinggan_email` VALUES ('7', '1', 'order_admin', '网站有新订单【{$order.sn}】', '<p>您好，管理员</p><blockquote><p>您的网站：{$sys.url} 收到一份新的订单，订单号是：{$order.sn}，请登录网站后台进行核验。</p></blockquote>', '');
INSERT INTO `qinggan_email` VALUES ('8', '1', 'user_order_create', '我们已收到您的订单【{$order.sn}】，欢迎您随时关注订单状态', '<p><strong>尊敬的{$fullname}，您好：</strong><br/></p><p><br/></p><p>感谢您在<span style=\"color: rgb(0, 112, 192);\">{$config.title}</span>（{$sys.url}）购物。</p><p>我们已经收到您的订单<span style=\"color: rgb(0, 112, 192);\">{$order.sn}</span>，建议您选择<span style=\"color: rgb(0, 112, 192);\">在线支付</span>的支付配送方式。订单信息以个人中心里的“<span style=\"color: rgb(0, 112, 192);\"><strong>我的订单</strong></span>”信息为准，您也可以随时进入订单详细进行查看修改等操作。</p><p><br/></p><p><strong>重要说明：</strong></p><p>本邮件仅表明销售方已收到了您提交的订单；销售方收到你的订单信息后，只有在销售方将您的订单中订购的商品从仓库实际直接向您发出时（以商品出库为标志），方视为您与销售方之间就实际直接向您发出的商品建立了合同关系；<br/>如果您在一份订单里订购了多种商品并且销售方只给您发出了部分商品时，您与销售方之间仅就实际直接向您发出的商品建立了合同关系；只有在销售方实际直接向您发出了订单中订购的其他商品时，您和销售方之间就订单中该其他已实际直接向您发出的商品建立了合同关系。<br/>您可以随时登陆您在京东注册的账户，查询您的订单状态。更多内容请见最新的京东网站用户注册协议及京东网站各类购物规则，我们建议您不时地浏览阅读。</p><p><br/></p><p><strong>账户安全提醒：</strong><br/>互联网账号存在被盗风险，为了保障您的账号及资金安全，我们提醒您访问 我的账户- &gt; 修改密码，尽量使用复杂密码，如字母+数字+特殊符号等。</p>', '');
INSERT INTO `qinggan_email` VALUES ('9', '1', 'sms_order_create', '会员下单成功后，短信通知', '<p>您的订单：{$order.sn} 已成功提交，请您及时完成支付操作。超过24小时未支付订单将会自动删除。感谢您对我们的支持！</p>', '');
INSERT INTO `qinggan_email` VALUES ('10', '1', 'order_user_paid', '您的订单【{$order.sn}】已支付成功', '<p><strong>尊敬的{$fullname}，您好：</strong></p><p style=\"white-space: normal;\">感谢您在<span style=\"color: rgb(0, 112, 192);\">{$config.title}</span>（{$sys.url}）购物。</p><p style=\"white-space: normal;\">您的订单<span style=\"color: rgb(0, 112, 192);\">{$order.sn}</span>已成功支付，请耐心等候，我们管理员正在核验付款信息。</p><p style=\"white-space: normal;\">订单信息以个人中心里的“<span style=\"color: rgb(0, 112, 192);\"><strong>我的订单</strong></span>”信息为准，您也可以随时进入订单详细进行查看修改等操作。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>重要说明：</strong></p><p style=\"white-space: normal;\">本邮件仅表明销售方已收到了您提交的订单；销售方收到你的订单信息后，只有在销售方将您的订单中订购的商品从仓库实际直接向您发出时（以商品出库为标志），方视为您与销售方之间就实际直接向您发出的商品建立了合同关系；<br/>如果您在一份订单里订购了多种商品并且销售方只给您发出了部分商品时，您与销售方之间仅就实际直接向您发出的商品建立了合同关系；只有在销售方实际直接向您发出了订单中订购的其他商品时，您和销售方之间就订单中该其他已实际直接向您发出的商品建立了合同关系。<br/>您可以随时登陆您在京东注册的账户，查询您的订单状态。更多内容请见最新的京东网站用户注册协议及京东网站各类购物规则，我们建议您不时地浏览阅读。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>账户安全提醒：</strong><br/>互联网账号存在被盗风险，为了保障您的账号及资金安全，我们提醒您访问 我的账户- &gt; 修改密码，尽量使用复杂密码，如字母+数字+特殊符号等。</p><p><br/></p>', '');
INSERT INTO `qinggan_email` VALUES ('11', '1', 'order_admin_paid', '客户{$user.user}订单【{$orser.sn}】付款成功', '<p>您好，管理员，请登录网站后台 {$sys.url} 核验订单【{$orser.sn}】支付是否成功</p>', '');
INSERT INTO `qinggan_email` VALUES ('12', '1', 'sms_order_paid', '订单付款成功后的通知', '<p>您的订单：{$order.sn} 已成功付款，我们正在核验中，请耐心等候！</p>', '');
INSERT INTO `qinggan_email` VALUES ('13', '1', 'order_user_shipped', '您的订单【{$order.sn}】已发货', '<p style=\"white-space: normal;\"><strong>尊敬的{$fullname}，您好：</strong><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">感谢您在<span style=\"color: rgb(0, 112, 192);\">{$config.title}</span>（{$sys.url}）购物。</p><p style=\"white-space: normal;\">您的订单<span style=\"color: rgb(0, 112, 192);\">{$order.sn}</span>已经发货，请保持您的电话畅通，以方便快递人员能与您取得联系。</p><p style=\"white-space: normal;\">订单信息以个人中心里的“<span style=\"color: rgb(0, 112, 192);\"><strong>我的订单</strong></span>”信息为准，您也可以随时进入订单详细进行查看修改等操作。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>重要说明：</strong></p><p style=\"white-space: normal;\">本邮件仅表明销售方已收到了您提交的订单；销售方收到你的订单信息后，只有在销售方将您的订单中订购的商品从仓库实际直接向您发出时（以商品出库为标志），方视为您与销售方之间就实际直接向您发出的商品建立了合同关系；<br/>如果您在一份订单里订购了多种商品并且销售方只给您发出了部分商品时，您与销售方之间仅就实际直接向您发出的商品建立了合同关系；只有在销售方实际直接向您发出了订单中订购的其他商品时，您和销售方之间就订单中该其他已实际直接向您发出的商品建立了合同关系。<br/>您可以随时登陆您在京东注册的账户，查询您的订单状态。更多内容请见最新的京东网站用户注册协议及京东网站各类购物规则，我们建议您不时地浏览阅读。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>账户安全提醒：</strong><br/>互联网账号存在被盗风险，为了保障您的账号及资金安全，我们提醒您访问 我的账户- &gt; 修改密码，尽量使用复杂密码，如字母+数字+特殊符号等。</p><p><br/></p>', '');
INSERT INTO `qinggan_email` VALUES ('14', '1', 'sms_order_shipped', '订单发货短信通知', '您的订单：{$order.sn} 已经发货，请保持电话畅通，以方便快递人员能与您取得联系。', '');
INSERT INTO `qinggan_email` VALUES ('15', '1', 'order_admin_recerved', '订单【{$order.sn}】已确认收货', '<p>您好，管理员，客户已对订单【{$order.sn}】执行确认收货操作，请登录后台核验</p>', '');
INSERT INTO `qinggan_email` VALUES ('16', '1', 'email_code', '【{$config.title}】邮件验证码', '<p>你的验证码是：{$code}，三十分钟内有效，请及时输入</p>', '');
INSERT INTO `qinggan_email` VALUES ('17', '1', 'sms_code', '短信验证码', '您的验证码：{$code}，请在10分钟内输入【微光互助】', '');
INSERT INTO `qinggan_email` VALUES ('18', '1', 'sms_paid_admin', '订单成功后管理员', '订单：{$order.sn}，客户已支付成功，请检查', '');
INSERT INTO `qinggan_email` VALUES ('34', '1', 'login_email', '会员登录验证码', '<p>您的登录验证码是：</p><p><br/></p><p>    {$code}<br/></p><p><br/></p>', '');
INSERT INTO `qinggan_email` VALUES ('35', '1', 'sms_sendcloud_code', '4575', 'code:{$code}', 'SendCloud使用的验证码');
INSERT INTO `qinggan_email` VALUES ('36', '1', 'sms_aliyun_test', 'SMS_49105038', 'customer:{$user.user}', '阿里云短信测试');
INSERT INTO `qinggan_email` VALUES ('37', '1', 'sms_61825160', 'SMS_61825160', 'code:{$code}', '阿里去：验证码');
INSERT INTO `qinggan_email` VALUES ('38', '1', 'email_toall', '您的留言 #{$rs.id}，管理员已经回复', '<p>您好：{$rs.fullname}，您在我们网站上的留言，管理员已经回复了，您可以下面链接进行查看：</p><blockquote><p><a href=\"{$sys.url}{$rs.id}.html\" target=\"_blank\">{$sys.url}{$rs.id}.html</a><br/></p></blockquote><p>感谢您对我们网站（{$config.title}）的认可。</p><p><br/></p><p>您的支持是我们发展的动力</p><p><img src=\"{$sys.url}res/201704/22/auto_1092.png\" style=\"width: 500px;\"/></p>', '留言回复通知');

-- ----------------------------
-- Table structure for qinggan_express
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_express`;
CREATE TABLE `qinggan_express` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID，为0所有站点使用',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `company` varchar(255) NOT NULL COMMENT '公司名称',
  `homepage` varchar(255) NOT NULL COMMENT '官方网站',
  `code` varchar(100) NOT NULL COMMENT '接口标识，用于读取logistics文件夹下的接口文件',
  `rate` int(11) NOT NULL DEFAULT '6' COMMENT '查询频率，用于减少请求',
  `ext` text NOT NULL COMMENT '扩展数据保存',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='快递平台管理';

-- ----------------------------
-- Records of qinggan_express
-- ----------------------------
INSERT INTO `qinggan_express` VALUES ('1', '1', '宅急送-官方', '北京宅急送快运股份有限公司', 'http://www.zjs.com.cn/', 'zjs', '4', 'a:3:{s:18:\"logisticProviderID\";s:14:\"NanFang_LianHe\";s:7:\"keyseed\";s:36:\"86AF9251-F3A4-40AF-B9CC-7E509B303F9A\";s:12:\"fixed_string\";s:13:\"z宅J急S送g\";}');
INSERT INTO `qinggan_express` VALUES ('4', '1', '顺丰速运', '顺丰速运(集团)有限公司', 'http://www.sf-express.com/', 'showapi', '4', 'a:3:{s:6:\"app_id\";s:4:\"4485\";s:10:\"app_secret\";s:32:\"95a43a307f51416980ff86cae4c70f4e\";s:7:\"app_com\";s:8:\"shunfeng\";}');

-- ----------------------------
-- Table structure for qinggan_ext
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_ext`;
CREATE TABLE `qinggan_ext` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `module` varchar(100) NOT NULL COMMENT '模块',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` text NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  PRIMARY KEY (`id`),
  KEY `module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=817 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of qinggan_ext
-- ----------------------------
INSERT INTO `qinggan_ext` VALUES ('35', 'all-4', '内容', 'content', 'longtext', '', 'code_editor', '', 'html_js', '', '90', 'a:2:{s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"200\";}');
INSERT INTO `qinggan_ext` VALUES ('221', 'project-148', '二维码图片', 'barcode', 'varchar', '请上传相应的二维码图片', 'upload', '', '', '', '255', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `qinggan_ext` VALUES ('805', 'list-1757', '企业名称', 'company', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";}');
INSERT INTO `qinggan_ext` VALUES ('806', 'list-1757', '公司地址', 'address', 'varchar', '请填写您的办公地址', 'text', '', 'safe', '', '79', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `qinggan_ext` VALUES ('807', 'list-1757', 'Email', 'email', 'varchar', '请填写联系邮箱，用户方便客户与您取得联系', 'text', '', 'safe', '', '50', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:0:\"\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `qinggan_ext` VALUES ('229', 'project-45', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `qinggan_ext` VALUES ('227', 'project-87', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `qinggan_ext` VALUES ('218', 'project-43', '英文标题En-Title', 'entitle', 'varchar', '', 'text', '', 'safe', '', '10', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";}');
INSERT INTO `qinggan_ext` VALUES ('219', 'project-43', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:6:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"0\";}');
INSERT INTO `qinggan_ext` VALUES ('230', 'project-150', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";}');
INSERT INTO `qinggan_ext` VALUES ('231', 'all-37', '百度分享代码', 'baidu', 'longtext', '', 'code_editor', '', 'html_js', '', '10', 'a:2:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"300\";}');
INSERT INTO `qinggan_ext` VALUES ('236', 'project-96', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `qinggan_ext` VALUES ('237', 'project-151', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `qinggan_ext` VALUES ('238', 'cate-204', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}');
INSERT INTO `qinggan_ext` VALUES ('239', 'project-152', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:11:\"upload_type\";s:7:\"picture\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";}');
INSERT INTO `qinggan_ext` VALUES ('240', 'cate-205', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}');
INSERT INTO `qinggan_ext` VALUES ('241', 'cate-206', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}');
INSERT INTO `qinggan_ext` VALUES ('244', 'project-144', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}');
INSERT INTO `qinggan_ext` VALUES ('246', 'project-142', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}');
INSERT INTO `qinggan_ext` VALUES ('259', 'cate-207', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}');
INSERT INTO `qinggan_ext` VALUES ('808', 'list-1757', '客服电话', 'tel', 'varchar', '请填写客服电话，建议填写400号', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `qinggan_ext` VALUES ('809', 'list-1757', '联系人', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `qinggan_ext` VALUES ('276', 'cate-70', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}');
INSERT INTO `qinggan_ext` VALUES ('277', 'project-151', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}');
INSERT INTO `qinggan_ext` VALUES ('810', 'list-1756', '图片', 'pic', 'varchar', '此图片仅在首页调用中显示，限制宽高为120x150', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:5:\"image\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}');
INSERT INTO `qinggan_ext` VALUES ('811', 'list-1756', '摘要', 'note', 'longtext', '支持HTML，仅在首页显示，请注意长度', 'editor', '', 'html', '', '20', 'a:13:{s:5:\"width\";s:0:\"\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:0:\"\";s:9:\"btn_video\";s:0:\"\";s:8:\"btn_file\";s:0:\"\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:6:\"simple\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";}');
INSERT INTO `qinggan_ext` VALUES ('812', 'list-1757', '邮编', 'zipcode', 'varchar', '请填写六位数字的邮编号码', 'text', '', 'safe', '', '30', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}');
INSERT INTO `qinggan_ext` VALUES ('815', 'cate-582', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}');

-- ----------------------------
-- Table structure for qinggan_extc
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_extc`;
CREATE TABLE `qinggan_extc` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容值ID，对应ext表中的id',
  `content` longtext NOT NULL COMMENT '内容文本',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展字段内容维护';

-- ----------------------------
-- Records of qinggan_extc
-- ----------------------------
INSERT INTO `qinggan_extc` VALUES ('35', 'Powered By phpok.com 版权所有 © 2004-2014, All right reserved.');
INSERT INTO `qinggan_extc` VALUES ('809', '苏先生');
INSERT INTO `qinggan_extc` VALUES ('808', '15818533971');
INSERT INTO `qinggan_extc` VALUES ('807', 'admin@phpok.com');
INSERT INTO `qinggan_extc` VALUES ('806', '广东深圳市罗湖区东盛路辐照中心7栋3楼');
INSERT INTO `qinggan_extc` VALUES ('805', '深圳市锟铻科技有限公司');
INSERT INTO `qinggan_extc` VALUES ('810', 'res/201409/03/5b0086d14de1bbf2.jpg');
INSERT INTO `qinggan_extc` VALUES ('811', '<p>深圳市锟铻科技有限公司（Shenzhen Kunwu Technology Co., Ltd.）创立于2014年，专注于企业网站技术的研究和开发，是国内最有影响力的企业网站技术提供商。</p><p>锟铻科技成长的过程，就是服务客户并和客户一起不断成功的过程！我们用心、努力作好每一件事，满怀信心迎接每一次挑战。</p>');
INSERT INTO `qinggan_extc` VALUES ('229', '1007');
INSERT INTO `qinggan_extc` VALUES ('227', '1006');
INSERT INTO `qinggan_extc` VALUES ('218', 'News');
INSERT INTO `qinggan_extc` VALUES ('219', '');
INSERT INTO `qinggan_extc` VALUES ('221', '629');
INSERT INTO `qinggan_extc` VALUES ('230', '<h3>正品行货</h3><p>商城向您保证所售商品均为正品行货，自营商品开具机打发票或电子发票。</p><h3>全国联保</h3><p>凭质保证书及发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由京东联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！ </p><p>注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</p><h3>无忧退换货</h3><p>客户购买自营商品7日内（含7日，自客户收到商品之日起计算），在保证商品完好的前提下，可无理由退货。（部分商品除外，详情请见各商品细则）</p>');
INSERT INTO `qinggan_extc` VALUES ('231', '<div class=\"bdsharebuttonbox\"><a href=\"#\" class=\"bds_more\" data-cmd=\"more\">分享到：</a><a href=\"#\" class=\"bds_qzone\" data-cmd=\"qzone\" title=\"分享到QQ空间\">QQ空间</a><a href=\"#\" class=\"bds_tsina\" data-cmd=\"tsina\" title=\"分享到新浪微博\">新浪微博</a><a href=\"#\" class=\"bds_tqq\" data-cmd=\"tqq\" title=\"分享到腾讯微博\">腾讯微博</a><a href=\"#\" class=\"bds_weixin\" data-cmd=\"weixin\" title=\"分享到微信\">微信</a></div><script>window._bd_share_config={\"common\":{\"bdSnsKey\":{},\"bdText\":\"\",\"bdMini\":\"2\",\"bdMiniList\":false,\"bdPic\":\"\",\"bdStyle\":\"1\",\"bdSize\":\"32\"},\"share\":{\"bdSize\":16}};with(document)0[(getElementsByTagName(\'head\')[0]||body).appendChild(createElement(\'script\')).src=\'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=\'+~(-new Date()/36e5)];</script>');
INSERT INTO `qinggan_extc` VALUES ('237', '');
INSERT INTO `qinggan_extc` VALUES ('238', '本区以讨论各种感情，各类人生为核心主题心灵鸡汤无处不在，不在于多少，只在于感悟懂了就是懂了，不懂仍然不懂');
INSERT INTO `qinggan_extc` VALUES ('236', '545');
INSERT INTO `qinggan_extc` VALUES ('239', '545');
INSERT INTO `qinggan_extc` VALUES ('240', '围绕我公司提供的产品进行讨论广开言路，我公司会虚心接纳，完善产品');
INSERT INTO `qinggan_extc` VALUES ('241', '吐吐糟，发发牢骚，八卦精神无处不在笑一笑，十年少，在这个快节奏的时代里，这里还有一片净土供您休息不是我不爱，只是世界变化快^o^');
INSERT INTO `qinggan_extc` VALUES ('244', 'Photos');
INSERT INTO `qinggan_extc` VALUES ('246', 'Links');
INSERT INTO `qinggan_extc` VALUES ('259', '关于常见问题');
INSERT INTO `qinggan_extc` VALUES ('276', 'Categories');
INSERT INTO `qinggan_extc` VALUES ('277', 'Download');
INSERT INTO `qinggan_extc` VALUES ('812', '518000');

-- ----------------------------
-- Table structure for qinggan_fav
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_fav`;
CREATE TABLE `qinggan_fav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `note` varchar(255) NOT NULL COMMENT '摘要',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `lid` int(11) NOT NULL COMMENT '关联主题',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='会员收藏夹';

-- ----------------------------
-- Records of qinggan_fav
-- ----------------------------
INSERT INTO `qinggan_fav` VALUES ('8', '23', '', 'MySQL出错代码', '1005：创建表失败1006：创建数据库失败1007：数据库已存在，创建数据库失败1008：数据库不存在，删除数据库失败1009：不能删除数据库文件导致删除数据库失败1010：不能删除…', '1459322370', '1370');

-- ----------------------------
-- Table structure for qinggan_fields
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_fields`;
CREATE TABLE `qinggan_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` varchar(100) NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  `area` text NOT NULL COMMENT '使用范围，多个应用范围用英文逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of qinggan_fields
-- ----------------------------
INSERT INTO `qinggan_fields` VALUES ('6', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:11:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";}', 'all,cate,module,project,user,usergroup');
INSERT INTO `qinggan_fields` VALUES ('7', '图片', 'pictures', 'varchar', '支持多图', 'upload', '', 'safe', '', '50', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('8', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `qinggan_fields` VALUES ('128', '附件', 'dfiles', 'varchar', '支持多个附件', 'upload', '', '', '', '255', 'a:3:{s:7:\"cate_id\";s:2:\"11\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user,usergroup');
INSERT INTO `qinggan_fields` VALUES ('11', '链接', 'link', 'longtext', '手动指定外部链接时，伪静态链接可以留空', 'url', '', 'safe', '', '90', 'a:1:{s:5:\"width\";s:3:\"500\";}', 'all,cate,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('12', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}', 'all,cate,module,project');
INSERT INTO `qinggan_fields` VALUES ('13', '性别', 'gender', 'varchar', '', 'radio', '', 'safe', '女', '120', 'a:3:{s:11:\"option_list\";b:0;s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";s:8:\"男女\";}', 'all,cate,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('14', '邮箱', 'email', 'varchar', '', 'text', '', 'safe', '', '130', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";b:0;}', 'all,cate,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('37', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_self', '100', 'a:1:{s:11:\"option_list\";s:5:\"opt:6\";}', 'cate,module,project');
INSERT INTO `qinggan_fields` VALUES ('30', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,cate,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('31', '通栏图片', 'banner', 'varchar', '', 'upload', '', 'safe', '', '40', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project');
INSERT INTO `qinggan_fields` VALUES ('127', '附件', 'dfile', 'varchar', '', 'upload', '', '', '', '255', 'a:3:{s:7:\"cate_id\";s:2:\"11\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `qinggan_fields` VALUES ('35', '文档', 'doc', 'varchar', '支持在线办公室的文档', 'upload', '', 'safe', '', '80', 'a:3:{s:11:\"upload_type\";s:8:\"document\";s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";}', 'all,cate,module,project');
INSERT INTO `qinggan_fields` VALUES ('36', '视频', 'video', 'varchar', '支持并推荐您使用FlV格式视频', 'upload', '', 'int', '', '110', 'a:3:{s:7:\"cate_id\";s:2:\"16\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"0\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `qinggan_fields` VALUES ('60', '客服QQ', 'qq', 'varchar', '', 'text', '', 'safe', '', '150', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,cate,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('116', '广告内容', 'ad', 'longtext', '', 'editor', '', 'html_js', '', '255', 'a:12:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";i:1;s:9:\"btn_image\";i:1;s:9:\"btn_video\";i:1;s:8:\"btn_file\";b:0;s:8:\"btn_page\";b:0;s:8:\"btn_info\";b:0;s:7:\"is_read\";b:0;s:5:\"etype\";s:6:\"simple\";s:7:\"btn_tpl\";b:0;s:7:\"btn_map\";b:0;}', 'all,cate,module,project');
INSERT INTO `qinggan_fields` VALUES ('75', '联系地址', 'address', 'varchar', '', 'text', '', 'safe', '', '79', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";}', 'all,module,user');
INSERT INTO `qinggan_fields` VALUES ('76', '联系电话', 'tel', 'varchar', '', 'text', '', 'safe', '', '89', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('77', '邮编', 'zipcode', 'varchar', '请填写六位数字的邮编号码', 'text', '', 'safe', '', '30', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,module,cate');
INSERT INTO `qinggan_fields` VALUES ('79', 'LOGO', 'logo', 'varchar', '网站LOGO，规格：88x31', 'text', '', 'safe', '', '160', 'a:2:{s:8:\"form_btn\";s:5:\"image\";s:5:\"width\";s:3:\"500\";}', 'all,cate,module,project');
INSERT INTO `qinggan_fields` VALUES ('80', '图片', 'pic', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";s:5:\"image\";s:5:\"width\";s:3:\"500\";}', 'all,cate,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('81', '统计', 'statjs', 'varchar', '', 'code_editor', '', 'html_js', '', '255', 'a:2:{s:5:\"width\";s:3:\"500\";s:6:\"height\";s:2:\"80\";}', 'all');
INSERT INTO `qinggan_fields` VALUES ('82', '备案号', 'cert', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all');
INSERT INTO `qinggan_fields` VALUES ('95', '发货时间', 'sendtime', 'varchar', '设置发货时间', 'text', '', 'time', '', '255', 'a:2:{s:8:\"form_btn\";s:4:\"date\";s:5:\"width\";s:3:\"300\";}', 'module');
INSERT INTO `qinggan_fields` VALUES ('96', '企业名称', 'company', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";}', 'all,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('106', '管理员回复', 'adm_reply', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"180\";s:7:\"is_code\";b:0;s:9:\"btn_image\";i:1;s:9:\"btn_video\";i:1;s:8:\"btn_file\";i:1;s:8:\"btn_page\";b:0;s:8:\"btn_info\";b:0;s:7:\"is_read\";b:0;s:5:\"etype\";s:6:\"simple\";s:7:\"btn_tpl\";b:0;s:7:\"btn_map\";b:0;}', 'module');
INSERT INTO `qinggan_fields` VALUES ('112', '赞', 'good', 'varchar', '设置点赞次数', 'text', '', 'int', '', '20', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"100\";}', 'module');
INSERT INTO `qinggan_fields` VALUES ('113', '省市', 'province_city', 'longtext', '', 'select', '', 'safe', '', '255', 'a:4:{s:11:\"option_list\";s:5:\"opt:2\";s:11:\"is_multiple\";s:1:\"0\";s:5:\"width\";b:0;s:10:\"ext_select\";b:0;}', 'all,cate,module,project,user,usergroup');
INSERT INTO `qinggan_fields` VALUES ('114', '手机号', 'mobile', 'varchar', '', 'text', '', 'safe', '', '255', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,cate,module,project,user,usergroup');
INSERT INTO `qinggan_fields` VALUES ('117', '规格参数', 'spec', 'longtext', '', 'param', '', '', '', '255', 'a:2:{s:6:\"p_name\";s:30:\"名称型号流量大小\";s:6:\"p_type\";s:1:\"1\";}', 'module');
INSERT INTO `qinggan_fields` VALUES ('118', '产品属性', 'spec_single', 'longtext', '', 'param', '', '', '', '255', 'a:2:{s:6:\"p_name\";s:119:\"型号推荐用途平台显卡类型网卡类型速度核心数二级缓存显示芯片显存容量\";s:6:\"p_type\";s:1:\"0\";}', 'module');
INSERT INTO `qinggan_fields` VALUES ('119', '页脚版权', 'copyright', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";b:0;s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";b:0;s:8:\"btn_file\";b:0;s:8:\"btn_page\";b:0;s:8:\"btn_info\";b:0;s:7:\"is_read\";b:0;s:5:\"etype\";s:6:\"simple\";s:7:\"btn_tpl\";b:0;s:7:\"btn_map\";b:0;}', 'all,module');
INSERT INTO `qinggan_fields` VALUES ('120', '英文标题', 'entitle', 'varchar', '设置与主题名称相对应的英文标题', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `qinggan_fields` VALUES ('129', '二维码', 'qrcode', 'varchar', '上传二维码图片', 'upload', '', '', '', '255', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', 'all,cate,module,project,user');
INSERT INTO `qinggan_fields` VALUES ('130', '百度分享代码', 'bdshare', 'longtext', '放置百度分享代码框', 'code_editor', '', 'html_js', '', '255', 'a:2:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"300\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `qinggan_fields` VALUES ('122', '子标题', 'subtitle', 'varchar', '', 'text', '', '', '', '20', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `qinggan_fields` VALUES ('124', '自定义链接', 'linkurl', 'varchar', '请填写链接地址，外链请输入http://或https://', 'text', '', 'safe', '', '255', 'a:4:{s:8:\"form_btn\";s:3:\"url\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `qinggan_fields` VALUES ('125', '背景颜色', 'bgcolor', 'varchar', '实现在不支持CSS3的情况与背景融合', 'text', '', '', 'FFFFFF', '255', 'a:4:{s:8:\"form_btn\";s:5:\"color\";s:5:\"width\";s:0:\"\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');
INSERT INTO `qinggan_fields` VALUES ('126', '省市县', 'pca', 'varchar', '省市县信息调用', 'pca', '', '', '', '255', 'a:1:{s:8:\"savetype\";s:1:\"0\";}', 'module');
INSERT INTO `qinggan_fields` VALUES ('131', '规格参数', 'parameter', 'longtext', '', 'param', '', 'safe', '', '255', 'a:3:{s:6:\"p_name\";s:108:\"网络制式机身内存分辨率摄像头无线和网络机身尺寸（mm）机身重量（g）\";s:6:\"p_type\";s:1:\"0\";s:7:\"p_width\";s:0:\"\";}', 'module');
INSERT INTO `qinggan_fields` VALUES ('132', '包装清单', 'package', 'longtext', '', 'textarea', '', '', '', '255', 'a:2:{s:5:\"width\";s:3:\"500\";s:6:\"height\";s:3:\"100\";}', 'module');
INSERT INTO `qinggan_fields` VALUES ('133', '手机版标题', 'm_title', 'varchar', '标题较短，请根据实际情况使用', 'text', '', '', '', '255', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', 'all,cate,module,project,user,usergroup,cart,order,pay');

-- ----------------------------
-- Table structure for qinggan_freight
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_freight`;
CREATE TABLE `qinggan_freight` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID，自增ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `title` varchar(100) NOT NULL COMMENT '模板名称，便于后台管理',
  `type` enum('weight','volume','number','fixed') NOT NULL DEFAULT 'weight' COMMENT 'weight重量volume体积number数量fixed固定值',
  `currency_id` int(11) NOT NULL DEFAULT '0' COMMENT '货币ID',
  `taxis` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='物流运费模板管理';

-- ----------------------------
-- Records of qinggan_freight
-- ----------------------------
INSERT INTO `qinggan_freight` VALUES ('1', '1', '计重运费模板', 'weight', '1', '10');
INSERT INTO `qinggan_freight` VALUES ('2', '1', '体积运费模板', 'volume', '1', '20');
INSERT INTO `qinggan_freight` VALUES ('3', '1', '基于数量的运费模板', 'number', '1', '30');
INSERT INTO `qinggan_freight` VALUES ('4', '1', '固定运费模板', 'fixed', '1', '40');

-- ----------------------------
-- Table structure for qinggan_freight_price
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_freight_price`;
CREATE TABLE `qinggan_freight_price` (
  `zid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区域ID',
  `unit_val` varchar(20) NOT NULL COMMENT '单位量，如0.5kg，或1个或1立方米，取决于系统设定',
  `price` varchar(50) NOT NULL DEFAULT '0' COMMENT '运费价格，最低为0，不能为负数',
  PRIMARY KEY (`zid`,`unit_val`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单位体积价格';

-- ----------------------------
-- Records of qinggan_freight_price
-- ----------------------------
INSERT INTO `qinggan_freight_price` VALUES ('1', '1', '10');
INSERT INTO `qinggan_freight_price` VALUES ('2', '1', '10');
INSERT INTO `qinggan_freight_price` VALUES ('3', '1', '10');
INSERT INTO `qinggan_freight_price` VALUES ('4', '1', '10');
INSERT INTO `qinggan_freight_price` VALUES ('5', '1', '11');
INSERT INTO `qinggan_freight_price` VALUES ('6', '1', '15');
INSERT INTO `qinggan_freight_price` VALUES ('7', '1', '11');
INSERT INTO `qinggan_freight_price` VALUES ('8', '1', '30');
INSERT INTO `qinggan_freight_price` VALUES ('1', '2', '17');
INSERT INTO `qinggan_freight_price` VALUES ('2', '2', '17');
INSERT INTO `qinggan_freight_price` VALUES ('3', '2', '24');
INSERT INTO `qinggan_freight_price` VALUES ('4', '2', '24');
INSERT INTO `qinggan_freight_price` VALUES ('5', '2', '22');
INSERT INTO `qinggan_freight_price` VALUES ('6', '2', '27');
INSERT INTO `qinggan_freight_price` VALUES ('7', '2', '22');
INSERT INTO `qinggan_freight_price` VALUES ('8', '2', '30');
INSERT INTO `qinggan_freight_price` VALUES ('8', '3', '10*N');
INSERT INTO `qinggan_freight_price` VALUES ('7', '3', '10*N');
INSERT INTO `qinggan_freight_price` VALUES ('6', '3', '10*N');
INSERT INTO `qinggan_freight_price` VALUES ('5', '3', '10*N');
INSERT INTO `qinggan_freight_price` VALUES ('4', '3', '10*N');
INSERT INTO `qinggan_freight_price` VALUES ('3', '3', '10*N');
INSERT INTO `qinggan_freight_price` VALUES ('2', '3', '8*N');
INSERT INTO `qinggan_freight_price` VALUES ('1', '3', '7*N');
INSERT INTO `qinggan_freight_price` VALUES ('10', '0.5', '10');
INSERT INTO `qinggan_freight_price` VALUES ('11', '0.5', '20');
INSERT INTO `qinggan_freight_price` VALUES ('10', '1', '12*N');
INSERT INTO `qinggan_freight_price` VALUES ('11', '1', '35');
INSERT INTO `qinggan_freight_price` VALUES ('10', '1.5', '13*N');
INSERT INTO `qinggan_freight_price` VALUES ('11', '1.5', '45');
INSERT INTO `qinggan_freight_price` VALUES ('12', 'fixed', '10');
INSERT INTO `qinggan_freight_price` VALUES ('24', 'fixed', '20');

-- ----------------------------
-- Table structure for qinggan_freight_zone
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_freight_zone`;
CREATE TABLE `qinggan_freight_zone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `title` varchar(100) NOT NULL COMMENT '名称',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `note` varchar(255) NOT NULL COMMENT '简单说明该区域信息',
  `area` longtext NOT NULL COMMENT '省份+城市',
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='运费模板区域设置';

-- ----------------------------
-- Records of qinggan_freight_zone
-- ----------------------------
INSERT INTO `qinggan_freight_zone` VALUES ('1', '3', '华东', '10', '包括省市有上海，江苏，浙江，安徽，江西', 'a:5:{s:9:\"上海市\";a:1:{s:9:\"上海市\";b:1;}s:9:\"江苏省\";a:13:{s:9:\"南京市\";b:1;s:9:\"无锡市\";b:1;s:9:\"徐州市\";b:1;s:9:\"常州市\";b:1;s:9:\"苏州市\";b:1;s:9:\"南通市\";b:1;s:12:\"连云港市\";b:1;s:9:\"淮安市\";b:1;s:9:\"盐城市\";b:1;s:9:\"扬州市\";b:1;s:9:\"镇江市\";b:1;s:9:\"泰州市\";b:1;s:9:\"宿迁市\";b:1;}s:9:\"浙江省\";a:11:{s:9:\"杭州市\";b:1;s:9:\"宁波市\";b:1;s:9:\"温州市\";b:1;s:9:\"嘉兴市\";b:1;s:9:\"湖州市\";b:1;s:9:\"绍兴市\";b:1;s:9:\"金华市\";b:1;s:9:\"衢州市\";b:1;s:9:\"舟山市\";b:1;s:9:\"台州市\";b:1;s:9:\"丽水市\";b:1;}s:9:\"安徽省\";a:17:{s:9:\"合肥市\";b:1;s:9:\"芜湖市\";b:1;s:9:\"蚌埠市\";b:1;s:9:\"淮南市\";b:1;s:12:\"马鞍山市\";b:1;s:9:\"淮北市\";b:1;s:9:\"铜陵市\";b:1;s:9:\"安庆市\";b:1;s:9:\"黄山市\";b:1;s:9:\"滁州市\";b:1;s:9:\"阜阳市\";b:1;s:9:\"宿州市\";b:1;s:9:\"巢湖市\";b:1;s:9:\"六安市\";b:1;s:9:\"亳州市\";b:1;s:9:\"池州市\";b:1;s:9:\"宣城市\";b:1;}s:9:\"江西省\";a:11:{s:9:\"南昌市\";b:1;s:12:\"景德镇市\";b:1;s:9:\"萍乡市\";b:1;s:9:\"九江市\";b:1;s:9:\"新余市\";b:1;s:9:\"鹰潭市\";b:1;s:9:\"赣州市\";b:1;s:9:\"吉安市\";b:1;s:9:\"宜春市\";b:1;s:9:\"抚州市\";b:1;s:9:\"上饶市\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('2', '3', '华北', '20', '包含北京，天津，山西，山东，河北，内蒙古', 'a:6:{s:9:\"北京市\";a:1:{s:9:\"北京市\";b:1;}s:9:\"天津市\";a:1:{s:9:\"天津市\";b:1;}s:9:\"河北省\";a:11:{s:12:\"石家庄市\";b:1;s:9:\"唐山市\";b:1;s:12:\"秦皇岛市\";b:1;s:9:\"邯郸市\";b:1;s:9:\"邢台市\";b:1;s:9:\"保定市\";b:1;s:12:\"张家口市\";b:1;s:9:\"承德市\";b:1;s:9:\"沧州市\";b:1;s:9:\"廊坊市\";b:1;s:9:\"衡水市\";b:1;}s:9:\"山西省\";a:11:{s:9:\"太原市\";b:1;s:9:\"大同市\";b:1;s:9:\"阳泉市\";b:1;s:9:\"长治市\";b:1;s:9:\"晋城市\";b:1;s:9:\"朔州市\";b:1;s:9:\"晋中市\";b:1;s:9:\"运城市\";b:1;s:9:\"忻州市\";b:1;s:9:\"临汾市\";b:1;s:9:\"吕梁市\";b:1;}s:18:\"内蒙古自治区\";a:12:{s:15:\"呼和浩特市\";b:1;s:9:\"包头市\";b:1;s:9:\"乌海市\";b:1;s:9:\"赤峰市\";b:1;s:9:\"通辽市\";b:1;s:15:\"鄂尔多斯市\";b:1;s:15:\"呼伦贝尔市\";b:1;s:15:\"巴彦淖尔市\";b:1;s:15:\"乌兰察布市\";b:1;s:9:\"兴安盟\";b:1;s:15:\"锡林郭勒盟\";b:1;s:12:\"阿拉善盟\";b:1;}s:9:\"山东省\";a:17:{s:9:\"济南市\";b:1;s:9:\"青岛市\";b:1;s:9:\"淄博市\";b:1;s:9:\"枣庄市\";b:1;s:9:\"东营市\";b:1;s:9:\"烟台市\";b:1;s:9:\"潍坊市\";b:1;s:9:\"济宁市\";b:1;s:9:\"泰安市\";b:1;s:9:\"威海市\";b:1;s:9:\"日照市\";b:1;s:9:\"莱芜市\";b:1;s:9:\"临沂市\";b:1;s:9:\"德州市\";b:1;s:9:\"聊城市\";b:1;s:9:\"滨州市\";b:1;s:9:\"荷泽市\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('3', '3', '华中', '30', '包括湖南，湖北，河南', 'a:3:{s:9:\"河南省\";a:17:{s:9:\"郑州市\";b:1;s:9:\"开封市\";b:1;s:9:\"洛阳市\";b:1;s:12:\"平顶山市\";b:1;s:9:\"安阳市\";b:1;s:9:\"鹤壁市\";b:1;s:9:\"新乡市\";b:1;s:9:\"焦作市\";b:1;s:9:\"濮阳市\";b:1;s:9:\"许昌市\";b:1;s:9:\"漯河市\";b:1;s:12:\"三门峡市\";b:1;s:9:\"南阳市\";b:1;s:9:\"商丘市\";b:1;s:9:\"信阳市\";b:1;s:9:\"周口市\";b:1;s:12:\"驻马店市\";b:1;}s:9:\"湖北省\";a:14:{s:9:\"武汉市\";b:1;s:9:\"黄石市\";b:1;s:9:\"十堰市\";b:1;s:9:\"宜昌市\";b:1;s:9:\"襄樊市\";b:1;s:9:\"鄂州市\";b:1;s:9:\"荆门市\";b:1;s:9:\"孝感市\";b:1;s:9:\"荆州市\";b:1;s:9:\"黄冈市\";b:1;s:9:\"咸宁市\";b:1;s:9:\"随州市\";b:1;s:30:\"恩施土家族苗族自治州\";b:1;s:9:\"神农架\";b:1;}s:9:\"湖南省\";a:14:{s:9:\"长沙市\";b:1;s:9:\"株洲市\";b:1;s:9:\"湘潭市\";b:1;s:9:\"衡阳市\";b:1;s:9:\"邵阳市\";b:1;s:9:\"岳阳市\";b:1;s:9:\"常德市\";b:1;s:12:\"张家界市\";b:1;s:9:\"益阳市\";b:1;s:9:\"郴州市\";b:1;s:9:\"永州市\";b:1;s:9:\"怀化市\";b:1;s:9:\"娄底市\";b:1;s:30:\"湘西土家族苗族自治州\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('4', '3', '华南', '40', '包括广东，广西，福建，海南', 'a:4:{s:9:\"福建省\";a:9:{s:9:\"福州市\";b:1;s:9:\"厦门市\";b:1;s:9:\"莆田市\";b:1;s:9:\"三明市\";b:1;s:9:\"泉州市\";b:1;s:9:\"漳州市\";b:1;s:9:\"南平市\";b:1;s:9:\"龙岩市\";b:1;s:9:\"宁德市\";b:1;}s:9:\"广东省\";a:21:{s:9:\"广州市\";b:1;s:9:\"韶关市\";b:1;s:9:\"深圳市\";b:1;s:9:\"珠海市\";b:1;s:9:\"汕头市\";b:1;s:9:\"佛山市\";b:1;s:9:\"江门市\";b:1;s:9:\"湛江市\";b:1;s:9:\"茂名市\";b:1;s:9:\"肇庆市\";b:1;s:9:\"惠州市\";b:1;s:9:\"梅州市\";b:1;s:9:\"汕尾市\";b:1;s:9:\"河源市\";b:1;s:9:\"阳江市\";b:1;s:9:\"清远市\";b:1;s:9:\"东莞市\";b:1;s:9:\"中山市\";b:1;s:9:\"潮州市\";b:1;s:9:\"揭阳市\";b:1;s:9:\"云浮市\";b:1;}s:21:\"广西壮族自治区\";a:14:{s:9:\"南宁市\";b:1;s:9:\"柳州市\";b:1;s:9:\"桂林市\";b:1;s:9:\"梧州市\";b:1;s:9:\"北海市\";b:1;s:12:\"防城港市\";b:1;s:9:\"钦州市\";b:1;s:9:\"贵港市\";b:1;s:9:\"玉林市\";b:1;s:9:\"百色市\";b:1;s:9:\"贺州市\";b:1;s:9:\"河池市\";b:1;s:9:\"来宾市\";b:1;s:9:\"崇左市\";b:1;}s:9:\"海南省\";a:2:{s:9:\"海口市\";b:1;s:9:\"三亚市\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('5', '3', '东北', '50', '包括辽宁，吉林，黑龙江', 'a:3:{s:9:\"辽宁省\";a:14:{s:9:\"沈阳市\";b:1;s:9:\"大连市\";b:1;s:9:\"鞍山市\";b:1;s:9:\"抚顺市\";b:1;s:9:\"本溪市\";b:1;s:9:\"丹东市\";b:1;s:9:\"锦州市\";b:1;s:9:\"营口市\";b:1;s:9:\"阜新市\";b:1;s:9:\"辽阳市\";b:1;s:9:\"盘锦市\";b:1;s:9:\"铁岭市\";b:1;s:9:\"朝阳市\";b:1;s:12:\"葫芦岛市\";b:1;}s:9:\"吉林省\";a:9:{s:9:\"长春市\";b:1;s:9:\"吉林市\";b:1;s:9:\"四平市\";b:1;s:9:\"辽源市\";b:1;s:9:\"通化市\";b:1;s:9:\"白山市\";b:1;s:9:\"松原市\";b:1;s:9:\"白城市\";b:1;s:24:\"延边朝鲜族自治州\";b:1;}s:12:\"黑龙江省\";a:13:{s:12:\"哈尔滨市\";b:1;s:15:\"齐齐哈尔市\";b:1;s:9:\"鸡西市\";b:1;s:9:\"鹤岗市\";b:1;s:12:\"双鸭山市\";b:1;s:9:\"大庆市\";b:1;s:9:\"伊春市\";b:1;s:12:\"佳木斯市\";b:1;s:12:\"七台河市\";b:1;s:12:\"牡丹江市\";b:1;s:9:\"黑河市\";b:1;s:9:\"绥化市\";b:1;s:18:\"大兴安岭地区\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('6', '3', '西北', '60', '包括陕西，甘肃，宁夏，青海，新疆', 'a:5:{s:9:\"陕西省\";a:10:{s:9:\"西安市\";b:1;s:9:\"铜川市\";b:1;s:9:\"宝鸡市\";b:1;s:9:\"咸阳市\";b:1;s:9:\"渭南市\";b:1;s:9:\"延安市\";b:1;s:9:\"汉中市\";b:1;s:9:\"榆林市\";b:1;s:9:\"安康市\";b:1;s:9:\"商洛市\";b:1;}s:9:\"甘肃省\";a:14:{s:9:\"兰州市\";b:1;s:12:\"嘉峪关市\";b:1;s:9:\"金昌市\";b:1;s:9:\"白银市\";b:1;s:9:\"天水市\";b:1;s:9:\"武威市\";b:1;s:9:\"张掖市\";b:1;s:9:\"平凉市\";b:1;s:9:\"酒泉市\";b:1;s:9:\"庆阳市\";b:1;s:9:\"定西市\";b:1;s:9:\"陇南市\";b:1;s:21:\"临夏回族自治州\";b:1;s:21:\"甘南藏族自治州\";b:1;}s:9:\"青海省\";a:8:{s:9:\"西宁市\";b:1;s:12:\"海东地区\";b:1;s:21:\"海北藏族自治州\";b:1;s:21:\"黄南藏族自治州\";b:1;s:21:\"海南藏族自治州\";b:1;s:21:\"果洛藏族自治州\";b:1;s:21:\"玉树藏族自治州\";b:1;s:30:\"海西蒙古族藏族自治州\";b:1;}s:21:\"宁夏回族自治区\";a:5:{s:9:\"银川市\";b:1;s:12:\"石嘴山市\";b:1;s:9:\"吴忠市\";b:1;s:9:\"固原市\";b:1;s:9:\"中卫市\";b:1;}s:24:\"新疆维吾尔自治区\";a:18:{s:15:\"乌鲁木齐市\";b:1;s:15:\"克拉玛依市\";b:1;s:15:\"吐鲁番地区\";b:1;s:12:\"哈密地区\";b:1;s:21:\"昌吉回族自治州\";b:1;s:27:\"博尔塔拉蒙古自治州\";b:1;s:27:\"巴音郭楞蒙古自治州\";b:1;s:15:\"阿克苏地区\";b:1;s:33:\"克孜勒苏柯尔克孜自治州\";b:1;s:12:\"喀什地区\";b:1;s:12:\"和田地区\";b:1;s:24:\"伊犁哈萨克自治州\";b:1;s:12:\"塔城地区\";b:1;s:15:\"阿勒泰地区\";b:1;s:12:\"石河子市\";b:1;s:12:\"阿拉尔市\";b:1;s:15:\"图木舒克市\";b:1;s:12:\"五家渠市\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('7', '3', '西南', '70', '包括重庆，云南，贵州，西藏，四川', 'a:5:{s:9:\"重庆市\";a:1:{s:9:\"重庆市\";b:1;}s:9:\"四川省\";a:21:{s:9:\"成都市\";b:1;s:9:\"自贡市\";b:1;s:12:\"攀枝花市\";b:1;s:9:\"泸州市\";b:1;s:9:\"德阳市\";b:1;s:9:\"绵阳市\";b:1;s:9:\"广元市\";b:1;s:9:\"遂宁市\";b:1;s:9:\"内江市\";b:1;s:9:\"乐山市\";b:1;s:9:\"南充市\";b:1;s:9:\"眉山市\";b:1;s:9:\"宜宾市\";b:1;s:9:\"广安市\";b:1;s:9:\"达州市\";b:1;s:9:\"雅安市\";b:1;s:9:\"巴中市\";b:1;s:9:\"资阳市\";b:1;s:27:\"阿坝藏族羌族自治州\";b:1;s:21:\"甘孜藏族自治州\";b:1;s:21:\"凉山彝族自治州\";b:1;}s:9:\"贵州省\";a:9:{s:9:\"贵阳市\";b:1;s:12:\"六盘水市\";b:1;s:9:\"遵义市\";b:1;s:9:\"安顺市\";b:1;s:12:\"铜仁地区\";b:1;s:33:\"黔西南布依族苗族自治州\";b:1;s:12:\"毕节地区\";b:1;s:30:\"黔东南苗族侗族自治州\";b:1;s:30:\"黔南布依族苗族自治州\";b:1;}s:9:\"云南省\";a:16:{s:9:\"昆明市\";b:1;s:9:\"曲靖市\";b:1;s:9:\"玉溪市\";b:1;s:9:\"保山市\";b:1;s:9:\"昭通市\";b:1;s:9:\"丽江市\";b:1;s:9:\"思茅市\";b:1;s:9:\"临沧市\";b:1;s:21:\"楚雄彝族自治州\";b:1;s:30:\"红河哈尼族彝族自治州\";b:1;s:27:\"文山壮族苗族自治州\";b:1;s:27:\"西双版纳傣族自治州\";b:1;s:21:\"大理白族自治州\";b:1;s:30:\"德宏傣族景颇族自治州\";b:1;s:24:\"怒江傈僳族自治州\";b:1;s:21:\"迪庆藏族自治州\";b:1;}s:15:\"西藏自治区\";a:7:{s:9:\"拉萨市\";b:1;s:12:\"昌都地区\";b:1;s:12:\"山南地区\";b:1;s:15:\"日喀则地区\";b:1;s:12:\"那曲地区\";b:1;s:12:\"阿里地区\";b:1;s:12:\"林芝地区\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('8', '3', '港澳台', '80', '包括包港，澳门，台湾', 'a:3:{s:21:\"香港特别行政区\";a:1:{s:21:\"香港特别行政区\";b:1;}s:21:\"澳门特别行政区\";a:1:{s:21:\"澳门特别行政区\";b:1;}s:9:\"台湾省\";a:1:{s:9:\"台湾省\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('10', '1', 'zoom1', '10', '广东深圳', 'a:1:{s:9:\"广东省\";a:1:{s:9:\"深圳市\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('11', '1', 'zoom2', '20', '福建及广东', 'a:2:{s:9:\"福建省\";a:9:{s:9:\"福州市\";b:1;s:9:\"厦门市\";b:1;s:9:\"莆田市\";b:1;s:9:\"三明市\";b:1;s:9:\"泉州市\";b:1;s:9:\"漳州市\";b:1;s:9:\"南平市\";b:1;s:9:\"龙岩市\";b:1;s:9:\"宁德市\";b:1;}s:9:\"广东省\";a:20:{s:9:\"广州市\";b:1;s:9:\"韶关市\";b:1;s:9:\"珠海市\";b:1;s:9:\"汕头市\";b:1;s:9:\"佛山市\";b:1;s:9:\"江门市\";b:1;s:9:\"湛江市\";b:1;s:9:\"茂名市\";b:1;s:9:\"肇庆市\";b:1;s:9:\"惠州市\";b:1;s:9:\"梅州市\";b:1;s:9:\"汕尾市\";b:1;s:9:\"河源市\";b:1;s:9:\"阳江市\";b:1;s:9:\"清远市\";b:1;s:9:\"东莞市\";b:1;s:9:\"中山市\";b:1;s:9:\"潮州市\";b:1;s:9:\"揭阳市\";b:1;s:9:\"云浮市\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('12', '4', '一线城市', '10', '', 'a:4:{s:9:\"北京市\";a:1:{s:9:\"北京市\";b:1;}s:9:\"天津市\";a:1:{s:9:\"天津市\";b:1;}s:9:\"上海市\";a:1:{s:9:\"上海市\";b:1;}s:9:\"广东省\";a:1:{s:9:\"深圳市\";b:1;}}');
INSERT INTO `qinggan_freight_zone` VALUES ('24', '4', '偏远地区', '20', '', 'a:1:{s:24:\"新疆维吾尔自治区\";a:18:{s:15:\"乌鲁木齐市\";b:1;s:15:\"克拉玛依市\";b:1;s:15:\"吐鲁番地区\";b:1;s:12:\"哈密地区\";b:1;s:21:\"昌吉回族自治州\";b:1;s:27:\"博尔塔拉蒙古自治州\";b:1;s:27:\"巴音郭楞蒙古自治州\";b:1;s:15:\"阿克苏地区\";b:1;s:33:\"克孜勒苏柯尔克孜自治州\";b:1;s:12:\"喀什地区\";b:1;s:12:\"和田地区\";b:1;s:24:\"伊犁哈萨克自治州\";b:1;s:12:\"塔城地区\";b:1;s:15:\"阿勒泰地区\";b:1;s:12:\"石河子市\";b:1;s:12:\"阿拉尔市\";b:1;s:15:\"图木舒克市\";b:1;s:12:\"五家渠市\";b:1;}}');

-- ----------------------------
-- Table structure for qinggan_gateway
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_gateway`;
CREATE TABLE `qinggan_gateway` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID，为0表示所有站点可用',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不可用1可用',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1表示默认使用',
  `type` varchar(50) NOT NULL COMMENT '类型，gateway文件夹的子文件夹',
  `code` varchar(50) NOT NULL COMMENT '路由引挈',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `note` varchar(255) NOT NULL COMMENT '功能备注',
  `ext` text NOT NULL COMMENT '扩展参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='第三方网关路由引挈';

-- ----------------------------
-- Records of qinggan_gateway
-- ----------------------------
INSERT INTO `qinggan_gateway` VALUES ('1', '1', '1', '1', 'sms', 'duanxincm', '莫名短信', '10', '', 'a:4:{s:7:\"account\";s:8:\"70206743\";s:8:\"password\";s:8:\"40782502\";s:6:\"server\";s:22:\"http://api.duanxin.cm/\";s:6:\"mobile\";s:11:\"15818533971\";}');
INSERT INTO `qinggan_gateway` VALUES ('3', '1', '1', '1', 'email', 'smtp', 'SMTP邮件发送', '10', '', 'a:8:{s:6:\"server\";s:11:\"smtp.qq.com\";s:4:\"port\";s:2:\"25\";s:7:\"account\";s:15:\"admin@phpok.com\";s:8:\"password\";s:0:\"\";s:7:\"charset\";s:4:\"utf8\";s:3:\"ssl\";s:2:\"no\";s:8:\"fullname\";s:9:\"苏相锟\";s:5:\"email\";s:15:\"admin@phpok.com\";}');

-- ----------------------------
-- Table structure for qinggan_gd
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_gd`;
CREATE TABLE `qinggan_gd` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `identifier` varchar(100) NOT NULL COMMENT '标识串',
  `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片高度',
  `mark_picture` varchar(255) NOT NULL COMMENT '水印图片位置',
  `mark_position` varchar(100) NOT NULL COMMENT '水印位置',
  `cut_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '图片生成方式，支持缩放法、裁剪法、等宽、等高及自定义五种，默认使用缩放法',
  `quality` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '图片生成质量，默认是100',
  `bgcolor` varchar(10) NOT NULL DEFAULT 'FFFFFF' COMMENT '补白背景色，默认是白色',
  `trans` tinyint(3) unsigned NOT NULL DEFAULT '65' COMMENT '透明度',
  `editor` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通1默认插入编辑器',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='上传图片自动生成方案';

-- ----------------------------
-- Records of qinggan_gd
-- ----------------------------
INSERT INTO `qinggan_gd` VALUES ('2', 'thumb', '320', '320', '', 'bottom-right', '1', '80', 'FFFFFF', '0', '0');
INSERT INTO `qinggan_gd` VALUES ('12', 'auto', '0', '0', 'res/201502/26/36afa2d3dfe37cbd.png', 'bottom-right', '0', '80', 'FFFFFF', '0', '1');

-- ----------------------------
-- Table structure for qinggan_list
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list`;
CREATE TABLE `qinggan_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0为根主题，其他ID对应list表的id字段',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `module_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '网站ID',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核，1已审核',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0显示，1隐藏',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `tpl` varchar(255) NOT NULL COMMENT '自定义的模板',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `tag` varchar(255) NOT NULL COMMENT 'tag标签',
  `attr` varchar(255) NOT NULL COMMENT '主题属性',
  `replydate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后回复时间',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示管理员发布',
  `identifier` varchar(255) NOT NULL COMMENT '内容标识串',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '财富基于，用于计算财富的基础量',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `site_id` (`site_id`,`identifier`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1853 DEFAULT CHARSET=utf8 COMMENT='内容主表';

-- ----------------------------
-- Records of qinggan_list
-- ----------------------------
INSERT INTO `qinggan_list` VALUES ('1276', '0', '0', '21', '41', '1', '企业建站，我信赖PHPOK', '1394008409', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('520', '0', '0', '23', '42', '1', '网站首页', '1380942032', '10', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('712', '0', '0', '23', '42', '1', '关于我们', '1383355821', '20', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('713', '0', '0', '23', '42', '1', '资讯中心', '1383355842', '30', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('714', '0', '0', '23', '42', '1', '产品展示', '1383355849', '40', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('716', '0', '0', '23', '42', '1', '在线留言', '1383355870', '60', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1277', '0', '0', '21', '41', '1', '选择PHPOK，专业建站', '1394008434', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('755', '712', '0', '23', '42', '1', '工作环境', '1383640450', '24', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('760', '713', '0', '23', '42', '1', '公司新闻', '1383815715', '10', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('761', '713', '0', '23', '42', '1', '行业新闻', '1383815736', '20', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1252', '0', '0', '61', '142', '1', 'phpok官网', '1390465160', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1254', '712', '0', '23', '42', '1', '发展历程', '1392375210', '26', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1256', '0', '0', '23', '42', '1', '图集相册', '1392375722', '70', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1261', '0', '0', '61', '142', '1', '启邦互动', '1393321211', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1262', '0', '0', '61', '142', '1', '联迅网络', '1393321235', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1263', '0', '0', '61', '142', '1', '梦幻网络', '1393321258', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1264', '0', '0', '61', '142', '1', '中国站长站', '1393321288', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1265', '0', '0', '61', '142', '1', 'A5站长网', '1393321321', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1266', '0', '0', '61', '142', '1', '中国站长', '1393321365', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1267', '0', '0', '61', '142', '1', '落伍者', '1393321391', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1268', '0', '0', '61', '142', '1', '源码之家', '1393321413', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1767', '0', '211', '68', '144', '1', '华为P7', '1458701998', '0', '1', '0', '3', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1768', '0', '211', '68', '144', '1', '魅族MX5', '1458702037', '0', '1', '0', '4', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1766', '0', '211', '68', '144', '1', 'vivo Xplay5', '1458701947', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1278', '0', '0', '21', '41', '1', '开源精神，开创未来', '1394008456', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1285', '0', '0', '46', '96', '1', '测试留言', '1399239571', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1298', '0', '0', '23', '42', '1', '下载中心', '1409552212', '80', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1299', '0', '0', '23', '42', '1', '论坛BBS', '1409552219', '90', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1300', '0', '0', '23', '147', '1', '公司简介', '1409554964', '10', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1301', '0', '0', '23', '147', '1', '发展历程', '1409554975', '20', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1302', '0', '0', '23', '147', '1', '新闻中心', '1409554988', '30', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1303', '0', '0', '23', '147', '1', '在线留言', '1409554999', '40', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1304', '0', '0', '23', '147', '1', '联系我们', '1409555008', '50', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1305', '0', '0', '64', '148', '1', 'PHPOK销售客服', '1409747629', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1753', '0', '582', '24', '45', '1', '小米(MI) 小米5 全网通4G手机 双卡双待', '1452570664', '0', '1', '0', '38', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1310', '0', '198', '65', '151', '1', '主题复制插件', '1412136071', '0', '1', '0', '83', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1311', '0', '204', '66', '152', '1', '测试论坛功能', '1412391521', '0', '1', '0', '9', '', '', '', '', '', '', '0', '23', '', '0');
INSERT INTO `qinggan_list` VALUES ('1334', '0', '204', '66', '152', '1', '测试', '1413063267', '0', '1', '0', '11', '', '', '', '', '', '', '0', '23', '', '0');
INSERT INTO `qinggan_list` VALUES ('1368', '0', '8', '22', '43', '1', 'EverEdit - 值得关注的代码编辑器', '1424912045', '0', '1', '0', '30', '', '', '', '', '', '', '1480329326', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1369', '0', '8', '22', '43', '1', '金山 WPS - 免费正版办公软件(支持Win/Linux/手机)', '1424916504', '0', '1', '0', '38', '', '', '', '', '', '', '1480329276', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1370', '0', '68', '22', '43', '1', 'MySQL出错代码', '1424918437', '0', '1', '0', '34', '', '', '', '', '', 'h', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1371', '0', '68', '22', '43', '1', 'MySQL安装后需要调整什么?', '1424918471', '0', '1', '0', '16', '', '', '', '', '', 'h', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1769', '0', '211', '68', '144', '1', '小米5', '1458702065', '0', '1', '0', '7', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1765', '0', '211', '68', '144', '1', 'Apple iPhone 5SE', '1458701924', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1423', '0', '68', '22', '43', '1', '日本东京2020年奥运会主会场使用ETFE膜', '1398700800', '0', '1', '0', '512', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1427', '0', '0', '64', '148', '1', '前台客服', '1446469762', '0', '1', '0', '0', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1756', '0', '0', '40', '87', '1', '公司简介', '1458467228', '10', '1', '0', '103', '', '', '', '', '', '', '0', '0', 'aboutus', '0');
INSERT INTO `qinggan_list` VALUES ('1757', '0', '0', '40', '87', '1', '联系我们', '1458474081', '40', '1', '0', '17', '', '', '', '', '', '', '0', '0', 'contactus', '0');
INSERT INTO `qinggan_list` VALUES ('1758', '0', '0', '40', '87', '1', '发展历程', '1458486519', '20', '1', '0', '22', '', '', '', '', '', '', '0', '0', 'development-course', '0');
INSERT INTO `qinggan_list` VALUES ('1759', '0', '0', '40', '87', '1', '工作环境', '1458486574', '30', '1', '0', '22', '', '', '', '', '', '', '0', '0', 'work', '0');
INSERT INTO `qinggan_list` VALUES ('1760', '0', '583', '24', '45', '1', '魅族 MX5 移动联通双4G手机 双卡双待', '1458626730', '0', '1', '0', '262', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1761', '0', '584', '24', '45', '1', '华为 P7 移动4G手机', '1458667195', '0', '1', '0', '12', '', '', '', '', '', '', '0', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1762', '0', '585', '24', '45', '1', 'vivo Xplay5 全网通4G手机 4GB+128GB 双卡双待', '1458668060', '0', '1', '0', '20', '', '', '', '', '', '', '1480393813', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1763', '0', '216', '24', '45', '1', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '1458669038', '0', '1', '0', '244', '', '', '', '', '', '', '1480398396', '0', '', '0');
INSERT INTO `qinggan_list` VALUES ('1772', '0', '0', '61', '142', '1', 'PHPOK.Com', '1459324936', '0', '1', '0', '0', '', '', '', '', '', '', '0', '23', '', '0');
INSERT INTO `qinggan_list` VALUES ('1802', '0', '0', '75', '386', '1', 'P2016033177U00023001', '1465808130', '0', '1', '0', '2', '', '', '', '', '', '', '0', '23', '', '0');

-- ----------------------------
-- Table structure for qinggan_list_21
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_21`;
CREATE TABLE `qinggan_list_21` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `link` longtext NOT NULL COMMENT '链接',
  `target` varchar(255) NOT NULL DEFAULT '_self' COMMENT '链接方式',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片播放器';

-- ----------------------------
-- Records of qinggan_list_21
-- ----------------------------
INSERT INTO `qinggan_list_21` VALUES ('1276', '1', '41', '0', 'http://www.phpok.com', '_blank', '1007');
INSERT INTO `qinggan_list_21` VALUES ('1277', '1', '41', '0', 'http://www.phpok.com', '_blank', '1007');
INSERT INTO `qinggan_list_21` VALUES ('1278', '1', '41', '0', 'http://www.phpok.com', '_blank', '1008');

-- ----------------------------
-- Table structure for qinggan_list_22
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_22`;
CREATE TABLE `qinggan_list_22` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` longtext NOT NULL COMMENT '内容',
  `note` longtext NOT NULL COMMENT '摘要',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章资讯';

-- ----------------------------
-- Records of qinggan_list_22
-- ----------------------------
INSERT INTO `qinggan_list_22` VALUES ('1368', '1', '43', '8', '724', '<p style=\"text-align: center;\"><img src=\"res/201502/26/auto_724.jpg\" alt=\"auto_724.jpg\"/></p><p>Everedit 结合众多编辑器的特点开发出的兼顾性能和使用、小巧的、强悍的文本编辑器。</p><blockquote><p>首先，要能够支持多种文档编码，显示和输入的时候不应该乱码。</p><p>其次，要能够对于常见的代码进行着色和自定义。</p><p>再者，要能够自定义键盘和工具等。</p></blockquote><p>对于绝大多数人而言，上面的功能就足够了。那么对于进阶者，可能要求更高一些。比如对于着色，有的人希望着色能够足够强大，显示自己定义的日记格式、折叠等；对于键盘，有的人希望能够多个按键组合触发命令，甚至模拟一些终端编辑器的操作，比如&nbsp;VIM，高手还希望这个编辑器的自定义性足够强，可玩度高，能够支持脚本和插件等等。那么很高兴的告诉大家，Everedit具备上面无论是初学者还是高手所期望的全部功能，而且非常的小巧，压缩包只有3M左右，无论是冷启动还是热启动都非常的迅速。</p><p>因为作者初开发这个目的就是做一个强化的 Editplus。所以在 Everedit 的身上，您能够找到很多这个编辑器的影子！</p><p>官网地址：<a href=\"http://www.everedit.net/\" target=\"_blank\" textvalue=\"http://www.everedit.net/\" style=\"color: rgb(255, 0, 0); text-decoration: underline;\"><span style=\"color: rgb(255, 0, 0);\">http://www.everedit.net/</span></a></p><p><br/></p>', 'EverEdit 是一款相当优秀国产的免费文本(代码)编辑器，最初这项目是为了解决 EditPlus 的一些不足并增强其功能而开始的，比如 Editplus 的着色器较为简陋，无法进行复杂着色，如markdown语法; 也不支持自动完成, 还有多点 Snippet 等等。');
INSERT INTO `qinggan_list_22` VALUES ('1369', '1', '43', '8', '725', '<p style=\"text-align: center;\"><img src=\"res/201502/26/auto_725.jpg\" alt=\"auto_725.jpg\"/></p><p>一直以来办公软件市场份额都是被微软的 Office&nbsp;牢牢占据，但其价格较贵，国内大多都是用着盗版。其实国产免费的 WPS 已经完完全全可以和Office媲美，且完美兼容各种doc、docx、xls、xlsx、ppt等微软文档格式！</p><p>金山 WPS Office 作为优秀免费国产软件，一直在用户中口碑相当好！它完全免费，体积小巧，跨平台支持Win、Linux、Android 和 iOS，兼容微软包括最新的&nbsp;Office2013&nbsp;在内的各种文档格式，几乎可以完美替代收费的&nbsp;Office。另外&nbsp;WPS 新增了用于协同工作的「轻办公」，适合国情的大量在线模版、范文、素材库等也都让其更加适合国人使用……</p><p>WPS Office 全面采用了「扁平化」界面设计，看起来非常专业时尚！它包含3个主要组件：文字、表格和演示，分别对应微软 MS Office 的 Word、Excel和PowerPoint，并且针对国内用户的习惯，WPS提供更多适合国人使用的模版。在界面和操作使用上也很相似，如果你习惯了用Office，那么你几乎可以不用重新学习即可马上熟练使用WPS。</p><p>WPS Office 深度兼容 Microsoft Office 的文档格式，你可以直接保存和打开 Microsoft Word、Excel 和 PowerPoint 文件；也可以用 Microsoft Office轻松编辑 WPS 系列文档。经测试，微软新的 docx、xlsx等格式打开都非常正常，兼容接近完美。</p><p>目前金山 WPS 已经提供了包括 Windows、Linux、Android 和 iOS 等系统的版本，而且它们通过轻办公的云服务将用户文档完全打通，轻松实现随时随地的移动办公，相比目前市面上很多 Office 类的软件都要方便得多。</p><p>对于非重度办公的用户而言，金山WPS&nbsp;和&nbsp;微软Office&nbsp;在界面和使用上其实并没有很大的差别，由于WPS有着良好的兼容性，实测几乎所有文档均能正常打开，完全可以替代MS Office。具体 WPS 和 MS Office 的技术谁更先进其实我们并不需要了解，免费好用才是王道！免去什么激活啊，什么注册码的麻烦，直接安装就可以免费使用，随时升级，这省下多少心呢！</p><p>最后，感谢金山给国人带来如此优秀实用的一款免费正版办公软件！</p>', '一直以来办公软件市场份额都是被微软的 Office 牢牢占据，但其价格较贵，国内大多都是用着盗版。其实国产免费的 WPS 已经完完全全可以和Office媲美，且完美兼容各种doc、docx、xls、xlsx、ppt等微软文档格式！');
INSERT INTO `qinggan_list_22` VALUES ('1370', '1', '43', '68', '', '<p>1005：创建表失败</p><p>1006：创建数据库失败</p><p>1007：数据库已存在，创建数据库失败</p><p>1008：数据库不存在，删除数据库失败</p><p>1009：不能删除数据库文件导致删除数据库失败</p><p>1010：不能删除数据目录导致删除数据库失败</p><p>1011：删除数据库文件失败</p><p>1012：不能读取系统表中的记录</p><p>1020：记录已被其他用户修改</p><p>1021：硬盘剩余空间不足，请加大硬盘可用空间</p><p>1022：关键字重复，更改记录失败</p><p>1023：关闭时发生错误</p><p>1024：读文件错误</p><p>1025：更改名字时发生错误</p><p>1026：写文件错误</p><p>1032：记录不存在</p><p>1036：数据表是只读的，不能对它进行修改</p><p>1037：系统内存不足，请重启数据库或重启服务器</p><p>1038：用于排序的内存不足，请增大排序缓冲区</p><p>1040：已到达数据库的最大连接数，请加大数据库可用连接数</p><p>1041：系统内存不足</p><p>1042：无效的主机名</p><p>1043：无效连接</p><p>1044：当前用户没有访问数据库的权限</p><p>1045：不能连接数据库，用户名或密码错误</p><p>1048：字段不能为空</p><p>1049：数据库不存在</p><p>1050：数据表已存在</p><p>1051：数据表不存在</p><p>1054：字段不存在</p><p>1065：无效的SQL语句，SQL语句为空</p><p>1081：不能建立Socket连接</p><p>1114：数据表已满，不能容纳任何记录</p><p>1116：打开的数据表太多</p><p>1129：数据库出现异常，请重启数据库</p><p>1130：连接数据库失败，没有连接数据库的权限</p><p>1133：数据库用户不存在</p><p>1141：当前用户无权访问数据库</p><p>1142：当前用户无权访问数据表</p><p>1143：当前用户无权访问数据表中的字段</p><p>1146：数据表不存在</p><p>1147：未定义用户对数据表的访问权限</p><p>1149：SQL语句语法错误</p><p>1158：网络错误，出现读错误，请检查网络连接状况</p><p>1159：网络错误，读超时，请检查网络连接状况</p><p>1160：网络错误，出现写错误，请检查网络连接状况</p><p>1161：网络错误，写超时，请检查网络连接状况</p><p>1062：字段值重复，入库失败</p><p>1169：字段值重复，更新记录失败</p><p>1177：打开数据表失败</p><p>1180：提交事务失败</p><p>1181：回滚事务失败</p><p>1203：当前用户和数据库建立的连接已到达数据库的最大连接数，请增大可用的数据库连接数或重启数据库</p><p>1205：加锁超时</p><p>1211：当前用户没有创建用户的权限</p><p>1216：外键约束检查失败，更新子表记录失败</p><p>1217：外键约束检查失败，删除或修改主表记录失败</p><p>1226：当前用户使用的资源已超过所允许的资源，请重启数据库或重启服务器</p><p>1227：权限不足，您无权进行此操作</p><p>1235：MySQL版本过低，不具有本功能</p><p><br/></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1371', '1', '43', '68', '', '<p>面对MySQL的DBA或者做MySQL性能相关的工作的人，我最喜欢问的问题是，在MySQL服务器安装后，需要调整什么，假设是以缺省的设置安装的。</p><p>我很惊讶有非常多的人没有合理的回答，很多的MySQL服务器都在缺省的配置下运行。</p><p>尽管可以调整非常多的MySQL服务器变量，但是在通常情况下只有少数的变量是真正重要的。在设置完这些变量以后，其他变量的改动通常只能带来相对有限的性能改善。</p><p><strong>key_buffer_size</strong>：非常重要，如果使用MyISAM表。如果只使用MyISAM表，那么把它的值设置为可用内存的30%到40%。恰当的大小依赖索引的数量、数据量和负载 ----记住MyISAM使用操作系统的cache去缓存数据，所以也需要为它留出内存，而且数据通常比索引要大很多。然而需要查看是否所有的 key_buffer总是在被使用 ---- key_buffer为4G而.MYI文件只有1G的情况并不罕见。这样就有些浪费了。如果只是使用很少的MyISAM表，希望它的值小一些，但是仍然至少要设成16到32M，用于临时表（占用硬盘的）的索引。</p><p><strong>innodb_buffer_pool_size</strong>：非常重要，如果使用Innodb表。相对于MyISAM表而言，Innodb表对buffer size的大小更敏感。在处理大的数据集（data set）时，使用缺省的key_buffer_size和innodb_buffer_pool_size，MyISAM可能正常工作，而Innodb可能就是慢得像爬一样了。同时Innodb buffer pool缓存了数据和索引页，因此不需要为操作系统的缓存留空间，在只用Innodb的数据库服务器上，可以设成占内存的70%到80%。上面 key_buffer的规则也同样适用 ---- 如果只有小的数据集，而且也不会戏剧性地增大，那么不要把innodb_buffer_pool_size设得过大。因为可以更好地使用多余的内存。</p><p></p><p><strong>innodb_additional_pool_size</strong>：这个变量并不太影响性能，至少在有像样的（decent）内存分配的操作系统中是这样。但是仍然需要至少设为20MB（有时候更大），是Innodb分配出来用于处理一些杂事的。</p><p><strong>innodb_log_file_size</strong>：对于以写操作为主的负载(workload)非常重要，特别是数据集很大的时候。较大的值会提高性能，但增加恢复的时间。因此需要谨慎。我通常依据服务器的大小（server size）设置为64M到512M。</p><p><strong>innodb_log_buffer_size</strong>：缺省值在中等数量的写操作和短的事务的大多数负载情况下是够用的。如果有大量的UPDATE或者大量地使用blob，可能需要增加它的值。不要把它的值设得过多，否则会浪费内存--log buffer至少每秒刷新一次，没有必要使用超过一秒钟所需要的内存。8MB到16MB通常是足够的。小一些的安装应该使用更小的值。</p><p><strong>innodb_flush_logs_at_trx_commit</strong>：为Innodb比MyISAM慢100倍而哭泣？可能忘记了调整这个值。缺省值是1，即每次事务提交时都会把日志刷新到磁盘上，非常耗资源，特别是没有电池备份的cache时。很多应用程序，特别是那些从MyISAM表移植过来的，应该把它设成2。意味着只把日志刷新到操作系统的cache，而不刷新到磁盘。此时，日志仍然会每秒一次刷新到磁盘上，因此通常不会丢失超过1到2秒的更新。设成0会更快一些，但安全性差一些，在MySQL服务崩溃的时候，会丢失事务。设成2只会在操作系统崩溃的时候丢失数据。</p><p></p><p><strong>table_cache</strong>：打开表是昂贵的（耗资源）。例如，MyISAM表在MYI文件头做标记以标明哪些表正在使用。您不会希望这样的操作频繁发生，通常最好调整cache 大小，使其能够满足大多数打开的表的需要。它使用了一些操作系统的资源和内存，但是对于现代的硬件水平来说通常不是问题。对于一个使用几百个表的应用， 1024是一个合适的值（注意每个连接需要各自的缓存）。如果有非常多的连接或者非常多的表，则需要增大它的值。我曾经看到过使用超过100000的值。</p><p></p><p><strong>thread_cache</strong>：线程创建/销毁是昂贵的，它在每次连接和断开连接时发生。我通常把这个值至少设成16。如果应用有时会有大量的并发连接，并且可以看到 threads_created变量迅速增长，我就把它的值调高。目标是在通常的操作中不要有线程的创建。</p><p><strong>query_cache</strong>：如果应用是以读为主的，并且没有应用级的缓存，那么它会有很大帮助。不要把它设得过大，因为它的维护可能会导致性能下降。通常会设置在32M到 512M之间。设置好后，经过一段时间要进行检查，看看是否合适。对于某些工作负载，缓存命中率低于会就启用它。</p><p>注意：就像看到的，上面所说的都是全局变量。这些变量依赖硬件和存储引擎的使用，而会话级的变量（per session variables）则与特定的访问量(workload)相关。如果只是一些简单的查询，就没有必要增加sort_buffer_size，即使有 64G的内存让您去浪费。而且这样做还可能降低性能。我通常把调整会话级的变量放在第二步，在我分析了访问量（或负载）之后。</p><p>此外在MySQL分发版中包含了一些my.cnf文件的例子，可以作为非常好的模板去使用。如果能够恰当地从中选择一个，通常会比缺省值要好。</p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1399', '1', '43', '68', '', '<p ></p><ul><li >PTFE膜材&mdash;&mdash;耐久性强，使用寿命在30年以上</li><li >PTFE膜材&mdash;&mdash;是永久性建筑的首选材料</li><li >PTFE膜材&mdash;&mdash;超自洁，防火材料</li><li >PTFE膜材&mdash;&mdash;专业化的加工工艺，严格的施工规程<br /> 膜结构建筑中最常用的膜材料。PTFE膜材料是指在极细的玻璃纤维（3微米）编织成的基布上涂上PTFE（聚四氟乙烯）树脂而形成的复合材料。PVC膜材料是指在聚酯纤维编织的基布上涂上PVC（聚氟乙烯）树脂而形成的复合材料。</li></ul>', '');
INSERT INTO `qinggan_list_22` VALUES ('1400', '1', '43', '68', '', '<p ></p><ul><li >PTFE膜材&mdash;&mdash;耐久性强，使用寿命在30年以上</li><li >PTFE膜材&mdash;&mdash;是永久性建筑的首选材料</li><li >PTFE膜材&mdash;&mdash;超自洁，防火材料</li><li >PTFE膜材&mdash;&mdash;专业化的加工工艺，严格的施工规程<br /> 膜结构建筑中最常用的膜材料。PTFE膜材料是指在极细的玻璃纤维（3微米）编织成的基布上涂上PTFE（聚四氟乙烯）树脂而形成的复合材料。PVC膜材料是指在聚酯纤维编织的基布上涂上PVC（聚氟乙烯）树脂而形成的复合材料。</li></ul>', '');
INSERT INTO `qinggan_list_22` VALUES ('1401', '1', '43', '68', '', '<p ></p><pid=\"MyContent\"><p>  2020年东京奥运会和残奥会筹备委员会公布了作为东京奥运会主会场的新国立竞技场的概念图。</p><p>　　国际奥委会全会当地时间9月7日在阿根廷首都布宜诺斯艾利斯投票选出2020年夏季奥运会的主办城市。日本东京最终击败西班牙马德里和土耳其伊斯坦布尔，获得2020年夏季奥运会举办权。</p><p></p><p ></p><p align=\"center\"><img id=\"23416362\" align=\"center\" src=\"res/201509/02/1441090082_0_293.jpg\" width=\"602\" height=\"276\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416363\" align=\"center\" src=\"res/201509/02/1441090082_1_175.jpg\" width=\"600\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416364\" align=\"center\" src=\"res/201509/02/1441090082_2_260.jpg\" width=\"598\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p align=\"center\"></p><p >据了解，日本新国家体育场效果图是由东京奥运会审查委员会从全球募集的众多设计图中评选而出，该设计图出自的伊拉克女建筑家扎哈-哈迪德之手，从效果图来看，日本新国家体育场外观采用了全新的流线型设计，审查委员会给予了&ldquo;内部空间感强烈，与东京都城市空间相呼应&rdquo;、&ldquo;可开闭式天窗增加了体育场的实用性&rdquo;等高度评价。</p><p >根据计算，日本新国家体育场的扩建总花费将达到1300亿日元（约人民币78亿元），预计竣工时间为2019年3月，该体育场作为2020年东京奥运会比赛主会场，届时奥运会的开幕式、闭幕式、足球、田径等项目都将在该会场举行。</p><p ></p><p></p><p></p><p></p><p></p></p><p ></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1402', '1', '43', '68', '', '<p ><span >2014年，建筑节能与科技工作按照党中央、国务院关于深化改革的总体要求，围绕贯彻落实党的十八大、十八届三中全会关于生态文明建设的战略部署和住房城乡建设领域中心工作，创新机制、整合资源、提高效率、突出重点、以点带面，积极探索集约、智能、绿色、低碳的新型城镇化发展道路，着力抓好建筑节能和绿色建筑发展，努力发挥科技对提升行业发展水平的支撑和引领作用。</span></p><p >　　大力推进绿色建筑发展 实施&ldquo;建筑能效提升工程&rdquo;</p><p >　　研究制订&ldquo;建筑能效提升工程路线图&rdquo;，明确中长期发展目标、原则、总体思路和策略以及政策取向，为制订&ldquo;十三五&rdquo;建筑节能规划奠定基础。</p><p >　　继续抓好《绿色建筑行动方案》的贯彻落实工作。继续实施绿色生态城区示范，加大绿色建筑和绿色基础设施建设推广力度，强化质量管理。重点做好政府办公建筑、政府投资的学校、医院、保障性住房等公益性建筑强制执行绿色建筑标准工作。</p><p >　　稳步提升新建建筑节能质量和水平。做好新修订发布的民用建筑节能设计标准贯彻实施工作。加大抓好新建建筑在施工阶段执行标准的监管力度。总结国际国内先进经验，开展高标准建筑节能示范区试点。强化民用建筑规划阶段节能审查、节能评估、民用建筑节能信息公示、能效测评标识等制度。</p><p >　　继续开展既有居住建筑节能改造。确保完成北方采暖区既有居住建筑供热计量及节能改造1.7亿平方米以上，督促完成节能改造的既有居住建筑全部实行供热计量收费。力争完成夏热冬冷地区既有居住建筑节能改造1800万平方米以上。</p><p >　　提高公共建筑节能运行管理与改造水平。进一步做好省级公共建筑能耗动态监测平台建设工作。推动学校、医院等公益性行业和大型公共建筑节能运行与管理。指导各地分类制订公共建筑能耗限额标准，研究建立基于能耗限额的公共建筑节能管理制度。加快推行合同能源管理。积极探索能效交易等节能新机制。<img src=\"res/201509/02/1441090074_0_254.jpg\" border=\"0\" alt=\"\" /></p><p >　　推进区域性可再生能源建筑规模化应用。总结光伏建筑一体化示范项目经验，扩大自发自用光伏建筑应用规模。继续抓好可再生能源示范省、市、县(区)工作，推动资源条件具备的省(区、市)针对成熟的可再生能源应用技术尽快制定强制性推广政策。</p><p >　　加强和完善绿色建筑评价管理工作。修订印发《绿色建筑评价标识管理办法》和《绿色建筑评价技术细则》。加大对绿色建筑标识评价的指导监督力度，加强绿色建筑评价标准贯彻实施培训，引导和支持地方出台鼓励绿色建筑发展的政策措施。</p><p ><span >转载钢构之窗</span></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1403', '1', '43', '68', '', '<p ><span >建筑钢结构的发展揭开城市发展新篇章</span></p><p ><br /><br /> 建筑钢结构产业的发展是我国经济实力和科技水平快速发展的具体体现。近年来，在高层重型钢结构、大跨度空间钢结构、轻钢结构、钢-混凝土组合结构、钢结构住宅的共同发展推动下，我国城市经济快速发展。这些钢结构的广泛运用展示和证明了它的建筑魅力，以及无限的发展空间。<br /><br /><strong>　　高层重型钢结构成为城市的重要标志<br /></strong><br />高层钢结构建筑是一个国家经济实力和科技水平的反映，也往往被当作是一个城市的重要标志性建筑。在超高层建筑中往往采用部分钢结构或全钢结构建造，超高层建筑的发展体现了我国建筑科技水平、材料工业水平和综合技术水平的提高。</p><p ><img src=\"res/201509/02/1441090069_0_873.jpg\" alt=\"\" /></p><p >　　建筑钢结构揭开城市发展新篇章</p><p >　　从20世纪80年代至今我国已建成和在建高层钢结构达80多幢，总面积约600万平方米，钢材用量60多万吨。高层、超高层建筑的楼板和屋盖具有很大的平面刚度，是竖向钢柱与剪力墙或筒体的平面抗侧力构件，能使钢柱与各竖向构件起到变形协调作用。北京和上海新建和在建高层钢结构房屋数量超过了10幢。如上海环球金融中心101层，高492米，用钢量6.5万吨，中关村金融中心建筑面积11万平方米，高度为150米，用钢量1.5万吨。今后，全国每年将有200万平方米至300万平方米高层钢结构建筑施工，用钢量约45万吨。<br /><br /><strong>　　大跨度空间钢结构持续发展</strong><br /><br />近年来，以网架和网壳为代表的空间结构继续大量发展，不仅用于民用建筑，而且用于工业厂房、候机楼、体育馆、大剧院、博物馆等。开发空间钢结构的新材料、新结构、新技术、新节点、新工艺，实现大跨度与超大跨度空间钢结构的抗风抗震工程建设。展望未来，应在重点、热点、难点的科技领域开拓和发展各类新型、适用、美观的空间钢结构，并且无论在使用范围、结构型式、安装施工工法等方面均具有中国建筑结构的特色。如杭州、成都、西安、长春、上海、北京、武汉、济南、郑州等地的飞机航站楼、机库、会展中心等建筑，都采用圆钢管、矩型钢管制作为空间桁架、拱架及斜拉网架结构，其新颖和富有现代特色的风格使它们成为所在中心城市的标志性建筑。<br /><br />据中国钢结构协会空间结构分会统计：网架和网壳的生产已趋于平稳状态，每年建造1500座，约250万平方米，用钢约7万吨，悬索和膜结构目前处于发展阶段，用量还不大，专家预计每年将以20%的速度增加。随着我国经济建设的蓬勃发展和人民生活水平的不断提高，根据实际需要将在我国研究、设计、制作和安装150米至200米，甚至将大于200米的大跨度与超跨度的空间钢结构。</p><p ><strong>　揭开轻</strong><strong>钢结构</strong><strong>新的篇章</strong><br /><br />轻钢结构是相对于重钢结构而言的，其类型有门式刚架、拱型波纹钢屋盖结构等，用钢量（不含钢筋用量）一般为每平方米30公斤。门式刚架房屋跨度一般不超过40米，个别达到70多米，单跨或多跨均用，以单层为主，也可用于二层或三层建筑，拱型波纹钢屋盖结构跨度一般为8米，每平方米自重仅为20公斤，每年增长约100万平方米，用钢4万吨。门式刚架和拱型波纹钢屋盖都有相应的设计施工规程、专用软件和通用图集。<br /><br />自进入20世纪90年代以来，我国钢结构建筑的发展十分迅速，特别是一些代表城市标志性高层建筑的建成，为钢结构在我国的发展揭开了新的一页。如世界第三高的金茂大厦已竣工，现已投入运营。据了解，世界第一高度的上海浦东环球金融中心，高460米，建筑面积为31万平方米，现正在加紧建设中。由外商投资的大连总统大厦，正在加紧筹建之中，共95层，建成后其高度将名列世界前茅。</p><p ></p><p ><img src=\"res/201509/02/1441090069_1_435.jpg\" alt=\"\" /></p><p >　　建筑钢结构的发展 揭开城市发展新篇章</p><p ><br /><br />轻钢结构的发展则更是如火如荼，特别在工业厂房的建设中则更为迅猛。从钢结构制造加施工企业数量的大幅增长就可见一斑，如上海市的钢结构制造和施工单位已由原来的几十家发展到现在的400多家，仅上海的宝钢地区就有近百家的钢结构制造厂。<br /><br /><strong>　　钢-混凝土组合结构发展迅速</strong><br /><br />钢-混凝土组合结构是充分发挥钢材和混凝土两种材料各自优点的合理组合，不但具有优良的静、动力工作性能，而且能大量节约钢材、降低工程造价和加快施工进度，同时，对环境污染也较小，符合我国建筑结构发展的方向。<br /><br />钢-混凝土组合结构在我国发展十分迅速，已广泛应用于冶金、造船、电力、交通等部门的建筑中，并以迅猛的势头进入桥梁工程和高层、超高层建筑中。<br /><br />我国已采用钢-混凝土组合结构建成了许多大型的公路拱桥，如广州丫鬓沙大桥，桥长360米，重庆万州长江大桥，跨度420米，前者为钢管混凝土拱桥，后者为劲性钢管混凝土骨架拱桥。全国建成的组合结构拱桥已超过300座。在高层建筑方面，建成了全部采用组合结构的超高层建筑--深圳赛格广场大厦，高291.6米，属世界最高的钢-混凝土组合结构。全国已建成的采用组合结构的高层建筑也已超过40幢。<br /><br />钢-混凝土组合中的薄壁型钢主要有百叶薄壁型钢和装配式薄壁型钢等形式。其中，许多类型均能与混凝土有效地结合，共同承受外界弯矩和剪力，有的类型为装配式截面，布置较为灵活，可适用于不同截面尺寸的轻钢组合梁，并可作为标准型材批量生产，但在浇混凝土之前必须用框架固定其形状，有的为箱形薄壁型钢截面，与混凝土的粘结性能较差，一般只起到模板的作用。此外，还可根据实际需要，在薄壁型钢混凝土梁中配置一定数量的纵向钢筋，以进一步提高其抗弯刚度和极限承载力。<br /><br /><strong>　　钢结构住宅的发展走向</strong><br /><br />钢结构住宅具有强度高、自重轻、抗震性能好、施工速度快、结构构件尺寸小、工业化程度高的特点，同时钢结构又是可重复利用的绿色环保材料，因此钢结构住宅符合国家产业政策的推广项目。随着国家禁用实心粘土砖和限制使用空心粘土砖政策的推出，加快住宅产业化进程、积极推广钢结构住宅体系已迫在眉睫。但我国的钢结构住宅尚处于探索起步阶段，这种体系在钢结构防火、梁柱节点做法、楼板形式、配套墙体材料、经济性及市场可接受程度上尚有许多不完善之处。<br /><br />因此，发挥钢结构住宅的自身优势，可提高住宅的综合效益：一是用钢结构建造的住宅重量是钢筋混凝土住宅重量的1/2左右，可满足住宅大开间的需要，使用率也比钢筋混凝土住宅提高4%左右。二是抗震性能好，其延性优于钢筋混凝土。从国内外震后调查结果看，钢结构住宅建筑倒塌数量是最少的。三是钢结构构件、墙板及有关部品都在工厂制作，其质量可靠，尺寸精确，安装方便，易与相关部品配合，因此，不仅减少了现场工作量，而且也缩短了施工工期。钢结构住宅工地实质上是工厂产品的组装和集成场所，再补充少量无法在工厂进行的工序项目，符合产业化的要求。四是钢结构住宅是环保型的建筑，可以回收循环利用，污染很少，符合推进住宅产业化和发展节能省地型住宅的国家政策。</p><p ></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1404', '1', '43', '68', '', '<p ><p id=\"zoom2\"><p><font3 face=\"Verdana\"></font3>2013中国上海国际膜结构应用与工程技术展览</p><p><font3 face=\"Verdana\"></font3>同期举办：第二十四届中国国际绿色建筑建材博览会<br /> 第十五届中国上海国际园林、景观及别墅配套设施展览会<br /> 时间：2013年8月15日-17日 地点：上海新国际博览中心（龙阳路2345号）<br /><span class=\"Apple-converted-space\"></span><br /> 组织单位： 协办单位：<br /> 中国膜结构建筑行业专委会 上海市城乡建设和交通委员会<br /> 中国钢结构协会空间结构分会 中国房地产企业管理协会<br /> 中国风景园林绿化协会 上海市房地产协 <br /> 上海市园林景观学会 媒体推广：<br /> 香港博亚国际展览集团 中国膜结构网<br /> 承办单位： 《别墅》杂志<span class=\"Apple-converted-space\"></span><br /> 上海京慕展览策划有限公司《景观设计》杂志<br /><span class=\"Apple-converted-space\"></span><br /> 目前，在全球范围内索膜结构无论在工程界还是在科研领域均处于热潮中。近年来，我国建筑市场对索膜建筑技术的需求明显有大幅度增长的趋势，国外各大著名索膜技术专业公司纷纷登陆我国，刺激了我国索膜建筑事业的发展。现代建筑环境是现代城市，现代文化与社会，现代人的生活和观念的综合表象。展现人的个性化，自娱性和多元性环境空间方面，膜结构以其独具魅力的建筑形式，必将会在环境建设中得到越来越广泛的应用。由于新材料、新形式的不断出现，膜结构具有强大的生命力，必将是21世纪建筑结构发展的主流。它的应用范围不仅限于体育或展览建筑，已向房屋建筑的各个方面扩展，因而具有广阔的发展前景。在中国，膜结构的开发与研究还刚刚起步，因此当务之急是学习并引进国外先进技术，开发生产我国自己的膜材，解决设计中存在的问题，膜结构在中国也将会得到越来越多的应用。故此，特举办&ldquo;2013中国上海国际膜结构应用与工程技术展览会&rdquo;，为行业搭建一次合作、交流的平台。</p></p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1405', '1', '43', '68', '', '<p ><imgborder=\"0\" alt=\"\" width=\"913\" height=\"4495\" src=\"res/201509/02/1441090048_0_167.png\" /></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1406', '1', '43', '68', '', '<p >住建部发布了《城镇污水再生利用技术指南(试行)》(以下简称《技术指南》)用以指导城镇污水处理再生利用的规划、设施建设运行和管理。《技术指南》涵盖城镇污水再生利用技术路线、城镇污水再生处理技术、城镇污水再生处理工艺方案、城镇污水再生利用工程建设与设施运行维护、城镇污水再生利用风险管理等内容。</p><p ><strong >　　污水再生处理技术：常规处理、深度处理和消毒</strong></p><p >　　《技术指南》详细介绍了城镇污水再生处理技术，主要包括常规处理、深度处理和消毒。常规处理包括一级处理、二级处理和二级强化处理。主要功能为去除SS、溶解性有机物和营养盐(氮、磷)。深度处理包括混凝沉淀、介质过滤(含生物过滤)、膜处理、氧化等单元处理技术及其组合技术，主要功能为进一步去除二级(强化)处理未能完全去除的水中有机污染物、SS、色度、嗅味和矿化物等。消毒是再生水生产环节的必备单元，可采用液氯、氯气、次氯酸盐、二氧化氯、紫外线、臭氧等技术或其组合技术。</p><p >　　《技术指南》强调，城市污水再生处理系统应优先发挥常规处理在氮磷去除方面的功能，一般情况下应避免在深度处理中专门脱氮。</p><p ><strong >　　单元处理技术有机组合 保证不同用途水质要求</strong></p><p >　　《技术指南》指出，再生水的主要用途包括工业、景观环境、绿地灌溉、农田灌溉、城市杂用和地下水回灌等。污水再生处理工艺方案应根据不同用途的水质要求，选择不同的单元技术进行组合，并考虑工艺的可行性、整体流程的合理性、工程投资与运行成本以及运行管理方便程度等多方面因素，同时宜具有一定的前瞻性。《技术指南》针对各种不同用途给出了具体的工艺方案建议。对于向服务区域内多用户供水的城镇污水再生处理设施，供水水质应符合用水量最大的用户的水质要求;个别水质要求更高的用户，可自行增加处理措施，直至达到其水质要求。</p><p ><strong >　　风险管理核心：保证城镇污水再生利用的水质安全</strong></p><p >　　《技术指南》在城镇污水再生利用风险管理中强调，城镇污水再生利用必须保证再生水水源水质水量的可靠、稳定与安全，水源宜优先选用生活污水或不包含重污染工业废水在内的城市污水。要加强对污水接入城镇排水管网的许可管理，禁止含重金属、有毒有害有机物和病原微生物超标的工业或医疗等污水进入排水管网。</p><p >　　城镇污水再生利用的核心问题是水质安全。污水再生处理、存储及输配设施运营单位应具备相应的水质检测能力。另外，应制定针对重大事故和突发事件的应急预案，建立相应的应急管理体系，并按规定定期开展培训和演练。</p><p ><strong >　　城镇污水再生利用工程建设与设施运行维护</strong></p><p >　　在工程建设方面，《技术指南》指出，工程建设包括再生处理设施、再生水储存设施及再生水输配管网的建设，《技术指出》对选址、设计、设备选择、施工、验收等环节均提出指导建议。</p><p >　　在设施运行维护管理方面，《技术指南》指出，污水再生处理设施运营单位应加强对来水水质的日常监测，应依据污水排放&mdash;污水处理&mdash;再生水利用三者之间的水质关系，以及再生水用途和水质要求，建立水源水质控制目标。同时，应定期对储存设施进行检查，防止再生水泄漏或污染物入渗;定期对存储的再生水水质、水量进行监测，防止水质恶化;再生水作为城市河道或其他景观水系用水时，在汛期时，应服从统一调度，确保排水排涝畅通。</p><p ><strong >　　城镇污水再生利用 要合理布局统筹规划</strong></p><p >　　城镇污水再生利用规划是城镇排水与污水处理规划的重要内容。《技术指南》指出，污水处理厂的建设应考虑再生利用的需求，统一规划、统筹建设，对于暂时没有再生水需求的地方可以在污水处理厂规划过程中预留深度处理设施位置和接口。污水再生处理、储存和输配设施的布局应综合考虑水源和再生水用户的分布，统筹规划。再生水可通过压力管网、河道或供水车等方式输送至用户，管网的布置形式可选择环状或枝状管网，枝状管网末端需设置泄水设施;应考虑输配过程的加压、消毒及维护抢修站点用地等。再生水的储存和输配可充分利用城市景观水系。</p><p ><span >来源：中国污水处理工程网</span></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1407', '1', '43', '68', '', '<p ><span >摘　要: 本文主要介绍了选择中小规模城市污水处理厂工艺流程的依据、原则和方法, 并根据不同的条件推荐了适用的工艺流程。</span></p><p >关键词: 城市污水处理; 工艺流程; 原则; 方法</p><p ><br />1　前言</p><p >根据我国发展规划, 2010 年全国设市城市和建制镇的污水平均处理率不低于50% , 设市城市的污水处理率不低于60% , 重点城市的污水处理率不低于70%。为了引导城市污水处理及污染防治技术的发展, 加快城市污水处理设施的建设, 2000 年5 月国家建设部、环境保护局和科技部联合印发了《城市污水处理及污染防治技术政策》。本文将结合该政策的内容, 主要研究日处理能力为10 万m 3 以下, 特别是1～ 5 万m 3.d 规模的城市污水处理厂适用的各种处理工艺流程的比较和选择, 从而确定不同条件下适用的较优工艺流程。</p><p >1　中小规模城市污水处理厂工艺流程概述</p><p >二级生物处理指利用水中的微生物来去除污水中的碳源有机物, 二级强化生物处理是指除利用微生物来去除污水中的碳源有机物外, 还需去除污水中的<span class=\"keyword\">氮</span>和磷。城市污水二级及二级强化处理一般以好氧生物处理为主, 好氧处理可分为活性污泥法和生物膜法两大类。<br />活性污泥法是利用河川自净原理, 人工创建的生化净化污水处理方法。中小规模城市污水厂适用的方法主要有AB 法、SBR 法、氧化沟法、AO 法、 A 2O 法、水解好氧法等。</p><p >生物膜法是利用土壤自净原理发展起来的, 通过附着在各种载体上的生物膜来处理污水的好氧生物处理法, 主要包括生物转盘、生物滤池和生物接触氧化法等工艺。</p><p >2　污水处理工艺流程选择的依据和原则</p><p >2. 1　污水处理级别的确定</p><p >选择污水处理工艺流程时首先应按受纳水体的性质确定出水水质要求, 并依此确定处理级别, 排水应达到国家排放标准(GB8978- 1996)。<br />设市城市和重点流域及水资源保护区的建制镇必须建设二级污水处理设施; 受纳水体为封闭或半封闭水体时, 为防治富营养化, 城市污水应进行二级强化处理, 增强除磷脱<span class=\"keyword\">氮</span>的效果; 非重点流域和非水源保护区的建制镇, 根据当地的经济条件和水污染控制要求, 可先行一级强化处理, 分期实现二级处理。</p><p >2. 2　工艺流程选择应考虑的技术因素</p><p >处理规模; 进水水质特性, 重点考虑有机物负荷、<span class=\"keyword\">氮</span>磷含量; 出水水质要求, 重点考虑对<span class=\"keyword\">氮</span>磷的要求以及回用要求; 各种污染物的去除率; 气候等自然条件, 北方地区应考虑低温条件下稳定运行; 污泥的特性和用途。 2. 3　工艺流程选择应考虑的技术经济因素〔3〕批准的占地面积, 征地价格; 基建投资; 运行成本; 自动化水平, 操作难易程度, 当地运行<span class=\"keyword\">管</span>理能力。</p><p >2. 4　工艺流程选择的原则</p><p >保证出水水质达到要求; 处理效果稳定, 技术成熟可靠、先进适用; 降低基建投资和运行费用, 节省电耗; 减小占地面积; 运行<span class=\"keyword\">管</span>理方便, 运转灵活; 污泥需达到稳定; 适应当地的具体情况; 可积极稳妥地选用污水处理新技术。</p><p >3　污水处理工艺流程的比较和选择方法〔2、3、4、5〕</p><p >在选定污水处理工艺流程时可以采用下面介绍的一种或几种比较方法。</p><p >3. 1　技术比较</p><p >在方案初选时可以采用定性的技术比较, 城市污水处理工艺应根据处理规模、水质特性、排放方式和水质要求、受纳水体的环境功能以及当地的用地、气候、经济等实际情况和要求, 经全面的技术比较和初步经济比较后优选确定。</p><p >方案选择比较时需要考虑的主要技术经济指标包括: 处理单位水量投资、削减单位污染物投资、处理单位水量电耗和成本、削减单位污染物电耗和成本、占地面积、运行性能可靠性、<span class=\"keyword\">管</span>理维护难易程度、总体环境效益等。</p><p >定性比较时可以采用有定论的结论和经验值等, 而不必进行详细计算。几种常用生物处理方法的比较见表1。</p><img alt=\"\" src=\"res/201509/02/1441090034_0_765.jpg\"/><p ><br />3. 2　经济比较</p><p >在选定最终采用的工艺流程时, 应选择2～ 3 种工艺流程进行全面的定量化的经济比较。可以采用年成本法或净现值法进行比较。</p><p >3. 2. 1　年成本法。将各方案的基建投资和年经营费用按标准投资收益率, 考虑复利因素后, 换算成使用年限内每年年末等额偿付的成本- 年成本, 比较年成本最低者为经济可取的方案。</p><p >3. 2. 2　净现值法。将工程使用整个年限内的收益和成本(包括投资和经营费) 按照适当的贴现率折算为基准年的现值, 收益与成本现行总值的差额即净现值, 净现值大的方案较优。</p><p >3. 2. 3　多目标决策法。多目标决策是根据模糊决策的概念, 采用定性和定量相结合的系统评价法。按工程特点确定评价指标, 一般可以采用5 分制评分, 效益最好的为5 分, 最差的为1 分。同时, 按评价指标的重要性进行级差量化处理(加权) , 分为极重要、很重要、重要、应考虑、意义不大五级。取意义不大权重为1 级, 依次按2n- 1 进级, 再按加权数算出评价总分, 总分最高的为多目标系统的最佳方案。评价指标项目及权重应根据项目具体情况合理确定。</p><p >例如确定某城市污水处理厂工艺流程时采用了表2 所示的评价指标及权重:</p><img alt=\"\" src=\"res/201509/02/1441090034_1_947.jpg\"/><p >进行工艺流程选择时, 可以先根据污水处理厂的建设规模, 进水水质特点和排放所要求的处理程度, 排除不适用的处理工艺, 初选2～ 3 种流程, 然后再针对初选的处理工艺进行全面的技术经济对比后确定最终的工艺流程。</p><p >4　中小规模城市污水厂处理工艺流程选择的探讨〔6、7、8〕</p><p >4. 1　根据进水有机物负荷选择处理工艺</p><p >进水BOD5 负荷较高(如&gt; 250m g.L ) 或生化性能较差时, 可以采用AB 法或水解- 生物接触氧化法、水解- SBR 法等; 进水BOD5 负荷较低时可以采用SBR 法或常规活性污泥法等。</p><p >4. 2　根据处理级别选择处理工艺</p><p >二级处理工艺可选用氧化沟法、SBR 法、水解好氧法、AB 法和生物滤池法等成熟工艺技术, 也可选用常规活性污泥法; 二级强化处理要求除磷脱<span class=\"keyword\">氮</span>, 工艺流程除可以选用AO 法、A 2O 法外, 也可选用具有除磷脱<span class=\"keyword\">氮</span>效果的氧化沟法、CA SS 法和水解- 接触氧化法等; 在投资有限的非重点流域县城, 可以先建设一级强化处理厂, 采用水解工艺、生物絮凝吸附(即AB 法的A 段) 和混凝沉淀等物化强化一级处理, 待资金等条件成熟后再续建后续生物处理工艺, 形成水解好氧法、AB 法等完整工艺。</p><p >4. 3　根据回用要求选择处理工艺</p><p >严重缺水地区要求污水回用率较高, 应选择 BOD5 和SS 去除率高的污水处理工艺, 例如采用氧化沟或SBR 工艺, 使BOD5 和SS 均达到20m g.L 以下甚至更低, 则回用处理只需要直接过滤就可以达到生活杂用水标准, 整个污水处理及回用厂流程非常简捷、经济。</p><p >如果出水将在相当长的时期内用于农灌, 解决缺水问题, 则处理目标可以以去除有机物为主, 适当保留肥效。</p><p >4. 4　根据气候条件选择处理工艺</p><p >冰冻期长的寒冷地区应选用水下曝气装置, 而不宜采用表面曝气; 生物处理设施需建在室内时, 应采用占地面积小的工艺, 如UN ITAN K 等; 水解池对水温变化有较好的适应性, 在低水温条件下运行稳定, 北方寒冷地区可选择水解池作为预处理; 较温暖的地区可选择各种氧化沟和SBR 法。</p><p >4. 5　根据占地面积选择处理工艺</p><p >地价贵、用地紧张的地区可采用SBR 工艺(尤其是UN TAN K) ; 在有条件的地区可利用荒地、闲地等可利用的条件, 采用各种类型的土地处理和稳定塘等自然净化技术, 但在北方寒冷地区不宜采用。用水解池作为稳定塘的预处理, 可以改善污水的生化性能, 减小稳定塘的面积。</p><p >4. 6　根据基建投资选择处理工艺</p><p >为了节省投资, 应尽量采用国内成熟的, 设备国产化率较高的工艺。</p><p >基建投资较小的处理工艺有水解- SBR 法、 SBR 法及其变型、水解- 活性污泥法等。用水解池作预处理可以提高对有机物的去除率, 并改善后续二级处理构筑物污水的生化性能, 可使总的停留时间比常规法少30%。采用水解- 好氧处理工艺高效节能, 其出水水质优于常规活性污泥法。<br />氧化沟法在用于以去除碳源污染物为目的二级处理时, 与各种活性污泥法相比, 优势不明显, 但用于还须去除<span class=\"keyword\">氮</span>磷的二级强化处理时, 则投资和运行费用明显降低。</p><p >4. 7　根据运行费用选择处理工艺</p><p >节省运行费用的途径有降低电耗、减少污泥量、减少操作<span class=\"keyword\">管</span>理人员等。电耗较低的流程有自然净化、氧化沟、生物滤池、水解好氧法等, 污泥量较少的有氧化沟和SBR 等, 自动化程度高、<span class=\"keyword\">管</span>理简单的流程有SBR 等。综合比较, 在基建费相当的条件下, 运行费用较低的处理方法有氧化沟、SBR、水解好氧法等。</p><p >4. 8　污泥处理</p><p >中小规模城市污水处理厂产生的污泥可进行堆肥处理和综合利用, 采用延时曝气的氧化沟法、SBR 法等技术的污水处理设施, 污泥需达到稳定化。</p><p >4. 9　可以推广应用的新工艺</p><p >在尽量采用成熟可靠工艺流程的同时, 也要研究开发适用于北方地区中小污水厂的新工艺, 或审慎采用国内外新开发的高效经济的先进工艺技术。城市污水处理新工艺应向简单、高效、经济的方向发展, 各类构筑物从工艺和结构上都应向合建一体化发展。</p><p >目前可以重点考虑应用和推广使用的流程有一体化氧化沟技术、CA SS 、UN ITAN K 和膜法等。</p><p >5　结束语</p><p >城市污水处理工艺应根据污水水质特性、排放水质要求, 以及当地的用地、气候、经济等实际情况, 经全面的技术经济比较后优选确定。处理水量在10 万m 3 以下的城市污水处理厂可以优先考虑的处理工艺有水解- SBR 法、SBR 法、氧化沟法、AB 法、水解- 接触氧化法、AO 法等, 如果条件适宜也可采用稳定塘等自然净化工艺。来源：谷腾水网</p><pid=\"leftDiv\" ><pid=\"left2\" class=\"itemFloat\" ><br /></p></p><pid=\"rightDiv\" ><pid=\"right2\" class=\"itemFloat\" ><br /></p></p><p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1408', '1', '43', '68', '', '<p ><p ><pclass=\"MsoNormal\" align=\"left\"><span >钢结构因其自身优点，在桥梁、工业厂房、高层建筑等现代建筑中得到广泛应用。在大量的工程建设过程中，钢结构工程也暴露出不少质量通病。本文主要针对辽宁近年来在钢结构主体验收及竣工验收中的常见问题及整改措施谈一些看法。</span></p><pclass=\"MsoNormal\" align=\"center\"><b ><span >一、钢结构工程施工过程中的部分问题及解决方法</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">1</span></b><b ><span >、构件的生产制作问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span >门式钢架所用的板件很薄，最薄可用到</span><st1:chmetcnv w:st=\"on\" tcsc=\"0\" numbertype=\"1\" negative=\"False\" hasspace=\"False\" sourcevalue=\"4\" unitname=\"毫米\"><span lang=\"EN-US\">4</span><span >毫米</span></st1:chmetcnv><span >。多薄板的下料应首选剪切方式而避免用火焰切割。因为用火焰切割会使板边产生很大的波浪变形。目前</span><span lang=\"EN-US\">H</span><span >型钢的焊接大多数厂家均采用埋弧自动焊或半自动焊。如果控制不好宜发生焊接变形，使构件弯曲或扭曲。</span></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">2</span></b><b ><span >、柱脚安装问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(1)</span><span >预埋件</span><span lang=\"EN-US\">(</span><span >锚栓</span><span lang=\"EN-US\">)</span><span >问题现象：整体或布局偏移；标高有误；丝扣未采取保护措施。直接造成钢柱底板螺栓孔不对位，造成丝扣长度不够。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >措施：钢结构施工单位协同土建施工单位一起完成预埋件工作，混凝土浇捣之前。必须复核相关尺寸及固定牢固。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(2)</span><span >锚栓不垂直现象：框架柱柱脚底板水平度差，锚栓不垂直，基础施工后预埋锚栓水平误差偏大。柱子安装后不在一条直线上，东倒西歪，使房屋外观很难看，给钢柱安装带来误差，结构受力受到影响，不符合施工验收规范要求。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >措施：锚栓安装应坚持先将底板用下部调整螺栓调平，再用无收缩砂浆二次灌浆填实，国外此法施工。所以锚栓施工时，可采用出钢筋或者角钢等固定锚栓。焊成笼状，完善支撑，或采取其他一些有效措施，避免浇灌基础混凝土时锚栓移一位。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(3)</span><span >锚栓连接问题现象：柱脚锚栓未拧紧，垫板未与底板焊接；部分未露</span><span lang=\"EN-US\">2</span><span >～</span><span lang=\"EN-US\">3</span><span >个丝扣的锚栓。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >措施：应采取焊接锚杆与螺帽；在化学锚栓外部，应加厚防火涂料与隔热处理，以防失火时影响锚固性能；应补测基础沉降观测资料。</span></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">3</span></b><b ><span >、连接问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(1)</span><span >高强螺栓连接</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >螺栓装备面不符合要求，造成螺栓不好安装，或者螺栓紧固的程度不符合设计要求。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：</span></p><pclass=\"MsoNormal\" align=\"left\"><span >①表面有浮锈、油污等杂质，螺栓孔璧有毛刺、焊瘤等。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >②螺栓安装面虽经处理仍有缺陷。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span >①高强螺栓表面浮锈、油污以及螺栓孔璧毛病，应逐个清理干净。使用前必须经防锈处理，使拼装用的螺栓，不得在正式拼装时使用。螺栓应由专人保管和发放。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >②处理装配面应考虑到施工安装顺序，防止重复进行，并尽量在吊装之前处理。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >螺栓丝扣损伤，螺杆不能自由旋入螺母，影响螺栓的装配。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：丝扣严重锈蚀。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span >①使用前螺栓应进行挑选，清洗除锈后作预配。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >②丝扣损伤的螺栓不能做临时螺栓使用，严禁强行打进螺孔。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >③预先选配的螺栓组件应按套存放，使用时不得互换。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(2)</span><span >现场焊缝现象：质量难以保证；设计要求全焊透的一、二级焊缝未采用超声波探伤；楼面主梁与柱未施焊；未采用引弧板施焊。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：钢结构施焊前，对焊条的合格证进行检查，按设计要求选用焊含条，按说明书和操作规程要求使用焊条，焊缝表面不得有裂纹、焊瘤，一、二级焊缝不得有气孔、夹渣、弧坑裂纹，一级焊缝不得有咬边、未满焊等缺陷，一、二级焊缝按要求进行无损检测，在规定的焊缝及部位要检查焊工的钢印。不合格的焊缝不得擅自处理，定出修改工艺后再处理，同一部位的焊缝返修次数不宜超过两次。</span></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">4</span></b><b ><span >、构件的变形问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(1)</span><span >构件在运输时发生变形，出现死弯或缓弯，造成构件无法进行安装。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >构件制作时因焊接产生的变形，一般呈现缓弯。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >构件待运时，支垫点不合理，如上下垫木不垂直等或堆放场地发生沉陷，使构件产生死弯或缓变形。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3)</span><span >构件运输中因碰撞而产生变形，一般呈现死弯。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >预防措施：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >构件制作时，采用减小焊接变形的措施。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >组装焊接中，采用反方向变形等措施，组装顺序应服从焊接顺序，使用组装胎具，设置足够多的支架，防止变形。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3)</span><span >待运及运输中，注意垫点的合理配置。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >构件死弯变形，一般采用机械矫正法治理。即用千斤顶或其他工具矫正或辅以氧乙炔火焰烤后矫正。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >结构发生缓弯变形时，采取氧乙炔火焰加热矫正。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(2)</span><span >钢梁构件拼装后全长扭曲超过允许值，造成钢梁的安装质量不良。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >拼接工艺不合理。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >拼装节点尺寸不符合设计要求。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >拼装构件要设拼装工作台，定为焊时要将构件底面找平，防止翘曲。拼装工作台应各支点水平，组焊中要防止出现焊接变形。尤其是梁段或梯道的最后组装，要在定位焊后调整变形，注意节点尺寸要符合设计，否则易造成构件扭曲。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >自身刚性较差的构件，翻身施焊前要进行加固，构件翻身后也应进行找平，否则构件焊后无法矫正。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(3)</span><span >构件起拱，数值大干或小于设计数值。构件起拱数值小时，安装后梁下挠；起拱数值大时，易产生挤面标高超标。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >原因分析：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >构件尺寸不符合设计要求。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >架设过程中，未根据实测值与计算值的出入进行修正。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3)</span><span >跨径小的桥梁，起拱度较小，拼装时忽视。</span></p><pclass=\"MsoNormal\" align=\"left\"><span >解决方法：</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1)</span><span >严格按钢结构构件制作允许偏差进行各步检验。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2)</span><span >在架设过程中，杆件且装完毕，以及工地接头施工结束后，都进行上拱度测量，并在施工中对其他进行调整。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3)</span><span >在小拼装过程，应严格控制累计偏差，注意采取措施，消除焊接收缩量的影响。</span></p><pclass=\"MsoNormal\" align=\"left\"><b ><span lang=\"EN-US\">5</span></b><b ><span >、钢结构安装问题</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(1)</span><span >钢柱底脚有空隙预控措施钢柱吊装前，应严格控制基础标高，测量准确，并按其测量值对基础表面仔细找平；如采用二次灌浆法，在柱脚底板开浇灌孔</span><span lang=\"EN-US\">(</span><span >兼作排气孔</span><span lang=\"EN-US\">)</span><span >，利用钢垫板将钢柱底部不平处垫平，并预先按设计标高安置好柱脚支座钢板，然后采取二次灌浆。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(2)</span><span >钢柱位移预控措施浇筑混凝土基础前，应用定型卡盘将预埋螺栓按设计位置卡住，以防浇灌混凝土时发生位移；柱低钢板预留孔应放大样，确定孔位后再作预留孔。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">(3)</span><span >柱垂直偏差过大预控措施钢柱应按计算的吊挂点吊装就位，且必须采用二点以上的吊装方法，吊装时应进行临时固定，以防吊装变形；柱就位后应及时增设临时支撑；对垂直偏差，应在固定前予以修正。</span></p><pclass=\"MsoNormal\" align=\"center\"><b ><span >二、结论</span><span lang=\"EN-US\"><o:p></o:p></span></b></p><pclass=\"MsoNormal\" align=\"left\"><span >只有在施工管理过程中，加强对技术人员、工人对规范标准和操作规程的培训学习，切实做好开工前的准备，加强施工过程中的质量控制和监督检查，积极发挥施工、监理等各方面的作用，做好各分项工程的工序验收工作，才能保证钢结构工程的整体质量。</span></p><pclass=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\"><o:p></o:p></span></p><pclass=\"MsoNormal\" align=\"left\"><span >信息来源：中国焊接网</span><spanlang=\"EN-US\"><o:p></o:p></span></p></p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1409', '1', '43', '68', '', '<p ></p><p ></p><p >绿色建筑评价标准<br />　　<br />　　1、在建筑的全寿命周期内，最大限度地节约资源(节能、节地、节水、节材)、保护环境和减少污染，为人们提供健康、适用和高效的使用空间，与自然和谐共生的建筑。<br />　　<br />　　2、节能能源：充分利用太阳能，采用节能的建筑围护结构以及采暖和空调，减少采暖和空调的使用。根据自然通风的原理设置风冷系统，使建筑能够有效地利用夏季的主导风向。建筑采用适应当地气候条件的平面形式及总体布局<br />　　<br />　　3、可再生能源：指从自然界获取的、可以再生的非化石能源，包括风能、太阳能、水能、生物质能、地热能和海洋能等。<br />　　<br />　　4、节约资源：在建筑设计、建造和建筑材料的选择中，均考虑资源的合理使用和处置。要减少资源的使用，力求使资源可再生利用。节约水资源，包括绿化的节约用水。<br />　　<br />　　5、可再利用材料：指在不改变所回收物质形态的前提下进行材料的直接再利用，或经过再组合、再修复后再利用的材料。<br />　　<br />　　6、可再循环利用材料：指已经无法进行再利用的产品通过改变其物质形态，生产成为另一种材料，使其加入物质的多次循环利用过程中的材料。<br />　　<br />　　7、以节约和适用的原则确定绿色建筑标准。<br />　　<br />　　8、绿色建筑建设应选用质量合格并符合使用要求的材料和产品，严禁使用国家或地方管理部门禁止、限制和淘汰的材料和产品。<br />　　<br />　　9、回归自然：绿色建筑外部要强调与周边环境相融合，和谐一致、动静互补，做到保护自然生态环境。<br />　　<br />　　10：建筑场地选址无洪灾、泥石流及含氡土壤的威胁，建筑场地安全范围内无电磁辐射危害和火、爆、有毒物质等危险源。<br />　　<br />　　11、住区建筑布局保证室内外的日照环境、采光和通风的要求，满足《城市居住区规划设计规范》GB50180中有关住宅建筑日照标准的要求。<br />　　<br />　　12、绿化种植适应当地气候和土壤条件的乡土植物，选用少维护、耐候性强、病虫害少，对人体无害的植物。<br />　　<br />　　13、建筑内部不使用对人体有害的建筑材料和装修材料。<br />　　<br />　　14、绿色建筑应尽量采用天然材料。建筑中采用的木材、树皮、竹材、石块、石灰、油漆等，要经过检验处理，确保对人体无害。<br />　　<br />　　良好的居住环境对室内和室外的要求都很高，绿色建筑能给人舒适和健康的生活居住环境，绿色建筑的建造并不等于高价和高成本，也不仅仅限于新建筑，最主要的是要环保、无害。</p><p ></p><p >　来源:0731房产网综合整理</p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1410', '1', '43', '68', '', '<p ><strong>美国回收材料打造&ldquo;资源保护屋&rdquo;</strong><p>　　美国政府的《超级基金法》规定&ldquo;任何生产有工业废弃物的企业，必须自行妥善处理，不得擅自随意倾卸&rdquo;。该法规从源头上限制了建筑垃圾的产生量，促使各企业自觉寻求建筑垃圾资源化利用途径。</p><p>　　近一段时间以来，美国住宅营造商协会开始推广一种&ldquo;资源保护屋&rdquo;，其墙壁就是用回收的轮胎和铝合金废料建成的，屋架所用的大部分钢料是从建筑工地上回收来的，所用的板材是锯末和碎木料加上20%的聚乙烯制成，屋面的主要原料是旧的报纸和纸板箱。这种住宅不仅积极利用了废弃的金属、木料、纸板等回收材料，而且比较好地解决了住房紧张和环境保护之间的矛盾。</p><p>　<strong>　法国将废物整体管起来</strong></p><p>　　法国CSTB公司是欧洲首屈一指的&ldquo;废物及建筑业&rdquo;集团，专门统筹在欧洲的&ldquo;废物及建筑业&rdquo;业务。公司提出的废物管理整体方案有两大目标：一是通过对新设计建筑产品的环保特性进行研究，从源头控制工地废物的产量；二是在施工、改善及清拆工程中，对工地废物的生产及收集作出预测评估，以确定相关回收应用程序，从而提升废物管理层次。</p><p>　　该公司以强大的数据库为基础，使用软件工具对建筑垃圾进行从产生到处理的全过程分析控制，以协助相关机构针对建筑物使用寿命期的不同阶段作出决策。例如，可评估建筑产品的整体环保性能；可依据有关执行过程、维修类别，以及不同的建筑物清拆类型，对某种产品所产生的废物量进行评估；可向顾问人员、总承建商，以及承包机构(客户)，就某一产品或产品系列对环保及健康的影响提供相关概览资料；可以对废物管理所需的程序及物料作出预测；可根据废物的最终用途或质量制订运输方案；就任何使用&ldquo;再造&rdquo;原料的新工艺，在技术、经济及环境方面的可行性作出评定，而且可估计产品的性能。</p><p><strong>　　荷兰有效分类建筑垃圾</strong></p><p>　　在荷兰，目前已有70%的建筑废物可以被循环再利用，但是荷兰政府希望将这一比例增加到90%。因此，他们制定了一系列法律，建立限制废物的倾卸处理、强制再循环运行的质量控制制度。荷兰建筑废物循环再利用的重要副产品是筛砂。由于砂很容易被污染，其再利用是有限制的。针对于此，荷兰采用了砂再循环网络，由拣分公司负责有效筛砂，即依照其污染水平进行分类，储存干净的砂，清理被污染的砂。</p><p>　　总体来讲，上述这些国家大多施行的是&ldquo;建筑垃圾源头削减策略&rdquo;，即在建筑垃圾形成之前，就通过科学管理和有效的控制措施将其减量化；对于产生的建筑垃圾则采用科学手段，使其具有再生资源的功能。</p><p>　　而对于已经过预处理的建筑垃圾，还有一些国家则运往&ldquo;再资源化处理中心&rdquo;，采用焚烧法进行集中处理，如德国西门子公司开发的干馏燃烧垃圾处理工艺，可使垃圾中的各种可再生材料十分干净地被分离出来，实现回收再利用，对于处理过程中产生的燃气则用于发电，每吨垃圾经干馏燃烧处理后仅剩下2到3公斤的有害重金属物质，从而有效地解决了垃圾占用大片耕地的问题。</p><p><strong>　　日本立法实现建筑垃圾循环利用</strong></p><p>　　由于国土面积小、资源相对匮乏，日本的构造原料价格比欧洲都要高。因此日本人将建筑垃圾视为&ldquo;建筑副产品&rdquo;，十分重视将其作为可再生资源而重新开发利用。比如港埠设施，以及其他改造工程的基础设施配件，都可以利用再循环的石料，代替相当数量的自然采石场砾石材料。</p><p>　　1977年，日本政府就制定了《再生骨料和再生混凝土使用规范》，并相继在各地建立了以处理混凝土废弃物为主的再生加工厂，生产再生水泥和再生骨料。1991年，日本政府又制定了《资源重新利用促进法》，规定建筑施工过程中产生的渣土、混凝土块、沥青混凝土块、木材、金属等建筑垃圾，必须送往&ldquo;再资源化设施&rdquo;进行处理。日本对于建筑垃圾的主导方针是：尽可能不从施工现场排出建筑垃圾；建筑垃圾要尽可能重新利用；对于重新利用有困难的则应适当予以处理</p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1411', '1', '43', '68', '', '<p >深圳宝安国际机场 T3 航站楼概念方案为美国兰德隆布朗公司和杨莫岚设计公司联合体设计，在此方案的基础上，通过国际招标，选定意大利 mFUKSASarch 建筑事务所的建筑方案，北京市建筑设计研究院中标为国内配合单位。在 2006~2008年期间，扩建工程指挥部进行了填海工程，以配合 T3航站楼的建设。T3航站楼南北长 1128m、东西宽 640m，建筑面积达55 万平方米左右，为目前国内最大单体面<br />积的航站楼之一。 T3 航站楼主体结构采用钢筋混凝土框架结构，整个航站楼的混凝土结构共分为 10 块。屋顶为不规则曲面，采用网壳结构。屋顶结构共分七块，包括主指廊D、次指廊G和H、交叉指廊C、过渡区B以及大厅A。典型屋顶结构的特点如下：<br />（1） 主指廊D块和次指廊G、 H块屋顶 这三部分屋顶网壳均采用斜交斜放的双层筒壳， 网壳曲面延伸到二层楼面 （标<br />高4.4m），与下部混凝土支承结构对应，屋顶结构每隔18m设一支座铰接于混凝土异形柱，并且在与支座对应的屋顶部位，<br />设置两片加强桁架作为主要受力体系。沿结构横向剖面，支座间距均为44.8m，主指廊最宽处为61.1m左右，次指廊最宽处<br />为 54.9m 左右。网壳主网格尺寸为 5.4m，为配合屋顶幕墙的需要，还布置有加密的檩条，檩条与主网格之间铰接。因屋顶<br />曲面造型的需要， 沿筒壳纵向和横向均变厚度，主指廊 （D块） 网壳最厚处为8.8m， 次指廊（G和H块） 网壳最厚处为4.2m。<br />因筒壳面内刚度较大且筒壳较长，为减小屋顶的温度内力，沿筒壳的纵向布置了弹簧支座。同时弹簧支座也减小了由于屋顶<br />分块和混凝土分块不对应、下部混凝土和上部筒壳变形不一致造成的上、下部相互影响。 <br />（2）交叉指廊C块屋顶 交叉指廊部分的屋顶由主指廊和次指廊屋顶交叉形成， 也是采用带加强桁架的斜交斜放网壳<br />结构。其中主指廊方向屋顶长度为162m，包括4榀落在2层楼面上（标高＋4.4m）的加强桁架；次指廊方向长度为199m，包括 10 榀落在 2 层楼面上的加强桁架。另外沿主指廊方向存在 108m 跨度的室内大厅，为此在室内大厅布置了 4 个落在三层楼面（标高+8.8m）的摇摆柱，在摇摆柱上方沿主指廊方向设置了两榀加强桁架。为提高结构刚度、减小关键加强桁架的内力（红色虚线圈出<br />的为加强桁架），设置16根水平拉杆将加强桁架与3层楼面的混凝土结<br />构拉接。 <br />（3）大厅屋顶A块 大厅屋顶跨越E、A和F共三块混凝土结构，东西方向长约640m，南北方向宽约320m，投影面积约为12.3万m2。屋顶支承结构的柱网为36m&times;36m和36m&times;27m两种，由钢筒体、框架柱、<br />摇摆柱以及一榀加强拱架组成屋顶支承体系，承担屋顶的竖向荷载、水平荷载以及幕墙的各种荷载。这里的框架柱均下端与混凝土结构铰接、上端与屋顶网架刚接，这种柱子的受力特点也与柱子下端横截面小、上端横截面大的截面形式一致。屋顶结构采用斜交斜放曲面网架，网格尺寸5.4m，网架高度3.6m。另外与屋顶支承体系的柱网配合，还设有正交正放加强桁架，加强桁架的网格尺寸为4.5m。 目前该工程正在设计中，还有很多问题需要研究，例如满足建筑外观要求、具有一定减震、减小温度内力作用的弹簧铰<br />支座。在长 640m、宽 320m的大厅区采用钢筒体+上端刚接、下端铰接的框架柱+摇摆柱的结构体系，有很多问题都是未遇<br />见的、其设计标准也需要进行性能化研究。</p><p ></p><p ></p><p ><em>转载</em></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1412', '1', '43', '68', '', '<p ><img src=\"res/201509/02/1441090016_0_396.jpg\" border=\"0\" alt=\"\" /></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1413', '1', '43', '68', '', '<p >在新中国成立60周年之际，建设科技正处于大发展的阶段。在科学发展观指导下，可持续发展的理念日益深入人心，建设行业的各领域无不突出着节能的宗旨，建筑节能成为当今建设科技发展的重要主题，并不断进步，与建筑节能有关的科学技术取得了丰硕成果。高度重视建筑节能，正是今天建设科技和建设行业的一大特点。<p>　<strong>　21世纪建设科技的主旋律</strong></p><p>　　我国的建筑节能，起步于上世纪80年代。改革开放后，建筑业在墙体改革及新型墙体材料方面有了发展。与此同时，一批高能耗的高档旅馆、公寓和商场出现了。如何在发展中降低建筑能耗，使之与当时能源供应较紧缺的现状相协调，成为相关部门关注的重点。为此，建筑节能工作首先从减少采暖能耗开始，1986年建设部颁布了《民用建筑节能设计标准》，要求新建居住建筑，在1980年当地通用设计能耗水平基础上节能30%%，《民用建筑节能设计标准》是我国第一部建筑节能设计标准，它的颁布，开启了我国建筑节能新阶段。以它提出的指标为目标，建筑节能的设计、节能技术纷纷发展起来，一系列的标准和法规先后制定。</p><p>　　20世纪90年代，建筑节能的地位进一步提高，节能工作有效开展。1990年，建设部提出&ldquo;节能、节水、节材、节地&rdquo;的战略目标。1994年在《中国21世纪议程》中，建筑节能作为项目之一被郑重提出;从1994年起，国家对北方节能建筑实施免征固定资产投资方向调节税，一批节能小区相继建成。1995年《民用建筑节能设计标准》修订并于次年执行，修订后的《民用建筑节能设计标准》将第二阶段建筑节能指标提高到50%%。同年，建设部发布《建筑节能&ldquo;九五&rdquo;计划和2010年规划》，这个专门的规划以及1996年9月建设部发布的《建筑节能技术政策》和《市政公用事业节能技术政策》，为其后建筑节能的发展明确了方向，同时也表明建筑节能地位的空前提高。建筑节能的地位最终由1998年1月1日实施的《中华人民共和国节约能源法》确定下来，建筑节能成为这部法律中明确规定的内容。</p><p>　　21世纪的到来，在科学发展观的指引下，建设领域明确了必须走资源节约型、环境友好型的新型工业化道路，建设科技工作将&ldquo;四节一环保&rdquo;作为科技攻关的主要方向，取得了明显效果。目前我国已初步建立起了以节能50%%为目标的建筑节能设计标准体系，部分地区执行更高的65%节能标准。2008年《民用建筑能效测评标识管理暂行办法》、《民用建筑节能条例》等施行，《民用建筑节能条例》的颁布，标志着我国民用建筑节能标准体系已基本形成，基本实现对民用建筑领域的全面覆盖。</p><p>　　在国务院办公厅《2009年节能减排工作安排》中规定，2009年底施工阶段执行节能强制性标准比例提高到90%以上。除新建建筑外，既有建筑的节能改造也有效开展起来，并取得了一批成果和经验。而兼顾土地资源节约、室内环境优化、居住人的健康、节能节水节材等方面的目标绿色建筑，成为新世纪建筑节能发展的亮点。</p><p><strong>　　建筑节能技术飞速发展</strong></p><p>　　在建筑节能逐步成为建设科技主旋律的过程中，相关的节能技术也有了长足进步。</p><p>　　在建设部组织下，&ldquo;九五&rdquo;期间实施了&ldquo;2000年小康型城乡住宅科技产业工程&rdquo;，&ldquo;十五&rdquo;期间组织实施了&ldquo;小城镇科技发展重大专项&rdquo;、&ldquo;居住区与小城镇建设关键技术研究&rdquo;、&ldquo;绿色建筑关键技术研究&rdquo;等，&ldquo;十一五&rdquo;期间实施了&ldquo;建筑节能关键技术研究与示范&rdquo;、&ldquo;现代建筑设计与施工关键技术研究&rdquo;、&ldquo;既有建筑综合改造关键技术研究与示范&rdquo;、&ldquo;可再生能源与建筑集成技术研究与示范&rdquo;等项目，这些科研攻关项目的组织实施，使一系列建筑节能的重大、关键、共性技术得到突破，形成了一大批科技成果。</p><p>　　建筑节能的各项技术都达到很高水平。</p><p>　　降低建筑能耗，首先要从围护结构、外墙、屋面、外门窗来实现。墙体改革的调查研究开始于上世纪70年代，80年代以来，新型墙体材料和高保温材料不断涌现，混凝土空心砌块、聚苯乙烯泡沫板等材料，逐渐替代了传统墙体材料，在建筑节能中发挥了重要作用。同时，我国广泛开展研究建筑外墙保温技术，近年来，各种外墙外保温技术系统日益成熟并在工程中应用，显示出良好前景。</p><p>　　此外还有建筑门窗。门窗传热系数的高低，决定了能耗的高低，要降低能耗，就必须提高门窗的热工性能，增加门窗的隔热保温性能。近20年来，为满足节能需求，外窗玻璃产品及工艺水平迅速发展，由之前采用普通单层玻璃、双层玻璃发展到中空、充气、LOW-E玻璃，塑钢型材、钢化玻璃等也广泛应用，取代了传统的钢窗和铝合金门窗。</p><p>　　建筑能耗的降低，还有赖于暖通技术和设备。为实现采暖系统的节能，上世纪80年代我国研发了平衡供暖技术及其产品、锅炉运行管理技术与产品。在散热器方面，上世纪90年代以来各种新型散热器纷纷得到开发，这些新产品比传统的铸铁散热器，具有金属热强度高、散热性能好、承压能力高、造型美观、工艺性好、安装方便等优点。</p><p>　　进入新世纪后，随着既有建筑节能改造的开展，供热改革成为建筑节能的重要内容。为适应改革的需要，室温可调和采暖计量收费技术及产品有了进一步的发展。采暖系统的单管顺流系统变为双管系统，散热器恒温阀及热表的应用已经十分普及。</p><p>　　技术是保证建筑节能得以实现的关键，多年来我国建筑节能技术的发展，让人们对&ldquo;十一五&rdquo;期间实现建筑节能1.6亿吨标准煤的目标充满信心。</p><p><strong>　　绿色建筑成果丰硕</strong></p><p>　　绿色建筑是生态环境与建筑有机结合，在建筑生命周期内最大限度地节约资源、保护环境，为人们提供高效、舒适空间的建筑。近10年来，绿色节能建筑成为建筑节能中的一大亮点，体现了新世纪建筑节能更高的追求目标。</p><p>　　进入21世纪后，绿色建筑评价体系逐步建立，保证了绿色建筑的健康发展。2001年建设部住宅产业化促进中心编制了《绿色生态住宅小区建设要点与技术导则》，2004年建设部针对北京奥运会，开展了&ldquo;绿色奥运建筑评估体系&rdquo;课题研究，形成了我国第一套绿色建筑项目标准。同年8月建设部颁布实施《全国绿色建筑创新奖管理办法》，次年，首届全国绿色建筑创新奖揭晓，40个项目获得此项殊荣，中国在推进智能与绿色建筑方面迈出了坚实的一步。2005年，历时5年编制完成的《绿色建筑技术导则》颁布施行，自此，绿色建筑的评定有了明确依据。&ldquo;十五&rdquo;期间，重点攻关计划&ldquo;绿色建筑规划设计导则和评估体系研究&rdquo;项目完成。2006年，建设部组织编制了《绿色建筑评价标准》。2007年8月，《绿色建筑评价技术细则》和《绿色建筑评价标识管理办法》出台，2008年6月住房和城乡建设部为进一步规范和细化绿色建筑评价标识工作，根据评价标识工作实际情况，编制了《绿色建筑评价技术细则补充说明(规划设计部分)》，制定了《绿色建筑评价标识使用规定》，进一步完善了绿色建筑设计评价标识的申报评价程序。</p><p>　　一系列工作，建立了适合我国国情的绿色建筑评价体系，有力地推动了绿色建筑技术发展。经过多年的攻关和研究，绿色建筑形成了六大技术体系评价标准：节地与室外环境、节能与能源利用、节水与水资源利用、节材与材料资源利用、室内环境质量及运营管理。通过对建筑的节能、节水、节地、节材和室内环境的具体性能进行实测，给出数据，实现定量化检测标准，达到标准的即为绿色建筑。</p><p>　　2008年8月，住房城乡建设部建筑节能与科技司向首批绿色建筑设计评价标识项目颁发了证书，上海世博会世博中心工程等6个项目获得了行业主管部门认可的第一批绿色建筑设计评价标识，标志着由政府部门主导的绿色建筑评价正式启动，结束了我国依赖国外标准进行绿色建筑评价的历史。</p><p>　　回顾建筑节能的历程，可以看到，这项利国利民的事业，紧跟时代步伐，取得了举世瞩目的成就。而这一切，没有党和政府的重视，是不可想象的。也正因此，人们完全有理由对建筑节能的前景充满信心。</p><p></p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1414', '1', '43', '68', '', '<p ><p align=\"center\"><img title=\"8月30日拍摄的世博轴膜结构工程（局部）。 8月30日，上海世博园区世博轴膜结构工程全面完成。世博轴工程采用全新建筑形式，其屋顶设计为长约840米、宽约97米的巨型索膜结构，形如蓝天下的朵朵白云，并在整个索膜覆盖的结构中设置了6个巨型圆锥状钢结构&ldquo;阳光谷&rdquo;，让自然光透过&ldquo;阳光谷&rdquo;倾泻而下，满足部分地下空间的采光，体现环保和节约的理念。据介绍，世博轴索膜结构厚度仅为1毫米，使用寿命可达30年。新华社发 \"height=\"175\" src=\"res/201509/02/1441090001_0_548.jpg\" width=\"402\" alt=\"\" /></p><p> 8月30日拍摄的世博轴膜结构工程（局部）。 8月30日，上海世博园区世博轴膜结构工程全面完成。世博轴工程采用全新建筑形式，其屋顶设计为长约840米、宽约97米的巨型索膜结构，形如蓝天下的朵朵白云，并在整个索膜覆盖的结构中设置了6个巨型圆锥状钢结构&ldquo;阳光谷&rdquo;，让自然光透过&ldquo;阳光谷&rdquo;倾泻而下，满足部分地下空间的采光，体现环保和节约的理念。据介绍，世博轴索膜结构厚度仅为1毫米，使用寿命可达30年。新华社发</p><p align=\"center\"><img title=\" 8月30日拍摄的世博轴膜结构工程全景（拼图）。 新华社发\" src=\"res/201509/02/1441090001_1_697.jpg\" alt=\"\" /></p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1415', '1', '43', '68', '', '<p ></p><ul><li >PTFE膜材&mdash;&mdash;耐久性强，使用寿命在30年以上</li><li >PTFE膜材&mdash;&mdash;是永久性建筑的首选材料</li><li >PTFE膜材&mdash;&mdash;超自洁，防火材料</li><li >PTFE膜材&mdash;&mdash;专业化的加工工艺，严格的施工规程<br /> 膜结构建筑中最常用的膜材料。PTFE膜材料是指在极细的玻璃纤维（3微米）编织成的基布上涂上PTFE（聚四氟乙烯）树脂而形成的复合材料。PVC膜材料是指在聚酯纤维编织的基布上涂上PVC（聚氟乙烯）树脂而形成的复合材料。</li></ul>', '');
INSERT INTO `qinggan_list_22` VALUES ('1416', '1', '43', '68', '', '<p><strong><span >  <span >ETFE建筑</span></span></strong><span ><span >膜</span><span >材是一种乙烯</span><span >-</span><span >四氟乙烯的共聚物</span><span >.ETFE膜材的厚度通常小于0.20mm，是一种透明膜材.</span></span></p><p><span ><span >   用ETFE原料制成的膜材料替代传统的玻璃和其他高分子采光板用于大型建筑物的屋面或墙体材料，显示出无可比拟的优势。</span></span></p><p><span ><span > ETFE膜使用寿命至少为25-35年,</span><span > ETFE</span><span >膜达到</span><span >B1</span><span >、</span><span >DIN4102防火等级标准，燃烧时也不会滴落。且该膜质量很轻，每平方米只有0.15-0.35公斤。这种特点使其即使在由于烟、火引起的膜融化情况下也具有相当的优势。</span></span></p><p><span ><span > 与玻璃不同的是ETFE具有很好的隔热介质，单层膜可以在无色膜材上印刷不同图案，可调节室内光线。</span></span></p><p><p ><img src=\"res/201509/02/1441090077_0_111.jpg\" border=\"0\" alt=\"\" /></p><p ><img src=\"res/201509/02/1441090077_1_885.jpg\" border=\"0\" alt=\"\" /></p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1417', '1', '43', '68', '', '<p class=\"MsoNormal\" ><b><span lang=\"EN-US\" >2014</span></b><b><span >第三届中国（广州）国际建筑钢结构、空间结构及金属材料设备展览会</span></b><b><span lang=\"EN-US\" ><o:p></o:p></span></b></p><p class=\"MsoNormal\" ><b><span lang=\"EN-US\" >The 3<sup>rd</sup><st1:country-region w:st=\"on\">China</st1:country-region>(<st1:city w:st=\"on\">Guangzhou</st1:city>) International Exhibition for<st1:place w:st=\"on\"><st1:placename w:st=\"on\">Steel</st1:placename><st1:placename w:st=\"on\">Construction &amp; Metal</st1:placename><st1:placetype w:st=\"on\">Building</st1:placetype></st1:place>Materials<o:p></o:p></span></b></p><p class=\"MsoNormal\" ><span >地点：中国进出口商品交易会&middot;琶洲展馆<span lang=\"EN-US\"></span></span><b><span >时间</span></b><span >：<st1:chsdate w:st=\"on\" isrocdate=\"False\" islunardate=\"False\" day=\"12\" month=\"5\" year=\"2014\"><span lang=\"EN-US\">2014</span>年<span lang=\"EN-US\">5</span>月<span lang=\"EN-US\">12</span>日</st1:chsdate><span lang=\"EN-US\">-14</span>日</span></p><p class=\"MsoNormal\" ><b><span lang=\"EN-US\" ><o:p></o:p></span></b></p><pclass=\"Section1\" ><p class=\"MsoNormal\" align=\"left\" ><v:line id=\"_x0000_s1026\" strokeweight=\"1.5pt\" to=\"549.7pt,3.1pt\" from=\"-7.95pt,3.1pt\" ></v:line><b><span >主办单位：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" align=\"left\" ><span >亚洲建筑技术联盟协会<span lang=\"EN-US\"></span>中国市政工程协会<span lang=\"EN-US\"></span>中国贸促会建设行业分会集成建筑委员会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >广东省空间结构学会<span lang=\"EN-US\"></span>粤港经济合作交流促进会<span lang=\"EN-US\"></span>香港鸿威展览集团<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span >协办单位：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" align=\"left\" ><span >中国贸促会建设行业分会国际交流中心<span lang=\"EN-US\"></span>东莞市建筑金属结构行业协会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span >国际机构：</span></b><span lang=\"EN-US\" ><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" ><span >美国钢结构协会<span lang=\"EN-US\"></span>澳大利亚钢结构协会<span lang=\"EN-US\"></span>加拿大钢结构协会<span lang=\"EN-US\"></span>韩国钢结构协会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >智利钢结构协会<span lang=\"EN-US\"></span>日本钢结构协会<span lang=\"EN-US\"></span>墨西哥钢结构协会<span lang=\"EN-US\"></span>新西兰钢结构协会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >新加坡钢结构协会<span lang=\"EN-US\"></span>法国驻广州总领事馆商务处<span lang=\"EN-US\"></span>美国钢铁协会<span lang=\"EN-US\"></span>欧洲钢结构协会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >新西兰驻广州总领事馆<span lang=\"EN-US\"></span>新西兰大型工程研究会<span lang=\"EN-US\"></span>西班牙安达卢西亚自治区政府贸促会上海代表处<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >尼日利亚联邦共和国驻上海总领事馆<span lang=\"EN-US\"></span>日本建筑钢骨协会<span lang=\"EN-US\"></span>丹麦未来产业化可持续建筑和城市发展组织</span><span lang=\"EN-US\" ><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span >承办单位：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" ><span >广州市鸿威展览服务有限公司<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" ><b><span >支持单位：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" align=\"left\" ><span >广东省住房和城乡建设厅<span lang=\"EN-US\"></span>浙江省钢结构行业协会<span lang=\"EN-US\"></span>江苏省建筑钢结构混凝土协会钢结构分会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >四川省金属结构行业协会<span lang=\"EN-US\"></span>辽宁省建筑金属结构协会<span lang=\"EN-US\"></span>福建建筑业协会金属结构与建材分会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >安徽省钢结构协会<span lang=\"EN-US\"></span>河南省钢结构协会<span lang=\"EN-US\"></span>山西省土建学会空间结构专业委员会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >香港建筑金属结构协会<span lang=\"EN-US\"></span>澳门金属结构协会<span lang=\"EN-US\"></span>山东省勘察设计协会钢结构分会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><span >上海市金属结构行业协会<span lang=\"EN-US\"></span>天津市钢结构学会<span lang=\"EN-US\"></span>北京市建设工程物资协会钢结构分会<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span >支持媒体：<span lang=\"EN-US\"><o:p></o:p></span></span></b></p><p class=\"MsoNormal\" align=\"left\" ><span >广东电视台、南方电视台、中国建设报、中华建筑报、建筑时报、广东建设报、羊城晚报、新浪地产、搜房网、中国钢结构网、中国钢结构资讯网、钢结构在线、中国生态环境与节能建设网、建筑钢结构网、钢结构网、广东建设信息网、钢构之窗、《钢结构》杂志、《中国住宅设施》、《中国钢结构产业》、《钢结构资源》、商务时报品牌钢构周刊、《钢结构与设备》杂志<span lang=\"EN-US\">...</span>各协会（学会）刊物及网站等一百多家海内外媒体<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" ><b><span lang=\"EN-US\" ><o:p></o:p></span></b></p></p><p ><b><span lang=\"EN-US\" ><br clear=\"all\"/></span></b></p><p class=\"MsoNormal\" align=\"center\" ><b><i><span >以钢代木，保护地球生态资源；以钢代砼，促进绿色环保建筑</span></i></b></p><p ><span ><p class=\"MsoNormal\" ><strong>参展范围<o:p></o:p></strong></p><p class=\"MsoNormal\" ><span >1、钢结构及钢铁产品，包括建筑金属结构、钢结构、轻钢结构、重钢结构、海洋结构、预应力结构、钢砼组合结构、空间网架结构、拉膜结构等空间结构；重钢、轻钢、H型钢、无缝钢管、工字型钢、冷弯型钢、特殊钢材等；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >2、建筑钢结构板材、板件，包括中厚板、压型板、采光板、夹芯板、不锈钢薄板、镜面板、艺术板、镀钛板、彩色涂层板等板材；不锈钢棒、线、管材等；彩钢、钢结构预制品等；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >3、钢结构连接产品和设备，包括各种固件锚栓及标准和非标准紧固件，螺栓，栓钉，铆钉，锚夹具；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >4、建筑钢结构安全防护工业体系，包括涂料、防腐、保温、隔热、防水、防火耐火产品及防爆技术；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >5、新型住宅房屋技术及配套装饰、装修产品类：新型房屋设计、建设单位、新型结构产品、墙体、屋面、门窗、龙骨、幕墙、楼层板、吊顶、遮阳系统、通风设备；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >6、铝合金、塑钢、非金属装饰性材料及相关技术和设备类：铝合金、塑钢、复合材料等装饰性构件和板材、玻璃制品；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >7、立体车库设备、钢结构门业；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >8、金属钢结构加工配套设备及检测设备类，包括各种成型加工设备、焊接设备、焊接材料、切割、铸造、数控技术及五金电动工具、施工安装机具、喷涂设备、涂锈设备、钢材检验、探伤设备等；桥梁、塔桅、容器、管道的制造加工设备；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >9、计算机设计、分析、计算与CAD绘图软件类：各类钢结构设计、分析、计算软件；项目管理、投标及工程预算软件；加工中心与结构样图CAD工作站等；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >10、节能节地型建筑（钢结构住宅试点工程、实验基地）；钢结构领域新成果（名人、名企、名项目）；钢结构工程招标；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >11、设计及施工展示（大型场馆、会议中心、大型公共建筑的设计技术及方案，大型施工公司示范工程）；<o:p></o:p></span></p><p class=\"MsoNormal\" ><span >12、建筑设计及房地产项目规划设计区：建筑设计院所、优秀建筑设计项目、优秀房地产规划项目、技术咨询单位样板工程</span></p></span></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1418', '1', '43', '68', '', '<p ></p><h2>青口镇文体中心外立面膜结构工程（重新招标）</h2><pclass=\"gg-xl-fbsj\">来源：中国国际招标网 发布时间：2014.02.21</p><!--div class=\"gg-jdb\"><img src=\"res/201509/02/1441090066_0_157.gif\" width=\"292\" height=\"82\"/></a></div--><!--有权限--><pclass=\"gg-conte\"><p ><palign=\"left\">招 标 公 告</p><palign=\"left\">1. 招标条件</p><palign=\"left\">本招标项目青口镇文体中心外立面膜结构工程（重新招标）已由闽侯县发展和改革局以侯发改审批[2013]44号批准建设，项目业主为闽侯县青口镇人民政府，建设资金来自财政拨款，招标人为闽侯县青口镇小城镇综合改革建设试点指挥部，委托的招标代理单位为福建省闽建工程造价咨询有限公司。项目已具备招标条件，现对该项目的设计、施工进行国内公开招标。</p><palign=\"left\">2. 项目概况和招标范围</p><palign=\"left\">2.1. 建设地点：青口镇壶山村；</p><palign=\"left\">2.2. 工程建设规模：青口镇文体中心的综合馆气枕包覆面积约5300㎡，游泳馆气枕包覆面积约3300㎡，综合馆和游泳馆中部PTFE雨棚覆盖面积约2000㎡；最高控制价为18845308元 ；</p><palign=\"left\">2.3. 招标范围和内容： 青口镇文体中心外立面膜结构工程施工，内容包括 ETFE 充气膜 结构、PTFE雨棚的二次深化设计、材料供应、膜结构工程制作及安装等全部相关工程施工 ，具体详见工程量清单和施工图纸；</p><palign=\"left\">2.4. 工期要求：总工期：150个日历天；其中各关键节点的工期要求为：无；</p><palign=\"left\">2.5. 工程质量要求：符合设计、国家工程施工质量验收规范合格标准；</p><palign=\"left\">2.6. 本项目（标段）招标有关的单位：</p><palign=\"left\">2.6.1. 咨询单位：福建省闽建工程造价咨询有限公司；</p><palign=\"left\">2.6.2.设计单位：城市建设研究院；</p><palign=\"left\">2.6.3.代建单位：无 ；</p><palign=\"left\">2.6.4.监理单位：待定。</p><palign=\"left\">3. 投标人资格要求及审查办法</p><palign=\"left\">3.1.本招标项目要求投标人具备建设行政主管部门核发有效的三级及以上钢结构工程专业承包施工资质和《施工企业安全生产许可证》；投标人同时具备中国钢结构协会空间结构分会核发有效的膜结构工程设计二级及以上资质和膜结构工程承包二级及以上资质。</p><palign=\"left\">3.2.投标人拟担任本招标项目的项目经理应具备有效的不低于二级建筑工程专业注册建造师执业资格(含临时执业证书)注册建造师执业资格，并持有有效的安全生产考核合格证书（B证）；依据闽建筑[2013]41号和闽建筑[2014]6号文规定：（1）已按规定在2013年12月31日前提出延续注册申请或者已办理完延续注册的二级临时注册建造师；已按规定在2014年2月28日前提出延续注册申请或者已办理完延续注册的一级建造师临时注册建造师；（2）已提出申请但还未办理完成延续注册的二级及以上临时注册建造师，投标人应在投标文件中附有省住房和城乡建设厅行政服务中心出具的延续注册受理单证明并加盖投标人公章，否则按资格审查不合格处理。</p><palign=\"left\">3.3. 本招标项目 接受 联合体投标，自愿组成联合体的应由 具备 三级及以上钢结构工程专业承包施工资质 的企业为主办方，且各方均应具备承担招标项目的相应资质条件，相同专业单位组成的联合体的，按照资质等级较低的单位确定资质等级。</p><palign=\"left\">3.4.投标人&ldquo;类似工程业绩&rdquo;要求：投标人至少有1项业绩；&ldquo;类似工程业绩&rdquo;是指（下同）：自本招标公告发布之日的前5年内（不含发布招标公告当日）完成的并经竣工验收合格的单项合同工程造价不少于500万元的ETFE充气膜结构工程的国内（不含港澳台地区）施工项目。注：根据闽建筑（2011）39号文要求，本招标项目（工程）所称的类似工程业绩应符合以下条件之一：（1）在福建省行政区域内完成的业绩或抢险救灾中由福建省组织在省外完成的业绩；（2）在福建省外完成的业绩，必须是通过互联网且不需任何权限即可在工程所在地的建设行政主管部门政务网站查询得到，而且查询到的数据应能满足本招标项目（工程）的要求。</p><palign=\"left\">3.5. 投标人应在人员、设备、资金等方面具有承担本招标项目（标段）施工的能力，具体要求详见招标文件；</p><palign=\"left\">3.6. 本招标项目招标人对投标人的资格审查采用的方式：资格后审。</p><palign=\"left\">3.7. 投标时，投标人和拟派本工程项目管理班子成员没有因违法违规被有关行政监督部门取消或限制本招标项目的投标。</p><palign=\"left\">3.8.投标人具备已通过年检合格有效的企业法人营业执照，企业注册资本金金额应超过3769062元（即本项目最高控制价&times;20%的金额）。</p><palign=\"left\">4. 招标文件的获取</p><palign=\"left\">4.1. 凡有意参加投标者，请于 2014 年 2 月 24 日至 2014 年 2 月 28日（法定公休日、法定节假日除外），每天上午 9 时 00 分至 12 时 00 分，下午 13 时 00 分至 16 时 30 分（北京时间，下同），到<u>闽侯县建设工程交易中心</u> 福建省闽建工程造价咨询有限公司 <u>代表处（地址：闽侯县科技中心内闽侯县行政服务中心负一楼</u> ） 购买招标文件；</p><palign=\"left\">4.2. 招标文件每份售价 200元，（含工程量清单、工程控制价、电子光盘等），售后不退。投标人若需要购买本项目施工图纸的，可向招标人提出申请，招标人在三个工作日内提供购买的施工图纸，图纸售价不高于《福建省物价局转发国家计委关于印发</p><palign=\"left\">5. 评标办法</p><palign=\"left\">本招标项目采用的评标办法： 经评审的最低投标价中标法 。</p><palign=\"left\">6. 投标保证金的提交</p><palign=\"left\">6.1. 投标保证金提交的时间：投标截止时间之前；</p><palign=\"left\">6.2.投标保证金提交的方式：从投标人企业基本账户以电汇或银行转账的形式汇达投标保证金指定账户；或按榕建招[2013]38号文规定交存年度投标保证金；</p><palign=\"left\">6.3. 投标保证金提交的金额：人民币叁拾陆万元。</p><palign=\"left\">7. 投标文件的递交</p><palign=\"left\">7.1. 投标文件递交的截止时间（投标截止时间）： 2014 年 3 月 18 日 10 时 00 分，提交地点为闽侯县建设工程交易中心本项目开标室 ；<u>在递交纸质投标文件的同时，投标人拟派出的委托代理人出示授权委托书原件和身份证原件，项目经理应当持注册建造师执业证书（或建造师临时执业证书）原件、身份证原件、购买招标文件凭证（一份凭证仅代表一个投标人）原件到场核验登记，否则其投标文件将不予接收。</u></p><palign=\"left\">7.2. 逾期送达的或未送达指定地点或投标文件密封不符合规定要求的投标文件，招标人不予受理。</p><palign=\"left\">8. 发布公告的媒介</p><palign=\"left\">本次招标公告同时在 福建招标与采购网（ http://www.fjbid.gov.cn ） 、福州市建设工程招标投标网（ www.fzztb .org）、闽侯招标网（www.mhztb.com）及闽侯县建设工程交易中心公示栏 上发布。</p><palign=\"left\">9. 联系方式</p><palign=\"left\">招标人：闽侯县青口镇小城镇综合改革建设试点指挥部；</p><palign=\"left\">地址：闽侯县青口镇工业路1号，邮编：350119；</p><palign=\"left\">电 话：0591-22770987</p><palign=\"left\">联系人：林主任。</p><palign=\"left\">招标代理机构：福建省闽建工程造价咨询有限公司</p><palign=\"left\">地址：福州市工业路451号鼓楼科技商务中心大厦六层，邮编：350002；</p><palign=\"left\">电话：0591-87605650-819，传真：0591-87623982；</p><palign=\"left\">联系人：林工。</p><palign=\"left\">投标保证金银行帐号：</p><palign=\"left\">开户银行：民生银行福州闽侯支行；</p><palign=\"left\">帐户名称：闽侯县建设工程交易中心；</p><palign=\"left\">帐 号：1516 0142 1000 0041 。</p><palign=\"left\">（应在汇款凭证上注明&ldquo;闽侯房建招2014011&rdquo;投标保证金，如因投标人汇款凭证未注明项目招标编号造成银行无法识别投标保证金到账情况或识别错误的，其责任由投标人自行承担。）</p><palign=\"left\">交易中心名称： 闽侯县建设工程交易中心 ；</p><palign=\"left\">电 话： 0591-22063699 ；</p><palign=\"left\">地 址： 闽侯县科技中心内闽侯县行政服务中心负一楼 。</p></p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1419', '1', '43', '68', '', '<p ><br class=\"Apple-interchange-newline\" /><p align=\"center\"></p><center><imgid=\"597978\" title=\"\" border=\"0\" align=\"center\" src=\"res/201509/02/1441090061_0_691.jpg\" sourcename=\"本地文件\" sourcedescription=\"编辑提供的本地文件\" alt=\"\" /></center><p></p><p></p><p >大连体育场，2754个气枕附着在体育新城中心体育场周围的钢结构桁架上，白天或夜晚在阳光或LED灯的照射下，蓝白相间的膜气枕将会形成海浪翻滚的大景观，将把本市这座海滨城市的特点充分展现在世人面前。据了解，中心体育场外膜结构工程将在5月底全部完工。昨天，记者走进中心体育场进行了一番探访。</p><p >蓝白相间的条块将中心体育场从空中&ldquo;包裹&rdquo;起来，远看，犹如大海中的波浪在翻滚。蓝色条块就像蓝色的海面一样，白色条块象征翻滚着的白色浪花。近看，在偌大的圆形体育场四周布满了脚手架，蓝色条块和白色条块由众多气枕组成，将圆形的体育场在纵向也形成圆弧形状，若一幢巨型战鼓悬于半空。</p><p >进入体育场内部，看台上坐椅林立，广场上的塑胶跑道和中间的绿色球场已经显现出来。往上看，圆穹形的膜结构将看台全部覆盖。&ldquo;观看比赛时，自然是风吹不着，雨淋不到。 &rdquo;中心体育场外膜结构工程施工单位，是曾参与北京水立方膜结构工程施工的本市民营企业大连伟霖膜结构工程有限公司，该公司高级工程师刘昌伟说，大连中心体育场还有内膜，将会从内部把眼前的纵横交错的钢结构桁架全部包裹起来。</p><p >目前，仅有西南部接近1万平方米的外膜结构还没有完工。本月底外膜结构将全部完工。</p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1420', '1', '43', '68', '', '<p ><p><b>膜结构</b><span >主要适用场所：体育场馆,体育场看台,主席台,相关遮阳遮雨膜结构; 高速公路收费站,加油站,停车场,公交站台,机场,地铁站,游乐园,休闲广场,观景台,舞台空,停车场膜结构；小区入口、车库入口、通道走廊、城市标志入口；高速公路收费站空间膜结构、加油站膜结构、博览会展厅膜结构、购物中心、售货亭、商业步行街、批发中心、临时会场张拉膜结构、休闲场所张拉膜结构景观膜结构、泳池遮阳膜，景观膜结构、大门出入张拉膜、小品膜、标志性膜结构建筑等。</span></p><p><span class=\"Apple-converted-space\"></span><br /></p><p><imgborder=\"0\" width=\"675\" height=\"670\" alt=\"\" src=\"res/201509/02/1441090045_0_444.jpg\" /></p><p><p >膜结构主要适用场所：运动场、体育馆、体育看台张拉膜结构; 博物馆张拉膜、音乐广场索膜结构、游乐园、休闲广场张拉膜结构、观景台张拉膜、舞台空间膜结构、停车场膜结构；高速公路收费站空间膜结构、加油站膜结构、博览会展厅膜结构、购物中心、售货亭、商业步行街、批发中心、临时会场张拉膜结构、休闲场所张拉膜结构景观膜结构、泳池遮阳膜，景观膜结构、大门出入张拉膜、小品膜、标志性膜结构建筑等。</p><p ></p><p ></p><p ></p></p></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1421', '1', '43', '68', '', '<p ></p><ul><li >PTFE膜材&mdash;&mdash;耐久性强，使用寿命在30年以上</li><li >PTFE膜材&mdash;&mdash;是永久性建筑的首选材料</li><li >PTFE膜材&mdash;&mdash;超自洁，防火材料</li><li >PTFE膜材&mdash;&mdash;专业化的加工工艺，严格的施工规程<br /> 膜结构建筑中最常用的膜材料。PTFE膜材料是指在极细的玻璃纤维（3微米）编织成的基布上涂上PTFE（聚四氟乙烯）树脂而形成的复合材料。PVC膜材料是指在聚酯纤维编织的基布上涂上PVC（聚氟乙烯）树脂而形成的复合材料。</li></ul>', '');
INSERT INTO `qinggan_list_22` VALUES ('1422', '1', '43', '68', '', '<p ></p><pid=\"MyContent\"><p>  2020年东京奥运会和残奥会筹备委员会公布了作为东京奥运会主会场的新国立竞技场的概念图。</p><p>　　国际奥委会全会当地时间9月7日在阿根廷首都布宜诺斯艾利斯投票选出2020年夏季奥运会的主办城市。日本东京最终击败西班牙马德里和土耳其伊斯坦布尔，获得2020年夏季奥运会举办权。</p><p></p><p ></p><p align=\"center\"><img id=\"23416362\" align=\"center\" src=\"res/201509/02/1441090082_0_293.jpg\" width=\"602\" height=\"276\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416363\" align=\"center\" src=\"res/201509/02/1441090082_1_175.jpg\" width=\"600\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416364\" align=\"center\" src=\"res/201509/02/1441090082_2_260.jpg\" width=\"598\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p align=\"center\"></p><p >据了解，日本新国家体育场效果图是由东京奥运会审查委员会从全球募集的众多设计图中评选而出，该设计图出自的伊拉克女建筑家扎哈-哈迪德之手，从效果图来看，日本新国家体育场外观采用了全新的流线型设计，审查委员会给予了&ldquo;内部空间感强烈，与东京都城市空间相呼应&rdquo;、&ldquo;可开闭式天窗增加了体育场的实用性&rdquo;等高度评价。</p><p >根据计算，日本新国家体育场的扩建总花费将达到1300亿日元（约人民币78亿元），预计竣工时间为2019年3月，该体育场作为2020年东京奥运会比赛主会场，届时奥运会的开幕式、闭幕式、足球、田径等项目都将在该会场举行。</p><p ></p><p></p><p></p><p></p><p></p></p><p ></p>', '');
INSERT INTO `qinggan_list_22` VALUES ('1423', '1', '43', '68', '', '<p ></p><pid=\"MyContent\"><p>  2020年东京奥运会和残奥会筹备委员会公布了作为东京奥运会主会场的新国立竞技场的概念图。</p><p>　　国际奥委会全会当地时间9月7日在阿根廷首都布宜诺斯艾利斯投票选出2020年夏季奥运会的主办城市。日本东京最终击败西班牙马德里和土耳其伊斯坦布尔，获得2020年夏季奥运会举办权。</p><p></p><p ></p><p align=\"center\"><img id=\"23416362\" align=\"center\" src=\"res/201509/02/1441090082_0_293.jpg\" width=\"602\" height=\"276\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416363\" align=\"center\" src=\"res/201509/02/1441090082_1_175.jpg\" width=\"600\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p ></p><p align=\"center\"><img id=\"23416364\" align=\"center\" src=\"res/201509/02/1441090082_2_260.jpg\" width=\"598\" height=\"353\" md5=\"\" alt=\"\" /></p><p align=\"center\"></p><p align=\"center\"></p><p >据了解，日本新国家体育场效果图是由东京奥运会审查委员会从全球募集的众多设计图中评选而出，该设计图出自的伊拉克女建筑家扎哈-哈迪德之手，从效果图来看，日本新国家体育场外观采用了全新的流线型设计，审查委员会给予了&ldquo;内部空间感强烈，与东京都城市空间相呼应&rdquo;、&ldquo;可开闭式天窗增加了体育场的实用性&rdquo;等高度评价。</p><p >根据计算，日本新国家体育场的扩建总花费将达到1300亿日元（约人民币78亿元），预计竣工时间为2019年3月，该体育场作为2020年东京奥运会比赛主会场，届时奥运会的开幕式、闭幕式、足球、田径等项目都将在该会场举行。</p><p ></p><p></p><p></p><p></p><p></p></p><p ></p>', '');

-- ----------------------------
-- Table structure for qinggan_list_23
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_23`;
CREATE TABLE `qinggan_list_23` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `link` longtext NOT NULL COMMENT '链接',
  `target` varchar(255) NOT NULL DEFAULT '_self' COMMENT '链接方式',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航';

-- ----------------------------
-- Records of qinggan_list_23
-- ----------------------------
INSERT INTO `qinggan_list_23` VALUES ('520', '1', '42', '0', 'a:2:{s:7:\"default\";s:9:\"index.php\";s:7:\"rewrite\";s:10:\"index.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('712', '1', '42', '0', 'a:2:{s:7:\"default\";s:20:\"index.php?id=aboutus\";s:7:\"rewrite\";s:12:\"aboutus.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('713', '1', '42', '0', 'a:2:{s:7:\"default\";s:17:\"index.php?id=news\";s:7:\"rewrite\";s:9:\"news.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('714', '1', '42', '0', 'a:2:{s:7:\"default\";s:20:\"index.php?id=product\";s:7:\"rewrite\";s:12:\"product.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('716', '1', '42', '0', 'a:2:{s:7:\"default\";s:17:\"index.php?id=book\";s:7:\"rewrite\";s:9:\"book.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('755', '1', '42', '0', 'a:2:{s:7:\"default\";s:17:\"index.php?id=work\";s:7:\"rewrite\";s:9:\"work.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('760', '1', '42', '0', 'a:2:{s:7:\"default\";s:30:\"index.php?id=news&cate=company\";s:7:\"rewrite\";s:17:\"news/company.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('761', '1', '42', '0', 'a:2:{s:7:\"default\";s:31:\"index.php?id=news&cate=industry\";s:7:\"rewrite\";s:18:\"news/industry.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('1254', '1', '42', '0', 'a:2:{s:7:\"default\";s:31:\"index.php?id=development-course\";s:7:\"rewrite\";s:23:\"development-course.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('1256', '1', '42', '0', 'a:2:{s:7:\"default\";s:18:\"index.php?id=photo\";s:7:\"rewrite\";s:10:\"photo.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('1298', '1', '42', '0', 'a:2:{s:7:\"default\";s:28:\"index.php?id=download-center\";s:7:\"rewrite\";s:20:\"download-center.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('1299', '1', '42', '0', 'a:2:{s:7:\"default\";s:16:\"index.php?id=bbs\";s:7:\"rewrite\";s:8:\"bbs.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('1300', '1', '147', '0', 'a:2:{s:7:\"default\";s:21:\"index.php?id=about-us\";s:7:\"rewrite\";s:13:\"about-us.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('1301', '1', '147', '0', 'a:2:{s:7:\"default\";s:31:\"index.php?id=development-course\";s:7:\"rewrite\";s:23:\"development-course.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('1302', '1', '147', '0', 'a:2:{s:7:\"default\";s:17:\"index.php?id=news\";s:7:\"rewrite\";s:9:\"news.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('1303', '1', '147', '0', 'a:2:{s:7:\"default\";s:17:\"index.php?id=book\";s:7:\"rewrite\";s:9:\"book.html\";}', '_self');
INSERT INTO `qinggan_list_23` VALUES ('1304', '1', '147', '0', 'a:2:{s:7:\"default\";s:23:\"index.php?id=contact-us\";s:7:\"rewrite\";s:15:\"contact-us.html\";}', '_self');

-- ----------------------------
-- Table structure for qinggan_list_24
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_24`;
CREATE TABLE `qinggan_list_24` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `pictures` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `package` longtext NOT NULL COMMENT '包装清单',
  `content` longtext NOT NULL COMMENT '内容',
  `m_title` varchar(255) NOT NULL DEFAULT '' COMMENT '手机版标题',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品';

-- ----------------------------
-- Records of qinggan_list_24
-- ----------------------------
INSERT INTO `qinggan_list_24` VALUES ('1753', '1', '45', '582', '', '1013', '手机主机电源适配器USB Type-C 数据线三包凭证入门指南插针', '<p><img src=\"res/201603/22/auto_1011.jpg\" alt=\"auto_1011.jpg\"/></p><p><img src=\"res/201603/22/auto_1010.jpg\" alt=\"auto_1010.jpg\"/></p><p><img src=\"res/201603/22/auto_1012.jpg\" alt=\"auto_1012.jpg\"/></p>', '小米5');
INSERT INTO `qinggan_list_24` VALUES ('1760', '1', '45', '583', '1015,1017,1016', '1015', 'MX5 手机主机 × 1USB数据线 × 1电源适配器 × 1SIM 卡顶针× 1保修证书 × 1', '', '魅族 MX5');
INSERT INTO `qinggan_list_24` VALUES ('1761', '1', '45', '584', '1019,1020,1018', '1018', '手机（含内置电池）*1充电器*1USB线*1耳机*1保修卡*1安全说明*1快速指南*1卡座捅针*1', '<p style=\"text-indent: 2em;\">2014年5月7日，华为在巴黎发布了2014旗舰机型P7。P7配置5英寸1080P全高清屏幕，采用金属+双玻璃结构，机身厚度仅6.5mm，支持CAT4 LTE网络，五月起在中国大陆等30多个国家及地区开售，全球售价449欧元，中国大陆售价为人民币2888元。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">华为P7正面采用5寸1080p屏，有着6.5mm的极致超薄机身，拍照方面有着前置800万+后置1300万摄像头组合，内置1.8GHz海思Kirin910T四核处理器，有着2GBRAM+16GBROM机身存储，后置不可拆卸的2500mAh电池，支持CAT4LTE4G网络。华为Ascend P7分辨率为1920X1080像素的FHD级别，显示效果非常细腻。核心方面内置一颗主频1.8GHz海思Kirin 910T四核芯处理器，以及2GB RAM+16GB ROM的内存组合，流畅运行基于Android 4.4系统的Emotion UI 2.3用户界面。<br/></p><p><br/></p>', '华为 P7');
INSERT INTO `qinggan_list_24` VALUES ('1762', '1', '45', '585', '1021,1022,1023,1024', '1021', '主机*1耳机*1数据线*1充电器*1取卡针*1透明保护壳*1保修卡*1用户快速入门指南*1', '<h4>双曲面屏幕</h4><p>vivo Xplay5采用了双曲面屏幕，屏幕两侧有较大的弧度，曲面的屏幕会使屏幕呈现出无边的视觉效果。</p><p>vivo Xplay5专为曲面侧屏设计了侧屏来电提醒、解锁。</p><p><br/></p><h4>侧面解锁</h4><p>解锁方面，用户在进行图标滑动至曲面屏部分时会发生明显的「变形」，当在锁屏界面滑动解锁时，手机的曲面屏会有相当明显的光晕效果。</p><p>侧屏来电提醒：当手机反扣放在桌面时，如果手机来电时，双侧曲面屏也会散发波浪光影提醒用户来电信息。</p><p><br/></p><h4>智慧引擎</h4><p>智慧引擎优化主要分为内存加速和处理器加速。根据用户的使用情况选择性地智能加载部分常用应用，并调高这些常用应用的优先级，减小被回收的几率。另外，vivo 还优化了系统代码，大幅度降低系统的内存占用，并针对性地做了缓存碎片和内存的闲时动态回收，进而腾出更多的内存空间供用户使用。</p><p><br/></p><h4>分屏多任务</h4><p>vivo Xplay5配备了分屏多任务功能。在用户进行看电影，游戏，看书时，微信QQ聊天时不需进行切换，手机可以自动分屏为功能屏幕，一边聊微信，一边看电影。</p><p>但是现在分屏多任务支持的软件还有限，如果支持更多软件，分屏功能将会更实用。</p><p><br/></p><h4>128GB存储和3600mAh</h4><p>vivo Xplay5和vivo Xplay5旗舰版均配备了128GB的存储空间和3600mAH，提供更大和更长的续航选择。</p>', 'vivo Xplay5');
INSERT INTO `qinggan_list_24` VALUES ('1763', '1', '45', '216', '1026,1027,1025,1028', '1025', '装有 iOS 9 的 iPhone具有线控功能和麦克风的 Apple EarPodsLightning 至 USB 连接线USB 电源适配器资料', '<p>iPhone SE是美国苹果公司推出的一款新的4英寸iPhone智能手机，该手机基本上是2013年发布的iPhone 5s的升级版本。苹果公司将该款产品命名为：iPhone SE，这意味着iPhone升级版本的名称将首次不带数字。</p><p><br/></p><p>iPhone SE由苹果公司于美国时间2016年3月21日13点在美国加州库比蒂诺总部举行发布会正式发布。 iPhone SE有玫瑰金色，有一个嵌入不锈钢标志。正面和背面底部有玻璃镜面。iPhone SE外观与iPhone 5s基本一致。iPhone SE 16G和64G的美国市场售价分别为399和499美元，中国首发售价分别为3288元4088元。</p><p><br/></p>', 'Apple iPhone 5SE');

-- ----------------------------
-- Table structure for qinggan_list_40
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_40`;
CREATE TABLE `qinggan_list_40` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关于我们';

-- ----------------------------
-- Records of qinggan_list_40
-- ----------------------------
INSERT INTO `qinggan_list_40` VALUES ('1756', '1', '87', '0', '<p>深圳市锟铻科技有限公司（Shenzhen Kunwu Technology Co., Ltd.）创立于2014年，专注于企业网站技术的研究和开发，是国内最有影响力的企业网站技术提供商。</p><p>“创新，将新技术转化为生产力”是锟铻科技的核心竞争力。凭借对软件和互联网行业的深刻理解，锟铻科技将软件技术与互联网应用相结合，将领先业界的产品理念和丰富的产品开发经验相结合，为用户提供简单、方便、安全、实用的协同应用软件产品和解决方案，帮助客户实现低成本、低风险、快起步、高效率的信息化目标。</p><p>锟铻科技成长的过程，就是服务客户并和客户一起不断成功的过程！我们用心、努力作好每一件事，满怀信心迎接每一次挑战。</p>');
INSERT INTO `qinggan_list_40` VALUES ('1757', '1', '87', '0', '<p>联系我们</p><p>请到后台：关于我们》联系我们那里管理相关内容</p>');
INSERT INTO `qinggan_list_40` VALUES ('1758', '1', '87', '0', '<table><tbody><tr class=\"firstRow\"><td width=\"117\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"color: rgb(192, 0, 0);\">2011年12月</span></td><td width=\"721\" valign=\"top\" style=\"word-break: break-all;\">phpok3.4版发布（后台更换为桌面式）</td></tr><tr><td width=\"116\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"color: rgb(192, 0, 0);\">2011年9月</span></td><td width=\"721\" valign=\"top\" style=\"word-break: break-all;\">phpok3.3完整版发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2010年8月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">phpok3.0完整版发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2008年9月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">phpok3.0精简版发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2008年5月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">phpok2.2稳定版发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"116\"><span style=\"color: rgb(192, 0, 0);\">2008年3月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">phpok2.0发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"116\"><span style=\"color: rgb(192, 0, 0);\">2007年5月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb5.2发布，同时更名为 phpok1.0版本</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2007年1月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb5.0发布（第一次实现多语言，多风格的建站系统）</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2006年10月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb4.2发布（GBK）</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2006年8月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb4.1发布（UTF-8）</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2006年6月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgweb4.0发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2005年11月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgWeb3.0发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2005年8月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">工作室论坛开通</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2005年7月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgWeb1.0发布</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"115\"><span style=\"color: rgb(192, 0, 0);\">2005年4月</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"719\">qgWeb0.54版发布</td></tr></tbody></table><p><br/></p>');
INSERT INTO `qinggan_list_40` VALUES ('1759', '1', '87', '0', '<p>工作环境~</p>');

-- ----------------------------
-- Table structure for qinggan_list_46
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_46`;
CREATE TABLE `qinggan_list_46` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` longtext NOT NULL COMMENT '内容',
  `adm_reply` longtext NOT NULL COMMENT '管理员回复',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言模块';

-- ----------------------------
-- Records of qinggan_list_46
-- ----------------------------
INSERT INTO `qinggan_list_46` VALUES ('1285', '1', '96', '0', '测试留言', '测试留言', '测试留言', '', '');

-- ----------------------------
-- Table structure for qinggan_list_61
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_61`;
CREATE TABLE `qinggan_list_61` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `link` longtext NOT NULL COMMENT '链接',
  `target` varchar(255) NOT NULL DEFAULT '_self' COMMENT '链接方式',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人电话',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of qinggan_list_61
-- ----------------------------
INSERT INTO `qinggan_list_61` VALUES ('1252', '1', '142', '0', 'http://www.phpok.com', '_blank', '');
INSERT INTO `qinggan_list_61` VALUES ('1261', '1', '142', '0', 'http://www.sz-qibang.com/', '_blank', '');
INSERT INTO `qinggan_list_61` VALUES ('1262', '1', '142', '0', 'http://www.17tengfei.com/', '_blank', '');
INSERT INTO `qinggan_list_61` VALUES ('1263', '1', '142', '0', 'http://www.7139.com', '_blank', '');
INSERT INTO `qinggan_list_61` VALUES ('1264', '1', '142', '0', 'http://www.chinaz.com/', '_blank', '');
INSERT INTO `qinggan_list_61` VALUES ('1265', '1', '142', '0', 'http://www.admin5.com/', '_blank', '');
INSERT INTO `qinggan_list_61` VALUES ('1266', '1', '142', '0', 'http://www.cnzz.cn/', '_blank', '');
INSERT INTO `qinggan_list_61` VALUES ('1267', '1', '142', '0', 'http://www.im286.com/', '_blank', '');
INSERT INTO `qinggan_list_61` VALUES ('1268', '1', '142', '0', 'http://www.mycodes.net/', '_blank', '');
INSERT INTO `qinggan_list_61` VALUES ('1772', '1', '142', '0', 'http://www.phpok.com', '_self', '15818533971');

-- ----------------------------
-- Table structure for qinggan_list_64
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_64`;
CREATE TABLE `qinggan_list_64` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `qq` varchar(255) NOT NULL DEFAULT '' COMMENT '客服QQ',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客服';

-- ----------------------------
-- Records of qinggan_list_64
-- ----------------------------
INSERT INTO `qinggan_list_64` VALUES ('1305', '1', '148', '0', '40782502');
INSERT INTO `qinggan_list_64` VALUES ('1427', '1', '148', '0', '150467466');

-- ----------------------------
-- Table structure for qinggan_list_65
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_65`;
CREATE TABLE `qinggan_list_65` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `note` longtext NOT NULL COMMENT '摘要',
  `fsize` varchar(255) NOT NULL DEFAULT '' COMMENT '文件大小',
  `content` longtext NOT NULL COMMENT '内容',
  `version` varchar(255) NOT NULL DEFAULT '' COMMENT '版本',
  `website` varchar(255) NOT NULL DEFAULT '' COMMENT '官方网站',
  `platform` varchar(255) NOT NULL DEFAULT '' COMMENT '适用平台',
  `devlang` varchar(255) NOT NULL DEFAULT '' COMMENT '开发语言',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '开发商',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `copyright` varchar(255) NOT NULL DEFAULT '' COMMENT '授权协议',
  `dfile` varchar(255) NOT NULL DEFAULT '' COMMENT '附件',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源下载';

-- ----------------------------
-- Records of qinggan_list_65
-- ----------------------------
INSERT INTO `qinggan_list_65` VALUES ('1310', '1', '151', '198', '​测试下载~', '5KB', '<p>测试下载~<br/></p>', '1.0', 'http://www.phpok.com', 'OS', 'PHP/MySQL', 'PHPOK.com', '624', '免费版', '1029');

-- ----------------------------
-- Table structure for qinggan_list_66
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_66`;
CREATE TABLE `qinggan_list_66` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `content` longtext NOT NULL COMMENT '内容',
  `toplevel` varchar(255) NOT NULL DEFAULT '0' COMMENT '置顶',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='论坛BBS';

-- ----------------------------
-- Records of qinggan_list_66
-- ----------------------------
INSERT INTO `qinggan_list_66` VALUES ('1311', '1', '152', '204', '<p>测试论坛功能</p>', '', '');
INSERT INTO `qinggan_list_66` VALUES ('1334', '1', '152', '204', '<p>测试</p>', '', '');

-- ----------------------------
-- Table structure for qinggan_list_68
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_68`;
CREATE TABLE `qinggan_list_68` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictures` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图集相册';

-- ----------------------------
-- Records of qinggan_list_68
-- ----------------------------
INSERT INTO `qinggan_list_68` VALUES ('1765', '1', '144', '211', '1025', '1025,1028,1027,1026', '');
INSERT INTO `qinggan_list_68` VALUES ('1766', '1', '144', '211', '1024', '1021,1023,1024,1022', '<h4 style=\"white-space: normal;\">双曲面屏幕</h4><p style=\"white-space: normal;\">vivo Xplay5采用了双曲面屏幕，屏幕两侧有较大的弧度，曲面的屏幕会使屏幕呈现出无边的视觉效果。</p><p style=\"white-space: normal;\">vivo Xplay5专为曲面侧屏设计了侧屏来电提醒、解锁。</p><p style=\"white-space: normal;\"><br/></p><h4 style=\"white-space: normal;\">侧面解锁</h4><p style=\"white-space: normal;\">解锁方面，用户在进行图标滑动至曲面屏部分时会发生明显的「变形」，当在锁屏界面滑动解锁时，手机的曲面屏会有相当明显的光晕效果。</p><p style=\"white-space: normal;\">侧屏来电提醒：当手机反扣放在桌面时，如果手机来电时，双侧曲面屏也会散发波浪光影提醒用户来电信息。</p><p style=\"white-space: normal;\"><br/></p><h4 style=\"white-space: normal;\">智慧引擎</h4><p style=\"white-space: normal;\">智慧引擎优化主要分为内存加速和处理器加速。根据用户的使用情况选择性地智能加载部分常用应用，并调高这些常用应用的优先级，减小被回收的几率。另外，vivo 还优化了系统代码，大幅度降低系统的内存占用，并针对性地做了缓存碎片和内存的闲时动态回收，进而腾出更多的内存空间供用户使用。</p><p style=\"white-space: normal;\"><br/></p><h4 style=\"white-space: normal;\">分屏多任务</h4><p style=\"white-space: normal;\">vivo Xplay5配备了分屏多任务功能。在用户进行看电影，游戏，看书时，微信QQ聊天时不需进行切换，手机可以自动分屏为功能屏幕，一边聊微信，一边看电影。</p><p style=\"white-space: normal;\">但是现在分屏多任务支持的软件还有限，如果支持更多软件，分屏功能将会更实用。</p><p style=\"white-space: normal;\"><br/></p><h4 style=\"white-space: normal;\">128GB存储和3600mAh</h4><p style=\"white-space: normal;\">vivo Xplay5和vivo Xplay5旗舰版均配备了128GB的存储空间和3600mAH，提供更大和更长的续航选择。</p>');
INSERT INTO `qinggan_list_68` VALUES ('1767', '1', '144', '211', '1020', '1018,1020,1019', '');
INSERT INTO `qinggan_list_68` VALUES ('1768', '1', '144', '211', '1015', '1015,1017,1016', '');
INSERT INTO `qinggan_list_68` VALUES ('1769', '1', '144', '211', '1013', '1011,1012,1010', '');

-- ----------------------------
-- Table structure for qinggan_list_69
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_69`;
CREATE TABLE `qinggan_list_69` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `attrs` longtext NOT NULL COMMENT '产品多属性',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品参考数据';

-- ----------------------------
-- Records of qinggan_list_69
-- ----------------------------

-- ----------------------------
-- Table structure for qinggan_list_74
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_74`;
CREATE TABLE `qinggan_list_74` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `account` varchar(255) NOT NULL DEFAULT '' COMMENT '会员账号',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='注册审核模块';

-- ----------------------------
-- Records of qinggan_list_74
-- ----------------------------

-- ----------------------------
-- Table structure for qinggan_list_75
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_75`;
CREATE TABLE `qinggan_list_75` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  `bankprice` varchar(255) NOT NULL DEFAULT '' COMMENT '汇款金额',
  `note` longtext NOT NULL COMMENT '摘要',
  `bankname` varchar(255) NOT NULL DEFAULT '' COMMENT '汇款银行',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='银行汇款';

-- ----------------------------
-- Records of qinggan_list_75
-- ----------------------------
INSERT INTO `qinggan_list_75` VALUES ('1802', '1', '386', '0', 'seika', '15818', 'dfaf', 'adsfasfas', '测试的');

-- ----------------------------
-- Table structure for qinggan_list_84
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_84`;
CREATE TABLE `qinggan_list_84` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '网站ID',
  `project_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类ID',
  `wxtype` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单类型',
  `wxcontent` varchar(255) NOT NULL DEFAULT '' COMMENT '微信内容',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`,`project_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信菜单';

-- ----------------------------
-- Records of qinggan_list_84
-- ----------------------------

-- ----------------------------
-- Table structure for qinggan_list_attr
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_attr`;
CREATE TABLE `qinggan_list_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '属性组ID',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参数ID',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '增减价格值',
  `weight` float NOT NULL DEFAULT '0' COMMENT '重量增减',
  `volume` float NOT NULL DEFAULT '0' COMMENT '体积增减值，带-号为减值',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='主题属性';

-- ----------------------------
-- Records of qinggan_list_attr
-- ----------------------------
INSERT INTO `qinggan_list_attr` VALUES ('11', '1306', '3', '8', '5.0000', '0', '0', '20');
INSERT INTO `qinggan_list_attr` VALUES ('10', '1306', '3', '7', '5.0000', '0', '0', '10');
INSERT INTO `qinggan_list_attr` VALUES ('26', '1306', '1', '4', '2.0000', '1', '0', '30');
INSERT INTO `qinggan_list_attr` VALUES ('25', '1306', '1', '3', '4.0000', '1', '0', '20');
INSERT INTO `qinggan_list_attr` VALUES ('24', '1306', '1', '1', '3.0000', '1', '0', '10');
INSERT INTO `qinggan_list_attr` VALUES ('34', '1753', '8', '32', '1249.0000', '0', '0', '40');
INSERT INTO `qinggan_list_attr` VALUES ('33', '1753', '8', '31', '1199.0000', '0', '0', '30');
INSERT INTO `qinggan_list_attr` VALUES ('32', '1753', '8', '30', '549.0000', '0', '0', '20');
INSERT INTO `qinggan_list_attr` VALUES ('31', '1753', '8', '29', '499.0000', '0', '0', '10');
INSERT INTO `qinggan_list_attr` VALUES ('35', '1753', '1', '5', '0.0000', '0', '0', '40');
INSERT INTO `qinggan_list_attr` VALUES ('36', '1753', '1', '6', '0.0000', '0', '0', '50');
INSERT INTO `qinggan_list_attr` VALUES ('37', '1753', '1', '33', '0.0000', '0', '0', '60');
INSERT INTO `qinggan_list_attr` VALUES ('38', '1760', '1', '6', '0.0000', '0', '0', '50');
INSERT INTO `qinggan_list_attr` VALUES ('39', '1760', '1', '36', '0.0000', '0', '0', '70');
INSERT INTO `qinggan_list_attr` VALUES ('40', '1760', '8', '34', '0.0000', '0', '0', '50');
INSERT INTO `qinggan_list_attr` VALUES ('41', '1760', '8', '35', '1000.0000', '0', '0', '60');
INSERT INTO `qinggan_list_attr` VALUES ('42', '1761', '1', '5', '0.0000', '0', '0', '40');
INSERT INTO `qinggan_list_attr` VALUES ('43', '1761', '1', '6', '0.0000', '0', '0', '50');
INSERT INTO `qinggan_list_attr` VALUES ('44', '1761', '8', '34', '0.0000', '0', '0', '50');
INSERT INTO `qinggan_list_attr` VALUES ('45', '1761', '8', '35', '100.0000', '0', '0', '60');
INSERT INTO `qinggan_list_attr` VALUES ('46', '1762', '1', '33', '0.0000', '0', '0', '60');
INSERT INTO `qinggan_list_attr` VALUES ('47', '1763', '1', '6', '0.0000', '0', '0', '50');
INSERT INTO `qinggan_list_attr` VALUES ('48', '1763', '1', '33', '0.0000', '0', '0', '60');
INSERT INTO `qinggan_list_attr` VALUES ('49', '1763', '1', '5', '0.0000', '0', '0', '40');
INSERT INTO `qinggan_list_attr` VALUES ('50', '1763', '8', '34', '0.0000', '0', '0', '50');
INSERT INTO `qinggan_list_attr` VALUES ('51', '1763', '8', '37', '800.0000', '0', '0', '70');

-- ----------------------------
-- Table structure for qinggan_list_biz
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_biz`;
CREATE TABLE `qinggan_list_biz` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '价格',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '货币ID',
  `weight` float unsigned NOT NULL DEFAULT '0' COMMENT '重量，单位是Kg',
  `volume` float unsigned NOT NULL DEFAULT '0' COMMENT '体积，单位立方米',
  `unit` varchar(50) NOT NULL COMMENT '单位',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0实物1虚拟产品',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='电子商务';

-- ----------------------------
-- Records of qinggan_list_biz
-- ----------------------------
INSERT INTO `qinggan_list_biz` VALUES ('1306', '170.0000', '1', '0', '0', '条', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1253', '300.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1680', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1681', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1682', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1683', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1684', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1685', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1686', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1687', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1688', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1689', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1690', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1691', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1692', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1693', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1694', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1748', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1749', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1750', '8000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1753', '2000.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1760', '1499.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1761', '999.0000', '1', '0', '0', '台', '1');
INSERT INTO `qinggan_list_biz` VALUES ('1762', '3698.0000', '1', '0', '0', '', '0');
INSERT INTO `qinggan_list_biz` VALUES ('1763', '3288.0000', '1', '0', '0', '台', '1');

-- ----------------------------
-- Table structure for qinggan_list_cate
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_list_cate`;
CREATE TABLE `qinggan_list_cate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  PRIMARY KEY (`id`,`cate_id`),
  KEY `id` (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题绑定的分类';

-- ----------------------------
-- Records of qinggan_list_cate
-- ----------------------------
INSERT INTO `qinggan_list_cate` VALUES ('1310', '198');
INSERT INTO `qinggan_list_cate` VALUES ('1311', '204');
INSERT INTO `qinggan_list_cate` VALUES ('1334', '204');
INSERT INTO `qinggan_list_cate` VALUES ('1368', '8');
INSERT INTO `qinggan_list_cate` VALUES ('1369', '8');
INSERT INTO `qinggan_list_cate` VALUES ('1370', '68');
INSERT INTO `qinggan_list_cate` VALUES ('1371', '68');
INSERT INTO `qinggan_list_cate` VALUES ('1423', '68');
INSERT INTO `qinggan_list_cate` VALUES ('1676', '68');
INSERT INTO `qinggan_list_cate` VALUES ('1677', '68');
INSERT INTO `qinggan_list_cate` VALUES ('1753', '582');
INSERT INTO `qinggan_list_cate` VALUES ('1760', '583');
INSERT INTO `qinggan_list_cate` VALUES ('1761', '584');
INSERT INTO `qinggan_list_cate` VALUES ('1762', '585');
INSERT INTO `qinggan_list_cate` VALUES ('1763', '216');
INSERT INTO `qinggan_list_cate` VALUES ('1765', '211');
INSERT INTO `qinggan_list_cate` VALUES ('1766', '211');
INSERT INTO `qinggan_list_cate` VALUES ('1767', '211');
INSERT INTO `qinggan_list_cate` VALUES ('1768', '211');
INSERT INTO `qinggan_list_cate` VALUES ('1769', '211');

-- ----------------------------
-- Table structure for qinggan_log
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_log`;
CREATE TABLE `qinggan_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `note` varchar(255) NOT NULL COMMENT '日志摘要',
  `url` varchar(255) NOT NULL COMMENT '请求网址',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `appid` varchar(30) NOT NULL DEFAULT 'www' COMMENT '接入APP_ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作人',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日志记录';

-- ----------------------------
-- Records of qinggan_log
-- ----------------------------

-- ----------------------------
-- Table structure for qinggan_module
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_module`;
CREATE TABLE `qinggan_module` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(255) NOT NULL COMMENT '模块名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '模块排序',
  `note` varchar(255) NOT NULL COMMENT '模块说明',
  `layout` text NOT NULL COMMENT '布局',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='模块管理，每创建一个模块自动创建一个表';

-- ----------------------------
-- Records of qinggan_module
-- ----------------------------
INSERT INTO `qinggan_module` VALUES ('21', '图片轮播', '1', '20', '适用于图片播放器，图片友情链接', 'pic,link,target');
INSERT INTO `qinggan_module` VALUES ('22', '文章资讯', '1', '10', '适用于新闻，文章之类', 'hits,dateline,thumb');
INSERT INTO `qinggan_module` VALUES ('23', '自定义链接', '1', '30', '适用于导航，页脚文本导航，文字友情链接', 'link,target');
INSERT INTO `qinggan_module` VALUES ('24', '产品', '1', '40', '适用于电子商务中产品展示模型', 'hits,dateline,m_title,thumb');
INSERT INTO `qinggan_module` VALUES ('40', '单页信息', '1', '60', '适用于公司简介，联系我们', 'hits,dateline');
INSERT INTO `qinggan_module` VALUES ('46', '留言模块', '1', '90', '', 'dateline,fullname,email,content');
INSERT INTO `qinggan_module` VALUES ('61', '友情链接', '1', '100', '适用于导航，页脚文本导航，文字友情链接', 'link,target,tel');
INSERT INTO `qinggan_module` VALUES ('64', '客服', '1', '110', '', 'qq');
INSERT INTO `qinggan_module` VALUES ('65', '资源下载', '1', '70', '', 'hits,dateline,fsize,version,author,website,thumb');
INSERT INTO `qinggan_module` VALUES ('66', '论坛BBS', '1', '50', '', 'hits,dateline,user_id');
INSERT INTO `qinggan_module` VALUES ('68', '图集相册', '1', '80', '', 'hits,dateline,thumb');
INSERT INTO `qinggan_module` VALUES ('69', '产品参考数据', '1', '120', '', 'hits,dateline');
INSERT INTO `qinggan_module` VALUES ('74', '注册审核模块', '1', '130', '用户实现会员自动审核验证', 'dateline,account');
INSERT INTO `qinggan_module` VALUES ('75', '银行汇款', '1', '140', '', 'dateline,user_id,bankname,fullname,mobile,bankprice');
INSERT INTO `qinggan_module` VALUES ('84', '微信菜单', '1', '150', '', 'hits,dateline');

-- ----------------------------
-- Table structure for qinggan_module_fields
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_module_fields`;
CREATE TABLE `qinggan_module_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `module_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` varchar(255) NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  `is_front` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0前端不可用1前端可用',
  `search` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不支持搜索1完全匹配搜索2模糊匹配搜索3区间搜索',
  `search_separator` varchar(10) NOT NULL COMMENT '分割符，仅限区间搜索时有效',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of qinggan_module_fields
-- ----------------------------
INSERT INTO `qinggan_module_fields` VALUES ('92', '21', '链接', 'link', 'longtext', '', 'text', '', 'safe', '', '90', 'a:2:{s:8:\"form_btn\";s:3:\"url\";s:5:\"width\";s:3:\"500\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('82', '22', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '10', 'a:6:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"0\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('83', '22', '内容', 'content', 'longtext', '', 'editor', '', 'html_js', '', '30', 'a:8:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"inc_tag\";s:1:\"1\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:9:{s:5:\"image\";s:1:\"1\";s:4:\"info\";s:1:\"1\";s:5:\"video\";s:1:\"1\";s:4:\"file\";s:1:\"1\";s:4:\"page\";s:1:\"1\";s:10:\"insertcode\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";s:10:\"fontfamily\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('84', '23', '链接', 'link', 'longtext', '设置导航链接', 'url', '', 'safe', '', '90', 'a:1:{s:5:\"width\";s:3:\"500\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('85', '23', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_self', '100', 'a:1:{s:11:\"option_list\";s:5:\"opt:6\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('88', '24', '图片', 'pictures', 'varchar', '设置产品的图片，支持多图，上传规格为500x500', 'upload', '', 'safe', '', '50', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('93', '21', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_blank', '100', 'a:3:{s:11:\"option_list\";s:5:\"opt:6\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";b:0;}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('131', '40', '内容', 'content', 'longtext', '', 'editor', '', 'html_js', '', '255', 'a:7:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:6:{s:5:\"image\";s:1:\"1\";s:4:\"info\";s:1:\"1\";s:10:\"insertcode\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";s:10:\"fontfamily\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('141', '46', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('142', '46', '邮箱', 'email', 'varchar', '', 'text', '', 'safe', '', '130', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('143', '46', '内容', 'content', 'longtext', '', 'textarea', '', 'safe', '', '200', 'a:2:{s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"180\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('144', '46', '管理员回复', 'adm_reply', 'longtext', '', 'editor', '', 'html_js', '', '255', 'a:7:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"100\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:3:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('200', '21', '图片', 'pic', 'varchar', '统一宽度为980，高度自定义，建议统一高度300', 'upload', '', 'safe', '', '20', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('177', '22', '摘要', 'note', 'longtext', '简要文字描述', 'textarea', '', 'safe', '', '20', 'a:2:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:2:\"80\";}', '0', '2', '');
INSERT INTO `qinggan_module_fields` VALUES ('204', '61', '链接方式', 'target', 'varchar', '设置是否在新窗口打开', 'radio', '', 'safe', '_self', '100', 'a:3:{s:11:\"option_list\";s:5:\"opt:6\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";s:0:\"\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('203', '61', '链接', 'link', 'longtext', '填写链接要求带上http://', 'text', '', 'safe', '', '90', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"280\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('268', '65', '附件', 'dfile', 'varchar', '', 'upload', '', 'safe', '', '60', 'a:8:{s:7:\"cate_id\";s:2:\"11\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:7:\"rar,zip\";s:11:\"upload_name\";s:12:\"压缩软件\";s:13:\"upload_binary\";s:1:\"0\";s:15:\"upload_compress\";s:1:\"0\";s:18:\"upload_compress_wh\";s:3:\"500\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('221', '65', '摘要', 'note', 'longtext', '简要描述下载信息', 'textarea', '', 'safe', '', '120', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('222', '65', '文件大小', 'fsize', 'varchar', '设置文件大小，注意填写相应的单位，如KB，MB', 'text', '', 'safe', '', '10', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('226', '65', '版本', 'version', 'varchar', '设置软件版本号', 'text', '', 'safe', '', '15', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"100\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('227', '65', '官方网站', 'website', 'varchar', '请输入软件官方网址，没有请留空，需要加 http://', 'text', '', 'safe', 'http://', '30', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('224', '65', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:7:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:3:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('228', '65', '适用平台', 'platform', 'varchar', '请填写该软件适用在哪个平台下运行', 'text', '', 'safe', '', '40', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:93:\"WinXPWin2003WinVistaWin7Win8Win2008Win2012CentOSRedHatUbuntuFreeBSDOS\";s:14:\"ext_quick_type\";s:1:\"/\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('229', '65', '开发语言及数据库', 'devlang', 'varchar', '设置该软件的开发语言及数据库', 'text', '', 'safe', '', '50', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:108:\"PHPASPJSPPerlHTMLJSMySQLAccessSQLiteOracleC++C#VBDephiJavaPythonRuby其他\";s:14:\"ext_quick_type\";s:1:\"/\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('230', '65', '开发商', 'author', 'varchar', '设置开发商名称', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";b:0;s:14:\"ext_quick_type\";b:0;}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('231', '65', '缩略图', 'thumb', 'varchar', '设置附件缩略图，宽高为420x420', 'upload', '', 'safe', '', '110', 'a:8:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"1\";s:15:\"upload_compress\";s:1:\"0\";s:18:\"upload_compress_wh\";s:3:\"500\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('232', '65', '授权协议', 'copyright', 'varchar', '针对这个软件设置相应的授权协议', 'radio', '', 'safe', '免费版', '70', 'a:3:{s:11:\"option_list\";b:0;s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";s:97:\"免费版共享版试用版商业版开源软件GPLLGPLApache License其他授权\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('233', '66', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:7:{s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:4:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";s:10:\"fontfamily\";s:1:\"1\";}}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('234', '66', '置顶', 'toplevel', 'varchar', '', 'radio', '', 'int', '', '10', 'a:3:{s:11:\"option_list\";s:6:\"opt:12\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";b:0;}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('238', '66', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('239', '68', '缩略图', 'thumb', 'varchar', '请上传300x300规格的图片，文件大小建议不超过100KB', 'upload', '', 'safe', '', '30', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('240', '68', '图片', 'pictures', 'varchar', '支持多图，建议上传500x500或600x600规格的图片', 'upload', '', 'safe', '', '50', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_auto\";s:1:\"1\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('244', '61', '联系人电话', 'tel', 'varchar', '填写联系人电话', 'text', '', 'safe', '', '110', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"280\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('248', '69', '产品多属性', 'attrs', 'longtext', '', 'param', '', 'safe', '', '20', 'a:3:{s:6:\"p_name\";s:0:\"\";s:6:\"p_type\";s:1:\"1\";s:7:\"p_width\";s:0:\"\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('267', '68', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:7:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:3:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('269', '46', '图片', 'pic', 'varchar', '', 'upload', '', 'safe', '', '180', 'a:8:{s:7:\"cate_id\";s:1:\"1\";s:11:\"cate_custom\";s:1:\"0\";s:11:\"is_multiple\";s:1:\"1\";s:11:\"upload_type\";s:11:\"png,jpg,gif\";s:11:\"upload_name\";s:6:\"图片\";s:13:\"upload_binary\";s:1:\"0\";s:15:\"upload_compress\";s:1:\"1\";s:18:\"upload_compress_wh\";s:3:\"500\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('270', '64', '客服QQ', 'qq', 'varchar', '', 'text', '', 'safe', '', '150', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('288', '24', '缩略图', 'thumb', 'varchar', '', 'upload', '', 'safe', '', '20', 'a:3:{s:7:\"cate_id\";s:1:\"1\";s:11:\"is_multiple\";s:1:\"0\";s:11:\"upload_auto\";s:1:\"1\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('292', '24', '包装清单', 'package', 'longtext', '', 'textarea', '', '', '', '70', 'a:2:{s:5:\"width\";s:3:\"500\";s:6:\"height\";s:3:\"100\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('293', '24', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '80', 'a:8:{s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"inc_tag\";s:0:\"\";s:10:\"paste_text\";s:0:\"\";s:4:\"btns\";a:4:{s:5:\"image\";s:1:\"1\";s:9:\"paragraph\";s:1:\"1\";s:8:\"fontsize\";s:1:\"1\";s:10:\"fontfamily\";s:1:\"1\";}}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('294', '24', '手机版标题', 'm_title', 'varchar', '标题较短，请根据实际情况使用', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('296', '74', '会员账号', 'account', 'varchar', '验证会员模块的账号', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"500\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('297', '75', '姓名', 'fullname', 'varchar', '请填写汇款人的姓名', 'text', '', 'safe', '', '10', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('298', '75', '手机号', 'mobile', 'varchar', '请填写汇款人的手机号', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('299', '75', '汇款金额', 'bankprice', 'varchar', '请填写您汇款的金额，建议多汇几分，以示区别', 'text', '', 'safe', '', '30', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('300', '75', '摘要', 'note', 'longtext', '填写您的备注或汇款银行上的备注信息', 'textarea', '', 'safe', '', '40', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:2:\"80\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('301', '75', '汇款银行', 'bankname', 'varchar', '请填写您汇款的银行', 'text', '', 'safe', '', '5', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"300\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '1', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('326', '84', '微信内容', 'wxcontent', 'varchar', '如为是跳转，请输入跳转的网址，点击事件就输入动作标识，标识限字母数字及下划线', 'text', '', 'safe', '', '20', 'a:4:{s:8:\"form_btn\";s:0:\"\";s:5:\"width\";s:3:\"600\";s:15:\"ext_quick_words\";s:0:\"\";s:14:\"ext_quick_type\";s:0:\"\";}', '0', '0', '');
INSERT INTO `qinggan_module_fields` VALUES ('325', '84', '菜单类型', 'wxtype', 'varchar', '', 'select', '', 'safe', '', '10', 'a:5:{s:11:\"option_list\";s:6:\"opt:14\";s:11:\"is_multiple\";s:1:\"0\";s:5:\"width\";s:0:\"\";s:10:\"ext_select\";s:0:\"\";s:9:\"empty_val\";s:12:\"请选择…\";}', '0', '0', '');

-- ----------------------------
-- Table structure for qinggan_opt
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_opt`;
CREATE TABLE `qinggan_opt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '组ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `val` varchar(255) NOT NULL COMMENT '值',
  `taxis` int(10) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='表单列表选项';

-- ----------------------------
-- Records of qinggan_opt
-- ----------------------------
INSERT INTO `qinggan_opt` VALUES ('1', '1', '0', '女', '', '20');
INSERT INTO `qinggan_opt` VALUES ('2', '1', '0', '男', '1', '10');
INSERT INTO `qinggan_opt` VALUES ('5', '2', '0', '福建省', '福建省', '255');
INSERT INTO `qinggan_opt` VALUES ('6', '2', '5', '泉州市', '泉州市', '255');
INSERT INTO `qinggan_opt` VALUES ('7', '2', '6', '永春县', '永春县', '255');
INSERT INTO `qinggan_opt` VALUES ('8', '2', '7', '一都镇', '一都镇', '255');
INSERT INTO `qinggan_opt` VALUES ('9', '2', '8', '美岭村', '美岭村', '255');
INSERT INTO `qinggan_opt` VALUES ('11', '2', '0', '广东省', '广东省', '255');
INSERT INTO `qinggan_opt` VALUES ('12', '2', '11', '深圳市', '深圳市', '255');
INSERT INTO `qinggan_opt` VALUES ('13', '2', '12', '龙岗区', '龙岗区', '10');
INSERT INTO `qinggan_opt` VALUES ('14', '2', '12', '罗湖区', '罗湖区', '20');
INSERT INTO `qinggan_opt` VALUES ('15', '2', '12', '福田区', '福田区', '30');
INSERT INTO `qinggan_opt` VALUES ('16', '2', '12', '龙华区', '龙华区', '40');
INSERT INTO `qinggan_opt` VALUES ('17', '4', '0', '是', '1', '10');
INSERT INTO `qinggan_opt` VALUES ('18', '4', '0', '否', '', '20');
INSERT INTO `qinggan_opt` VALUES ('21', '6', '0', '当前窗口', '_self', '10');
INSERT INTO `qinggan_opt` VALUES ('22', '6', '0', '新窗口', '_blank', '20');
INSERT INTO `qinggan_opt` VALUES ('23', '7', '0', '启用', '1', '10');
INSERT INTO `qinggan_opt` VALUES ('24', '7', '0', '禁用', '', '20');
INSERT INTO `qinggan_opt` VALUES ('25', '8', '0', 'UTF-8', 'utf8', '20');
INSERT INTO `qinggan_opt` VALUES ('26', '8', '0', 'GBK', 'gbk', '10');
INSERT INTO `qinggan_opt` VALUES ('62', '12', '0', '不置顶', '', '10');
INSERT INTO `qinggan_opt` VALUES ('63', '12', '0', '一级置顶', '1', '20');
INSERT INTO `qinggan_opt` VALUES ('64', '12', '0', '二级置顶', '2', '30');
INSERT INTO `qinggan_opt` VALUES ('65', '13', '0', '三分钟', '180', '10');
INSERT INTO `qinggan_opt` VALUES ('66', '14', '0', '点击推事件', 'click', '10');
INSERT INTO `qinggan_opt` VALUES ('67', '14', '0', '跳转链接', 'view', '20');

-- ----------------------------
-- Table structure for qinggan_opt_group
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_opt_group`;
CREATE TABLE `qinggan_opt_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID ',
  `title` varchar(100) NOT NULL COMMENT '名称，用于后台管理',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='可选菜单管理器';

-- ----------------------------
-- Records of qinggan_opt_group
-- ----------------------------
INSERT INTO `qinggan_opt_group` VALUES ('1', '性别');
INSERT INTO `qinggan_opt_group` VALUES ('2', '省市县多级联动');
INSERT INTO `qinggan_opt_group` VALUES ('4', '是与否');
INSERT INTO `qinggan_opt_group` VALUES ('6', '窗口打开方式');
INSERT INTO `qinggan_opt_group` VALUES ('7', '注册');
INSERT INTO `qinggan_opt_group` VALUES ('8', '邮件编码');
INSERT INTO `qinggan_opt_group` VALUES ('12', '置顶属性');
INSERT INTO `qinggan_opt_group` VALUES ('13', '等候时间');
INSERT INTO `qinggan_opt_group` VALUES ('14', '微信菜单类型');

-- ----------------------------
-- Table structure for qinggan_order
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_order`;
CREATE TABLE `qinggan_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `sn` varchar(255) NOT NULL COMMENT '订单编号，唯一值',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示游客',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '金额',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '货币类型',
  `currency_rate` decimal(13,8) unsigned NOT NULL DEFAULT '1.00000000' COMMENT '货币汇率',
  `status` varchar(255) NOT NULL COMMENT '订单的最后状态',
  `status_title` varchar(255) NOT NULL COMMENT '订单状态说明',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `passwd` varchar(255) NOT NULL COMMENT '密码串',
  `ext` text NOT NULL COMMENT '扩展内容信息，可用于存储一些扩展信息',
  `note` text NOT NULL COMMENT '摘要',
  `email` varchar(255) NOT NULL COMMENT '邮箱，用于接收通知',
  `mobile` varchar(50) NOT NULL COMMENT '手机号，用于短信发送',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ordersn` (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='订单中心';

-- ----------------------------
-- Records of qinggan_order
-- ----------------------------
INSERT INTO `qinggan_order` VALUES ('13', 'P2016091173U00023003', '23', '1473581424', '8.0000', '1', '6.16989994', 'end', '订单完成', '1480395300', '2564ff8f777cef5fb3fce8f47c442ceb', '', 'fasdfasdfsadf', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('19', 'KF20161013193521BSJ', '24', '1476354952', '2000.0000', '1', '6.16989994', 'shipping', '', '0', 'e117ef9e86f571ff3a9654d4904ce20f', '', '', 'admin@phpok.com', '15818533972');
INSERT INTO `qinggan_order` VALUES ('20', 'KF20161013194849ELH', '25', '1476355746', '999.0000', '1', '6.16989994', 'unpaid', '', '0', '285c4bc42d63f8ad295900a3dfc4cf1b', '', '', 'demo@demo.com', '');
INSERT INTO `qinggan_order` VALUES ('21', 'KF2016101319534OUJ', '27', '1476355996', '999.0000', '1', '6.16989994', 'paid', '', '0', '485009ee449b9a5fa961786d867d1dc1', '', '', 'suxiangkun@126.com', '');
INSERT INTO `qinggan_order` VALUES ('22', 'P2016112948U00023001', '23', '1480394929', '48.0000', '1', '6.16989994', 'end', '订单完成', '1480395292', '4e15e6491ca0884fde23722648908449', '', '测蔗用的', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('23', 'P2016112919U00023002', '23', '1480395663', '3.0000', '1', '6.16989994', 'end', '订单完成', '1480397929', 'd67ce8c1fb727c81af9f6645c215f1c5', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('24', 'P2016112970U00023003', '23', '1480397971', '2.0000', '1', '6.16989994', 'paid', '付款完成', '0', '28573bb9f9e8e01b3e3dbcf9e8e6a448', 'a:3:{s:12:\"保单姓名\";s:9:\"苏相锟\";s:15:\"保单有效期\";s:8:\"12个月\";s:12:\"身份证号\";s:9:\"123456789\";}', '', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('25', 'P2016120132U00023001', '23', '1480589339', '4088.0000', '1', '1.00000000', 'create', '', '0', 'd334ece569c6d73091213ff2f6112ce1', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('26', 'P2016120136U00023002', '23', '1480589452', '3288.0000', '1', '1.00000000', 'create', '', '0', 'f15715ebb8c698b6772e709ab5f6c2aa', '', 'fasdfasdf', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('27', 'P2016120159U00023003', '23', '1480589524', '3288.0000', '1', '1.00000000', 'create', '', '0', '382311e82c9f7c761eec1578abf55f51', 'a:2:{s:8:\"fullname\";s:5:\"fasdf\";s:6:\"idcard\";s:7:\"fasdfsd\";}', 'fasdfasdf', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('28', 'P2016120160U00023004', '23', '1480589663', '3288.0000', '1', '1.00000000', 'create', '', '0', 'c8f5f8f0c8ed7c5d6fb15570fc7c2d69', 'a:2:{s:15:\"投保人姓名\";s:9:\"苏相锟\";s:18:\"投保人身份证\";s:19:\"3505251983XXXX05XXX\";}', 'dfasdfasd', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('29', 'P2016120181U00023005', '23', '1480590448', '3288.0000', '1', '1.00000000', 'create', '', '0', 'b3bc02bfee2f30355d1e5376678fbcd8', 'a:2:{s:15:\"投保人姓名\";s:5:\"fasdf\";s:18:\"投保人身份证\";s:8:\"fasdfasd\";}', '', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('30', 'P2016120721U00023001', '23', '1481082923', '3287.0000', '1', '1.00000000', 'create', '', '0', 'ee990818d86057886c54d0c8908f53d4', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('31', 'P2017010666G001', '0', '1483673968', '0.0000', '1', '1.00000000', 'create', '', '0', '5ee860cf07307ec257bee5eaf17f2255', '', '', 'admin@phpok.com', '');
INSERT INTO `qinggan_order` VALUES ('32', 'P2017010660G002', '0', '1483676999', '0.0000', '1', '1.00000000', 'create', '', '0', '3e29208f0376f5d75524db3ce1b0c45f', '', '', 'admin@phpok.com', '');
INSERT INTO `qinggan_order` VALUES ('33', 'P2017010631G003', '0', '1483677587', '4088.0000', '1', '1.00000000', 'create', '', '0', 'a6538051d54d573d62d04067992a8a02', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('34', 'P2017010610U00023004', '23', '1483677638', '3288.0000', '1', '1.00000000', 'unpaid', '等待付款', '0', '83eedf1df5a6276c55c9166e4d097d0a', '', '', 'admin@phpok.com', '15818533971');
INSERT INTO `qinggan_order` VALUES ('35', 'P2017012041U00029001', '29', '1484897086', '4088.0000', '1', '1.00000000', 'unpaid', '等待付款', '0', '6059f590f531624ca5d716dc69d0109b', '', '', 'admin@phpok.com', '15818533971');

-- ----------------------------
-- Table structure for qinggan_order_address
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_order_address`;
CREATE TABLE `qinggan_order_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `country` varchar(255) NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(255) NOT NULL COMMENT '省信息',
  `city` varchar(255) NOT NULL COMMENT '市',
  `county` varchar(255) NOT NULL COMMENT '县',
  `address` varchar(255) NOT NULL COMMENT '地址信息（不含国家，省市县镇区信息）',
  `mobile` varchar(100) NOT NULL COMMENT '手机号码',
  `tel` varchar(100) NOT NULL COMMENT '电话号码',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `fullname` varchar(100) NOT NULL COMMENT '联系人姓名',
  `zipcode` varchar(50) NOT NULL COMMENT '邮编',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='订单地址库';

-- ----------------------------
-- Records of qinggan_order_address
-- ----------------------------
INSERT INTO `qinggan_order_address` VALUES ('18', '19', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `qinggan_order_address` VALUES ('19', '20', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `qinggan_order_address` VALUES ('12', '13', '中国', '广东省', '深圳市', '盐田区', '测试地址', '15818533971', '0755-1234657', 'admin@phpok.com', '测试账号', '518000');
INSERT INTO `qinggan_order_address` VALUES ('20', '21', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `qinggan_order_address` VALUES ('21', '22', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `qinggan_order_address` VALUES ('22', '23', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `qinggan_order_address` VALUES ('23', '24', '中国', '', '', '', '', '', '', '', '', '');
INSERT INTO `qinggan_order_address` VALUES ('24', '31', '中国', '浙江省', '绍兴市', '嵊州市', 'asdf', '15818533971', '', 'admin@phpok.com', 'fadsfasdfaf', '');
INSERT INTO `qinggan_order_address` VALUES ('25', '32', '中国', '河北省', '秦皇岛市', '青龙满族自治县', 'fasdf', '15818533971', '', 'admin@phpok.com', 'fdasfas', '');

-- ----------------------------
-- Table structure for qinggan_order_express
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_order_express`;
CREATE TABLE `qinggan_order_express` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID号',
  `express_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流ID号',
  `code` varchar(255) NOT NULL COMMENT '物流查询编码，可用于查询快递进度',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登记时间',
  `last_query_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次检索时间',
  `title` varchar(255) NOT NULL COMMENT '快递名称',
  `homepage` varchar(255) NOT NULL COMMENT '快递官网',
  `company` varchar(255) NOT NULL COMMENT '快递的公司全称',
  `is_end` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未结束1已结束',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单中涉及到的物流分配';

-- ----------------------------
-- Records of qinggan_order_express
-- ----------------------------
INSERT INTO `qinggan_order_express` VALUES ('4', '19', '4', '035652070464', '1476361318', '1476438520', '顺丰速运', 'http://www.sf-express.com/', '顺丰速运(集团)有限公司', '1');

-- ----------------------------
-- Table structure for qinggan_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_order_invoice`;
CREATE TABLE `qinggan_order_invoice` (
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID号',
  `type` varchar(100) NOT NULL COMMENT '发票类型',
  `title` varchar(255) NOT NULL COMMENT '发票抬头',
  `content` text NOT NULL COMMENT '发票内容',
  `note` text NOT NULL COMMENT '发票的备注信息',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单发票';

-- ----------------------------
-- Records of qinggan_order_invoice
-- ----------------------------
INSERT INTO `qinggan_order_invoice` VALUES ('31', '', '', '', '');
INSERT INTO `qinggan_order_invoice` VALUES ('32', '', '', '', '');

-- ----------------------------
-- Table structure for qinggan_order_log
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_order_log`;
CREATE TABLE `qinggan_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_express_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '定单中的物流ID',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `who` varchar(255) NOT NULL COMMENT '操作人名称（可以是公司名称，也可以是用户名，可以是物流等）',
  `note` text NOT NULL COMMENT '操作内容',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='订单日志，用于了解当前的订单处理进度';

-- ----------------------------
-- Records of qinggan_order_log
-- ----------------------------
INSERT INTO `qinggan_order_log` VALUES ('114', '19', '4', '1476372011', '顺丰速运', '快件到达 【深圳集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('32', '13', '0', '1473581424', 'admin', '订单创建成功，订单编号：P2016091173U00023003');
INSERT INTO `qinggan_order_log` VALUES ('33', '13', '0', '1473581424', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('113', '19', '4', '1476376873', '顺丰速运', '快件在【深圳集散中心】已装车，准备发往 【深圳黄田集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('45', '13', '0', '1476352896', '管理员：admin', '订单（P2016091173U00023003）状态变更为：订单完成');
INSERT INTO `qinggan_order_log` VALUES ('46', '13', '0', '1476352904', '管理员：admin', '订单（P2016091173U00023003）状态变更为：订单完成');
INSERT INTO `qinggan_order_log` VALUES ('47', '13', '0', '1476352977', '管理员：admin', '订单（P2016091173U00023003）状态变更为：订单完成');
INSERT INTO `qinggan_order_log` VALUES ('110', '19', '4', '1476385028', '顺丰速运', '快件到达 【深圳五和集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('63', '19', '0', '1476354952', '苏相锟(admin)', '管理员增加产品信息');
INSERT INTO `qinggan_order_log` VALUES ('64', '19', '0', '1476354952', '苏相锟(admin)', '管理员创建订单');
INSERT INTO `qinggan_order_log` VALUES ('65', '20', '0', '1476355746', '苏相锟(admin)', '管理员创建订单');
INSERT INTO `qinggan_order_log` VALUES ('66', '21', '0', '1476355996', '苏相锟(admin)', '管理员创建订单');
INSERT INTO `qinggan_order_log` VALUES ('67', '21', '0', '1476357578', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('68', '21', '0', '1476359734', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：付款完成');
INSERT INTO `qinggan_order_log` VALUES ('112', '19', '4', '1476378019', '顺丰速运', '快件到达 【深圳黄田集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('70', '19', '0', '1476360719', '管理员：admin', '订单（KF20161013193521BSJ）状态变更为：');
INSERT INTO `qinggan_order_log` VALUES ('109', '19', '4', '1476387532', '顺丰速运', '快件在【深圳五和集散中心】已装车，准备发往 【深圳宝安深圳北站营业部】');
INSERT INTO `qinggan_order_log` VALUES ('108', '19', '4', '1476388813', '顺丰速运', '快件到达 【深圳宝安深圳北站营业部】');
INSERT INTO `qinggan_order_log` VALUES ('99', '19', '0', '1476361318', '管理员：admin', '订单（KF20161013193521BSJ）状态变更为：正在发货');
INSERT INTO `qinggan_order_log` VALUES ('91', '19', '0', '1476361183', '管理员：admin', '订单（KF20161013193521BSJ）状态变更为：');
INSERT INTO `qinggan_order_log` VALUES ('78', '19', '0', '1476360802', '管理员：admin', '订单（KF20161013193521BSJ）状态变更为：');
INSERT INTO `qinggan_order_log` VALUES ('119', '19', '4', '1476333811', '顺丰速运', '快件在【泉州丰泽普明工业区营业点】已装车，准备发往 【泉州清濛集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('118', '19', '4', '1476335404', '顺丰速运', '快件到达 【泉州清濛集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('117', '19', '4', '1476343465', '顺丰速运', '快件在【泉州清濛集散中心】已装车，准备发往 【晋江总集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('116', '19', '4', '1476346107', '顺丰速运', '快件到达 【晋江总集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('115', '19', '4', '1476347623', '顺丰速运', '快件在【晋江总集散中心】已装车，准备发往 【深圳集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('106', '19', '4', '1476408099', '顺丰速运', '已签收,感谢使用顺丰,期待再次为您服务');
INSERT INTO `qinggan_order_log` VALUES ('111', '19', '4', '1476381561', '顺丰速运', '快件在【深圳黄田集散中心】已装车，准备发往 【深圳五和集散中心】');
INSERT INTO `qinggan_order_log` VALUES ('107', '19', '4', '1476398800', '顺丰速运', '正在派送途中(派件人:罗浪平,电话:18307559705)');
INSERT INTO `qinggan_order_log` VALUES ('98', '19', '4', '1476361318', '苏相锟(admin)', '您的订单已经拣货完毕，待出库交付顺丰速运，运单号为：035652070464');
INSERT INTO `qinggan_order_log` VALUES ('120', '19', '4', '1476331847', '顺丰速运', '顺丰速运 已收取快件');
INSERT INTO `qinggan_order_log` VALUES ('121', '21', '0', '1476519512', '苏相锟(admin)', '录入支付信息，支付方式：支付宝快捷支付，支付金额：100.00元');
INSERT INTO `qinggan_order_log` VALUES ('122', '21', '0', '1476519841', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：创建订单');
INSERT INTO `qinggan_order_log` VALUES ('123', '21', '0', '1476520676', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('124', '21', '0', '1476520676', '苏相锟(admin)', '录入支付信息，支付方式：银联支付，支付金额：200.00元');
INSERT INTO `qinggan_order_log` VALUES ('125', '21', '0', '1476520777', '苏相锟(admin)', '录入支付信息，支付方式：微信支付，支付金额：135.00元');
INSERT INTO `qinggan_order_log` VALUES ('126', '21', '0', '1476520828', '苏相锟(admin)', '录入支付信息，支付方式：支付宝快捷支付，支付金额：465.00元');
INSERT INTO `qinggan_order_log` VALUES ('127', '21', '0', '1476521010', '管理员：admin', '订单（KF2016101319534OUJ）状态变更为：付款完成');
INSERT INTO `qinggan_order_log` VALUES ('128', '21', '0', '1476521010', '苏相锟(admin)', '录入支付信息，支付方式：银行汇款，支付金额：99.00元');
INSERT INTO `qinggan_order_log` VALUES ('129', '21', '0', '1476521773', '苏相锟(admin)', '录入支付信息，支付方式：银行汇款，支付金额：564.00元');
INSERT INTO `qinggan_order_log` VALUES ('130', '20', '0', '1476521841', '管理员：admin', '订单（KF20161013194849ELH）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('131', '20', '0', '1476521841', '苏相锟(admin)', '录入支付信息，支付方式：测试，支付金额：100.00元');
INSERT INTO `qinggan_order_log` VALUES ('132', '13', '0', '1477989527', 'admin', '订单P2016091173U00023003支付42.84元，支付方法：积分');
INSERT INTO `qinggan_order_log` VALUES ('133', '13', '0', '1477989527', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('134', '0', '0', '1477989651', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('135', '0', '0', '1477989709', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('136', '0', '0', '1477989759', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('137', '13', '0', '1477989784', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('138', '13', '0', '1480247220', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('139', '13', '0', '1480247285', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('140', '13', '0', '1480247418', 'admin', '订单（P2016091173U00023003）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('141', '13', '0', '1480247421', 'admin', '支付完成');
INSERT INTO `qinggan_order_log` VALUES ('142', '22', '0', '1480394929', 'admin', '订单创建成功，订单编号：P2016112948U00023001');
INSERT INTO `qinggan_order_log` VALUES ('143', '0', '0', '1480395033', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('144', '22', '0', '1480395165', 'admin', '订单（P2016112948U00023001）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('145', '22', '0', '1480395168', 'admin', '支付完成');
INSERT INTO `qinggan_order_log` VALUES ('146', '22', '0', '1480395292', '管理员：admin', '订单（P2016112948U00023001）状态变更为：订单完成');
INSERT INTO `qinggan_order_log` VALUES ('147', '13', '0', '1480395300', '管理员：admin', '订单（P2016091173U00023003）状态变更为：订单完成');
INSERT INTO `qinggan_order_log` VALUES ('148', '23', '0', '1480395663', 'admin', '订单创建成功，订单编号：P2016112919U00023002');
INSERT INTO `qinggan_order_log` VALUES ('149', '23', '0', '1480395663', 'admin', '订单P2016112919U00023002使用积分抵扣0.00元，共消耗积分100');
INSERT INTO `qinggan_order_log` VALUES ('150', '23', '0', '1480395980', 'admin', '订单P2016112919U00023002使用积分抵扣0.00元，共消耗积分100');
INSERT INTO `qinggan_order_log` VALUES ('151', '23', '0', '1480396030', 'admin', '订单P2016112919U00023002使用积分抵扣0.00元，共消耗积分100');
INSERT INTO `qinggan_order_log` VALUES ('152', '23', '0', '1480396339', 'admin', '订单P2016112919U00023002使用红包抵扣0.00元，共消耗红包100个');
INSERT INTO `qinggan_order_log` VALUES ('153', '23', '0', '1480396550', 'admin', '订单P2016112919U00023002使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `qinggan_order_log` VALUES ('154', '23', '0', '1480396676', 'admin', '订单P2016112919U00023002使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `qinggan_order_log` VALUES ('155', '23', '0', '1480396741', 'admin', '订单P2016112919U00023002使用红包抵扣1.00元，共消耗红包100个');
INSERT INTO `qinggan_order_log` VALUES ('156', '23', '0', '1480396832', 'admin', '订单P2016112919U00023002使用红包抵扣1.00元，共消耗红包100个');
INSERT INTO `qinggan_order_log` VALUES ('157', '23', '0', '1480396889', 'admin', '订单P2016112919U00023002使用红包抵扣1.00元，共消耗红包100个');
INSERT INTO `qinggan_order_log` VALUES ('158', '23', '0', '1480396966', 'admin', '订单P2016112919U00023002使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `qinggan_order_log` VALUES ('159', '23', '0', '1480397059', 'admin', '订单P2016112919U00023002使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `qinggan_order_log` VALUES ('160', '0', '0', '1480397159', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('161', '0', '0', '1480397769', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('162', '23', '0', '1480397786', 'admin', '使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `qinggan_order_log` VALUES ('163', '23', '0', '1480397786', 'admin', '订单（P2016112919U00023002）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('164', '23', '0', '1480397788', 'admin', '支付完成');
INSERT INTO `qinggan_order_log` VALUES ('165', '23', '0', '1480397929', '管理员：admin', '订单（P2016112919U00023002）状态变更为：订单完成');
INSERT INTO `qinggan_order_log` VALUES ('166', '24', '0', '1480397971', 'admin', '订单创建成功，订单编号：P2016112970U00023003');
INSERT INTO `qinggan_order_log` VALUES ('167', '24', '0', '1480397971', 'admin', '使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `qinggan_order_log` VALUES ('168', '0', '0', '1480398000', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('169', '0', '0', '1480398026', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('170', '24', '0', '1480398062', 'admin', '使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `qinggan_order_log` VALUES ('171', '24', '0', '1480398062', 'admin', '订单（P2016112970U00023003）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('172', '24', '0', '1480398064', 'admin', '支付完成');
INSERT INTO `qinggan_order_log` VALUES ('173', '0', '0', '1480502104', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('174', '0', '0', '1480502222', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('175', '0', '0', '1480502304', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('176', '0', '0', '1480502326', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('177', '0', '0', '1480502347', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('178', '0', '0', '1480502387', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('179', '0', '0', '1480502430', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('180', '0', '0', '1480502444', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('181', '0', '0', '1480502486', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('182', '0', '0', '1480502669', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('183', '0', '0', '1480502791', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('184', '0', '0', '1480502802', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('185', '0', '0', '1480502863', '苏相锟(admin)', '管理员编辑订单');
INSERT INTO `qinggan_order_log` VALUES ('186', '25', '0', '1480589339', 'admin', '订单创建成功，订单编号：P2016120132U00023001');
INSERT INTO `qinggan_order_log` VALUES ('187', '26', '0', '1480589452', 'admin', '订单创建成功，订单编号：P2016120136U00023002');
INSERT INTO `qinggan_order_log` VALUES ('188', '27', '0', '1480589524', 'admin', '订单创建成功，订单编号：P2016120159U00023003');
INSERT INTO `qinggan_order_log` VALUES ('189', '28', '0', '1480589663', 'admin', '订单创建成功，订单编号：P2016120160U00023004');
INSERT INTO `qinggan_order_log` VALUES ('190', '29', '0', '1480590448', 'admin', '订单创建成功，订单编号：P2016120181U00023005');
INSERT INTO `qinggan_order_log` VALUES ('191', '30', '0', '1481082923', 'admin', '订单创建成功，订单编号：P2016120721U00023001');
INSERT INTO `qinggan_order_log` VALUES ('192', '30', '0', '1481082923', 'admin', '使用积分抵扣1.00元，共消耗积分100点');
INSERT INTO `qinggan_order_log` VALUES ('193', '31', '0', '1483673968', '', '订单创建成功，订单编号：P2017010666G001');
INSERT INTO `qinggan_order_log` VALUES ('194', '32', '0', '1483676999', '', '订单创建成功，订单编号：P2017010660G002');
INSERT INTO `qinggan_order_log` VALUES ('195', '33', '0', '1483677587', '', '订单创建成功，订单编号：P2017010631G003');
INSERT INTO `qinggan_order_log` VALUES ('196', '34', '0', '1483677638', 'admin', '订单创建成功，订单编号：P2017010610U00023004');
INSERT INTO `qinggan_order_log` VALUES ('197', '34', '0', '1483677760', 'admin', '订单（P2017010610U00023004）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('198', '34', '0', '1483677767', 'admin', '订单（P2017010610U00023004）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('199', '35', '0', '1484897086', 'WX148480971245', '订单创建成功，订单编号：P2017012041U00029001');
INSERT INTO `qinggan_order_log` VALUES ('200', '35', '0', '1484900171', '游客', '订单（P2017012041U00029001）状态变更为：等待付款');
INSERT INTO `qinggan_order_log` VALUES ('201', '35', '0', '1484900186', '游客', '订单（P2017012041U00029001）状态变更为：等待付款');

-- ----------------------------
-- Table structure for qinggan_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_order_payment`;
CREATE TABLE `qinggan_order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `payment_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '支付方式ID，数字表示网上业务支付，字母为财富支付',
  `title` varchar(255) NOT NULL COMMENT '支付方式名称',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '支付金额',
  `startdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始支付操作',
  `dateline` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `ext` text NOT NULL COMMENT '其他常用扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='订单支付';

-- ----------------------------
-- Records of qinggan_order_payment
-- ----------------------------
INSERT INTO `qinggan_order_payment` VALUES ('17', '13', '13', '银行汇款', '3708.0000', '1473581424', '0', '');
INSERT INTO `qinggan_order_payment` VALUES ('19', '21', '1', '支付宝快捷支付', '100.0000', '1476519512', '1476519512', 'a:1:{s:6:\"备注\";s:18:\"本地测试录入\";}');
INSERT INTO `qinggan_order_payment` VALUES ('20', '21', '3', '银联支付', '200.0000', '1476520676', '1476520676', 'a:1:{s:6:\"备注\";s:15:\"也是测试的\";}');
INSERT INTO `qinggan_order_payment` VALUES ('21', '21', '4', '微信支付', '135.0000', '1476520777', '1476520777', 'a:1:{s:6:\"备注\";s:12:\"测试刷新\";}');
INSERT INTO `qinggan_order_payment` VALUES ('24', '21', '13', '银行汇款', '564.0000', '1476521773', '1476521773', '');
INSERT INTO `qinggan_order_payment` VALUES ('25', '20', '', '测试', '100.0000', '1476521841', '1476521841', '');
INSERT INTO `qinggan_order_payment` VALUES ('27', '13', '14', 'Paypal支付', '8.0000', '1477989784', '0', '');
INSERT INTO `qinggan_order_payment` VALUES ('28', '13', '2', '', '8.0000', '1480247285', '0', '');
INSERT INTO `qinggan_order_payment` VALUES ('29', '13', 'wallet', '钱包', '8.0000', '1480247418', '1480247421', 'a:1:{s:8:\"integral\";d:8;}');
INSERT INTO `qinggan_order_payment` VALUES ('30', '22', 'wallet', '钱包', '48.0000', '1480395165', '1480395168', 'a:1:{s:6:\"钱包\";d:48;}');
INSERT INTO `qinggan_order_payment` VALUES ('31', '23', 'wallet', '钱包', '4.0000', '1480397786', '1480397788', 'a:1:{s:6:\"钱包\";d:4;}');
INSERT INTO `qinggan_order_payment` VALUES ('32', '24', 'wallet', '钱包', '2.0000', '1480398062', '1480398064', 'a:1:{s:6:\"钱包\";d:2;}');
INSERT INTO `qinggan_order_payment` VALUES ('33', '34', '16', '支付宝', '3288.0000', '1483677767', '0', '');
INSERT INTO `qinggan_order_payment` VALUES ('34', '35', '17', '微信支付', '4088.0000', '1484900186', '0', '');

-- ----------------------------
-- Table structure for qinggan_order_price
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_order_price`;
CREATE TABLE `qinggan_order_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID号',
  `code` varchar(255) NOT NULL COMMENT '编码',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '金额，-号表示优惠',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COMMENT='订单金额明细清单';

-- ----------------------------
-- Records of qinggan_order_price
-- ----------------------------
INSERT INTO `qinggan_order_price` VALUES ('19', '1', 'discount', '169.0000');
INSERT INTO `qinggan_order_price` VALUES ('18', '1', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('17', '1', 'product', '170.0000');
INSERT INTO `qinggan_order_price` VALUES ('4', '2', 'product', '177.0000');
INSERT INTO `qinggan_order_price` VALUES ('5', '2', 'shipping', '26.0000');
INSERT INTO `qinggan_order_price` VALUES ('6', '2', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('7', '2', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('20', '3', 'product', '177.0000');
INSERT INTO `qinggan_order_price` VALUES ('21', '3', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('22', '3', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('23', '3', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('24', '4', 'product', '100.0000');
INSERT INTO `qinggan_order_price` VALUES ('25', '4', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('26', '4', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('27', '4', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('43', '5', 'discount', '1000.0000');
INSERT INTO `qinggan_order_price` VALUES ('42', '5', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('41', '5', 'product', '1499.0000');
INSERT INTO `qinggan_order_price` VALUES ('44', '6', 'product', '12374.0000');
INSERT INTO `qinggan_order_price` VALUES ('45', '6', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('46', '6', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('47', '6', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('48', '7', 'product', '532.9100');
INSERT INTO `qinggan_order_price` VALUES ('49', '7', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('50', '7', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('51', '7', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('52', '8', 'product', '413.1300');
INSERT INTO `qinggan_order_price` VALUES ('53', '8', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('54', '8', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('55', '8', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('65', '9', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('64', '9', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('63', '9', 'product', '1099.0000');
INSERT INTO `qinggan_order_price` VALUES ('84', '10', 'discount', '-100.0000');
INSERT INTO `qinggan_order_price` VALUES ('83', '10', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('82', '10', 'product', '5184.0000');
INSERT INTO `qinggan_order_price` VALUES ('85', '11', 'product', '4998.0000');
INSERT INTO `qinggan_order_price` VALUES ('86', '11', 'shipping', '10.0000');
INSERT INTO `qinggan_order_price` VALUES ('87', '11', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('133', '13', 'discount', '-3700.0000');
INSERT INTO `qinggan_order_price` VALUES ('132', '13', 'shipping', '10.0000');
INSERT INTO `qinggan_order_price` VALUES ('131', '13', 'product', '3698.0000');
INSERT INTO `qinggan_order_price` VALUES ('92', '14', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('93', '14', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('94', '14', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('95', '15', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('96', '15', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('97', '15', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('98', '16', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('99', '16', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('100', '16', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('101', '17', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('102', '17', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('103', '17', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('104', '18', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('105', '18', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('106', '18', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('107', '19', 'product', '2000.0000');
INSERT INTO `qinggan_order_price` VALUES ('108', '19', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('109', '19', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('110', '20', 'product', '999.0000');
INSERT INTO `qinggan_order_price` VALUES ('111', '20', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('112', '20', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('124', '21', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('123', '21', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('122', '21', 'product', '999.0000');
INSERT INTO `qinggan_order_price` VALUES ('138', '22', 'shipping', '15.0000');
INSERT INTO `qinggan_order_price` VALUES ('137', '22', 'product', '4088.0000');
INSERT INTO `qinggan_order_price` VALUES ('139', '22', 'discount', '-4055.0000');
INSERT INTO `qinggan_order_price` VALUES ('148', '23', 'discount', '-3285.0000');
INSERT INTO `qinggan_order_price` VALUES ('147', '23', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('146', '23', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('196', '24', 'discount', '-3286.0000');
INSERT INTO `qinggan_order_price` VALUES ('195', '24', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('194', '24', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('197', '25', 'product', '4088.0000');
INSERT INTO `qinggan_order_price` VALUES ('198', '25', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('199', '25', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('200', '26', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('201', '26', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('202', '26', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('203', '27', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('204', '27', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('205', '27', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('206', '28', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('207', '28', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('208', '28', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('209', '29', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('210', '29', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('211', '29', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('212', '30', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('213', '30', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('214', '30', 'discount', '-1.0000');
INSERT INTO `qinggan_order_price` VALUES ('215', '31', 'product', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('216', '31', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('217', '31', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('218', '31', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('219', '32', 'product', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('220', '32', 'shipping', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('221', '32', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('222', '32', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('223', '33', 'product', '4088.0000');
INSERT INTO `qinggan_order_price` VALUES ('224', '33', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('225', '33', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('226', '34', 'product', '3288.0000');
INSERT INTO `qinggan_order_price` VALUES ('227', '34', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('228', '34', 'discount', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('229', '35', 'product', '4088.0000');
INSERT INTO `qinggan_order_price` VALUES ('230', '35', 'fee', '0.0000');
INSERT INTO `qinggan_order_price` VALUES ('231', '35', 'discount', '0.0000');

-- ----------------------------
-- Table structure for qinggan_order_product
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_order_product`;
CREATE TABLE `qinggan_order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID号',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `title` varchar(255) NOT NULL COMMENT '产品名称',
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '产品单价',
  `qty` int(11) NOT NULL DEFAULT '0' COMMENT '产品数量',
  `thumb` varchar(255) NOT NULL COMMENT '产品图片地址',
  `ext` text NOT NULL COMMENT '产品扩展属性',
  `weight` varchar(50) NOT NULL COMMENT '重量',
  `volume` varchar(50) NOT NULL COMMENT '体积',
  `unit` varchar(50) NOT NULL COMMENT '单位',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `is_virtual` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0实物1虚拟或服务',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='订单的产品信息';

-- ----------------------------
-- Records of qinggan_order_product
-- ----------------------------
INSERT INTO `qinggan_order_product` VALUES ('22', '19', '1753', '小米(MI) 小米5 全网通4G手机 双卡双待', '2000.0000', '1', 'res/201603/22/6e32b648bf93b490.jpg', '', '', '', '', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('23', '20', '1761', '华为 P7 移动4G手机', '999.0000', '1', 'res/201603/23/c941c40778124f2c.jpg', '', '', '', '台', '', '1');
INSERT INTO `qinggan_order_product` VALUES ('24', '21', '1761', '华为 P7 移动4G手机', '999.0000', '1', 'res/201603/23/c941c40778124f2c.jpg', '', '', '', '台', '', '1');
INSERT INTO `qinggan_order_product` VALUES ('16', '13', '1762', 'vivo Xplay5 全网通4G手机 4GB+128GB 双卡双待', '3698.0000', '1', 'res/201603/23/fceefc0374ff1ef2.jpg', 'a:1:{i:0;a:2:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";}}', '', '', '', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('25', '22', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '4088.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:2:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";}i:1;a:2:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"64G ROM\";}}', '', '', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('26', '23', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:2:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";}i:1;a:2:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";}}', '', '', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('27', '24', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:2:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"黑色\";}i:1;a:2:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";}}', '', '', '台', '', '1');
INSERT INTO `qinggan_order_product` VALUES ('28', '25', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '4088.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"黑色\";s:3:\"val\";s:5:\"black\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"64G ROM\";s:3:\"val\";s:3:\"64G\";}}', '', '', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('29', '26', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '', '', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('30', '27', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '', '', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('31', '28', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '', '', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('32', '29', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '', '', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('33', '30', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '0', '0', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('34', '31', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', '', '0', '0', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('35', '31', '1761', '华为 P7 移动4G手机', '1099.0000', '1', 'res/201603/23/c941c40778124f2c.jpg', '', '0', '0', '台', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('36', '31', '1753', '小米(MI) 小米5 全网通4G手机 双卡双待', '2499.0000', '1', 'res/201603/22/6e32b648bf93b490.jpg', '', '0', '0', '', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('37', '32', '1760', '魅族 MX5 移动联通双4G手机 双卡双待', '2499.0000', '1', 'res/201603/22/c329c62e183765ad.jpg', '', '0', '0', '', '', '0');
INSERT INTO `qinggan_order_product` VALUES ('38', '33', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '4088.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";s:3:\"val\";s:4:\"gold\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"64G ROM\";s:3:\"val\";s:3:\"64G\";}}', '0', '0', '台', '', '1');
INSERT INTO `qinggan_order_product` VALUES ('39', '34', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '3288.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"金色\";s:3:\"val\";s:4:\"gold\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"16G ROM\";s:3:\"val\";s:5:\"MZ16G\";}}', '0', '0', '台', '', '1');
INSERT INTO `qinggan_order_product` VALUES ('40', '35', '1763', 'Apple iPhone 5SE 16G 移动联通电信4G手机', '4088.0000', '1', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'a:2:{i:0;a:3:{s:5:\"title\";s:6:\"颜色\";s:7:\"content\";s:6:\"白色\";s:3:\"val\";s:5:\"white\";}i:1;a:3:{s:5:\"title\";s:6:\"版本\";s:7:\"content\";s:7:\"64G ROM\";s:3:\"val\";s:3:\"64G\";}}', '0', '0', '台', '', '1');

-- ----------------------------
-- Table structure for qinggan_payment
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_payment`;
CREATE TABLE `qinggan_payment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付款组',
  `code` varchar(100) NOT NULL COMMENT '标识ID',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `currency` varchar(30) NOT NULL COMMENT '可使用的货币ID',
  `logo1` varchar(255) NOT NULL COMMENT 'LOGO小图',
  `logo2` varchar(255) NOT NULL COMMENT 'LOGO中图',
  `logo3` varchar(255) NOT NULL COMMENT 'LOGO大图',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态0未使用1正在使用中',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `note` text NOT NULL COMMENT '付款注意事项说明',
  `param` text NOT NULL COMMENT '参数',
  `wap` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0PC端1手机端',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='支付方案';

-- ----------------------------
-- Records of qinggan_payment
-- ----------------------------
INSERT INTO `qinggan_payment` VALUES ('15', '1', 'alipay', '支付宝', 'CNY', '', '', '', '1', '10', '', 'a:4:{s:3:\"pid\";s:0:\"\";s:3:\"key\";s:0:\"\";s:5:\"email\";s:15:\"admin@phpok.com\";s:5:\"ptype\";s:25:\"create_direct_pay_by_user\";}', '0');

-- ----------------------------
-- Table structure for qinggan_payment_group
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_payment_group`;
CREATE TABLE `qinggan_payment_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID，为0表示全部',
  `title` varchar(255) NOT NULL COMMENT '付款组名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不启用1启用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1默认组0普通组',
  `is_wap` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0是PC端，1是手机端',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='付款组管理';

-- ----------------------------
-- Records of qinggan_payment_group
-- ----------------------------
INSERT INTO `qinggan_payment_group` VALUES ('1', '1', '快捷支付', '1', '10', '0', '0');

-- ----------------------------
-- Table structure for qinggan_payment_log
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_payment_log`;
CREATE TABLE `qinggan_payment_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sn` varchar(255) NOT NULL COMMENT '支付编号',
  `type` varchar(100) NOT NULL COMMENT 'order订单,recharge充值other其他',
  `payment_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '支付方式，为数字时表示payment表中的主要支付方式，为字母数字混合表示财富付款',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录时间',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '货币ID',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付成功1已支付成功',
  `ext` text NOT NULL COMMENT '扩展',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='支付日志';

-- ----------------------------
-- Records of qinggan_payment_log
-- ----------------------------
INSERT INTO `qinggan_payment_log` VALUES ('1', 'P20150928001', 'order', '1', '订单：P20150928001', '1443431348', '23', '1.00', '1', '订单：P20150928001', '1', '');
INSERT INTO `qinggan_payment_log` VALUES ('2', 'P20150928002', 'order', '1', '订单：P20150928002', '1443432620', '23', '1.00', '1', '订单：P20150928002', '1', '');
INSERT INTO `qinggan_payment_log` VALUES ('3', 'P20151104001', 'order', '4', '订单：P20151104001', '1409721340', '23', '203.00', '1', '订单：P20151104001', '1', 'a:7:{s:6:\"openid\";s:28:\"oUpF8uMEb4qRXf22hE3X68TekukE\";s:10:\"trade_type\";s:5:\"JSAPI\";s:9:\"bank_type\";s:3:\"CFT\";s:9:\"total_fee\";s:1:\"1\";s:8:\"fee_type\";s:3:\"CNY\";s:14:\"transaction_id\";s:28:\"1004400740201409030005092168\";s:8:\"time_end\";s:14:\"20140903131540\";}');
INSERT INTO `qinggan_payment_log` VALUES ('4', 'KF20151030115123CWR', 'order', '4', '订单：', '1447821976', '23', '170.00', '1', '订单：', '0', '');
INSERT INTO `qinggan_payment_log` VALUES ('5', 'P2015121051U00023001', '', '4', '订单：', '1449736191', '23', '177.00', '1', '订单：', '0', '');
INSERT INTO `qinggan_payment_log` VALUES ('6', 'P2016022545U00023001', 'order', '12', '订单：', '1459287342', '23', '100.00', '1', '订单：', '0', '');
INSERT INTO `qinggan_payment_log` VALUES ('7', 'P2016033177U00023001', 'order', '13', '订单：P2016033177U00023001', '1473660928', '23', '12372.95', '1', '订单：P2016033177U00023001', '0', '');
INSERT INTO `qinggan_payment_log` VALUES ('8', 'P2016080435U00023001', 'order', '4', '订单：P2016080435U00023001', '1471335239', '23', '1088.00', '1', '订单：P2016080435U00023001', '0', '');
INSERT INTO `qinggan_payment_log` VALUES ('9', 'P2016091116U00023002', 'order', '1', '订单：P2016091116U00023002', '1473581132', '23', '3298.00', '1', '订单：P2016091116U00023002', '0', '');
INSERT INTO `qinggan_payment_log` VALUES ('12', 'P2016091173U00023003', 'order', 'wallet', '订单：P2016091173U00023003', '1480247418', '23', '8.00', '1', '订单：P2016091173U00023003', '1', 'a:1:{s:8:\"integral\";d:8;}');
INSERT INTO `qinggan_payment_log` VALUES ('13', 'P2016112948U00023001', 'order', 'wallet', '订单：P2016112948U00023001', '1480395165', '23', '48.00', '1', '订单：P2016112948U00023001', '1', 'a:1:{s:6:\"钱包\";d:48;}');
INSERT INTO `qinggan_payment_log` VALUES ('14', 'P2016112919U00023002', 'order', 'wallet', '订单：P2016112919U00023002', '1480397786', '23', '4.00', '1', '订单：P2016112919U00023002', '1', 'a:1:{s:6:\"钱包\";d:4;}');
INSERT INTO `qinggan_payment_log` VALUES ('15', 'P2016112970U00023003', 'order', 'wallet', '订单：P2016112970U00023003', '1480398062', '23', '2.00', '1', '订单：P2016112970U00023003', '1', 'a:1:{s:6:\"钱包\";d:2;}');
INSERT INTO `qinggan_payment_log` VALUES ('16', 'CZ583d1b9f4bb6e', 'recharge', '1', '在线充值', '1480399775', '23', '1.00', '1', '充值编号：CZ583d1b9f4bb6e', '0', 'a:1:{s:4:\"goal\";s:1:\"2\";}');
INSERT INTO `qinggan_payment_log` VALUES ('17', 'P2017010610U00023004', 'order', '16', '订单：P2017010610U00023004', '1483677767', '23', '3288.00', '1', '订单：P2017010610U00023004', '0', '');
INSERT INTO `qinggan_payment_log` VALUES ('18', 'P2017012041U00029001', 'order', '17', '订单：P2017012041U00029001', '1484900186', '29', '4088.00', '1', '订单：P2017012041U00029001', '0', '');

-- ----------------------------
-- Table structure for qinggan_phpok
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_phpok`;
CREATE TABLE `qinggan_phpok` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `type_id` varchar(255) NOT NULL COMMENT '调用类型',
  `identifier` varchar(100) NOT NULL COMMENT '标识串，同一个站点中只能唯一',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `cateid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `ext` text NOT NULL COMMENT '扩展属性',
  `is_api` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不支持API调用，1支持',
  `sqlinfo` text NOT NULL COMMENT 'SQL语句',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`,`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COMMENT='数据调用中心';

-- ----------------------------
-- Records of qinggan_phpok
-- ----------------------------
INSERT INTO `qinggan_phpok` VALUES ('18', '网站首页图片播放', '41', 'arclist', 'picplayer', '1', '1', '0', 'a:23:{s:5:\"psize\";s:1:\"5\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";s:1:\"1\";s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('19', '头部导航内容', '42', 'arclist', 'menu', '1', '1', '0', 'a:23:{s:5:\"psize\";s:2:\"80\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";s:1:\"1\";s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";s:1:\"1\";s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('20', '公司简介', '87', 'arc', 'aboutus', '1', '1', '0', 'a:13:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";i:0;s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:7:\"aboutus\";}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('21', '产品分类', '45', 'catelist', 'products_cate', '1', '1', '70', 'a:20:{s:5:\"psize\";b:0;s:6:\"offset\";b:0;s:7:\"is_list\";b:0;s:7:\"in_text\";b:0;s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";b:0;s:12:\"catelist_ext\";b:0;s:11:\"project_ext\";b:0;s:11:\"sublist_ext\";b:0;s:10:\"parent_ext\";b:0;s:13:\"fields_format\";b:0;s:8:\"user_ext\";b:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";b:0;s:6:\"in_sub\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('22', '最新产品', '45', 'arclist', 'new_products', '1', '1', '70', 'a:15:{s:5:\"psize\";s:1:\"8\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:6:\"fields\";s:21:\"thumb,m_title,content\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:8:\"user_ext\";i:0;s:9:\"usergroup\";i:0;s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('55', '友情链接', '142', 'arclist', 'link', '1', '1', '0', 'a:23:{s:5:\"psize\";s:2:\"30\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";s:1:\"1\";s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";s:1:\"2\";s:7:\"in_cate\";b:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('91', '新闻中心', '43', 'arclist', 'news', '1', '1', '7', 'a:23:{s:5:\"psize\";s:1:\"8\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";s:1:\"2\";s:7:\"in_cate\";b:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('92', '图集相册', '144', 'arclist', 'photo', '1', '1', '0', 'a:23:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";s:1:\"1\";s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('93', '图片滚动新闻', '43', 'arclist', 'picnews', '1', '1', '7', 'a:23:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('94', '页脚导航', '147', 'arclist', 'footnav', '1', '1', '0', 'a:23:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";s:1:\"1\";s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('95', '客服', '148', 'arclist', 'kefu', '1', '1', '0', 'a:13:{s:5:\"psize\";s:2:\"50\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('96', '售后保障', '150', 'project', 'after-sale-protection', '1', '1', '0', 'a:23:{s:5:\"psize\";b:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";s:1:\"1\";s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('97', '图集相册', '144', 'arclist', 'tujixiangce', '1', '1', '154', 'a:13:{s:5:\"psize\";s:1:\"6\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('98', '产品展示', '45', 'catelist', 'catelist', '1', '1', '70', 'a:23:{s:5:\"psize\";b:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:7:\"in_text\";i:0;s:4:\"attr\";b:0;s:11:\"fields_need\";b:0;s:3:\"tag\";b:0;s:8:\"keywords\";b:0;s:7:\"orderby\";b:0;s:4:\"cate\";b:0;s:8:\"cate_ext\";i:0;s:12:\"catelist_ext\";i:0;s:11:\"project_ext\";i:0;s:11:\"sublist_ext\";i:0;s:10:\"parent_ext\";i:0;s:13:\"fields_format\";i:0;s:8:\"user_ext\";i:0;s:4:\"user\";b:0;s:12:\"userlist_ext\";i:0;s:6:\"in_sub\";i:0;s:10:\"in_project\";i:0;s:7:\"in_cate\";i:0;s:8:\"title_id\";b:0;}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('99', '下载中心', '151', 'arclist', 'xiazaizhongxin', '1', '1', '197', 'a:13:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.dfile\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('282', '热门产品', '45', 'arclist', 'hot_products', '1', '1', '70', 'a:15:{s:5:\"psize\";s:1:\"5\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:9:\"ext.thumb\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:11:\"l.hits DESC\";s:6:\"fields\";s:5:\"thumb\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:8:\"user_ext\";i:0;s:9:\"usergroup\";i:0;s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('104', '资讯中心', '43', 'arclist', 'titlelist', '1', '1', '7', 'a:13:{s:5:\"psize\";s:2:\"10\";s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('105', '资讯中心', '43', 'catelist', 'news_catelist', '1', '1', '7', 'a:13:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('280', '联系我们', '87', 'arc', 'contactus', '1', '1', '0', 'a:13:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:4:\"cate\";s:0:\"\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:6:\"in_sub\";i:0;s:8:\"title_id\";s:9:\"contactus\";}', '0', '');
INSERT INTO `qinggan_phpok` VALUES ('286', '银行汇款', '386', 'project', 'drmpjihitd', '1', '1', '0', 'a:15:{s:5:\"psize\";i:0;s:6:\"offset\";i:0;s:7:\"is_list\";s:1:\"1\";s:4:\"attr\";s:0:\"\";s:11:\"fields_need\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:6:\"fields\";s:1:\"*\";s:13:\"fields_format\";i:0;s:4:\"user\";s:0:\"\";s:8:\"user_ext\";i:0;s:9:\"usergroup\";i:0;s:6:\"in_sub\";i:0;s:8:\"title_id\";s:0:\"\";}', '0', '');

-- ----------------------------
-- Table structure for qinggan_plugins
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_plugins`;
CREATE TABLE `qinggan_plugins` (
  `id` varchar(100) NOT NULL COMMENT '插件ID，仅限字母，数字及下划线',
  `title` varchar(255) NOT NULL COMMENT '插件名称',
  `author` varchar(255) NOT NULL COMMENT '开发者',
  `version` varchar(50) NOT NULL COMMENT '插件版本号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0禁用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '值越小越往前靠',
  `note` varchar(255) NOT NULL COMMENT '摘要说明',
  `param` text NOT NULL COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件管理器';

-- ----------------------------
-- Records of qinggan_plugins
-- ----------------------------
INSERT INTO `qinggan_plugins` VALUES ('identifier', '标识串自动生成工具', 'phpok.com', '1.0', '1', '10', '可实现以 title 的表单数据', 'a:3:{s:9:\"is_youdao\";s:0:\"\";s:10:\"is_pingyin\";s:1:\"1\";s:5:\"is_py\";s:1:\"1\";}');

-- ----------------------------
-- Table structure for qinggan_popedom
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_popedom`;
CREATE TABLE `qinggan_popedom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID，即自增ID',
  `gid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属组ID，对应sysmenu表中的ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID，仅在list中有效',
  `title` varchar(255) NOT NULL COMMENT '名称，如：添加，修改等',
  `identifier` varchar(255) NOT NULL COMMENT '字符串，如add，modify等',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=1364 DEFAULT CHARSET=utf8 COMMENT='权限明细';

-- ----------------------------
-- Records of qinggan_popedom
-- ----------------------------
INSERT INTO `qinggan_popedom` VALUES ('2', '19', '0', '配置全局', 'gset', '10');
INSERT INTO `qinggan_popedom` VALUES ('3', '19', '0', '内容', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('4', '29', '0', '添加', 'add', '10');
INSERT INTO `qinggan_popedom` VALUES ('5', '29', '0', '修改', 'modify', '20');
INSERT INTO `qinggan_popedom` VALUES ('6', '29', '0', '删除', 'delete', '30');
INSERT INTO `qinggan_popedom` VALUES ('7', '18', '0', '添加', 'add', '10');
INSERT INTO `qinggan_popedom` VALUES ('8', '18', '0', '编辑', 'modify', '20');
INSERT INTO `qinggan_popedom` VALUES ('9', '18', '0', '删除', 'delete', '30');
INSERT INTO `qinggan_popedom` VALUES ('10', '23', '0', '添加', 'add', '10');
INSERT INTO `qinggan_popedom` VALUES ('11', '23', '0', '编辑', 'modify', '20');
INSERT INTO `qinggan_popedom` VALUES ('12', '23', '0', '删除', 'delete', '30');
INSERT INTO `qinggan_popedom` VALUES ('14', '22', '0', 'GD配置', 'gd', '10');
INSERT INTO `qinggan_popedom` VALUES ('15', '22', '0', '附件分类维护', 'cate', '20');
INSERT INTO `qinggan_popedom` VALUES ('16', '22', '0', '批处理', 'pl', '30');
INSERT INTO `qinggan_popedom` VALUES ('17', '16', '0', '配置', 'config', '10');
INSERT INTO `qinggan_popedom` VALUES ('18', '16', '0', '安装', 'install', '20');
INSERT INTO `qinggan_popedom` VALUES ('19', '16', '0', '卸载', 'uninstall', '30');
INSERT INTO `qinggan_popedom` VALUES ('20', '16', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('21', '17', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('22', '13', '0', '添加', 'add', '10');
INSERT INTO `qinggan_popedom` VALUES ('23', '13', '0', '修改', 'modify', '20');
INSERT INTO `qinggan_popedom` VALUES ('24', '13', '0', '删除', 'delete', '30');
INSERT INTO `qinggan_popedom` VALUES ('25', '13', '0', '查看', 'list', '5');
INSERT INTO `qinggan_popedom` VALUES ('26', '19', '0', '查看', 'list', '5');
INSERT INTO `qinggan_popedom` VALUES ('33', '21', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('34', '21', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('35', '21', '0', '编辑', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('36', '21', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('37', '18', '0', '查看', 'list', '5');
INSERT INTO `qinggan_popedom` VALUES ('38', '23', '0', '查看', 'list', '5');
INSERT INTO `qinggan_popedom` VALUES ('83', '16', '0', '启用/禁用', 'status', '50');
INSERT INTO `qinggan_popedom` VALUES ('40', '16', '0', '查看', 'list', '5');
INSERT INTO `qinggan_popedom` VALUES ('41', '17', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('42', '18', '0', '扩展', 'ext', '40');
INSERT INTO `qinggan_popedom` VALUES ('43', '19', '0', '扩展', 'ext', '30');
INSERT INTO `qinggan_popedom` VALUES ('44', '14', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('45', '14', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('46', '14', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('47', '14', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('48', '25', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('49', '25', '0', '配置', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('80', '14', '0', '启用/禁用', 'status', '50');
INSERT INTO `qinggan_popedom` VALUES ('52', '29', '0', '查看', 'list', '5');
INSERT INTO `qinggan_popedom` VALUES ('53', '27', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('54', '27', '0', '配置', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('81', '19', '0', '网站', 'site', '40');
INSERT INTO `qinggan_popedom` VALUES ('82', '19', '0', '域名', 'domain', '50');
INSERT INTO `qinggan_popedom` VALUES ('58', '8', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('59', '8', '0', '维护', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('63', '6', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('64', '6', '0', '维护', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('67', '7', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('68', '7', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('69', '7', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('70', '7', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('71', '28', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('72', '28', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('73', '28', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('74', '28', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('75', '9', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('76', '9', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('77', '9', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('78', '9', '0', '启用/禁用', 'status', '40');
INSERT INTO `qinggan_popedom` VALUES ('79', '29', '0', '启用/禁用', 'status', '40');
INSERT INTO `qinggan_popedom` VALUES ('133', '30', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('134', '30', '0', '设置', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('135', '30', '0', '文件管理', 'filelist', '30');
INSERT INTO `qinggan_popedom` VALUES ('136', '30', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('142', '13', '0', '审核', 'status', '40');
INSERT INTO `qinggan_popedom` VALUES ('143', '20', '41', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('144', '20', '41', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('145', '20', '41', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('146', '20', '41', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('147', '20', '41', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('148', '20', '42', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('149', '20', '42', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('150', '20', '42', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('151', '20', '42', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('152', '20', '42', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('153', '20', '43', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('154', '20', '43', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('155', '20', '43', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('156', '20', '43', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('157', '20', '43', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('162', '31', '0', '添加站点', 'add', '40');
INSERT INTO `qinggan_popedom` VALUES ('159', '31', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('160', '31', '0', '删除', 'delete', '20');
INSERT INTO `qinggan_popedom` VALUES ('161', '31', '0', '设为默认', 'default', '30');
INSERT INTO `qinggan_popedom` VALUES ('165', '20', '45', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('166', '20', '45', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('167', '20', '45', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('168', '20', '45', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('169', '20', '45', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('170', '19', '0', '添加站点', 'add', '60');
INSERT INTO `qinggan_popedom` VALUES ('344', '32', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('345', '32', '0', '启用/禁用', 'status', '20');
INSERT INTO `qinggan_popedom` VALUES ('346', '32', '0', '删除', 'delete', '30');
INSERT INTO `qinggan_popedom` VALUES ('347', '32', '0', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('348', '32', '0', '回复', 'reply', '50');
INSERT INTO `qinggan_popedom` VALUES ('349', '20', '87', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('350', '20', '87', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('351', '20', '87', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('352', '20', '87', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('353', '20', '87', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('388', '20', '96', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('389', '20', '96', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('390', '20', '96', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('391', '20', '96', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('392', '20', '96', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('476', '33', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('477', '33', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('478', '33', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('479', '33', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('480', '33', '0', '启用/禁用', 'status', '50');
INSERT INTO `qinggan_popedom` VALUES ('601', '34', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('602', '34', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('603', '34', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('604', '34', '0', '审核', 'status', '40');
INSERT INTO `qinggan_popedom` VALUES ('605', '34', '0', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('606', '20', '142', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('607', '20', '142', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('608', '20', '142', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('609', '20', '142', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('610', '20', '142', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('611', '20', '142', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('612', '20', '144', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('613', '20', '144', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('614', '20', '144', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('615', '20', '144', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('616', '20', '144', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('617', '42', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('618', '42', '0', '执行', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('619', '43', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('620', '44', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('621', '45', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('622', '45', '0', '升级', 'update', '20');
INSERT INTO `qinggan_popedom` VALUES ('623', '45', '0', '配置升级服务器', 'set', '30');
INSERT INTO `qinggan_popedom` VALUES ('624', '46', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('625', '9', '0', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('626', '52', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('627', '52', '0', '添加组', 'groupadd', '20');
INSERT INTO `qinggan_popedom` VALUES ('628', '52', '0', '修改组', 'groupedit', '30');
INSERT INTO `qinggan_popedom` VALUES ('629', '52', '0', '删除组', 'groupdelete', '40');
INSERT INTO `qinggan_popedom` VALUES ('630', '52', '0', '添加', 'add', '50');
INSERT INTO `qinggan_popedom` VALUES ('631', '52', '0', '修改', 'edit', '60');
INSERT INTO `qinggan_popedom` VALUES ('632', '52', '0', '删除', 'delete', '70');
INSERT INTO `qinggan_popedom` VALUES ('633', '52', '0', '启用/禁用', 'status', '80');
INSERT INTO `qinggan_popedom` VALUES ('634', '52', '0', '组启用/禁用', 'groupstatus', '35');
INSERT INTO `qinggan_popedom` VALUES ('635', '54', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('636', '54', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('637', '54', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('638', '54', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('639', '54', '0', '审核', 'status', '50');
INSERT INTO `qinggan_popedom` VALUES ('640', '54', '0', '排序', 'taxis', '60');
INSERT INTO `qinggan_popedom` VALUES ('647', '55', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('648', '55', '0', '更新HTML', 'create', '20');
INSERT INTO `qinggan_popedom` VALUES ('651', '20', '147', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('652', '20', '147', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('653', '20', '147', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('654', '20', '147', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('655', '20', '147', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('656', '20', '147', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('657', '20', '148', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('658', '20', '148', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('659', '20', '148', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('660', '20', '148', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('661', '20', '148', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('662', '20', '148', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('968', '20', '0', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('967', '20', '0', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('669', '20', '150', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('670', '20', '150', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('671', '20', '151', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('672', '20', '151', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('673', '20', '151', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('674', '20', '151', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('675', '20', '151', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('676', '20', '151', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('677', '20', '152', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('678', '20', '152', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('679', '20', '152', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('680', '20', '152', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('681', '20', '152', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('682', '20', '152', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('689', '20', '144', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('690', '57', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('691', '57', '0', '创建备份', 'create', '20');
INSERT INTO `qinggan_popedom` VALUES ('692', '57', '0', '删除备份', 'delete', '30');
INSERT INTO `qinggan_popedom` VALUES ('693', '57', '0', '恢复备份', 'recover', '40');
INSERT INTO `qinggan_popedom` VALUES ('694', '57', '0', '优化', 'optimize', '50');
INSERT INTO `qinggan_popedom` VALUES ('695', '57', '0', '修复', 'repair', '60');
INSERT INTO `qinggan_popedom` VALUES ('696', '58', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('697', '58', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('698', '58', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('699', '58', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('700', '18', '0', '状态', 'status', '50');
INSERT INTO `qinggan_popedom` VALUES ('701', '59', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('702', '59', '0', '设置', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('703', '59', '0', '删除', 'delete', '30');
INSERT INTO `qinggan_popedom` VALUES ('704', '27', '0', '扩展', 'ext', '30');
INSERT INTO `qinggan_popedom` VALUES ('754', '63', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('753', '63', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('752', '63', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('751', '62', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('750', '62', '0', '编辑', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('749', '62', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('748', '62', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('755', '63', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('757', '20', '43', '评论', 'comment', '80');
INSERT INTO `qinggan_popedom` VALUES ('758', '66', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('759', '66', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('760', '66', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('761', '66', '0', '配置', 'setting', '40');
INSERT INTO `qinggan_popedom` VALUES ('762', '66', '0', '删除', 'delete', '60');
INSERT INTO `qinggan_popedom` VALUES ('763', '66', '0', '状态', 'status', '50');
INSERT INTO `qinggan_popedom` VALUES ('764', '67', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('765', '67', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('766', '67', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('767', '67', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('768', '68', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('769', '68', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('770', '68', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('771', '68', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('772', '77', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('773', '77', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('774', '77', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('775', '77', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('776', '77', '0', '状态', 'status', '50');
INSERT INTO `qinggan_popedom` VALUES ('777', '34', '0', '配置', 'set', '60');
INSERT INTO `qinggan_popedom` VALUES ('778', '31', '0', '订单配置', 'order', '50');
INSERT INTO `qinggan_popedom` VALUES ('779', '78', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('780', '78', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('781', '78', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('782', '78', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('783', '78', '0', '审核', 'status', '50');
INSERT INTO `qinggan_popedom` VALUES ('784', '78', '0', '设为默认', 'isdefault', '60');
INSERT INTO `qinggan_popedom` VALUES ('793', '80', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('794', '80', '0', '添加', 'add', '20');
INSERT INTO `qinggan_popedom` VALUES ('795', '80', '0', '修改', 'modify', '30');
INSERT INTO `qinggan_popedom` VALUES ('796', '80', '0', '删除', 'delete', '40');
INSERT INTO `qinggan_popedom` VALUES ('1311', '20', '45', '扩展', 'ext', '70');
INSERT INTO `qinggan_popedom` VALUES ('1310', '20', '45', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('972', '20', '0', '评论', 'comment', '80');
INSERT INTO `qinggan_popedom` VALUES ('971', '20', '0', '扩展', 'ext', '70');
INSERT INTO `qinggan_popedom` VALUES ('970', '20', '0', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('969', '20', '0', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('966', '20', '0', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('965', '20', '0', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('981', '20', '43', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('982', '20', '43', '扩展', 'ext', '70');
INSERT INTO `qinggan_popedom` VALUES ('983', '20', '311', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('984', '20', '311', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('985', '20', '311', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('986', '20', '311', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('987', '20', '311', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('988', '20', '312', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('989', '20', '312', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('990', '20', '312', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('991', '20', '312', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('992', '20', '312', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('993', '20', '313', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('994', '20', '313', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('995', '20', '313', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('996', '20', '313', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('997', '20', '313', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('998', '20', '313', '评论', 'comment', '80');
INSERT INTO `qinggan_popedom` VALUES ('999', '20', '313', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1000', '20', '313', '扩展', 'ext', '70');
INSERT INTO `qinggan_popedom` VALUES ('1001', '20', '314', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1002', '20', '314', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1003', '20', '314', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1004', '20', '314', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1005', '20', '314', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1006', '20', '315', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1007', '20', '315', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1008', '20', '315', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1009', '20', '315', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1010', '20', '315', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1011', '20', '316', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1012', '20', '316', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1013', '20', '317', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1014', '20', '317', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1015', '20', '318', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1016', '20', '318', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1017', '20', '319', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1018', '20', '319', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1019', '20', '320', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1020', '20', '320', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1021', '20', '320', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1022', '20', '320', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1023', '20', '320', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1024', '20', '320', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1025', '20', '321', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1026', '20', '321', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1027', '20', '321', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1028', '20', '321', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1029', '20', '321', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1030', '20', '322', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1031', '20', '322', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1032', '20', '322', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1033', '20', '322', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1034', '20', '322', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1035', '20', '322', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1036', '20', '323', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1037', '20', '323', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1038', '20', '323', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1039', '20', '323', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1040', '20', '323', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1041', '20', '323', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1042', '20', '324', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1043', '20', '324', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1044', '20', '324', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1045', '20', '324', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1046', '20', '324', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1047', '20', '324', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1048', '20', '325', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1049', '20', '325', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1050', '20', '325', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1051', '20', '325', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1052', '20', '325', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1053', '20', '325', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1054', '20', '326', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1055', '20', '326', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1056', '20', '327', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1057', '20', '327', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1058', '20', '328', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1059', '20', '328', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1060', '20', '328', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1061', '20', '328', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1062', '20', '328', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1063', '20', '328', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1064', '20', '329', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1065', '20', '329', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1066', '20', '329', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1067', '20', '329', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1068', '20', '329', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1069', '20', '330', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1070', '20', '330', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1071', '20', '330', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1072', '20', '330', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1073', '20', '330', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1074', '20', '331', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1075', '20', '331', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1076', '20', '331', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1077', '20', '331', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1078', '20', '331', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1079', '20', '331', '评论', 'comment', '80');
INSERT INTO `qinggan_popedom` VALUES ('1080', '20', '331', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1081', '20', '331', '扩展', 'ext', '70');
INSERT INTO `qinggan_popedom` VALUES ('1082', '20', '332', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1083', '20', '332', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1084', '20', '332', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1085', '20', '332', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1086', '20', '332', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1087', '20', '333', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1088', '20', '333', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1089', '20', '333', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1090', '20', '333', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1091', '20', '333', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1092', '20', '334', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1093', '20', '334', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1094', '20', '335', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1095', '20', '335', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1096', '20', '336', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1097', '20', '336', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1098', '20', '337', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1099', '20', '337', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1100', '20', '338', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1101', '20', '338', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1102', '20', '338', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1103', '20', '338', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1104', '20', '338', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1105', '20', '338', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1106', '20', '339', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1107', '20', '339', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1108', '20', '339', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1109', '20', '339', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1110', '20', '339', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1111', '20', '340', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1112', '20', '340', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1113', '20', '340', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1114', '20', '340', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1115', '20', '340', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1116', '20', '340', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1117', '20', '341', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1118', '20', '341', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1119', '20', '341', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1120', '20', '341', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1121', '20', '341', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1122', '20', '341', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1123', '20', '342', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1124', '20', '342', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1125', '20', '342', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1126', '20', '342', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1127', '20', '342', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1128', '20', '342', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1129', '20', '343', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1130', '20', '343', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1131', '20', '343', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1132', '20', '343', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1133', '20', '343', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1134', '20', '343', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1135', '20', '344', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1136', '20', '344', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1137', '20', '345', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1138', '20', '345', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1139', '20', '346', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1140', '20', '346', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1141', '20', '346', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1142', '20', '346', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1143', '20', '346', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1144', '20', '346', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1145', '20', '347', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1146', '20', '347', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1147', '20', '347', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1148', '20', '347', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1149', '20', '347', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1150', '20', '348', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1151', '20', '348', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1152', '20', '348', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1153', '20', '348', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1154', '20', '348', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1155', '20', '349', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1156', '20', '349', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1157', '20', '349', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1158', '20', '349', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1159', '20', '349', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1160', '20', '349', '评论', 'comment', '80');
INSERT INTO `qinggan_popedom` VALUES ('1161', '20', '349', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1162', '20', '349', '扩展', 'ext', '70');
INSERT INTO `qinggan_popedom` VALUES ('1163', '20', '350', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1164', '20', '350', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1165', '20', '350', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1166', '20', '350', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1167', '20', '350', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1168', '20', '351', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1169', '20', '351', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1170', '20', '351', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1171', '20', '351', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1172', '20', '351', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1173', '20', '352', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1174', '20', '352', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1175', '20', '353', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1176', '20', '353', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1177', '20', '354', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1178', '20', '354', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1179', '20', '355', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1180', '20', '355', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1181', '20', '356', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1182', '20', '356', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1183', '20', '356', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1184', '20', '356', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1185', '20', '356', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1186', '20', '356', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1187', '20', '357', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1188', '20', '357', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1189', '20', '357', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1190', '20', '357', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1191', '20', '357', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1192', '20', '358', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1193', '20', '358', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1194', '20', '358', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1195', '20', '358', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1196', '20', '358', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1197', '20', '358', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1198', '20', '359', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1199', '20', '359', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1200', '20', '359', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1201', '20', '359', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1202', '20', '359', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1203', '20', '359', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1204', '20', '360', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1205', '20', '360', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1206', '20', '360', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1207', '20', '360', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1208', '20', '360', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1209', '20', '360', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1210', '20', '361', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1211', '20', '361', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1212', '20', '361', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1213', '20', '361', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1214', '20', '361', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1215', '20', '361', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1216', '20', '362', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1217', '20', '362', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1218', '20', '363', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1219', '20', '363', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1220', '20', '364', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1221', '20', '364', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1222', '20', '364', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1223', '20', '364', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1224', '20', '364', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1225', '20', '364', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1307', '20', '87', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1308', '20', '87', '扩展', 'ext', '70');
INSERT INTO `qinggan_popedom` VALUES ('1309', '20', '87', '评论', 'comment', '80');
INSERT INTO `qinggan_popedom` VALUES ('1312', '20', '45', '评论', 'comment', '80');
INSERT INTO `qinggan_popedom` VALUES ('1337', '20', '386', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1338', '20', '386', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1339', '20', '386', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1340', '20', '386', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1341', '20', '386', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1342', '20', '386', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1343', '20', '386', '扩展', 'ext', '70');
INSERT INTO `qinggan_popedom` VALUES ('1344', '20', '386', '评论', 'comment', '80');
INSERT INTO `qinggan_popedom` VALUES ('1345', '34', '0', '取消', 'cancel', '70');
INSERT INTO `qinggan_popedom` VALUES ('1346', '34', '0', '结束', 'stop', '80');
INSERT INTO `qinggan_popedom` VALUES ('1347', '34', '0', '完成', 'end', '90');
INSERT INTO `qinggan_popedom` VALUES ('1362', '20', '391', '扩展', 'ext', '70');
INSERT INTO `qinggan_popedom` VALUES ('1361', '20', '391', '启用/禁用', 'status', '60');
INSERT INTO `qinggan_popedom` VALUES ('1360', '20', '391', '删除', 'delete', '50');
INSERT INTO `qinggan_popedom` VALUES ('1359', '20', '391', '修改', 'modify', '40');
INSERT INTO `qinggan_popedom` VALUES ('1358', '20', '391', '添加', 'add', '30');
INSERT INTO `qinggan_popedom` VALUES ('1357', '20', '391', '编辑', 'set', '20');
INSERT INTO `qinggan_popedom` VALUES ('1356', '20', '391', '查看', 'list', '10');
INSERT INTO `qinggan_popedom` VALUES ('1363', '20', '391', '评论', 'comment', '80');

-- ----------------------------
-- Table structure for qinggan_project
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_project`;
CREATE TABLE `qinggan_project` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID，也是应用ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上一级ID',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '网站ID',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '指定模型ID，为0表页面空白',
  `cate` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '绑定根分类ID',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `nick_title` varchar(255) NOT NULL COMMENT '后台别称',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `tpl_index` varchar(255) NOT NULL COMMENT '封面页',
  `tpl_list` varchar(255) NOT NULL COMMENT '列表页',
  `tpl_content` varchar(255) NOT NULL COMMENT '详细页',
  `is_identifier` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否自定义标识',
  `ico` varchar(255) NOT NULL COMMENT '图标',
  `orderby` text NOT NULL COMMENT '排序',
  `alias_title` varchar(255) NOT NULL COMMENT '主题别名',
  `alias_note` varchar(255) NOT NULL COMMENT '主题备注',
  `psize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0表示不限制，每页显示数量',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID号，为0表示管理员维护',
  `identifier` varchar(255) NOT NULL COMMENT '标识',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` varchar(255) NOT NULL COMMENT 'SEO描述',
  `subtopics` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用子主题功能',
  `is_search` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否支持搜索',
  `is_tag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '必填Tag',
  `is_biz` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0不启用电商，1启用电商',
  `is_userid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定会员',
  `is_tpl_content` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否自定义内容模板',
  `is_seo` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认使用seo',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '默认货币ID',
  `admin_note` text NOT NULL COMMENT '管理员备注，给编辑人员使用的',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0显示1隐藏',
  `post_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发布模式，0不启用1启用',
  `comment_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '启用评论功能',
  `post_tpl` varchar(255) NOT NULL COMMENT '发布页模板',
  `etpl_admin` varchar(255) NOT NULL COMMENT '通知管理员邮件模板',
  `etpl_user` varchar(255) NOT NULL COMMENT '发布邮件通知会员模板',
  `etpl_comment_admin` varchar(255) NOT NULL COMMENT '评论邮件通知管理员模板',
  `etpl_comment_user` varchar(255) NOT NULL COMMENT '评论邮件通知会员',
  `is_attr` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1启用主题属性0不启用',
  `tag` varchar(255) NOT NULL COMMENT '自身Tag设置',
  `is_appoint` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '指定维护',
  `cate_multiple` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0分类单选1分类支持多选',
  `biz_attr` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '产品属性，0不使用1使用',
  `freight` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `site_id` (`site_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 COMMENT='项目管理器';

-- ----------------------------
-- Records of qinggan_project
-- ----------------------------
INSERT INTO `qinggan_project` VALUES ('41', '0', '1', '21', '0', '图片播放器', '', '20', '1', '', '', '', '0', 'images/ico/picplayer.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'picture-player', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('42', '0', '1', '23', '0', '导航菜单', '', '30', '1', '', '', '', '0', 'images/ico/menu.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '导航名称', '', '30', '0', 'menu', '', '', '', '1', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('43', '0', '1', '22', '7', '资讯中心', '', '12', '1', '', '', '', '0', 'images/ico/article.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '新闻主题', '', '10', '0', 'news', '', '', '', '0', '1', '1', '0', '1', '0', '1', '0', '', '0', '0', '1', '', '', '', '', '', '1', '新闻,资讯', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('87', '0', '1', '40', '0', '关于我们', '', '15', '1', '', '', '', '1', 'images/ico/about.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'about', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('45', '0', '1', '24', '70', '产品展示', '', '50', '1', '', '', '', '0', 'images/ico/product.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '产品名称', '', '12', '0', 'product', '', '', '', '0', '1', '0', '1', '0', '0', '0', '1', '', '0', '0', '0', '', '', '', '', '', '1', '', '0', '1', '1', '0');
INSERT INTO `qinggan_project` VALUES ('142', '0', '1', '61', '0', '友情链接', '', '120', '1', '', '', '', '0', 'images/ico/link.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '网站名称', '', '30', '0', 'link', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '0', 'post_link', 'project_save', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('96', '0', '1', '46', '0', '在线留言', '', '70', '1', '', '', '', '0', 'images/ico/comment.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '留言主题', '', '30', '0', 'book', '', '', '', '0', '0', '0', '0', '1', '0', '0', '0', '', '0', '1', '1', '', 'project_save', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('144', '0', '1', '68', '154', '图集相册', '', '90', '1', '', '', '', '0', 'images/ico/photo.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'photo', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('151', '0', '1', '65', '197', '下载中心', '', '100', '1', '', 'download_list', 'download_content', '0', 'images/ico/cloud.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '附件名称', '', '30', '0', 'download-center', '', '', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('147', '0', '1', '23', '0', '页脚导航', '', '35', '1', '', '', '', '0', 'images/ico/menu.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'yejiaodaohang', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('148', '0', '1', '64', '0', '在线客服', '', '130', '1', '', '', '', '0', 'images/ico/qq.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '客服类型', '', '30', '0', 'kefu', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('150', '0', '1', '0', '0', '售后保障', '', '60', '1', '', '', '', '0', 'images/ico/paper.png', 'l.sort DESC,l.dateline DESC,l.id DESC', '', '', '30', '0', 'shouhoukouzhang', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('152', '0', '1', '66', '201', '论坛BBS', '', '110', '1', 'bbs_index', 'bbs_list', 'bbs_detail', '0', 'images/ico/forum.png', 'ext.toplevel DESC,l.replydate DESC,l.dateline DESC,l.id DESC', '讨论主题', '', '30', '0', 'bbs', '', '', '', '0', '0', '0', '0', '1', '0', '0', '0', '', '0', '1', '1', 'bbs_fabu', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('386', '0', '1', '75', '0', '银行汇款', '', '140', '1', '', '', '', '0', 'images/ico/bank.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '订单编号', '', '30', '0', 'yinxinghuikuan', '', '', '', '0', '0', '0', '0', '1', '0', '0', '0', '', '0', '1', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');
INSERT INTO `qinggan_project` VALUES ('391', '0', '1', '84', '0', '微信菜单', '', '150', '1', '', '', '', '0', 'images/ico/menu.png', 'l.sort ASC,l.dateline DESC,l.id DESC', '菜单名称', '一级菜单不能超过4个汉字，二级菜单不能超过7个汉字', '30', '0', 'wxmenu', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '', '', '', '', '', '0', '', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for qinggan_reply
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_reply`;
CREATE TABLE `qinggan_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父回复ID',
  `vouch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐评论',
  `star` tinyint(1) NOT NULL DEFAULT '3' COMMENT '星级',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `ip` varchar(255) NOT NULL COMMENT '回复人IP',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核1审核',
  `session_id` varchar(255) NOT NULL COMMENT '游客标识',
  `content` text NOT NULL COMMENT '评论内容',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `adm_content` longtext NOT NULL COMMENT '管理员回复内容',
  `adm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0为评论，非零绑定订单ID',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='主题评论表';

-- ----------------------------
-- Records of qinggan_reply
-- ----------------------------
INSERT INTO `qinggan_reply` VALUES ('39', '1369', '0', '0', '0', '0', '0.0.0.0', '1480329243', '1', 'sr4fjluaen5tpins0v8c3ife23', '测试这个的评论，看有没有赠分~', '0', '', '0', '0');
INSERT INTO `qinggan_reply` VALUES ('40', '1369', '0', '0', '0', '23', '0.0.0.0', '1480329276', '1', 'sr4fjluaen5tpins0v8c3ife23', '看下这条评论！', '0', '', '0', '0');
INSERT INTO `qinggan_reply` VALUES ('41', '1368', '0', '0', '3', '23', '0.0.0.0', '1480329326', '1', 'sr4fjluaen5tpins0v8c3ife23', '<p>测试下这一条的~，编辑下内容！<br/></p>', '0', '', '0', '0');
INSERT INTO `qinggan_reply` VALUES ('42', '1762', '0', '0', '0', '23', '0.0.0.0', '1480392662', '1', 'kvvddou0472srpf83vcpd32h20', '测试下评论', '0', '', '0', '0');
INSERT INTO `qinggan_reply` VALUES ('43', '1762', '0', '0', '0', '23', '0.0.0.0', '1480393813', '1', 'kvvddou0472srpf83vcpd32h20', '再来测试下！', '0', '', '0', '0');
INSERT INTO `qinggan_reply` VALUES ('44', '1763', '0', '0', '0', '23', '0.0.0.0', '1480398396', '1', '', '测试下点评噢', '0', '', '0', '23');

-- ----------------------------
-- Table structure for qinggan_res
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_res`;
CREATE TABLE `qinggan_res` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `cate_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `folder` varchar(255) NOT NULL COMMENT '存储目录',
  `name` varchar(255) NOT NULL COMMENT '资源文件名',
  `ext` varchar(30) NOT NULL COMMENT '资源后缀，如jpg等',
  `filename` varchar(255) NOT NULL COMMENT '文件名带路径',
  `ico` varchar(255) NOT NULL COMMENT 'ICO图标文件',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `title` varchar(255) NOT NULL COMMENT '内容',
  `attr` text NOT NULL COMMENT '附件属性',
  `note` text NOT NULL COMMENT '备注',
  `session_id` varchar(100) NOT NULL COMMENT '操作者 ID，即会员ID用于检测是否有权限删除 ',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID，当该ID为时检则sesson_id，如不相同则不能删除 ',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  PRIMARY KEY (`id`),
  KEY `ext` (`ext`)
) ENGINE=MyISAM AUTO_INCREMENT=1200 DEFAULT CHARSET=utf8 COMMENT='资源ID';

-- ----------------------------
-- Records of qinggan_res
-- ----------------------------
INSERT INTO `qinggan_res` VALUES ('624', '1', 'res/201409/01/', '27a6e141c3d265ae.jpg', 'jpg', 'res/201409/01/27a6e141c3d265ae.jpg', 'res/201409/01/_624.jpg', '1409550321', 'logo', 'a:2:{s:5:\"width\";i:219;s:6:\"height\";i:57;}', '', '', '0', '0', '0');
INSERT INTO `qinggan_res` VALUES ('629', '1', 'res/201409/03/', 'e8b2a2815497215c.png', 'png', 'res/201409/03/e8b2a2815497215c.png', 'res/201409/03/_629.png', '1409747220', 'bbs', 'a:2:{s:5:\"width\";i:280;s:6:\"height\";i:280;}', '', '', '0', '0', '0');
INSERT INTO `qinggan_res` VALUES ('630', '1', 'res/201409/03/', '5b0086d14de1bbf2.jpg', 'jpg', 'res/201409/03/5b0086d14de1bbf2.jpg', 'res/201409/03/_630.jpg', '1409749616', 'about-img', 'a:2:{s:5:\"width\";i:129;s:6:\"height\";i:133;}', '', '', '0', '0', '0');
INSERT INTO `qinggan_res` VALUES ('1006', '1', 'res/201603/22/', 'a9c66d15979de244.jpg', 'jpg', 'res/201603/22/a9c66d15979de244.jpg', 'res/201603/22/_1006.jpg', '1458614426', 'banner (1)', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1007', '1', 'res/201603/22/', '5c94d5a5d4729ee2.jpg', 'jpg', 'res/201603/22/5c94d5a5d4729ee2.jpg', 'res/201603/22/_1007.jpg', '1458614426', 'banner (2)', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1008', '1', 'res/201603/22/', '572864921e9b72f0.jpg', 'jpg', 'res/201603/22/572864921e9b72f0.jpg', 'res/201603/22/_1008.jpg', '1458614426', 'banner (3)', 'a:2:{s:5:\"width\";i:980;s:6:\"height\";i:180;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1015', '1', 'res/201603/22/', 'c329c62e183765ad.jpg', 'jpg', 'res/201603/22/c329c62e183765ad.jpg', 'res/201603/22/_1015.jpg', '1458627033', '魅族5', 'a:2:{s:5:\"width\";i:500;s:6:\"height\";i:500;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1010', '1', 'res/201603/22/', '671d21cb49401430.jpg', 'jpg', 'res/201603/22/671d21cb49401430.jpg', 'res/201603/22/_1010.jpg', '1458626175', '小米5-2', 'a:2:{s:5:\"width\";i:720;s:6:\"height\";i:420;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1011', '1', 'res/201603/22/', '6bd0beb0726e32cf.jpg', 'jpg', 'res/201603/22/6bd0beb0726e32cf.jpg', 'res/201603/22/_1011.jpg', '1458626175', '小米5-1', 'a:2:{s:5:\"width\";i:720;s:6:\"height\";i:424;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1012', '1', 'res/201603/22/', '8ec700add8e54d49.jpg', 'jpg', 'res/201603/22/8ec700add8e54d49.jpg', 'res/201603/22/_1012.jpg', '1458626175', '小米5-3', 'a:2:{s:5:\"width\";i:720;s:6:\"height\";i:335;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1013', '1', 'res/201603/22/', '6e32b648bf93b490.jpg', 'jpg', 'res/201603/22/6e32b648bf93b490.jpg', 'res/201603/22/_1013.jpg', '1458626325', '小米5-thumb', 'a:2:{s:5:\"width\";i:350;s:6:\"height\";i:350;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1016', '1', 'res/201603/22/', '9fa4450173e59070.jpg', 'jpg', 'res/201603/22/9fa4450173e59070.jpg', 'res/201603/22/_1016.jpg', '1458627040', '魅族5-1', 'a:2:{s:5:\"width\";i:500;s:6:\"height\";i:500;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1017', '1', 'res/201603/22/', '10f10d8a66069b59.jpg', 'jpg', 'res/201603/22/10f10d8a66069b59.jpg', 'res/201603/22/_1017.jpg', '1458627040', '魅族5-2', 'a:2:{s:5:\"width\";i:500;s:6:\"height\";i:500;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1018', '1', 'res/201603/23/', 'c941c40778124f2c.jpg', 'jpg', 'res/201603/23/c941c40778124f2c.jpg', 'res/201603/23/_1018.jpg', '1458667317', 'P7-2', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1019', '1', 'res/201603/23/', '945b1df945e039f5.jpg', 'jpg', 'res/201603/23/945b1df945e039f5.jpg', 'res/201603/23/_1019.jpg', '1458667317', 'P7-1', 'a:2:{s:5:\"width\";i:532;s:6:\"height\";i:532;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1020', '1', 'res/201603/23/', '281512b3b3f9c5f0.jpg', 'jpg', 'res/201603/23/281512b3b3f9c5f0.jpg', 'res/201603/23/_1020.jpg', '1458667317', 'P7-3', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1021', '1', 'res/201603/23/', 'fceefc0374ff1ef2.jpg', 'jpg', 'res/201603/23/fceefc0374ff1ef2.jpg', 'res/201603/23/_1021.jpg', '1458668292', 'xplay5-b-1', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1022', '1', 'res/201603/23/', '63d31419a3bc3163.jpg', 'jpg', 'res/201603/23/63d31419a3bc3163.jpg', 'res/201603/23/_1022.jpg', '1458668292', 'xplay5-b-3', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1023', '1', 'res/201603/23/', 'c94f7ff8e44ec536.jpg', 'jpg', 'res/201603/23/c94f7ff8e44ec536.jpg', 'res/201603/23/_1023.jpg', '1458668292', 'xplay5-b-2', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1024', '1', 'res/201603/23/', '9470f2408e492d99.jpg', 'jpg', 'res/201603/23/9470f2408e492d99.jpg', 'res/201603/23/_1024.jpg', '1458668293', 'xplay5-b-4', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1025', '1', 'res/201603/23/', '5b8b8f3f6cfd32b9.jpg', 'jpg', 'res/201603/23/5b8b8f3f6cfd32b9.jpg', 'res/201603/23/_1025.jpg', '1458669513', 'iphone5se-1', 'a:2:{s:5:\"width\";i:755;s:6:\"height\";i:755;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1026', '1', 'res/201603/23/', '2e16c80d821beaf0.jpg', 'jpg', 'res/201603/23/2e16c80d821beaf0.jpg', 'res/201603/23/_1026.jpg', '1458669513', 'iphone5se-2', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1027', '1', 'res/201603/23/', '1548d11e0a50ee55.jpg', 'jpg', 'res/201603/23/1548d11e0a50ee55.jpg', 'res/201603/23/_1027.jpg', '1458669513', 'iphone5se-3', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1028', '1', 'res/201603/23/', 'e2bb1c4c3a4bc11b.jpg', 'jpg', 'res/201603/23/e2bb1c4c3a4bc11b.jpg', 'res/201603/23/_1028.jpg', '1458669514', 'iphone5se-4', 'a:2:{s:5:\"width\";i:600;s:6:\"height\";i:600;}', '', '', '0', '0', '1');
INSERT INTO `qinggan_res` VALUES ('1029', '11', 'res/soft/2016/', '37e7a0aff81446b8.zip', 'zip', 'res/soft/2016/37e7a0aff81446b8.zip', 'images/filetype-large/zip.jpg', '1458715867', 'copy', '', '', '', '0', '3', '1');
INSERT INTO `qinggan_res` VALUES ('1040', '1', 'res/201604/03/', '0143658fa7928c1c', 'jpg', 'res/201604/03/0143658fa7928c1c.jpg', 'res/201604/03/_1040.jpg', '1459617276', '160', 'a:2:{s:5:\"width\";i:160;s:6:\"height\";i:160;}', '', 'v8tocibrgebid4pht9ksprfhd1', '23', '0', '0');

-- ----------------------------
-- Table structure for qinggan_res_cate
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_res_cate`;
CREATE TABLE `qinggan_res_cate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源分类ID',
  `title` varchar(255) NOT NULL COMMENT '分类名称',
  `root` varchar(255) NOT NULL DEFAULT '/' COMMENT '存储目录',
  `folder` varchar(255) NOT NULL DEFAULT 'Ym/d/' COMMENT '存储目录格式',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1默认0非默认',
  `filetypes` varchar(255) NOT NULL COMMENT '附件类型',
  `typeinfo` varchar(200) NOT NULL COMMENT '类型说明',
  `gdtypes` varchar(255) NOT NULL COMMENT '支持的GD方案，多个GD方案用英文ID分开',
  `gdall` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1支持全部GD方案0仅支持指定的GD方案',
  `ico` tinyint(1) NOT NULL DEFAULT '0' COMMENT '后台缩略图',
  `filemax` int(10) unsigned NOT NULL DEFAULT '2' COMMENT '上传文件大小限制',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='资源分类存储';

-- ----------------------------
-- Records of qinggan_res_cate
-- ----------------------------
INSERT INTO `qinggan_res_cate` VALUES ('1', '图片', 'res/', 'Ym/d/', '1', 'png,jpg,gif', '图片', '', '1', '1', '2000');
INSERT INTO `qinggan_res_cate` VALUES ('11', '压缩软件', 'res/soft/', 'Y/', '0', 'rar,zip', '压缩包', '', '0', '0', '2000');
INSERT INTO `qinggan_res_cate` VALUES ('20', 'Excel', 'res/excel', '', '0', 'xls,xlsx', 'Excel文件', '', '0', '0', '2048');
INSERT INTO `qinggan_res_cate` VALUES ('21', '测试分类', 'res/', 'Ym/d/', '0', 'png,jpg,gif', '图片', '', '1', '1', '2048');
INSERT INTO `qinggan_res_cate` VALUES ('22', '这个也是测试的', 'res/', 'Ym/d/', '0', 'png,jpg,gif', '图片', '', '1', '1', '102400');
INSERT INTO `qinggan_res_cate` VALUES ('23', 'ddd', 'res/', 'Ym/d/', '0', 'png,jpg,gif', '图片', '', '1', '1', '102400');
INSERT INTO `qinggan_res_cate` VALUES ('24', '视频', 'res/', 'Ym/d/', '0', 'mp4,flv,mp3,mpeg', '影音文字', '', '0', '0', '2048');

-- ----------------------------
-- Table structure for qinggan_res_ext
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_res_ext`;
CREATE TABLE `qinggan_res_ext` (
  `res_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '附件ID',
  `gd_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'GD库方案ID',
  `filename` varchar(255) NOT NULL COMMENT '文件地址（含路径）',
  `filetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后',
  PRIMARY KEY (`res_id`,`gd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='生成扩展图片';

-- ----------------------------
-- Records of qinggan_res_ext
-- ----------------------------
INSERT INTO `qinggan_res_ext` VALUES ('1006', '12', 'res/201603/22/auto_1006.jpg', '1458649356');
INSERT INTO `qinggan_res_ext` VALUES ('1006', '2', 'res/201603/22/thumb_1006.jpg', '1458649356');
INSERT INTO `qinggan_res_ext` VALUES ('1007', '12', 'res/201603/22/auto_1007.jpg', '1458649354');
INSERT INTO `qinggan_res_ext` VALUES ('1008', '12', 'res/201603/22/auto_1008.jpg', '1458649352');
INSERT INTO `qinggan_res_ext` VALUES ('1007', '2', 'res/201603/22/thumb_1007.jpg', '1458649354');
INSERT INTO `qinggan_res_ext` VALUES ('1008', '2', 'res/201603/22/thumb_1008.jpg', '1458649352');
INSERT INTO `qinggan_res_ext` VALUES ('630', '12', 'res/201409/03/auto_630.jpg', '1458649357');
INSERT INTO `qinggan_res_ext` VALUES ('630', '2', 'res/201409/03/thumb_630.jpg', '1458649357');
INSERT INTO `qinggan_res_ext` VALUES ('629', '12', 'res/201409/03/auto_629.png', '1458649359');
INSERT INTO `qinggan_res_ext` VALUES ('629', '2', 'res/201409/03/thumb_629.png', '1458649359');
INSERT INTO `qinggan_res_ext` VALUES ('624', '12', 'res/201409/01/auto_624.jpg', '1458649361');
INSERT INTO `qinggan_res_ext` VALUES ('624', '2', 'res/201409/01/thumb_624.jpg', '1458649361');
INSERT INTO `qinggan_res_ext` VALUES ('1015', '12', 'res/201603/22/auto_1015.jpg', '1458649343');
INSERT INTO `qinggan_res_ext` VALUES ('1015', '2', 'res/201603/22/thumb_1015.jpg', '1458649343');
INSERT INTO `qinggan_res_ext` VALUES ('1012', '12', 'res/201603/22/auto_1012.jpg', '1458649347');
INSERT INTO `qinggan_res_ext` VALUES ('1010', '12', 'res/201603/22/auto_1010.jpg', '1458649351');
INSERT INTO `qinggan_res_ext` VALUES ('1011', '12', 'res/201603/22/auto_1011.jpg', '1458649349');
INSERT INTO `qinggan_res_ext` VALUES ('1012', '2', 'res/201603/22/thumb_1012.jpg', '1458649347');
INSERT INTO `qinggan_res_ext` VALUES ('1010', '2', 'res/201603/22/thumb_1010.jpg', '1458649351');
INSERT INTO `qinggan_res_ext` VALUES ('1011', '2', 'res/201603/22/thumb_1011.jpg', '1458649349');
INSERT INTO `qinggan_res_ext` VALUES ('1013', '12', 'res/201603/22/auto_1013.jpg', '1458649345');
INSERT INTO `qinggan_res_ext` VALUES ('1013', '2', 'res/201603/22/thumb_1013.jpg', '1458649345');
INSERT INTO `qinggan_res_ext` VALUES ('1016', '12', 'res/201603/22/auto_1016.jpg', '1458649341');
INSERT INTO `qinggan_res_ext` VALUES ('1017', '12', 'res/201603/22/auto_1017.jpg', '1458649340');
INSERT INTO `qinggan_res_ext` VALUES ('1016', '2', 'res/201603/22/thumb_1016.jpg', '1458649341');
INSERT INTO `qinggan_res_ext` VALUES ('1017', '2', 'res/201603/22/thumb_1017.jpg', '1458649340');
INSERT INTO `qinggan_res_ext` VALUES ('1019', '12', 'res/201603/23/auto_1019.jpg', '1458667317');
INSERT INTO `qinggan_res_ext` VALUES ('1018', '12', 'res/201603/23/auto_1018.jpg', '1458667317');
INSERT INTO `qinggan_res_ext` VALUES ('1020', '12', 'res/201603/23/auto_1020.jpg', '1458667317');
INSERT INTO `qinggan_res_ext` VALUES ('1019', '2', 'res/201603/23/thumb_1019.jpg', '1458667317');
INSERT INTO `qinggan_res_ext` VALUES ('1018', '2', 'res/201603/23/thumb_1018.jpg', '1458667317');
INSERT INTO `qinggan_res_ext` VALUES ('1020', '2', 'res/201603/23/thumb_1020.jpg', '1458667317');
INSERT INTO `qinggan_res_ext` VALUES ('1021', '12', 'res/201603/23/auto_1021.jpg', '1458668292');
INSERT INTO `qinggan_res_ext` VALUES ('1022', '12', 'res/201603/23/auto_1022.jpg', '1458668292');
INSERT INTO `qinggan_res_ext` VALUES ('1023', '12', 'res/201603/23/auto_1023.jpg', '1458668292');
INSERT INTO `qinggan_res_ext` VALUES ('1021', '2', 'res/201603/23/thumb_1021.jpg', '1458668292');
INSERT INTO `qinggan_res_ext` VALUES ('1022', '2', 'res/201603/23/thumb_1022.jpg', '1458668292');
INSERT INTO `qinggan_res_ext` VALUES ('1023', '2', 'res/201603/23/thumb_1023.jpg', '1458668292');
INSERT INTO `qinggan_res_ext` VALUES ('1024', '12', 'res/201603/23/auto_1024.jpg', '1458668293');
INSERT INTO `qinggan_res_ext` VALUES ('1024', '2', 'res/201603/23/thumb_1024.jpg', '1458668293');
INSERT INTO `qinggan_res_ext` VALUES ('1026', '12', 'res/201603/23/auto_1026.jpg', '1478857219');
INSERT INTO `qinggan_res_ext` VALUES ('1027', '12', 'res/201603/23/auto_1027.jpg', '1478857217');
INSERT INTO `qinggan_res_ext` VALUES ('1026', '2', 'res/201603/23/thumb_1026.jpg', '1478857219');
INSERT INTO `qinggan_res_ext` VALUES ('1025', '12', 'res/201603/23/auto_1025.jpg', '1478857221');
INSERT INTO `qinggan_res_ext` VALUES ('1027', '2', 'res/201603/23/thumb_1027.jpg', '1478857217');
INSERT INTO `qinggan_res_ext` VALUES ('1025', '2', 'res/201603/23/thumb_1025.jpg', '1478857221');
INSERT INTO `qinggan_res_ext` VALUES ('1028', '12', 'res/201603/23/auto_1028.jpg', '1478857215');
INSERT INTO `qinggan_res_ext` VALUES ('1028', '2', 'res/201603/23/thumb_1028.jpg', '1478857215');
INSERT INTO `qinggan_res_ext` VALUES ('1040', '12', 'res/201604/03/auto_1040.jpg', '1478857209');
INSERT INTO `qinggan_res_ext` VALUES ('1040', '2', 'res/201604/03/thumb_1040.jpg', '1478857209');

-- ----------------------------
-- Table structure for qinggan_session
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_session`;
CREATE TABLE `qinggan_session` (
  `id` varchar(32) NOT NULL COMMENT 'session_id',
  `data` varchar(20485) NOT NULL COMMENT 'session 内容，最多只能放20K',
  `lasttime` int(10) unsigned NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SESSION操作';

-- ----------------------------
-- Records of qinggan_session
-- ----------------------------

-- ----------------------------
-- Table structure for qinggan_site
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_site`;
CREATE TABLE `qinggan_site` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `domain_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '默认域名ID',
  `title` varchar(255) NOT NULL COMMENT '网站名称',
  `dir` varchar(255) NOT NULL DEFAULT '/' COMMENT '安装目录，以/结尾',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `content` text NOT NULL COMMENT '网站关闭原因',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1默认站点',
  `tpl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
  `url_type` enum('default','rewrite','html') NOT NULL DEFAULT 'default' COMMENT '默认，即带?等能数，rewrite是伪静态页，html为生成的静态页',
  `logo` varchar(255) NOT NULL COMMENT '网站 LOGO ',
  `meta` text NOT NULL COMMENT '扩展配置',
  `currency_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '默认货币ID',
  `register_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0关闭注册1开启注册',
  `register_close` varchar(255) NOT NULL COMMENT '关闭注册说明',
  `login_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0关闭登录1开启',
  `login_close` varchar(255) NOT NULL COMMENT '关闭登录说明',
  `adm_logo29` varchar(255) NOT NULL COMMENT '在后台左侧LOGO地址',
  `adm_logo180` varchar(255) NOT NULL COMMENT '登录LOGO地址',
  `lang` varchar(255) NOT NULL COMMENT '语言包',
  `api` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0不走接口',
  `api_code` varchar(255) NOT NULL COMMENT 'API验证串',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO主题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_desc` text NOT NULL COMMENT 'SEO摘要',
  `biz_sn` varchar(255) NOT NULL COMMENT '订单号生成规则',
  `biz_payment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '默认支付方式',
  `upload_guest` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '游客上传权限',
  `upload_user` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员上传权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='网站管理';

-- ----------------------------
-- Records of qinggan_site
-- ----------------------------
INSERT INTO `qinggan_site` VALUES ('1', '1', 'PHPOK企业站', '/', '1', '网站关闭测试', '1', '1', 'default', 'res/201409/01/27a6e141c3d265ae.jpg', '', '1', '1', '本系统暂停新会员注册，如需会员服务请联系QQ：40782502', '1', '本系统暂停会员登录，给您带来不便还请见谅！', '', '', 'cn', '0', '', '网站建设|企业网站建设|PHPOK网站建设|PHPOK企业网站建设', '网站建设,企业网站建设,PHPOK网站建设,PHPOK企业网站建设', '高效的企业网站建设系统，可实现高定制化的企业网站电商系统，实现企业网站到电子商务企业网站。定制功能更高，操作更简单！', 'prefix[P]-year-month-date-rand-user-number', '0', '1', '1');

-- ----------------------------
-- Table structure for qinggan_site_domain
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_site_domain`;
CREATE TABLE `qinggan_site_domain` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '网站ID',
  `domain` varchar(255) NOT NULL COMMENT '域名信息',
  `is_mobile` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1此域名强制为手机版',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='网站指定的域名';

-- ----------------------------
-- Records of qinggan_site_domain
-- ----------------------------
INSERT INTO `qinggan_site_domain` VALUES ('1', '1', 'www.pk.com', '0');

-- ----------------------------
-- Table structure for qinggan_sysmenu
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_sysmenu`;
CREATE TABLE `qinggan_sysmenu` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID，0为根菜单',
  `title` varchar(100) NOT NULL COMMENT '分类名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态0禁用1正常',
  `appfile` varchar(100) NOT NULL COMMENT '应用文件名，放在phpok/admin/目录下，记录不带.php',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，值越小越往前靠，可选0-255',
  `func` varchar(100) NOT NULL COMMENT '应用函数，为空使用index',
  `identifier` varchar(100) NOT NULL COMMENT '标识串，用于区分同一应用文件的不同内容',
  `ext` varchar(255) NOT NULL COMMENT '表单扩展',
  `if_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0常规项目，1系统项目',
  `site_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '0表示全局网站',
  `icon` varchar(255) NOT NULL COMMENT '图标路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='PHPOK后台系统菜单';

-- ----------------------------
-- Records of qinggan_sysmenu
-- ----------------------------
INSERT INTO `qinggan_sysmenu` VALUES ('1', '0', '设置', '1', 'setting', '50', '', '', '', '1', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('3', '0', '会员', '1', 'user', '30', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('5', '0', '内容', '1', 'index', '10', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('6', '1', '表单选项', '1', 'opt', '30', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('7', '4', '字段维护', '1', 'fields', '20', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('8', '1', '模块管理', '1', 'module', '20', '', '', '', '0', '0', 'map');
INSERT INTO `qinggan_sysmenu` VALUES ('9', '1', '核心配置', '1', 'system', '50', '', '', '', '1', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('13', '3', '会员列表', '1', 'user', '10', '', '', '', '0', '0', 'user');
INSERT INTO `qinggan_sysmenu` VALUES ('14', '3', '会员组', '1', 'usergroup', '20', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('25', '3', '会员字段', '1', 'user', '30', 'fields', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('16', '4', '插件中心', '1', 'plugin', '30', '', '', '', '0', '0', 'leaf');
INSERT INTO `qinggan_sysmenu` VALUES ('18', '5', '分类管理', '1', 'cate', '30', '', '', '', '0', '0', 'stack');
INSERT INTO `qinggan_sysmenu` VALUES ('19', '5', '全局内容', '1', 'all', '10', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('20', '5', '内容管理', '1', 'list', '20', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('22', '5', '资源管理', '1', 'res', '60', '', '', '', '0', '0', 'download');
INSERT INTO `qinggan_sysmenu` VALUES ('23', '5', '数据调用', '1', 'call', '40', '', '', '', '0', '0', 'rocket');
INSERT INTO `qinggan_sysmenu` VALUES ('27', '1', '项目管理', '1', 'project', '10', '', '', '', '0', '0', 'google-drive');
INSERT INTO `qinggan_sysmenu` VALUES ('28', '4', '通知模板', '1', 'email', '40', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('29', '1', '管理员维护', '1', 'admin', '80', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('30', '1', '风格管理', '1', 'tpl', '60', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('31', '1', '站点管理', '1', 'site', '90', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('32', '5', '评论管理', '1', 'reply', '50', '', '', '', '0', '0', 'bubbles');
INSERT INTO `qinggan_sysmenu` VALUES ('33', '2', '货币及汇率', '1', 'currency', '30', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('34', '2', '订单管理', '1', 'order', '10', '', '', '', '0', '0', 'briefcase');
INSERT INTO `qinggan_sysmenu` VALUES ('4', '0', '工具', '1', 'tool', '40', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('45', '4', '程序升级', '1', 'update', '10', '', '', '', '0', '0', 'earth');
INSERT INTO `qinggan_sysmenu` VALUES ('2', '0', '商务', '1', '', '20', '', '', '', '1', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('52', '2', '付款方案', '1', 'payment', '20', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('57', '1', '数据库管理', '1', 'sql', '100', '', '', '', '0', '0', 'globe');
INSERT INTO `qinggan_sysmenu` VALUES ('58', '5', '标签管理', '1', 'tag', '70', '', '', '', '0', '0', 'tags');
INSERT INTO `qinggan_sysmenu` VALUES ('59', '1', '伪静态页规则', '1', 'rewrite', '70', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('62', '4', '附件分类管理', '1', 'rescate', '120', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('63', '4', '图片规格方案', '1', 'gd', '130', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('66', '3', '财富方案', '1', 'wealth', '40', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('67', '2', '商品属性', '1', 'options', '40', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('68', '2', '运费模板', '1', 'freight', '50', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('78', '4', '网关路由', '1', 'gateway', '110', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('77', '2', '物流快递', '1', 'express', '50', '', '', '', '0', '0', '');
INSERT INTO `qinggan_sysmenu` VALUES ('80', '4', '计划任务', '1', 'task', '140', '', '', '', '0', '0', '');

-- ----------------------------
-- Table structure for qinggan_tag
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_tag`;
CREATE TABLE `qinggan_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '关键字网址',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0原窗口打开，1新窗口打开',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `alt` varchar(255) NOT NULL COMMENT '链接里的提示',
  `is_global` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否全局状态1是0否',
  `replace_count` tinyint(4) NOT NULL DEFAULT '3' COMMENT '替换次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='关键字管理器';

-- ----------------------------
-- Records of qinggan_tag
-- ----------------------------
INSERT INTO `qinggan_tag` VALUES ('63', '1', '新闻', '', '0', '2', '', '0', '3');
INSERT INTO `qinggan_tag` VALUES ('64', '1', '资讯', '', '0', '1', '', '0', '3');
INSERT INTO `qinggan_tag` VALUES ('65', '1', '自检清单', '', '0', '0', '', '0', '3');
INSERT INTO `qinggan_tag` VALUES ('66', '1', '必应', '', '0', '0', '', '0', '3');
INSERT INTO `qinggan_tag` VALUES ('67', '1', '谷歌', '', '0', '0', '', '0', '3');

-- ----------------------------
-- Table structure for qinggan_tag_stat
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_tag_stat`;
CREATE TABLE `qinggan_tag_stat` (
  `title_id` varchar(200) NOT NULL COMMENT '主题ID，以p开头的表示项目ID，以c开头的表示分类ID',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'TAG标签ID',
  PRIMARY KEY (`title_id`,`tag_id`),
  KEY `title_id` (`title_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag主题统计';

-- ----------------------------
-- Records of qinggan_tag_stat
-- ----------------------------
INSERT INTO `qinggan_tag_stat` VALUES ('p43', '63');
INSERT INTO `qinggan_tag_stat` VALUES ('p43', '64');

-- ----------------------------
-- Table structure for qinggan_task
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_task`;
CREATE TABLE `qinggan_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `year` varchar(9) NOT NULL COMMENT '年份',
  `month` varchar(5) NOT NULL COMMENT '月',
  `day` varchar(5) NOT NULL COMMENT '日',
  `hour` varchar(5) NOT NULL COMMENT '时',
  `minute` varchar(5) NOT NULL COMMENT '分',
  `second` varchar(5) NOT NULL COMMENT '秒',
  `exec_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始执行时间',
  `stop_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `action` varchar(100) NOT NULL COMMENT '执行动作脚本',
  `param` varchar(255) NOT NULL COMMENT '参数',
  `only_once` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1表示仅执行一次',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未锁定1已锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='计划任务';

-- ----------------------------
-- Records of qinggan_task
-- ----------------------------
INSERT INTO `qinggan_task` VALUES ('15', '*', '*', '*', '*', '42', '*', '1495612654', '1495612654', 'expired', '', '0', '0');

-- ----------------------------
-- Table structure for qinggan_tpl
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_tpl`;
CREATE TABLE `qinggan_tpl` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(100) NOT NULL COMMENT '模板名称',
  `author` varchar(100) NOT NULL COMMENT '开发者名称',
  `folder` varchar(100) NOT NULL DEFAULT 'www' COMMENT '模板目录',
  `refresh_auto` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1自动判断更新刷新0不刷新',
  `refresh` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1强制刷新0普通刷新',
  `ext` varchar(20) NOT NULL DEFAULT 'html' COMMENT '后缀',
  `folder_change` varchar(255) NOT NULL COMMENT '更改目录',
  `phpfolder` varchar(200) NOT NULL COMMENT 'PHP执行文件目录',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='模板管理';

-- ----------------------------
-- Records of qinggan_tpl
-- ----------------------------
INSERT INTO `qinggan_tpl` VALUES ('1', '默认风格', 'phpok.com', 'www', '1', '0', 'html', 'css,images,js', 'phpinc');
INSERT INTO `qinggan_tpl` VALUES ('18', 'English', 'phpok.com', 'en', '1', '0', 'html', 'css,js,images', 'phpinc');

-- ----------------------------
-- Table structure for qinggan_user
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_user`;
CREATE TABLE `qinggan_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID，即会员ID',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主要会员组',
  `user` varchar(100) NOT NULL COMMENT '会员账号',
  `pass` varchar(100) NOT NULL COMMENT '会员密码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态ID，0未审核1正常2锁定',
  `regtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `email` varchar(200) NOT NULL COMMENT '邮箱，可用于取回密码',
  `mobile` varchar(50) NOT NULL COMMENT '手机或电话',
  `code` varchar(255) NOT NULL COMMENT '验证串，可用于取回密码',
  `avatar` varchar(255) NOT NULL COMMENT '会员头像',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='会员管理';

-- ----------------------------
-- Records of qinggan_user
-- ----------------------------
INSERT INTO `qinggan_user` VALUES ('23', '2', 'admin', 'e0ae361b631ce089a16f4a4c8cc8d033:5a', '1', '1438668082', '40782502@qq.com', '15818533971', '', 'res/201604/03/0143658fa7928c1c.jpg');
INSERT INTO `qinggan_user` VALUES ('24', '2', 'seika', '51e87180975db1b7c59a02b4b6bc3c99:3e', '1', '1439398782', 'admin@phpok.com', '15818533972', '', '');
INSERT INTO `qinggan_user` VALUES ('25', '2', 'demo', 'edd2f2aac34c1bb0c746876bfae9fbf8:ac', '1', '1469963807', 'demo@demo.com', '', '', '');
INSERT INTO `qinggan_user` VALUES ('26', '2', 'd2', 'defe12aad396f90e6b179c239de260d4:ab', '1', '1469963896', 'ddd@ddd.com', '', '', '');
INSERT INTO `qinggan_user` VALUES ('27', '2', 'suxiangkun', 'e8eb7ea7212ace80bbc98aa93a17904e:35', '1', '1470033757', 'suxiangkun@126.com', '', '', '');
INSERT INTO `qinggan_user` VALUES ('28', '2', '18928475010', '44e8f70e59e6b6a2472c241d351428a7:ed', '1', '1481105125', '', '18928475010', '8536-1481439164', '');
INSERT INTO `qinggan_user` VALUES ('29', '2', 'WX148480971245', 'a6c26f6a231a66b61b410d828f4ab454:03', '1', '1484809712', '', '', '', 'http://wx.qlogo.cn/mmopen/C5MIGaMvBHLg44Juo7PFGnV1Viavz6NnCQcO0UnN7tW6vXLnibFEWpSnoWrpwJnljrfibboQiaric4O8DV8iaNcng1uCjboibkmUXQz/0');

-- ----------------------------
-- Table structure for qinggan_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_user_ext`;
CREATE TABLE `qinggan_user_ext` (
  `id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `gender` varchar(255) NOT NULL DEFAULT '' COMMENT '性别',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员扩展字段';

-- ----------------------------
-- Records of qinggan_user_ext
-- ----------------------------
INSERT INTO `qinggan_user_ext` VALUES ('23', '苏相锟aa', '1', '');
INSERT INTO `qinggan_user_ext` VALUES ('0', 'demo', '', '');
INSERT INTO `qinggan_user_ext` VALUES ('24', '', '', '');
INSERT INTO `qinggan_user_ext` VALUES ('25', '', '', '');
INSERT INTO `qinggan_user_ext` VALUES ('26', '', '', '');
INSERT INTO `qinggan_user_ext` VALUES ('27', '', '', '');
INSERT INTO `qinggan_user_ext` VALUES ('28', '', '', '');
INSERT INTO `qinggan_user_ext` VALUES ('29', 'phpok.com-苏相锟', '1', '');

-- ----------------------------
-- Table structure for qinggan_user_fields
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_user_fields`;
CREATE TABLE `qinggan_user_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID，自增',
  `title` varchar(255) NOT NULL COMMENT '字段名称',
  `identifier` varchar(50) NOT NULL COMMENT '字段标识串',
  `field_type` varchar(255) NOT NULL DEFAULT '200' COMMENT '字段存储类型',
  `note` varchar(255) NOT NULL COMMENT '字段内容备注',
  `form_type` varchar(100) NOT NULL COMMENT '表单类型',
  `form_style` varchar(255) NOT NULL COMMENT '表单CSS',
  `format` varchar(100) NOT NULL COMMENT '格式化方式',
  `content` varchar(255) NOT NULL COMMENT '默认值',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `ext` text NOT NULL COMMENT '扩展内容',
  `is_edit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不可编辑1可编辑',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='字段管理器';

-- ----------------------------
-- Records of qinggan_user_fields
-- ----------------------------
INSERT INTO `qinggan_user_fields` VALUES ('21', '姓名', 'fullname', 'varchar', '', 'text', '', 'safe', '', '10', 'a:2:{s:8:\"form_btn\";b:0;s:5:\"width\";s:3:\"300\";}', '1');
INSERT INTO `qinggan_user_fields` VALUES ('22', '性别', 'gender', 'varchar', '', 'radio', '', 'safe', '', '120', 'a:3:{s:11:\"option_list\";s:5:\"opt:1\";s:9:\"put_order\";s:1:\"0\";s:10:\"ext_select\";b:0;}', '1');
INSERT INTO `qinggan_user_fields` VALUES ('23', '内容', 'content', 'longtext', '', 'editor', '', 'html', '', '255', 'a:12:{s:5:\"width\";s:3:\"900\";s:6:\"height\";s:3:\"360\";s:7:\"is_code\";s:0:\"\";s:9:\"btn_image\";s:1:\"1\";s:9:\"btn_video\";s:1:\"1\";s:8:\"btn_file\";s:1:\"1\";s:8:\"btn_page\";s:0:\"\";s:8:\"btn_info\";s:0:\"\";s:7:\"is_read\";s:0:\"\";s:5:\"etype\";s:4:\"full\";s:7:\"btn_map\";s:0:\"\";s:7:\"inc_tag\";s:0:\"\";}', '0');

-- ----------------------------
-- Table structure for qinggan_user_group
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_user_group`;
CREATE TABLE `qinggan_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员组ID',
  `title` varchar(255) NOT NULL COMMENT '会员组名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0不使用1使用',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1为会员注册默认组',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0' COMMENT '游客组',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1开放供用户选择，0不开放',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `register_status` varchar(100) NOT NULL COMMENT '1通过0审核email邮件code邀请码mobile手机',
  `tbl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '关联验证串项目',
  `fields` text NOT NULL COMMENT '会员字段，多个字段用英文逗号隔开',
  `popedom` longtext NOT NULL COMMENT '权限，包括读写及评论审核',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员组信息管理';

-- ----------------------------
-- Records of qinggan_user_group
-- ----------------------------
INSERT INTO `qinggan_user_group` VALUES ('2', '普通会员', '1', '1', '0', '0', '10', '', '0', '', 'a:2:{i:1;s:212:\"read:43,read:87,read:41,read:42,read:147,read:45,read:150,read:96,post:96,read:144,read:151,read:152,post:152,post1:152,reply:152,reply1:152,read:142,post:142,read:148,read:386,post:386,read:389,read:390,read:391\";i:33;s:57:\"read:384,post:384,reply:384,post1:384,reply1:384,read:385\";}');
INSERT INTO `qinggan_user_group` VALUES ('3', '游客组', '1', '0', '1', '0', '200', '', '0', '', 'a:2:{i:1;s:501:\"read:149,read:87,read:90,read:146,read:92,read:93,read:43,read:41,read:42,read:147,read:45,read:150,read:96,post:96,read:144,read:151,read:152,read:142,post:142,read:148,read:153,read:156,read:157,read:158,post:158,post1:158,read:159,read:160,post:160,reply:160,post1:160,reply1:160,read:161,post:161,reply:161,post1:161,reply1:161,read:162,post:162,reply:162,post1:162,reply1:162,read:163,read:164,post:164,reply:164,post1:164,reply1:164,read:165,read:166,read:386,post:386,read:389,read:390,read:391\";i:33;s:57:\"read:384,post:384,reply:384,post1:384,reply1:384,read:385\";}');

-- ----------------------------
-- Table structure for qinggan_user_relation
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_user_relation`;
CREATE TABLE `qinggan_user_relation` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `introducer` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '介绍人ID',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '介绍时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员介绍关系图';

-- ----------------------------
-- Records of qinggan_user_relation
-- ----------------------------
INSERT INTO `qinggan_user_relation` VALUES ('24', '23', '1439398782');
INSERT INTO `qinggan_user_relation` VALUES ('25', '23', '1469963807');
INSERT INTO `qinggan_user_relation` VALUES ('26', '24', '1469963896');

-- ----------------------------
-- Table structure for qinggan_wealth
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_wealth`;
CREATE TABLE `qinggan_wealth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '财富ID',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `title` varchar(100) NOT NULL COMMENT '财产名称',
  `identifier` varchar(100) NOT NULL COMMENT '标识，仅限英文字符',
  `unit` varchar(100) NOT NULL COMMENT '单位名称',
  `dnum` tinyint(1) NOT NULL DEFAULT '0' COMMENT '保留几位小数，为0表示只取整数',
  `ifpay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持充值',
  `pay_ratio` float unsigned NOT NULL DEFAULT '0' COMMENT '兑换比例，即1元可以兑换多少，为0不支持充值，为1表示1：1，不支持小数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不使用1使用',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序，0-255，越小越往前靠',
  `ifcash` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否抵现，即允许财富当现金使用',
  `cash_ratio` float unsigned NOT NULL DEFAULT '0' COMMENT '抵现比例，即100财富值可抵用多少元',
  `ifcheck` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核，为1时表示获取到的财富需要管理员审核后才行',
  `min_val` float unsigned NOT NULL DEFAULT '0' COMMENT '最低使用值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='财富类型';

-- ----------------------------
-- Records of qinggan_wealth
-- ----------------------------
INSERT INTO `qinggan_wealth` VALUES ('1', '1', '积分', 'integral', '点', '2', '0', '0', '1', '10', '1', '1', '0', '100');
INSERT INTO `qinggan_wealth` VALUES ('2', '1', '钱包', 'wallet', '元', '2', '1', '1', '1', '20', '1', '100', '1', '0');
INSERT INTO `qinggan_wealth` VALUES ('3', '1', '威望', 'prestige', '星', '0', '0', '0', '1', '20', '0', '0', '0', '0');
INSERT INTO `qinggan_wealth` VALUES ('5', '1', '红包', 'redbao', '个', '2', '0', '0', '1', '30', '1', '1', '0', '100');

-- ----------------------------
-- Table structure for qinggan_wealth_info
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_wealth_info`;
CREATE TABLE `qinggan_wealth_info` (
  `wid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '方案ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID或会员ID或分类ID或项目ID',
  `lasttime` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次更新时间',
  `val` float unsigned NOT NULL DEFAULT '0' COMMENT '最小财富为0，不考虑负数情况',
  PRIMARY KEY (`wid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='财富内容';

-- ----------------------------
-- Records of qinggan_wealth_info
-- ----------------------------
INSERT INTO `qinggan_wealth_info` VALUES ('1', '23', '1493627586', '496');
INSERT INTO `qinggan_wealth_info` VALUES ('1', '24', '1479890664', '2007.8');
INSERT INTO `qinggan_wealth_info` VALUES ('1', '25', '1470021972', '55');
INSERT INTO `qinggan_wealth_info` VALUES ('1', '0', '1469963896', '5');
INSERT INTO `qinggan_wealth_info` VALUES ('1', '26', '1476354571', '3338');
INSERT INTO `qinggan_wealth_info` VALUES ('1', '27', '1476354482', '3293');
INSERT INTO `qinggan_wealth_info` VALUES ('2', '23', '1480398064', '38');
INSERT INTO `qinggan_wealth_info` VALUES ('5', '23', '1480396889', '50');
INSERT INTO `qinggan_wealth_info` VALUES ('1', '28', '1481105324', '5');
INSERT INTO `qinggan_wealth_info` VALUES ('1', '29', '1484900526', '2');

-- ----------------------------
-- Table structure for qinggan_wealth_log
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_wealth_log`;
CREATE TABLE `qinggan_wealth_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `wid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '财富ID',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '规则ID',
  `goal_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '目标会员ID',
  `mid` varchar(100) NOT NULL COMMENT '主键ID关联',
  `val` int(11) NOT NULL DEFAULT '0' COMMENT '不带负号表示增加，带负号表示减去',
  `note` varchar(255) NOT NULL COMMENT '操作摘要',
  `appid` enum('admin','www','api') NOT NULL DEFAULT 'www' COMMENT '来自哪个接口',
  `dateline` int(11) NOT NULL DEFAULT '0' COMMENT '写入时间',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID，为0非会员',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID，为0非管理员',
  `ctrlid` varchar(100) NOT NULL COMMENT '控制器ID',
  `funcid` varchar(100) NOT NULL COMMENT '方法ID',
  `url` varchar(255) NOT NULL COMMENT '执行的URL',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未审核1已审核',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='财富获取或消耗日志';

-- ----------------------------
-- Records of qinggan_wealth_log
-- ----------------------------
INSERT INTO `qinggan_wealth_log` VALUES ('1', '1', '5', '23', '', '5', '会员登录', 'www', '1469445274', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('2', '1', '5', '24', '', '5', '会员登录', 'www', '1469445374', '24', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('3', '1', '5', '23', '', '5', '会员登录', 'www', '1469963756', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('4', '1', '2', '25', '', '50', '会员注册', 'api', '1469963807', '0', '1', 'register', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('5', '1', '4', '23', '', '20', '会员注册', 'api', '1469963807', '0', '1', 'register', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('6', '1', '16', '0', '', '10', '会员注册', 'api', '1469963807', '0', '1', 'register', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('7', '1', '17', '0', '', '5', '会员注册', 'api', '1469963807', '0', '1', 'register', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('8', '1', '5', '24', '', '5', '会员登录', 'www', '1469963859', '24', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('9', '1', '2', '26', '', '50', '会员注册', 'api', '1469963896', '0', '1', 'register', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('10', '1', '4', '24', '', '20', '会员注册', 'api', '1469963896', '0', '1', 'register', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('11', '1', '16', '23', '', '10', '会员注册', 'api', '1469963896', '0', '1', 'register', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('12', '1', '17', '0', '', '5', '会员注册', 'api', '1469963896', '0', '1', 'register', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('13', '1', '5', '25', '', '5', '会员登录', 'www', '1470021972', '25', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('14', '1', '5', '27', '', '5', '会员登录', 'www', '1470033786', '27', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('15', '1', '5', '23', '', '5', '会员登录', 'www', '1470033869', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('16', '1', '5', '23', '', '5', '会员登录', 'www', '1470103517', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('17', '2', '0', '23', '', '10', '管理员操作：充值测试', 'admin', '1470117181', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('18', '1', '5', '23', '', '5', '会员登录', 'www', '1470207495', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('19', '1', '5', '23', '', '5', '会员登录', 'www', '1470292107', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('20', '1', '5', '23', '', '5', '会员登录', 'www', '1471330852', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('21', '2', '0', '23', '', '-10', '财富抵现', 'www', '1471334587', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('22', '2', '0', '23', '', '10', '管理员操作：测试', 'admin', '1471334841', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('23', '2', '0', '23', '', '-10', '财富抵现', 'www', '1471334856', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('24', '2', '0', '23', '', '15', '管理员操作：充值', 'admin', '1471335089', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('25', '2', '0', '23', '', '-15', '财富抵现', 'www', '1471335103', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('26', '2', '0', '23', '', '11', '管理员操作：1111', 'admin', '1471335226', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('27', '2', '0', '23', '', '-11', '财富抵现', 'www', '1471335239', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('28', '1', '5', '23', '', '5', '会员登录', 'www', '1471405281', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('29', '1', '5', '23', '', '5', '会员登录', 'www', '1471592328', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('30', '1', '5', '23', '', '5', '会员登录', 'www', '1472782400', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('31', '1', '5', '23', '', '5', '会员登录', 'www', '1473056543', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('32', '1', '5', '23', '', '5', '会员登录', 'www', '1473130556', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('33', '1', '5', '23', '', '5', '会员登录', 'www', '1473299105', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('34', '1', '5', '23', '', '5', '会员登录', 'www', '1473553301', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('35', '1', '5', '23', '', '5', '会员登录', 'www', '1473660827', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('36', '1', '0', '23', '', '-105', '财富抵现', 'www', '1473660928', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('37', '1', '5', '23', '', '5', '会员登录', 'www', '1474273355', '23', '1', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('38', '1', '14', '23', '13', '0', '订单完成赚送积分', 'admin', '1476352896', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('39', '1', '14', '23', '14', '0', '订单完成赚送积分', 'admin', '1476354262', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('40', '1', '14', '23', '15', '0', '订单完成赚送积分', 'admin', '1476354313', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('41', '1', '14', '23', '16', '3288', '订单完成赚送积分', 'admin', '1476354424', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('42', '1', '14', '27', '17', '3288', '订单完成赚送积分', 'admin', '1476354482', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('43', '1', '14', '26', '18', '3288', '订单完成赚送积分', 'admin', '1476354571', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('44', '1', '18', '24', '18', '1973', '订单完成赚送积分', 'admin', '1476354571', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('45', '1', '19', '23', '18', '986', '订单完成赚送积分', 'admin', '1476354571', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('46', '1', '5', '23', '', '5', '会员登录', 'www', '1477989431', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('47', '1', '0', '23', '', '-4284', '财富抵现', 'www', '1477989527', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('48', '1', '5', '23', '', '5', '会员登录', 'api', '1479815656', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('49', '1', '5', '23', '', '5', '会员登录', 'api', '1479889514', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('50', '1', '5', '24', '', '5', '会员登录', 'api', '1479890664', '24', '0', 'login', 'email', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('51', '1', '5', '23', '', '5', '会员登录', 'www', '1479967659', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('52', '1', '5', '23', '', '5', '会员登录', 'www', '1480061079', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('53', '1', '5', '23', '', '5', '会员登录', 'www', '1480127150', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('54', '2', '0', '23', '', '100', '管理员操作：测试支付', 'admin', '1480128296', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('55', '1', '0', '23', '', '100', '管理员操作：赠送积分', 'admin', '1480128318', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('56', '1', '5', '23', '', '5', '会员登录', 'www', '1480214937', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('57', '5', '0', '23', '', '150', '管理员操作：测试', 'admin', '1480223010', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('58', '2', '0', '23', '', '-8', '支付订单：P2016091173U00023003', 'www', '1480247421', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('59', '1', '5', '23', '', '5', '会员登录', 'www', '1480312041', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('60', '1', '12', '23', '1760', '1', '阅读：魅族 MX5 移动联通双4G手机 双卡双待', 'www', '1480328563', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('61', '1', '12', '23', '1803', '1', '阅读：测试视频录入', 'www', '1480328634', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('62', '1', '13', '23', '1803', '5', '管理员审核评论：', 'admin', '1480328772', '0', '1', 'reply', 'status', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('63', '1', '12', '23', '1369', '1', '阅读：金山 WPS - 免费正版办公软件(支持Win/Linux/手机)', 'www', '1480329267', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('64', '1', '13', '23', '1369', '5', '管理员审核评论#40', 'admin', '1480329307', '0', '1', 'reply', 'status', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('65', '1', '12', '23', '1368', '1', '阅读：EverEdit - 值得关注的代码编辑器', 'www', '1480329320', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('66', '1', '13', '23', '1368', '5', '管理员编辑评论#41', 'admin', '1480329350', '0', '1', 'reply', 'edit_save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('67', '1', '15', '23', '1810', '10', '管理员编辑主题发布：测试留言', 'admin', '1480329586', '0', '1', 'list', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('68', '1', '5', '23', '', '5', '会员登录', 'www', '1480390470', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('69', '2', '0', '23', '', '-48', '支付订单：P2016112948U00023001', 'www', '1480395168', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('70', '1', '12', '23', '1763', '1', '阅读#1763', 'www', '1480395259', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('71', '1', '14', '23', '22', '48', '订单完成赚送积分', 'admin', '1480395292', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('72', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480395663', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('73', '1', '0', '23', '', '100', '管理员操作：误操作反还', 'admin', '1480395766', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('74', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480395980', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('75', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480396030', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('76', '5', '0', '23', '', '-100', '财富（红包）抵现', 'www', '1480396339', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('77', '1', '0', '23', '', '200', '管理员操作：测试返还', 'admin', '1480396497', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('78', '5', '0', '23', '', '300', '管理员操作：测试红包', 'admin', '1480396509', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('79', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480396550', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('80', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480396676', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('81', '5', '0', '23', '', '-100', '财富（红包）抵现', 'www', '1480396741', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('82', '5', '0', '23', '', '-100', '财富（红包）抵现', 'www', '1480396832', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('83', '5', '0', '23', '', '-100', '财富（红包）抵现', 'www', '1480396889', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('84', '1', '0', '23', '', '500', '管理员操作：de', 'admin', '1480396926', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('85', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480396966', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('86', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480397059', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('87', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480397786', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('88', '2', '0', '23', '', '-4', '支付订单：P2016112919U00023002', 'www', '1480397788', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('89', '1', '14', '23', '23', '3', '订单完成赚送积分', 'admin', '1480397929', '0', '1', 'order', 'end', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('90', '1', '12', '23', '1762', '1', '阅读#1762', 'www', '1480397939', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('91', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480397971', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('92', '1', '0', '23', '', '-100', '财富（积分）抵现', 'www', '1480398062', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('93', '2', '0', '23', '', '-2', '支付订单：P2016112970U00023003', 'www', '1480398064', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('94', '1', '13', '23', '1763', '5', '管理员审核评论#44', 'admin', '1480398899', '0', '1', 'reply', 'status', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('95', '1', '13', '23', '1762', '5', '管理员审核评论#43', 'admin', '1480398911', '0', '1', 'reply', 'status', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('96', '1', '0', '23', '', '500', '管理员操作：测试用的', 'admin', '1480400004', '0', '1', 'wealth', 'val', 'admin.php...', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('97', '1', '12', '23', '1348', '1', '阅读#1348', 'www', '1480401835', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('98', '1', '5', '23', '', '5', '会员登录', 'www', '1480502688', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('99', '1', '5', '23', '', '5', '会员登录', 'www', '1480581367', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('100', '1', '5', '23', '', '5', '会员登录', 'www', '1481082317', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('101', '1', '0', '23', '0', '-100', '财富（积分）抵现', 'www', '1481082923', '23', '0', 'payment', 'create', 'index.php', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('102', '1', '5', '28', '', '5', '会员登录', 'api', '1481105324', '28', '0', 'login', 'sms', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('103', '1', '5', '23', '', '5', '会员登录', 'api', '1481182216', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('104', '1', '5', '23', '', '5', '会员登录', 'www', '1483091256', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('105', '1', '5', '23', '', '5', '会员登录', 'api', '1483677612', '23', '0', 'login', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('106', '1', '12', '29', '1763', '1', '阅读#1763', 'www', '1484897052', '29', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('107', '1', '12', '29', '1756', '1', '阅读#1756', 'www', '1484900526', '29', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('108', '1', '5', '23', '', '5', '会员登录', 'www', '1486363410', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('109', '1', '5', '23', '', '5', '会员登录', 'api', '1487666948', '23', '0', 'login', 'save', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('110', '1', '12', '23', '1753', '1', '阅读#1753', 'www', '1487666977', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('111', '1', '5', '23', '', '5', '会员登录', 'www', '1491448424', '23', '0', 'login', 'ok', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('112', '1', '12', '23', '1810', '1', '阅读#1810', 'www', '1491448441', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('113', '1', '12', '23', '1809', '1', '阅读#1809', 'www', '1491448447', '23', '0', 'content', 'index', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('114', '1', '5', '23', '', '5', '会员登录', 'api', '1491821379', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('115', '1', '5', '23', '', '5', '会员登录', 'api', '1492072570', '23', '0', 'login', 'sms', '', '1');
INSERT INTO `qinggan_wealth_log` VALUES ('116', '1', '5', '23', '', '5', '会员登录', 'www', '1493627586', '23', '0', 'login', 'ok', '', '1');

-- ----------------------------
-- Table structure for qinggan_wealth_rule
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_wealth_rule`;
CREATE TABLE `qinggan_wealth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `wid` int(10) unsigned NOT NULL COMMENT '财产ID',
  `action` varchar(255) NOT NULL COMMENT '触发动作',
  `val` varchar(255) NOT NULL DEFAULT '0' COMMENT '值，负值表示减，大于0表示加，支持计算如price*2',
  `goal` varchar(255) NOT NULL DEFAULT 'user' COMMENT '目标类型user用户，agent1一级代理',
  `taxis` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='财富生成规则';

-- ----------------------------
-- Records of qinggan_wealth_rule
-- ----------------------------
INSERT INTO `qinggan_wealth_rule` VALUES ('4', '1', 'register', '20', 'introducer', '20');
INSERT INTO `qinggan_wealth_rule` VALUES ('2', '1', 'register', '50', 'user', '10');
INSERT INTO `qinggan_wealth_rule` VALUES ('5', '1', 'login', '5', 'user', '30');
INSERT INTO `qinggan_wealth_rule` VALUES ('12', '1', 'content', '1', 'user', '40');
INSERT INTO `qinggan_wealth_rule` VALUES ('13', '1', 'comment', '5', 'user', '50');
INSERT INTO `qinggan_wealth_rule` VALUES ('14', '1', 'payment', 'price', 'user', '60');
INSERT INTO `qinggan_wealth_rule` VALUES ('15', '1', 'post', '10', 'user', '70');
INSERT INTO `qinggan_wealth_rule` VALUES ('16', '1', 'register', '10', 'introducer2', '25');
INSERT INTO `qinggan_wealth_rule` VALUES ('17', '1', 'register', '5', 'introducer3', '28');
INSERT INTO `qinggan_wealth_rule` VALUES ('18', '1', 'payment', 'price*0.6', 'introducer', '62');
INSERT INTO `qinggan_wealth_rule` VALUES ('19', '1', 'payment', 'price*0.3', 'introducer2', '65');
INSERT INTO `qinggan_wealth_rule` VALUES ('20', '1', 'payment', 'price*0.1', 'introducer3', '68');

-- ----------------------------
-- Table structure for qinggan_workflow
-- ----------------------------
DROP TABLE IF EXISTS `qinggan_workflow`;
CREATE TABLE `qinggan_workflow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '指派谁来管理的管理员ID',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_end` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否结束',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `note` varchar(255) NOT NULL,
  `actting` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1正在操作处理中',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='工作流处理';

-- ----------------------------
-- Records of qinggan_workflow
-- ----------------------------
