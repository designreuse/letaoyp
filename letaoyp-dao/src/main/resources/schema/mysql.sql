-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: letaoyp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertise`
--

DROP TABLE IF EXISTS `advertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块',
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告图片',
  `text` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '广告内容',
  `link` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `index` bigint(20) DEFAULT NULL COMMENT '索引值或者业务ID',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `active` bit(1) DEFAULT b'1' COMMENT '状态',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `full_name` longtext NOT NULL COMMENT '全名',
  `name` varchar(100) NOT NULL COMMENT '地名',
  `tree_path` varchar(255) NOT NULL COMMENT '树路径',
  `parent` bigint(20) DEFAULT NULL COMMENT '父节点',
  `active` bit(1) DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3317 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL COMMENT '降序 越大越靠前',
  `introduction` longtext COLLATE utf8mb4_unicode_ci,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand_category`
--

DROP TABLE IF EXISTS `brand_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand` bigint(20) NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` bigint(20) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_BRAND_CATEGORY_BRAND` (`brand`),
  KEY `FK_BRAND_CATEGORY_CATEGORY` (`category`),
  CONSTRAINT `FK_BRAND_CATEGORY_BRAND` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK_BRAND_CATEGORY_CATEGORY` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购物车唯一编码 未注册用户也可体验购物车功能',
  `member` bigint(20) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CART_MEMBER` (`member`),
  CONSTRAINT `FK_CART_MEMBER` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `cart` bigint(20) NOT NULL,
  `goods` bigint(20) NOT NULL,
  `choosen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '选择条件ID集合',
  `choosen_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '选择条件描述 name:value json串',
  `price` bigint(20) NOT NULL DEFAULT '0' COMMENT 'goods.salesPrice + choosen.cost',
  `active` bit(1) DEFAULT b'1' COMMENT '是否有效，可恢复购物车物件',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cart_item_cart` (`cart`),
  KEY `FK_cart_item_goods` (`goods`),
  CONSTRAINT `FK_cart_item_cart` FOREIGN KEY (`cart`) REFERENCES `cart` (`id`),
  CONSTRAINT `FK_cart_item_goods` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='购物车item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL COMMENT '降序排列',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tree_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tree_name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) DEFAULT '0',
  `is_leaf` bit(1) DEFAULT b'1',
  `level` int(2) DEFAULT '1' COMMENT '层级',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `top` bit(1) DEFAULT b'0' COMMENT '是否置顶至首页',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类目logo',
  `active` bit(1) DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_category_parent` (`parent`),
  CONSTRAINT `FK_category_parent` FOREIGN KEY (`parent`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'OFFLINE' COMMENT '上架 下架',
  `shipping_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_hits` bigint(20) NOT NULL DEFAULT '0',
  `hits` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击数',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品图标 取上传图片的第一张',
  `sales_price` bigint(20) NOT NULL DEFAULT '0' COMMENT '销售价',
  `market_price` bigint(20) NOT NULL DEFAULT '0' COMMENT '市场价',
  `cost` bigint(20) NOT NULL DEFAULT '0' COMMENT '成本价',
  `brand` bigint(20) DEFAULT NULL COMMENT '品牌',
  `star` int(1) NOT NULL DEFAULT '4' COMMENT '星级',
  `weight` int(11) DEFAULT '0' COMMENT '重量',
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '克' COMMENT 'unit描述',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `property` longtext COLLATE utf8mb4_unicode_ci COMMENT '键值对属性',
  `category` bigint(20) NOT NULL,
  `comments` int(10) NOT NULL DEFAULT '0' COMMENT '评论数',
  `online_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_GOODS_CATEGORY` (`category`),
  KEY `FK_GOODS_BRAND` (`brand`),
  CONSTRAINT `FK_GOODS_BRAND` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK_GOODS_CATEGORY` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_choosen`
--

DROP TABLE IF EXISTS `goods_choosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_choosen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '选择条件名称 eg: 尺码',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '选择条件值 eg: S M L XL',
  `cost` bigint(20) DEFAULT '0' COMMENT '选择该条件后 额外需要支付价格',
  `active` bit(1) DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_GOODS_CHOOSEN_GOODS` (`goods`),
  CONSTRAINT `FK_GOODS_CHOOSEN_GOODS` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品选择条件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_choosen_template`
