-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: telecom
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connections` (
  `idA` int(11) NOT NULL,
  `idB` int(11) NOT NULL,
  PRIMARY KEY (`idA`,`idB`),
  KEY `fk_connections_2_idx` (`idB`),
  CONSTRAINT `fk_connections_1` FOREIGN KEY (`idA`) REFERENCES `sites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_connections_2` FOREIGN KEY (`idB`) REFERENCES `sites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1045699,1045706),(1045699,1045708),(1045706,1045708),(1045708,1045709),(1045708,1045711),(1045699,1045712),(1045706,1045712),(1045708,1045712),(1045711,1045712),(1045706,1045714),(1045712,1045716),(1045714,1045716),(1045712,1045718),(1045714,1045718);
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_1_idx` (`site_id`),
  CONSTRAINT `fk_events_1` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=236987 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (236928,1045708,'2019-04-17 14:48:28','Outage','Possible connection stability issues at this site have been detected.'),(236929,1045709,'2019-04-17 14:48:28','Quality','Possible connection stability issues at this site have been detected.'),(236930,1045709,'2019-04-17 14:48:38','Outage','User had reported an outage in this area.'),(236931,1045709,'2019-04-17 14:48:48','Outage','User had reported an outage in this area.'),(236932,1045714,'2019-04-17 14:48:50','Quality','User had reported an outage in this area.'),(236933,1045711,'2019-04-17 14:48:50','Status','High drop rate has been detected at this site.'),(236934,1045706,'2019-04-17 14:48:58','Quality','User had reported an outage in this area.'),(236935,1045714,'2019-04-17 14:49:00','Quality','High drop rate has been detected at this site.'),(236936,1045699,'2019-04-17 14:49:08','Status','Possible connection stability issues at this site have been detected.'),(236937,1045712,'2019-04-17 14:49:10','Quality','Possible connection stability issues at this site have been detected.'),(236938,1045712,'2019-04-17 14:49:18','Status','User had reported an outage in this area.'),(236939,1045718,'2019-04-17 14:49:20','Status','Possible connection stability issues at this site have been detected.'),(236940,1045706,'2019-04-17 14:49:28','Quality','Possible connection stability issues at this site have been detected.'),(236941,1045709,'2019-04-17 14:49:30','Outage','High drop rate has been detected at this site.'),(236942,1045716,'2019-04-17 14:49:38','Outage','High drop rate has been detected at this site.'),(236943,1045709,'2019-04-17 14:49:40','Quality','Possible connection stability issues at this site have been detected.'),(236944,1045706,'2019-04-17 14:49:48','Quality','User had reported an outage in this area.'),(236945,1045718,'2019-04-17 14:49:50','Outage','User had reported an outage in this area.'),(236946,1045716,'2019-04-17 14:49:58','Quality','Possible connection stability issues at this site have been detected.'),(236947,1045718,'2019-04-17 14:50:00','Outage','User had reported an outage in this area.'),(236948,1045718,'2019-04-17 14:50:08','Quality','High drop rate has been detected at this site.'),(236949,1045718,'2019-04-17 14:50:10','Status','Possible connection stability issues at this site have been detected.'),(236950,1045708,'2019-04-17 14:50:18','Quality','User had reported an outage in this area.'),(236951,1045712,'2019-04-17 14:50:20','Status','Possible connection stability issues at this site have been detected.'),(236952,1045711,'2019-04-17 14:50:28','Status','User had reported an outage in this area.'),(236953,1045709,'2019-04-17 14:50:30','Status','High drop rate has been detected at this site.'),(236954,1045708,'2019-04-17 14:50:38','Quality','User had reported an outage in this area.'),(236955,1045716,'2019-04-17 14:50:40','Outage','Possible connection stability issues at this site have been detected.'),(236956,1045699,'2019-04-17 14:50:48','Quality','User had reported an outage in this area.'),(236957,1045716,'2019-04-17 14:50:50','Quality','User had reported an outage in this area.'),(236958,1045714,'2019-04-17 14:50:58','Status','Possible connection stability issues at this site have been detected.'),(236959,1045714,'2019-04-17 14:51:00','Outage','High drop rate has been detected at this site.'),(236960,1045714,'2019-04-17 14:51:08','Status','High drop rate has been detected at this site.'),(236961,1045708,'2019-04-17 14:51:10','Status','Possible connection stability issues at this site have been detected.'),(236962,1045709,'2019-04-17 14:51:18','Outage','High drop rate has been detected at this site.'),(236963,1045712,'2019-04-17 14:51:20','Outage','Possible connection stability issues at this site have been detected.'),(236964,1045718,'2019-04-17 14:51:28','Status','User had reported an outage in this area.'),(236965,1045706,'2019-04-17 14:51:30','Status','Possible connection stability issues at this site have been detected.'),(236966,1045718,'2019-04-17 14:51:38','Quality','High drop rate has been detected at this site.'),(236967,1045716,'2019-04-17 14:51:40','Outage','Possible connection stability issues at this site have been detected.'),(236968,1045709,'2019-04-17 14:52:00','Status','High drop rate has been detected at this site.'),(236969,1045714,'2019-04-17 14:52:00','Outage','Possible connection stability issues at this site have been detected.'),(236970,1045709,'2019-04-17 14:52:01','Outage','User had reported an outage in this area.'),(236971,1045714,'2019-04-17 14:52:01','Quality','User had reported an outage in this area.'),(236972,1045708,'2019-04-17 14:52:10','Outage','Possible connection stability issues at this site have been detected.'),(236973,1045711,'2019-04-17 14:52:11','Outage','High drop rate has been detected at this site.'),(236974,1045718,'2019-04-17 14:52:20','Quality','Possible connection stability issues at this site have been detected.'),(236975,1045709,'2019-04-17 14:52:21','Status','High drop rate has been detected at this site.'),(236976,1045706,'2019-04-17 14:52:30','Outage','Possible connection stability issues at this site have been detected.'),(236977,1045709,'2019-04-17 14:52:31','Outage','Possible connection stability issues at this site have been detected.'),(236978,1045712,'2019-04-17 14:52:40','Status','High drop rate has been detected at this site.'),(236979,1045718,'2019-04-17 14:52:41','Quality','High drop rate has been detected at this site.'),(236980,1045714,'2019-04-17 14:52:50','Status','User had reported an outage in this area.'),(236981,1045708,'2019-04-17 14:52:51','Status','User had reported an outage in this area.'),(236982,1045714,'2019-04-17 14:53:00','Outage','User had reported an outage in this area.'),(236983,1045718,'2019-04-17 14:53:01','Status','Possible connection stability issues at this site have been detected.'),(236984,1045712,'2019-04-17 14:53:10','Outage','User had reported an outage in this area.'),(236985,1045706,'2019-04-17 14:53:11','Outage','Possible connection stability issues at this site have been detected.'),(236986,1045716,'2019-04-17 14:53:20','Status','User had reported an outage in this area.');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lon` decimal(11,8) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1045699,38.59110000,-121.53630000,'Sacramento'),(1045706,37.96150000,-121.28360000,'Stockton'),(1045708,38.10940000,-122.23700000,'Vallejo'),(1045709,38.44180000,-122.72960000,'Santa Rosa'),(1045711,37.76200000,-122.46460000,'San Francisco'),(1045712,37.37340000,-121.93180000,'San Jose'),(1045714,36.76970000,-119.79490000,'Fresno'),(1045716,34.06630000,-118.35020000,'Los Angeles'),(1045718,34.44320000,-119.81690000,'Santa Barbara');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-29  8:50:36
