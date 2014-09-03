-- MySQL dump 10.13  Distrib 5.6.10, for osx10.8 (x86_64)
--
-- Host: localhost    Database: isotope_14
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `tl_iso_downloads`
--

DROP TABLE IF EXISTS `tl_iso_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_downloads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `singleSRC` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `downloads_allowed` int(5) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(8) NOT NULL DEFAULT 'file',
  `expires` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_downloads`
--
-- ORDER BY:  `id`

-- LOCK TABLES `tl_iso_downloads` WRITE;
/*!40000 ALTER TABLE `tl_iso_downloads` DISABLE KEYS */;
INSERT INTO `tl_iso_downloads` VALUES (1,162,1409138954,'tl_files/2010_demo/layout/gradient.jpg','An image','',0,128,'file','a:2:{s:4:\"unit\";s:7:\"minutes\";s:5:\"value\";s:0:\"\";}');
/*!40000 ALTER TABLE `tl_iso_downloads` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `tl_iso_order_downloads`
--

DROP TABLE IF EXISTS `tl_iso_order_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_order_downloads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `download_id` int(10) unsigned NOT NULL DEFAULT '0',
  `downloads_remaining` varchar(255) NOT NULL DEFAULT '',
  `expires` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_order_downloads`
--
-- ORDER BY:  `id`

LOCK TABLES `tl_iso_order_downloads` WRITE;
/*!40000 ALTER TABLE `tl_iso_order_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_order_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tl_files`
--

DROP TABLE IF EXISTS `tl_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` binary(16) DEFAULT NULL,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` binary(16) DEFAULT NULL,
  `type` varchar(16) NOT NULL DEFAULT '',
  `path` varchar(1022) NOT NULL DEFAULT '',
  `extension` varchar(16) NOT NULL DEFAULT '',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `found` char(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `meta` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `pid` (`pid`),
  KEY `extension` (`extension`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_files`
--
-- ORDER BY:  `id`

-- LOCK TABLES `tl_files` WRITE;
/*!40000 ALTER TABLE `tl_files` DISABLE KEYS */;
INSERT INTO `tl_files` VALUES (1,NULL,1409141114,'g$�-�䩸.&6�f-','folder','tl_files/2010_demo','','fe181e4520aa1a0aab669861f41eef41','1','2010_demo',NULL),(2,'g$�-�䩸.&6�f-',1409141114,'g$�-�䩸.&6�f-','folder','tl_files/2010_demo/layout','','941fdef2922a64ac6faa0cc39f32017d','1','layout',NULL),(3,'g$�-�䩸.&6�f-',1409141114,'g$��-�䩸.&6�f-','file','tl_files/2010_demo/layout/gradient.jpg','jpg','01a3688861fafeb8753808f9e6b9bd07','1','gradient.jpg',NULL),(4,'g$�-�䩸.&6�f-',1409141114,'g$��-�䩸.&6�f-','file','tl_files/2010_demo/layout/logo.png','png','f67b4b8959c67c8345ccf534f1ca080f','1','logo.png',NULL),(5,'g$�-�䩸.&6�f-',1409141114,'g$��-�䩸.&6�f-','file','tl_files/2010_demo/layout/searchButton.png','png','b7a9bee7c62fb5e7a060623d3222ad0a','1','searchButton.png',NULL),(6,'g$�-�䩸.&6�f-',1409141114,'g$��-�䩸.&6�f-','file','tl_files/2010_demo/layout/shoes30.png','png','46a51c739a1aaf99a8e617c3c607a0c2','1','shoes30.png',NULL),(7,'g$�-�䩸.&6�f-',1409141114,'g$��-�䩸.&6�f-','file','tl_files/2010_demo/layout/temp.jpg','jpg','b0ce80d28d5e632c826b16ae96636cc9','1','temp.jpg',NULL),(8,'g$�-�䩸.&6�f-',1409141114,'g$�-�䩸.&6�f-','file','tl_files/2010_demo/layout/tiger.jpg','jpg','0ba1594b329e6a90f2c96d61b9eda669','1','tiger.jpg',NULL),(9,NULL,1409141114,'g$�-�䩸.&6�f-','folder','tl_files/music_academy','','1679e5d338aaf4167826a1dcd4f8cad6','1','music_academy',NULL),(10,'g$�-�䩸.&6�f-',1409141114,'g$�n-�䩸.&6�f-','folder','tl_files/music_academy/campus','','1c445bd0cf48754706802f57d2d103f2','1','campus',NULL),(11,'g$�n-�䩸.&6�f-',1409141114,'g(I-�䩸.&6�f-','file','tl_files/music_academy/campus/campus_building.jpg','jpg','a0ac423df6265537c7b1783ed9cbb698','1','campus_building.jpg','a:1:{s:2:\"en\";a:3:{s:5:\"title\";s:43:\"Historical building on Music Academy campus\";s:4:\"link\";s:0:\"\";s:7:\"caption\";s:19:\"Historical building\";}}'),(12,'g$�n-�䩸.&6�f-',1409141114,'g(H�-�䩸.&6�f-','file','tl_files/music_academy/campus/campus_hall.jpg','jpg','16074d6c3e3dfeb23d580715f486bff2','1','campus_hall.jpg','a:1:{s:2:\"en\";a:3:{s:5:\"title\";s:26:\"Music Academy Lincoln Hall\";s:4:\"link\";s:0:\"\";s:7:\"caption\";s:12:\"Lincoln Hall\";}}'),(13,'g$�n-�䩸.&6�f-',1409141114,'g(H�-�䩸.&6�f-','file','tl_files/music_academy/campus/campus_library.jpg','jpg','1795dc0db4a1efcd2c390e3969ac3d3b','1','campus_library.jpg','a:1:{s:2:\"en\";a:3:{s:5:\"title\";s:28:\"Music Academy campus library\";s:4:\"link\";s:0:\"\";s:7:\"caption\";s:14:\"Campus library\";}}'),(14,'g$�n-�䩸.&6�f-',1409141114,'g(H�-�䩸.&6�f-','file','tl_files/music_academy/campus/campus_overview.jpg','jpg','12360a385a87413fa9914d9f4b0f3113','1','campus_overview.jpg','a:1:{s:2:\"en\";a:3:{s:5:\"title\";s:35:\"Music Academy campus (main bulding)\";s:4:\"link\";s:0:\"\";s:7:\"caption\";s:15:\"Campus overview\";}}'),(15,'g$�n-�䩸.&6�f-',1409141114,'g(H�-�䩸.&6�f-','file','tl_files/music_academy/campus/meta.txt','txt','3b24408a9333e7fa54d13f8e058b5c5b','1','meta.txt',NULL),(16,'g$�-�䩸.&6�f-',1409141114,'g(H�-�䩸.&6�f-','file','tl_files/music_academy/admin.gif','gif','37173d258871c781db2c025060e4f8ab','1','admin.gif',NULL),(17,'g$�-�䩸.&6�f-',1409141114,'g(H�-�䩸.&6�f-','file','tl_files/music_academy/background.gif','gif','b2a05c65803733133c981a2d4e386968','1','background.gif',NULL),(18,'g$�-�䩸.&6�f-',1409141114,'g(H�-�䩸.&6�f-','file','tl_files/music_academy/frontendmodules.gif','gif','4f697b474f6d1e66f442c1c67d574a99','1','frontendmodules.gif',NULL),(19,'g$�-�䩸.&6�f-',1409141114,'g(H�-�䩸.&6�f-','file','tl_files/music_academy/image.png','png','cb636d32a257f7b6337b7392afeab02d','1','image.png',NULL),(20,'g$�-�䩸.&6�f-',1409141114,'g(Hx-�䩸.&6�f-','file','tl_files/music_academy/james-wilson.jpg','jpg','fd894d798786066577c9de8cbe9c1e38','1','james-wilson.jpg',NULL),(21,'g$�-�䩸.&6�f-',1409141114,'g)5-�䩸.&6�f-','file','tl_files/music_academy/layout.gif','gif','ec5793c27e75e0426a69202d876733e2','1','layout.gif',NULL),(22,'g$�-�䩸.&6�f-',1409141114,'g)5-�䩸.&6�f-','file','tl_files/music_academy/modules.gif','gif','cefbcdcc5facb958977376f2c46367dc','1','modules.gif',NULL),(23,'g$�-�䩸.&6�f-',1409141114,'g)5-�䩸.&6�f-','file','tl_files/music_academy/news.gif','gif','ee4c7b3e72fb750033036036176feace','1','news.gif',NULL),(24,'g$�-�䩸.&6�f-',1409141114,'g)4�-�䩸.&6�f-','file','tl_files/music_academy/pagemounts.gif','gif','1317e91c34333dfd9bad071dd43e9f39','1','pagemounts.gif',NULL),(25,'g$�-�䩸.&6�f-',1409141114,'g)4�-�䩸.&6�f-','file','tl_files/music_academy/permissions.gif','gif','edc93c562d750ea9e0b20052298f4aa5','1','permissions.gif',NULL),(26,'g$�-�䩸.&6�f-',1409141114,'g)4�-�䩸.&6�f-','file','tl_files/music_academy/protect.gif','gif','7d8c259b52dc2fe5ccd8b8ea7e8090fb','1','protect.gif',NULL),(27,'g$�-�䩸.&6�f-',1409141114,'g)4�-�䩸.&6�f-','file','tl_files/music_academy/screenshot.jpg','jpg','bc787a96a23265d4de60c9d1c8e21580','1','screenshot.jpg',NULL),(28,NULL,1409141114,'g)4�-�䩸.&6�f-','folder','tl_files/tiny_templates','','3cb25412587bbaedd9901598abd93284','1','tiny_templates',NULL),(29,'g)4�-�䩸.&6�f-',1409141114,'g)4�-�䩸.&6�f-','file','tl_files/tiny_templates/index.html','html','aeebec42dc0335ea1e0853f4393259b4','1','index.html',NULL),(30,NULL,1409141114,'g)4�-�䩸.&6�f-','file','tl_files/tinymce.css','css','b46cb41513d60d36b3f747d0e144ac22','1','tinymce.css',NULL);
/*!40000 ALTER TABLE `tl_files` ENABLE KEYS */;
-- UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-27 14:08:24
