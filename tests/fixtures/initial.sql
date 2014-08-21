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

LOCK TABLES `tl_iso_addresses` WRITE;
/*!40000 ALTER TABLE `tl_iso_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_addresses` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_attributes` WRITE;
/*!40000 ALTER TABLE `tl_iso_attributes` DISABLE KEYS */;
INSERT INTO `tl_iso_attributes` VALUES (11,1290441382,'Color','Select the color for this product.','conditionalselect','general_legend','a:5:{i:0;a:2:{s:5:\"value\";s:3:\"Red\";s:5:\"label\";s:3:\"Red\";}i:1;a:2:{s:5:\"value\";s:4:\"Blue\";s:5:\"label\";s:4:\"Blue\";}i:2;a:2:{s:5:\"value\";s:5:\"Green\";s:5:\"label\";s:5:\"Green\";}i:3;a:2:{s:5:\"value\";s:5:\"Black\";s:5:\"label\";s:5:\"Black\";}i:4;a:2:{s:5:\"value\";s:5:\"Brown\";s:5:\"label\";s:5:\"Brown\";}}','1','','','','','','1','','','','color','','',0,'','','',NULL,0,'','','','','','','','','','',''),(13,1344511260,'Size','','select','general_legend','a:15:{i:0;a:2:{s:5:\"value\";s:1:\"7\";s:5:\"label\";s:1:\"7\";}i:1;a:2:{s:5:\"value\";s:3:\"7.5\";s:5:\"label\";s:3:\"7.5\";}i:2;a:2:{s:5:\"value\";s:1:\"8\";s:5:\"label\";s:1:\"8\";}i:3;a:2:{s:5:\"value\";s:3:\"8.5\";s:5:\"label\";s:3:\"8.5\";}i:4;a:2:{s:5:\"value\";s:1:\"9\";s:5:\"label\";s:1:\"9\";}i:5;a:2:{s:5:\"value\";s:3:\"9.5\";s:5:\"label\";s:3:\"9.5\";}i:6;a:2:{s:5:\"value\";s:2:\"10\";s:5:\"label\";s:2:\"10\";}i:7;a:2:{s:5:\"value\";s:4:\"10.5\";s:5:\"label\";s:4:\"10.5\";}i:8;a:2:{s:5:\"value\";s:2:\"11\";s:5:\"label\";s:2:\"11\";}i:9;a:2:{s:5:\"value\";s:4:\"11.5\";s:5:\"label\";s:4:\"11.5\";}i:10;a:2:{s:5:\"value\";s:2:\"12\";s:5:\"label\";s:2:\"12\";}i:11;a:2:{s:5:\"value\";s:4:\"12.5\";s:5:\"label\";s:4:\"12.5\";}i:12;a:2:{s:5:\"value\";s:2:\"13\";s:5:\"label\";s:2:\"13\";}i:13;a:2:{s:5:\"value\";s:2:\"14\";s:5:\"label\";s:2:\"14\";}i:14;a:2:{s:5:\"value\";s:2:\"15\";s:5:\"label\";s:2:\"15\";}}','','','','','','','1','','','','size','','',0,'','','',NULL,0,'','','','','','','','','','','');
/*!40000 ALTER TABLE `tl_iso_attributes` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_baseprice` WRITE;
/*!40000 ALTER TABLE `tl_iso_baseprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_baseprice` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_cart` WRITE;
/*!40000 ALTER TABLE `tl_iso_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_cart` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_cart_items` WRITE;
/*!40000 ALTER TABLE `tl_iso_cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_cart_items` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_config` WRITE;
/*!40000 ALTER TABLE `tl_iso_config` DISABLE KEYS */;
INSERT INTO `tl_iso_config` VALUES (1,1291657980,'Default','Default Store','','1','mul',2,'0.01','USD','1','left','10,000.00','','','1','Isotope','Demo','','','01027','Easthampton','Isotope','us','a:243:{i:0;s:2:\"af\";i:1;s:2:\"ax\";i:2;s:2:\"al\";i:3;s:2:\"dz\";i:4;s:2:\"as\";i:5;s:2:\"ad\";i:6;s:2:\"ao\";i:7;s:2:\"ai\";i:8;s:2:\"aq\";i:9;s:2:\"ag\";i:10;s:2:\"ar\";i:11;s:2:\"am\";i:12;s:2:\"aw\";i:13;s:2:\"au\";i:14;s:2:\"at\";i:15;s:2:\"az\";i:16;s:2:\"bs\";i:17;s:2:\"bh\";i:18;s:2:\"bd\";i:19;s:2:\"bb\";i:20;s:2:\"by\";i:21;s:2:\"be\";i:22;s:2:\"bz\";i:23;s:2:\"bj\";i:24;s:2:\"bm\";i:25;s:2:\"bt\";i:26;s:2:\"bo\";i:27;s:2:\"ba\";i:28;s:2:\"bw\";i:29;s:2:\"bv\";i:30;s:2:\"br\";i:31;s:2:\"io\";i:32;s:2:\"bn\";i:33;s:2:\"bg\";i:34;s:2:\"bf\";i:35;s:2:\"bi\";i:36;s:2:\"kh\";i:37;s:2:\"cm\";i:38;s:2:\"ca\";i:39;s:2:\"cv\";i:40;s:2:\"ky\";i:41;s:2:\"cf\";i:42;s:2:\"td\";i:43;s:2:\"cl\";i:44;s:2:\"cn\";i:45;s:2:\"cx\";i:46;s:2:\"cc\";i:47;s:2:\"co\";i:48;s:2:\"km\";i:49;s:2:\"cg\";i:50;s:2:\"cd\";i:51;s:2:\"ck\";i:52;s:2:\"cr\";i:53;s:2:\"ci\";i:54;s:2:\"hr\";i:55;s:2:\"cu\";i:56;s:2:\"cy\";i:57;s:2:\"cz\";i:58;s:2:\"dk\";i:59;s:2:\"dj\";i:60;s:2:\"dm\";i:61;s:2:\"do\";i:62;s:2:\"ec\";i:63;s:2:\"eg\";i:64;s:2:\"sv\";i:65;s:2:\"gq\";i:66;s:2:\"er\";i:67;s:2:\"ee\";i:68;s:2:\"et\";i:69;s:2:\"fk\";i:70;s:2:\"fo\";i:71;s:2:\"fj\";i:72;s:2:\"fi\";i:73;s:2:\"fr\";i:74;s:2:\"gf\";i:75;s:2:\"pf\";i:76;s:2:\"tf\";i:77;s:2:\"ga\";i:78;s:2:\"gm\";i:79;s:2:\"ge\";i:80;s:2:\"de\";i:81;s:2:\"gh\";i:82;s:2:\"gi\";i:83;s:2:\"gr\";i:84;s:2:\"gl\";i:85;s:2:\"gd\";i:86;s:2:\"gp\";i:87;s:2:\"gu\";i:88;s:2:\"gt\";i:89;s:2:\"gg\";i:90;s:2:\"gn\";i:91;s:2:\"gw\";i:92;s:2:\"gy\";i:93;s:2:\"ht\";i:94;s:2:\"hm\";i:95;s:2:\"va\";i:96;s:2:\"hn\";i:97;s:2:\"hk\";i:98;s:2:\"hu\";i:99;s:2:\"is\";i:100;s:2:\"in\";i:101;s:2:\"id\";i:102;s:2:\"ir\";i:103;s:2:\"iq\";i:104;s:2:\"ie\";i:105;s:2:\"im\";i:106;s:2:\"il\";i:107;s:2:\"it\";i:108;s:2:\"jm\";i:109;s:2:\"jp\";i:110;s:2:\"je\";i:111;s:2:\"jo\";i:112;s:2:\"kz\";i:113;s:2:\"ke\";i:114;s:2:\"ki\";i:115;s:2:\"kw\";i:116;s:2:\"kg\";i:117;s:2:\"la\";i:118;s:2:\"lv\";i:119;s:2:\"lb\";i:120;s:2:\"ls\";i:121;s:2:\"lr\";i:122;s:2:\"ly\";i:123;s:2:\"li\";i:124;s:2:\"lt\";i:125;s:2:\"lu\";i:126;s:2:\"mo\";i:127;s:2:\"mk\";i:128;s:2:\"mg\";i:129;s:2:\"mw\";i:130;s:2:\"my\";i:131;s:2:\"mv\";i:132;s:2:\"ml\";i:133;s:2:\"mt\";i:134;s:2:\"mh\";i:135;s:2:\"mq\";i:136;s:2:\"mr\";i:137;s:2:\"mu\";i:138;s:2:\"yt\";i:139;s:2:\"mx\";i:140;s:2:\"fm\";i:141;s:2:\"md\";i:142;s:2:\"mc\";i:143;s:2:\"mn\";i:144;s:2:\"me\";i:145;s:2:\"ms\";i:146;s:2:\"ma\";i:147;s:2:\"mz\";i:148;s:2:\"mm\";i:149;s:2:\"na\";i:150;s:2:\"nr\";i:151;s:2:\"np\";i:152;s:2:\"nl\";i:153;s:2:\"an\";i:154;s:2:\"nc\";i:155;s:2:\"nz\";i:156;s:2:\"ni\";i:157;s:2:\"ne\";i:158;s:2:\"ng\";i:159;s:2:\"nu\";i:160;s:2:\"nf\";i:161;s:2:\"kp\";i:162;s:2:\"mp\";i:163;s:2:\"no\";i:164;s:2:\"om\";i:165;s:2:\"pk\";i:166;s:2:\"pw\";i:167;s:2:\"ps\";i:168;s:2:\"pa\";i:169;s:2:\"pg\";i:170;s:2:\"py\";i:171;s:2:\"pe\";i:172;s:2:\"ph\";i:173;s:2:\"pn\";i:174;s:2:\"pl\";i:175;s:2:\"pt\";i:176;s:2:\"pr\";i:177;s:2:\"qa\";i:178;s:2:\"re\";i:179;s:2:\"ro\";i:180;s:2:\"ru\";i:181;s:2:\"rw\";i:182;s:2:\"sh\";i:183;s:2:\"kn\";i:184;s:2:\"lc\";i:185;s:2:\"pm\";i:186;s:2:\"vc\";i:187;s:2:\"ws\";i:188;s:2:\"sm\";i:189;s:2:\"st\";i:190;s:2:\"sa\";i:191;s:2:\"sn\";i:192;s:2:\"rs\";i:193;s:2:\"sc\";i:194;s:2:\"sl\";i:195;s:2:\"sg\";i:196;s:2:\"sk\";i:197;s:2:\"si\";i:198;s:2:\"sb\";i:199;s:2:\"so\";i:200;s:2:\"za\";i:201;s:2:\"gs\";i:202;s:2:\"kr\";i:203;s:2:\"es\";i:204;s:2:\"lk\";i:205;s:2:\"sd\";i:206;s:2:\"sr\";i:207;s:2:\"sj\";i:208;s:2:\"sz\";i:209;s:2:\"se\";i:210;s:2:\"ch\";i:211;s:2:\"sy\";i:212;s:2:\"tw\";i:213;s:2:\"tj\";i:214;s:2:\"tz\";i:215;s:2:\"th\";i:216;s:2:\"tl\";i:217;s:2:\"tg\";i:218;s:2:\"tk\";i:219;s:2:\"to\";i:220;s:2:\"tt\";i:221;s:2:\"tn\";i:222;s:2:\"tr\";i:223;s:2:\"tm\";i:224;s:2:\"tc\";i:225;s:2:\"tv\";i:226;s:2:\"ug\";i:227;s:2:\"ua\";i:228;s:2:\"ae\";i:229;s:2:\"us\";i:230;s:2:\"um\";i:231;s:2:\"uy\";i:232;s:2:\"uz\";i:233;s:2:\"vu\";i:234;s:2:\"ve\";i:235;s:2:\"vn\";i:236;s:2:\"vg\";i:237;s:2:\"vi\";i:238;s:2:\"wf\";i:239;s:2:\"eh\";i:240;s:2:\"ye\";i:241;s:2:\"zm\";i:242;s:2:\"zw\";}','a:11:{i:0;a:3:{s:5:\"value\";s:9:\"firstname\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:1;a:3:{s:5:\"value\";s:8:\"lastname\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:2;a:3:{s:5:\"value\";s:7:\"company\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}i:3;a:3:{s:5:\"value\";s:8:\"street_1\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:4;a:3:{s:5:\"value\";s:4:\"city\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:5;a:3:{s:5:\"value\";s:11:\"subdivision\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}i:6;a:3:{s:5:\"value\";s:6:\"postal\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:7;a:3:{s:5:\"value\";s:7:\"country\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:8;a:3:{s:5:\"value\";s:5:\"phone\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}i:9;a:3:{s:5:\"value\";s:5:\"email\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}i:10;a:3:{s:5:\"value\";s:17:\"isDefaultShipping\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}}','a:1:{i:0;s:2:\"us\";}','a:11:{i:0;a:3:{s:5:\"value\";s:9:\"firstname\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:1;a:3:{s:5:\"value\";s:8:\"lastname\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:2;a:3:{s:5:\"value\";s:7:\"company\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}i:3;a:3:{s:5:\"value\";s:8:\"street_1\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:4;a:3:{s:5:\"value\";s:4:\"city\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:5;a:3:{s:5:\"value\";s:11:\"subdivision\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}i:6;a:3:{s:5:\"value\";s:6:\"postal\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:7;a:3:{s:5:\"value\";s:7:\"country\";s:7:\"enabled\";i:1;s:9:\"mandatory\";b:1;}i:8;a:3:{s:5:\"value\";s:5:\"phone\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}i:9;a:3:{s:5:\"value\";s:5:\"email\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}i:10;a:3:{s:5:\"value\";s:16:\"isDefaultBilling\";s:7:\"enabled\";i:1;s:9:\"mandatory\";N;}}','123-456-7890','demo@isotopeecommerce.com','1 Isotope Lane','US-MA',0,'default','a:4:{i:0;a:6:{s:4:\"name\";s:7:\"gallery\";s:5:\"width\";s:2:\"50\";s:6:\"height\";s:2:\"50\";s:4:\"mode\";s:4:\"crop\";s:9:\"watermark\";s:0:\"\";s:8:\"position\";s:2:\"tl\";}i:1;a:6:{s:4:\"name\";s:9:\"thumbnail\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:3:\"100\";s:4:\"mode\";s:3:\"box\";s:9:\"watermark\";s:0:\"\";s:8:\"position\";s:2:\"tl\";}i:2;a:6:{s:4:\"name\";s:6:\"medium\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:4:\"mode\";s:3:\"box\";s:9:\"watermark\";s:0:\"\";s:8:\"position\";s:2:\"tl\";}i:3;a:6:{s:4:\"name\";s:5:\"large\";s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"800\";s:4:\"mode\";s:3:\"box\";s:9:\"watermark\";s:0:\"\";s:8:\"position\";s:2:\"tl\";}}',0.00,'','','','',4,'','',0,0,'us','us','');
/*!40000 ALTER TABLE `tl_iso_config` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_downloads`
--
-- ORDER BY:  `id`

LOCK TABLES `tl_iso_downloads` WRITE;
/*!40000 ALTER TABLE `tl_iso_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_downloads` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_groups`
--
-- ORDER BY:  `id`

LOCK TABLES `tl_iso_groups` WRITE;
/*!40000 ALTER TABLE `tl_iso_groups` DISABLE KEYS */;
INSERT INTO `tl_iso_groups` VALUES (1,0,0,1337074483,'Sandals',0),(2,0,128,1337074483,'Childrens',0),(3,0,256,1337074483,'Mens',0),(4,0,384,1337074483,'Womens',0);
/*!40000 ALTER TABLE `tl_iso_groups` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_labels` WRITE;
/*!40000 ALTER TABLE `tl_iso_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_labels` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_mail` WRITE;
/*!40000 ALTER TABLE `tl_iso_mail` DISABLE KEYS */;
INSERT INTO `tl_iso_mail` VALUES (1,1274655170,'Admin Email','Isotope Demo Store','info@isotopeecommerce.com','','','mail_default','','','',3),(2,1274655188,'Customer EMail','Isotope Demo Store','info@isotopeecommerce.com','','','mail_default','','','',3);
/*!40000 ALTER TABLE `tl_iso_mail` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_mail_content` WRITE;
/*!40000 ALTER TABLE `tl_iso_mail_content` DISABLE KEYS */;
INSERT INTO `tl_iso_mail_content` VALUES (1,1,1275403227,'en','1','A New Order Has Been Placed','{{date::m/d/Y}}\n\nA New Order Has Been Placed on Isotope Demo Store\n\nOrder ID: ##order_id##\n\nBilling Information:\n##billing_address_text##\nPayment Method: ##payment_method##\n\nShipping Information:\n##shipping_address_text##\nShipping Method: ##shipping_method##\n\nProducts:\n##cart_text##\n\nOrder Subtotal:	##subTotal##\nTotal Tax:	        ##taxTotal##\nTotal Shipping:	##shippingPrice##\nGrand Total:	##grandTotal##','','<p>A new order has been placed on Isotope Demo Store</p>\n<table style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\">\n<tbody>\n<tr>\n<td><strong>Order ID:</strong>[nbsp]##order_id##</td>\n<td>{{date::m/d/Y}}</td>\n</tr>\n</tbody>\n</table>\n<table style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\">\n<tbody>\n<tr>\n<td valign=\"top\">\n<p><strong>Billing Information:</strong></p>\n<p>##billing_address##</p>\n<p><strong>Payment Method</strong>:[nbsp]##payment_method##</p>\n</td>\n<td valign=\"top\">\n<p><strong>Shipping Information:</strong></p>\n<p>##shipping_address##</p>\n<p><strong>Shipping Method:</strong> [nbsp]##shipping_method##[nbsp]</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"products\">##cart_html##</p>\n<table class=\"summary\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td valign=\"top\">Order Subtotal:</td>\n<td valign=\"top\">##subTotal##</td>\n</tr>\n<tr>\n<td valign=\"top\">Total Tax:</td>\n<td valign=\"top\">##taxTotal##</td>\n</tr>\n<tr>\n<td valign=\"top\">Total Shipping:</td>\n<td valign=\"top\">##shippingPrice##</td>\n</tr>\n<tr>\n<td valign=\"top\"><strong>Grand Total:</strong></td>\n<td valign=\"top\"><strong>##grandTotal##</strong></td>\n</tr>\n</tbody>\n</table>',NULL),(2,2,1263755574,'en','1','Thank You For Your Order!','Thank you for your order from the Isotope Demo Store!\n\n{{date::m/d/Y}}\n\nOrder ID: ##order_id##\n\nBilling Information:\n##billing_address_text##\nPayment Method: ##payment_method##\n\nShipping Information:\n##shipping_address_text##\nShipping Method: ##shipping_method##\n\nProducts:\n##cart_text##\n\nOrder Subtotal:	##subTotal##\nTotal Tax:	        ##taxTotal##\nTotal Shipping:	##shippingPrice##\nGrand Total:	##grandTotal##','','<p>Thank you for your order from the Isotope Demo Store!</p>\n<table style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\">\n<tbody>\n<tr>\n<td><strong>Order ID:</strong>[nbsp]##order_id##</td>\n<td>{{date::m/d/Y}}</td>\n</tr>\n</tbody>\n</table>\n<table style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\">\n<tbody>\n<tr>\n<td valign=\"top\">\n<p><strong>Billing Information:</strong></p>\n<p>##billing_address##</p>\n<p><strong>Payment Method</strong>:[nbsp]##payment_method##</p>\n</td>\n<td valign=\"top\">\n<p><strong>Shipping Information:</strong></p>\n<p>##shipping_address##</p>\n<p><strong>Shipping Method:</strong> [nbsp]##shipping_method##[nbsp]</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"products\">##cart_html##</p>\n<table class=\"summary\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td valign=\"top\">Order Subtotal:</td>\n<td valign=\"top\">##subTotal##</td>\n</tr>\n<tr>\n<td valign=\"top\">Total Tax:</td>\n<td valign=\"top\">##taxTotal##</td>\n</tr>\n<tr>\n<td valign=\"top\">Total Shipping:</td>\n<td valign=\"top\">##shippingPrice##</td>\n</tr>\n<tr>\n<td valign=\"top\"><strong>Grand Total:</strong></td>\n<td valign=\"top\"><strong>##grandTotal##</strong></td>\n</tr>\n</tbody>\n</table>',NULL);
/*!40000 ALTER TABLE `tl_iso_mail_content` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_order_items` WRITE;
/*!40000 ALTER TABLE `tl_iso_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_order_items` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_orders` WRITE;
/*!40000 ALTER TABLE `tl_iso_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_orders` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_orderstatus` WRITE;
/*!40000 ALTER TABLE `tl_iso_orderstatus` DISABLE KEYS */;
INSERT INTO `tl_iso_orderstatus` VALUES (1,0,1408521987,0,'Pending','','1',0,0,''),(2,0,1408521987,128,'Processing','','',0,0,''),(3,0,1408521987,256,'Complete','1','',0,0,''),(4,0,1408521987,384,'On Hold','','',0,0,''),(5,0,1408521987,512,'Cancelled','','',0,0,'');
/*!40000 ALTER TABLE `tl_iso_orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_payment_modules` WRITE;
/*!40000 ALTER TABLE `tl_iso_payment_modules` DISABLE KEYS */;
INSERT INTO `tl_iso_payment_modules` VALUES (1,1274642121,'Cash','cash','Cash',NULL,'a:247:{i:0;s:2:\"af\";i:1;s:2:\"ax\";i:2;s:2:\"al\";i:3;s:2:\"dz\";i:4;s:2:\"as\";i:5;s:2:\"ad\";i:6;s:2:\"ao\";i:7;s:2:\"ai\";i:8;s:2:\"aq\";i:9;s:2:\"ag\";i:10;s:2:\"ar\";i:11;s:2:\"am\";i:12;s:2:\"aw\";i:13;s:2:\"ac\";i:14;s:2:\"au\";i:15;s:2:\"at\";i:16;s:2:\"az\";i:17;s:2:\"bs\";i:18;s:2:\"bh\";i:19;s:2:\"bd\";i:20;s:2:\"bb\";i:21;s:2:\"by\";i:22;s:2:\"be\";i:23;s:2:\"bz\";i:24;s:2:\"bj\";i:25;s:2:\"bm\";i:26;s:2:\"bt\";i:27;s:2:\"bo\";i:28;s:2:\"ba\";i:29;s:2:\"bw\";i:30;s:2:\"bv\";i:31;s:2:\"br\";i:32;s:2:\"io\";i:33;s:2:\"bn\";i:34;s:2:\"bg\";i:35;s:2:\"bf\";i:36;s:2:\"bi\";i:37;s:2:\"kh\";i:38;s:2:\"cm\";i:39;s:2:\"ca\";i:40;s:2:\"cv\";i:41;s:2:\"ky\";i:42;s:2:\"cf\";i:43;s:2:\"td\";i:44;s:2:\"cl\";i:45;s:2:\"cn\";i:46;s:2:\"cx\";i:47;s:2:\"cc\";i:48;s:2:\"co\";i:49;s:2:\"km\";i:50;s:2:\"cg\";i:51;s:2:\"cd\";i:52;s:2:\"ck\";i:53;s:2:\"cr\";i:54;s:2:\"ci\";i:55;s:2:\"hr\";i:56;s:2:\"cu\";i:57;s:2:\"cy\";i:58;s:2:\"cz\";i:59;s:2:\"dk\";i:60;s:2:\"dj\";i:61;s:2:\"dm\";i:62;s:2:\"do\";i:63;s:2:\"tp\";i:64;s:2:\"ec\";i:65;s:2:\"eg\";i:66;s:2:\"sv\";i:67;s:2:\"gq\";i:68;s:2:\"er\";i:69;s:2:\"ee\";i:70;s:2:\"et\";i:71;s:2:\"fk\";i:72;s:2:\"fo\";i:73;s:2:\"fj\";i:74;s:2:\"fi\";i:75;s:2:\"fr\";i:76;s:2:\"gf\";i:77;s:2:\"pf\";i:78;s:2:\"tf\";i:79;s:2:\"ga\";i:80;s:2:\"gm\";i:81;s:2:\"ge\";i:82;s:2:\"de\";i:83;s:2:\"gh\";i:84;s:2:\"gi\";i:85;s:2:\"gr\";i:86;s:2:\"gl\";i:87;s:2:\"gd\";i:88;s:2:\"gp\";i:89;s:2:\"gu\";i:90;s:2:\"gt\";i:91;s:2:\"gg\";i:92;s:2:\"gn\";i:93;s:2:\"gw\";i:94;s:2:\"gy\";i:95;s:2:\"ht\";i:96;s:2:\"hm\";i:97;s:2:\"va\";i:98;s:2:\"hn\";i:99;s:2:\"hk\";i:100;s:2:\"hu\";i:101;s:2:\"is\";i:102;s:2:\"in\";i:103;s:2:\"id\";i:104;s:2:\"ir\";i:105;s:2:\"iq\";i:106;s:2:\"ie\";i:107;s:2:\"im\";i:108;s:2:\"il\";i:109;s:2:\"it\";i:110;s:2:\"jm\";i:111;s:2:\"jp\";i:112;s:2:\"je\";i:113;s:2:\"jo\";i:114;s:2:\"kz\";i:115;s:2:\"ke\";i:116;s:2:\"ki\";i:117;s:2:\"kw\";i:118;s:2:\"kg\";i:119;s:2:\"la\";i:120;s:2:\"lv\";i:121;s:2:\"lb\";i:122;s:2:\"ls\";i:123;s:2:\"lr\";i:124;s:2:\"ly\";i:125;s:2:\"li\";i:126;s:2:\"lt\";i:127;s:2:\"lu\";i:128;s:2:\"mo\";i:129;s:2:\"mk\";i:130;s:2:\"mg\";i:131;s:2:\"mw\";i:132;s:2:\"my\";i:133;s:2:\"mv\";i:134;s:2:\"ml\";i:135;s:2:\"mt\";i:136;s:2:\"mh\";i:137;s:2:\"mq\";i:138;s:2:\"mr\";i:139;s:2:\"mu\";i:140;s:2:\"yt\";i:141;s:2:\"mx\";i:142;s:2:\"fm\";i:143;s:2:\"md\";i:144;s:2:\"mc\";i:145;s:2:\"mn\";i:146;s:2:\"me\";i:147;s:2:\"ms\";i:148;s:2:\"ma\";i:149;s:2:\"mz\";i:150;s:2:\"mm\";i:151;s:2:\"na\";i:152;s:2:\"nr\";i:153;s:2:\"np\";i:154;s:2:\"nl\";i:155;s:2:\"an\";i:156;s:2:\"nc\";i:157;s:2:\"nz\";i:158;s:2:\"ni\";i:159;s:2:\"ne\";i:160;s:2:\"ng\";i:161;s:2:\"nu\";i:162;s:2:\"nf\";i:163;s:2:\"kp\";i:164;s:2:\"mp\";i:165;s:2:\"no\";i:166;s:2:\"om\";i:167;s:2:\"pk\";i:168;s:2:\"pw\";i:169;s:2:\"ps\";i:170;s:2:\"pa\";i:171;s:2:\"pg\";i:172;s:2:\"py\";i:173;s:2:\"pe\";i:174;s:2:\"ph\";i:175;s:2:\"pn\";i:176;s:2:\"pl\";i:177;s:2:\"pt\";i:178;s:2:\"pr\";i:179;s:2:\"qa\";i:180;s:2:\"re\";i:181;s:2:\"ro\";i:182;s:2:\"ru\";i:183;s:2:\"rw\";i:184;s:2:\"sh\";i:185;s:2:\"kn\";i:186;s:2:\"lc\";i:187;s:2:\"pm\";i:188;s:2:\"vc\";i:189;s:2:\"ws\";i:190;s:2:\"sm\";i:191;s:2:\"st\";i:192;s:2:\"sa\";i:193;s:2:\"sn\";i:194;s:2:\"rs\";i:195;s:2:\"sc\";i:196;s:2:\"sl\";i:197;s:2:\"sg\";i:198;s:2:\"sk\";i:199;s:2:\"si\";i:200;s:2:\"sb\";i:201;s:2:\"so\";i:202;s:2:\"za\";i:203;s:2:\"gs\";i:204;s:2:\"kr\";i:205;s:2:\"es\";i:206;s:2:\"lk\";i:207;s:2:\"sd\";i:208;s:2:\"sr\";i:209;s:2:\"sj\";i:210;s:2:\"sz\";i:211;s:2:\"se\";i:212;s:2:\"ch\";i:213;s:2:\"sy\";i:214;s:2:\"tw\";i:215;s:2:\"tj\";i:216;s:2:\"tz\";i:217;s:2:\"th\";i:218;s:2:\"tl\";i:219;s:2:\"tg\";i:220;s:2:\"tk\";i:221;s:2:\"to\";i:222;s:2:\"tt\";i:223;s:2:\"tn\";i:224;s:2:\"tr\";i:225;s:2:\"tm\";i:226;s:2:\"tc\";i:227;s:2:\"tv\";i:228;s:2:\"ug\";i:229;s:2:\"ua\";i:230;s:2:\"ae\";i:231;s:2:\"uk\";i:232;s:2:\"us\";i:233;s:2:\"um\";i:234;s:2:\"uy\";i:235;s:2:\"uz\";i:236;s:2:\"vu\";i:237;s:2:\"ve\";i:238;s:2:\"vn\";i:239;s:2:\"vg\";i:240;s:2:\"vi\";i:241;s:2:\"wf\";i:242;s:2:\"eh\";i:243;s:2:\"ye\";i:244;s:2:\"yu\";i:245;s:2:\"zm\";i:246;s:2:\"zw\";}','a:3:{i:1;s:1:\"1\";i:2;s:1:\"3\";i:3;i:-1;}','a:1:{i:0;s:1:\"1\";}',NULL,0.00,0.00,1,'','','','POST','','','','AUTH_CAPTURE','','',NULL,'','','1','','0.00',0,'','',''),(3,1275426595,'PayPal','paypal','PayPal',NULL,'a:247:{i:0;s:2:\"af\";i:1;s:2:\"ax\";i:2;s:2:\"al\";i:3;s:2:\"dz\";i:4;s:2:\"as\";i:5;s:2:\"ad\";i:6;s:2:\"ao\";i:7;s:2:\"ai\";i:8;s:2:\"aq\";i:9;s:2:\"ag\";i:10;s:2:\"ar\";i:11;s:2:\"am\";i:12;s:2:\"aw\";i:13;s:2:\"ac\";i:14;s:2:\"au\";i:15;s:2:\"at\";i:16;s:2:\"az\";i:17;s:2:\"bs\";i:18;s:2:\"bh\";i:19;s:2:\"bd\";i:20;s:2:\"bb\";i:21;s:2:\"by\";i:22;s:2:\"be\";i:23;s:2:\"bz\";i:24;s:2:\"bj\";i:25;s:2:\"bm\";i:26;s:2:\"bt\";i:27;s:2:\"bo\";i:28;s:2:\"ba\";i:29;s:2:\"bw\";i:30;s:2:\"bv\";i:31;s:2:\"br\";i:32;s:2:\"io\";i:33;s:2:\"bn\";i:34;s:2:\"bg\";i:35;s:2:\"bf\";i:36;s:2:\"bi\";i:37;s:2:\"kh\";i:38;s:2:\"cm\";i:39;s:2:\"ca\";i:40;s:2:\"cv\";i:41;s:2:\"ky\";i:42;s:2:\"cf\";i:43;s:2:\"td\";i:44;s:2:\"cl\";i:45;s:2:\"cn\";i:46;s:2:\"cx\";i:47;s:2:\"cc\";i:48;s:2:\"co\";i:49;s:2:\"km\";i:50;s:2:\"cg\";i:51;s:2:\"cd\";i:52;s:2:\"ck\";i:53;s:2:\"cr\";i:54;s:2:\"ci\";i:55;s:2:\"hr\";i:56;s:2:\"cu\";i:57;s:2:\"cy\";i:58;s:2:\"cz\";i:59;s:2:\"dk\";i:60;s:2:\"dj\";i:61;s:2:\"dm\";i:62;s:2:\"do\";i:63;s:2:\"tp\";i:64;s:2:\"ec\";i:65;s:2:\"eg\";i:66;s:2:\"sv\";i:67;s:2:\"gq\";i:68;s:2:\"er\";i:69;s:2:\"ee\";i:70;s:2:\"et\";i:71;s:2:\"fk\";i:72;s:2:\"fo\";i:73;s:2:\"fj\";i:74;s:2:\"fi\";i:75;s:2:\"fr\";i:76;s:2:\"gf\";i:77;s:2:\"pf\";i:78;s:2:\"tf\";i:79;s:2:\"ga\";i:80;s:2:\"gm\";i:81;s:2:\"ge\";i:82;s:2:\"de\";i:83;s:2:\"gh\";i:84;s:2:\"gi\";i:85;s:2:\"gr\";i:86;s:2:\"gl\";i:87;s:2:\"gd\";i:88;s:2:\"gp\";i:89;s:2:\"gu\";i:90;s:2:\"gt\";i:91;s:2:\"gg\";i:92;s:2:\"gn\";i:93;s:2:\"gw\";i:94;s:2:\"gy\";i:95;s:2:\"ht\";i:96;s:2:\"hm\";i:97;s:2:\"va\";i:98;s:2:\"hn\";i:99;s:2:\"hk\";i:100;s:2:\"hu\";i:101;s:2:\"is\";i:102;s:2:\"in\";i:103;s:2:\"id\";i:104;s:2:\"ir\";i:105;s:2:\"iq\";i:106;s:2:\"ie\";i:107;s:2:\"im\";i:108;s:2:\"il\";i:109;s:2:\"it\";i:110;s:2:\"jm\";i:111;s:2:\"jp\";i:112;s:2:\"je\";i:113;s:2:\"jo\";i:114;s:2:\"kz\";i:115;s:2:\"ke\";i:116;s:2:\"ki\";i:117;s:2:\"kw\";i:118;s:2:\"kg\";i:119;s:2:\"la\";i:120;s:2:\"lv\";i:121;s:2:\"lb\";i:122;s:2:\"ls\";i:123;s:2:\"lr\";i:124;s:2:\"ly\";i:125;s:2:\"li\";i:126;s:2:\"lt\";i:127;s:2:\"lu\";i:128;s:2:\"mo\";i:129;s:2:\"mk\";i:130;s:2:\"mg\";i:131;s:2:\"mw\";i:132;s:2:\"my\";i:133;s:2:\"mv\";i:134;s:2:\"ml\";i:135;s:2:\"mt\";i:136;s:2:\"mh\";i:137;s:2:\"mq\";i:138;s:2:\"mr\";i:139;s:2:\"mu\";i:140;s:2:\"yt\";i:141;s:2:\"mx\";i:142;s:2:\"fm\";i:143;s:2:\"md\";i:144;s:2:\"mc\";i:145;s:2:\"mn\";i:146;s:2:\"me\";i:147;s:2:\"ms\";i:148;s:2:\"ma\";i:149;s:2:\"mz\";i:150;s:2:\"mm\";i:151;s:2:\"na\";i:152;s:2:\"nr\";i:153;s:2:\"np\";i:154;s:2:\"nl\";i:155;s:2:\"an\";i:156;s:2:\"nc\";i:157;s:2:\"nz\";i:158;s:2:\"ni\";i:159;s:2:\"ne\";i:160;s:2:\"ng\";i:161;s:2:\"nu\";i:162;s:2:\"nf\";i:163;s:2:\"kp\";i:164;s:2:\"mp\";i:165;s:2:\"no\";i:166;s:2:\"om\";i:167;s:2:\"pk\";i:168;s:2:\"pw\";i:169;s:2:\"ps\";i:170;s:2:\"pa\";i:171;s:2:\"pg\";i:172;s:2:\"py\";i:173;s:2:\"pe\";i:174;s:2:\"ph\";i:175;s:2:\"pn\";i:176;s:2:\"pl\";i:177;s:2:\"pt\";i:178;s:2:\"pr\";i:179;s:2:\"qa\";i:180;s:2:\"re\";i:181;s:2:\"ro\";i:182;s:2:\"ru\";i:183;s:2:\"rw\";i:184;s:2:\"sh\";i:185;s:2:\"kn\";i:186;s:2:\"lc\";i:187;s:2:\"pm\";i:188;s:2:\"vc\";i:189;s:2:\"ws\";i:190;s:2:\"sm\";i:191;s:2:\"st\";i:192;s:2:\"sa\";i:193;s:2:\"sn\";i:194;s:2:\"rs\";i:195;s:2:\"sc\";i:196;s:2:\"sl\";i:197;s:2:\"sg\";i:198;s:2:\"sk\";i:199;s:2:\"si\";i:200;s:2:\"sb\";i:201;s:2:\"so\";i:202;s:2:\"za\";i:203;s:2:\"gs\";i:204;s:2:\"kr\";i:205;s:2:\"es\";i:206;s:2:\"lk\";i:207;s:2:\"sd\";i:208;s:2:\"sr\";i:209;s:2:\"sj\";i:210;s:2:\"sz\";i:211;s:2:\"se\";i:212;s:2:\"ch\";i:213;s:2:\"sy\";i:214;s:2:\"tw\";i:215;s:2:\"tj\";i:216;s:2:\"tz\";i:217;s:2:\"th\";i:218;s:2:\"tl\";i:219;s:2:\"tg\";i:220;s:2:\"tk\";i:221;s:2:\"to\";i:222;s:2:\"tt\";i:223;s:2:\"tn\";i:224;s:2:\"tr\";i:225;s:2:\"tm\";i:226;s:2:\"tc\";i:227;s:2:\"tv\";i:228;s:2:\"ug\";i:229;s:2:\"ua\";i:230;s:2:\"ae\";i:231;s:2:\"uk\";i:232;s:2:\"us\";i:233;s:2:\"um\";i:234;s:2:\"uy\";i:235;s:2:\"uz\";i:236;s:2:\"vu\";i:237;s:2:\"ve\";i:238;s:2:\"vn\";i:239;s:2:\"vg\";i:240;s:2:\"vi\";i:241;s:2:\"wf\";i:242;s:2:\"eh\";i:243;s:2:\"ye\";i:244;s:2:\"yu\";i:245;s:2:\"zm\";i:246;s:2:\"zw\";}','a:2:{i:1;s:1:\"1\";i:2;i:-1;}','a:1:{i:0;s:1:\"1\";}',NULL,0.00,0.00,1,'info@isotopeecommerce.com','','','POST','','','','AUTH_CAPTURE','','',NULL,'','1','1','','0.00',0,'','','');
/*!40000 ALTER TABLE `tl_iso_payment_modules` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_price_tiers` WRITE;
/*!40000 ALTER TABLE `tl_iso_price_tiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_price_tiers` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_prices` WRITE;
/*!40000 ALTER TABLE `tl_iso_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_prices` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_product_categories`
--
-- ORDER BY:  `id`

LOCK TABLES `tl_iso_product_categories` WRITE;
/*!40000 ALTER TABLE `tl_iso_product_categories` DISABLE KEYS */;
INSERT INTO `tl_iso_product_categories` VALUES (13,34,128,1274315373,273),(14,34,128,1274317262,242),(15,45,128,1274401900,274),(16,45,256,1274402004,242),(17,64,384,1274402570,242),(18,64,256,1274402570,274),(19,75,512,1274403150,242),(20,75,384,1274403150,274),(21,84,128,1274626409,275),(22,93,128,1274626703,277),(23,108,256,1274627277,277),(24,130,512,1274631725,274),(25,137,256,1274632280,273),(26,108,128,1288180377,302);
/*!40000 ALTER TABLE `tl_iso_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_productcache`
--
-- ORDER BY:  `id`

LOCK TABLES `tl_iso_productcache` WRITE;
/*!40000 ALTER TABLE `tl_iso_productcache` DISABLE KEYS */;
INSERT INTO `tl_iso_productcache` VALUES (1,242,125,0,'','34,45,64,75',0,''),(2,273,142,0,'','34,137',0,'');
/*!40000 ALTER TABLE `tl_iso_productcache` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_products`
--
-- ORDER BY:  `id`

LOCK TABLES `tl_iso_products` WRITE;
/*!40000 ALTER TABLE `tl_iso_products` DISABLE KEYS */;
INSERT INTO `tl_iso_products` VALUES (34,0,1274642006,1,'a:2:{i:0;s:3:\"242\";i:1;s:3:\"273\";}','the-standout','the-standout','The Standout','a:1:{i:0;a:3:{s:3:\"src\";s:19:\"shoes1-c982707c.png\";s:3:\"alt\";s:0:\"\";s:4:\"desc\";s:0:\"\";}}',NULL,'<p>These are some very beautiful shoes. The detail on them is striking, along with extra support that make them good for[nbsp]running[nbsp]long distances.</p>',24.95,'',1,'1','','','','a:5:{s:5:\"Black\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"Blue\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Brown\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Green\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"Red\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}','a:15:{i:7;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"7.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:8;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"8.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:9;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"9.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:10;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"10.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:11;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"11.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:12;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"12.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:13;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:14;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:15;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}',NULL,NULL,NULL,'',1274642006,4,'','',NULL,'',''),(35,34,1274316218,1,NULL,'','-green-7','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','7','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(36,34,1274316218,1,NULL,'','-green-7.5','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','7.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(37,34,1274316218,1,NULL,'','-green-8','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','8','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(38,34,1274316218,1,NULL,'','-green-8.5','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','8.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(39,34,1274316218,1,NULL,'','-green-9','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','9','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(40,34,1274316218,1,NULL,'','-green-9.5','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','9.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(41,34,1274316218,1,NULL,'','-green-10','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(42,34,1274316218,1,NULL,'','-green-10.5','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','10.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(43,34,1274316218,1,NULL,'','-green-11','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','11','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(44,34,1274316218,1,NULL,'','-green-11.5','',NULL,NULL,NULL,24.95,'',0,'1','','','','Green','11.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274316218,0,'','',NULL,'',''),(45,0,1274641996,1,'a:2:{i:0;s:3:\"242\";i:1;s:3:\"274\";}','the-underachiever','the-underachiever','The Underachiever','a:1:{i:0;a:3:{s:3:\"src\";s:19:\"shoes3-f3be03d6.png\";s:3:\"alt\";s:0:\"\";s:4:\"desc\";s:0:\"\";}}',NULL,'<p>These shoes say \"Yeah, I could do that, but I don\'t want to.\" Let the overachievers have their fun in the sun. We\'re more than happy sitting back and watching them twist an ankle or something stupid. Then we can point and laugh.</p>',23.99,'',1,'1','','','','a:5:{s:5:\"Black\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"Blue\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Brown\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Green\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"Red\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}','a:15:{i:7;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"7.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:8;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"8.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:9;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"9.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:10;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"10.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:11;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"11.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:12;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"12.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:13;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:14;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:15;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}',NULL,NULL,NULL,'',1274641996,3,'','',NULL,'',''),(46,45,1274402053,1,NULL,'','-blue-10','',NULL,NULL,NULL,23.99,'',0,'1','','','','Blue','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(47,45,1274402053,1,NULL,'','-black-10','',NULL,NULL,NULL,23.99,'',0,'1','','','','Black','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(48,45,1274402053,1,NULL,'','-blue-10.5','',NULL,NULL,NULL,23.99,'',0,'1','','','','Blue','10.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(49,45,1274402053,1,NULL,'','-blue-10.5','',NULL,NULL,NULL,23.99,'',0,'1','','','','Black','10.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(50,45,1274402053,1,NULL,'','-blue-11','',NULL,NULL,NULL,23.99,'',0,'1','','','','Blue','11','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(51,45,1274402053,1,NULL,'','-blue-11','',NULL,NULL,NULL,23.99,'',0,'1','','','','Black','11','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(52,45,1274402053,1,NULL,'','-blue-11.5','',NULL,NULL,NULL,23.99,'',0,'1','','','','Blue','11.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(53,45,1274402053,1,NULL,'','-blue-11.5','',NULL,NULL,NULL,23.99,'',0,'1','','','','Black','11.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(54,45,1274402053,1,NULL,'','-blue-12','',NULL,NULL,NULL,23.99,'',0,'1','','','','Blue','12','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(55,45,1274402053,1,NULL,'','-blue-12','',NULL,NULL,NULL,23.99,'',0,'1','','','','Black','12','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(56,45,1274402053,1,NULL,'','-blue-12.5','',NULL,NULL,NULL,23.99,'',0,'1','','','','Blue','12.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(57,45,1274402053,1,NULL,'','-blue-12.5','',NULL,NULL,NULL,23.99,'',0,'1','','','','Black','12.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(58,45,1274402053,1,NULL,'','-blue-13','',NULL,NULL,NULL,23.99,'',0,'1','','','','Blue','13','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(59,45,1274402053,1,NULL,'','-blue13','',NULL,NULL,NULL,23.99,'',0,'1','','','','Black','13','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(60,45,1274629267,1,NULL,'','-blue-14','The Underachiever - Blue Size 14',NULL,NULL,NULL,29.99,'',0,'1','','','','Blue','14','a:4:{i:0;s:4:\"name\";i:1;s:6:\"images\";i:2;s:5:\"start\";i:3;s:4:\"stop\";}',NULL,NULL,'',1274629267,0,'','',NULL,'',''),(61,45,1274402053,1,NULL,'','-blue-14','',NULL,NULL,NULL,29.99,'',0,'1','','','','Black','14','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(62,45,1274402053,1,NULL,'','-blue-15','',NULL,NULL,NULL,29.99,'',0,'1','','','','Blue','15','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(63,45,1274402053,1,NULL,'','-blue-15','',NULL,NULL,NULL,29.99,'',0,'1','','','','Black','15','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402053,0,'','',NULL,'',''),(64,0,1274642074,1,'a:2:{i:0;s:3:\"242\";i:1;s:3:\"274\";}','the-jock','the-jock','The Jock','a:1:{i:0;a:3:{s:3:\"src\";s:20:\"shoes31-8ae4281d.jpg\";s:3:\"alt\";s:0:\"\";s:4:\"desc\";s:0:\"\";}}',NULL,'<p>Feel the burn. Push it to the max. No pain no gain. C\'mon... One more rep. You can do it. What are, you, some sort of wimp? I bet you\'ve never won anything in your entire life. Really? Prove it. <strong>Buy these shoes.</strong></p>',49.99,'',1,'1','','','','a:5:{s:5:\"Black\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"Blue\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Brown\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Green\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"Red\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}','a:15:{i:7;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"7.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:8;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"8.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:9;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"9.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:10;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"10.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:11;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"11.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:12;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"12.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:13;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:14;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:15;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}',NULL,NULL,NULL,'',1274642074,3,'','',NULL,'',''),(65,64,1274402596,1,NULL,'','-black-9.5','',NULL,NULL,NULL,49.99,'',0,'1','','','','Black','9.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(66,64,1274402596,1,NULL,'','-black-10','',NULL,NULL,NULL,49.99,'',0,'1','','','','Black','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(67,64,1274402596,1,NULL,'','-black-10.5','',NULL,NULL,NULL,49.99,'',0,'1','','','','Black','10.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(68,64,1274402596,1,NULL,'','-black-11','',NULL,NULL,NULL,49.99,'',0,'1','','','','Black','11','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(69,64,1274402596,1,NULL,'','-black-11.5','',NULL,NULL,NULL,49.99,'',0,'1','','','','Black','11.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(70,64,1274402596,1,NULL,'','-black-12','',NULL,NULL,NULL,49.99,'',0,'1','','','','Black','12','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(71,64,1274402596,1,NULL,'','-black-12.5','',NULL,NULL,NULL,49.99,'',0,'1','','','','Black','12.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(72,64,1274402596,1,NULL,'','-black-13','',NULL,NULL,NULL,49.99,'',0,'1','','','','Black','13','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(73,64,1274402596,1,NULL,'','-black-14','',NULL,NULL,NULL,55.99,'',0,'1','','','','Black','14','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(74,64,1274402596,1,NULL,'','-black-15','',NULL,NULL,NULL,55.99,'',0,'1','','','','Black','15','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274402596,0,'','',NULL,'',''),(75,0,1275442771,1,'a:2:{i:0;s:3:\"242\";i:1;s:3:\"274\";}','the-creepy-guy','the-creepy-guy','The Creepy Guy','a:1:{i:0;a:3:{s:3:\"src\";s:20:\"shoes29-76616a70.jpg\";s:3:\"alt\";s:0:\"\";s:4:\"desc\";s:0:\"\";}}',NULL,'<p>Hey. Would you like to come over and see my large collection of worm species? I have all the coolest ones. Did you know that worms are hermaphrodites? That means they have sex with themselves. It\'s something I know a lot about.</p>',19.99,'',1,'1','','','','a:5:{s:5:\"Black\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"Blue\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Brown\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Green\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"Red\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}','a:15:{i:7;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"7.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:8;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"8.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:9;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"9.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:10;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"10.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:11;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"11.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:12;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"12.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:13;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:14;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:15;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}',NULL,NULL,NULL,'',1275442771,3,'','',NULL,'',''),(76,75,1275443325,1,NULL,'','-black-12','',NULL,NULL,NULL,19.99,'',0,'1','','','','Black','12','a:3:{i:0;s:4:\"name\";i:1;s:5:\"start\";i:2;s:4:\"stop\";}',NULL,NULL,'',1275443325,0,'','',NULL,'',''),(77,75,1275443297,1,NULL,'','-brown-12','',NULL,NULL,NULL,19.99,'',0,'1','','','','Brown','12','a:4:{i:0;s:4:\"name\";i:1;s:14:\"price_override\";i:2;s:5:\"start\";i:3;s:4:\"stop\";}',NULL,NULL,'',1275443297,0,'','',NULL,'',''),(78,75,1274403178,1,NULL,'','-black-13','',NULL,NULL,NULL,19.99,'',0,'1','','','','Black','13','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274403178,0,'','',NULL,'',''),(79,75,1274403178,1,NULL,'','-brown-13','',NULL,NULL,NULL,19.99,'',0,'1','','','','Brown','13','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274403178,0,'','',NULL,'',''),(80,75,1274403178,1,NULL,'','-black-14','',NULL,NULL,NULL,25.99,'',0,'1','','','','Black','14','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274403178,0,'','',NULL,'',''),(81,75,1274403178,1,NULL,'','-brown-14','',NULL,NULL,NULL,25.99,'',0,'1','','','','Brown','14','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274403178,0,'','',NULL,'',''),(82,75,1274403178,1,NULL,'','-black-15','',NULL,NULL,NULL,25.99,'',0,'1','','','','Black','15','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274403178,0,'','',NULL,'',''),(83,75,1274403178,1,NULL,'','-brown-15','',NULL,NULL,NULL,25.99,'',0,'1','','','','Brown','15','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274403178,0,'','',NULL,'',''),(84,0,1274641962,1,'a:1:{i:0;s:3:\"275\";}','future-all-star','future-all-star','Future All Star','a:1:{i:0;a:3:{s:3:\"src\";s:20:\"shoes13-c7c85e5f.png\";s:3:\"alt\";s:0:\"\";s:4:\"desc\";s:0:\"\";}}','Does your kid have what it takes to be a professional athlete? Find out with these shoes.','<p>Does your kid have what it takes to be a professional athlete? Find out with these shoes. After wearing these shoes for 3 months the shoes will email you a report on whether or not your child has what it takes to be a pro. The sensitive electronic readouts measure strength, endurance, and gusto.</p>',84.99,'',1,'1','','','','a:5:{s:5:\"Black\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"Blue\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Brown\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Green\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"Red\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}','a:15:{i:7;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"7.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:8;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"8.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:9;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"9.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:10;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"10.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:11;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"11.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:12;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"12.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:13;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:14;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:15;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}',NULL,NULL,NULL,'',1274641962,2,'','',NULL,'',''),(85,84,1274626435,1,NULL,'','-red-7','',NULL,NULL,NULL,84.99,'',0,'1','','','','Red','7','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626435,0,'','',NULL,'',''),(86,84,1274626435,1,NULL,'','-blue-7','',NULL,NULL,NULL,84.99,'',0,'1','','','','Blue','7','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626435,0,'','',NULL,'',''),(87,84,1274626435,1,NULL,'','-red-7.5','',NULL,NULL,NULL,84.99,'',0,'1','','','','Red','7.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626435,0,'','',NULL,'',''),(88,84,1274626435,1,NULL,'','-blue-7.5','',NULL,NULL,NULL,84.99,'',0,'1','','','','Blue','7.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626435,0,'','',NULL,'',''),(89,84,1274626435,1,NULL,'','-red-8','',NULL,NULL,NULL,84.99,'',0,'1','','','','Red','8','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626435,0,'','',NULL,'',''),(90,84,1274626435,1,NULL,'','-blue-8','',NULL,NULL,NULL,84.99,'',0,'1','','','','Blue','8','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626435,0,'','',NULL,'',''),(91,84,1274626435,1,NULL,'','-red-8.5','',NULL,NULL,NULL,84.99,'',0,'1','','','','Red','8.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626435,0,'','',NULL,'',''),(92,84,1274626435,1,NULL,'','-blue-8.5','',NULL,NULL,NULL,84.99,'',0,'1','','','','Blue','8.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626435,0,'','',NULL,'',''),(93,0,1274642014,1,'a:1:{i:0;s:3:\"277\";}','open-toad','open-toad','The Open Toad','a:1:{i:0;a:3:{s:3:\"src\";s:19:\"shoes4-00541ecf.png\";s:3:\"alt\";s:0:\"\";s:4:\"desc\";s:0:\"\";}}','These shoes come with a free pedicure to make sure no one is grossed out by your toes.','<p>These shoes come with a free pedicure to make sure no one is grossed out by your toes. Hey, admit it... Your toes aren\'t extremely appealing. These shoes will force you to take better care of them, though, because they will be out there for all the world to see. So cover up those corns, and abolish those[nbsp]bunions, because your toes are coming out to play.</p>',29.99,'',1,'1','','','','a:5:{s:5:\"Black\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"Blue\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Brown\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Green\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"Red\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}','a:15:{i:7;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"7.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:8;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"8.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:9;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"9.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:10;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"10.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:11;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"11.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:12;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"12.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:13;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:14;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:15;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}',NULL,NULL,NULL,'',1274642014,1,'','',NULL,'',''),(94,93,1274626729,1,NULL,'','-black-7','',NULL,NULL,NULL,24.99,'',0,'1','','','','Black','7','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(95,93,1274626729,1,NULL,'','-brown-7','',NULL,NULL,NULL,24.99,'',0,'1','','','','Brown','7','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(96,93,1274626729,1,NULL,'','-black-7.5','',NULL,NULL,NULL,24.99,'',0,'1','','','','Black','7.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(97,93,1274626729,1,NULL,'','-brown-7.5','',NULL,NULL,NULL,24.99,'',0,'1','','','','Brown','7.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(98,93,1274626729,1,NULL,'','-black-8','',NULL,NULL,NULL,24.99,'',0,'1','','','','Black','8','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(99,93,1274626729,1,NULL,'','-brown-8','',NULL,NULL,NULL,24.99,'',0,'1','','','','Brown','8','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(100,93,1274626729,1,NULL,'','-black-8.5','',NULL,NULL,NULL,24.99,'',0,'1','','','','Black','8.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(101,93,1274626729,1,NULL,'','-brown-8.5','',NULL,NULL,NULL,24.99,'',0,'1','','','','Brown','8.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(102,93,1274626729,1,NULL,'','-black-9','',NULL,NULL,NULL,24.99,'',0,'1','','','','Black','9','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(103,93,1274626729,1,NULL,'','-brown-9','',NULL,NULL,NULL,24.99,'',0,'1','','','','Brown','9','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(104,93,1274626729,1,NULL,'','-black-9.5','',NULL,NULL,NULL,24.99,'',0,'1','','','','Black','9.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(105,93,1274626729,1,NULL,'','-brown-9.5','',NULL,NULL,NULL,24.99,'',0,'1','','','','Brown','9.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(106,93,1274626729,1,NULL,'','-black-10','',NULL,NULL,NULL,24.99,'',0,'1','','','','Black','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(107,93,1274626729,1,NULL,'','-brown-10','',NULL,NULL,NULL,24.99,'',0,'1','','','','Brown','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274626729,0,'','',NULL,'',''),(108,0,1350333786,1,'a:2:{i:0;s:3:\"277\";i:1;s:3:\"302\";}','day-at-the-beach','day-at-the-beach','Day at the Beach','a:2:{i:0;a:3:{s:3:\"src\";s:20:\"shoes10-cfaeb9ae.png\";s:3:\"alt\";s:0:\"\";s:4:\"desc\";s:0:\"\";}i:1;a:1:{s:3:\"src\";s:16:\"top-fc0602d9.gif\";}}','??? ???????? ?????? ?????????????? ??????????? ??????, ??? ? ?????? ?? ?????.','<p>These sandals come pre-filled with sand, just like walking on the beach. Every step gives you the sensation of almost stepping on some sharp seashell or possibly broken glass, along with the hotfoot of walking on scalding sand. Take a vacation every day with these fabulous sandals.</p>',25.99,'',1,'1','','','','a:5:{s:5:\"Black\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"Blue\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Brown\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Green\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"Red\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}','a:15:{i:7;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"7.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:8;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"8.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:9;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"9.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:10;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"10.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:11;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"11.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:12;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"12.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:13;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:14;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:15;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}',NULL,NULL,NULL,'',1288252488,1,'','',NULL,'',''),(109,108,1274627296,1,NULL,'','-green-10','',NULL,NULL,NULL,25.99,'',0,'1','','','','Green','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(110,108,1274627296,1,NULL,'','-black-10','',NULL,NULL,NULL,25.99,'',0,'1','','','','Black','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(111,108,1274627296,1,NULL,'','-brown-10','',NULL,NULL,NULL,25.99,'',0,'1','','','','Brown','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(112,108,1274627296,1,NULL,'','-green-10.5','',NULL,NULL,NULL,25.99,'',0,'1','','','','Green','10.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(113,108,1274627296,1,NULL,'','-black-10.5','',NULL,NULL,NULL,25.99,'',0,'1','','','','Black','10.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(114,108,1274627296,1,NULL,'','-brown-10.5','',NULL,NULL,NULL,25.99,'',0,'1','','','','Brown','10.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(115,108,1274627296,1,NULL,'','-green-11','',NULL,NULL,NULL,25.99,'',0,'1','','','','Green','11','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(116,108,1274627296,1,NULL,'','-black-11','',NULL,NULL,NULL,25.99,'',0,'1','','','','Black','11','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(117,108,1274627296,1,NULL,'','-brown-11','',NULL,NULL,NULL,25.99,'',0,'1','','','','Brown','11','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(118,108,1274627296,1,NULL,'','-green-11.5','',NULL,NULL,NULL,25.99,'',0,'1','','','','Green','11.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(119,108,1274627296,1,NULL,'','-black-11.5','',NULL,NULL,NULL,25.99,'',0,'1','','','','Black','11.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(120,108,1274627296,1,NULL,'','-brown-11.5','',NULL,NULL,NULL,25.99,'',0,'1','','','','Brown','11.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(121,108,1274627296,1,NULL,'','-green-12','',NULL,NULL,NULL,25.99,'',0,'1','','','','Green','12','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(122,108,1274627296,1,NULL,'','-black-12','',NULL,NULL,NULL,25.99,'',0,'1','','','','Black','12','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(123,108,1274627296,1,NULL,'','-brown-12','',NULL,NULL,NULL,25.99,'',0,'1','','','','Brown','12','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(124,108,1274627296,1,NULL,'','-green-12.5','',NULL,NULL,NULL,25.99,'',0,'1','','','','Green','12.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(125,108,1274627296,1,NULL,'','-black-12.5','',NULL,NULL,NULL,25.99,'',0,'1','','','','Black','12.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(126,108,1274627296,1,NULL,'','-brown-12.5','',NULL,NULL,NULL,25.99,'',0,'1','','','','Brown','12.5','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(127,108,1274627296,1,NULL,'','-green-13','',NULL,NULL,NULL,25.99,'',0,'1','','','','Green','13','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(128,108,1274627296,1,NULL,'','-black-13','',NULL,NULL,NULL,25.99,'',0,'1','','','','Black','13','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(129,108,1274627296,1,NULL,'','-brown-13','',NULL,NULL,NULL,25.99,'',0,'1','','','','Brown','13','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274627296,0,'','',NULL,'',''),(130,0,1274642024,1,'a:1:{i:0;s:3:\"274\";}','the-misunderstood-bully','the-misunderstood-bully','The Misunderstood Bully','a:1:{i:0;a:3:{s:3:\"src\";s:20:\"shoes19-5820f22f.jpg\";s:3:\"alt\";s:0:\"\";s:4:\"desc\";s:0:\"\";}}','If everyone could just see through its macho exterior to the supple insole.','<p>If everyone could just see through its macho exterior to the supple insole. This boot looks like it is ready to break open a can of whoop-ass, but really it just wants to cradle your feet in supple goodness. And if you make fun of them, then get ready for a stomping.</p>',65.99,'',1,'1','','','','a:5:{s:5:\"Black\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"Blue\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Brown\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Green\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"Red\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}','a:15:{i:7;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"7.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:8;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"8.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:9;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"9.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:10;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"10.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:11;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"11.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:12;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"12.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:13;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:14;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:15;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}',NULL,NULL,NULL,'',1274642024,3,'','',NULL,'',''),(131,130,1274631744,1,NULL,'','-black-10','',NULL,NULL,NULL,65.99,'',0,'1','','','','Black','10','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274631744,0,'','',NULL,'',''),(132,130,1274631744,1,NULL,'','-black-11','',NULL,NULL,NULL,68.99,'',0,'1','','','','Black','11','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274631744,0,'','',NULL,'',''),(133,130,1274631744,1,NULL,'','-black-12','',NULL,NULL,NULL,72.99,'',0,'1','','','','Black','12','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274631744,0,'','',NULL,'',''),(134,130,1274631744,1,NULL,'','-black-13','',NULL,NULL,NULL,75.99,'',0,'1','','','','Black','13','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274631744,0,'','',NULL,'',''),(135,130,1274631744,1,NULL,'','-black-14','',NULL,NULL,NULL,79.99,'',0,'1','','','','Black','14','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274631744,0,'','',NULL,'',''),(136,130,1274631744,1,NULL,'','-black-15','',NULL,NULL,NULL,85.00,'',0,'1','','','','Black','15','a:5:{i:1;s:4:\"name\";i:3;s:6:\"weight\";i:5;s:9:\"published\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274631744,0,'','',NULL,'',''),(137,0,1274641987,1,'a:1:{i:0;s:3:\"273\";}','hoochie-momma','hoochie-momma','The Hoochie Momma','a:1:{i:0;a:3:{s:3:\"src\";s:20:\"shoes12-f8414d66.png\";s:3:\"alt\";s:0:\"\";s:4:\"desc\";s:0:\"\";}}','Girl, you better work it in this fine footwear. If you don\'t get noticed in these, then just stop trying.','<p>Girl, you better work it in this fine footwear. If you don\'t get noticed in these, then just stop trying. End of story.</p>',35.99,'',1,'1','','','','a:5:{s:5:\"Black\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"Blue\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Brown\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:5:\"Green\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"Red\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}','a:15:{i:7;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"7.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:8;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"8.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:9;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:3:\"9.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:10;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"10.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:11;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"11.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:12;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}s:4:\"12.5\";a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:13;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:14;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}i:15;a:2:{s:7:\"inherit\";s:1:\"1\";s:5:\"label\";s:0:\"\";}}',NULL,NULL,NULL,'',1274641987,4,'','',NULL,'',''),(138,137,1274632405,1,NULL,'','-blue-7','',NULL,NULL,NULL,28.99,'',0,'1','','','','Blue','7','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(139,137,1274632405,1,NULL,'','-green-7','',NULL,NULL,NULL,35.99,'',0,'1','','','','Green','7','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(140,137,1274632405,1,NULL,'','-blue-7.5','',NULL,NULL,NULL,35.99,'',0,'1','','','','Blue','7.5','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(141,137,1274632405,1,NULL,'','-green-7.5','',NULL,NULL,NULL,35.99,'',0,'1','','','','Green','7.5','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(142,137,1274632405,1,NULL,'','-blue-8','',NULL,NULL,NULL,35.99,'',0,'1','','','','Blue','8','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(143,137,1274632405,1,NULL,'','-green-8','',NULL,NULL,NULL,35.99,'',0,'1','','','','Green','8','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(144,137,1274632405,1,NULL,'','-blue-8.5','',NULL,NULL,NULL,35.99,'',0,'1','','','','Blue','8.5','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(145,137,1274632405,1,NULL,'','-green-8.5','',NULL,NULL,NULL,35.99,'',0,'1','','','','Green','8.5','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(146,137,1274632405,1,NULL,'','-blue-9','',NULL,NULL,NULL,35.99,'',0,'1','','','','Blue','9','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(147,137,1274632405,1,NULL,'','-green-9','',NULL,NULL,NULL,35.99,'',0,'1','','','','Green','9','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(148,137,1274632405,1,NULL,'','-blue-9.5','',NULL,NULL,NULL,35.99,'',0,'1','','','','Blue','9.5','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(149,137,1274632405,1,NULL,'','-green-9.5','',NULL,NULL,NULL,35.99,'',0,'1','','','','Green','9.5','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(150,137,1274632405,1,NULL,'','-blue-10','',NULL,NULL,NULL,35.99,'',0,'1','','','','Blue','10','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'',''),(151,137,1274632405,1,NULL,'','-green-10','',NULL,NULL,NULL,35.99,'',0,'1','','','','Green','10','a:4:{i:1;s:4:\"name\";i:4;s:6:\"images\";i:6;s:5:\"start\";i:7;s:4:\"stop\";}',NULL,NULL,'',1274632405,0,'','',NULL,'','');
/*!40000 ALTER TABLE `tl_iso_products` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_iso_producttypes`
--
-- ORDER BY:  `id`

LOCK TABLES `tl_iso_producttypes` WRITE;
/*!40000 ALTER TABLE `tl_iso_producttypes` DISABLE KEYS */;
INSERT INTO `tl_iso_producttypes` VALUES (1,1287955253,'Shoes',NULL,'a:19:{s:5:\"color\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:0;}s:4:\"size\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:1;}s:4:\"type\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:2;}s:5:\"pages\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:3;}s:5:\"alias\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:4;}s:3:\"sku\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:5;}s:4:\"name\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:6;}s:6:\"teaser\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:7;}s:11:\"description\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:8;}s:16:\"description_meta\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:9;}s:13:\"keywords_meta\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:10;}s:5:\"price\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:11;}s:14:\"price_override\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:12;}s:9:\"tax_class\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:13;}s:15:\"shipping_exempt\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:14;}s:6:\"images\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:15;}s:9:\"published\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:16;}s:5:\"start\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:17;}s:4:\"stop\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:18;}}','','a:7:{s:3:\"sku\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:0;}s:4:\"name\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:1;}s:5:\"price\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:2;}s:14:\"price_override\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:3;}s:9:\"published\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:4;}s:5:\"start\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:5;}s:4:\"stop\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"position\";i:6;}}','regular','iso_list_default','iso_reader_default','1','','','','','');
/*!40000 ALTER TABLE `tl_iso_producttypes` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_related_categories` WRITE;
/*!40000 ALTER TABLE `tl_iso_related_categories` DISABLE KEYS */;
INSERT INTO `tl_iso_related_categories` VALUES (1,1272225644,'Related',278);
/*!40000 ALTER TABLE `tl_iso_related_categories` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_related_products` WRITE;
/*!40000 ALTER TABLE `tl_iso_related_products` DISABLE KEYS */;
INSERT INTO `tl_iso_related_products` VALUES (4,64,128,1345125866,1,'a:3:{i:0;s:2:\"75\";i:1;s:3:\"130\";i:2;s:2:\"45\";}');
/*!40000 ALTER TABLE `tl_iso_related_products` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_requestcache` WRITE;
/*!40000 ALTER TABLE `tl_iso_requestcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_requestcache` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_rule_restrictions` WRITE;
/*!40000 ALTER TABLE `tl_iso_rule_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_rule_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_rule_usage` WRITE;
/*!40000 ALTER TABLE `tl_iso_rule_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_rule_usage` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_rules` WRITE;
/*!40000 ALTER TABLE `tl_iso_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tl_iso_rules` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_shipping_modules` WRITE;
/*!40000 ALTER TABLE `tl_iso_shipping_modules` DISABLE KEYS */;
INSERT INTO `tl_iso_shipping_modules` VALUES (1,1275421601,'Basic Shipping','flat','Basic Shipping',NULL,'a:248:{i:0;s:0:\"\";i:1;s:2:\"af\";i:2;s:2:\"ax\";i:3;s:2:\"al\";i:4;s:2:\"dz\";i:5;s:2:\"as\";i:6;s:2:\"ad\";i:7;s:2:\"ao\";i:8;s:2:\"ai\";i:9;s:2:\"aq\";i:10;s:2:\"ag\";i:11;s:2:\"ar\";i:12;s:2:\"am\";i:13;s:2:\"aw\";i:14;s:2:\"ac\";i:15;s:2:\"au\";i:16;s:2:\"at\";i:17;s:2:\"az\";i:18;s:2:\"bs\";i:19;s:2:\"bh\";i:20;s:2:\"bd\";i:21;s:2:\"bb\";i:22;s:2:\"by\";i:23;s:2:\"be\";i:24;s:2:\"bz\";i:25;s:2:\"bj\";i:26;s:2:\"bm\";i:27;s:2:\"bt\";i:28;s:2:\"bo\";i:29;s:2:\"ba\";i:30;s:2:\"bw\";i:31;s:2:\"bv\";i:32;s:2:\"br\";i:33;s:2:\"io\";i:34;s:2:\"bn\";i:35;s:2:\"bg\";i:36;s:2:\"bf\";i:37;s:2:\"bi\";i:38;s:2:\"kh\";i:39;s:2:\"cm\";i:40;s:2:\"ca\";i:41;s:2:\"cv\";i:42;s:2:\"ky\";i:43;s:2:\"cf\";i:44;s:2:\"td\";i:45;s:2:\"cl\";i:46;s:2:\"cn\";i:47;s:2:\"cx\";i:48;s:2:\"cc\";i:49;s:2:\"co\";i:50;s:2:\"km\";i:51;s:2:\"cg\";i:52;s:2:\"cd\";i:53;s:2:\"ck\";i:54;s:2:\"cr\";i:55;s:2:\"ci\";i:56;s:2:\"hr\";i:57;s:2:\"cu\";i:58;s:2:\"cy\";i:59;s:2:\"cz\";i:60;s:2:\"dk\";i:61;s:2:\"dj\";i:62;s:2:\"dm\";i:63;s:2:\"do\";i:64;s:2:\"tp\";i:65;s:2:\"ec\";i:66;s:2:\"eg\";i:67;s:2:\"sv\";i:68;s:2:\"gq\";i:69;s:2:\"er\";i:70;s:2:\"ee\";i:71;s:2:\"et\";i:72;s:2:\"fk\";i:73;s:2:\"fo\";i:74;s:2:\"fj\";i:75;s:2:\"fi\";i:76;s:2:\"fr\";i:77;s:2:\"gf\";i:78;s:2:\"pf\";i:79;s:2:\"tf\";i:80;s:2:\"ga\";i:81;s:2:\"gm\";i:82;s:2:\"ge\";i:83;s:2:\"de\";i:84;s:2:\"gh\";i:85;s:2:\"gi\";i:86;s:2:\"gr\";i:87;s:2:\"gl\";i:88;s:2:\"gd\";i:89;s:2:\"gp\";i:90;s:2:\"gu\";i:91;s:2:\"gt\";i:92;s:2:\"gg\";i:93;s:2:\"gn\";i:94;s:2:\"gw\";i:95;s:2:\"gy\";i:96;s:2:\"ht\";i:97;s:2:\"hm\";i:98;s:2:\"va\";i:99;s:2:\"hn\";i:100;s:2:\"hk\";i:101;s:2:\"hu\";i:102;s:2:\"is\";i:103;s:2:\"in\";i:104;s:2:\"id\";i:105;s:2:\"ir\";i:106;s:2:\"iq\";i:107;s:2:\"ie\";i:108;s:2:\"im\";i:109;s:2:\"il\";i:110;s:2:\"it\";i:111;s:2:\"jm\";i:112;s:2:\"jp\";i:113;s:2:\"je\";i:114;s:2:\"jo\";i:115;s:2:\"kz\";i:116;s:2:\"ke\";i:117;s:2:\"ki\";i:118;s:2:\"kw\";i:119;s:2:\"kg\";i:120;s:2:\"la\";i:121;s:2:\"lv\";i:122;s:2:\"lb\";i:123;s:2:\"ls\";i:124;s:2:\"lr\";i:125;s:2:\"ly\";i:126;s:2:\"li\";i:127;s:2:\"lt\";i:128;s:2:\"lu\";i:129;s:2:\"mo\";i:130;s:2:\"mk\";i:131;s:2:\"mg\";i:132;s:2:\"mw\";i:133;s:2:\"my\";i:134;s:2:\"mv\";i:135;s:2:\"ml\";i:136;s:2:\"mt\";i:137;s:2:\"mh\";i:138;s:2:\"mq\";i:139;s:2:\"mr\";i:140;s:2:\"mu\";i:141;s:2:\"yt\";i:142;s:2:\"mx\";i:143;s:2:\"fm\";i:144;s:2:\"md\";i:145;s:2:\"mc\";i:146;s:2:\"mn\";i:147;s:2:\"me\";i:148;s:2:\"ms\";i:149;s:2:\"ma\";i:150;s:2:\"mz\";i:151;s:2:\"mm\";i:152;s:2:\"na\";i:153;s:2:\"nr\";i:154;s:2:\"np\";i:155;s:2:\"nl\";i:156;s:2:\"an\";i:157;s:2:\"nc\";i:158;s:2:\"nz\";i:159;s:2:\"ni\";i:160;s:2:\"ne\";i:161;s:2:\"ng\";i:162;s:2:\"nu\";i:163;s:2:\"nf\";i:164;s:2:\"kp\";i:165;s:2:\"mp\";i:166;s:2:\"no\";i:167;s:2:\"om\";i:168;s:2:\"pk\";i:169;s:2:\"pw\";i:170;s:2:\"ps\";i:171;s:2:\"pa\";i:172;s:2:\"pg\";i:173;s:2:\"py\";i:174;s:2:\"pe\";i:175;s:2:\"ph\";i:176;s:2:\"pn\";i:177;s:2:\"pl\";i:178;s:2:\"pt\";i:179;s:2:\"pr\";i:180;s:2:\"qa\";i:181;s:2:\"re\";i:182;s:2:\"ro\";i:183;s:2:\"ru\";i:184;s:2:\"rw\";i:185;s:2:\"sh\";i:186;s:2:\"kn\";i:187;s:2:\"lc\";i:188;s:2:\"pm\";i:189;s:2:\"vc\";i:190;s:2:\"ws\";i:191;s:2:\"sm\";i:192;s:2:\"st\";i:193;s:2:\"sa\";i:194;s:2:\"sn\";i:195;s:2:\"rs\";i:196;s:2:\"sc\";i:197;s:2:\"sl\";i:198;s:2:\"sg\";i:199;s:2:\"sk\";i:200;s:2:\"si\";i:201;s:2:\"sb\";i:202;s:2:\"so\";i:203;s:2:\"za\";i:204;s:2:\"gs\";i:205;s:2:\"kr\";i:206;s:2:\"es\";i:207;s:2:\"lk\";i:208;s:2:\"sd\";i:209;s:2:\"sr\";i:210;s:2:\"sj\";i:211;s:2:\"sz\";i:212;s:2:\"se\";i:213;s:2:\"ch\";i:214;s:2:\"sy\";i:215;s:2:\"tw\";i:216;s:2:\"tj\";i:217;s:2:\"tz\";i:218;s:2:\"th\";i:219;s:2:\"tl\";i:220;s:2:\"tg\";i:221;s:2:\"tk\";i:222;s:2:\"to\";i:223;s:2:\"tt\";i:224;s:2:\"tn\";i:225;s:2:\"tr\";i:226;s:2:\"tm\";i:227;s:2:\"tc\";i:228;s:2:\"tv\";i:229;s:2:\"ug\";i:230;s:2:\"ua\";i:231;s:2:\"ae\";i:232;s:2:\"uk\";i:233;s:2:\"us\";i:234;s:2:\"um\";i:235;s:2:\"uy\";i:236;s:2:\"uz\";i:237;s:2:\"vu\";i:238;s:2:\"ve\";i:239;s:2:\"vn\";i:240;s:2:\"vg\";i:241;s:2:\"vi\";i:242;s:2:\"wf\";i:243;s:2:\"eh\";i:244;s:2:\"ye\";i:245;s:2:\"yu\";i:246;s:2:\"zm\";i:247;s:2:\"zw\";}',0.00,0.00,'10.00','','flat','','',NULL,'1','','','','','','',0,'a:3806:{i:0;s:6:\"AF-BDS\";i:1;s:6:\"AF-BDG\";i:2;s:6:\"AF-BGL\";i:3;s:6:\"AF-BAL\";i:4;s:6:\"AF-BAM\";i:5;s:6:\"AF-FRA\";i:6;s:6:\"AF-FYB\";i:7;s:6:\"AF-GHA\";i:8;s:6:\"AF-GHO\";i:9;s:6:\"AF-HEL\";i:10;s:6:\"AF-HER\";i:11;s:6:\"AF-JOW\";i:12;s:6:\"AF-KAB\";i:13;s:6:\"AF-KAN\";i:14;s:6:\"AF-KAP\";i:15;s:6:\"AF-KNR\";i:16;s:6:\"AF-KDZ\";i:17;s:6:\"AF-LAG\";i:18;s:6:\"AF-LOW\";i:19;s:6:\"AF-NAN\";i:20;s:6:\"AF-NIM\";i:21;s:6:\"AF-ORU\";i:22;s:6:\"AF-PIA\";i:23;s:6:\"AF-PKA\";i:24;s:6:\"AF-PAR\";i:25;s:6:\"AF-SAM\";i:26;s:6:\"AF-SAR\";i:27;s:6:\"AF-TAK\";i:28;s:6:\"AF-WAR\";i:29;s:6:\"AF-ZAB\";i:30;s:5:\"AL-BR\";i:31;s:5:\"AL-BU\";i:32;s:5:\"AL-DL\";i:33;s:5:\"AL-DV\";i:34;s:5:\"AL-DI\";i:35;s:5:\"AL-DR\";i:36;s:5:\"AL-EL\";i:37;s:5:\"AL-FR\";i:38;s:5:\"AL-GR\";i:39;s:5:\"AL-GJ\";i:40;s:5:\"AL-HA\";i:41;s:5:\"AL-KA\";i:42;s:5:\"AL-ER\";i:43;s:5:\"AL-KO\";i:44;s:5:\"AL-KR\";i:45;s:5:\"AL-KC\";i:46;s:5:\"AL-KU\";i:47;s:5:\"AL-LA\";i:48;s:5:\"AL-LE\";i:49;s:5:\"AL-LB\";i:50;s:5:\"AL-LU\";i:51;s:5:\"AL-MM\";i:52;s:5:\"AL-MK\";i:53;s:5:\"AL-MT\";i:54;s:5:\"AL-MR\";i:55;s:5:\"AL-PQ\";i:56;s:5:\"AL-PR\";i:57;s:5:\"AL-PG\";i:58;s:5:\"AL-PU\";i:59;s:5:\"AL-SR\";i:60;s:5:\"AL-SK\";i:61;s:5:\"AL-SH\";i:62;s:5:\"AL-TE\";i:63;s:5:\"AL-TR\";i:64;s:5:\"AL-TP\";i:65;s:5:\"AL-VL\";i:66;s:5:\"DZ-01\";i:67;s:5:\"DZ-44\";i:68;s:5:\"DZ-46\";i:69;s:5:\"DZ-16\";i:70;s:5:\"DZ-05\";i:71;s:5:\"DZ-08\";i:72;s:5:\"DZ-06\";i:73;s:5:\"DZ-07\";i:74;s:5:\"DZ-09\";i:75;s:5:\"DZ-34\";i:76;s:5:\"DZ-10\";i:77;s:5:\"DZ-35\";i:78;s:5:\"DZ-02\";i:79;s:5:\"DZ-25\";i:80;s:5:\"DZ-17\";i:81;s:5:\"DZ-32\";i:82;s:5:\"DZ-39\";i:83;s:5:\"DZ-36\";i:84;s:5:\"DZ-47\";i:85;s:5:\"DZ-24\";i:86;s:5:\"DZ-33\";i:87;s:5:\"DZ-18\";i:88;s:5:\"DZ-40\";i:89;s:5:\"DZ-03\";i:90;s:5:\"DZ-29\";i:91;s:5:\"DZ-26\";i:92;s:5:\"DZ-43\";i:93;s:5:\"DZ-27\";i:94;s:5:\"DZ-28\";i:95;s:5:\"DZ-45\";i:96;s:5:\"DZ-31\";i:97;s:5:\"DZ-30\";i:98;s:5:\"DZ-04\";i:99;s:5:\"DZ-48\";i:100;s:5:\"DZ-20\";i:101;s:5:\"DZ-19\";i:102;s:5:\"DZ-22\";i:103;s:5:\"DZ-21\";i:104;s:5:\"DZ-41\";i:105;s:5:\"DZ-11\";i:106;s:5:\"DZ-12\";i:107;s:5:\"DZ-14\";i:108;s:5:\"DZ-37\";i:109;s:5:\"DZ-42\";i:110;s:5:\"DZ-38\";i:111;s:5:\"DZ-15\";i:112;s:5:\"DZ-13\";i:113;s:5:\"AS-AS\";i:114;s:5:\"AD-AD\";i:115;s:6:\"AO-BGO\";i:116;s:6:\"AO-BGU\";i:117;s:6:\"AO-BIE\";i:118;s:6:\"AO-CAB\";i:119;s:6:\"AO-CCU\";i:120;s:6:\"AO-CNO\";i:121;s:6:\"AO-CUS\";i:122;s:6:\"AO-CNN\";i:123;s:6:\"AO-HUA\";i:124;s:6:\"AO-HUI\";i:125;s:6:\"AO-LUA\";i:126;s:6:\"AO-LNO\";i:127;s:6:\"AO-LSU\";i:128;s:6:\"AO-MAL\";i:129;s:6:\"AO-MOX\";i:130;s:6:\"AO-NAM\";i:131;s:6:\"AO-UIG\";i:132;s:6:\"AO-ZAI\";i:133;s:5:\"AI-AI\";i:134;s:5:\"AQ-AQ\";i:135;s:5:\"AG-AG\";i:136;s:4:\"AR-C\";i:137;s:4:\"AR-B\";i:138;s:4:\"AR-K\";i:139;s:4:\"AR-X\";i:140;s:4:\"AR-W\";i:141;s:4:\"AR-H\";i:142;s:4:\"AR-U\";i:143;s:4:\"AR-E\";i:144;s:4:\"AR-P\";i:145;s:4:\"AR-Y\";i:146;s:4:\"AR-L\";i:147;s:4:\"AR-F\";i:148;s:4:\"AR-M\";i:149;s:4:\"AR-N\";i:150;s:4:\"AR-Q\";i:151;s:4:\"AR-R\";i:152;s:4:\"AR-A\";i:153;s:4:\"AR-J\";i:154;s:4:\"AR-D\";i:155;s:4:\"AR-Z\";i:156;s:4:\"AR-S\";i:157;s:4:\"AR-G\";i:158;s:4:\"AR-V\";i:159;s:4:\"AR-T\";i:160;s:5:\"AM-ER\";i:161;s:5:\"AM-AG\";i:162;s:5:\"AM-AR\";i:163;s:5:\"AM-AV\";i:164;s:5:\"AM-GR\";i:165;s:5:\"AM-KT\";i:166;s:5:\"AM-LO\";i:167;s:5:\"AM-SH\";i:168;s:5:\"AM-SU\";i:169;s:5:\"AM-TV\";i:170;s:5:\"AM-VD\";i:171;s:5:\"AW-AW\";i:172;s:5:\"AU-NS\";i:173;s:5:\"AU-QL\";i:174;s:5:\"AU-SA\";i:175;s:5:\"AU-TS\";i:176;s:5:\"AU-VI\";i:177;s:5:\"AU-WA\";i:178;s:5:\"AU-CT\";i:179;s:5:\"AU-NT\";i:180;s:4:\"AT-1\";i:181;s:4:\"AT-2\";i:182;s:4:\"AT-3\";i:183;s:4:\"AT-4\";i:184;s:4:\"AT-5\";i:185;s:4:\"AT-6\";i:186;s:4:\"AT-7\";i:187;s:4:\"AT-8\";i:188;s:4:\"AT-9\";i:189;s:5:\"AZ-MM\";i:190;s:5:\"AZ-AB\";i:191;s:5:\"AZ-BA\";i:192;s:5:\"AZ-GA\";i:193;s:5:\"AZ-LA\";i:194;s:5:\"AZ-MI\";i:195;s:5:\"AZ-NA\";i:196;s:5:\"AZ-SA\";i:197;s:5:\"AZ-SM\";i:198;s:5:\"AZ-SS\";i:199;s:5:\"AZ-XA\";i:200;s:5:\"AZ-YE\";i:201;s:6:\"AZ-ABS\";i:202;s:6:\"AZ-AGC\";i:203;s:6:\"AZ-AGM\";i:204;s:6:\"AZ-AGS\";i:205;s:6:\"AZ-AGA\";i:206;s:6:\"AZ-AGU\";i:207;s:6:\"AZ-AST\";i:208;s:6:\"AZ-BAB\";i:209;s:6:\"AZ-BAL\";i:210;s:6:\"AZ-BAR\";i:211;s:6:\"AZ-BEY\";i:212;s:6:\"AZ-BIL\";i:213;s:6:\"AZ-CAB\";i:214;s:6:\"AZ-CAL\";i:215;s:6:\"AZ-CUL\";i:216;s:6:\"AZ-DAS\";i:217;s:6:\"AZ-DAV\";i:218;s:6:\"AZ-FUZ\";i:219;s:6:\"AZ-GAD\";i:220;s:6:\"AZ-GOR\";i:221;s:6:\"AZ-GOY\";i:222;s:6:\"AZ-HAC\";i:223;s:6:\"AZ-IMI\";i:224;s:6:\"AZ-ISM\";i:225;s:6:\"AZ-KAL\";i:226;s:6:\"AZ-KUR\";i:227;s:6:\"AZ-LAC\";i:228;s:6:\"AZ-LAN\";i:229;s:6:\"AZ-LER\";i:230;s:6:\"AZ-MAS\";i:231;s:6:\"AZ-NEF\";i:232;s:6:\"AZ-OGU\";i:233;s:6:\"AZ-ORD\";i:234;s:6:\"AZ-QAB\";i:235;s:6:\"AZ-QAX\";i:236;s:6:\"AZ-QAZ\";i:237;s:6:\"AZ-QOB\";i:238;s:6:\"AZ-QBA\";i:239;s:6:\"AZ-QBI\";i:240;s:6:\"AZ-QUS\";i:241;s:6:\"AZ-SAT\";i:242;s:6:\"AZ-SAB\";i:243;s:6:\"AZ-SAD\";i:244;s:6:\"AZ-SAH\";i:245;s:6:\"AZ-SAK\";i:246;s:6:\"AZ-SAL\";i:247;s:6:\"AZ-SMI\";i:248;s:6:\"AZ-SKR\";i:249;s:6:\"AZ-SMX\";i:250;s:6:\"AZ-SAR\";i:251;s:6:\"AZ-SIY\";i:252;s:6:\"AZ-SUS\";i:253;s:6:\"AZ-TAR\";i:254;s:6:\"AZ-TOV\";i:255;s:6:\"AZ-UCA\";i:256;s:6:\"AZ-XAC\";i:257;s:6:\"AZ-XAN\";i:258;s:6:\"AZ-XIZ\";i:259;s:6:\"AZ-XCI\";i:260;s:6:\"AZ-XVD\";i:261;s:6:\"AZ-YAR\";i:262;s:6:\"AZ-YEV\";i:263;s:6:\"AZ-ZAN\";i:264;s:6:\"AZ-ZAQ\";i:265;s:6:\"AZ-ZAR\";i:266;s:5:\"BS-AC\";i:267;s:5:\"BS-BI\";i:268;s:5:\"BS-CI\";i:269;s:5:\"BS-EX\";i:270;s:5:\"BS-FP\";i:271;s:5:\"BS-FC\";i:272;s:5:\"BS-GH\";i:273;s:5:\"BS-GT\";i:274;s:5:\"BS-HI\";i:275;s:5:\"BS-HR\";i:276;s:5:\"BS-IN\";i:277;s:5:\"BS-KB\";i:278;s:5:\"BS-LI\";i:279;s:5:\"BS-MH\";i:280;s:5:\"BS-MG\";i:281;s:5:\"BS-NP\";i:282;s:5:\"BS-NB\";i:283;s:5:\"BS-RI\";i:284;s:5:\"BS-RS\";i:285;s:5:\"BS-SP\";i:286;s:5:\"BS-SR\";i:287;s:5:\"BH-01\";i:288;s:5:\"BH-03\";i:289;s:5:\"BH-10\";i:290;s:5:\"BH-07\";i:291;s:5:\"BH-05\";i:292;s:5:\"BH-02\";i:293;s:5:\"BH-09\";i:294;s:5:\"BH-04\";i:295;s:5:\"BH-12\";i:296;s:5:\"BH-08\";i:297;s:5:\"BH-11\";i:298;s:5:\"BH-06\";i:299;s:4:\"BD-1\";i:300;s:5:\"BD-1B\";i:301;s:5:\"BD-1Q\";i:302;s:4:\"BD-2\";i:303;s:5:\"BD-2A\";i:304;s:5:\"BD-2D\";i:305;s:5:\"BD-2E\";i:306;s:5:\"BD-2F\";i:307;s:5:\"BD-2O\";i:308;s:5:\"BD-2T\";i:309;s:4:\"BD-3\";i:310;s:5:\"BD-3G\";i:311;s:5:\"BD-3I\";i:312;s:5:\"BD-3J\";i:313;s:5:\"BD-3N\";i:314;s:5:\"BD-3U\";i:315;s:4:\"BD-4\";i:316;s:5:\"BD-4K\";i:317;s:5:\"BD-4L\";i:318;s:5:\"BD-4M\";i:319;s:4:\"BD-5\";i:320;s:5:\"BD-5C\";i:321;s:5:\"BD-5H\";i:322;s:5:\"BD-5P\";i:323;s:5:\"BD-5R\";i:324;s:5:\"BD-5S\";i:325;s:5:\"BB-BB\";i:326;s:5:\"BY-BR\";i:327;s:5:\"BY-HO\";i:328;s:5:\"BY-HR\";i:329;s:5:\"BY-MA\";i:330;s:5:\"BY-MI\";i:331;s:5:\"BY-VI\";i:332;s:6:\"BE-BRU\";i:333;s:6:\"BE-VLG\";i:334;s:6:\"BE-VAN\";i:335;s:6:\"BE-VLI\";i:336;s:6:\"BE-VOV\";i:337;s:6:\"BE-VBR\";i:338;s:6:\"BE-VWV\";i:339;s:6:\"BE-WAL\";i:340;s:6:\"BE-WBR\";i:341;s:6:\"BE-WHT\";i:342;s:6:\"BE-WLG\";i:343;s:6:\"BE-WLX\";i:344;s:6:\"BE-WNA\";i:345;s:5:\"BZ-BZ\";i:346;s:5:\"BZ-CY\";i:347;s:6:\"BZ-CZL\";i:348;s:5:\"BZ-OW\";','',NULL,NULL);
/*!40000 ALTER TABLE `tl_iso_shipping_modules` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_shipping_options` WRITE;
/*!40000 ALTER TABLE `tl_iso_shipping_options` DISABLE KEYS */;
INSERT INTO `tl_iso_shipping_options` VALUES (1,1,1274634457,'0-50',NULL,10.00,0.00,50.00,'0','0',''),(2,1,1274634478,'50.01 - 100',NULL,12.00,50.00,100.00,'0','0',''),(3,1,1274634500,'100.01-200',NULL,15.00,100.00,200.00,'0','0',''),(4,1,1274634528,'200.01-99999999999',NULL,20.00,200.00,2147483647.00,'0','0','');
/*!40000 ALTER TABLE `tl_iso_shipping_options` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_tax_class` WRITE;
/*!40000 ALTER TABLE `tl_iso_tax_class` DISABLE KEYS */;
INSERT INTO `tl_iso_tax_class` VALUES (1,1274641913,'Sales Tax','Sales Tax',0,'a:1:{i:0;s:1:\"2\";}','','','');
/*!40000 ALTER TABLE `tl_iso_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `tl_iso_tax_rate` WRITE;
/*!40000 ALTER TABLE `tl_iso_tax_rate` DISABLE KEYS */;
INSERT INTO `tl_iso_tax_rate` VALUES (2,1274642905,'MA State Sales Tax','MA State Sales Tax','us','US-MA','a:2:{s:4:\"unit\";s:1:\"%\";s:5:\"value\";s:4:\"6.25\";}','a:1:{i:0;s:8:\"shipping\";}','a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}','',0,NULL,'','',NULL);
/*!40000 ALTER TABLE `tl_iso_tax_rate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-21 15:00:44
