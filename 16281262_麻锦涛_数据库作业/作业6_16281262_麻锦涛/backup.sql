-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------ 
-- Server version	5.7.17

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
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information` (
  `no` varchar(50) NOT NULL,
  `trips` varchar(20) DEFAULT NULL,
  `departure_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `arrival_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `originating_station` varchar(20) DEFAULT NULL,
  `arrival_station` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `trips` (`trips`),
  CONSTRAINT `information_ibfk_1` FOREIGN KEY (`no`) REFERENCES `booking` (`no`),
  CONSTRAINT `information_ibfk_2` FOREIGN KEY (`trips`) REFERENCES `train` (`trips`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information`
--

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` VALUES ('A-01231234','Z43','2017-06-01 04:00:00','2017-06-01 17:40:00','北京','西安','特等座',650,300),('A-07892345','G105','2017-11-25 05:53:55','2017-03-30 08:10:00','北京','上海','商务座',800,210),('A-12361209','K571','2017-07-31 22:00:00','2017-08-01 16:47:00','北京西','厦门','硬座',400,50),('E-00110101','Z43','2017-06-01 04:00:00','2017-06-01 17:40:00','北京','西安','硬卧',750,100),('E-16581231','Z43','2017-06-01 04:00:00','2017-06-01 17:40:00','北京','西安','软卧',780,100),('E-78121222','K571','2017-07-31 22:00:00','2017-08-01 16:47:00','北京西','厦门','软卧',780,300);
/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-25 14:56:28
