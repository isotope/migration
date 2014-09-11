-- MySQL dump 10.13  Distrib 5.6.17, for osx10.9 (x86_64)
--
-- Host: localhost    Database: isotope_14
-- ------------------------------------------------------
-- Server version	5.6.17-log

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

/*!40000 ALTER TABLE `tl_files` DISABLE KEYS */;
INSERT INTO `tl_files` VALUES (1,NULL,1409761720,0x5D38502E338711E4A7AE4C5DEF982D15,'folder','tl_files/2010_demo','','fe181e4520aa1a0aab669861f41eef41','1','2010_demo',NULL),(2,0x5D38502E338711E4A7AE4C5DEF982D15,1409761720,0x5D385024338711E4A7AE4C5DEF982D15,'folder','tl_files/2010_demo/layout','','941fdef2922a64ac6faa0cc39f32017d','1','layout',NULL),(3,0x5D385024338711E4A7AE4C5DEF982D15,1409761720,0x5D38501A338711E4A7AE4C5DEF982D15,'file','tl_files/2010_demo/layout/gradient.jpg','jpg','01a3688861fafeb8753808f9e6b9bd07','1','gradient.jpg',NULL),(4,0x5D385024338711E4A7AE4C5DEF982D15,1409761720,0x5D385011338711E4A7AE4C5DEF982D15,'file','tl_files/2010_demo/layout/logo.png','png','f67b4b8959c67c8345ccf534f1ca080f','1','logo.png',NULL),(5,0x5D385024338711E4A7AE4C5DEF982D15,1409761720,0x5D385010338711E4A7AE4C5DEF982D15,'file','tl_files/2010_demo/layout/searchButton.png','png','b7a9bee7c62fb5e7a060623d3222ad0a','1','searchButton.png',NULL),(6,0x5D385024338711E4A7AE4C5DEF982D15,1409761720,0x5D385006338711E4A7AE4C5DEF982D15,'file','tl_files/2010_demo/layout/shoes30.png','png','46a51c739a1aaf99a8e617c3c607a0c2','1','shoes30.png',NULL),(7,0x5D385024338711E4A7AE4C5DEF982D15,1409761720,0x5D384FFC338711E4A7AE4C5DEF982D15,'file','tl_files/2010_demo/layout/temp.jpg','jpg','b0ce80d28d5e632c826b16ae96636cc9','1','temp.jpg',NULL),(8,0x5D385024338711E4A7AE4C5DEF982D15,1409761720,0x5D384FF2338711E4A7AE4C5DEF982D15,'file','tl_files/2010_demo/layout/tiger.jpg','jpg','0ba1594b329e6a90f2c96d61b9eda669','1','tiger.jpg',NULL),(9,NULL,1409761720,0x5D384FE8338711E4A7AE4C5DEF982D15,'folder','tl_files/music_academy','','1679e5d338aaf4167826a1dcd4f8cad6','1','music_academy',NULL),(10,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D384FCA338711E4A7AE4C5DEF982D15,'folder','tl_files/music_academy/campus','','1c445bd0cf48754706802f57d2d103f2','1','campus',NULL),(11,0x5D384FCA338711E4A7AE4C5DEF982D15,1409761720,0x5D397C74338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/campus/campus_building.jpg','jpg','a0ac423df6265537c7b1783ed9cbb698','1','campus_building.jpg',0x613A313A7B733A323A22656E223B613A333A7B733A353A227469746C65223B733A34333A22486973746F726963616C206275696C64696E67206F6E204D757369632041636164656D792063616D707573223B733A343A226C696E6B223B733A303A22223B733A373A2263617074696F6E223B733A31393A22486973746F726963616C206275696C64696E67223B7D7D),(12,0x5D384FCA338711E4A7AE4C5DEF982D15,1409761720,0x5D397C6B338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/campus/campus_hall.jpg','jpg','16074d6c3e3dfeb23d580715f486bff2','1','campus_hall.jpg',0x613A313A7B733A323A22656E223B613A333A7B733A353A227469746C65223B733A32363A224D757369632041636164656D79204C696E636F6C6E2048616C6C223B733A343A226C696E6B223B733A303A22223B733A373A2263617074696F6E223B733A31323A224C696E636F6C6E2048616C6C223B7D7D),(13,0x5D384FCA338711E4A7AE4C5DEF982D15,1409761720,0x5D397C6A338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/campus/campus_library.jpg','jpg','1795dc0db4a1efcd2c390e3969ac3d3b','1','campus_library.jpg',0x613A313A7B733A323A22656E223B613A333A7B733A353A227469746C65223B733A32383A224D757369632041636164656D792063616D707573206C696272617279223B733A343A226C696E6B223B733A303A22223B733A373A2263617074696F6E223B733A31343A2243616D707573206C696272617279223B7D7D),(14,0x5D384FCA338711E4A7AE4C5DEF982D15,1409761720,0x5D397C60338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/campus/campus_overview.jpg','jpg','12360a385a87413fa9914d9f4b0f3113','1','campus_overview.jpg',0x613A313A7B733A323A22656E223B613A333A7B733A353A227469746C65223B733A33353A224D757369632041636164656D792063616D70757320286D61696E2062756C64696E6729223B733A343A226C696E6B223B733A303A22223B733A373A2263617074696F6E223B733A31353A2243616D707573206F76657276696577223B7D7D),(15,0x5D384FCA338711E4A7AE4C5DEF982D15,1409761720,0x5D397C57338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/campus/meta.txt','txt','3b24408a9333e7fa54d13f8e058b5c5b','1','meta.txt',NULL),(16,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D397C56338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/admin.gif','gif','37173d258871c781db2c025060e4f8ab','1','admin.gif',NULL),(17,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D397C4C338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/background.gif','gif','b2a05c65803733133c981a2d4e386968','1','background.gif',NULL),(18,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D397C42338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/frontendmodules.gif','gif','4f697b474f6d1e66f442c1c67d574a99','1','frontendmodules.gif',NULL),(19,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D397C38338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/image.png','png','cb636d32a257f7b6337b7392afeab02d','1','image.png',NULL),(20,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D397C1A338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/james-wilson.jpg','jpg','fd894d798786066577c9de8cbe9c1e38','1','james-wilson.jpg',NULL),(21,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D3A388B338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/layout.gif','gif','ec5793c27e75e0426a69202d876733e2','1','layout.gif',NULL),(22,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D3A388A338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/modules.gif','gif','cefbcdcc5facb958977376f2c46367dc','1','modules.gif',NULL),(23,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D3A3880338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/news.gif','gif','ee4c7b3e72fb750033036036176feace','1','news.gif',NULL),(24,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D3A3876338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/pagemounts.gif','gif','1317e91c34333dfd9bad071dd43e9f39','1','pagemounts.gif',NULL),(25,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D3A386D338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/permissions.gif','gif','edc93c562d750ea9e0b20052298f4aa5','1','permissions.gif',NULL),(26,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D3A386C338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/protect.gif','gif','7d8c259b52dc2fe5ccd8b8ea7e8090fb','1','protect.gif',NULL),(27,0x5D384FE8338711E4A7AE4C5DEF982D15,1409761720,0x5D3A3862338711E4A7AE4C5DEF982D15,'file','tl_files/music_academy/screenshot.jpg','jpg','bc787a96a23265d4de60c9d1c8e21580','1','screenshot.jpg',NULL),(28,NULL,1409761720,0x5D3A3858338711E4A7AE4C5DEF982D15,'folder','tl_files/tiny_templates','','3cb25412587bbaedd9901598abd93284','1','tiny_templates',NULL),(29,0x5D3A3858338711E4A7AE4C5DEF982D15,1409761720,0x5D3A384E338711E4A7AE4C5DEF982D15,'file','tl_files/tiny_templates/index.html','html','aeebec42dc0335ea1e0853f4393259b4','1','index.html',NULL),(30,NULL,1409761720,0x5D3A3830338711E4A7AE4C5DEF982D15,'file','tl_files/tinymce.css','css','b46cb41513d60d36b3f747d0e144ac22','1','tinymce.css',NULL);
/*!40000 ALTER TABLE `tl_files` ENABLE KEYS */;

--
-- Table structure for table `tl_module`
--

DROP TABLE IF EXISTS `tl_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(64) NOT NULL DEFAULT '',
  `headline` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `singleSRC` binary(16) DEFAULT NULL,
  `multiSRC` blob,
  `imgSize` varchar(64) NOT NULL DEFAULT '',
  `rootPage` int(10) unsigned NOT NULL DEFAULT '0',
  `pages` blob,
  `showLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `levelOffset` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hardLimit` char(1) NOT NULL DEFAULT '',
  `showHidden` char(1) NOT NULL DEFAULT '',
  `showProtected` char(1) NOT NULL DEFAULT '',
  `navigationTpl` varchar(64) NOT NULL DEFAULT '',
  `defineRoot` char(1) NOT NULL DEFAULT '',
  `customLabel` varchar(64) NOT NULL DEFAULT '',
  `queryType` varchar(32) NOT NULL DEFAULT '',
  `searchType` varchar(32) NOT NULL DEFAULT '',
  `searchTpl` varchar(64) NOT NULL DEFAULT '',
  `perPage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contextLength` smallint(5) unsigned NOT NULL DEFAULT '0',
  `totalLength` smallint(5) unsigned NOT NULL DEFAULT '0',
  `editable` blob,
  `cols` varchar(32) NOT NULL DEFAULT '',
  `memberTpl` varchar(64) NOT NULL DEFAULT '',
  `jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `form` int(10) unsigned NOT NULL DEFAULT '0',
  `html` text,
  `size` varchar(64) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `source` varchar(32) NOT NULL DEFAULT '',
  `flashvars` varchar(255) NOT NULL DEFAULT '',
  `altContent` text,
  `useCaption` char(1) NOT NULL DEFAULT '',
  `transparent` char(1) NOT NULL DEFAULT '',
  `interactive` char(1) NOT NULL DEFAULT '',
  `flashID` varchar(64) NOT NULL DEFAULT '',
  `flashJS` text,
  `inColumn` varchar(32) NOT NULL DEFAULT '',
  `skipFirst` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disableCaptcha` char(1) NOT NULL DEFAULT '',
  `newsletters` blob,
  `space` varchar(64) NOT NULL DEFAULT '',
  `cssID` varchar(255) NOT NULL DEFAULT '',
  `cal_calendar` blob,
  `cal_template` varchar(32) NOT NULL DEFAULT '',
  `cal_startDay` smallint(5) unsigned NOT NULL DEFAULT '1',
  `cal_format` varchar(32) NOT NULL DEFAULT '',
  `cal_limit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cal_noSpan` char(1) NOT NULL DEFAULT '',
  `faq_categories` blob,
  `list_table` varchar(64) NOT NULL DEFAULT '',
  `list_fields` varchar(255) NOT NULL DEFAULT '',
  `list_where` varchar(255) NOT NULL DEFAULT '',
  `list_sort` varchar(255) NOT NULL DEFAULT '',
  `list_search` varchar(255) NOT NULL DEFAULT '',
  `list_info` varchar(255) NOT NULL DEFAULT '',
  `list_layout` varchar(32) NOT NULL DEFAULT '',
  `list_info_layout` varchar(32) NOT NULL DEFAULT '',
  `news_archives` blob,
  `news_showQuantity` char(1) NOT NULL DEFAULT '',
  `news_template` varchar(32) NOT NULL DEFAULT '',
  `news_metaFields` varchar(255) NOT NULL DEFAULT '',
  `news_jumpToCurrent` varchar(16) NOT NULL DEFAULT '',
  `nl_template` varchar(32) NOT NULL DEFAULT '',
  `nl_subscribe` text,
  `nl_unsubscribe` text,
  `reg_groups` blob,
  `reg_assignDir` char(1) NOT NULL DEFAULT '',
  `reg_homeDir` binary(16) DEFAULT NULL,
  `reg_allowLogin` char(1) NOT NULL DEFAULT '',
  `reg_activate` char(1) NOT NULL DEFAULT '',
  `reg_jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `reg_skipName` char(1) NOT NULL DEFAULT '',
  `reg_text` text,
  `reg_password` text,
  `rss_feed` text,
  `rss_template` varchar(32) NOT NULL DEFAULT '',
  `rss_cache` int(10) unsigned NOT NULL DEFAULT '0',
  `protected` char(1) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  `nl_channels` blob,
  `news_format` varchar(32) NOT NULL DEFAULT '',
  `redirectBack` char(1) NOT NULL DEFAULT '',
  `loadFirst` char(1) NOT NULL DEFAULT '',
  `cal_ctemplate` varchar(32) NOT NULL DEFAULT '',
  `news_featured` varchar(16) NOT NULL DEFAULT '',
  `list_info_where` varchar(255) NOT NULL DEFAULT '',
  `nl_hideChannels` char(1) NOT NULL DEFAULT '',
  `tableless` char(1) NOT NULL DEFAULT '',
  `fuzzy` char(1) NOT NULL DEFAULT '',
  `fullsize` char(1) NOT NULL DEFAULT '',
  `com_order` varchar(32) NOT NULL DEFAULT '',
  `com_moderate` char(1) NOT NULL DEFAULT '',
  `com_bbcode` char(1) NOT NULL DEFAULT '',
  `com_requireLogin` char(1) NOT NULL DEFAULT '',
  `com_disableCaptcha` char(1) NOT NULL DEFAULT '',
  `com_template` varchar(32) NOT NULL DEFAULT '',
  `news_startDay` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reg_close` varchar(32) NOT NULL DEFAULT '',
  `cal_order` varchar(32) NOT NULL DEFAULT '',
  `iso_list_layout` varchar(64) NOT NULL DEFAULT '',
  `iso_reader_layout` varchar(64) NOT NULL DEFAULT '',
  `iso_reader_jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_cart_layout` varchar(64) NOT NULL DEFAULT '',
  `iso_checkout_method` varchar(10) NOT NULL DEFAULT '',
  `iso_login_jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_payment_modules` blob,
  `iso_shipping_modules` blob,
  `filter_module` text,
  `iso_config_id` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_config_ids` blob,
  `iso_jump_first` char(1) NOT NULL DEFAULT '',
  `iso_forward_review` char(1) NOT NULL DEFAULT '',
  `iso_mail_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_mail_admin` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_sales_email` varchar(255) NOT NULL DEFAULT '',
  `iso_order_conditions` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_category_scope` varchar(64) NOT NULL DEFAULT '',
  `iso_use_quantity` char(1) NOT NULL DEFAULT '',
  `iso_filterFields` blob,
  `iso_sortingFields` blob,
  `iso_searchFields` blob,
  `iso_enableLimit` char(1) NOT NULL DEFAULT '',
  `iso_cart_jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_checkout_jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `orderCompleteJumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_listingSortField` varchar(255) NOT NULL DEFAULT '',
  `iso_listingSortDirection` varchar(8) NOT NULL DEFAULT '',
  `iso_buttons` blob,
  `iso_related_categories` blob,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `autologin` char(1) NOT NULL DEFAULT '',
  `cal_showQuantity` char(1) NOT NULL DEFAULT '',
  `news_order` varchar(255) NOT NULL DEFAULT '',
  `iso_cols` int(1) unsigned NOT NULL DEFAULT '1',
  `iso_addToAddressbook` char(1) NOT NULL DEFAULT '',
  `iso_addProductJumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_noProducts` varchar(255) NOT NULL DEFAULT '',
  `iso_emptyMessage` char(1) NOT NULL DEFAULT '',
  `iso_enableCoupons` char(1) NOT NULL DEFAULT '',
  `cal_ignoreDynamic` char(1) NOT NULL DEFAULT '',
  `cal_readerModule` int(10) unsigned NOT NULL DEFAULT '0',
  `faq_readerModule` int(10) unsigned NOT NULL DEFAULT '0',
  `news_readerModule` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_perPage` varchar(64) NOT NULL DEFAULT '',
  `iso_filterModules` blob,
  `iso_list_where` varchar(255) NOT NULL DEFAULT '',
  `iso_hide_list` char(1) NOT NULL DEFAULT '',
  `iso_filterTpl` varchar(64) NOT NULL DEFAULT '',
  `iso_includeMessages` char(1) NOT NULL DEFAULT '',
  `iso_productcache` blob,
  `iso_continueShopping` char(1) NOT NULL DEFAULT '',
  `iso_order_conditions_position` varchar(6) NOT NULL DEFAULT 'after',
  `iso_filterHideSingle` char(1) NOT NULL DEFAULT '',
  `iso_searchAutocomplete` varchar(255) NOT NULL DEFAULT '',
  `iso_emptyFilter` char(1) NOT NULL DEFAULT '',
  `iso_noFilter` varchar(255) NOT NULL DEFAULT '',
  `numberOfItems` smallint(5) unsigned NOT NULL DEFAULT '0',
  `orderSRC` blob,
  `orderPages` blob,
  `customTpl` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_module`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_module` DISABLE KEYS */;
