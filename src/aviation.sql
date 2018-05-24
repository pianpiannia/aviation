-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: aviation
-- ------------------------------------------------------
-- Server version	5.6.38-log

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
-- Table structure for table `adminuser`
--

DROP TABLE IF EXISTS `adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminuser` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminuser`
--

LOCK TABLES `adminuser` WRITE;
/*!40000 ALTER TABLE `adminuser` DISABLE KEYS */;
INSERT INTO `adminuser` VALUES (1,'admin','123456');
/*!40000 ALTER TABLE `adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `airline` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `purchaseTime` varchar(255) DEFAULT NULL,
  `serviceTime` varchar(255) DEFAULT NULL,
  `firstClass` int(11) DEFAULT NULL,
  `touristClass` int(11) DEFAULT NULL,
  `businessClass` int(11) DEFAULT NULL,
  `repair_time` datetime DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'海航','波音747','2018-04-15','2018-04-16',6,88,22,'2018-04-18 00:00:00',1,'啊实打实的'),(2,'南航','波音747','2017-04-18','2017-04-28',7,111,22,NULL,NULL,'胜多负少'),(3,'东航','波音747','2018-04-17','2018-04-27',10,80,30,NULL,NULL,''),(4,'南航','空客101','2018-03-27','2018-04-09',9,111,30,NULL,NULL,''),(5,'东航','波音767','2018-03-20','2018-03-30',7,88,22,NULL,NULL,'');
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `cpassword` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'lucy','123456','女','去去去','123456781113444444','12001834566','0'),(2,'li','330316','男',NULL,NULL,NULL,'0'),(3,'lu','123456',NULL,NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `ordertime` datetime DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E598384146` (`rid`),
  KEY `FKC3DF62E5A5A139C1` (`cid`),
  CONSTRAINT `FKC3DF62E598384146` FOREIGN KEY (`rid`) REFERENCES `route` (`rid`),
  CONSTRAINT `FKC3DF62E5A5A139C1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (64,'2018-05-14 14:13:11',1,1400,'lucy','222222222222222222',1,3),(65,'2018-05-14 18:40:45',1,1400,'lucy','333333333333333333',1,3),(66,'2018-05-14 19:44:40',1,800,'lucy','111111111111111111',1,3),(67,'2018-05-14 19:45:02',8,999,'lucy','222222222222222222',1,3),(68,'2018-05-14 19:46:13',8,999,'lucy','666666666666666666',1,3),(73,'2018-05-19 20:28:09',14,1400,'lucy','222222222222222222',1,3),(75,'2018-05-19 20:29:14',7,2222,'li','333333333333333333',1,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `start_city` varchar(255) DEFAULT NULL,
  `arrival_city` varchar(255) DEFAULT NULL,
  `flight_date` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `first_price` double DEFAULT NULL,
  `tourist_price` double DEFAULT NULL,
  `business_price` double DEFAULT NULL,
  `captain` varchar(255) DEFAULT NULL,
  `maintenance_people` varchar(255) DEFAULT NULL,
  `terminal_building` varchar(255) DEFAULT NULL,
  `boarding_port` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `first_number` int(11) DEFAULT NULL,
  `tourist_number` int(11) DEFAULT NULL,
  `business_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `FK67AB249F2A76CAF` (`aid`),
  CONSTRAINT `FK67AB249F2A76CAF` FOREIGN KEY (`aid`) REFERENCES `aircraft` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'北京','上海','2018-04-23 00:00:00','2018-04-23 02:02:02','2018-04-23 05:05:05',1400,800,1000,'张三','李四','T1','10A','啊实打实的',2,1,9,0),(2,'北京','成都','2018-04-24 00:00:00','2018-04-24 21:05:04','2018-04-25 00:01:02',1400,800,1000,'赵大','牛二','T2','1A','而奋斗',2,5,100,30),(7,'杭州','上海','2018-04-26 00:00:00','2018-04-26 05:05:06','2018-04-26 19:02:03',2222,700,1111,'张三','李四','T2','1A','',NULL,8,111,30),(8,'成都','北京','2018-04-19 00:00:00','2018-04-19 04:04:04','2018-04-19 15:03:23',3333,999,1555,'赵大','牛二','T1','10A','',1,5,86,22),(10,'上海','北京','2018-04-26 00:00:00','2018-04-26 00:00:00','2018-04-26 21:03:04',2555,555,999,'赵大','牛二','T2','1A','',2,7,111,22),(11,'北京','上海','2018-05-16 00:00:00','2018-05-16 20:02:04','2018-05-16 22:04:04',1400,800,1000,'张三','李四','T2','1A','',NULL,9,111,30),(13,'北京','昆明','2018-05-16 00:00:00','2018-05-16 20:03:03','2018-05-17 00:02:03',3000,1500,2000,'赵大','李四','T2','1A','',1,6,88,22),(14,'北京','上海','2018-05-20 00:00:00','2018-05-20 19:03:05','2018-05-20 22:06:06',1400,800,1000,'张三','李四','T2','1A','',3,9,80,30),(15,'北京','杭州','2018-05-20 00:00:00','2018-05-20 20:04:06','2018-05-20 22:04:10',3000,1500,2200,'张三','李四','T2','1A','',5,7,88,22),(16,'北京','南昌','2018-05-21 00:00:00','2018-05-21 10:04:04','2018-05-21 13:04:04',2000,1000,1500,'张三','李四','T2','1A','',2,7,111,22),(17,'北京','宁波','2018-05-21 00:00:00','2018-05-21 17:03:04','2018-05-21 20:03:03',2400,1200,1800,'张三','李四','T1','1A','',NULL,9,111,30);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-24 20:17:01