--

DROP TABLE IF EXISTS `goods_choosen_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_choosen_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模板名',
  `brand` bigint(20) DEFAULT NULL COMMENT '品牌',
  `active` bit(1) DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_GOODS_CHOOSEN_TEMPLATE_CATEGORY` (`category`),
  KEY `FK_GOODS_CHOOSEN_TEMPLATE_BRAND` (`brand`),
  CONSTRAINT `FK_GOODS_CHOOSEN_TEMPLATE_BRAND` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK_GOODS_CHOOSEN_TEMPLATE_CATEGORY` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品选择条件模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_image`
--

DROP TABLE IF EXISTS `goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT '0' COMMENT '降序排列',
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `goods` bigint(20) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_goods_image_goods` (`goods`),
  CONSTRAINT `FK_goods_image_goods` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品图库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_top`
--

DROP TABLE IF EXISTS `goods_top`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_top` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods` bigint(20) NOT NULL,
  `category` bigint(20) NOT NULL COMMENT 'goods一级类目',
  `goods_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_price` bigint(20) DEFAULT '0' COMMENT '销售价',
  `market_price` bigint(20) DEFAULT '0' COMMENT '市场价',
  `comments` int(10) NOT NULL DEFAULT '0' COMMENT '评论数',
  `top_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HOME_SLIDE' COMMENT '置顶位置 HOME_SLIDE首页滑动大图(785*368); HOME_VERTICAL首页垂直中图(242*184);HOME_HORIZONTAL首页水平平铺商品图(310*310)',
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_GOODS_TOP_CATEGORY` (`category`),
  KEY `FK_GOODS_TOP_GOODS` (`goods`),
  CONSTRAINT `FK_GOODS_TOP_CATEGORY` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_GOODS_TOP_GOODS` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hot_key`
--

DROP TABLE IF EXISTS `hot_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hot_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `times` int(10) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `active` bit(1) DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='热词';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci,
  `model` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ANNOUNCEMENT 公告; HELP 帮助',
  `top` bit(1) DEFAULT b'0',
  `top_image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公告|帮助';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加密salt',
  `area` bigint(20) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `birth` datetime DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` bit(1) NOT NULL DEFAULT b'0',
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
  `nick` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `register_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_member_area` (`area`),
  CONSTRAINT `fk_member_area` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` bigint(20) DEFAULT NULL,
  `consignee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人',
  `expire` datetime DEFAULT NULL,
  `amount` bigint(20) NOT NULL COMMENT '货品金额',
  `freight` bigint(20) NOT NULL COMMENT '运费',
  `tax` bigint(20) NOT NULL COMMENT '税金',
  `offset_amount` bigint(20) NOT NULL COMMENT '调整金额',
  `fee` bigint(20) NOT NULL COMMENT '支付金额',
  `is_invoice` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否开具发票',
  `invoice_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发票抬头',
  `is_allocated_stock` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已分配库存',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附言',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单状态',
  `channel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付渠道',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易编号',
  `out_trade_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外部（支付系统）交易标号',
  `coupon_code` bigint(20) DEFAULT NULL,
  `member` bigint(20) NOT NULL,
  `operator` bigint(20) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trade_no` (`trade_no`),
  KEY `FK_ORDER_AREA` (`area`),
  KEY `FK_ORDER_MEMBER` (`member`),
  KEY `FK_ORDER_OPERATOR` (`operator`),
  CONSTRAINT `FK_ORDER_AREA` FOREIGN KEY (`area`) REFERENCES `area` (`id`),
  CONSTRAINT `FK_ORDER_MEMBER` FOREIGN KEY (`member`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_ORDER_OPERATOR` FOREIGN KEY (`operator`) REFERENCES `s_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `price` bigint(20) NOT NULL COMMENT '价格',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品缩略图',
  `weight` int(11) DEFAULT NULL COMMENT '重量',
  `order` bigint(20) NOT NULL COMMENT '订单',
  `goods` bigint(20) NOT NULL COMMENT '商品',
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_ORDER_ITEM_ORDER` (`order`),
  KEY `FK_ORDER_ITEM_GOODS` (`goods`),
  CONSTRAINT `FK_ORDER_ITEM_GOODS` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_ORDER_ITEM_ORDER` FOREIGN KEY (`order`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单物品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_account`
--

DROP TABLE IF EXISTS `s_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `login_name` varchar(64) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(64) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_account_role`
--

DROP TABLE IF EXISTS `s_account_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_account_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` bigint(20) NOT NULL,
  `account` bigint(20) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_UR_USER` (`account`),
  KEY `FK_UR_ROLE` (`role`),
  CONSTRAINT `FK_UR_ACCOUNT` FOREIGN KEY (`account`) REFERENCES `s_account` (`id`),
  CONSTRAINT `FK_UR_ROLE` FOREIGN KEY (`role`) REFERENCES `s_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_dict`
--

DROP TABLE IF EXISTS `s_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(256) NOT NULL COMMENT '描述',
  `sort` int(5) NOT NULL COMMENT '排序（升序）',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_log`
--

DROP TABLE IF EXISTS `s_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(64) DEFAULT NULL COMMENT '日志类型',
  `content` varchar(512) DEFAULT NULL COMMENT '日志内容',
  `remote_addr` varchar(64) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(256) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(256) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` varchar(256) DEFAULT NULL COMMENT '参数',
  `exception` text COMMENT '异常信息',
  `creator` varchar(64) DEFAULT NULL COMMENT '创建者',
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_menu`
--

DROP TABLE IF EXISTS `s_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL COMMENT 'parent referce on menu(id) which 0 is root menu',
  `sort` int(5) DEFAULT NULL COMMENT 'desc',
  `link` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_permission`
--

DROP TABLE IF EXISTS `s_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `menu` bigint(20) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_role`
--

DROP TABLE IF EXISTS `s_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_role_permission`
--

DROP TABLE IF EXISTS `s_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` bigint(20) NOT NULL,
  `permission` bigint(20) NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RP_ROLE` (`role`),
  KEY `FK_RP_PERMISSION` (`permission`),
  CONSTRAINT `FK_RP_PERMISSION` FOREIGN KEY (`permission`) REFERENCES `s_permission` (`id`),
  CONSTRAINT `FK_RP_ROLE` FOREIGN KEY (`role`) REFERENCES `s_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member` bigint(20) DEFAULT NULL,
  `area` bigint(20) DEFAULT NULL,
  `receiver` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
  `buliding_flag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标志建筑',
  `email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receive_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预约送货时间',
  `active` bit(1) DEFAULT b'1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SHIIPING_ADDRESS_AREA` (`area`),
  KEY `FK_SHIPPING_ADDRESS_MEMBER` (`member`),
  CONSTRAINT `FK_SHIIPING_ADDRESS_AREA` FOREIGN KEY (`area`) REFERENCES `area` (`id`),
  CONSTRAINT `FK_SHIPPING_ADDRESS_MEMBER` FOREIGN KEY (`member`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收货地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visit_history`
--

DROP TABLE IF EXISTS `visit_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods` bigint(20) DEFAULT NULL,
  `goods_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_visit_history_goods` (`goods`),
  CONSTRAINT `FK_visit_history_goods` FOREIGN KEY (`goods`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='浏览历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'letaoyp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-30  1:33:26
