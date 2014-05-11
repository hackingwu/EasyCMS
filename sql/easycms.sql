-- MySQL dump 10.13  Distrib 5.5.37, for osx10.6 (i386)
--
-- Host: localhost    Database: easycms
-- ------------------------------------------------------
-- Server version	5.5.37

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
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `addTime` datetime DEFAULT NULL,
  `addTimeStr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `commentState` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `countNum` int(11) NOT NULL,
  `dateName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `endTimeStr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isAnonymous` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isAnonymousStr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `memberId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `memberName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `objId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `objType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `objTypeStr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `siteId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `siteName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `startTimeStr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `stateStr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Config`
--

DROP TABLE IF EXISTS `Config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Config` (
  `code` varchar(255) COLLATE utf8_bin NOT NULL,
  `configValue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Config`
--

LOCK TABLES `Config` WRITE;
/*!40000 ALTER TABLE `Config` DISABLE KEYS */;
/*!40000 ALTER TABLE `Config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InfoImg`
--

DROP TABLE IF EXISTS `InfoImg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InfoImg` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iqvon7ij5r9oq6xt504jeu9ov` (`info`),
  CONSTRAINT `FK_iqvon7ij5r9oq6xt504jeu9ov` FOREIGN KEY (`info`) REFERENCES `info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InfoImg`
--

LOCK TABLES `InfoImg` WRITE;
/*!40000 ALTER TABLE `InfoImg` DISABLE KEYS */;
/*!40000 ALTER TABLE `InfoImg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InfoSign`
--

DROP TABLE IF EXISTS `InfoSign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InfoSign` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `signTime` datetime DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_i3av0csor3l4fyb7afhb2sdva` (`info`),
  KEY `FK_o8ftmod1pamexqle8j17hvn92` (`user`),
  CONSTRAINT `FK_i3av0csor3l4fyb7afhb2sdva` FOREIGN KEY (`info`) REFERENCES `info` (`id`),
  CONSTRAINT `FK_o8ftmod1pamexqle8j17hvn92` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InfoSign`
--

LOCK TABLES `InfoSign` WRITE;
/*!40000 ALTER TABLE `InfoSign` DISABLE KEYS */;
/*!40000 ALTER TABLE `InfoSign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Link`
--

DROP TABLE IF EXISTS `Link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Link` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isOk` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `pageMark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `site` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Link`
--

LOCK TABLES `Link` WRITE;
/*!40000 ALTER TABLE `Link` DISABLE KEYS */;
/*!40000 ALTER TABLE `Link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mail`
--

DROP TABLE IF EXISTS `Mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mail` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `addTime` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isOpen` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mailType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `proFlow` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `queryCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reContent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reTime` datetime DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unitId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `writer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mail`
--

LOCK TABLES `Mail` WRITE;
/*!40000 ALTER TABLE `Mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OperButton`
--

DROP TABLE IF EXISTS `OperButton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OperButton` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `func` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isOk` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cs0tl7f8f06lub58bp6f2d1yl` (`func`),
  CONSTRAINT `FK_cs0tl7f8f06lub58bp6f2d1yl` FOREIGN KEY (`func`) REFERENCES `func` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OperButton`
--

LOCK TABLES `OperButton` WRITE;
/*!40000 ALTER TABLE `OperButton` DISABLE KEYS */;
/*!40000 ALTER TABLE `OperButton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `addTime` datetime DEFAULT NULL,
  `addUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isOk` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `selectType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `site` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report`
--

DROP TABLE IF EXISTS `Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Report` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `addTime` datetime DEFAULT NULL,
  `attch` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fileNum` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `issuer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `linkMan` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `proFlow` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `queryCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reContent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reTime` datetime DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
/*!40000 ALTER TABLE `Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visit`
--

DROP TABLE IF EXISTS `Visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visit` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `addTime` datetime DEFAULT NULL,
  `channelId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `channelName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `countNum` int(11) DEFAULT NULL,
  `dateName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `endTimeStr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `infoId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `infoName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sdf` tinyblob,
  `siteId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `siteName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `startTimeStr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `statType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visit`
--

LOCK TABLES `Visit` WRITE;
/*!40000 ALTER TABLE `Visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_link`
--

DROP TABLE IF EXISTS `admin_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_link` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isok` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_link`
--

LOCK TABLES `admin_link` WRITE;
/*!40000 ALTER TABLE `admin_link` DISABLE KEYS */;
INSERT INTO `admin_link` VALUES ('1c12de41-b316-4e8b-8397-e4271a420dc4','我要返利网','http://www.51fanli.com/reg.asp?id=15943315&t=4','1',2,'userfiles/files/admin/51fanli.jpg','0',NULL),('25a9a6dc-13d5-4bd1-806a-ebd32e13a9fe','FreeCMS','http://code.google.com/p/freecms/','1',1,'userfiles/files/admin/freecms.jpg','0',NULL),('398303ae-3002-4e15-96ae-170b8d6767da','猪八戒','http://un.zhubajie.com/r/?u=2507721&l=https://login.zhubajie.com/register/','1',5,'userfiles/files/admin/zhubajie.jpg','0',NULL),('702a6bf9-3b5f-4219-be30-c751de270585','喜购网','http://www.xigou100.com/U1Sld','1',8,'userfiles/files/admin/xigou.jpg','0',NULL),('8a46d0b1-27d1-497d-96df-39a9f9d265c0','天猫','http://www.tmall.com/?ali_trackid=2:mm_13244061_0_0:1368695611_3k2_1264180475','1',4,'userfiles/files/admin/tmall.jpg','0',NULL),('ae075172-3fad-4721-8e74-b9c5826e9f8c','拍拍贷','http://www.ppdai.com/reg/vkqiang','1',7,'userfiles/files/admin/paipaidai.jpg','0',NULL),('ebdfc0b2-87c2-4c88-9a46-5b94cb077001','微推推','http://www.weituitui.com/t248292','1',3,'userfiles/files/admin/weituitui.jpg','0',NULL),('ec962632-e097-4201-b1a1-f21ae8e98ad4','返还网','http://www.fanhuan.com/come/#9300558','1',6,'userfiles/files/admin/fanhuan.jpg','0',NULL);
/*!40000 ALTER TABLE `admin_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contentTemplate` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` longtext COLLATE utf8_bin,
  `parId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `site` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `clickNum` int(11) DEFAULT NULL,
  `navigation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pageMark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `htmlChannel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `htmlChannelOld` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `htmlParChannel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `htmlSite` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `indexNum` int(11) DEFAULT NULL,
  `maxPage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES ('020f63d8-0b77-4594-b878-913f03a0fd68','联系我们','firstChannel.html','','upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/b11ffeac-ca55-42bc-a5cb-5e57091f02d4.jpg','','','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',7,NULL,'1','contactus',NULL,NULL,NULL,NULL,2,0),('0941826c-5b00-4b55-a085-adaac4840ac6','观点','infoList_noChannel.html','','upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/c6268756-5bb3-43c5-bb79-bdea0cea0535.jpg','','','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',8,NULL,'0','gd',NULL,NULL,NULL,NULL,3,NULL),('0d19957e-a05d-4df2-bf82-2eb16f1b7c01','软件开发','firstChannel.html','','','','','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',3,NULL,'1','soft',NULL,NULL,NULL,NULL,5,0),('0f0e4309-6ff9-4d43-823c-e307e3391fb3','联系方式','','','upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/b11ffeac-ca55-42bc-a5cb-5e57091f02d4.jpg','<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	郑州博丰软件有限公司</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	电话：0371-86682036</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0371-86682039</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	传真：0371-86601835</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	手机：13838558267</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	邮箱：<a href=\"mailto:zzbfsoft@163.com\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">zzbfsoft@163.com</a></p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	网址：<a href=\"http://www.zzbfsoft.com/\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">www.zzbfsoft.com</a></p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	地址：郑州中原区友爱路2号辉煌铭苑C座2308室</p>','020f63d8-0b77-4594-b878-913f03a0fd68','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',1,NULL,'1','contact',NULL,NULL,NULL,NULL,7,0),('12b41a6d-239e-46c3-a839-5644bb3258d8','手机网站建设','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/72cc3ea3-f9ac-48bc-a627-d93a219ee79e.jpg','<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<font color=\"#999999\">手机网站</font>（wap网站）建设是在移动互联网时代企事业单位为了更好的服务于用户，必须考虑建立适合手机访问的网站。手机上网受到流量限制，因此<font color=\"#999999\">手机网站</font>（wap网站）界面不能多度的使用fiash，大图片。</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span style=\"widows: 2; font-size: 14px; line-height: 24px; font-family: tahoma, arial, 宋体; orphans: 2; color: rgb(0, 0, 0);\">商家和企业面向消费者提供的应用和服务向3G平台迁移已是大势所趋，移动互联网必将比传统互联网具有更高的商业价值。<font color=\"#999999\">手机网站</font>具有让消费者随时、随地、随身访问的优势和方便快捷的不可取代的特点。而目前，手机正迅速成为人们最常用的上网方式，截至2012年6月，我国手机网民规模达到3.88亿，网民中用手机接入互联网的用户占比已达到72.2%，首次超过台式电脑，成为我国网民的第一大上网终端。3G的到来，将更加促使这一数据向上飞跃，因此，<font color=\"#999999\">手机网站</font>又具备得天独厚的发展潜力。传统网站不适合通过手机访问，因此建立专供手机上网浏览的网站，让客户真正能实现实现随时、随地、随身的访问，成为了许多企业和商家的选择。</span></p>','3c1a1583-395f-44dd-a870-769eb87071ad','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',2,NULL,'1','msite',NULL,NULL,NULL,NULL,9,0),('145f0bb7-fb16-4cbb-b8d8-f39161a76ed7','软件定制开发','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/39135910-85f6-4636-afbb-cc6ae3af32f3.jpg','<p>\r\n	<font face=\"Arial\">我们为客户提供基于Windows、Unix、Linux操作系统平台软件定制开发,软件升级服务,WEB Service开发,分为几下类别：</font></p>\r\n<p>\r\n	<font face=\"Arial\"><strong>企业管理软件开发</strong><br />\r\n	统一用户管理系统</font><br />\r\n	<font face=\"Arial\">企业办公自动化管理系统(OA)<br />\r\n	客户关系管理系统(CRM)<br />\r\n	企业进销存管理系统<br />\r\n	企业资源计划系统(ERP)<br />\r\n	企业人力资源管理系统(HRS)</font></p>\r\n<p>\r\n	<font face=\"Arial\"><strong>电子商务解决方案</strong><br />\r\n	网上购物系统</font><br />\r\n	<font face=\"Arial\">商务贸易系统(B2B)<br />\r\n	商务贸易系统(B2C)<br />\r\n	会员管理系统<br />\r\n	在线客户洽谈系统<br />\r\n	电子邮件服务系统<br />\r\n	域名查询注册系统<br />\r\n	新闻发布系统(CMS)<br />\r\n	网上调查系统<br />\r\n	邮件群发系统<br />\r\n	论坛(BBS)系统&nbsp;</font><br />\r\n	<font face=\"Arial\"><strong>其它</strong><br />\r\n	Android软件开发</font><br />\r\n	<font face=\"Arial\">门户网站群管理系统<br />\r\n	政府信息公开管理系统<br />\r\n	各类定制软件</font></p>','0d19957e-a05d-4df2-bf82-2eb16f1b7c01','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',1,NULL,'1','softcustom',NULL,NULL,NULL,NULL,13,0),('379fb8a9-a680-4b54-92e2-2934ed3d1f76','企业门户网站建设','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/171f4d23-ccbe-42ec-90b4-c63fa9766901.jpg','<div id=\"sidebar1\" style=\"position: relative; width: 330px; float: right; height: auto; padding-top: 10px\">\r\n	<h3 style=\"line-height: 30px; color: rgb(85,83,84); font-size: 16px; font-weight: bold\">\r\n		企业宣传型网站</h3>\r\n	<div id=\"cy_lb\" style=\"width: 370px\">\r\n		<ul style=\"padding-bottom: 0px; list-style-type: none; margin: 20px 0px 0px; padding-left: 0px; width: 370px; padding-right: 0px; padding-top: 0px\">\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				赠送国际域名 1 个（免费备案）</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				赠送100M 虚拟主机100M 企业邮局可供10个用户</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				1套精美首页设计,12个内容页面制作</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				客户留言系统,产品展示系统,网站浏览统计系统</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				免费维护一年,在无需触动页面整体风格的情况下。</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				免费搜索引擎登记</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				免费代办ICP备案</li>\r\n		</ul>\r\n	</div>\r\n</div>\r\n<div id=\"sidebar5\" style=\"position: relative; padding-bottom: 0px; padding-left: 0px; width: 150px; padding-right: 0px; float: right; height: auto; margin-right: 40px; padding-top: 20px\">\r\n	<img alt=\"\" height=\"169\" src=\"http://www.zzbfsoft.com/images/taocan01.jpg\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"170\" /></div>\r\n<div id=\"line7\" style=\"margin-top: 50px; width: 560px; margin-bottom: 20px; float: left\">\r\n	<div id=\"design_cp\" style=\"width: 150px; float: right; height: 80px; vertical-align: bottom; margin-right: 25px\">\r\n		<div id=\"design_cp_img\" style=\"width: 80px; height: 80px\">\r\n			<img alt=\"实力展示型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/1_3.gif\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"margin-top: -25px; color: rgb(102,102,102); margin-left: 90px; font-size: 12px\">\r\n			实力展示型</div>\r\n	</div>\r\n	<div id=\"design_cp\" style=\"width: 150px; float: right; height: 80px; vertical-align: bottom; margin-right: 25px\">\r\n		<div id=\"design_cp_img\" style=\"width: 80px; height: 80px\">\r\n			<img alt=\"简约商务型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/1_2.gif\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"margin-top: -25px; color: rgb(102,102,102); margin-left: 90px; font-size: 12px\">\r\n			简约商务型</div>\r\n	</div>\r\n	<div id=\"design_cp\" style=\"width: 150px; float: right; height: 80px; vertical-align: bottom; margin-right: 25px\">\r\n		<div id=\"design_cp_img\" style=\"width: 80px; height: 80px\">\r\n			<img alt=\"基础展示型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/1_1.gif\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"margin-top: -25px; color: rgb(102,102,102); margin-left: 90px; font-size: 12px\">\r\n			基础展示型</div>\r\n	</div>\r\n</div>\r\n<div id=\"line4\" style=\"background-image: url(http://www.zzbfsoft.com/images/line2.jpg); margin-top: 30px; width: 560px; float: left; overflow: hidden\">\r\n	&nbsp;</div>\r\n<div id=\"sidebar1\" style=\"position: relative; width: 330px; float: right; height: auto; padding-top: 10px\">\r\n	<h3 style=\"line-height: 30px; color: rgb(85,83,84); font-size: 16px; font-weight: bold\">\r\n		企业标准型网站</h3>\r\n	<div id=\"cy_lb\" style=\"width: 370px\">\r\n		<ul style=\"padding-bottom: 0px; list-style-type: none; margin: 20px 0px 0px; padding-left: 0px; width: 370px; padding-right: 0px; padding-top: 0px\">\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				赠送国际域名 1 个（免费备案）</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				赠送300M 虚拟主机100M 企业邮局可供20 个用户</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				1套精美首页设计,15个内容页面制作</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				产品展示系统,产品搜索系统,新闻发布系统,客户留言系统,在线统计分析系统</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				免费维护一年,在无需触动页面整体风格情况下。</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				免费搜索引擎登记</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				免费代办ICP备案</li>\r\n		</ul>\r\n	</div>\r\n</div>\r\n<div id=\"sidebar5\" style=\"position: relative; padding-bottom: 0px; padding-left: 0px; width: 150px; padding-right: 0px; float: right; height: auto; margin-right: 40px; padding-top: 20px\">\r\n	<img alt=\"\" height=\"169\" src=\"http://www.zzbfsoft.com/images/taocan02.jpg\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"170\" /></div>\r\n<div id=\"line7\" style=\"margin-top: 50px; width: 560px; margin-bottom: 20px; float: left\">\r\n	<div id=\"design_cp\" style=\"width: 150px; float: right; height: 80px; vertical-align: bottom; margin-right: 25px\">\r\n		<div id=\"design_cp_img\" style=\"width: 80px; height: 80px\">\r\n			<img alt=\"多语言版本网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/t3_3.jpg\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"margin-top: -25px; color: rgb(102,102,102); margin-left: 90px; font-size: 12px\">\r\n			多语言版本</div>\r\n	</div>\r\n	<div id=\"design_cp\" style=\"width: 150px; float: right; height: 80px; vertical-align: bottom; margin-right: 25px\">\r\n		<div id=\"design_cp_img\" style=\"width: 80px; height: 80px\">\r\n			<img alt=\"商城贸易型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/t3_2.gif\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"margin-top: -25px; color: rgb(102,102,102); margin-left: 90px; font-size: 12px\">\r\n			商城贸易型</div>\r\n	</div>\r\n	<div id=\"design_cp\" style=\"width: 150px; float: right; height: 80px; vertical-align: bottom; margin-right: 25px\">\r\n		<div id=\"design_cp_img\" style=\"width: 80px; height: 80px\">\r\n			<img alt=\"商务功能型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/t3_1.gif\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"margin-top: -25px; color: rgb(102,102,102); margin-left: 90px; font-size: 12px\">\r\n			商务功能型</div>\r\n	</div>\r\n</div>\r\n<div id=\"line4\" style=\"background-image: url(http://www.zzbfsoft.com/images/line2.jpg); margin-top: 30px; width: 560px; float: left; overflow: hidden\">\r\n	&nbsp;\r\n	<div id=\"sidebar4\" style=\"position: relative; widows: 2; text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; margin: 0px 50px 0px 0px; width: 541px; font: 12px/18px 微软雅黑, arial, helvetica, sans-serif; white-space: normal; orphans: 2; letter-spacing: normal; height: 4px; color: rgb(100,99,99); word-spacing: 0px; padding-top: 10px; webkit-text-size-adjust: auto; webkit-text-stroke-width: 0px\">\r\n		<div id=\"sidebar1\" style=\"position: relative; width: 330px; float: right; height: auto; padding-top: 10px\">\r\n			<br class=\"Apple-interchange-newline\" />\r\n			&nbsp;</div>\r\n	</div>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div id=\"sidebar1\" style=\"position: relative; width: 330px; float: right; height: auto; padding-top: 10px\">\r\n	<h3 style=\"line-height: 30px; color: rgb(85,83,84); font-size: 16px; font-weight: bold\">\r\n		企业智能型网站</h3>\r\n	<div id=\"cy_lb\" style=\"width: 370px\">\r\n		<ul style=\"padding-bottom: 0px; list-style-type: none; margin: 20px 0px 0px; padding-left: 0px; width: 370px; padding-right: 0px; padding-top: 0px\">\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				赠送国际域名 1 个（免费备案）</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				赠送500M 虚拟主机200M 企业邮局可供40 个用户</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				1套精美首页设计,25个内容页面制作</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				页面采用全数据库后台管理制作,包含以下几功能:新闻发布系统,产品发布系统,产品搜索系统,在线招聘系统,留言板,在线统计分析系统</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				免费维护一年,在无需触动页面整体风格的情况下。</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				免费搜索引擎登记</li>\r\n			<li style=\"background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); padding-bottom: 0px; line-height: 30px; list-style-type: none; margin: 0px; padding-left: 40px; width: 370px; padding-right: 0px; background-position: 0% 7px; color: rgb(102,102,102); font-size: 12px; text-decoration: none; padding-top: 0px\">\r\n				免费代办ICP备案</li>\r\n		</ul>\r\n	</div>\r\n</div>\r\n<div id=\"sidebar5\" style=\"position: relative; padding-bottom: 0px; padding-left: 0px; width: 150px; padding-right: 0px; float: right; height: auto; margin-right: 40px; padding-top: 20px\">\r\n	<img alt=\"\" height=\"169\" src=\"http://www.zzbfsoft.com/images/taocan03.jpg\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"170\" /></div>\r\n<div id=\"line7\" style=\"margin-top: 50px; width: 560px; margin-bottom: 20px; float: left\">\r\n	<div id=\"design_cp\" style=\"width: 150px; float: right; height: 80px; vertical-align: bottom; margin-right: 25px\">\r\n		<div id=\"design_cp_img\" style=\"width: 80px; height: 80px\">\r\n			<img alt=\"后台型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/t2_3.jpg\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"margin-top: -25px; color: rgb(102,102,102); margin-left: 90px; font-size: 12px\">\r\n			后台型</div>\r\n	</div>\r\n	<div id=\"design_cp\" style=\"width: 150px; float: right; height: 80px; vertical-align: bottom; margin-right: 25px\">\r\n		<div id=\"design_cp_img\" style=\"width: 80px; height: 80px\">\r\n			<img alt=\"艺术型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/t2_2.gif\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"margin-top: -25px; color: rgb(102,102,102); margin-left: 90px; font-size: 12px\">\r\n			艺术型</div>\r\n	</div>\r\n	<div id=\"design_cp\" style=\"width: 150px; float: right; height: 80px; vertical-align: bottom; margin-right: 25px\">\r\n		<div id=\"design_cp_img\" style=\"width: 80px; height: 80px\">\r\n			<img alt=\"创意型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/t2_1.gif\" style=\"border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"margin-top: -25px; color: rgb(102,102,102); margin-left: 90px; font-size: 12px\">\r\n			创意型</div>\r\n	</div>\r\n</div>','697e3270-fef7-4af4-a7a3-c66b761f8f91','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',4,NULL,'1','com',NULL,NULL,NULL,NULL,46,0),('3c1a1583-395f-44dd-a870-769eb87071ad','手机开发','firstChannel.html','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/72cc3ea3-f9ac-48bc-a627-d93a219ee79e.jpg','','','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',5,NULL,'1','mobile',NULL,NULL,NULL,NULL,48,0),('464c6003-b3d1-44af-ac2f-1776035da448','虚拟主机','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/c6268756-5bb3-43c5-bb79-bdea0cea0535.jpg','<div class=\"hostjf\" style=\"color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<ul>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf01.gif\" width=\"128\" />&nbsp;<br />\r\n			北京洋桥双线</li>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf02.gif\" width=\"128\" />&nbsp;<br />\r\n			北京北工大双线</li>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf03.gif\" width=\"128\" />&nbsp;<br />\r\n			北京中关村双线</li>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf04.gif\" width=\"128\" />&nbsp;<br />\r\n			北京鼓楼多线</li>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf05.gif\" width=\"128\" />&nbsp;<br />\r\n			上海电信</li>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf06.gif\" width=\"128\" />&nbsp;<br />\r\n			南通电信</li>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf07.gif\" width=\"128\" />&nbsp;<br />\r\n			郑州四线</li>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf08.gif\" width=\"128\" />&nbsp;<br />\r\n			开封网通</li>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf09.gif\" width=\"128\" />&nbsp;<br />\r\n			美国机房</li>\r\n		<li>\r\n			<img height=\"86\" src=\"http://zzbfsoft.com/images/jf10.gif\" width=\"128\" />&nbsp;<br />\r\n			香港机房</li>\r\n	</ul>\r\n</div>\r\n<div style=\"color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; clear: both;\">\r\n	&nbsp;</div>\r\n<table align=\"center\" bgcolor=\"#e1e1e1\" border=\"0\" cellpadding=\"4\" cellspacing=\"1\" style=\"color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; margin-top: 8px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" class=\"t12-he\" style=\"padding-left: 10px;\">\r\n				&nbsp;</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12-he\" height=\"30\">\r\n				<div align=\"center\">\r\n					双线T1型</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12-he\" height=\"30\">\r\n				<div align=\"center\">\r\n					双线T2型</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12-he\" height=\"30\">\r\n				<div align=\"center\">\r\n					网店S1型</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12-he\" height=\"30\">\r\n				<div align=\"center\">\r\n					G享1G型</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12-he\" height=\"30\">\r\n				<div align=\"center\">\r\n					北京TB1型</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12-he\" height=\"30\">\r\n				<div align=\"center\">\r\n					香港UT1型</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>一年价格</strong></td>\r\n			<td bgcolor=\"#ffffff\" height=\"30\">\r\n				<div align=\"center\">\r\n					<span class=\"biaojia\">150</span>元</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" height=\"30\">\r\n				<div align=\"center\">\r\n					<span class=\"biaojia\">258</span>元</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" height=\"30\">\r\n				<div align=\"center\">\r\n					<span class=\"biaojia\">288</span>元</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" height=\"30\">\r\n				<div align=\"center\">\r\n					<span class=\"biaojia\">659</span>元</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" height=\"30\">\r\n				<div align=\"center\">\r\n					<span class=\"biaojia\">158</span>元</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" height=\"30\">\r\n				<div align=\"center\">\r\n					<span class=\"biaojia\">658</span>元</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>网络类型</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					电信+网通</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" height=\"30\">\r\n				<div align=\"center\">\r\n					<span class=\"t12lan\">电信+网通</span></div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					<span class=\"t12lan\">电信+网通</span></div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<span class=\"t12lan\">电信+网通</span></div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					<div align=\"center\">\r\n						<b>北京多线</b></div>\r\n				</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					美国机房</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>硬件防火墙</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					千M硬防群集</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					千M硬防群集</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					千M硬防群集</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					千M硬防群集</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					千M硬防群集</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					千M硬防群集</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>空间容量</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					100M</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					500M</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					200M</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					1000M</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					100M</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					300M</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>IIS连接数</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					50个</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					100个</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					100个</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					300个</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					50个</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					50个</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>独立子站点</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<div align=\"center\">\r\n						10个</div>\r\n				</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>赠送企业邮局</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					50M(5个)</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					100M(10个)</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					50M(5个)</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<div align=\"center\">\r\n						1G(10个)</div>\r\n				</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					50M(5个)</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					20M(2个)</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<p>\r\n					<strong>SQL2005</strong></p>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					--</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>MYSQL数据库5.0</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					50M</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					100M</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					100M</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					200M</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					50M</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					50M</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>FTP帐户/CPU资源</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					1个</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					1个</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					1个</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					1个</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					1个</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					1个</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>备份空间</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					100M</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					500M</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					200M</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					1000M</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					100M</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\" width=\"99\">\r\n				<div align=\"center\">\r\n					100M</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>流量限制</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					不限</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<b>不限</b></div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<b>不限</b></div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<b>不限</b></div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					不限</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<div align=\"center\">\r\n						5G/月</div>\r\n				</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>绑定域名数</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					15个</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					15个</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					15个</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					15*11个</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					15个</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					15个</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>赠送域名</strong></td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\" width=\"98\">\r\n				<div align=\"center\">\r\n					<span class=\"t12hong\">三级域名</span></div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<span class=\"t12hong\">三级域名</span></div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<span class=\"t12hong\">三级域名</span></div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<span class=\"t12hong\">三级域名</span></div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<span class=\"t12hong\">三级域名</span></div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\" class=\"t12lan\">\r\n				<div align=\"center\">\r\n					<span class=\"t12hong\">三级域名</span></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" colspan=\"7\">\r\n				ASP、 ASP.net&nbsp;<img height=\"27\" src=\"http://zzbfsoft.com/images/aspnet.gif\" width=\"49\" />&nbsp;、 PHP5&nbsp;<img src=\"http://zzbfsoft.com/images/php.gif\" />&nbsp;、 Perl5&nbsp;<img src=\"http://zzbfsoft.com/images/perl.gif\" />&nbsp;、 Mysql&nbsp;<img src=\"http://zzbfsoft.com/images/mysql.gif\" />&nbsp;、 Microsoft Access&nbsp;<img src=\"http://zzbfsoft.com/images/access.gif\" />&nbsp;、 Microsoft Sqlserver</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>中文控制面板</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>在线绑定域名</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>空间使用情况</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>流量及CPU使用</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>下载访问日志</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>修改FTP密码</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>自定义默认首页</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>支持FSO读写</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>屏蔽恶意IP或IP段</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>设置目录执行权限</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>设置安全读写权限</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>自定义MIME类型</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>在线打包、解压</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>网站搬家</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>清空目录</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>数据库管理</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>特色模板选择</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>数据还原</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\" width=\"144\">\r\n				<strong>404错误自定义</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr bgcolor=\"#f8fcfe\">\r\n			<td bgcolor=\"#faf8f1\" class=\"t12-he\" colspan=\"7\" style=\"padding-left: 10px;\">\r\n				<strong>支持脚本以及程序</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Html</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Shtml</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>ASP</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>PHP5+</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>.NET</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>CGI</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Jmail组件</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Perl 5</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>WAP</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Jscript</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Zend加速</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>AspUpload</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>动易组件</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Urlrewrite</strong></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\" class=\"t12hong\">\r\n					收费</div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<div align=\"center\" class=\"t12hong\">\r\n					收费</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\" class=\"t12hong\">\r\n					收费</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\" class=\"t12hong\">\r\n					收费</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\" class=\"t12hong\">\r\n					收费</div>\r\n			</td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\" class=\"t12hong\">\r\n					收费</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Shockware/flash</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Ajax</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>Access2003/2007</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr bgcolor=\"#f8fcfe\">\r\n			<td bgcolor=\"#faf8f1\" class=\"tit\" colspan=\"7\">\r\n				<span class=\"t12-he\" style=\"font-weight: bold;\">安全性</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>数据定期备份</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f8fcfe\" class=\"tit\">\r\n				<strong>保留数据二个月</strong></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td bgcolor=\"#f8fcfe\">\r\n				<div align=\"center\">\r\n					<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></div>\r\n			</td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#f8fcfe\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n			<td align=\"middle\" bgcolor=\"#ffffff\">\r\n				<img border=\"0\" height=\"16\" src=\"http://zzbfsoft.com/images/3.gif\" width=\"16\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#faf8f1\" class=\"t12-he\" colspan=\"7\" style=\"padding-left: 10px;\">\r\n				其它说明</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" colspan=\"7\" style=\"padding: 5px;\">\r\n				<p class=\"t12he\">\r\n					&middot;禁止放博彩类、违犯政治类、私服、色情、赌博、诈骗、垃圾邮件等一切国家法律禁止的内容，一经发现立即删除空间，不退款并报公安机关处理。请空间申请好后立即备案，以免因未备案而关闭您的空间。&nbsp;<br />\r\n					&middot;所有空间放置论坛需经过BBS专项备案，空间不能放聊天室、江湖、广告链、视频、文件下载及其它极占资源的程序。一但发现此空间放了上述程序将立刻关闭您的相关目录。书面保证不再放此类程序才能再次开通空间。</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f5ee\" class=\"t12-he\" colspan=\"7\" style=\"padding-left: 10px;\">\r\n				我们承诺：</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" class=\"t12he\" colspan=\"7\" style=\"padding: 5px;\">\r\n				&middot;&nbsp;<font color=\"#ff6600\">自助管理</font>--虚拟主机Web在线友好控制面板&nbsp;<br />\r\n				&middot;机房千兆多芯光纤带宽与CHINANET骨干网高速连接，所有服务器均7&times;24H监控运行状态&nbsp;<br />\r\n				&middot;提供&ldquo;&nbsp;<font color=\"#ff6600\">电信</font>、&nbsp;<font color=\"#ff6600\">网通</font>、&nbsp;<font color=\"#ff6600\">双线</font>、&nbsp;<font color=\"#ff6600\">多线</font>、&nbsp;<font color=\"#ff6600\">美国</font>&rdquo;等虚拟主机产品，保证客户的不同需求&nbsp;<br />\r\n				&middot;&nbsp;<font color=\"#ff0000\"><font color=\"#ff6600\">智能解析系统</font> </font>自动识别网通、电信线路，使你网站像新浪、搜狐一样更加智能，更加快&nbsp;<br />\r\n				&middot;windows服务器免费支持&nbsp;<font color=\"#ff6600\">动易组件</font>，支持&nbsp;<font color=\"#ff6600\">PHP</font>空间免费赠送&nbsp;<font color=\"#ff6600\">MYSQL</font>数据库&nbsp;<br />\r\n				&middot;专业防病毒系统，每日病毒库更新，自动为您网站过滤病毒，让你更安心&nbsp;<br />\r\n				&middot;每周对客户站点的IIS、FTP等重要数据进行异地备份，大大提高了数据安全性&nbsp;<br />\r\n				&middot;以上所有虚拟主机价格为未税价</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>','9cb43e46-d951-408b-9abe-6a955db2e39b','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',NULL,NULL,'1','host',NULL,NULL,NULL,NULL,56,0),('4f325f7f-c6eb-41ae-8068-50a8e3743aff','常见问题','infoList.html','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/171f4d23-ccbe-42ec-90b4-c63fa9766901.jpg','','697e3270-fef7-4af4-a7a3-c66b761f8f91','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',5,NULL,'1','FAQ',NULL,NULL,NULL,NULL,63,0),('5efa680b-a17a-4d82-afa6-6cd06a9a6d43','网站建站流程','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/171f4d23-ccbe-42ec-90b4-c63fa9766901.jpg','<h4>\r\n	门户网站建设流程</h4>\r\n<p>\r\n	设计就是生产力，单凭高技术、高质量不一定能创造好市场，也很难转化为现实的市场竞争优势。它需要高水准的企业形象设计,包括产品设计，广告设计和包装设计等有力支持与辅佐，才能走向市场，赢得消费者，才能给企业带来无法估量的附加值。</p>\r\n<ul>\r\n	<li>\r\n		■第一次洽谈、沟通&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		双方进行交流沟通，增进彼此了解，确认初步合作意向。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 确定合作意向&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		明确设计的任务，价格及进度安排等。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 签订委托设计合同书&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		支付50%设计定金，并明确双方负责人。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 策略制订&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		好的设计是发掘企业自身价值、提炼理念并高效向公众表达的过程。我们做每一项设计之前都会进行设计策略的提炼与制订。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 策略提案&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		设计策略的提案内容是在调查与反复论证后做出的，客户在提案的过程中可以根据企业的实际情况做出调整，最后由双方共同确定。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 创意设计&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		在策略的指导下由专业的设计师完成。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 设计提案&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		设计的过程也是沟通的过程,好的作品来源于成功的沟通。面对企业高层领导进行设计提案,是最直接,最有效的沟通。通过提案确定设计风格与设计方向,形成提案决议,指导下一步设计。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 方案的细化与调整&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		双方就设计方案进行细化调整,并形成最终方案,客户方校稿后签字确认设计项目实施。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 实施和导入&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		进入实施和导入阶段。（如没有后期制作，至此全部设计工作结束）</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 交付设计尾款&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		客户支付合同余款，设计工作完成。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 交付设计文件&darr;</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		向客户交付最终设计原文件(光盘或电子文件)，设计项目全部完成。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		■ 跟踪服务</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		设计方客服人员会继续与客户保持联系，及时解决客户的技术问题和相关咨询。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		注:博丰软件公司的工作步骤可根据实际情况调整。</li>\r\n</ul>\r\n<ul>\r\n	<li>\r\n		附流程图如下： <img align=\"left\" alt=\"\" height=\"1088\" src=\"http://www.zzbfsoft.com/UserFiles/Image/lcc.gif\" width=\"542\" /></li>\r\n</ul>','697e3270-fef7-4af4-a7a3-c66b761f8f91','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',6,NULL,'1','flow',NULL,NULL,NULL,NULL,72,0),('6140410e-317a-4147-bee2-310023b43c5d','交通地图','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/b11ffeac-ca55-42bc-a5cb-5e57091f02d4.jpg','<p>\r\n	<iframe frameborder=\"0\" height=\"480\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" src=\"http://ditu.google.com/maps?f=d&amp;source=s_d&amp;saddr=%E6%9C%AA%E7%9F%A5%E9%81%93%E8%B7%AF&amp;daddr=&amp;geocode=FZBJEgIdac7FBg&amp;sll=34.752747,113.626689&amp;sspn=0.004813,0.009624&amp;vpsrc=0&amp;hl=zh-CN&amp;brcurrent=3,0x35d77a937ef13f49:0xf2a283c48a68d4ca,0,0x35d76594f09b6a9d:0x7932ee19f4cced2c%3B5,0,0&amp;dirflg=w&amp;mra=ltm&amp;num=10&amp;ie=UTF8&amp;t=m&amp;ll=34.752755,113.626699&amp;spn=0.008462,0.013733&amp;z=17&amp;iwloc=ddw0&amp;output=embed\" style=\"color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; line-height: 18px;\" width=\"640\"></iframe><br style=\"color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; line-height: 18px;\" />\r\n	<small style=\"color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; line-height: 18px;\"><a href=\"http://ditu.google.com/maps?f=d&amp;source=embed&amp;saddr=%E6%9C%AA%E7%9F%A5%E9%81%93%E8%B7%AF&amp;daddr=&amp;geocode=FZBJEgIdac7FBg&amp;sll=34.752747,113.626689&amp;sspn=0.004813,0.009624&amp;vpsrc=0&amp;hl=zh-CN&amp;brcurrent=3,0x35d77a937ef13f49:0xf2a283c48a68d4ca,0,0x35d76594f09b6a9d:0x7932ee19f4cced2c%3B5,0,0&amp;dirflg=w&amp;mra=ltm&amp;num=10&amp;ie=UTF8&amp;t=m&amp;ll=34.752755,113.626699&amp;spn=0.008462,0.013733&amp;z=16&amp;iwloc=ddw0\" style=\"color: rgb(0, 0, 255); text-decoration: none;\">查看大图</a></small></p>','020f63d8-0b77-4594-b878-913f03a0fd68','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',3,NULL,'1','map',NULL,NULL,NULL,NULL,74,0),('697e3270-fef7-4af4-a7a3-c66b761f8f91','网站建设','firstChannel.html','','','','','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',4,NULL,'1','website',NULL,NULL,NULL,NULL,78,0),('6aa62bc1-18ca-4332-8af7-cda2a155701d','政府门户网站建设','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/171f4d23-ccbe-42ec-90b4-c63fa9766901.jpg','<p style=\"TEXT-ALIGN: center\">\r\n	<strong><span style=\"FONT-SIZE: 18px\">政府门户型网站</span></strong></p>\r\n<p style=\"TEXT-ALIGN: center\">\r\n	<img align=\"absMiddle\" alt=\"\" height=\"169\" src=\"http://www.zzbfsoft.com/UserFiles/Image/taocan05.jpg\" width=\"170\" /></p>\r\n<p>\r\n	赠送国际域名 1 个（免费备案）<br />\r\n	赠送1000M 虚拟主机 200M 企业邮局可分配 40 个 用户 300M 数据库空间<br />\r\n	1套精美首页设计,40个内容页面制作<br />\r\n	内容管理系统, 政府信息公开系统，在线访谈系统，在线投诉系统、书记信箱系统、站内搜索系统, 在线调查系统,,在线统计分析系统<br />\r\n	免费维护一年,在无需触动页面整体风格的情况下。<br />\r\n	免费搜索引擎登记<br />\r\n	免费代办ICP备案</p>\r\n<p>\r\n	<img alt=\"\" height=\"80\" src=\"http://www.zzbfsoft.com/UserFiles/Image/t5_1.jpg\" width=\"80\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;省级政府门户网站&nbsp; <img alt=\"\" height=\"80\" src=\"http://www.zzbfsoft.com/UserFiles/Image/t5_2.jpg\" width=\"80\" />市级政府门户网站<img alt=\"\" height=\"80\" src=\"http://www.zzbfsoft.com/UserFiles/Image/t5_3.jpg\" width=\"80\" />&nbsp;&nbsp;&nbsp;县级政府门户网站 &nbsp; &nbsp;</p>','697e3270-fef7-4af4-a7a3-c66b761f8f91','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',1,NULL,'1','gov',NULL,NULL,NULL,NULL,79,0),('76cd6aa7-6485-4710-9749-9e3d48a00fb6','WS应用集成系统','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/fb286562-58c8-47a4-8aad-468a80ecbee8.jpg','<p>\r\n	本产品的名称为《WebSystem应用集成系统》（简称WS），提供统一单位、用户管理及统一认证登录系统（Web Authentication System 简称WAS），设计时即定位成为一个整合其它应用的平台。</p>\r\n<p>\r\n	1．随着信息化建设的发展，有很多单位运营了多个独立应用（称为成员应用），每个应用都具有自己的身份验证机制，这样势必造成：生活中的一位用户，如果要以会员的身份访问应用，需要在每个应用上注册，并且通过身份验证后，才能以会员的身份访问应用；即使用户以同样的用户名与密码在每个网站上注册时，虽然可以在避免用户名与密码的忘记和混淆方面有一定的作用，但是用户在某一段时间访问多个成员应用或在成员应用间跳转时，还是需要用户登录后，才能以会员的身份访问应用。这样不仅给用户带来了不便，而且成员应用为登录付出了性能的代价。</p>\r\n<p>\r\n	2．如果所有的成员应用，能够实现单点登录，不仅在用户体验方面有所提高，而且真正体现了单位多个应用的兄弟性。通过这种有机结合，能更好地体现单位大平台，大渠道的理念。同时，这样做也利于成员应用的相互促进与相互宣传。</p>\r\n<p>\r\n	3．由于WS提供了统一的单位、用户管理功能，可以有效保证单位、用户数据的实时性与统一性，并可避免单位、用户管理功能的重复建设，为以后新的成员应用节省开发成本与开发时间。</p>\r\n<p>\r\n	&nbsp;正是出于上面的三点，WebSystem应用集成系统的使用是必须的，是迫在眉睫的。</p>\r\n<p>\r\n	想要了解更多，请联系业务人员电话13838558267，谢谢！</p>','0d19957e-a05d-4df2-bf82-2eb16f1b7c01','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',3,NULL,'1','ws',NULL,NULL,NULL,NULL,90,0),('787b129a-db2e-4795-92d8-cebfc5acb0ce','400电话','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/c6268756-5bb3-43c5-bb79-bdea0cea0535.jpg','<p>\r\n	<span style=\"color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 18px;\">400电话业务一项采用企业和客户共同分担通话费用模式的通信业务。客户打企业的400电话按正常的市话资费进行收费，无长途通话费。因为使用400的企业承担了部分话费。企业使用400电话，有助于提升企业形象，有助于客户转化。企业开通400电话是免费的，可以根据企业的客户来电量，选择合理的资费套餐，最低套餐每年仅需360元。</span></p>','9cb43e46-d951-408b-9abe-6a955db2e39b','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',6,NULL,'1','400',NULL,NULL,NULL,NULL,91,0),('8be0fe0f-1a10-4cc5-8f50-109246f612fc','新闻中心','firstChannel.html','','','','','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',2,NULL,'1','news',NULL,NULL,NULL,NULL,101,0),('8e09f460-f43b-49c6-8b04-7042afc566c0','博丰动态','infoList.html','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/e2f36904-0690-4823-80ba-7e61b7ebdc61.jpg','','8be0fe0f-1a10-4cc5-8f50-109246f612fc','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',1,NULL,'1','bfdt',NULL,NULL,NULL,NULL,104,NULL),('993f044b-089c-49f8-8a5f-0ef1d6a8ac88','域名注册','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/c6268756-5bb3-43c5-bb79-bdea0cea0535.jpg','<table bgcolor=\"#cccccc\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" style=\"color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\" width=\"735\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#e7e7e7\" height=\"30\" width=\"50%\">\r\n				<strong>域名类型</strong></td>\r\n			<td align=\"center\" bgcolor=\"#e7e7e7\">\r\n				<strong>价格</strong></td>\r\n			<td align=\"center\" bgcolor=\"#e7e7e7\">\r\n				<strong>续费价格</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" rowspan=\"3\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					com/net/org英文</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">\r\n				<h4>\r\n					138元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\" rowspan=\"3\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">\r\n				<h4>\r\n					240元/个/2年</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">\r\n				<h4>\r\n					520元/个/5年</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f9f9\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					com/net中文</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					280元/个/年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" rowspan=\"3\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					cn/com.cn/net.cn/org.cn<br />\r\n					/gov.cn/国内行政区域名</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">\r\n				<h4>\r\n					100元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\" rowspan=\"3\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">\r\n				<h4>\r\n					190元/个/2年</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#ffffff\" height=\"30\">\r\n				<h4>\r\n					480元/个/5年</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f9f9\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					cn(中国)/网络/公司(中文)</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					320元/个/年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					英文.cc</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					400元/个/年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f9f9\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					中文.cc</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					400元/个/年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					biz英文</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					480元/个/2年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f9f9\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					info英文</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					480元/个/2年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					通用网址</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					500元/个/年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f9f9\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					域名过户</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					500元/个/次</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					中文域名转移</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					320元个/次</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#efefef\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					Me（英文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#efefef\">\r\n				<h4>\r\n					290元/年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#efefef\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					HK（英文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					360元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f9f9\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					HK（中文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					420元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					BIZ（中文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					280元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f9f9\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					TW（英文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					450元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					TW（中文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					420元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f9f9\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					TV（英文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					500元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					MOBI（英文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					180元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					多年优惠</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#f9f9f9\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					ASIA（英文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					150元/个/1年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#f9f9f9\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td bgcolor=\"#ffffff\" height=\"30\" style=\"padding-left: 20px;\">\r\n				<h4>\r\n					Travel（英文）</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					2400元/年</h4>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#ffffff\">\r\n				<h4>\r\n					同新开价格</h4>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	&nbsp;</p>','9cb43e46-d951-408b-9abe-6a955db2e39b','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',1,NULL,'1','domain',NULL,NULL,NULL,NULL,109,0),('9cb43e46-d951-408b-9abe-6a955db2e39b','增值服务','firstChannel.html','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/c6268756-5bb3-43c5-bb79-bdea0cea0535.jpg','','','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',6,NULL,'1','added',NULL,NULL,NULL,NULL,112,0),('a113050b-6b13-4b88-b770-295a43ec857f','行业动态','infoList.html','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/8bec45cd-6c64-4eb6-b585-c26a0957ffa8.jpg','','8be0fe0f-1a10-4cc5-8f50-109246f612fc','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',2,NULL,'1','hydt',NULL,NULL,NULL,NULL,114,NULL),('b74485d7-c4ed-444e-a23a-ee4af9c63194','加入我们','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/b11ffeac-ca55-42bc-a5cb-5e57091f02d4.jpg','<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	招聘网页设计师</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">招聘人数：</span>&nbsp;[1]</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">要求性别：</span>&nbsp;<span class=\"gray\">[不限]</span></p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">要求学历：</span>&nbsp;[大专]</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">要求年龄：</span>&nbsp;<span class=\"gray\">[不限]</span></p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">工作经验：</span>&nbsp;[二年]</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">工作地点：</span>&nbsp;[河南-郑州市]</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">要求身高：</span>&nbsp;<span class=\"gray\">[不限]</span></p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">是否提供住房：</span>&nbsp;[否]</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">计算机水平：</span>&nbsp;[较好]</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span class=\"attr\">语言要求：</span>&nbsp;[中文]</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	岗位职责：&nbsp;<br />\r\n	1、美术设计或相关专业大学专科以上学历；&nbsp;<br />\r\n	2、一年以上大型门户网站设计经验；&nbsp;<br />\r\n	3、要求精通Web页面设计制作，有良好的美术设计能力；熟悉常用平面、网络及多媒体设计软件（Photoshop，Dreamweaver，FireWorks，Flash，Illustrator&hellip;），熟悉（HTML，CSS，JavaScript）；&nbsp;<br />\r\n	4、具有良好的职业素养和职业道德。&nbsp;<br />\r\n	5、工作地点郑州。</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	联系电话：15378777183</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	邮箱：<a href=\"mailto:zzbfsoft@163.com\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">zzbfsoft@163.com</a></p>','020f63d8-0b77-4594-b878-913f03a0fd68','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',2,NULL,'1','job',NULL,NULL,NULL,NULL,132,0),('bbb7bb17-81e8-4565-b19c-e8732331c16b','企业邮箱','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/c6268756-5bb3-43c5-bb79-bdea0cea0535.jpg','<table align=\"center\" bgcolor=\"#bee5f3\" border=\"0\" cellpadding=\"5\" cellspacing=\"1\" style=\"color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<div align=\"center\">\r\n					企业邮箱类型</div>\r\n			</td>\r\n			<td>\r\n				<div align=\"center\">\r\n					服务内容</div>\r\n			</td>\r\n			<td>\r\n				<div align=\"center\">\r\n					价格</div>\r\n			</td>\r\n		</tr>\r\n		<tr bordercolor=\"#cccccc\">\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					LC001</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"left\">\r\n					可以开通2个企业邮箱<br />\r\n					邮箱总容量100M<br />\r\n					&nbsp;</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					200元/年</div>\r\n			</td>\r\n		</tr>\r\n		<tr bordercolor=\"#cccccc\">\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					LC002</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"left\">\r\n					可以开通5个企业邮箱<br />\r\n					邮箱总容量200M<br />\r\n					&nbsp;</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					380元/年</div>\r\n			</td>\r\n		</tr>\r\n		<tr bordercolor=\"#cccccc\">\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					LC003</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"left\">\r\n					可以开通10个企业邮箱<br />\r\n					邮箱总容量 500M<br />\r\n					&nbsp;</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					700元/年</div>\r\n			</td>\r\n		</tr>\r\n		<tr bordercolor=\"#cccccc\">\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					LC004</div>\r\n			</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				可以开通20个企业邮箱<br />\r\n				邮箱总容量1000M</td>\r\n			<td bgcolor=\"#ffffff\">\r\n				<div align=\"center\">\r\n					900元/年</div>\r\n			</td>\r\n		</tr>\r\n		<tr bordercolor=\"#cccccc\">\r\n			<td bgcolor=\"#ffffff\" colspan=\"4\">\r\n				<div align=\"left\">\r\n					<p style=\"padding: 0px; margin: 0px;\">\r\n						如果您想申请更多邮箱，可以享有惊喜折扣。</p>\r\n				</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>','9cb43e46-d951-408b-9abe-6a955db2e39b','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',4,NULL,'1','mail',NULL,NULL,NULL,NULL,135,0),('c8a7f9f1-6dfc-431b-9c1e-a52937742cc1','精彩案例','infoImgList.html','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/171f4d23-ccbe-42ec-90b4-c63fa9766901.jpg','','697e3270-fef7-4af4-a7a3-c66b761f8f91','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',8,NULL,'1','jcal',NULL,NULL,NULL,NULL,141,NULL),('ce41d0e1-bd56-4e94-b23c-ed9be25e7466','手机软件开发','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/72cc3ea3-f9ac-48bc-a627-d93a219ee79e.jpg','<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	移动互联网时代已近到来，人们用智能手机便捷的上网，学习、游戏。人们对手机的依赖程度远远超过电脑。<a href=\"http://www.zzbfsoft.com/listOne.aspx?channel=ywjs\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">手机软件</a>(<a href=\"http://www.zzbfsoft.com/listOne.aspx?channel=ywjs\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">手机客户端</a>）开发，迫在眉睫。郑州博丰软件有限公司提供<span style=\"widows: 2; background-color: rgb(251, 251, 251); font-size: 12px; line-height: 25px; font-family: simsun; orphans: 2; color: rgb(0, 0, 0);\">android、IOS、ipad、android pad<span font-family:=\"\" mso-ascii-font-family:=\"\" mso-hansi-font-family:=\"\" new=\"\" style=\"font-size: 12px;\" times=\"\">等</span><span style=\"font-size: 12px;\">BS/CS</span><span font-family:=\"\" mso-ascii-font-family:=\"\" mso-hansi-font-family:=\"\" new=\"\" style=\"font-size: 12px;\" times=\"\">结构手机软件开发服务。</span></span></p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span style=\"widows: 2; background-color: rgb(251, 251, 251); font-size: 12px; line-height: 25px; font-family: simsun; orphans: 2; color: rgb(0, 0, 0);\"><span font-family:=\"\" mso-ascii-font-family:=\"\" mso-hansi-font-family:=\"\" new=\"\" style=\"font-size: 12px;\" times=\"\">手机软件案列一：</span></span></p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span style=\"widows: 2; background-color: rgb(251, 251, 251); font-size: 12px; line-height: 25px; font-family: simsun; orphans: 2; color: rgb(0, 0, 0);\"><span font-family:=\"\" mso-ascii-font-family:=\"\" mso-hansi-font-family:=\"\" new=\"\" style=\"font-size: 12px;\" times=\"\">项目名称：移动巡检android客户端&nbsp;&nbsp;</span></span></p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px; text-align: center;\">\r\n	<span style=\"widows: 2; background-color: rgb(251, 251, 251); font-size: 12px; line-height: 25px; font-family: simsun; orphans: 2; color: rgb(0, 0, 0);\"><span font-family:=\"\" mso-ascii-font-family:=\"\" mso-hansi-font-family:=\"\" new=\"\" style=\"font-size: 12px;\" times=\"\"><img align=\"absMiddle\" alt=\"\" height=\"400\" src=\"http://zzbfsoft.com/UserFiles/Image/%E7%A7%BB%E5%8A%A8%E5%B7%A1%E6%A3%80.png\" style=\"border: 0px;\" width=\"240\" /></span></span></p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 18px;\">\r\n	<span style=\"widows: 2; background-color: rgb(251, 251, 251); font-size: 12px; line-height: 25px; font-family: simsun; orphans: 2; color: rgb(0, 0, 0);\"><span font-family:=\"\" mso-ascii-font-family:=\"\" mso-hansi-font-family:=\"\" new=\"\" style=\"font-size: 12px;\" times=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n	&nbsp;&nbsp; 本手机app软件是一款移动巡检手机客户端，移动巡检广泛应用于各行各业，特别是业务一线的工作人员手中，使用本android手机客户端可以实现实时的巡检信息上报，并可以获得中心下发的各种通知信息，并利用移动定位技术实现各种位置服务，便于管理端方便的掌握各种位置信息。由于移动巡检具备各种优势，现在正在各行业内部得到广泛的应用。&nbsp;<br />\r\n	&nbsp;&nbsp;&nbsp; 涉及技术：界面编程、网络编程、数据存储技术等&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n	&nbsp;&nbsp;&nbsp; 适用手机：Android2.0及以上版本的手机和平板 &nbsp; &nbsp; &nbsp; &nbsp;</span></span></p>','3c1a1583-395f-44dd-a870-769eb87071ad','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',1,NULL,'1','msoft',NULL,NULL,NULL,NULL,143,0),('d8117b2d-f851-4e99-84e0-2cca423c1ac5','网站推广','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/c6268756-5bb3-43c5-bb79-bdea0cea0535.jpg','<p>\r\n	&nbsp;</p>\r\n<div>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<strong><span style=\"font-family:宋体;\">什么是搜索推广</span></strong></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">搜索推广是以搜索引擎（百度、谷歌）为依托，事先选取大量目标顾客利用搜索引擎寻找商品时常常被使用到的关键词。利用搜索引擎优化技术（</span>SEO<span style=\"font-family:宋体;\">技术）使目标顾客在使用这些关键词搜索商品时，最先查询到您的网站信息，由此达到推广的目的。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<span style=\"font-family:宋体;\">简而言之，就是当顾客搜索商品或服务时，我们让您的网站出现在百度、谷歌的第一页。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">搜索推广常见的问题</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<strong><span style=\"font-family:宋体;\">搜索推广的最大优势是什么？　　</span></strong></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">搜索推广是利用世界最大中文网站&mdash;&mdash;百度&mdash;&mdash;或世界最大的英文网站&mdash;&mdash;谷歌&mdash;&mdash;为企业带来的一场营销方式的革命，依托这两大搜索引擎平台，独创词组推广，按效果付费的网络推广方式，客户可以使用最少的广告投入达到最大的广告效果，轻松实现行商变坐商，用更少的投入带来更多的客户。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<strong><span style=\"font-family:宋体;\">做搜索推广需要投入多少费用？　　</span></strong></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">为了保证您的推广效果，我们的搜索推广产品是组合词推广的，首先您确定不少于</span>10<span style=\"font-family:宋体;\">个和你产品有关的关键词，我们根据这些词的搜索量大小，确定出每个词的推广价格。最终我们是依据成功推广上线的关键词收费的。推广一年的费用最低仅为几千元。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<strong><span style=\"font-family:宋体;\">我们公司规模小，推广费用有限，搜索推广能帮助我们吗？　　</span></strong></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">搜索推广是一种性价比很高的推广方式，企业花少量的钱就可以获得潜在客户、尝试先进的搜索营销服务。搜索推广不仅适合大企业，更适合中小企业。这比雇业务员、开办事处更经济实惠。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<strong><span style=\"font-family:宋体;\">搜索推广也是按点击收费的吗？　　</span></strong></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">搜索推广不同于百度公司或谷歌公司的的竞价排名广告或网盟广告，不是按点击次数乘点击单价收费的，搜索推广的费用是一次性按所要推广的关键词，以一年为一个单位进行计价的。费用一旦确定好后，在这一年中，您推广的关键词无论是被意向客户、同行或不相关网民等点击多少次都不会产生额外费用。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<strong><span style=\"font-family:宋体;\">我们现在天天出门找生意，能让生意找上门吗？　　</span></strong></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">搜索推广是一种投资少见效快、灵活性极强的推广方式。如果企业选择</span>21<span style=\"font-family:宋体;\">世纪营销主流&mdash;&mdash;网络营销，那么搜索推广是当之无愧的首选服务。用百度、谷歌找您的都是有潜在需求的客户，因为客户有需求才会主动在百度、谷歌上搜索与您的产品相关的内容。搜索推广帮您从行商变成坐商，让生意主动去找您。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">搜索推广和传统的报纸、电视等推广方式有什么区别？　　</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">搜索推广最突出的特点在于广告投放精准度高，是直接向潜在客户投放的，只有真正需要购买某种商品了，客户才会使用这个商品（关键词）进行搜索寻找，是针对性最强的一种广告方式。而且是客户主动找上门，行商变坐商，效果更好。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;\">\r\n		<span style=\"font-family:宋体;\">　　其次，传统媒体推广费用动辄成千上万，几十万，门槛很高，对于中小企业而言，一次投入这么多，风险也很大。而搜索推广的客户一次投入几千元，适合更多的中小企业开展有效的推广。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<span style=\"font-family:宋体;\">另外，通过搜索推广，可以把意向客户引导到企业网站上来，通过网站这个综合的图文并茂的展示平台，以更加丰富的信息、提供更多互动功能等，帮助企业达到更好的推广效果。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<strong><span style=\"font-family:宋体;\">如何选择要推广的关键词？　　</span></strong></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<span style=\"font-family:宋体;\">选择关键词的诀窍在于全面考虑词汇与您产品或服务的相关性、网民关注程度、表现形式等等。最关键的是把握好两个原则：一是关键词要尽可能多，二是关键词要尽可能具体。原因如下：</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<span style=\"font-family:宋体;\">一、尽可能多是因为：根据对百度及谷歌搜索数据统计结果分析来看，对应一类产品或服务而言，不同的客户在搜索寻找时，绝对不会使用同一个关键词进行搜索，而且，即便是同一个客户，不同时候，也会使用不同的关键词进行搜索，而是常常会使用各种各样的词或甚至短语。所以，只有尽可能多的关键词，才能尽可能多的覆盖到目标客户。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<span style=\"font-family:宋体;\">比如：搜寻&ldquo;矿山机械&ldquo;产品的客户，就按最常见的搜索行为统计来看，也会有很多，如：矿山机械设备、矿山机械公司、选矿设备、机械设备厂、选矿设备厂、矿山破碎机、矿山破碎机机械、郑州破碎机、破碎机厂、破碎机设备、粉碎机设备、机械粉碎机、粉碎设备、制砂设备、制砂设备厂、制砂机设备、制砂机生产厂家、磨粉设备、球磨机设备、烘干设备、烘干机设备&hellip;&hellip;</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<span style=\"font-family:宋体;\">如果再考虑到还有很多客户，干脆会直接用具体产品名称针对性的搜寻，那就更多。如：</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<span style=\"font-family:宋体;\">反击式破碎机、锤式破碎机、鄂式破碎机、圆锥破碎机、冲击式破碎机、双辊破碎机、复合式破碎机、砂石生产线、管式球磨机、格子球磨机、水泥球磨机、陶瓷球磨机、圆锥球磨机、棒磨制砂机、钢球磨煤机、防爆球磨机、干式磁选机、湿式磁选机、除铁机、磁滑轮、河砂磁选机、高梯度磁选机、螺旋分级机、螺旋溜槽、水力旋流器、摇床、</span>SF<span style=\"font-family:宋体;\">型浮选机、</span>XJM<span style=\"font-family:宋体;\">浮选机、</span>GX<span style=\"font-family:宋体;\">型洗砂机、高效浓缩机、振动筛、滚筒筛、高频筛、直线振动筛、回转窑、单筒冷却机、盘式成球机、煤泥烘干机、转筒烘干机、矿渣烘干机、回转烘干机、三层滚筒烘干机、电磁振动给料、圆盘给料机、槽式给矿机、搅拌桶、皮带输送机、斗式提升机、螺旋输送机、振动给料机&hellip;&hellip;</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<span style=\"font-family:宋体;\">二、尽可能具体是因为：越是具体的词汇，虽然有可能搜索的机率很低，但这也意味着针对性极强。一但有目标用户搜索，您的网站就会被展示在显著的位置，访问者成为您客户的可能性也就更高。</span></p>\r\n	<p style=\"padding:0px;color:rgb(100, 99, 99);font-family:微软雅黑, Arial, Helvetica, sans-serif;font-size:12px;line-height:18px;text-indent:21pt;\">\r\n		<span style=\"font-family:宋体;\">比如：一个要寻找&ldquo;无痛人流&rdquo;的患者，这时候，&ldquo;无痛人流&rdquo;这个关键词明显要比&ldquo;妇产医院&rdquo;这个关键词的针对性强的多，这也就意味着，如果您选择推广的关键词是&ldquo;无痛人流&rdquo;，那么您获得这个客户的机率就要高的多。</span></p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>','9cb43e46-d951-408b-9abe-6a955db2e39b','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',3,NULL,'1','seo',NULL,NULL,NULL,NULL,149,0),('da1ad730-ab99-4106-a694-287d2015d834','解决方案','infoList.html','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/f72a0212-cdec-4ff0-bd59-1192d500149e.jpg','','0d19957e-a05d-4df2-bf82-2eb16f1b7c01','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',2,NULL,'1','solution',NULL,NULL,NULL,NULL,151,0),('dbfeb7af-ba25-4be5-b381-2041315235ce','行业门户网站建设','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/171f4d23-ccbe-42ec-90b4-c63fa9766901.jpg','<div style=\"PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FLOAT: right; PADDING-BOTTOM: 0px; WIDTH: 330px; MARGIN-RIGHT: 40px; PADDING-TOP: 20px; POSITION: relative; HEIGHT: 301px\">\r\n	<div id=\"sidebar1\" style=\"FLOAT: right; WIDTH: 330px; PADDING-TOP: 10px; POSITION: relative; HEIGHT: auto\">\r\n		<h3 style=\"font-size: 16px; color: rgb(85, 83, 84); line-height: 30px;\">\r\n			门户行业型网站</h3>\r\n		<div id=\"cy_lb\" style=\"WIDTH: 370px\">\r\n			<ul style=\"padding-right: 0px; padding-left: 0px; margin: 20px 0px 0px; width: 370px; list-style-type: none;\">\r\n				<li style=\"padding: 0px 0px 0px 40px; font-size: 12px; background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); margin: 0px; width: 370px; color: rgb(102, 102, 102); line-height: 30px; list-style-type: none; background-position: 0% 7px;\">\r\n					赠送国际域名 1 个（免费备案）</li>\r\n				<li style=\"padding: 0px 0px 0px 40px; font-size: 12px; background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); margin: 0px; width: 370px; color: rgb(102, 102, 102); line-height: 30px; list-style-type: none; background-position: 0% 7px;\">\r\n					赠送1000M 虚拟主机 200M 企业邮局可分配 40 个 用户 300M 数据库空间</li>\r\n				<li style=\"padding: 0px 0px 0px 40px; font-size: 12px; background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); margin: 0px; width: 370px; color: rgb(102, 102, 102); line-height: 30px; list-style-type: none; background-position: 0% 7px;\">\r\n					1套精美首页设计,40个内容页面制作</li>\r\n				<li style=\"padding: 0px 0px 0px 40px; font-size: 12px; background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); margin: 0px; width: 370px; color: rgb(102, 102, 102); line-height: 30px; list-style-type: none; background-position: 0% 7px;\">\r\n					信息发布系统,产品发布系统,会员管理系统, 站内搜索系统,人才招聘系统,在线订购系统, 在线调查系统,客户留言系统,在线统计分析系统,BBS论坛</li>\r\n				<li style=\"padding: 0px 0px 0px 40px; font-size: 12px; background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); margin: 0px; width: 370px; color: rgb(102, 102, 102); line-height: 30px; list-style-type: none; background-position: 0% 7px;\">\r\n					免费维护一年,在无需触动页面整体风格的情况下。</li>\r\n				<li style=\"padding: 0px 0px 0px 40px; font-size: 12px; background-image: url(http://www.zzbfsoft.com/images/service-li.jpg); margin: 0px; width: 370px; color: rgb(102, 102, 102); line-height: 30px; list-style-type: none; background-position: 0% 7px;\">\r\n					免费搜索引擎登记</li>\r\n			</ul>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div id=\"sidebar5\" style=\"PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FLOAT: right; PADDING-BOTTOM: 0px; WIDTH: 288px; MARGIN-RIGHT: 40px; PADDING-TOP: 20px; POSITION: relative; HEIGHT: 316px\">\r\n	<img alt=\"\" height=\"169\" src=\"http://www.zzbfsoft.com/images/taocan04.jpg\" style=\"BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px\" width=\"170\" /></div>\r\n<div id=\"line7\" style=\"MARGIN-TOP: 50px; FLOAT: left; MARGIN-BOTTOM: 20px; WIDTH: 560px\">\r\n	<div id=\"design_cp\" style=\"FLOAT: right; VERTICAL-ALIGN: bottom; WIDTH: 150px; MARGIN-RIGHT: 25px; HEIGHT: 80px\">\r\n		<div id=\"design_cp_img\" style=\"WIDTH: 80px; HEIGHT: 80px\">\r\n			<img alt=\"卓越门户型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/t4_3.gif\" style=\"BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"MARGIN-TOP: -25px; FONT-SIZE: 12px; MARGIN-LEFT: 90px; COLOR: rgb(102,102,102)\">\r\n			卓越门户型</div>\r\n	</div>\r\n	<div id=\"design_cp\" style=\"FLOAT: right; VERTICAL-ALIGN: bottom; WIDTH: 150px; MARGIN-RIGHT: 25px; HEIGHT: 80px\">\r\n		<div id=\"design_cp_img\" style=\"WIDTH: 80px; HEIGHT: 80px\">\r\n			<img alt=\"专业服务型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/t4_2.gif\" style=\"BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"MARGIN-TOP: -25px; FONT-SIZE: 12px; MARGIN-LEFT: 90px; COLOR: rgb(102,102,102)\">\r\n			专业服务型</div>\r\n	</div>\r\n	<div id=\"design_cp\" style=\"FLOAT: right; VERTICAL-ALIGN: bottom; WIDTH: 150px; MARGIN-RIGHT: 25px; HEIGHT: 80px\">\r\n		<div id=\"design_cp_img\" style=\"WIDTH: 80px; HEIGHT: 80px\">\r\n			<img alt=\"综合门户型网站\" height=\"80\" src=\"http://www.zzbfsoft.com/images/t4_1.gif\" style=\"BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px\" width=\"80\" /></div>\r\n		<div id=\"design_cp_name\" style=\"MARGIN-TOP: -25px; FONT-SIZE: 12px; MARGIN-LEFT: 90px; COLOR: rgb(102,102,102)\">\r\n			综合门户型</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>','697e3270-fef7-4af4-a7a3-c66b761f8f91','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',2,NULL,'1','portal',NULL,NULL,NULL,NULL,153,0),('dd29e8b6-0d32-4e12-b99c-daa996baaeb2','关于博丰','firstChannel.html','','','','','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',1,NULL,'1','aboutbf',NULL,NULL,NULL,NULL,155,0),('f2bce4ef-e9af-498b-9b85-1f8782bf80a8','WSCMS(内容管理系统)','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/b7d31659-6463-4bb2-a9f6-a2d6aeb5d237.jpg','<p>\r\n	WS系列内容管理系统是国内最专业的java网站内容管理系统之一，它将是您轻松建站的首选利器。它最大的特点就是摒弃所谓的伪静态化处理（所谓伪静态，即每次访问页面时依然访问数据库，这样会造成服务器压力，降低系统性能与访问速度），实现真正的静态化页面处理技术，提高系统性能与访问速度。采用struts2.0+MyBatis3+Freemaker2.3.16技术框架，开发有WSCMS专用页面标签，以XML命名空间风格创建页面模板，模板全部使用文件形式保存，对用户设计模板、网站升级转移均提供很大的便利，健壮的模板标签为网站管理员DIY 自己的网站提供了强有力的支持。模型与模块概念并存：在模型不能满足用户所有需求的情况下，WSCMS推出一些互动的模块对系统进行补充，尽量满足用户的需求。众多的应用支持：为用户提供了各类网站建设的一体化解决方案，并支持网站群建设。<br />\r\n	本系统现在的版本为V2.0。<br />\r\n	WSCMS最适合应用于以下领域：<br />\r\n	&bull;政府机关，通过建立政府门户，有利于各种信息和资源的整合，为政府和社会公众之间加强联系和沟通，从而使政府可以更快、更便捷、更有效开展工作；<br />\r\n	&bull;行业网站，针对不同行业，强化内部的信息划分，体现行业的特色，网站含有行业的动态信息、产品、市场、技术、人才等信息，树立行业信息权威形象，为行业内产品供应链管理，提供实际的商业机会；<br />\r\n	&bull;教育机构，通过网络信息的引入，使得教育机构之间及教育机构内部和教育者之间进行信息传递，全面提升教育类网站的层面；<br />\r\n	&bull;媒体机构，互联网这种新媒体已经强而有力的冲击了传统媒体，在这个演变过程中，各类媒体机构应对自己核心有一个重新认识和重新发展的过程，建立一个数字技术平台以适应数字化时代的需求；<br />\r\n	&bull;收费网站，内容收费类型的网站，用户可以在线提供产品销售，或者内容收费，简单清晰的盈利模式，确保您以最小的投资，取得最大的回报；<br />\r\n	&bull;企业网站，无论大型还是中小型企业，利用网络传递信息在一定程度上提高了办事的效率，提高企业的竞争力；<br />\r\n	&bull;个人站长，兴趣为主导，建立各种题材新颖，内容丰富的网站，通过共同兴趣的信息交流，可以让您形成自己具有特色的用户圈，产生个人需求，并为其服务；</p>','0d19957e-a05d-4df2-bf82-2eb16f1b7c01','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',4,NULL,'1','wscms',NULL,NULL,NULL,NULL,168,0),('fd2b9f55-3be2-4f12-81c0-98daf3c3b234','公司简介','','','/upload/6ec601fd-69a0-4469-a6f7-d1edb7136481/1b251c23-460d-4f0d-9318-940bf0938bc8.jpg','<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; line-height: 17.99715805053711px;\">\r\n	郑州<strong>博丰<a href=\"http://www.zzbfsoft.com/listOne.aspx?channel=rjdz\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">软件开发</a></strong>有限公司是一家以<strong><a href=\"http://http//zzbfsoft.com/listOne.aspx?channel=rjdz\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">软件开发</a>，政府门户<a href=\"http://http//zzbfsoft.com/listOne.aspx?channel=jzlc\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">网站制作</a></strong>/建设开发/以及<a href=\"http://www.zzbfsoft.com/listOne.aspx?channel=wztc\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">企业网站建设</a>/ 制作/，<a href=\"http://www.zzbfsoft.com/listOne.aspx?channel=sjwzjs\" style=\"color: rgb(153, 153, 153); text-decoration: none;\"><strong>手机网站</strong></a>wap<strong><a href=\"http://www.zzbfsoft.com/listOne.aspx?channel=sjwzjs\" style=\"color: rgb(153, 153, 153); text-decoration: none;\">手机客户端软件</a></strong>APP开发/建设/制作为主营业务的技术服务型软件企业。公司以高科技为起点、以技术为核心、以强大的技术队伍为支撑，致力于为政府、企事业单位提供高技术含量的门户网站、软件应用解决方案及增值服务。博丰软件拥有一支高素质的技术研发队伍和经验丰富的客户服务队伍，具备一流的从事<strong>政府门户网站建设</strong>、管理软件定制开发、手机wap网站开发手机客户端APP软件开发等方面的系统架构工程师、软件开发人员、UI设计师。在政府门户网站建设方面具有丰富的设计、建设维护经验。先后签约河南省住房和城乡建设厅门户网站，开封市检察院内网门户网站，开封市财政局门户网站群，开封水利局门户网站群、平顶山石龙区政府门户网站群的建设和维护。在大型门户网站群建设等领域始终保持领先地位，并获得了社会各界的广泛赞誉和认同。大力倡导推行品牌战略，促进河南软件开发事业和大型门户网站建设行业的发展。<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 质量和信誉是企业存在的基石。我们注重客户提出的每个要求，我们充分考虑每一个细节，我们积极的做好服务，努力开拓更好的视野。通过不懈的努力，我们赢得了业内的良好声誉，这一切，也不断的激励着我们更好的服务客户。</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; line-height: 17.99715805053711px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我们的品牌对我们的产品和服务质量提出了严格要求，确保用户能够获得优秀的软件产品和服务。同时也证明他们所使用的产品具有优良的性能。</p>\r\n<p style=\"padding: 0px; margin: 0px; color: rgb(100, 99, 99); font-family: 微软雅黑, Arial, Helvetica, sans-serif; line-height: 17.99715805053711px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 郑州博丰软件开发有限期待与您的合作！</p>','dd29e8b6-0d32-4e12-b99c-daa996baaeb2','6ec601fd-69a0-4469-a6f7-d1edb7136481','','1',1,NULL,'1','profile',NULL,NULL,NULL,NULL,174,0);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isOk` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderNum` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
INSERT INTO `func` VALUES ('003c47c5-7041-4cfa-8631-82c00ab3fb35','菜单管理','1','101','func.jsp','a5452f4f-1a1b-4980-90a3-4a60a38ba373'),('03902986-1ddb-40af-b6f8-4443e1ad7efb','访问频率统计','1','6','cms/stat_visit.do','80453df3-35df-4c63-bbb5-1c333eadc8ab'),('08cfd343-2803-403e-b952-f7d41199d8e1','快速添加','1','0','cms/info_edit.do','cb42d736-3386-42b8-a9f7-62840c4ecefa'),('0bec6b84-19be-4d99-bc44-ca1d8472148f','图片链接列表','1','4','cms/link_list.do?link.type=2','26622672-9a10-4e4e-93a7-7fe50a9208b4'),('12187d67-5ab9-4ae4-bbee-9a772cebd0de','用户管理','1','1','user_list.do','15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2'),('15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2','用户管理','1','100','','a5452f4f-1a1b-4980-90a3-4a60a38ba373'),('18974989-cd85-48b2-8169-348bc3481ef8','文字链接分类','1','5','cms/link_clazz.do?link.type=3','26622672-9a10-4e4e-93a7-7fe50a9208b3'),('19eebfb0-16b5-40eb-a909-1bd37ef7d745','站点管理','1','0','cms/site_site.do','a5452f4f-1a1b-4980-90a3-4a60a38ba373'),('2403873a-48fb-48ac-acd0-af4098df1a0a','添加用户','1','0','userEdit.jsp','15dfc8ac-bfda-40cc-abb1-f563c1a1d1d2'),('26622672-9a10-4e4e-93a7-7fe50a9208b3','链接分类','1','5','','a5452f4f-1a1b-4980-90a3-4a60a38ba374'),('26622672-9a10-4e4e-93a7-7fe50a9208b4','链接列表','1','6',' ','a5452f4f-1a1b-4980-90a3-4a60a38ba374'),('425d0211-0196-4456-a24b-3e8d614dec8b','信息管理','1','1','cms/info_info.do','cb42d736-3386-42b8-a9f7-62840c4ecefa'),('4331df96-2b8d-4dcf-9bdb-1015dfd0a759','图片链接分类','1','3','cms/link_clazz.do?link.type=2','26622672-9a10-4e4e-93a7-7fe50a9208b3'),('47b80631-bb6e-4abd-8e47-5b99bce8b3bd','操作日志','1','105','operLog_list.do','a5452f4f-1a1b-4980-90a3-4a60a38ba373'),('5257f8fd-9da2-4e83-8538-b6ffca22e45a','模板管理','1','3','cms/template_list.do','64f2084d-3fe7-4345-85c6-4dc835c1b939'),('58fe298f-b448-40bb-a1c0-d81134efa4af','信息页静态化','1','3','cms/html_info.do','e63b222f-3ccb-4e22-b8ab-7cd0dece9f06'),('5a47681c-63c3-47b1-8e1f-34d4dbba7d85','文字链接列表','1','6','cms/link_list.do?link.type=3','26622672-9a10-4e4e-93a7-7fe50a9208b4'),('5f3a8e01-4216-4982-b07b-ad367fe9ef96','栏目页静态化','1','2','cms/html_channel.do','e63b222f-3ccb-4e22-b8ab-7cd0dece9f06'),('64f2084d-3fe7-4345-85c6-4dc835c1b939','站点','1','2','',''),('67025758-eb65-40b1-a59c-edee1b3ae938','下拉链接分类','1','1','cms/link_clazz.do?link.type=1','26622672-9a10-4e4e-93a7-7fe50a9208b3'),('6c561fe7-2013-4ce5-bf9a-42874b07a99e','站点设置','1','1','cms/site_config.do','64f2084d-3fe7-4345-85c6-4dc835c1b939'),('6f32a2b6-a552-4a91-a10c-2962af63eca7','添加角色','1','0','role_edit.do','3dc03dc5-56ba-46d9-b8ab-78d19c04cd86'),('88749e6a-a8ec-47ef-aa4a-f7912d0ed12c','下拉链接列表','1','2','cms/link_list.do?link.type=1','26622672-9a10-4e4e-93a7-7fe50a9208b4'),('a1a4cbf4-b6b1-4028-8476-0222a1671b60','建站向导','1','0','cms/site_guide.do','64f2084d-3fe7-4345-85c6-4dc835c1b939'),('a5452f4f-1a1b-4980-90a3-4a60a38ba373','系统','1','4','',''),('a5452f4f-1a1b-4980-90a3-4a60a38ba374','资源','1','3',' ',' '),('c0ac116b-2b2a-4a09-ba25-0c2fffc12b4d','栏目管理','1','1','cms/channel_channel.do','64f2084d-3fe7-4345-85c6-4dc835c1b939'),('cb42d736-3386-42b8-a9f7-62840c4ecefa','信息管理','1','2','','a5452f4f-1a1b-4980-90a3-4a60a38ba374'),('d301815a-1583-4eb9-b1a2-44f1b819cc9d','系统链接','1','2','adminlink_list.do?adminlink.type=0','a5452f4f-1a1b-4980-90a3-4a60a38ba373'),('dee27e76-ad55-45ff-b007-4f8a31db8621','信息提取','1','3','cms/info_extract.do','cb42d736-3386-42b8-a9f7-62840c4ecefa'),('e3066945-edb5-43ca-b29a-a0f96f98a50e','首页静态化','1','1','cms/html_indexConfirm.do','e63b222f-3ccb-4e22-b8ab-7cd0dece9f06'),('e63b222f-3ccb-4e22-b8ab-7cd0dece9f06','静态化管理','1','4','','64f2084d-3fe7-4345-85c6-4dc835c1b939');
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htmlquartz`
--

DROP TABLE IF EXISTS `htmlquartz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htmlquartz` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `siteId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `channelId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `exeTimeHour` int(11) DEFAULT NULL,
  `exeTimeMin` int(11) DEFAULT NULL,
  `intervalType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `intervalHour` int(11) DEFAULT NULL,
  `intervalMin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htmlquartz`
--

LOCK TABLES `htmlquartz` WRITE;
/*!40000 ALTER TABLE `htmlquartz` DISABLE KEYS */;
/*!40000 ALTER TABLE `htmlquartz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `site` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `shortTitle` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `titleColor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `titleBlod` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin,
  `tags` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `attchs` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isHot` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isTop` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `topEndTime` datetime DEFAULT NULL,
  `clickNum` int(11) DEFAULT NULL,
  `addUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isSign` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isComment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `indexNum` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `openType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `openTimeType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `openEndTime` datetime DEFAULT NULL,
  `htmlIndexNum` int(11) DEFAULT NULL,
  `isImgs` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h0txq3mek8jgvl6m1lamndoui` (`channel`),
  CONSTRAINT `FK_h0txq3mek8jgvl6m1lamndoui` FOREIGN KEY (`channel`) REFERENCES `channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operlogs`
--

DROP TABLE IF EXISTS `operlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operlogs` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `loginName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operTime` datetime DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operlogs`
--

LOCK TABLES `operlogs` WRITE;
/*!40000 ALTER TABLE `operlogs` DISABLE KEYS */;
INSERT INTO `operlogs` VALUES ('ff80808145e46b510145e46cac910000','admin','2014-05-10 12:38:18','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e46b510145e46ff4480001','admin','2014-05-10 12:41:53','退出系统','0:0:0:0:0:0:0:1'),('ff80808145e46b510145e46ffe8c0002','admin','2014-05-10 12:41:56','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e46b510145e47b53c30003','admin','2014-05-10 12:54:18','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e46b510145e47ea4870004','admin','2014-05-10 12:57:56','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e51f3e0145e51f840e0000','admin','2014-05-10 15:53:39','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e51f3e0145e54a90c90001','admin','2014-05-10 16:40:40','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e51f3e0145e563237b0002','admin','2014-05-10 17:07:30','退出系统','0:0:0:0:0:0:0:1'),('ff80808145e51f3e0145e5632f720003','admin','2014-05-10 17:07:33','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e51f3e0145e567d7350004','admin','2014-05-10 17:12:38','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e58d9f0145e58de02e0000','admin','2014-05-10 17:54:11','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e58d9f0145e60b26150001','admin','2014-05-10 20:11:01','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e58d9f0145e60bc4430002','admin','2014-05-10 20:11:42','退出系统','0:0:0:0:0:0:0:1'),('ff80808145e58d9f0145e60bcee30003','admin','2014-05-10 20:11:44','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e58d9f0145e620b0810004','admin','2014-05-10 20:34:33','登陆系统','0:0:0:0:0:0:0:1'),('ff80808145e58d9f0145e620d60f0005','admin','2014-05-10 20:34:42','删除站点demo','0:0:0:0:0:0:0:1'),('ff80808145e58d9f0145e620e9eb0006','admin','2014-05-10 20:34:47','删除站点test','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `operlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `isOk` char(1) NOT NULL,
  `addUser` varchar(50) DEFAULT NULL,
  `roleid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fb09dje83ecstbwxw3f9m3bun` (`roleid`),
  CONSTRAINT `FK_fb09dje83ecstbwxw3f9m3bun` FOREIGN KEY (`roleid`) REFERENCES `role_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_func`
--

DROP TABLE IF EXISTS `role_func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_func` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_func`
--

LOCK TABLES `role_func` WRITE;
/*!40000 ALTER TABLE `role_func` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_site`
--

DROP TABLE IF EXISTS `role_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_site` (
  `id` varchar(50) NOT NULL,
  `roleid` varchar(50) DEFAULT NULL,
  `siteid` varchar(50) DEFAULT NULL,
  `siteadmin` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid` (`roleid`),
  KEY `siteid` (`siteid`),
  CONSTRAINT `role_site_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_site_ibfk_2` FOREIGN KEY (`siteid`) REFERENCES `site` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_site`
--

LOCK TABLES `role_site` WRITE;
/*!40000 ALTER TABLE `role_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `siteDomain` varchar(100) DEFAULT NULL,
  `sourcePath` varchar(500) DEFAULT NULL,
  `copyright` varchar(500) DEFAULT NULL,
  `recordCode` varchar(50) DEFAULT NULL,
  `parId` varchar(50) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `clickNum` int(11) DEFAULT NULL,
  `indexTemplate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES ('6ec601fd-69a0-4469-a6f7-d1edb7136481','企业演示网站','www.zzbfsoft.com','company','','豫ICP备11031096','','1','',NULL,NULL,NULL,'enterprise'),('7a4d22d6-762b-46e5-895b-d62da52bf9cb','FreeCMS','','FreeCMS','FreeTeam','','','1','',NULL,NULL,NULL,'freecms'),('cdb9eaec-fbe1-406a-8e69-80722d50cf8f','淘宝客演示站点','','taoke','','','','1','',NULL,NULL,NULL,'taoke');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `useSites` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `useSiteNames` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderNum` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `addUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2f697efhjgycx8kdpxon51ugh` (`addUser`),
  CONSTRAINT `FK_2f697efhjgycx8kdpxon51ugh` FOREIGN KEY (`addUser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES ('enterprise','企业网站模版','1',' ',' ',' ','02debc9f-53cd-4bc9-887b-49ffc4e925f2'),('freecms','FreeCMS站点模版','1',' ',' ',' ','02debc9f-53cd-4bc9-887b-49ffc4e925f2'),('taoke','淘宝客模版','1',' ',' ',' ','02debc9f-53cd-4bc9-887b-49ffc4e925f2');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_channel`
--

DROP TABLE IF EXISTS `template_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_channel` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contentTemplate` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `site` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clickNum` int(11) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `navigation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pageMark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `htmlChannel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `htmlChannelOld` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `htmlParChannel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `htmlSite` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `templateId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lerccghw88undmd8sv6kfhcbc` (`templateId`),
  CONSTRAINT `FK_lerccghw88undmd8sv6kfhcbc` FOREIGN KEY (`templateId`) REFERENCES `template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_channel`
--

LOCK TABLES `template_channel` WRITE;
/*!40000 ALTER TABLE `template_channel` DISABLE KEYS */;
INSERT INTO `template_channel` VALUES ('0bf0ae54-17d9-4200-9d02-7e43402c071f','手机网站建设','','','','','c41bf1c1-1c02-4084-b0c6-4383f54c1c03','','','1',2,0,'1','msite','','','','','enterprise'),('0d2cd0d5-3f8d-4ab4-a6b2-ee03de5a8fb1','手机软件开发','','','','','c41bf1c1-1c02-4084-b0c6-4383f54c1c03','','','1',1,0,'1','msoft','','','','','enterprise'),('1c01216e-02de-4280-af62-45dc99d62f55','交通地图','','','','','4a2c3cd7-ad26-4448-940d-0f339e24ee17','','','1',3,0,'1','map','','','','','enterprise'),('1d75a339-0375-4075-9acd-04b1668b2da3','观点','信息列表_无栏目.html','','','','','','','1',8,0,'0','gd','','','','','enterprise'),('26922133-16a6-413e-acf9-3af4a27e51be','网站推广','','','','','c81fccdb-ac5b-45cf-b36f-18aec59520b6','','','1',3,0,'1','seo','','','','','enterprise'),('270c0b76-fe97-4529-af19-be7f765c7468','WS应用集成系统','','','','','d7f3eb60-8f63-4cee-aeab-18131ec6fd4d','','','1',3,0,'1','ws','','','','','enterprise'),('27bafd0d-b20e-48c3-92e6-3ab6ab941f09','精彩案例','信息图片列表.html','','','','b25be563-1d25-427c-9996-8da6eedaf9ee','','','1',8,0,'1','jcal','','','','','enterprise'),('2ca25ff6-eebd-4eec-b60b-08de9318c048','新闻中心','跳转到第一个子栏目.html','','','','','','','1',2,0,'1','news','','','','','enterprise'),('471ebc5c-7857-4bb7-abca-95955974a1be','公司简介','','','','','8a5637b1-08d0-4149-8612-3fc16ad158e0','','','1',1,0,'1','profile','','','','','enterprise'),('4a2c3cd7-ad26-4448-940d-0f339e24ee17','联系我们','跳转到第一个子栏目.html','','','','','','','1',7,0,'1','contactus','','','','','enterprise'),('4e42d433-e3ee-4655-94c0-7b87495afe83','软件定制开发','','','','','d7f3eb60-8f63-4cee-aeab-18131ec6fd4d','','','1',1,0,'1','softcustom','','','','','enterprise'),('5c4269af-b534-4f5b-9be1-2364351cf40a','企业门户网站建设','','','','','b25be563-1d25-427c-9996-8da6eedaf9ee','','','1',4,0,'1','com','','','','','enterprise'),('764ec0eb-31c1-4c15-8f48-140b2883e808','常见问题','信息列表.html','','','','b25be563-1d25-427c-9996-8da6eedaf9ee','','','1',5,0,'1','FAQ','','','','','enterprise'),('76577e05-7293-43c7-a583-f652f5ad5c46','博丰动态','信息列表.html','','','','2ca25ff6-eebd-4eec-b60b-08de9318c048','','','1',1,0,'1','bfdt','','','','','enterprise'),('7ee832d6-2447-469f-ad0c-26abb641f70f','行业门户网站建设','','','','','b25be563-1d25-427c-9996-8da6eedaf9ee','','','1',2,0,'1','portal','','','','','enterprise'),('8a5637b1-08d0-4149-8612-3fc16ad158e0','关于博丰','跳转到第一个子栏目.html','','','','','','','1',1,0,'1','aboutbf','','','','','enterprise'),('94b3b6b2-8ad9-492d-937b-7316bd559698','政府门户网站建设','','','','','b25be563-1d25-427c-9996-8da6eedaf9ee','','','1',1,0,'1','gov','','','','','enterprise'),('a9658bff-60b9-4e4f-a164-3f6e2bc7eb68','加入我们','','','','','4a2c3cd7-ad26-4448-940d-0f339e24ee17','','','1',2,0,'1','job','','','','','enterprise'),('aa1007e0-906e-42c1-bef2-d8396608683b','WSCMS(内容管理系统)','','','','','d7f3eb60-8f63-4cee-aeab-18131ec6fd4d','','','1',4,0,'1','wscms','','','','','enterprise'),('b1800932-5620-42f4-aa16-1c04dda3b902','域名注册','','','','','c81fccdb-ac5b-45cf-b36f-18aec59520b6','','','1',1,0,'1','domain','','','','','enterprise'),('b25be563-1d25-427c-9996-8da6eedaf9ee','网站建设','跳转到第一个子栏目.html','','','','','','','1',4,0,'1','website','','','','','enterprise'),('c32e4169-e86b-401a-b35e-943e128a934a','解决方案','信息列表.html','','','','d7f3eb60-8f63-4cee-aeab-18131ec6fd4d','','','1',2,0,'1','solution','','','','','enterprise'),('c41bf1c1-1c02-4084-b0c6-4383f54c1c03','手机开发','跳转到第一个子栏目.html','','','','','','','1',5,0,'1','mobile','','','','','enterprise'),('c81fccdb-ac5b-45cf-b36f-18aec59520b6','增值服务','跳转到第一个子栏目.html','','','','','','','1',6,0,'1','added','','','','','enterprise'),('d7f3eb60-8f63-4cee-aeab-18131ec6fd4d','软件开发','跳转到第一个子栏目.html','','','','','','','1',3,0,'1','soft','','','','','enterprise'),('dab9fce5-57cc-48f9-951f-5836f0c518a5','400电话','','','','','c81fccdb-ac5b-45cf-b36f-18aec59520b6','','','1',6,0,'1','400','','','','','enterprise'),('e119da91-9d50-48f4-ac60-7b58e5d33526','网站建站流程','','','','','b25be563-1d25-427c-9996-8da6eedaf9ee','','','1',6,0,'1','flow','','','','','enterprise'),('e3b744ee-4103-42fd-87ad-6891082931d1','行业动态','信息列表.html','','','','2ca25ff6-eebd-4eec-b60b-08de9318c048','','','1',2,0,'1','hydt','','','','','enterprise'),('e68bc8fc-0d46-41bb-9c3b-13a9c1f412fd','虚拟主机','','','','','c81fccdb-ac5b-45cf-b36f-18aec59520b6','','','1',0,0,'1','host','','','','','enterprise'),('fa85af55-82f8-47ec-a805-1241440e76e6','联系方式','','','','','4a2c3cd7-ad26-4448-940d-0f339e24ee17','','','1',1,0,'1','contact','','','','','enterprise'),('faada5ba-0c25-4812-b635-23baef8c9812','企业邮箱','','','','','c81fccdb-ac5b-45cf-b36f-18aec59520b6','','','1',4,0,'1','mail','','','','','enterprise');
/*!40000 ALTER TABLE `template_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_link`
--

DROP TABLE IF EXISTS `template_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_link` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isOk` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `site` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pageMark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dtgo0jxtba8k3rdkm1duwgtsj` (`template`),
  CONSTRAINT `FK_dtgo0jxtba8k3rdkm1duwgtsj` FOREIGN KEY (`template`) REFERENCES `template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_link`
--

LOCK TABLES `template_link` WRITE;
/*!40000 ALTER TABLE `template_link` DISABLE KEYS */;
INSERT INTO `template_link` VALUES ('578d196f-6738-4254-8a2f-7e315862198a','','友情链接','','1',0,'','3','','yqlj','enterprise'),('77884fdd-d496-4b4c-95a3-85b89ddc5958','','首页切换图','','1',0,'','2','','index','enterprise');
/*!40000 ALTER TABLE `template_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `loginName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `roleNames` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pwd` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobilephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isOk` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `lastestLoginTime` datetime DEFAULT NULL,
  `loginFailNum` int(11) DEFAULT NULL,
  `loginNum` int(11) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  `unitNames` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unitIds` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ismail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('02debc9f-53cd-4bc9-887b-49ffc4e925f2','admin','管理员;','hackingwu','admin','1',NULL,'','','freeteam@foxmail.com','1','2014-05-10 20:11:44','2014-05-10 20:34:33',0,0,NULL,'','','1'),('fdc995ef-e96f-4c00-9746-4b5a9b365caa','freecms','站点管理员;','freecms','523af537946b79c4f8369ed39ba78605','1','2012-11-06 00:00:00','','','','1','2013-06-28 16:56:05','2013-06-28 16:56:45',0,0,'2012-11-28 20:25:41','freeteam','freeteam;',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-11 10:20:51
