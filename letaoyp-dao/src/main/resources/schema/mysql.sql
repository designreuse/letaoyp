drop table if exists `s_account_role`;
drop table if exists `s_account`;
drop table if exists `s_role_permission`;
drop table if exists `s_permission`;
drop table if exists `s_menu`;
drop table if exists `s_role`;
drop table if exists `s_dict`;
drop table if exists `s_log`;

CREATE TABLE `s_account` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `login_name` varchar(64) not null unique,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(64) not null,
  `active` bit(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '用户表';

CREATE TABLE `s_menu` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(64) not null unique,
  `description` varchar(255) NOT NULL,
  `icon` varchar(64),
  `parent` bigint(20) comment 'parent referce on menu(id) which 0 is root menu',
  `sort` int(5) comment 'desc',
  `link` varchar(255),
  `permission` varchar(255),
  `active` bit(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '资源表';

CREATE TABLE `s_permission` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `menu` bigint(20),
  `active` bit(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '权限表';


###############
# DEFAULT permission
# menu : /admin/user  required permission user:view  OR required role admin | userAdmin
# permission : user:view user:edit
# role : admin | userAdmin
#
# add menu and permission
# menu : /admin/dict  required permission dict:view
# logic : Add one menu , at the same time add 2 default permissions with MENU:* MENU:view
###############

CREATE TABLE `s_role` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 comment '角色表';


CREATE TABLE `s_role_permission` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `role` bigint(20) NOT NULL,
  `permission` bigint(20) NOT NULL,
  `active` bit(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  KEY `FK_RP_ROLE` (`role`),
  KEY `FK_RP_PERMISSION` (`permission`),
  CONSTRAINT `FK_RP_ROLE` FOREIGN KEY (`role`) REFERENCES `s_role` (`id`),
  CONSTRAINT `FK_RP_PERMISSION` FOREIGN KEY (`permission`) REFERENCES `s_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 comment '角色权限表';


CREATE TABLE `s_account_role` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `role` bigint(20) NOT NULL,
  `account` bigint(20) NOT NULL,
  `active` bit(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  KEY `FK_UR_USER` (`account`),
  KEY `FK_UR_ROLE` (`role`),
  CONSTRAINT `FK_UR_ACCOUNT` FOREIGN KEY (`account`) REFERENCES `s_account` (`id`),
  CONSTRAINT `FK_UR_ROLE` FOREIGN KEY (`role`) REFERENCES `s_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '用户角色表';


CREATE TABLE `s_dict` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(256) NOT NULL COMMENT '描述',
  `sort` int(5) NOT NULL COMMENT '排序（升序）',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `active` bit(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';


CREATE TABLE `s_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(64) COMMENT '日志类型',
  `content` varchar(512) comment '日志内容',
  `remote_addr` varchar(64) COMMENT '操作IP地址',
  `user_agent` varchar(256) COMMENT '用户代理',
  `request_uri` varchar(256) COMMENT '请求URI',
  `method` varchar(5) COMMENT '操作方式',
  `params` varchar(256) COMMENT '参数',
  `exception` text COMMENT '异常信息',
  `creator` varchar(64) COMMENT '创建者',
  `active` bit(1) DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=656 DEFAULT CHARSET=utf8mb4 COMMENT='日志表';



CREATE TABLE `area` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `active` bit(1) default b'1',
  `orders` int(11) DEFAULT NULL,
  `full_name` longtext NOT NULL,
  `name` varchar(100) NOT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL
);


CREATE TABLE `member` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `active` bit(1) default b'1',
  `username` varchar(64) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `salt` varchar(64) comment '加密salt',
  `area` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL comment '详细地址',
  `birth` datetime DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `is_locked` bit(1) NOT NULL default 0,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `mobile`	varchar(20) NOT NULL comment '电话',
  `phone`   varchar(20) comment '手机',
  `nick` varchar(255) DEFAULT NULL,
  `register_ip` varchar(255) NOT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `attribute_value0` varchar(255) DEFAULT NULL,
  `attribute_value1` varchar(255) DEFAULT NULL,
  `attribute_value2` varchar(255) DEFAULT NULL,
  `attribute_value3` varchar(255) DEFAULT NULL,
  `attribute_value4` varchar(255) DEFAULT NULL,
  `attribute_value5` varchar(255) DEFAULT NULL,
  `attribute_value6` varchar(255) DEFAULT NULL,
  `attribute_value7` varchar(255) DEFAULT NULL,
  `attribute_value8` varchar(255) DEFAULT NULL,
  `attribute_value9` varchar(255) DEFAULT NULL,
  CONSTRAINT `fk_member_area` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) comment '人员表';


create table shipping_address(
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `active` bit(1) default b'1',
  `member` bigint(20),
  `area` bigint(20),
  `receiver` varchar(64) comment '收货人',
  `address` varchar(255) comment '详细地址',
  `mobile`	varchar(20) NOT NULL comment '电话',
  `phone`   varchar(20) comment '手机',
  `buliding_flag` varchar(255) comment '标志建筑',
  `email` varchar(64),
  `zip_code` varchar(255) DEFAULT NULL,
  `receive_time` varchar(255) comment '预约送货时间',
  CONSTRAINT `FK_SHIIPING_ADDRESS_AREA` FOREIGN KEY (`area`) REFERENCES `area` (`id`),
  constraint `FK_SHIPPING_ADDRESS_MEMBER` foreign key(`member`) references `member`(`id`)
) comment '收货地址';


CREATE TABLE `cart` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  
  `cart_key` varchar(255) NOT NULL comment '购物车唯一编码 未注册用户也可体验购物车功能',
  `member` bigint(20) DEFAULT NULL,
  CONSTRAINT `FK_CART_MEMBER` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) comment '购物车';



CREATE TABLE `category` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `active` bit(1) default b'1',
  `order` int(11) DEFAULT NULL comment '降序排列',
  `name` varchar(255) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  CONSTRAINT `FK_category_parent` FOREIGN KEY (`parent`) REFERENCES `category` (`id`)
) comment '类目';


CREATE TABLE `brand` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `order` int(11) DEFAULT NULL comment '降序 越大越靠前',
  `introduction` longtext,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL
) comment '品牌';


CREATE TABLE `goods` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `status` varchar(20) comment '未上架 已上架 已下架',
  `shipping_date` timestamp comment '上架时间',
  `name` varchar(255) NOT NULL,
  `base_hits` bigint(20) not null default 0,
  `hits` bigint(20) NOT NULL default 0 comment '点击数',
  `image` varchar(255) DEFAULT NULL comment '商品图标 取上传图片的第一张',
  `sales_price` bigint(20) DEFAULT 0 comment '销售价',
  `market_price` bigint(20) DEFAULT 0 comment '市场价',
  `cost`  bigint(20)	default 0 comment '成本价',
  `brand` bigint(20) DEFAULT NULL comment '品牌',
  `star` int(1)	 default 4 comment '星级',
  `weight` int(11) DEFAULT 0 comment '重量',
  `unit` varchar(20) comment 'unit描述',
  `description` longtext,
  `property` longtext comment '键值对属性',
  `category` bigint(20) NOT NULL,
  CONSTRAINT `FK_GOODS_CATEGORY` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_GOODS_BRAND` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`)
) comment '商品';


CREATE TABLE `cart_item` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `active` bit(1) default b'1' comment '是否有效，可恢复购物车物件',
  `quantity` int(11) NOT NULL default 1 comment '数量',
  `cart` bigint(20) NOT NULL,
  `goods` bigint(20) NOT NULL,
  CONSTRAINT `FK_cart_item_cart` FOREIGN KEY (`cart`) REFERENCES `cart` (`id`),
  CONSTRAINT `FK_cart_item_goods` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`)
) comment '购物车item';


create table `goods_choosen` (
  `id` bigint(20) primary key auto_increment,
  `created` timestamp not null,
  `modified` timestamp,
  `active` bit(1) DEFAULT b'1',
  `goods` bigint(20),
  `name` varchar(255)	comment '选择条件名称 eg: 尺码',	
  `value` varchar(255) comment '选择条件值 eg: S M L XL',
  `cost` bigint(20) default 0 comment '选择该条件后 额外需要支付价格',
  CONSTRAINT `FK_GOODS_CHOOSEN_GOODS` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`)
) comment '商品选择条件';


create table `goods_choosen_template` (
  `id` bigint(20) primary key auto_increment,
  `created` timestamp not null,
  `modified` timestamp,
  `category` bigint(20),
  `name` varchar(255)	comment '模板名',
  `brand` bigint(20) comment '品牌',
  CONSTRAINT `FK_GOODS_CHOOSEN_TEMPLATE_CATEGORY` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_GOODS_CHOOSEN_TEMPLATE_BRAND` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`)
) comment '商品选择条件模板';





create table `hot_key` (
	`id` bigint(20) primary key auto_increment,
    `created` timestamp not null,
    `modified` timestamp,
    `active` bit(1) DEFAULT b'1',
    `key`	varchar(125) not null,
    `times`	int(10) default 0 not null comment '搜索次数'
) comment '热词';

create table `visit_history` (
	`id` bigint(20) primary key auto_increment,
    `created` timestamp not null,
    `modified` timestamp,
    `goods` bigint(20),
    `goods_name` varchar(256),
    CONSTRAINT `FK_visit_history_goods` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`)
) comment '浏览历史';

create table `advertise` (
	`id` bigint(20) primary key auto_increment,
    `created` timestamp not null,
    `modified` timestamp,
    `active` bit(1) DEFAULT b'1',
    `model`	varchar(25)	comment 'HOME',
    `image` varchar(256) not null,
    `text` 	varchar(256),
    `link` 	varchar(256)
);


create  table `information`  (
	`id` bigint(20) primary key auto_increment,
    `created` timestamp not null,
    `modified` timestamp,
    `active` bit(1) DEFAULT b'1',
    `title` varchar(50),
    `description` varchar(256),
    `detail` longtext,
    `model`	 varchar(20) comment 'ANNOUNCEMENT 公告; HELP 帮助',
    `top`	bit(1) default b'0',
    `top_image` varchar(256)
) comment '公告|帮助';