INSERT INTO `tl_module` VALUES (118,1272548391,'html','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','HTML - Header',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',0,48,1000,NULL,'2cl','',0,0,'<div id=\"logo\"><a href=\"/\" title=\"Isotope eCommerce Demo Store\"><img src=\"tl_files/2010_demo/layout/logo.png\" alt=\"Isotope Integrated eCommerce\" /></a></div>','','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'','',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','','','','','','',0,'','','','',0,'','',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'','',NULL,0x30,NULL,'',0,0,0,'','',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(119,1274099666,'navigation','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','NAV - Dropdown',NULL,NULL,'',243,NULL,0,0,'','','','nav_default','1','','and','simple','',0,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:3:\"nav\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_productlist','iso_reader_default',0,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'parent_and_children','',NULL,0x30,NULL,'',0,0,0,'','',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(120,1274099056,'navigation','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','NAV - Top Nav',NULL,NULL,'',265,NULL,1,1,'1','','','nav_default','1','','and','simple','',0,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:6:\"topnav\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_productlist','iso_reader_default',0,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'parent_and_children','',NULL,0x30,NULL,'',0,0,0,'','',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(125,1274622850,'iso_productlist','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SHOP - Lister - Featured Products',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',4,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_default','iso_reader_default',278,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'current_category','',NULL,0x30,NULL,'',0,0,0,'','ASC',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(126,1272210744,'form','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SEARCH - Simple Search',NULL,NULL,'',0,NULL,0,0,'','','','','','','or','simple','search_default',10,44,400,NULL,'2cl','',0,14,NULL,'','','','',NULL,'','','','',NULL,'',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:6:\"search\";i:1;s:0:\"\";}',NULL,'',0,'',0,'',NULL,'','','','','','','','',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'',0,'','',NULL,NULL,'','','','','','','','','','','','','','','','',0,'','','','',0,'','',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'','',NULL,0x30,NULL,'',0,0,0,'','',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(128,1274039169,'iso_productreader','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SHOP - Product Reader',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',3,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_featured_product','iso_reader_default',278,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'global','1',NULL,0x30,NULL,'',0,0,0,'','DESC',0x613A313A7B693A303B733A31313A226164645F746F5F63617274223B7D,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(129,1274099243,'iso_cart','a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}','SHOP - Cart - Mini',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',3,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_featured_product','iso_reader_default',278,'iso_cart_mini','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'global','1',NULL,0x30,NULL,'',269,270,0,'','DESC',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(130,1272210744,'iso_cart','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SHOP - Cart - Full',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',3,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:19:\"mod_isoShoppingCart\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_featured_product','iso_reader_default',278,'iso_cart_full','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'global','1',NULL,0x30,NULL,'',269,270,0,'','DESC',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(142,1349639090,'iso_productlist','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SHOP - Lister - Basic',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',18,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:4:\"grid\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_default','iso_reader_default',278,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'','',NULL,0x30,NULL,'',0,0,0,'name','DESC',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(143,1337096515,'iso_productfilter','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SHOP - Product Filter',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',3,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_default','iso_reader_default',278,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'current_category','',NULL,NULL,0x613A323A7B693A303B733A343A226E616D65223B693A313B733A31313A226465736372697074696F6E223B7D,'1',0,0,0,'','DESC',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','iso_filter_default','',NULL,'','after','','','','',3,NULL,NULL,''),(144,1287955398,'iso_checkout','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SHOP - Checkout',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',3,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_featured_product','iso_reader_default',278,'iso_cart_full','both',268,0x613A323A7B693A303B733A313A2231223B693A313B733A313A2233223B7D,0x613A313A7B693A303B733A313A2231223B7D,NULL,0,NULL,'','',2,1,'sales@isotopeecommerce.com',0,'global','1',NULL,0x30,NULL,'',269,270,271,'','DESC',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(145,1272210744,'login','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SHOP - Login',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',0,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_latest','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_productlist','iso_reader_default',0,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'parent_and_children','',NULL,0x30,NULL,'',0,0,0,'','DESC',0x613A313A7B693A303B733A31313A226164645F746F5F63617274223B7D,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(146,1272210744,'iso_orderhistory','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SHOP - Order History',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',0,48,1000,NULL,'2cl','',301,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_latest','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_productlist','iso_reader_default',0,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,0x613A313A7B693A303B733A313A2231223B7D,'','',0,0,'',0,'parent_and_children','',NULL,0x30,NULL,'',0,0,0,'','DESC',0x613A313A7B693A303B733A31313A226164645F746F5F63617274223B7D,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(147,1272210744,'iso_orderdetails','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SHOP - Order Details',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',0,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_latest','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_productlist','iso_reader_default',0,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,0x613A313A7B693A303B733A313A2231223B7D,'','',0,0,'',0,'parent_and_children','',NULL,0x30,NULL,'',0,0,0,'','DESC',0x613A313A7B693A303B733A31313A226164645F746F5F63617274223B7D,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(148,1274635007,'search','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','SEARCH - Search Engine',NULL,NULL,'',0,NULL,0,0,'','','','','','','or','simple','search_default',0,48,250,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_latest','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','1','','ascending','','','','','com_default',0,'','ascending','iso_list_productlist','iso_reader_default',0,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'parent_and_children','',NULL,0x30,NULL,'',0,0,0,'','DESC',0x613A313A7B693A303B733A31313A226164645F746F5F63617274223B7D,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(150,1272414988,'iso_relatedproducts','a:2:{s:4:\"unit\";s:2:\"h3\";s:5:\"value\";s:16:\"Similar Products\";}','SHOP - Related Products',NULL,NULL,'',0,NULL,0,0,'','','','','','','and','simple','',3,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_default','iso_reader_default',278,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'global','1',NULL,0x30,NULL,'',0,0,0,'','DESC',NULL,0x613A313A7B693A303B733A313A2231223B7D,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,''),(152,1274635157,'navigation','a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:0:\"\";}','NAV - Bottom Nav',NULL,NULL,'',280,NULL,1,1,'1','','','nav_default','1','','and','simple','',0,48,1000,NULL,'2cl','',0,0,NULL,'','','internal','',NULL,'','','','',NULL,'main',0,'',NULL,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','a:2:{i:0;s:9:\"footernav\";i:1;s:0:\"\";}',NULL,'event_full',0,'cal_month',0,'',NULL,'','','','','','','list_default','info_default',NULL,'','news_single','a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}','','nl_simple',NULL,NULL,NULL,'',NULL,'','',0,'',NULL,NULL,NULL,'rss_default',3600,'','',NULL,NULL,'news_month','','','cal_default','','','','','','','ascending','','','','','com_default',0,'','ascending','iso_list_productlist','iso_reader_default',0,'iso_reader_product_single','member',0,NULL,NULL,NULL,0,NULL,'','',0,0,'',0,'parent_and_children','',NULL,0x30,NULL,'',0,0,0,'','',NULL,NULL,1,'','','',1,'',0,'','','','',0,0,0,'8,12,32,64',NULL,'','','','',NULL,'','after','','','','',3,NULL,NULL,'');
/*!40000 ALTER TABLE `tl_module` ENABLE KEYS */;

--
-- Table structure for table `tl_page`
--

DROP TABLE IF EXISTS `tl_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `adminEmail` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(5) NOT NULL DEFAULT '',
  `pageTitle` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `url` varchar(255) NOT NULL DEFAULT '',
  `target` char(1) NOT NULL DEFAULT '',
  `redirect` varchar(32) NOT NULL DEFAULT '',
  `autoforward` char(1) NOT NULL DEFAULT '',
  `dns` varchar(255) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  `includeLayout` char(1) NOT NULL DEFAULT '',
  `layout` int(10) unsigned NOT NULL DEFAULT '0',
  `includeCache` char(1) NOT NULL DEFAULT '',
  `cache` int(10) unsigned NOT NULL DEFAULT '0',
  `includeChmod` char(1) NOT NULL DEFAULT '',
  `chmod` varchar(255) NOT NULL DEFAULT '',
  `cuser` int(10) unsigned NOT NULL DEFAULT '0',
  `cgroup` int(10) unsigned NOT NULL DEFAULT '0',
  `createSitemap` char(1) NOT NULL DEFAULT '',
  `sitemapName` varchar(32) NOT NULL DEFAULT '',
  `hide` char(1) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `noSearch` char(1) NOT NULL DEFAULT '',
  `cssClass` varchar(64) NOT NULL DEFAULT '',
  `tabindex` smallint(5) unsigned NOT NULL DEFAULT '0',
  `accesskey` char(1) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `dateFormat` varchar(32) NOT NULL DEFAULT '',
  `timeFormat` varchar(32) NOT NULL DEFAULT '',
  `datimFormat` varchar(32) NOT NULL DEFAULT '',
  `robots` varchar(32) NOT NULL DEFAULT '',
  `sitemap` varchar(32) NOT NULL DEFAULT '',
  `iso_config` int(10) unsigned NOT NULL DEFAULT '0',
  `staticFiles` varchar(255) NOT NULL DEFAULT '',
  `staticPlugins` varchar(255) NOT NULL DEFAULT '',
  `useSSL` char(1) NOT NULL DEFAULT '',
  `iso_setReaderJumpTo` char(1) NOT NULL DEFAULT '',
  `iso_readerJumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `mobileLayout` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `alias` (`alias`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_page`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_page` DISABLE KEYS */;
INSERT INTO `tl_page` VALUES (241,0,576,1291733689,'Demo Store','demo-store','','root','en','',NULL,'','','permanent','','','1',0,'',NULL,'1',38,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','','',1,'','','','',0,0),(242,241,128,1263753108,'Home Page','index','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'1',38,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(243,241,256,1270476394,'Main Navigation','main-navigation','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'1',45,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','1','','','',0,'','','','','','','','index,follow','map_default',0,'','','','',0,0),(265,241,384,1263753522,'Top Navigation','top-navigation','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','1','','','',0,'','','','','','','','index,follow','map_default',0,'','','','',0,0),(266,241,512,1263754894,'Module/Reader Pages','modulereader-pages','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','1','','','',0,'','','','','','','','index,follow','map_default',0,'','','','',0,0),(267,266,128,1263754909,'Search Results','search-results','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(268,265,128,1263754923,'My Account','my-account','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(269,265,256,1263754936,'My Cart','my-cart','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(270,265,384,1263754944,'Checkout','checkout','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(271,270,128,1263754964,'Order Summary','order-summary','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(273,243,128,1274619700,'Womens','womens','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(274,243,256,1274619718,'Mens','mens','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(275,243,384,1274634922,'Childrens','childrens','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(276,243,704,1274619783,'Specials','specials','','regular','en','',NULL,'','','permanent','','','',0,'1',0x613A313A7B693A303B733A313A2235223B7D,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(277,243,640,1274619755,'Sandals','sandals','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(278,243,768,1272200891,'Product Details','details','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'1',46,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','1','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(280,241,448,1274635811,'Footer Navigation','footer-navigation','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'1',46,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','1','','','',0,'','','','','','','','index,follow','map_default',0,'','','','',0,0),(281,280,128,1268695039,'About Us','about-us','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(282,280,256,1268695049,'Customer Service','customer-service','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(283,280,384,1268695109,'Shipping & Policies','shipping-policies','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(300,268,128,1272113502,'Order History','order-history','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0),(301,300,128,1272113565,'Order Details','order-details','','regular','en','',NULL,'','','permanent','','','',0,'',NULL,'',0,'',0,'','a:6:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";}',0,0,'','','1','','','',0,'','1','','','','','','index,follow','map_default',0,'','','','',0,0);
/*!40000 ALTER TABLE `tl_page` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_addresses`
--

DROP TABLE IF EXISTS `tl_iso_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `street_2` varchar(255) NOT NULL DEFAULT '',
  `street_3` varchar(255) NOT NULL DEFAULT '',
  `postal` varchar(32) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(32) NOT NULL DEFAULT '',
  `phone` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `isDefaultShipping` char(1) NOT NULL DEFAULT '',
  `isDefaultBilling` char(1) NOT NULL DEFAULT '',
  `street_1` varchar(255) NOT NULL DEFAULT '',
  `subdivision` varchar(10) NOT NULL DEFAULT '',
  `store_id` int(2) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `salutation` varchar(255) NOT NULL DEFAULT '',
  `vat_no` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_addresses`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_addresses` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_attributes`
--

DROP TABLE IF EXISTS `tl_iso_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `legend` varchar(255) NOT NULL DEFAULT '',
  `options` blob,
  `customer_defined` char(1) NOT NULL DEFAULT '',
  `mandatory` char(1) NOT NULL DEFAULT '',
  `fe_filter` char(1) NOT NULL DEFAULT '',
  `fe_search` char(1) NOT NULL DEFAULT '',
  `fe_sorting` char(1) NOT NULL DEFAULT '',
  `multiple` char(1) NOT NULL DEFAULT '',
  `variant_option` char(1) NOT NULL DEFAULT '',
  `invisible` char(1) NOT NULL DEFAULT '',
  `rte` varchar(255) NOT NULL DEFAULT '',
  `rgxp` varchar(255) NOT NULL DEFAULT '',
  `field_name` varchar(30) NOT NULL DEFAULT '',
  `multilingual` char(1) NOT NULL DEFAULT '',
  `conditionField` varchar(30) NOT NULL DEFAULT '',
  `size` smallint(5) unsigned NOT NULL DEFAULT '0',
  `extensions` varchar(255) NOT NULL DEFAULT '',
  `be_filter` char(1) NOT NULL DEFAULT '',
  `be_search` char(1) NOT NULL DEFAULT '',
  `foreignKey` text,
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `gallery` varchar(64) NOT NULL DEFAULT '',
  `files` char(1) NOT NULL DEFAULT '',
  `filesOnly` char(1) NOT NULL DEFAULT '',
  `fieldType` varchar(8) NOT NULL DEFAULT '',
  `sortBy` varchar(32) NOT NULL DEFAULT '',
  `storeFile` char(1) NOT NULL DEFAULT '',
  `uploadFolder` varchar(255) NOT NULL DEFAULT '',
  `useHomeDir` char(1) NOT NULL DEFAULT '',
  `doNotOverwrite` char(1) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `datepicker` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_attributes`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_attributes` DISABLE KEYS */;
INSERT INTO `tl_iso_attributes` VALUES (11,1290441382,'Color','Select the color for this product.','conditionalselect','general_legend',0x613A353A7B693A303B613A323A7B733A353A2276616C7565223B733A333A22526564223B733A353A226C6162656C223B733A333A22526564223B7D693A313B613A323A7B733A353A2276616C7565223B733A343A22426C7565223B733A353A226C6162656C223B733A343A22426C7565223B7D693A323B613A323A7B733A353A2276616C7565223B733A353A22477265656E223B733A353A226C6162656C223B733A353A22477265656E223B7D693A333B613A323A7B733A353A2276616C7565223B733A353A22426C61636B223B733A353A226C6162656C223B733A353A22426C61636B223B7D693A343B613A323A7B733A353A2276616C7565223B733A353A2242726F776E223B733A353A226C6162656C223B733A353A2242726F776E223B7D7D,'1','','','','','','1','','','','color','','',0,'','','',NULL,0,'','','','','','','','','','',''),(13,1344511260,'Size','','select','general_legend',0x613A31353A7B693A303B613A323A7B733A353A2276616C7565223B733A313A2237223B733A353A226C6162656C223B733A313A2237223B7D693A313B613A323A7B733A353A2276616C7565223B733A333A22372E35223B733A353A226C6162656C223B733A333A22372E35223B7D693A323B613A323A7B733A353A2276616C7565223B733A313A2238223B733A353A226C6162656C223B733A313A2238223B7D693A333B613A323A7B733A353A2276616C7565223B733A333A22382E35223B733A353A226C6162656C223B733A333A22382E35223B7D693A343B613A323A7B733A353A2276616C7565223B733A313A2239223B733A353A226C6162656C223B733A313A2239223B7D693A353B613A323A7B733A353A2276616C7565223B733A333A22392E35223B733A353A226C6162656C223B733A333A22392E35223B7D693A363B613A323A7B733A353A2276616C7565223B733A323A223130223B733A353A226C6162656C223B733A323A223130223B7D693A373B613A323A7B733A353A2276616C7565223B733A343A2231302E35223B733A353A226C6162656C223B733A343A2231302E35223B7D693A383B613A323A7B733A353A2276616C7565223B733A323A223131223B733A353A226C6162656C223B733A323A223131223B7D693A393B613A323A7B733A353A2276616C7565223B733A343A2231312E35223B733A353A226C6162656C223B733A343A2231312E35223B7D693A31303B613A323A7B733A353A2276616C7565223B733A323A223132223B733A353A226C6162656C223B733A323A223132223B7D693A31313B613A323A7B733A353A2276616C7565223B733A343A2231322E35223B733A353A226C6162656C223B733A343A2231322E35223B7D693A31323B613A323A7B733A353A2276616C7565223B733A323A223133223B733A353A226C6162656C223B733A323A223133223B7D693A31333B613A323A7B733A353A2276616C7565223B733A323A223134223B733A353A226C6162656C223B733A323A223134223B7D693A31343B613A323A7B733A353A2276616C7565223B733A323A223135223B733A353A226C6162656C223B733A323A223135223B7D7D,'','','','','','','1','','','','size','','',0,'','','',NULL,0,'','','','','','','','','','','');
/*!40000 ALTER TABLE `tl_iso_attributes` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_baseprice`
--

DROP TABLE IF EXISTS `tl_iso_baseprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_baseprice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `amount` varchar(32) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_baseprice`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_baseprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_baseprice` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_cart`
--

DROP TABLE IF EXISTS `tl_iso_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `session` varchar(64) NOT NULL DEFAULT '',
  `store_id` int(2) unsigned NOT NULL DEFAULT '0',
  `coupons` blob,
  `settings` blob,
  PRIMARY KEY (`id`),
  KEY `session` (`session`,`store_id`),
  KEY `pid` (`pid`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_cart`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_cart` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_cart_items`
--

DROP TABLE IF EXISTS `tl_iso_cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `href_reader` varchar(255) NOT NULL DEFAULT '',
  `product_sku` varchar(128) NOT NULL DEFAULT '',
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_options` blob,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `tax_free_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_cart_items`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_cart_items` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_config`
--

DROP TABLE IF EXISTS `tl_iso_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `missing_image_placeholder` varchar(255) NOT NULL DEFAULT '',
  `priceCalculateFactor` varchar(10) NOT NULL DEFAULT '',
  `priceCalculateMode` varchar(3) NOT NULL DEFAULT '',
  `priceRoundPrecision` int(1) unsigned NOT NULL DEFAULT '2',
  `priceRoundIncrement` varchar(4) NOT NULL DEFAULT '',
  `currency` varchar(3) NOT NULL DEFAULT '',
  `currencySymbol` char(1) NOT NULL DEFAULT '',
  `currencyPosition` varchar(5) NOT NULL DEFAULT '',
  `currencyFormat` varchar(20) NOT NULL DEFAULT '',
  `orderPrefix` varchar(255) NOT NULL DEFAULT '',
  `invoiceLogo` varchar(255) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `street_2` varchar(255) NOT NULL DEFAULT '',
  `street_3` varchar(255) NOT NULL DEFAULT '',
  `postal` varchar(32) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `shipping_countries` blob,
  `shipping_fields` blob,
  `billing_countries` blob,
  `billing_fields` blob,
  `phone` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `street_1` varchar(255) NOT NULL DEFAULT '',
  `subdivision` varchar(10) NOT NULL DEFAULT '',
  `store_id` int(2) unsigned NOT NULL DEFAULT '0',
  `gallery` varchar(64) NOT NULL DEFAULT '',
  `imageSizes` blob,
  `cartMinSubtotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `currencySpace` char(1) NOT NULL DEFAULT '',
  `currencyAutomator` char(1) NOT NULL DEFAULT '',
  `currencyOrigin` varchar(3) NOT NULL DEFAULT '',
  `currencyProvider` varchar(32) NOT NULL DEFAULT '',
  `orderDigits` int(1) unsigned NOT NULL DEFAULT '4',
  `templateGroup` varchar(255) NOT NULL DEFAULT '',
  `limitMemberCountries` char(1) NOT NULL DEFAULT '',
  `orderstatus_new` int(10) unsigned NOT NULL DEFAULT '0',
  `orderstatus_error` int(10) unsigned NOT NULL DEFAULT '0',
  `billing_country` varchar(2) NOT NULL DEFAULT '',
  `shipping_country` varchar(2) NOT NULL DEFAULT '',
  `vat_no` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_config`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_config` DISABLE KEYS */;
INSERT INTO `tl_iso_config` VALUES (1,1291657980,'Default','Default Store','','1','mul',2,'0.01','USD','1','left','10,000.00','','','1','Isotope','Demo','','','01027','Easthampton','Isotope','us',0x613A3234333A7B693A303B733A323A226166223B693A313B733A323A226178223B693A323B733A323A22616C223B693A333B733A323A22647A223B693A343B733A323A226173223B693A353B733A323A226164223B693A363B733A323A22616F223B693A373B733A323A226169223B693A383B733A323A226171223B693A393B733A323A226167223B693A31303B733A323A226172223B693A31313B733A323A22616D223B693A31323B733A323A226177223B693A31333B733A323A226175223B693A31343B733A323A226174223B693A31353B733A323A22617A223B693A31363B733A323A226273223B693A31373B733A323A226268223B693A31383B733A323A226264223B693A31393B733A323A226262223B693A32303B733A323A226279223B693A32313B733A323A226265223B693A32323B733A323A22627A223B693A32333B733A323A22626A223B693A32343B733A323A22626D223B693A32353B733A323A226274223B693A32363B733A323A22626F223B693A32373B733A323A226261223B693A32383B733A323A226277223B693A32393B733A323A226276223B693A33303B733A323A226272223B693A33313B733A323A22696F223B693A33323B733A323A22626E223B693A33333B733A323A226267223B693A33343B733A323A226266223B693A33353B733A323A226269223B693A33363B733A323A226B68223B693A33373B733A323A22636D223B693A33383B733A323A226361223B693A33393B733A323A226376223B693A34303B733A323A226B79223B693A34313B733A323A226366223B693A34323B733A323A227464223B693A34333B733A323A22636C223B693A34343B733A323A22636E223B693A34353B733A323A226378223B693A34363B733A323A226363223B693A34373B733A323A22636F223B693A34383B733A323A226B6D223B693A34393B733A323A226367223B693A35303B733A323A226364223B693A35313B733A323A22636B223B693A35323B733A323A226372223B693A35333B733A323A226369223B693A35343B733A323A226872223B693A35353B733A323A226375223B693A35363B733A323A226379223B693A35373B733A323A22637A223B693A35383B733A323A22646B223B693A35393B733A323A22646A223B693A36303B733A323A22646D223B693A36313B733A323A22646F223B693A36323B733A323A226563223B693A36333B733A323A226567223B693A36343B733A323A227376223B693A36353B733A323A226771223B693A36363B733A323A226572223B693A36373B733A323A226565223B693A36383B733A323A226574223B693A36393B733A323A22666B223B693A37303B733A323A22666F223B693A37313B733A323A22666A223B693A37323B733A323A226669223B693A37333B733A323A226672223B693A37343B733A323A226766223B693A37353B733A323A227066223B693A37363B733A323A227466223B693A37373B733A323A226761223B693A37383B733A323A22676D223B693A37393B733A323A226765223B693A38303B733A323A226465223B693A38313B733A323A226768223B693A38323B733A323A226769223B693A38333B733A323A226772223B693A38343B733A323A22676C223B693A38353B733A323A226764223B693A38363B733A323A226770223B693A38373B733A323A226775223B693A38383B733A323A226774223B693A38393B733A323A226767223B693A39303B733A323A22676E223B693A39313B733A323A226777223B693A39323B733A323A226779223B693A39333B733A323A226874223B693A39343B733A323A22686D223B693A39353B733A323A227661223B693A39363B733A323A22686E223B693A39373B733A323A22686B223B693A39383B733A323A226875223B693A39393B733A323A226973223B693A3130303B733A323A22696E223B693A3130313B733A323A226964223B693A3130323B733A323A226972223B693A3130333B733A323A226971223B693A3130343B733A323A226965223B693A3130353B733A323A22696D223B693A3130363B733A323A22696C223B693A3130373B733A323A226974223B693A3130383B733A323A226A6D223B693A3130393B733A323A226A70223B693A3131303B733A323A226A65223B693A3131313B733A323A226A6F223B693A3131323B733A323A226B7A223B693A3131333B733A323A226B65223B693A3131343B733A323A226B69223B693A3131353B733A323A226B77223B693A3131363B733A323A226B67223B693A3131373B733A323A226C61223B693A3131383B733A323A226C76223B693A3131393B733A323A226C62223B693A3132303B733A323A226C73223B693A3132313B733A323A226C72223B693A3132323B733A323A226C79223B693A3132333B733A323A226C69223B693A3132343B733A323A226C74223B693A3132353B733A323A226C75223B693A3132363B733A323A226D6F223B693A3132373B733A323A226D6B223B693A3132383B733A323A226D67223B693A3132393B733A323A226D77223B693A3133303B733A323A226D79223B693A3133313B733A323A226D76223B693A3133323B733A323A226D6C223B693A3133333B733A323A226D74223B693A3133343B733A323A226D68223B693A3133353B733A323A226D71223B693A3133363B733A323A226D72223B693A3133373B733A323A226D75223B693A3133383B733A323A227974223B693A3133393B733A323A226D78223B693A3134303B733A323A22666D223B693A3134313B733A323A226D64223B693A3134323B733A323A226D63223B693A3134333B733A323A226D6E223B693A3134343B733A323A226D65223B693A3134353B733A323A226D73223B693A3134363B733A323A226D61223B693A3134373B733A323A226D7A223B693A3134383B733A323A226D6D223B693A3134393B733A323A226E61223B693A3135303B733A323A226E72223B693A3135313B733A323A226E70223B693A3135323B733A323A226E6C223B693A3135333B733A323A22616E223B693A3135343B733A323A226E63223B693A3135353B733A323A226E7A223B693A3135363B733A323A226E69223B693A3135373B733A323A226E65223B693A3135383B733A323A226E67223B693A3135393B733A323A226E75223B693A3136303B733A323A226E66223B693A3136313B733A323A226B70223B693A3136323B733A323A226D70223B693A3136333B733A323A226E6F223B693A3136343B733A323A226F6D223B693A3136353B733A323A22706B223B693A3136363B733A323A227077223B693A3136373B733A323A227073223B693A3136383B733A323A227061223B693A3136393B733A323A227067223B693A3137303B733A323A227079223B693A3137313B733A323A227065223B693A3137323B733A323A227068223B693A3137333B733A323A22706E223B693A3137343B733A323A22706C223B693A3137353B733A323A227074223B693A3137363B733A323A227072223B693A3137373B733A323A227161223B693A3137383B733A323A227265223B693A3137393B733A323A22726F223B693A3138303B733A323A227275223B693A3138313B733A323A227277223B693A3138323B733A323A227368223B693A3138333B733A323A226B6E223B693A3138343B733A323A226C63223B693A3138353B733A323A22706D223B693A3138363B733A323A227663223B693A3138373B733A323A227773223B693A3138383B733A323A22736D223B693A3138393B733A323A227374223B693A3139303B733A323A227361223B693A3139313B733A323A22736E223B693A3139323B733A323A227273223B693A3139333B733A323A227363223B693A3139343B733A323A22736C223B693A3139353B733A323A227367223B693A3139363B733A323A22736B223B693A3139373B733A323A227369223B693A3139383B733A323A227362223B693A3139393B733A323A22736F223B693A3230303B733A323A227A61223B693A3230313B733A323A226773223B693A3230323B733A323A226B72223B693A3230333B733A323A226573223B693A3230343B733A323A226C6B223B693A3230353B733A323A227364223B693A3230363B733A323A227372223B693A3230373B733A323A22736A223B693A3230383B733A323A22737A223B693A3230393B733A323A227365223B693A3231303B733A323A226368223B693A3231313B733A323A227379223B693A3231323B733A323A227477223B693A3231333B733A323A22746A223B693A3231343B733A323A22747A223B693A3231353B733A323A227468223B693A3231363B733A323A22746C223B693A3231373B733A323A227467223B693A3231383B733A323A22746B223B693A3231393B733A323A22746F223B693A3232303B733A323A227474223B693A3232313B733A323A22746E223B693A3232323B733A323A227472223B693A3232333B733A323A22746D223B693A3232343B733A323A227463223B693A3232353B733A323A227476223B693A3232363B733A323A227567223B693A3232373B733A323A227561223B693A3232383B733A323A226165223B693A3232393B733A323A227573223B693A3233303B733A323A22756D223B693A3233313B733A323A227579223B693A3233323B733A323A22757A223B693A3233333B733A323A227675223B693A3233343B733A323A227665223B693A3233353B733A323A22766E223B693A3233363B733A323A227667223B693A3233373B733A323A227669223B693A3233383B733A323A227766223B693A3233393B733A323A226568223B693A3234303B733A323A227965223B693A3234313B733A323A227A6D223B693A3234323B733A323A227A77223B7D,0x613A31313A7B693A303B613A333A7B733A353A2276616C7565223B733A393A2266697273746E616D65223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A313B613A333A7B733A353A2276616C7565223B733A383A226C6173746E616D65223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A323B613A333A7B733A353A2276616C7565223B733A373A22636F6D70616E79223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D693A333B613A333A7B733A353A2276616C7565223B733A383A227374726565745F31223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A343B613A333A7B733A353A2276616C7565223B733A343A2263697479223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A353B613A333A7B733A353A2276616C7565223B733A31313A227375626469766973696F6E223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D693A363B613A333A7B733A353A2276616C7565223B733A363A22706F7374616C223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A373B613A333A7B733A353A2276616C7565223B733A373A22636F756E747279223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A383B613A333A7B733A353A2276616C7565223B733A353A2270686F6E65223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D693A393B613A333A7B733A353A2276616C7565223B733A353A22656D61696C223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D693A31303B613A333A7B733A353A2276616C7565223B733A31373A22697344656661756C745368697070696E67223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D7D,0x613A313A7B693A303B733A323A227573223B7D,0x613A31313A7B693A303B613A333A7B733A353A2276616C7565223B733A393A2266697273746E616D65223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A313B613A333A7B733A353A2276616C7565223B733A383A226C6173746E616D65223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A323B613A333A7B733A353A2276616C7565223B733A373A22636F6D70616E79223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D693A333B613A333A7B733A353A2276616C7565223B733A383A227374726565745F31223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A343B613A333A7B733A353A2276616C7565223B733A343A2263697479223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A353B613A333A7B733A353A2276616C7565223B733A31313A227375626469766973696F6E223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D693A363B613A333A7B733A353A2276616C7565223B733A363A22706F7374616C223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A373B613A333A7B733A353A2276616C7565223B733A373A22636F756E747279223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B623A313B7D693A383B613A333A7B733A353A2276616C7565223B733A353A2270686F6E65223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D693A393B613A333A7B733A353A2276616C7565223B733A353A22656D61696C223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D693A31303B613A333A7B733A353A2276616C7565223B733A31363A22697344656661756C7442696C6C696E67223B733A373A22656E61626C6564223B693A313B733A393A226D616E6461746F7279223B4E3B7D7D,'123-456-7890','demo@isotopeecommerce.com','1 Isotope Lane','US-MA',0,'default',0x613A343A7B693A303B613A363A7B733A343A226E616D65223B733A373A2267616C6C657279223B733A353A227769647468223B733A323A223530223B733A363A22686569676874223B733A323A223530223B733A343A226D6F6465223B733A343A2263726F70223B733A393A2277617465726D61726B223B733A303A22223B733A383A22706F736974696F6E223B733A323A22746C223B7D693A313B613A363A7B733A343A226E616D65223B733A393A227468756D626E61696C223B733A353A227769647468223B733A333A22313030223B733A363A22686569676874223B733A333A22313030223B733A343A226D6F6465223B733A333A22626F78223B733A393A2277617465726D61726B223B733A303A22223B733A383A22706F736974696F6E223B733A323A22746C223B7D693A323B613A363A7B733A343A226E616D65223B733A363A226D656469756D223B733A353A227769647468223B733A333A22323030223B733A363A22686569676874223B733A333A22323030223B733A343A226D6F6465223B733A333A22626F78223B733A393A2277617465726D61726B223B733A303A22223B733A383A22706F736974696F6E223B733A323A22746C223B7D693A333B613A363A7B733A343A226E616D65223B733A353A226C61726765223B733A353A227769647468223B733A333A22383030223B733A363A22686569676874223B733A333A22383030223B733A343A226D6F6465223B733A333A22626F78223B733A393A2277617465726D61726B223B733A303A22223B733A383A22706F736974696F6E223B733A323A22746C223B7D7D,0.00,'','','','',4,'','',0,0,'us','us','');
/*!40000 ALTER TABLE `tl_iso_config` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `tl_iso_downloads` DISABLE KEYS */;
INSERT INTO `tl_iso_downloads` VALUES (1,152,1409761295,'tl_files/music_academy/admin.gif','Stupid title for stupid image','',0,128,'file','a:2:{s:4:\"unit\";s:7:\"minutes\";s:5:\"value\";s:0:\"\";}');
/*!40000 ALTER TABLE `tl_iso_downloads` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_groups`
--

DROP TABLE IF EXISTS `tl_iso_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `product_type` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_groups`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_groups` DISABLE KEYS */;
INSERT INTO `tl_iso_groups` VALUES (1,0,256,1337074483,'Sandals',0),(2,0,384,1337074483,'Childrens',0),(3,0,512,1337074483,'Mens',0),(4,0,640,1337074483,'Womens',0),(5,0,128,1409761242,'Downloads',2);
/*!40000 ALTER TABLE `tl_iso_groups` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_labels`
--

DROP TABLE IF EXISTS `tl_iso_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_labels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(2) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_labels`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_labels` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_mail`
--

DROP TABLE IF EXISTS `tl_iso_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `senderName` varchar(255) NOT NULL DEFAULT '',
  `sender` varchar(255) NOT NULL DEFAULT '',
  `cc` varchar(255) NOT NULL DEFAULT '',
  `bcc` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(255) NOT NULL DEFAULT '',
  `attachDocument` char(1) NOT NULL DEFAULT '',
  `documentTemplate` varchar(255) NOT NULL DEFAULT '',
  `documentTitle` varchar(255) NOT NULL DEFAULT '',
  `priority` int(1) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_mail`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_mail` DISABLE KEYS */;
INSERT INTO `tl_iso_mail` VALUES (1,1274655170,'Admin Email','Isotope Demo Store','info@isotopeecommerce.com','','','mail_default','','','',3),(2,1274655188,'Customer EMail','Isotope Demo Store','info@isotopeecommerce.com','','','mail_default','','','',3);
/*!40000 ALTER TABLE `tl_iso_mail` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_mail_content`
--

DROP TABLE IF EXISTS `tl_iso_mail_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_mail_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(255) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `text` text,
  `textOnly` char(1) NOT NULL DEFAULT '',
  `html` text,
  `attachments` blob,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_mail_content`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_mail_content` DISABLE KEYS */;
INSERT INTO `tl_iso_mail_content` VALUES (1,1,1275403227,'en','1','A New Order Has Been Placed','{{date::m/d/Y}}\n\nA New Order Has Been Placed on Isotope Demo Store\n\nOrder ID: ##order_id##\n\nBilling Information:\n##billing_address_text##\nPayment Method: ##payment_method##\n\nShipping Information:\n##shipping_address_text##\nShipping Method: ##shipping_method##\n\nProducts:\n##cart_text##\n\nOrder Subtotal:	##subTotal##\nTotal Tax:	        ##taxTotal##\nTotal Shipping:	##shippingPrice##\nGrand Total:	##grandTotal##','','<p>A new order has been placed on Isotope Demo Store</p>\n<table style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\">\n<tbody>\n<tr>\n<td><strong>Order ID:</strong>[nbsp]##order_id##</td>\n<td>{{date::m/d/Y}}</td>\n</tr>\n</tbody>\n</table>\n<table style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\">\n<tbody>\n<tr>\n<td valign=\"top\">\n<p><strong>Billing Information:</strong></p>\n<p>##billing_address##</p>\n<p><strong>Payment Method</strong>:[nbsp]##payment_method##</p>\n</td>\n<td valign=\"top\">\n<p><strong>Shipping Information:</strong></p>\n<p>##shipping_address##</p>\n<p><strong>Shipping Method:</strong> [nbsp]##shipping_method##[nbsp]</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"products\">##cart_html##</p>\n<table class=\"summary\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td valign=\"top\">Order Subtotal:</td>\n<td valign=\"top\">##subTotal##</td>\n</tr>\n<tr>\n<td valign=\"top\">Total Tax:</td>\n<td valign=\"top\">##taxTotal##</td>\n</tr>\n<tr>\n<td valign=\"top\">Total Shipping:</td>\n<td valign=\"top\">##shippingPrice##</td>\n</tr>\n<tr>\n<td valign=\"top\"><strong>Grand Total:</strong></td>\n<td valign=\"top\"><strong>##grandTotal##</strong></td>\n</tr>\n</tbody>\n</table>',NULL),(2,2,1263755574,'en','1','Thank You For Your Order!','Thank you for your order from the Isotope Demo Store!\n\n{{date::m/d/Y}}\n\nOrder ID: ##order_id##\n\nBilling Information:\n##billing_address_text##\nPayment Method: ##payment_method##\n\nShipping Information:\n##shipping_address_text##\nShipping Method: ##shipping_method##\n\nProducts:\n##cart_text##\n\nOrder Subtotal:	##subTotal##\nTotal Tax:	        ##taxTotal##\nTotal Shipping:	##shippingPrice##\nGrand Total:	##grandTotal##','','<p>Thank you for your order from the Isotope Demo Store!</p>\n<table style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\">\n<tbody>\n<tr>\n<td><strong>Order ID:</strong>[nbsp]##order_id##</td>\n<td>{{date::m/d/Y}}</td>\n</tr>\n</tbody>\n</table>\n<table style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\">\n<tbody>\n<tr>\n<td valign=\"top\">\n<p><strong>Billing Information:</strong></p>\n<p>##billing_address##</p>\n<p><strong>Payment Method</strong>:[nbsp]##payment_method##</p>\n</td>\n<td valign=\"top\">\n<p><strong>Shipping Information:</strong></p>\n<p>##shipping_address##</p>\n<p><strong>Shipping Method:</strong> [nbsp]##shipping_method##[nbsp]</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"products\">##cart_html##</p>\n<table class=\"summary\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td valign=\"top\">Order Subtotal:</td>\n<td valign=\"top\">##subTotal##</td>\n</tr>\n<tr>\n<td valign=\"top\">Total Tax:</td>\n<td valign=\"top\">##taxTotal##</td>\n</tr>\n<tr>\n<td valign=\"top\">Total Shipping:</td>\n<td valign=\"top\">##shippingPrice##</td>\n</tr>\n<tr>\n<td valign=\"top\"><strong>Grand Total:</strong></td>\n<td valign=\"top\"><strong>##grandTotal##</strong></td>\n</tr>\n</tbody>\n</table>',NULL);
/*!40000 ALTER TABLE `tl_iso_mail_content` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `tl_iso_order_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_order_downloads` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_order_items`
--

DROP TABLE IF EXISTS `tl_iso_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `product_sku` varchar(128) NOT NULL DEFAULT '',
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_options` blob,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `tax_free_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_order_items`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_order_items` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_orders`
--

DROP TABLE IF EXISTS `tl_iso_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` varchar(14) NOT NULL DEFAULT '',
  `uniqid` varchar(27) NOT NULL DEFAULT '',
  `config_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cart_id` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(2) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_address` blob,
  `billing_address` blob,
  `checkout_info` blob,
  `surcharges` blob,
  `payment_data` blob,
  `shipping_data` blob,
  `subTotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `grandTotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `cc_num` varchar(64) NOT NULL DEFAULT '',
  `cc_type` varchar(32) NOT NULL DEFAULT '',
  `cc_exp` varchar(16) NOT NULL DEFAULT '',
  `cc_cvv` varchar(8) NOT NULL DEFAULT '',
  `currency` varchar(4) NOT NULL DEFAULT '',
  `date_paid` varchar(10) NOT NULL DEFAULT '',
  `date_shipped` varchar(10) NOT NULL DEFAULT '',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_id` int(10) unsigned NOT NULL DEFAULT '0',
  `coupons` blob,
  `notes` text,
  `settings` blob,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_orders`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_orders` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_orderstatus`
--

DROP TABLE IF EXISTS `tl_iso_orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_orderstatus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `paid` char(1) NOT NULL DEFAULT '',
  `welcomescreen` char(1) NOT NULL DEFAULT '',
  `mail_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `mail_admin` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_email` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_orderstatus`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_orderstatus` DISABLE KEYS */;
INSERT INTO `tl_iso_orderstatus` VALUES (1,0,1408521987,0,'Pending','','1',0,0,''),(2,0,1408521987,128,'Processing','','',0,0,''),(3,0,1408521987,256,'Complete','1','',0,0,''),(4,0,1408521987,384,'On Hold','','',0,0,''),(5,0,1408521987,512,'Cancelled','','',0,0,'');
/*!40000 ALTER TABLE `tl_iso_orderstatus` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_payment_modules`
--

DROP TABLE IF EXISTS `tl_iso_payment_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_payment_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `note` text,
  `countries` blob,
  `shipping_modules` blob,
  `product_types` blob,
  `allowed_cc_types` text,
  `minimum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `maximum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `new_order_status` int(10) unsigned NOT NULL DEFAULT '0',
  `paypal_account` varchar(255) NOT NULL DEFAULT '',
  `postfinance_pspid` varchar(255) NOT NULL DEFAULT '',
  `postfinance_secret` varchar(255) NOT NULL DEFAULT '',
  `postfinance_method` varchar(4) NOT NULL DEFAULT '',
  `authorize_login` varchar(255) NOT NULL DEFAULT '',
  `authorize_trans_key` varchar(255) NOT NULL DEFAULT '',
  `authorize_delimiter` varchar(4) NOT NULL DEFAULT '',
  `authorize_trans_type` varchar(32) NOT NULL DEFAULT '',
  `authorize_relay_response` char(1) NOT NULL DEFAULT '',
  `authorize_email_customer` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  `button` varchar(255) NOT NULL DEFAULT '',
  `debug` char(1) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT '',
  `requireCCV` char(1) NOT NULL DEFAULT '',
  `price` varchar(16) NOT NULL DEFAULT '',
  `tax_class` int(10) NOT NULL DEFAULT '0',
  `trans_type` varchar(8) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_payment_modules`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_payment_modules` DISABLE KEYS */;
INSERT INTO `tl_iso_payment_modules` VALUES (1,1274642121,'Cash','cash','Cash',NULL,0x613A3234373A7B693A303B733A323A226166223B693A313B733A323A226178223B693A323B733A323A22616C223B693A333B733A323A22647A223B693A343B733A323A226173223B693A353B733A323A226164223B693A363B733A323A22616F223B693A373B733A323A226169223B693A383B733A323A226171223B693A393B733A323A226167223B693A31303B733A323A226172223B693A31313B733A323A22616D223B693A31323B733A323A226177223B693A31333B733A323A226163223B693A31343B733A323A226175223B693A31353B733A323A226174223B693A31363B733A323A22617A223B693A31373B733A323A226273223B693A31383B733A323A226268223B693A31393B733A323A226264223B693A32303B733A323A226262223B693A32313B733A323A226279223B693A32323B733A323A226265223B693A32333B733A323A22627A223B693A32343B733A323A22626A223B693A32353B733A323A22626D223B693A32363B733A323A226274223B693A32373B733A323A22626F223B693A32383B733A323A226261223B693A32393B733A323A226277223B693A33303B733A323A226276223B693A33313B733A323A226272223B693A33323B733A323A22696F223B693A33333B733A323A22626E223B693A33343B733A323A226267223B693A33353B733A323A226266223B693A33363B733A323A226269223B693A33373B733A323A226B68223B693A33383B733A323A22636D223B693A33393B733A323A226361223B693A34303B733A323A226376223B693A34313B733A323A226B79223B693A34323B733A323A226366223B693A34333B733A323A227464223B693A34343B733A323A22636C223B693A34353B733A323A22636E223B693A34363B733A323A226378223B693A34373B733A323A226363223B693A34383B733A323A22636F223B693A34393B733A323A226B6D223B693A35303B733A323A226367223B693A35313B733A323A226364223B693A35323B733A323A22636B223B693A35333B733A323A226372223B693A35343B733A323A226369223B693A35353B733A323A226872223B693A35363B733A323A226375223B693A35373B733A323A226379223B693A35383B733A323A22637A223B693A35393B733A323A22646B223B693A36303B733A323A22646A223B693A36313B733A323A22646D223B693A36323B733A323A22646F223B693A36333B733A323A227470223B693A36343B733A323A226563223B693A36353B733A323A226567223B693A36363B733A323A227376223B693A36373B733A323A226771223B693A36383B733A323A226572223B693A36393B733A323A226565223B693A37303B733A323A226574223B693A37313B733A323A22666B223B693A37323B733A323A22666F223B693A37333B733A323A22666A223B693A37343B733A323A226669223B693A37353B733A323A226672223B693A37363B733A323A226766223B693A37373B733A323A227066223B693A37383B733A323A227466223B693A37393B733A323A226761223B693A38303B733A323A22676D223B693A38313B733A323A226765223B693A38323B733A323A226465223B693A38333B733A323A226768223B693A38343B733A323A226769223B693A38353B733A323A226772223B693A38363B733A323A22676C223B693A38373B733A323A226764223B693A38383B733A323A226770223B693A38393B733A323A226775223B693A39303B733A323A226774223B693A39313B733A323A226767223B693A39323B733A323A22676E223B693A39333B733A323A226777223B693A39343B733A323A226779223B693A39353B733A323A226874223B693A39363B733A323A22686D223B693A39373B733A323A227661223B693A39383B733A323A22686E223B693A39393B733A323A22686B223B693A3130303B733A323A226875223B693A3130313B733A323A226973223B693A3130323B733A323A22696E223B693A3130333B733A323A226964223B693A3130343B733A323A226972223B693A3130353B733A323A226971223B693A3130363B733A323A226965223B693A3130373B733A323A22696D223B693A3130383B733A323A22696C223B693A3130393B733A323A226974223B693A3131303B733A323A226A6D223B693A3131313B733A323A226A70223B693A3131323B733A323A226A65223B693A3131333B733A323A226A6F223B693A3131343B733A323A226B7A223B693A3131353B733A323A226B65223B693A3131363B733A323A226B69223B693A3131373B733A323A226B77223B693A3131383B733A323A226B67223B693A3131393B733A323A226C61223B693A3132303B733A323A226C76223B693A3132313B733A323A226C62223B693A3132323B733A323A226C73223B693A3132333B733A323A226C72223B693A3132343B733A323A226C79223B693A3132353B733A323A226C69223B693A3132363B733A323A226C74223B693A3132373B733A323A226C75223B693A3132383B733A323A226D6F223B693A3132393B733A323A226D6B223B693A3133303B733A323A226D67223B693A3133313B733A323A226D77223B693A3133323B733A323A226D79223B693A3133333B733A323A226D76223B693A3133343B733A323A226D6C223B693A3133353B733A323A226D74223B693A3133363B733A323A226D68223B693A3133373B733A323A226D71223B693A3133383B733A323A226D72223B693A3133393B733A323A226D75223B693A3134303B733A323A227974223B693A3134313B733A323A226D78223B693A3134323B733A323A22666D223B693A3134333B733A323A226D64223B693A3134343B733A323A226D63223B693A3134353B733A323A226D6E223B693A3134363B733A323A226D65223B693A3134373B733A323A226D73223B693A3134383B733A323A226D61223B693A3134393B733A323A226D7A223B693A3135303B733A323A226D6D223B693A3135313B733A323A226E61223B693A3135323B733A323A226E72223B693A3135333B733A323A226E70223B693A3135343B733A323A226E6C223B693A3135353B733A323A22616E223B693A3135363B733A323A226E63223B693A3135373B733A323A226E7A223B693A3135383B733A323A226E69223B693A3135393B733A323A226E65223B693A3136303B733A323A226E67223B693A3136313B733A323A226E75223B693A3136323B733A323A226E66223B693A3136333B733A323A226B70223B693A3136343B733A323A226D70223B693A3136353B733A323A226E6F223B693A3136363B733A323A226F6D223B693A3136373B733A323A22706B223B693A3136383B733A323A227077223B693A3136393B733A323A227073223B693A3137303B733A323A227061223B693A3137313B733A323A227067223B693A3137323B733A323A227079223B693A3137333B733A323A227065223B693A3137343B733A323A227068223B693A3137353B733A323A22706E223B693A3137363B733A323A22706C223B693A3137373B733A323A227074223B693A3137383B733A323A227072223B693A3137393B733A323A227161223B693A3138303B733A323A227265223B693A3138313B733A323A22726F223B693A3138323B733A323A227275223B693A3138333B733A323A227277223B693A3138343B733A323A227368223B693A3138353B733A323A226B6E223B693A3138363B733A323A226C63223B693A3138373B733A323A22706D223B693A3138383B733A323A227663223B693A3138393B733A323A227773223B693A3139303B733A323A22736D223B693A3139313B733A323A227374223B693A3139323B733A323A227361223B693A3139333B733A323A22736E223B693A3139343B733A323A227273223B693A3139353B733A323A227363223B693A3139363B733A323A22736C223B693A3139373B733A323A227367223B693A3139383B733A323A22736B223B693A3139393B733A323A227369223B693A3230303B733A323A227362223B693A3230313B733A323A22736F223B693A3230323B733A323A227A61223B693A3230333B733A323A226773223B693A3230343B733A323A226B72223B693A3230353B733A323A226573223B693A3230363B733A323A226C6B223B693A3230373B733A323A227364223B693A3230383B733A323A227372223B693A3230393B733A323A22736A223B693A3231303B733A323A22737A223B693A3231313B733A323A227365223B693A3231323B733A323A226368223B693A3231333B733A323A227379223B693A3231343B733A323A227477223B693A3231353B733A323A22746A223B693A3231363B733A323A22747A223B693A3231373B733A323A227468223B693A3231383B733A323A22746C223B693A3231393B733A323A227467223B693A3232303B733A323A22746B223B693A3232313B733A323A22746F223B693A3232323B733A323A227474223B693A3232333B733A323A22746E223B693A3232343B733A323A227472223B693A3232353B733A323A22746D223B693A3232363B733A323A227463223B693A3232373B733A323A227476223B693A3232383B733A323A227567223B693A3232393B733A323A227561223B693A3233303B733A323A226165223B693A3233313B733A323A22756B223B693A3233323B733A323A227573223B693A3233333B733A323A22756D223B693A3233343B733A323A227579223B693A3233353B733A323A22757A223B693A3233363B733A323A227675223B693A3233373B733A323A227665223B693A3233383B733A323A22766E223B693A3233393B733A323A227667223B693A3234303B733A323A227669223B693A3234313B733A323A227766223B693A3234323B733A323A226568223B693A3234333B733A323A227965223B693A3234343B733A323A227975223B693A3234353B733A323A227A6D223B693A3234363B733A323A227A77223B7D,0x613A333A7B693A313B733A313A2231223B693A323B733A313A2233223B693A333B693A2D313B7D,0x613A313A7B693A303B733A313A2231223B7D,NULL,0.00,0.00,1,'','','','POST','','','','AUTH_CAPTURE','','',NULL,'','','1','','0.00',0,'','',''),(3,1275426595,'PayPal','paypal','PayPal',NULL,0x613A3234373A7B693A303B733A323A226166223B693A313B733A323A226178223B693A323B733A323A22616C223B693A333B733A323A22647A223B693A343B733A323A226173223B693A353B733A323A226164223B693A363B733A323A22616F223B693A373B733A323A226169223B693A383B733A323A226171223B693A393B733A323A226167223B693A31303B733A323A226172223B693A31313B733A323A22616D223B693A31323B733A323A226177223B693A31333B733A323A226163223B693A31343B733A323A226175223B693A31353B733A323A226174223B693A31363B733A323A22617A223B693A31373B733A323A226273223B693A31383B733A323A226268223B693A31393B733A323A226264223B693A32303B733A323A226262223B693A32313B733A323A226279223B693A32323B733A323A226265223B693A32333B733A323A22627A223B693A32343B733A323A22626A223B693A32353B733A323A22626D223B693A32363B733A323A226274223B693A32373B733A323A22626F223B693A32383B733A323A226261223B693A32393B733A323A226277223B693A33303B733A323A226276223B693A33313B733A323A226272223B693A33323B733A323A22696F223B693A33333B733A323A22626E223B693A33343B733A323A226267223B693A33353B733A323A226266223B693A33363B733A323A226269223B693A33373B733A323A226B68223B693A33383B733A323A22636D223B693A33393B733A323A226361223B693A34303B733A323A226376223B693A34313B733A323A226B79223B693A34323B733A323A226366223B693A34333B733A323A227464223B693A34343B733A323A22636C223B693A34353B733A323A22636E223B693A34363B733A323A226378223B693A34373B733A323A226363223B693A34383B733A323A22636F223B693A34393B733A323A226B6D223B693A35303B733A323A226367223B693A35313B733A323A226364223B693A35323B733A323A22636B223B693A35333B733A323A226372223B693A35343B733A323A226369223B693A35353B733A323A226872223B693A35363B733A323A226375223B693A35373B733A323A226379223B693A35383B733A323A22637A223B693A35393B733A323A22646B223B693A36303B733A323A22646A223B693A36313B733A323A22646D223B693A36323B733A323A22646F223B693A36333B733A323A227470223B693A36343B733A323A226563223B693A36353B733A323A226567223B693A36363B733A323A227376223B693A36373B733A323A226771223B693A36383B733A323A226572223B693A36393B733A323A226565223B693A37303B733A323A226574223B693A37313B733A323A22666B223B693A37323B733A323A22666F223B693A37333B733A323A22666A223B693A37343B733A323A226669223B693A37353B733A323A226672223B693A37363B733A323A226766223B693A37373B733A323A227066223B693A37383B733A323A227466223B693A37393B733A323A226761223B693A38303B733A323A22676D223B693A38313B733A323A226765223B693A38323B733A323A226465223B693A38333B733A323A226768223B693A38343B733A323A226769223B693A38353B733A323A226772223B693A38363B733A323A22676C223B693A38373B733A323A226764223B693A38383B733A323A226770223B693A38393B733A323A226775223B693A39303B733A323A226774223B693A39313B733A323A226767223B693A39323B733A323A22676E223B693A39333B733A323A226777223B693A39343B733A323A226779223B693A39353B733A323A226874223B693A39363B733A323A22686D223B693A39373B733A323A227661223B693A39383B733A323A22686E223B693A39393B733A323A22686B223B693A3130303B733A323A226875223B693A3130313B733A323A226973223B693A3130323B733A323A22696E223B693A3130333B733A323A226964223B693A3130343B733A323A226972223B693A3130353B733A323A226971223B693A3130363B733A323A226965223B693A3130373B733A323A22696D223B693A3130383B733A323A22696C223B693A3130393B733A323A226974223B693A3131303B733A323A226A6D223B693A3131313B733A323A226A70223B693A3131323B733A323A226A65223B693A3131333B733A323A226A6F223B693A3131343B733A323A226B7A223B693A3131353B733A323A226B65223B693A3131363B733A323A226B69223B693A3131373B733A323A226B77223B693A3131383B733A323A226B67223B693A3131393B733A323A226C61223B693A3132303B733A323A226C76223B693A3132313B733A323A226C62223B693A3132323B733A323A226C73223B693A3132333B733A323A226C72223B693A3132343B733A323A226C79223B693A3132353B733A323A226C69223B693A3132363B733A323A226C74223B693A3132373B733A323A226C75223B693A3132383B733A323A226D6F223B693A3132393B733A323A226D6B223B693A3133303B733A323A226D67223B693A3133313B733A323A226D77223B693A3133323B733A323A226D79223B693A3133333B733A323A226D76223B693A3133343B733A323A226D6C223B693A3133353B733A323A226D74223B693A3133363B733A323A226D68223B693A3133373B733A323A226D71223B693A3133383B733A323A226D72223B693A3133393B733A323A226D75223B693A3134303B733A323A227974223B693A3134313B733A323A226D78223B693A3134323B733A323A22666D223B693A3134333B733A323A226D64223B693A3134343B733A323A226D63223B693A3134353B733A323A226D6E223B693A3134363B733A323A226D65223B693A3134373B733A323A226D73223B693A3134383B733A323A226D61223B693A3134393B733A323A226D7A223B693A3135303B733A323A226D6D223B693A3135313B733A323A226E61223B693A3135323B733A323A226E72223B693A3135333B733A323A226E70223B693A3135343B733A323A226E6C223B693A3135353B733A323A22616E223B693A3135363B733A323A226E63223B693A3135373B733A323A226E7A223B693A3135383B733A323A226E69223B693A3135393B733A323A226E65223B693A3136303B733A323A226E67223B693A3136313B733A323A226E75223B693A3136323B733A323A226E66223B693A3136333B733A323A226B70223B693A3136343B733A323A226D70223B693A3136353B733A323A226E6F223B693A3136363B733A323A226F6D223B693A3136373B733A323A22706B223B693A3136383B733A323A227077223B693A3136393B733A323A227073223B693A3137303B733A323A227061223B693A3137313B733A323A227067223B693A3137323B733A323A227079223B693A3137333B733A323A227065223B693A3137343B733A323A227068223B693A3137353B733A323A22706E223B693A3137363B733A323A22706C223B693A3137373B733A323A227074223B693A3137383B733A323A227072223B693A3137393B733A323A227161223B693A3138303B733A323A227265223B693A3138313B733A323A22726F223B693A3138323B733A323A227275223B693A3138333B733A323A227277223B693A3138343B733A323A227368223B693A3138353B733A323A226B6E223B693A3138363B733A323A226C63223B693A3138373B733A323A22706D223B693A3138383B733A323A227663223B693A3138393B733A323A227773223B693A3139303B733A323A22736D223B693A3139313B733A323A227374223B693A3139323B733A323A227361223B693A3139333B733A323A22736E223B693A3139343B733A323A227273223B693A3139353B733A323A227363223B693A3139363B733A323A22736C223B693A3139373B733A323A227367223B693A3139383B733A323A22736B223B693A3139393B733A323A227369223B693A3230303B733A323A227362223B693A3230313B733A323A22736F223B693A3230323B733A323A227A61223B693A3230333B733A323A226773223B693A3230343B733A323A226B72223B693A3230353B733A323A226573223B693A3230363B733A323A226C6B223B693A3230373B733A323A227364223B693A3230383B733A323A227372223B693A3230393B733A323A22736A223B693A3231303B733A323A22737A223B693A3231313B733A323A227365223B693A3231323B733A323A226368223B693A3231333B733A323A227379223B693A3231343B733A323A227477223B693A3231353B733A323A22746A223B693A3231363B733A323A22747A223B693A3231373B733A323A227468223B693A3231383B733A323A22746C223B693A3231393B733A323A227467223B693A3232303B733A323A22746B223B693A3232313B733A323A22746F223B693A3232323B733A323A227474223B693A3232333B733A323A22746E223B693A3232343B733A323A227472223B693A3232353B733A323A22746D223B693A3232363B733A323A227463223B693A3232373B733A323A227476223B693A3232383B733A323A227567223B693A3232393B733A323A227561223B693A3233303B733A323A226165223B693A3233313B733A323A22756B223B693A3233323B733A323A227573223B693A3233333B733A323A22756D223B693A3233343B733A323A227579223B693A3233353B733A323A22757A223B693A3233363B733A323A227675223B693A3233373B733A323A227665223B693A3233383B733A323A22766E223B693A3233393B733A323A227667223B693A3234303B733A323A227669223B693A3234313B733A323A227766223B693A3234323B733A323A226568223B693A3234333B733A323A227965223B693A3234343B733A323A227975223B693A3234353B733A323A227A6D223B693A3234363B733A323A227A77223B7D,0x613A323A7B693A313B733A313A2231223B693A323B693A2D313B7D,0x613A313A7B693A303B733A313A2231223B7D,NULL,0.00,0.00,1,'info@isotopeecommerce.com','','','POST','','','','AUTH_CAPTURE','','',NULL,'','1','1','','0.00',0,'','','');
/*!40000 ALTER TABLE `tl_iso_payment_modules` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_price_tiers`
--

DROP TABLE IF EXISTS `tl_iso_price_tiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_price_tiers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `min` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_price_tiers`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_price_tiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_price_tiers` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_prices`
--

DROP TABLE IF EXISTS `tl_iso_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `tax_class` int(10) unsigned NOT NULL DEFAULT '0',
  `config_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_group` int(10) unsigned NOT NULL DEFAULT '0',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_prices`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_prices` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_product_categories`
--

DROP TABLE IF EXISTS `tl_iso_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `page_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_product_categories`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_product_categories` DISABLE KEYS */;
INSERT INTO `tl_iso_product_categories` VALUES (13,34,128,1274315373,273),(14,34,128,1274317262,242),(15,45,128,1274401900,274),(16,45,256,1274402004,242),(17,64,384,1274402570,242),(18,64,256,1274402570,274),(19,75,512,1274403150,242),(20,75,384,1274403150,274),(21,84,128,1274626409,275),(22,93,128,1274626703,277),(23,108,256,1274627277,277),(24,130,512,1274631725,274),(25,137,256,1274632280,273),(26,108,128,1288180377,302),(27,152,640,1409761268,242);
/*!40000 ALTER TABLE `tl_iso_product_categories` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_productcache`
--

DROP TABLE IF EXISTS `tl_iso_productcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_productcache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL DEFAULT '0',
  `module_id` int(10) unsigned NOT NULL DEFAULT '0',
  `requestcache_id` int(10) unsigned NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `products` blob,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `groups` blob,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`module_id`,`requestcache_id`,`keywords`,`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_productcache`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_productcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_productcache` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_products`
--

DROP TABLE IF EXISTS `tl_iso_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `pages` blob,
  `alias` varchar(128) NOT NULL DEFAULT '',
  `sku` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `images` blob,
  `teaser` text,
  `description` text,
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `shipping_exempt` char(1) NOT NULL DEFAULT '',
  `tax_class` int(10) unsigned NOT NULL DEFAULT '0',
  `published` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `language` varchar(2) NOT NULL DEFAULT '',
  `color` blob,
  `size` blob,
  `inherit` blob,
  `keywords_meta` text,
  `description_meta` text,
  `shipping_weight` varchar(255) NOT NULL DEFAULT '',
  `dateAdded` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `baseprice` varchar(255) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  `guests` char(1) NOT NULL DEFAULT '',
  `cssID` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  KEY `pid` (`pid`,`language`,`published`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_products`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_products` DISABLE KEYS */;
INSERT INTO `tl_iso_products` VALUES (34,0,1274642006,1,0x613A323A7B693A303B733A333A22323432223B693A313B733A333A22323733223B7D,'the-standout','the-standout','The Standout',0x613A313A7B693A303B613A333A7B733A333A22737263223B733A31393A2273686F6573312D63393832373037632E706E67223B733A333A22616C74223B733A303A22223B733A343A2264657363223B733A303A22223B7D7D,NULL,'<p>These are some very beautiful shoes. The detail on them is striking, along with extra support that make them good for[nbsp]running[nbsp]long distances.</p>',24.95,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1274642006,4,'','',NULL,'',''),(35,34,1274316218,1,NULL,'','-green-7','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x37,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(36,34,1274316218,1,NULL,'','-green-7.5','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x372E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(37,34,1274316218,1,NULL,'','-green-8','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x38,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(38,34,1274316218,1,NULL,'','-green-8.5','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x382E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(39,34,1274316218,1,NULL,'','-green-9','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x39,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(40,34,1274316218,1,NULL,'','-green-9.5','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x392E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(41,34,1274316218,1,NULL,'','-green-10','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(42,34,1274316218,1,NULL,'','-green-10.5','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x31302E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(43,34,1274316218,1,NULL,'','-green-11','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x3131,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(44,34,1274316218,1,NULL,'','-green-11.5','',NULL,NULL,NULL,24.95,'',0,'1','','','',0x477265656E,0x31312E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274316218,0,'','',NULL,'',''),(45,0,1274641996,1,0x613A323A7B693A303B733A333A22323432223B693A313B733A333A22323734223B7D,'the-underachiever','the-underachiever','The Underachiever',0x613A313A7B693A303B613A333A7B733A333A22737263223B733A31393A2273686F6573332D66336265303364362E706E67223B733A333A22616C74223B733A303A22223B733A343A2264657363223B733A303A22223B7D7D,NULL,'<p>These shoes say \"Yeah, I could do that, but I don\'t want to.\" Let the overachievers have their fun in the sun. We\'re more than happy sitting back and watching them twist an ankle or something stupid. Then we can point and laugh.</p>',23.99,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1274641996,3,'','',NULL,'',''),(46,45,1274402053,1,NULL,'','-blue-10','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C7565,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(47,45,1274402053,1,NULL,'','-black-10','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C61636B,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(48,45,1274402053,1,NULL,'','-blue-10.5','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C7565,0x31302E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(49,45,1274402053,1,NULL,'','-blue-10.5','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C61636B,0x31302E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(50,45,1274402053,1,NULL,'','-blue-11','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C7565,0x3131,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(51,45,1274402053,1,NULL,'','-blue-11','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C61636B,0x3131,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(52,45,1274402053,1,NULL,'','-blue-11.5','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C7565,0x31312E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(53,45,1274402053,1,NULL,'','-blue-11.5','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C61636B,0x31312E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(54,45,1274402053,1,NULL,'','-blue-12','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C7565,0x3132,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(55,45,1274402053,1,NULL,'','-blue-12','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C61636B,0x3132,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(56,45,1274402053,1,NULL,'','-blue-12.5','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C7565,0x31322E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(57,45,1274402053,1,NULL,'','-blue-12.5','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C61636B,0x31322E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(58,45,1274402053,1,NULL,'','-blue-13','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C7565,0x3133,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(59,45,1274402053,1,NULL,'','-blue13','',NULL,NULL,NULL,23.99,'',0,'1','','','',0x426C61636B,0x3133,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(60,45,1274629267,1,NULL,'','-blue-14','The Underachiever - Blue Size 14',NULL,NULL,NULL,29.99,'',0,'1','','','',0x426C7565,0x3134,0x613A343A7B693A303B733A343A226E616D65223B693A313B733A363A22696D61676573223B693A323B733A353A227374617274223B693A333B733A343A2273746F70223B7D,NULL,NULL,'',1274629267,0,'','',NULL,'',''),(61,45,1274402053,1,NULL,'','-blue-14','',NULL,NULL,NULL,29.99,'',0,'1','','','',0x426C61636B,0x3134,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(62,45,1274402053,1,NULL,'','-blue-15','',NULL,NULL,NULL,29.99,'',0,'1','','','',0x426C7565,0x3135,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(63,45,1274402053,1,NULL,'','-blue-15','',NULL,NULL,NULL,29.99,'',0,'1','','','',0x426C61636B,0x3135,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402053,0,'','',NULL,'',''),(64,0,1274642074,1,0x613A323A7B693A303B733A333A22323432223B693A313B733A333A22323734223B7D,'the-jock','the-jock','The Jock',0x613A313A7B693A303B613A333A7B733A333A22737263223B733A32303A2273686F657333312D38616534323831642E6A7067223B733A333A22616C74223B733A303A22223B733A343A2264657363223B733A303A22223B7D7D,NULL,'<p>Feel the burn. Push it to the max. No pain no gain. C\'mon... One more rep. You can do it. What are, you, some sort of wimp? I bet you\'ve never won anything in your entire life. Really? Prove it. <strong>Buy these shoes.</strong></p>',49.99,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1274642074,3,'','',NULL,'',''),(65,64,1274402596,1,NULL,'','-black-9.5','',NULL,NULL,NULL,49.99,'',0,'1','','','',0x426C61636B,0x392E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(66,64,1274402596,1,NULL,'','-black-10','',NULL,NULL,NULL,49.99,'',0,'1','','','',0x426C61636B,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(67,64,1274402596,1,NULL,'','-black-10.5','',NULL,NULL,NULL,49.99,'',0,'1','','','',0x426C61636B,0x31302E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(68,64,1274402596,1,NULL,'','-black-11','',NULL,NULL,NULL,49.99,'',0,'1','','','',0x426C61636B,0x3131,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(69,64,1274402596,1,NULL,'','-black-11.5','',NULL,NULL,NULL,49.99,'',0,'1','','','',0x426C61636B,0x31312E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(70,64,1274402596,1,NULL,'','-black-12','',NULL,NULL,NULL,49.99,'',0,'1','','','',0x426C61636B,0x3132,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(71,64,1274402596,1,NULL,'','-black-12.5','',NULL,NULL,NULL,49.99,'',0,'1','','','',0x426C61636B,0x31322E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(72,64,1274402596,1,NULL,'','-black-13','',NULL,NULL,NULL,49.99,'',0,'1','','','',0x426C61636B,0x3133,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(73,64,1274402596,1,NULL,'','-black-14','',NULL,NULL,NULL,55.99,'',0,'1','','','',0x426C61636B,0x3134,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(74,64,1274402596,1,NULL,'','-black-15','',NULL,NULL,NULL,55.99,'',0,'1','','','',0x426C61636B,0x3135,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274402596,0,'','',NULL,'',''),(75,0,1275442771,1,0x613A323A7B693A303B733A333A22323432223B693A313B733A333A22323734223B7D,'the-creepy-guy','the-creepy-guy','The Creepy Guy',0x613A313A7B693A303B613A333A7B733A333A22737263223B733A32303A2273686F657332392D37363631366137302E6A7067223B733A333A22616C74223B733A303A22223B733A343A2264657363223B733A303A22223B7D7D,NULL,'<p>Hey. Would you like to come over and see my large collection of worm species? I have all the coolest ones. Did you know that worms are hermaphrodites? That means they have sex with themselves. It\'s something I know a lot about.</p>',19.99,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1275442771,3,'','',NULL,'',''),(76,75,1275443325,1,NULL,'','-black-12','',NULL,NULL,NULL,19.99,'',0,'1','','','',0x426C61636B,0x3132,0x613A333A7B693A303B733A343A226E616D65223B693A313B733A353A227374617274223B693A323B733A343A2273746F70223B7D,NULL,NULL,'',1275443325,0,'','',NULL,'',''),(77,75,1275443297,1,NULL,'','-brown-12','',NULL,NULL,NULL,19.99,'',0,'1','','','',0x42726F776E,0x3132,0x613A343A7B693A303B733A343A226E616D65223B693A313B733A31343A2270726963655F6F76657272696465223B693A323B733A353A227374617274223B693A333B733A343A2273746F70223B7D,NULL,NULL,'',1275443297,0,'','',NULL,'',''),(78,75,1274403178,1,NULL,'','-black-13','',NULL,NULL,NULL,19.99,'',0,'1','','','',0x426C61636B,0x3133,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274403178,0,'','',NULL,'',''),(79,75,1274403178,1,NULL,'','-brown-13','',NULL,NULL,NULL,19.99,'',0,'1','','','',0x42726F776E,0x3133,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274403178,0,'','',NULL,'',''),(80,75,1274403178,1,NULL,'','-black-14','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x426C61636B,0x3134,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274403178,0,'','',NULL,'',''),(81,75,1274403178,1,NULL,'','-brown-14','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x42726F776E,0x3134,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274403178,0,'','',NULL,'',''),(82,75,1274403178,1,NULL,'','-black-15','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x426C61636B,0x3135,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274403178,0,'','',NULL,'',''),(83,75,1274403178,1,NULL,'','-brown-15','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x42726F776E,0x3135,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274403178,0,'','',NULL,'',''),(84,0,1274641962,1,0x613A313A7B693A303B733A333A22323735223B7D,'future-all-star','future-all-star','Future All Star',0x613A313A7B693A303B613A333A7B733A333A22737263223B733A32303A2273686F657331332D63376338356535662E706E67223B733A333A22616C74223B733A303A22223B733A343A2264657363223B733A303A22223B7D7D,'Does your kid have what it takes to be a professional athlete? Find out with these shoes.','<p>Does your kid have what it takes to be a professional athlete? Find out with these shoes. After wearing these shoes for 3 months the shoes will email you a report on whether or not your child has what it takes to be a pro. The sensitive electronic readouts measure strength, endurance, and gusto.</p>',84.99,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1274641962,2,'','',NULL,'',''),(85,84,1274626435,1,NULL,'','-red-7','',NULL,NULL,NULL,84.99,'',0,'1','','','',0x526564,0x37,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626435,0,'','',NULL,'',''),(86,84,1274626435,1,NULL,'','-blue-7','',NULL,NULL,NULL,84.99,'',0,'1','','','',0x426C7565,0x37,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626435,0,'','',NULL,'',''),(87,84,1274626435,1,NULL,'','-red-7.5','',NULL,NULL,NULL,84.99,'',0,'1','','','',0x526564,0x372E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626435,0,'','',NULL,'',''),(88,84,1274626435,1,NULL,'','-blue-7.5','',NULL,NULL,NULL,84.99,'',0,'1','','','',0x426C7565,0x372E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626435,0,'','',NULL,'',''),(89,84,1274626435,1,NULL,'','-red-8','',NULL,NULL,NULL,84.99,'',0,'1','','','',0x526564,0x38,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626435,0,'','',NULL,'',''),(90,84,1274626435,1,NULL,'','-blue-8','',NULL,NULL,NULL,84.99,'',0,'1','','','',0x426C7565,0x38,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626435,0,'','',NULL,'',''),(91,84,1274626435,1,NULL,'','-red-8.5','',NULL,NULL,NULL,84.99,'',0,'1','','','',0x526564,0x382E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626435,0,'','',NULL,'',''),(92,84,1274626435,1,NULL,'','-blue-8.5','',NULL,NULL,NULL,84.99,'',0,'1','','','',0x426C7565,0x382E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626435,0,'','',NULL,'',''),(93,0,1274642014,1,0x613A313A7B693A303B733A333A22323737223B7D,'open-toad','open-toad','The Open Toad',0x613A313A7B693A303B613A333A7B733A333A22737263223B733A31393A2273686F6573342D30303534316563662E706E67223B733A333A22616C74223B733A303A22223B733A343A2264657363223B733A303A22223B7D7D,'These shoes come with a free pedicure to make sure no one is grossed out by your toes.','<p>These shoes come with a free pedicure to make sure no one is grossed out by your toes. Hey, admit it... Your toes aren\'t extremely appealing. These shoes will force you to take better care of them, though, because they will be out there for all the world to see. So cover up those corns, and abolish those[nbsp]bunions, because your toes are coming out to play.</p>',29.99,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1274642014,1,'','',NULL,'',''),(94,93,1274626729,1,NULL,'','-black-7','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x426C61636B,0x37,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(95,93,1274626729,1,NULL,'','-brown-7','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x42726F776E,0x37,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(96,93,1274626729,1,NULL,'','-black-7.5','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x426C61636B,0x372E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(97,93,1274626729,1,NULL,'','-brown-7.5','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x42726F776E,0x372E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(98,93,1274626729,1,NULL,'','-black-8','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x426C61636B,0x38,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(99,93,1274626729,1,NULL,'','-brown-8','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x42726F776E,0x38,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(100,93,1274626729,1,NULL,'','-black-8.5','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x426C61636B,0x382E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(101,93,1274626729,1,NULL,'','-brown-8.5','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x42726F776E,0x382E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(102,93,1274626729,1,NULL,'','-black-9','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x426C61636B,0x39,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(103,93,1274626729,1,NULL,'','-brown-9','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x42726F776E,0x39,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(104,93,1274626729,1,NULL,'','-black-9.5','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x426C61636B,0x392E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(105,93,1274626729,1,NULL,'','-brown-9.5','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x42726F776E,0x392E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(106,93,1274626729,1,NULL,'','-black-10','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x426C61636B,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(107,93,1274626729,1,NULL,'','-brown-10','',NULL,NULL,NULL,24.99,'',0,'1','','','',0x42726F776E,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274626729,0,'','',NULL,'',''),(108,0,1350333786,1,0x613A323A7B693A303B733A333A22323737223B693A313B733A333A22333032223B7D,'day-at-the-beach','day-at-the-beach','Day at the Beach',0x613A323A7B693A303B613A333A7B733A333A22737263223B733A32303A2273686F657331302D63666165623961652E706E67223B733A333A22616C74223B733A303A22223B733A343A2264657363223B733A303A22223B7D693A313B613A313A7B733A333A22737263223B733A31363A22746F702D66633036303264392E676966223B7D7D,'??? ???????? ?????? ?????????????? ??????????? ??????, ??? ? ?????? ?? ?????.','<p>These sandals come pre-filled with sand, just like walking on the beach. Every step gives you the sensation of almost stepping on some sharp seashell or possibly broken glass, along with the hotfoot of walking on scalding sand. Take a vacation every day with these fabulous sandals.</p>',25.99,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1288252488,1,'','',NULL,'',''),(109,108,1274627296,1,NULL,'','-green-10','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x477265656E,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(110,108,1274627296,1,NULL,'','-black-10','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x426C61636B,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(111,108,1274627296,1,NULL,'','-brown-10','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x42726F776E,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(112,108,1274627296,1,NULL,'','-green-10.5','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x477265656E,0x31302E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(113,108,1274627296,1,NULL,'','-black-10.5','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x426C61636B,0x31302E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(114,108,1274627296,1,NULL,'','-brown-10.5','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x42726F776E,0x31302E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(115,108,1274627296,1,NULL,'','-green-11','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x477265656E,0x3131,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(116,108,1274627296,1,NULL,'','-black-11','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x426C61636B,0x3131,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(117,108,1274627296,1,NULL,'','-brown-11','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x42726F776E,0x3131,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(118,108,1274627296,1,NULL,'','-green-11.5','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x477265656E,0x31312E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(119,108,1274627296,1,NULL,'','-black-11.5','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x426C61636B,0x31312E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(120,108,1274627296,1,NULL,'','-brown-11.5','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x42726F776E,0x31312E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(121,108,1274627296,1,NULL,'','-green-12','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x477265656E,0x3132,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(122,108,1274627296,1,NULL,'','-black-12','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x426C61636B,0x3132,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(123,108,1274627296,1,NULL,'','-brown-12','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x42726F776E,0x3132,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(124,108,1274627296,1,NULL,'','-green-12.5','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x477265656E,0x31322E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(125,108,1274627296,1,NULL,'','-black-12.5','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x426C61636B,0x31322E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(126,108,1274627296,1,NULL,'','-brown-12.5','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x42726F776E,0x31322E35,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(127,108,1274627296,1,NULL,'','-green-13','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x477265656E,0x3133,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(128,108,1274627296,1,NULL,'','-black-13','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x426C61636B,0x3133,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(129,108,1274627296,1,NULL,'','-brown-13','',NULL,NULL,NULL,25.99,'',0,'1','','','',0x42726F776E,0x3133,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274627296,0,'','',NULL,'',''),(130,0,1274642024,1,0x613A313A7B693A303B733A333A22323734223B7D,'the-misunderstood-bully','the-misunderstood-bully','The Misunderstood Bully',0x613A313A7B693A303B613A333A7B733A333A22737263223B733A32303A2273686F657331392D35383230663232662E6A7067223B733A333A22616C74223B733A303A22223B733A343A2264657363223B733A303A22223B7D7D,'If everyone could just see through its macho exterior to the supple insole.','<p>If everyone could just see through its macho exterior to the supple insole. This boot looks like it is ready to break open a can of whoop-ass, but really it just wants to cradle your feet in supple goodness. And if you make fun of them, then get ready for a stomping.</p>',65.99,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1274642024,3,'','',NULL,'',''),(131,130,1274631744,1,NULL,'','-black-10','',NULL,NULL,NULL,65.99,'',0,'1','','','',0x426C61636B,0x3130,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274631744,0,'','',NULL,'',''),(132,130,1274631744,1,NULL,'','-black-11','',NULL,NULL,NULL,68.99,'',0,'1','','','',0x426C61636B,0x3131,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274631744,0,'','',NULL,'',''),(133,130,1274631744,1,NULL,'','-black-12','',NULL,NULL,NULL,72.99,'',0,'1','','','',0x426C61636B,0x3132,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274631744,0,'','',NULL,'',''),(134,130,1274631744,1,NULL,'','-black-13','',NULL,NULL,NULL,75.99,'',0,'1','','','',0x426C61636B,0x3133,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274631744,0,'','',NULL,'',''),(135,130,1274631744,1,NULL,'','-black-14','',NULL,NULL,NULL,79.99,'',0,'1','','','',0x426C61636B,0x3134,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274631744,0,'','',NULL,'',''),(136,130,1274631744,1,NULL,'','-black-15','',NULL,NULL,NULL,85.00,'',0,'1','','','',0x426C61636B,0x3135,0x613A353A7B693A313B733A343A226E616D65223B693A333B733A363A22776569676874223B693A353B733A393A227075626C6973686564223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274631744,0,'','',NULL,'',''),(137,0,1274641987,1,0x613A313A7B693A303B733A333A22323733223B7D,'hoochie-momma','hoochie-momma','The Hoochie Momma',0x613A313A7B693A303B613A333A7B733A333A22737263223B733A32303A2273686F657331322D66383431346436362E706E67223B733A333A22616C74223B733A303A22223B733A343A2264657363223B733A303A22223B7D7D,'Girl, you better work it in this fine footwear. If you don\'t get noticed in these, then just stop trying.','<p>Girl, you better work it in this fine footwear. If you don\'t get noticed in these, then just stop trying. End of story.</p>',35.99,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1274641987,4,'','',NULL,'',''),(138,137,1274632405,1,NULL,'','-blue-7','',NULL,NULL,NULL,28.99,'',0,'1','','','',0x426C7565,0x37,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(139,137,1274632405,1,NULL,'','-green-7','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x477265656E,0x37,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(140,137,1274632405,1,NULL,'','-blue-7.5','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x426C7565,0x372E35,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(141,137,1274632405,1,NULL,'','-green-7.5','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x477265656E,0x372E35,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(142,137,1274632405,1,NULL,'','-blue-8','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x426C7565,0x38,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(143,137,1274632405,1,NULL,'','-green-8','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x477265656E,0x38,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(144,137,1274632405,1,NULL,'','-blue-8.5','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x426C7565,0x382E35,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(145,137,1274632405,1,NULL,'','-green-8.5','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x477265656E,0x382E35,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(146,137,1274632405,1,NULL,'','-blue-9','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x426C7565,0x39,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(147,137,1274632405,1,NULL,'','-green-9','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x477265656E,0x39,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(148,137,1274632405,1,NULL,'','-blue-9.5','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x426C7565,0x392E35,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(149,137,1274632405,1,NULL,'','-green-9.5','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x477265656E,0x392E35,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(150,137,1274632405,1,NULL,'','-blue-10','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x426C7565,0x3130,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(151,137,1274632405,1,NULL,'','-green-10','',NULL,NULL,NULL,35.99,'',0,'1','','','',0x477265656E,0x3130,0x613A343A7B693A313B733A343A226E616D65223B693A343B733A363A22696D61676573223B693A363B733A353A227374617274223B693A373B733A343A2273746F70223B7D,NULL,NULL,'',1274632405,0,'','',NULL,'',''),(152,0,1409761268,2,0x613A313A7B693A303B733A333A22323432223B7D,'download-1','12345678','Download 1',0x613A303A7B7D,'','<p>Description</p>',15.00,'',1,'1','','','',NULL,NULL,NULL,NULL,NULL,'a:2:{i:0;s:0:\"\";i:1;s:2:\"kg\";}',1409761268,5,'','',NULL,'','');
/*!40000 ALTER TABLE `tl_iso_products` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_producttypes`
--

DROP TABLE IF EXISTS `tl_iso_producttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_producttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `attributes` blob,
  `downloads` char(1) NOT NULL DEFAULT '',
  `variant_attributes` blob,
  `class` varchar(32) NOT NULL DEFAULT 'regular',
  `list_template` varchar(255) NOT NULL DEFAULT '',
  `reader_template` varchar(255) NOT NULL DEFAULT '',
  `variants` char(1) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `prices` char(1) NOT NULL DEFAULT '',
  `force_variant_options` char(1) NOT NULL DEFAULT '',
  `show_price_tiers` char(1) NOT NULL DEFAULT '',
  `shipping_exempt` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_producttypes`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_producttypes` DISABLE KEYS */;
INSERT INTO `tl_iso_producttypes` VALUES (1,1287955253,'Shoes',NULL,0x613A31393A7B733A353A22636F6C6F72223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A303B7D733A343A2273697A65223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A313B7D733A343A2274797065223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A323B7D733A353A227061676573223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A333B7D733A353A22616C696173223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A343B7D733A333A22736B75223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A353B7D733A343A226E616D65223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A363B7D733A363A22746561736572223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A373B7D733A31313A226465736372697074696F6E223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A383B7D733A31363A226465736372697074696F6E5F6D657461223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A393B7D733A31333A226B6579776F7264735F6D657461223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31303B7D733A353A227072696365223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31313B7D733A31343A2270726963655F6F76657272696465223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31323B7D733A393A227461785F636C617373223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31333B7D733A31353A227368697070696E675F6578656D7074223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31343B7D733A363A22696D61676573223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31353B7D733A393A227075626C6973686564223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31363B7D733A353A227374617274223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31373B7D733A343A2273746F70223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31383B7D7D,'',0x613A373A7B733A333A22736B75223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A303B7D733A343A226E616D65223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A313B7D733A353A227072696365223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A323B7D733A31343A2270726963655F6F76657272696465223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A333B7D733A393A227075626C6973686564223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A343B7D733A353A227374617274223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A353B7D733A343A2273746F70223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A363B7D7D,'regular','iso_list_default','iso_reader_default','1','','','','',''),(2,1409761225,'Download','',0x613A31333A7B733A353A22616C696173223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A323B7D733A31313A226465736372697074696F6E223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A363B7D733A363A22696D61676573223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A393B7D733A343A226E616D65223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A343B7D733A353A227061676573223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A313B7D733A353A227072696365223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A373B7D733A393A227075626C6973686564223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A31303B7D733A333A22736B75223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A333B7D733A353A227374617274223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A31313B7D733A343A2273746F70223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A31323B7D733A393A227461785F636C617373223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A383B7D733A363A22746561736572223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A353B7D733A343A2274797065223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A303B7D7D,'1',NULL,'regular','iso_list_default','iso_reader_default','','','','','','');
/*!40000 ALTER TABLE `tl_iso_producttypes` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_related_categories`
--

DROP TABLE IF EXISTS `tl_iso_related_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_related_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_related_categories`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_related_categories` DISABLE KEYS */;
INSERT INTO `tl_iso_related_categories` VALUES (1,1272225644,'Related',278);
/*!40000 ALTER TABLE `tl_iso_related_categories` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_related_products`
--

DROP TABLE IF EXISTS `tl_iso_related_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_related_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `category` int(10) unsigned NOT NULL DEFAULT '0',
  `products` blob,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_related_products`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_related_products` DISABLE KEYS */;
INSERT INTO `tl_iso_related_products` VALUES (4,64,128,1345125866,1,0x613A333A7B693A303B733A323A223735223B693A313B733A333A22313330223B693A323B733A323A223435223B7D);
/*!40000 ALTER TABLE `tl_iso_related_products` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_requestcache`
--

DROP TABLE IF EXISTS `tl_iso_requestcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_requestcache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `filters` blob,
  `sorting` blob,
  `limits` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_requestcache`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_requestcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_requestcache` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_rule_restrictions`
--

DROP TABLE IF EXISTS `tl_iso_rule_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_rule_restrictions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`object_id`,`pid`),
  KEY `pid` (`pid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_rule_restrictions`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_rule_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_rule_restrictions` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_rule_usage`
--

DROP TABLE IF EXISTS `tl_iso_rule_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_rule_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `config_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_rule_usage`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_rule_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_rule_usage` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_rules`
--

DROP TABLE IF EXISTS `tl_iso_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `applyTo` varchar(8) NOT NULL DEFAULT '',
  `discount` varchar(16) NOT NULL DEFAULT '',
  `enableCode` char(1) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `limitPerMember` int(10) unsigned NOT NULL DEFAULT '0',
  `limitPerConfig` int(10) unsigned NOT NULL DEFAULT '0',
  `startDate` varchar(10) NOT NULL DEFAULT '',
  `endDate` varchar(10) NOT NULL DEFAULT '',
  `startTime` varchar(10) NOT NULL DEFAULT '',
  `endTime` varchar(10) NOT NULL DEFAULT '',
  `configRestrictions` char(1) NOT NULL DEFAULT '',
  `memberRestrictions` varchar(32) NOT NULL DEFAULT '',
  `productRestrictions` varchar(32) NOT NULL DEFAULT '',
  `minItemQuantity` int(10) unsigned NOT NULL DEFAULT '0',
  `maxItemQuantity` int(10) unsigned NOT NULL DEFAULT '0',
  `quantityMode` varchar(32) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT '',
  `tax_class` int(10) NOT NULL DEFAULT '0',
  `configCondition` char(1) NOT NULL DEFAULT '',
  `memberCondition` char(1) NOT NULL DEFAULT '',
  `productCondition` char(1) NOT NULL DEFAULT '',
  `attributeName` varchar(32) NOT NULL DEFAULT '',
  `attributeCondition` varchar(8) NOT NULL DEFAULT '',
  `attributeValue` varchar(255) NOT NULL DEFAULT '',
  `minSubtotal` int(10) unsigned NOT NULL DEFAULT '0',
  `maxSubtotal` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_rules`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_rules` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_shipping_modules`
--

DROP TABLE IF EXISTS `tl_iso_shipping_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_shipping_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `note` text,
  `countries` blob,
  `minimum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `maximum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `price` varchar(16) NOT NULL DEFAULT '',
  `surcharge_field` varchar(255) NOT NULL DEFAULT '',
  `flatCalculation` varchar(10) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  `enabled` char(1) NOT NULL DEFAULT '',
  `ups_accessKey` varchar(255) NOT NULL DEFAULT '',
  `ups_userName` varchar(255) NOT NULL DEFAULT '',
  `ups_password` varchar(255) NOT NULL DEFAULT '',
  `ups_enabledService` varchar(255) NOT NULL DEFAULT '',
  `usps_userName` varchar(255) NOT NULL DEFAULT '',
  `usps_enabledService` varchar(255) NOT NULL DEFAULT '',
  `tax_class` int(10) NOT NULL DEFAULT '0',
  `subdivisions` longblob,
  `weight_unit` varchar(5) NOT NULL DEFAULT '',
  `product_types` blob,
  `postalCodes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_shipping_modules`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_shipping_modules` DISABLE KEYS */;
INSERT INTO `tl_iso_shipping_modules` VALUES (1,1275421601,'Basic Shipping','order_total','Basic Shipping',NULL,0x613A3234383A7B693A303B733A303A22223B693A313B733A323A226166223B693A323B733A323A226178223B693A333B733A323A22616C223B693A343B733A323A22647A223B693A353B733A323A226173223B693A363B733A323A226164223B693A373B733A323A22616F223B693A383B733A323A226169223B693A393B733A323A226171223B693A31303B733A323A226167223B693A31313B733A323A226172223B693A31323B733A323A22616D223B693A31333B733A323A226177223B693A31343B733A323A226163223B693A31353B733A323A226175223B693A31363B733A323A226174223B693A31373B733A323A22617A223B693A31383B733A323A226273223B693A31393B733A323A226268223B693A32303B733A323A226264223B693A32313B733A323A226262223B693A32323B733A323A226279223B693A32333B733A323A226265223B693A32343B733A323A22627A223B693A32353B733A323A22626A223B693A32363B733A323A22626D223B693A32373B733A323A226274223B693A32383B733A323A22626F223B693A32393B733A323A226261223B693A33303B733A323A226277223B693A33313B733A323A226276223B693A33323B733A323A226272223B693A33333B733A323A22696F223B693A33343B733A323A22626E223B693A33353B733A323A226267223B693A33363B733A323A226266223B693A33373B733A323A226269223B693A33383B733A323A226B68223B693A33393B733A323A22636D223B693A34303B733A323A226361223B693A34313B733A323A226376223B693A34323B733A323A226B79223B693A34333B733A323A226366223B693A34343B733A323A227464223B693A34353B733A323A22636C223B693A34363B733A323A22636E223B693A34373B733A323A226378223B693A34383B733A323A226363223B693A34393B733A323A22636F223B693A35303B733A323A226B6D223B693A35313B733A323A226367223B693A35323B733A323A226364223B693A35333B733A323A22636B223B693A35343B733A323A226372223B693A35353B733A323A226369223B693A35363B733A323A226872223B693A35373B733A323A226375223B693A35383B733A323A226379223B693A35393B733A323A22637A223B693A36303B733A323A22646B223B693A36313B733A323A22646A223B693A36323B733A323A22646D223B693A36333B733A323A22646F223B693A36343B733A323A227470223B693A36353B733A323A226563223B693A36363B733A323A226567223B693A36373B733A323A227376223B693A36383B733A323A226771223B693A36393B733A323A226572223B693A37303B733A323A226565223B693A37313B733A323A226574223B693A37323B733A323A22666B223B693A37333B733A323A22666F223B693A37343B733A323A22666A223B693A37353B733A323A226669223B693A37363B733A323A226672223B693A37373B733A323A226766223B693A37383B733A323A227066223B693A37393B733A323A227466223B693A38303B733A323A226761223B693A38313B733A323A22676D223B693A38323B733A323A226765223B693A38333B733A323A226465223B693A38343B733A323A226768223B693A38353B733A323A226769223B693A38363B733A323A226772223B693A38373B733A323A22676C223B693A38383B733A323A226764223B693A38393B733A323A226770223B693A39303B733A323A226775223B693A39313B733A323A226774223B693A39323B733A323A226767223B693A39333B733A323A22676E223B693A39343B733A323A226777223B693A39353B733A323A226779223B693A39363B733A323A226874223B693A39373B733A323A22686D223B693A39383B733A323A227661223B693A39393B733A323A22686E223B693A3130303B733A323A22686B223B693A3130313B733A323A226875223B693A3130323B733A323A226973223B693A3130333B733A323A22696E223B693A3130343B733A323A226964223B693A3130353B733A323A226972223B693A3130363B733A323A226971223B693A3130373B733A323A226965223B693A3130383B733A323A22696D223B693A3130393B733A323A22696C223B693A3131303B733A323A226974223B693A3131313B733A323A226A6D223B693A3131323B733A323A226A70223B693A3131333B733A323A226A65223B693A3131343B733A323A226A6F223B693A3131353B733A323A226B7A223B693A3131363B733A323A226B65223B693A3131373B733A323A226B69223B693A3131383B733A323A226B77223B693A3131393B733A323A226B67223B693A3132303B733A323A226C61223B693A3132313B733A323A226C76223B693A3132323B733A323A226C62223B693A3132333B733A323A226C73223B693A3132343B733A323A226C72223B693A3132353B733A323A226C79223B693A3132363B733A323A226C69223B693A3132373B733A323A226C74223B693A3132383B733A323A226C75223B693A3132393B733A323A226D6F223B693A3133303B733A323A226D6B223B693A3133313B733A323A226D67223B693A3133323B733A323A226D77223B693A3133333B733A323A226D79223B693A3133343B733A323A226D76223B693A3133353B733A323A226D6C223B693A3133363B733A323A226D74223B693A3133373B733A323A226D68223B693A3133383B733A323A226D71223B693A3133393B733A323A226D72223B693A3134303B733A323A226D75223B693A3134313B733A323A227974223B693A3134323B733A323A226D78223B693A3134333B733A323A22666D223B693A3134343B733A323A226D64223B693A3134353B733A323A226D63223B693A3134363B733A323A226D6E223B693A3134373B733A323A226D65223B693A3134383B733A323A226D73223B693A3134393B733A323A226D61223B693A3135303B733A323A226D7A223B693A3135313B733A323A226D6D223B693A3135323B733A323A226E61223B693A3135333B733A323A226E72223B693A3135343B733A323A226E70223B693A3135353B733A323A226E6C223B693A3135363B733A323A22616E223B693A3135373B733A323A226E63223B693A3135383B733A323A226E7A223B693A3135393B733A323A226E69223B693A3136303B733A323A226E65223B693A3136313B733A323A226E67223B693A3136323B733A323A226E75223B693A3136333B733A323A226E66223B693A3136343B733A323A226B70223B693A3136353B733A323A226D70223B693A3136363B733A323A226E6F223B693A3136373B733A323A226F6D223B693A3136383B733A323A22706B223B693A3136393B733A323A227077223B693A3137303B733A323A227073223B693A3137313B733A323A227061223B693A3137323B733A323A227067223B693A3137333B733A323A227079223B693A3137343B733A323A227065223B693A3137353B733A323A227068223B693A3137363B733A323A22706E223B693A3137373B733A323A22706C223B693A3137383B733A323A227074223B693A3137393B733A323A227072223B693A3138303B733A323A227161223B693A3138313B733A323A227265223B693A3138323B733A323A22726F223B693A3138333B733A323A227275223B693A3138343B733A323A227277223B693A3138353B733A323A227368223B693A3138363B733A323A226B6E223B693A3138373B733A323A226C63223B693A3138383B733A323A22706D223B693A3138393B733A323A227663223B693A3139303B733A323A227773223B693A3139313B733A323A22736D223B693A3139323B733A323A227374223B693A3139333B733A323A227361223B693A3139343B733A323A22736E223B693A3139353B733A323A227273223B693A3139363B733A323A227363223B693A3139373B733A323A22736C223B693A3139383B733A323A227367223B693A3139393B733A323A22736B223B693A3230303B733A323A227369223B693A3230313B733A323A227362223B693A3230323B733A323A22736F223B693A3230333B733A323A227A61223B693A3230343B733A323A226773223B693A3230353B733A323A226B72223B693A3230363B733A323A226573223B693A3230373B733A323A226C6B223B693A3230383B733A323A227364223B693A3230393B733A323A227372223B693A3231303B733A323A22736A223B693A3231313B733A323A22737A223B693A3231323B733A323A227365223B693A3231333B733A323A226368223B693A3231343B733A323A227379223B693A3231353B733A323A227477223B693A3231363B733A323A22746A223B693A3231373B733A323A22747A223B693A3231383B733A323A227468223B693A3231393B733A323A22746C223B693A3232303B733A323A227467223B693A3232313B733A323A22746B223B693A3232323B733A323A22746F223B693A3232333B733A323A227474223B693A3232343B733A323A22746E223B693A3232353B733A323A227472223B693A3232363B733A323A22746D223B693A3232373B733A323A227463223B693A3232383B733A323A227476223B693A3232393B733A323A227567223B693A3233303B733A323A227561223B693A3233313B733A323A226165223B693A3233323B733A323A22756B223B693A3233333B733A323A227573223B693A3233343B733A323A22756D223B693A3233353B733A323A227579223B693A3233363B733A323A22757A223B693A3233373B733A323A227675223B693A3233383B733A323A227665223B693A3233393B733A323A22766E223B693A3234303B733A323A227667223B693A3234313B733A323A227669223B693A3234323B733A323A227766223B693A3234333B733A323A226568223B693A3234343B733A323A227965223B693A3234353B733A323A227975223B693A3234363B733A323A227A6D223B693A3234373B733A323A227A77223B7D,0.00,0.00,'10.00','','flat','','',NULL,'1','','','','','','',0,0x613A333830363A7B693A303B733A363A2241462D424453223B693A313B733A363A2241462D424447223B693A323B733A363A2241462D42474C223B693A333B733A363A2241462D42414C223B693A343B733A363A2241462D42414D223B693A353B733A363A2241462D465241223B693A363B733A363A2241462D465942223B693A373B733A363A2241462D474841223B693A383B733A363A2241462D47484F223B693A393B733A363A2241462D48454C223B693A31303B733A363A2241462D484552223B693A31313B733A363A2241462D4A4F57223B693A31323B733A363A2241462D4B4142223B693A31333B733A363A2241462D4B414E223B693A31343B733A363A2241462D4B4150223B693A31353B733A363A2241462D4B4E52223B693A31363B733A363A2241462D4B445A223B693A31373B733A363A2241462D4C4147223B693A31383B733A363A2241462D4C4F57223B693A31393B733A363A2241462D4E414E223B693A32303B733A363A2241462D4E494D223B693A32313B733A363A2241462D4F5255223B693A32323B733A363A2241462D504941223B693A32333B733A363A2241462D504B41223B693A32343B733A363A2241462D504152223B693A32353B733A363A2241462D53414D223B693A32363B733A363A2241462D534152223B693A32373B733A363A2241462D54414B223B693A32383B733A363A2241462D574152223B693A32393B733A363A2241462D5A4142223B693A33303B733A353A22414C2D4252223B693A33313B733A353A22414C2D4255223B693A33323B733A353A22414C2D444C223B693A33333B733A353A22414C2D4456223B693A33343B733A353A22414C2D4449223B693A33353B733A353A22414C2D4452223B693A33363B733A353A22414C2D454C223B693A33373B733A353A22414C2D4652223B693A33383B733A353A22414C2D4752223B693A33393B733A353A22414C2D474A223B693A34303B733A353A22414C2D4841223B693A34313B733A353A22414C2D4B41223B693A34323B733A353A22414C2D4552223B693A34333B733A353A22414C2D4B4F223B693A34343B733A353A22414C2D4B52223B693A34353B733A353A22414C2D4B43223B693A34363B733A353A22414C2D4B55223B693A34373B733A353A22414C2D4C41223B693A34383B733A353A22414C2D4C45223B693A34393B733A353A22414C2D4C42223B693A35303B733A353A22414C2D4C55223B693A35313B733A353A22414C2D4D4D223B693A35323B733A353A22414C2D4D4B223B693A35333B733A353A22414C2D4D54223B693A35343B733A353A22414C2D4D52223B693A35353B733A353A22414C2D5051223B693A35363B733A353A22414C2D5052223B693A35373B733A353A22414C2D5047223B693A35383B733A353A22414C2D5055223B693A35393B733A353A22414C2D5352223B693A36303B733A353A22414C2D534B223B693A36313B733A353A22414C2D5348223B693A36323B733A353A22414C2D5445223B693A36333B733A353A22414C2D5452223B693A36343B733A353A22414C2D5450223B693A36353B733A353A22414C2D564C223B693A36363B733A353A22445A2D3031223B693A36373B733A353A22445A2D3434223B693A36383B733A353A22445A2D3436223B693A36393B733A353A22445A2D3136223B693A37303B733A353A22445A2D3035223B693A37313B733A353A22445A2D3038223B693A37323B733A353A22445A2D3036223B693A37333B733A353A22445A2D3037223B693A37343B733A353A22445A2D3039223B693A37353B733A353A22445A2D3334223B693A37363B733A353A22445A2D3130223B693A37373B733A353A22445A2D3335223B693A37383B733A353A22445A2D3032223B693A37393B733A353A22445A2D3235223B693A38303B733A353A22445A2D3137223B693A38313B733A353A22445A2D3332223B693A38323B733A353A22445A2D3339223B693A38333B733A353A22445A2D3336223B693A38343B733A353A22445A2D3437223B693A38353B733A353A22445A2D3234223B693A38363B733A353A22445A2D3333223B693A38373B733A353A22445A2D3138223B693A38383B733A353A22445A2D3430223B693A38393B733A353A22445A2D3033223B693A39303B733A353A22445A2D3239223B693A39313B733A353A22445A2D3236223B693A39323B733A353A22445A2D3433223B693A39333B733A353A22445A2D3237223B693A39343B733A353A22445A2D3238223B693A39353B733A353A22445A2D3435223B693A39363B733A353A22445A2D3331223B693A39373B733A353A22445A2D3330223B693A39383B733A353A22445A2D3034223B693A39393B733A353A22445A2D3438223B693A3130303B733A353A22445A2D3230223B693A3130313B733A353A22445A2D3139223B693A3130323B733A353A22445A2D3232223B693A3130333B733A353A22445A2D3231223B693A3130343B733A353A22445A2D3431223B693A3130353B733A353A22445A2D3131223B693A3130363B733A353A22445A2D3132223B693A3130373B733A353A22445A2D3134223B693A3130383B733A353A22445A2D3337223B693A3130393B733A353A22445A2D3432223B693A3131303B733A353A22445A2D3338223B693A3131313B733A353A22445A2D3135223B693A3131323B733A353A22445A2D3133223B693A3131333B733A353A2241532D4153223B693A3131343B733A353A2241442D4144223B693A3131353B733A363A22414F2D42474F223B693A3131363B733A363A22414F2D424755223B693A3131373B733A363A22414F2D424945223B693A3131383B733A363A22414F2D434142223B693A3131393B733A363A22414F2D434355223B693A3132303B733A363A22414F2D434E4F223B693A3132313B733A363A22414F2D435553223B693A3132323B733A363A22414F2D434E4E223B693A3132333B733A363A22414F2D485541223B693A3132343B733A363A22414F2D485549223B693A3132353B733A363A22414F2D4C5541223B693A3132363B733A363A22414F2D4C4E4F223B693A3132373B733A363A22414F2D4C5355223B693A3132383B733A363A22414F2D4D414C223B693A3132393B733A363A22414F2D4D4F58223B693A3133303B733A363A22414F2D4E414D223B693A3133313B733A363A22414F2D554947223B693A3133323B733A363A22414F2D5A4149223B693A3133333B733A353A2241492D4149223B693A3133343B733A353A2241512D4151223B693A3133353B733A353A2241472D4147223B693A3133363B733A343A2241522D43223B693A3133373B733A343A2241522D42223B693A3133383B733A343A2241522D4B223B693A3133393B733A343A2241522D58223B693A3134303B733A343A2241522D57223B693A3134313B733A343A2241522D48223B693A3134323B733A343A2241522D55223B693A3134333B733A343A2241522D45223B693A3134343B733A343A2241522D50223B693A3134353B733A343A2241522D59223B693A3134363B733A343A2241522D4C223B693A3134373B733A343A2241522D46223B693A3134383B733A343A2241522D4D223B693A3134393B733A343A2241522D4E223B693A3135303B733A343A2241522D51223B693A3135313B733A343A2241522D52223B693A3135323B733A343A2241522D41223B693A3135333B733A343A2241522D4A223B693A3135343B733A343A2241522D44223B693A3135353B733A343A2241522D5A223B693A3135363B733A343A2241522D53223B693A3135373B733A343A2241522D47223B693A3135383B733A343A2241522D56223B693A3135393B733A343A2241522D54223B693A3136303B733A353A22414D2D4552223B693A3136313B733A353A22414D2D4147223B693A3136323B733A353A22414D2D4152223B693A3136333B733A353A22414D2D4156223B693A3136343B733A353A22414D2D4752223B693A3136353B733A353A22414D2D4B54223B693A3136363B733A353A22414D2D4C4F223B693A3136373B733A353A22414D2D5348223B693A3136383B733A353A22414D2D5355223B693A3136393B733A353A22414D2D5456223B693A3137303B733A353A22414D2D5644223B693A3137313B733A353A2241572D4157223B693A3137323B733A353A2241552D4E53223B693A3137333B733A353A2241552D514C223B693A3137343B733A353A2241552D5341223B693A3137353B733A353A2241552D5453223B693A3137363B733A353A2241552D5649223B693A3137373B733A353A2241552D5741223B693A3137383B733A353A2241552D4354223B693A3137393B733A353A2241552D4E54223B693A3138303B733A343A2241542D31223B693A3138313B733A343A2241542D32223B693A3138323B733A343A2241542D33223B693A3138333B733A343A2241542D34223B693A3138343B733A343A2241542D35223B693A3138353B733A343A2241542D36223B693A3138363B733A343A2241542D37223B693A3138373B733A343A2241542D38223B693A3138383B733A343A2241542D39223B693A3138393B733A353A22415A2D4D4D223B693A3139303B733A353A22415A2D4142223B693A3139313B733A353A22415A2D4241223B693A3139323B733A353A22415A2D4741223B693A3139333B733A353A22415A2D4C41223B693A3139343B733A353A22415A2D4D49223B693A3139353B733A353A22415A2D4E41223B693A3139363B733A353A22415A2D5341223B693A3139373B733A353A22415A2D534D223B693A3139383B733A353A22415A2D5353223B693A3139393B733A353A22415A2D5841223B693A3230303B733A353A22415A2D5945223B693A3230313B733A363A22415A2D414253223B693A3230323B733A363A22415A2D414743223B693A3230333B733A363A22415A2D41474D223B693A3230343B733A363A22415A2D414753223B693A3230353B733A363A22415A2D414741223B693A3230363B733A363A22415A2D414755223B693A3230373B733A363A22415A2D415354223B693A3230383B733A363A22415A2D424142223B693A3230393B733A363A22415A2D42414C223B693A3231303B733A363A22415A2D424152223B693A3231313B733A363A22415A2D424559223B693A3231323B733A363A22415A2D42494C223B693A3231333B733A363A22415A2D434142223B693A3231343B733A363A22415A2D43414C223B693A3231353B733A363A22415A2D43554C223B693A3231363B733A363A22415A2D444153223B693A3231373B733A363A22415A2D444156223B693A3231383B733A363A22415A2D46555A223B693A3231393B733A363A22415A2D474144223B693A3232303B733A363A22415A2D474F52223B693A3232313B733A363A22415A2D474F59223B693A3232323B733A363A22415A2D484143223B693A3232333B733A363A22415A2D494D49223B693A3232343B733A363A22415A2D49534D223B693A3232353B733A363A22415A2D4B414C223B693A3232363B733A363A22415A2D4B5552223B693A3232373B733A363A22415A2D4C4143223B693A3232383B733A363A22415A2D4C414E223B693A3232393B733A363A22415A2D4C4552223B693A3233303B733A363A22415A2D4D4153223B693A3233313B733A363A22415A2D4E4546223B693A3233323B733A363A22415A2D4F4755223B693A3233333B733A363A22415A2D4F5244223B693A3233343B733A363A22415A2D514142223B693A3233353B733A363A22415A2D514158223B693A3233363B733A363A22415A2D51415A223B693A3233373B733A363A22415A2D514F42223B693A3233383B733A363A22415A2D514241223B693A3233393B733A363A22415A2D514249223B693A3234303B733A363A22415A2D515553223B693A3234313B733A363A22415A2D534154223B693A3234323B733A363A22415A2D534142223B693A3234333B733A363A22415A2D534144223B693A3234343B733A363A22415A2D534148223B693A3234353B733A363A22415A2D53414B223B693A3234363B733A363A22415A2D53414C223B693A3234373B733A363A22415A2D534D49223B693A3234383B733A363A22415A2D534B52223B693A3234393B733A363A22415A2D534D58223B693A3235303B733A363A22415A2D534152223B693A3235313B733A363A22415A2D534959223B693A3235323B733A363A22415A2D535553223B693A3235333B733A363A22415A2D544152223B693A3235343B733A363A22415A2D544F56223B693A3235353B733A363A22415A2D554341223B693A3235363B733A363A22415A2D584143223B693A3235373B733A363A22415A2D58414E223B693A3235383B733A363A22415A2D58495A223B693A3235393B733A363A22415A2D584349223B693A3236303B733A363A22415A2D585644223B693A3236313B733A363A22415A2D594152223B693A3236323B733A363A22415A2D594556223B693A3236333B733A363A22415A2D5A414E223B693A3236343B733A363A22415A2D5A4151223B693A3236353B733A363A22415A2D5A4152223B693A3236363B733A353A2242532D4143223B693A3236373B733A353A2242532D4249223B693A3236383B733A353A2242532D4349223B693A3236393B733A353A2242532D4558223B693A3237303B733A353A2242532D4650223B693A3237313B733A353A2242532D4643223B693A3237323B733A353A2242532D4748223B693A3237333B733A353A2242532D4754223B693A3237343B733A353A2242532D4849223B693A3237353B733A353A2242532D4852223B693A3237363B733A353A2242532D494E223B693A3237373B733A353A2242532D4B42223B693A3237383B733A353A2242532D4C49223B693A3237393B733A353A2242532D4D48223B693A3238303B733A353A2242532D4D47223B693A3238313B733A353A2242532D4E50223B693A3238323B733A353A2242532D4E42223B693A3238333B733A353A2242532D5249223B693A3238343B733A353A2242532D5253223B693A3238353B733A353A2242532D5350223B693A3238363B733A353A2242532D5352223B693A3238373B733A353A2242482D3031223B693A3238383B733A353A2242482D3033223B693A3238393B733A353A2242482D3130223B693A3239303B733A353A2242482D3037223B693A3239313B733A353A2242482D3035223B693A3239323B733A353A2242482D3032223B693A3239333B733A353A2242482D3039223B693A3239343B733A353A2242482D3034223B693A3239353B733A353A2242482D3132223B693A3239363B733A353A2242482D3038223B693A3239373B733A353A2242482D3131223B693A3239383B733A353A2242482D3036223B693A3239393B733A343A2242442D31223B693A3330303B733A353A2242442D3142223B693A3330313B733A353A2242442D3151223B693A3330323B733A343A2242442D32223B693A3330333B733A353A2242442D3241223B693A3330343B733A353A2242442D3244223B693A3330353B733A353A2242442D3245223B693A3330363B733A353A2242442D3246223B693A3330373B733A353A2242442D324F223B693A3330383B733A353A2242442D3254223B693A3330393B733A343A2242442D33223B693A3331303B733A353A2242442D3347223B693A3331313B733A353A2242442D3349223B693A3331323B733A353A2242442D334A223B693A3331333B733A353A2242442D334E223B693A3331343B733A353A2242442D3355223B693A3331353B733A343A2242442D34223B693A3331363B733A353A2242442D344B223B693A3331373B733A353A2242442D344C223B693A3331383B733A353A2242442D344D223B693A3331393B733A343A2242442D35223B693A3332303B733A353A2242442D3543223B693A3332313B733A353A2242442D3548223B693A3332323B733A353A2242442D3550223B693A3332333B733A353A2242442D3552223B693A3332343B733A353A2242442D3553223B693A3332353B733A353A2242422D4242223B693A3332363B733A353A2242592D4252223B693A3332373B733A353A2242592D484F223B693A3332383B733A353A2242592D4852223B693A3332393B733A353A2242592D4D41223B693A3333303B733A353A2242592D4D49223B693A3333313B733A353A2242592D5649223B693A3333323B733A363A2242452D425255223B693A3333333B733A363A2242452D564C47223B693A3333343B733A363A2242452D56414E223B693A3333353B733A363A2242452D564C49223B693A3333363B733A363A2242452D564F56223B693A3333373B733A363A2242452D564252223B693A3333383B733A363A2242452D565756223B693A3333393B733A363A2242452D57414C223B693A3334303B733A363A2242452D574252223B693A3334313B733A363A2242452D574854223B693A3334323B733A363A2242452D574C47223B693A3334333B733A363A2242452D574C58223B693A3334343B733A363A2242452D574E41223B693A3334353B733A353A22425A2D425A223B693A3334363B733A353A22425A2D4359223B693A3334373B733A363A22425A2D435A4C223B693A3334383B733A353A22425A2D4F57223B,'',NULL,NULL);
/*!40000 ALTER TABLE `tl_iso_shipping_modules` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_shipping_options`
--

DROP TABLE IF EXISTS `tl_iso_shipping_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_shipping_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `rate` decimal(12,2) NOT NULL DEFAULT '0.00',
  `minimum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `maximum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `weight_from` varchar(32) NOT NULL DEFAULT '0',
  `weight_to` varchar(32) NOT NULL DEFAULT '0',
  `enabled` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_shipping_options`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_shipping_options` DISABLE KEYS */;
INSERT INTO `tl_iso_shipping_options` VALUES (1,1,1274634457,'0-50',NULL,10.00,0.00,50.00,'0','0','1'),(2,1,1274634478,'50.01 - 100',NULL,12.00,50.00,100.00,'0','0','1'),(3,1,1274634500,'100.01-200',NULL,15.00,100.00,200.00,'0','0','1'),(4,1,1274634528,'200.01-99999999999',NULL,20.00,200.00,2147483647.00,'0','0','1');
/*!40000 ALTER TABLE `tl_iso_shipping_options` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_tax_class`
--

DROP TABLE IF EXISTS `tl_iso_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_tax_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `includes` int(10) unsigned NOT NULL DEFAULT '0',
  `rates` blob,
  `fallback` char(1) NOT NULL DEFAULT '',
  `applyRoundingIncrement` char(1) NOT NULL DEFAULT '',
  `notNegative` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_tax_class`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_tax_class` DISABLE KEYS */;
INSERT INTO `tl_iso_tax_class` VALUES (1,1274641913,'Sales Tax','Sales Tax',0,0x613A313A7B693A303B733A313A2232223B7D,'','','');
/*!40000 ALTER TABLE `tl_iso_tax_class` ENABLE KEYS */;

--
-- Table structure for table `tl_iso_tax_rate`
--

DROP TABLE IF EXISTS `tl_iso_tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_iso_tax_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `countries` text,
  `subdivisions` text,
  `rate` varchar(255) NOT NULL DEFAULT '',
  `address` blob,
  `amount` varchar(255) NOT NULL DEFAULT '',
  `stop` char(1) NOT NULL DEFAULT '',
  `config` int(10) unsigned NOT NULL DEFAULT '0',
  `postalCodes` text,
  `guests` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_tax_rate`
--
-- ORDER BY:  `id`

/*!40000 ALTER TABLE `tl_iso_tax_rate` DISABLE KEYS */;
INSERT INTO `tl_iso_tax_rate` VALUES (2,1274642905,'MA State Sales Tax','MA State Sales Tax','us','US-MA','a:2:{s:4:\"unit\";s:1:\"%\";s:5:\"value\";s:4:\"6.25\";}',0x613A313A7B693A303B733A383A227368697070696E67223B7D,'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','',0,NULL,'','',NULL);
/*!40000 ALTER TABLE `tl_iso_tax_rate` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-04 11:05:49
