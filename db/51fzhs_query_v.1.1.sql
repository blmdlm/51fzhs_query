CREATE DATABASE  IF NOT EXISTS `51fzhs_info` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `51fzhs_info`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: 51fzhs_info
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '区域名称',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'华东'),(2,'华南'),(3,'华北'),(4,'华中'),(5,'西南'),(6,'西北'),(7,'东北'),(8,'港澳台');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(45) NOT NULL COMMENT '学校名称',
  `pid` int(11) NOT NULL COMMENT '省份id',
  PRIMARY KEY (`cid`),
  KEY `cp_idx` (`pid`),
  CONSTRAINT `cp` FOREIGN KEY (`pid`) REFERENCES `province` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='大学';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1,'西北工业大学',27);
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `collegeinfo`
--

DROP TABLE IF EXISTS `collegeinfo`;
/*!50001 DROP VIEW IF EXISTS `collegeinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `collegeinfo` (
  `cid` tinyint NOT NULL,
  `cname` tinyint NOT NULL,
  `pname` tinyint NOT NULL,
  `aname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doctoral`
--

DROP TABLE IF EXISTS `doctoral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctoral` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `cid` int(11) NOT NULL COMMENT '学校id',
  `mid` int(11) NOT NULL COMMENT '专业id',
  PRIMARY KEY (`did`),
  KEY `du_idx` (`uid`),
  KEY `dc_idx` (`cid`),
  KEY `dm_idx` (`mid`),
  CONSTRAINT `dc` FOREIGN KEY (`cid`) REFERENCES `college` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dm` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `du` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctoral`
--

LOCK TABLES `doctoral` WRITE;
/*!40000 ALTER TABLE `doctoral` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctoral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '专业名称',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'软件工程');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postgraduate`
--

DROP TABLE IF EXISTS `postgraduate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postgraduate` (
  `pgid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `cid` int(11) NOT NULL COMMENT '学校id',
  `mid` int(11) NOT NULL COMMENT '专业id',
  PRIMARY KEY (`pgid`),
  KEY `pu_idx` (`uid`),
  KEY `pc_idx` (`cid`),
  KEY `pm_idx` (`mid`),
  CONSTRAINT `pc` FOREIGN KEY (`cid`) REFERENCES `college` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pm` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pu` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postgraduate`
--

LOCK TABLES `postgraduate` WRITE;
/*!40000 ALTER TABLE `postgraduate` DISABLE KEYS */;
/*!40000 ALTER TABLE `postgraduate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(30) NOT NULL COMMENT '省份名称',
  `aid` int(11) NOT NULL COMMENT '区域id',
  PRIMARY KEY (`pid`),
  KEY `pa_idx` (`aid`),
  CONSTRAINT `pa` FOREIGN KEY (`aid`) REFERENCES `area` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'山东',1),(2,'江苏',1),(3,'安徽',1),(4,'浙江',1),(5,'福建',1),(6,'上海',1),(7,'广东',2),(8,'广西',2),(9,'海南',2),(10,'北京',3),(11,'天津',3),(12,'河北',3),(13,'山西',3),(14,'内蒙古',3),(15,'湖北',4),(16,'湖南',4),(17,'河南',4),(18,'江西',4),(19,'四川',5),(20,'云南',5),(21,'贵州',5),(22,'西藏',5),(23,'重庆',5),(24,'宁夏',6),(25,'新疆',6),(26,'青海',6),(27,'陕西',6),(28,'甘肃',6),(29,'辽宁',7),(30,'吉林',7),(31,'黑龙江',7),(32,'香港',8),(33,'澳门',8),(34,'台湾',8);
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '高中学校名称',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'野寨中学'),(2,'潜山中学');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undergraduate`
--

DROP TABLE IF EXISTS `undergraduate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `undergraduate` (
  `ugid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `cid` int(11) NOT NULL COMMENT '学校id',
  `mid` int(11) NOT NULL COMMENT '专业id',
  PRIMARY KEY (`ugid`),
  KEY `uu_idx` (`uid`),
  KEY `uc_idx` (`cid`),
  KEY `um_idx` (`mid`),
  CONSTRAINT `uc` FOREIGN KEY (`cid`) REFERENCES `college` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `um` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uu` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undergraduate`
--

LOCK TABLES `undergraduate` WRITE;
/*!40000 ALTER TABLE `undergraduate` DISABLE KEYS */;
INSERT INTO `undergraduate` VALUES (2,2,1,1);
/*!40000 ALTER TABLE `undergraduate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `graduation` int(11) NOT NULL COMMENT '高中毕业届',
  `class` varchar(30) NOT NULL COMMENT '高中毕业班级',
  `phone` varchar(30) NOT NULL COMMENT '手机号码',
  `qq` varchar(30) NOT NULL COMMENT 'QQ号码',
  `email` varchar(30) NOT NULL COMMENT '电子邮件地址',
  `education` int(11) NOT NULL COMMENT '学历',
  `sid` int(11) NOT NULL COMMENT '高中学校id',
  PRIMARY KEY (`uid`),
  KEY `us_idx` (`sid`),
  CONSTRAINT `us` FOREIGN KEY (`sid`) REFERENCES `school` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'葛京',2011,'308','15399482749','2439054131','gjblmdlm@sina.com',1,1),(3,'李伟',2011,'0','18792504141','','',0,1),(6,'杨飞',0,'','','','',0,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `collegeinfo`
--

/*!50001 DROP TABLE IF EXISTS `collegeinfo`*/;
/*!50001 DROP VIEW IF EXISTS `collegeinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `collegeinfo` AS (select `c`.`cid` AS `cid`,`c`.`cname` AS `cname`,`p`.`pname` AS `pname`,`a`.`aname` AS `aname` from ((`college` `c` join `province` `p`) join `area` `a`) where ((`c`.`pid` = `p`.`pid`) and (`p`.`aid` = `a`.`aid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-05 17:40:34
