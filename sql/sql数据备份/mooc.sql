-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Table structure for table `shop_address`
--

DROP TABLE IF EXISTS `shop_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_address` (
  `addressid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `address` text,
  `postcode` char(6) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`addressid`),
  KEY `shop_address_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_address`
--

LOCK TABLES `shop_address` WRITE;
/*!40000 ALTER TABLE `shop_address` DISABLE KEYS */;
INSERT INTO `shop_address` VALUES (2,'闄?,'姹熸渤','骞垮窞甯傝崝婀惧尯瑁曠敵绉戞妧鏈夐檺鍏徃','骞夸笢鐪佸箍宸炲競鑽旀咕鍖哄潙鍙ｇ綏鍐插矖3鍙?,'510131','zhaojt_cs@126.com','020-88891234',1,0),(3,'闄?,'澶у厜','骞垮窞瑁曠敵鐢靛瓙绉戞妧鏈夐檺鍏徃','骞夸笢鐪佸箍宸炲競鑽旀咕鍖哄潙鍙ｇ綏鍐插矖4鍙?,'510131','zhaojt_exam@126.com','020-88894321',1,0);
/*!40000 ALTER TABLE `shop_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_admin`
--

DROP TABLE IF EXISTS `shop_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_admin` (
  `adminid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `adminuser` varchar(32) NOT NULL DEFAULT '' COMMENT '绠＄悊鍛樿处鍙?,
  `adminpass` char(32) NOT NULL DEFAULT '' COMMENT '绠＄悊鍛樺瘑鐮?,
  `adminemail` varchar(50) NOT NULL DEFAULT '' COMMENT '绠＄悊鍛樼數瀛愰偖绠?,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鐧诲綍鏃堕棿',
  `loginip` bigint(20) NOT NULL DEFAULT '0' COMMENT '鐧诲綍IP',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `shop_admin_adminuser_adminpass` (`adminuser`,`adminpass`),
  UNIQUE KEY `shop_admin_adminuser_adminemail` (`adminuser`,`adminemail`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_admin`
--

LOCK TABLES `shop_admin` WRITE;
/*!40000 ALTER TABLE `shop_admin` DISABLE KEYS */;
INSERT INTO `shop_admin` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','zhaojt_exam@126.com',1494924950,0,1489219525),(2,'zhangsan','e10adc3949ba59abbe56e057f20f883e','xyq418454@163.com',0,0,0),(3,'lisi','e10adc3949ba59abbe56e057f20f883e','xyq418455@163.com',0,0,0),(4,'lisi1','e10adc3949ba59abbe56e057f20f883e','xyq418456@163.com',0,0,0),(5,'lisi2','e10adc3949ba59abbe56e057f20f883e','xyq418457@163.com',0,0,0),(6,'lisi3','e10adc3949ba59abbe56e057f20f883e','xyq418458@163.com',0,0,0),(7,'lisi4','e10adc3949ba59abbe56e057f20f883e','xyq418459@163.com',0,0,0),(8,'lisi5','e10adc3949ba59abbe56e057f20f883e','xyq418460@163.com',0,0,0),(9,'lisi6','e10adc3949ba59abbe56e057f20f883e','xyq418461@163.com',0,0,0),(10,'lisi7','e10adc3949ba59abbe56e057f20f883e','xyq418462@163.com',0,0,0),(12,'lisi9','e10adc3949ba59abbe56e057f20f883e','zhaojt_goular@163.com',1489823806,0,0);
/*!40000 ALTER TABLE `shop_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cart`
--

DROP TABLE IF EXISTS `shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_cart` (
  `cartid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `productnum` int(10) unsigned DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cartid`),
  KEY `shop_cart_productid` (`productid`),
  KEY `shop_cart_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart`
--

LOCK TABLES `shop_cart` WRITE;
/*!40000 ALTER TABLE `shop_cart` DISABLE KEYS */;
INSERT INTO `shop_cart` VALUES (1,8,4,165.26,1,1491273431),(2,9,1,650.00,1,1491273437);
/*!40000 ALTER TABLE `shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_category` (
  `cateid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cateid`),
  KEY `shop_category_parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (1,'鏈嶈',0,1490103452),(2,'鐢靛瓙浜у搧',0,1490103460),(3,'瀹剁敤鐢靛櫒',0,1490103471),(4,'濂宠',1,1490103489),(5,'鐢疯',1,1490103494),(6,'鐭',4,1490103518),(7,'闀胯',4,1490103522),(8,'闉嬪瓙',0,1490599177),(10,'杩愬姩闉?,8,1490599196),(11,'楂樿窡闉?,8,1490599214);
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_order` (
  `orderid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '璁㈠崟ID',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛ID',
  `addressid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `expressid` int(10) unsigned NOT NULL DEFAULT '0',
  `expressno` varchar(50) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderid`),
  KEY `shop_order_userid` (`userid`),
  KEY `shop_order_addressid` (`addressid`),
  KEY `shop_order_expressid` (`expressid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (1,1,2,1165.78,260,2,'780030434948',1490938915,'2017-04-04 08:20:47'),(2,1,3,2135.26,100,2,'884337275484872439',1491010848,'2017-04-04 11:41:03');
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order_detail`
--

DROP TABLE IF EXISTS `shop_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_order_detail` (
  `detailid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productnum` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`detailid`),
  KEY `shop_order_detail_productid` (`productid`),
  KEY `shop_order_detail_orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order_detail`
--

LOCK TABLES `shop_order_detail` WRITE;
/*!40000 ALTER TABLE `shop_order_detail` DISABLE KEYS */;
INSERT INTO `shop_order_detail` VALUES (1,8,165.26,3,1,1490938915),(2,10,650.00,1,1,1490938915),(3,9,650.00,3,2,1491010848),(4,8,165.26,1,2,1491010848);
/*!40000 ALTER TABLE `shop_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_product` (
  `productid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `descr` text,
  `num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cover` varchar(200) NOT NULL DEFAULT '',
  `pics` text,
  `issale` enum('0','1') NOT NULL DEFAULT '0',
  `saleprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ishot` enum('0','1') NOT NULL DEFAULT '0',
  `ison` enum('0','1') NOT NULL DEFAULT '0',
  `istui` enum('0','1') NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`productid`),
  KEY `shop_product_cateid` (`cateid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (7,4,'浜氫附涓濋暱瑁?,'<b>灞变笢娉曟硶甯堝徃娉曡寖寰疯惃鍙戠敓澶у＋澶уか鎾掑湴鏂?/b>',550,1233.00,'http://on5lx46o2.bkt.clouddn.com/58d68ae43f20d','{\"58d68ae4ad42d\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d68ae4ad42d\",\"58d68ae4bf83d\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d68ae4bf83d\",\"58d68ae537e8d\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d68ae537e8d\"}','1',321.00,'1','1','1',0),(8,10,'闊╃増楂樹豢姘斿灚杩愬姩闉?,'<b><i>鏄殑鑼冨痉钀ㄨ寖寰疯惃鍙戝ぇ姘存椂鍙戠敓鐨勫彂鐨勬墍鍙戠敓鐨?/i></b>',996,223.60,'http://on5lx46o2.bkt.clouddn.com/58d8bda3a8b5f','{\"58d8bda45ea0b\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d8bda45ea0b\"}','1',165.26,'1','1','1',0),(9,10,'姘斿灚濂抽瀷','<b>姘寸數璐规按鐢佃垂绗笁鏂圭帺鍎垮幓鐜╄浠栦竴浜虹壒</b>',1197,1233.00,'http://on5lx46o2.bkt.clouddn.com/58d8be4183fb4','{\"58d8be41a1470\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d8be41a1470\",\"58d8be41bd454\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d8be41bd454\"}','1',650.00,'1','1','1',0),(10,10,'姘斿灚濂抽瀷','<b>姘寸數璐规按鐢佃垂绗笁鏂圭帺鍎垮幓鐜╄浠栦竴浜虹壒</b>',1199,1233.00,'http://on5lx46o2.bkt.clouddn.com/58d8be4d8edbb','{\"58d8be4da9ce7\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d8be4da9ce7\",\"58d8be4dd0c2c\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d8be4dd0c2c\"}','1',650.00,'1','1','1',0),(11,10,'杩愬姩濂抽瀷','<b><i>姘寸數璐规槸鍚﹂兘鏄粬瑕佽濂逛篃璁╀粬鏈夊涓湴鏂?/i></b>',1500,1500.00,'http://on5lx46o2.bkt.clouddn.com/58d8bebdd54ef','{\"58d8bebde9953\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d8bebde9953\",\"58d8bebe191e4\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d8bebe191e4\",\"58d8bebe2e768\":\"http:\\/\\/on5lx46o2.bkt.clouddn.com\\/58d8bebe2e768\"}','1',1300.00,'0','1','1',0);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_profile`
--

DROP TABLE IF EXISTS `shop_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_profile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `truename` varchar(32) NOT NULL DEFAULT '' COMMENT '鐪熷疄濮撳悕',
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '骞撮緞',
  `sex` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '鎬у埆',
  `birthday` date NOT NULL DEFAULT '2016-01-01' COMMENT '鐢熸棩',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '鏄电О',
  `company` varchar(100) NOT NULL DEFAULT '' COMMENT '鍏徃',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_profile_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_profile`
--

LOCK TABLES `shop_profile` WRITE;
/*!40000 ALTER TABLE `shop_profile` DISABLE KEYS */;
INSERT INTO `shop_profile` VALUES (1,'鍙ら緳',24,'1','2016-01-12','Goular','瑁曠敵鐢靛瓙绉戞妧鏈夐檺鍏徃',1,0);
/*!40000 ALTER TABLE `shop_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user`
--

DROP TABLE IF EXISTS `shop_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_user` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '鐢ㄦ埛鍚?,
  `openid` varchar(100) DEFAULT NULL,
  `userpass` varchar(32) NOT NULL DEFAULT '' COMMENT '鐢ㄦ埛瀵嗙爜',
  `useremail` varchar(100) NOT NULL DEFAULT '' COMMENT '鐢靛瓙閭',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `shop_user_username_userpass` (`username`,`userpass`),
  UNIQUE KEY `shop_user_useremail_userpass` (`useremail`,`userpass`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user`
--

LOCK TABLES `shop_user` WRITE;
/*!40000 ALTER TABLE `shop_user` DISABLE KEYS */;
INSERT INTO `shop_user` VALUES (1,'user1',NULL,'e10adc3949ba59abbe56e057f20f883e','zhaojt_exam@126.com',1489902444),(2,'user2',NULL,'e10adc3949ba59abbe56e057f20f883e','zhaojt_exam1@126.com',1489902687),(3,'user3',NULL,'e10adc3949ba59abbe56e057f20f883e','zhaojt_exam3@126.com',1489902699),(4,'user4',NULL,'e10adc3949ba59abbe56e057f20f883e','zhaojt_exam4@126.com',1489902727),(5,'user5',NULL,'e10adc3949ba59abbe56e057f20f883e','zhaojt_exam5@126.com',1489902744),(6,'user6',NULL,'e10adc3949ba59abbe56e057f20f883e','zhaojt_exam6@126.com',1489902759),(8,'imooc_58ce6c36df70a',NULL,'119ac331f39bbbc90577f554c5e63da0','zhaojt_wechat@126.com',1489923129),(9,'imooc_58ce6c9184dff',NULL,'75181e846a8c689e013dd390a99593fa','zhaojt_cs@126.com',1489923218),(10,'user7','GitHub-12976313','e10adc3949ba59abbe56e057f20f883e','',1491364298);
/*!40000 ALTER TABLE `shop_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-13  9:48:59
