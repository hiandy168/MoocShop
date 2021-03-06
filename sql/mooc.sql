-- 创建后台用户登录表
DROP TABLE IF EXISTS shop_admin;
CREATE TABLE IF NOT EXISTS shop_admin(
  adminid INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  adminuser VARCHAR(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
  adminpass CHAR(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  adminemail VARCHAR(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  logintime INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录时间',
  loginip BIGINT NOT NULL DEFAULT  '0' COMMENT '登录IP',
  createtime INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY(adminid),
  UNIQUE shop_admin_adminuser_adminpass(adminuser,adminpass),
  UNIQUE shop_admin_adminuser_adminemail(adminuser,adminemail)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

--插入数据
INSERT INTO shop_admin(adminuser,adminpass,adminemail,createtime)values('admin',md5('123456'),'admin@imooc.com',UNIX_TIMESTAMP());

-- 前台用户表(主表)
DROP TABLE IF EXISTS shop_user;
CREATE TABLE IF NOT EXISTS shop_user(
  userid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  username VARCHAR(32) NOT NULL DEFAULT '' COMMENT '用户名',
  userpass VARCHAR(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  useremail VARCHAR(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  createtime INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  UNIQUE shop_user_username_userpass(username,userpass),
  UNIQUE shop_user_useremail_userpass(useremail,userpass),
  PRIMARY KEY(userid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 前台用户表(附表),这样就能降低搜索的体积
CREATE TABLE `shop_profile` (
 `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `truename` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
 `age` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
 `sex` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '性别',
 `birthday` date NOT NULL DEFAULT '2016-01-01' COMMENT '生日',
 `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
 `company` varchar(100) NOT NULL DEFAULT '' COMMENT '公司',
 `userid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
 `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
 PRIMARY KEY (`id`),
 UNIQUE KEY `shop_profile_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 无限分类的表 (2017-03-20)
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE IF NOT EXISTS `shop_category`(
  `cateid` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(32) NOT NULL DEFAULT '',
  `parentid` BIGINT UNSIGNED NOT NULL DEFAULT '0',
  `createtime` INT UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY(`cateid`),
  KEY shop_category_parentid(`parentid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--创建商品表
DROP TABLE IF EXISTS `shop_product`;
CREATE TABLE IF NOT EXISTS `shop_product`(
    `productid` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `cateid` BIGINT UNSIGNED NOT NULL DEFAULT '0',
    `title` VARCHAR(200) NOT NULL DEFAULT '',
    `descr` TEXT,
    `num` BIGINT UNSIGNED NOT NULL DEFAULT '0',
    `price` DECIMAL(10,2) NOT NULL DEFAULT '00000000.00',
    `cover` VARCHAR(200) NOT NULL DEFAULT '',
    `pics` TEXT,
    `issale` ENUM('0','1') NOT NULL DEFAULT '0',
    `saleprice` DECIMAL(10,2) NOT NULL DEFAULT '00000000.00',
    `ishot` ENUM('0','1') NOT NULL DEFAULT '0',
    `createtime` INT UNSIGNED NOT NULL DEFAULT '0',
    PRIMARY KEY(`productid`),
    KEY shop_product_cateid(`cateid`)
)ENGINE = INNODB DEFAULT CHARSET = utf8;

--为商品表添加两个字段--
ALTER TABLE `shop_product`
-- 商品是否热销 --
ADD `ison` ENUM('0','1') NOT NULL DEFAULT '0' AFTER `ishot`,
-- 商品是否上下架 --
ADD `istui` ENUM('0','1') NOT NULL DEFAULT '0' AFTER `ison`;

-- 购物车的内容 --
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE IF NOT EXISTS `shop_cart`(
    `cartid` bigint unsigned not  null auto_increment,
    `productid` bigint unsigned not null default '0',
    `productnum` int(10) unsigned null default '0',
    `price` decimal(10,2) not null default '0.00',
    `userid` bigint unsigned not null default '0',
    `createtime` int(10) unsigned not null default '0',
    primary key(`cartid`),
    key shop_cart_productid (`productid`),
    key shop_cart_userid(`userid`)
)ENGINE = INNODB DEFAULT CHARSET = utf8;

-- 订单表设计 --
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE IF NOT EXISTS `shop_order`(
    `orderid` bigint unsigned not null auto_increment primary key comment '订单ID',
    `userid` bigint unsigned not null default '0' comment '用户ID',
    `addressid` bigint unsigned not null default '0',
    `amount` decimal(10,2) not null default '0.00',
    `status` int unsigned not null default '0',
    `expressid` int unsigned not null default '0',
    `expressno` varchar(50) not null default '' comment '邮递的快递单号',
    `createtime` int unsigned not null default '0',
    `updatetime` timestamp not null default current_timestamp on update current_timestamp,
    key shop_order_userid(`userid`),
    key shop_order_addressid(`addressid`),
    key shop_order_expressid(`expressid`)
)ENGINE = INNODB DEFAULT CHARSET = utf8;

-- 订单详情表设计 --
DROP TABLE IF EXISTS `shop_order_detail`;
CREATE TABLE IF NOT EXISTS `shop_order_detail`(
    `detailid` BIGINT unsigned NOT NULL auto_increment primary key,
    `productid` bigint unsigned not null default '0',
    `price` decimal(10,2) not null default '0.00',
    `productnum` int unsigned not null default '0',
    `orderid` bigint unsigned not null default '0',
    `createtime` int unsigned not null default '0',
    key `shop_order_detail_productid`(`productid`),
    key `shop_order_detail_orderid`(`orderid`)
)ENGINE = INNODB DEFAULT CHARSET = utf8;

-- 地址详情表设计 --
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE IF NOT EXISTS `shop_address`(
    `addressid` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(32) NOT NULL DEFAULT '',
    `lastname` VARCHAR(32) NOT NULL DEFAULT '',
    `company` VARCHAR(100) NOT NULL DEFAULT '',
    `address` TEXT,
    `postcode` CHAR(6) NOT NULL DEFAULT '',
    `email` VARCHAR(100) NOT NULL DEFAULT '',
    `telephone` VARCHAR(20) NOT NULL DEFAULT '',
    `userid` BIGINT UNSIGNED NOT NULL DEFAULT '0',
    `createtime` INT UNSIGNED NOT NULL DEFAULT '0',
    KEY `shop_address_userid`(`userid`)
)ENGINE = INNODB DEFAULT CHARSET = utf8;

-- 为用户表授权添加user表字段，用作保存openid --
ALTER TABLE `shop_user` ADD `openid` VARCHAR(100) NULL AFTER `username`;