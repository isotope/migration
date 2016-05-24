#
# SQL Export
# Created by Querious (931)
# Created: 11. September 2014 17:33:20 MESZ
# Encoding: Unicode (UTF-8)
#


DROP TABLE IF EXISTS `tl_files`;
DROP TABLE IF EXISTS `tl_version`;
DROP TABLE IF EXISTS `tl_user_group`;
DROP TABLE IF EXISTS `tl_user`;
DROP TABLE IF EXISTS `tl_page`;
DROP TABLE IF EXISTS `tl_module`;
DROP TABLE IF EXISTS `tl_iso_tax_rate`;
DROP TABLE IF EXISTS `tl_iso_tax_class`;
DROP TABLE IF EXISTS `tl_iso_shipping_options`;
DROP TABLE IF EXISTS `tl_iso_shipping_modules`;
DROP TABLE IF EXISTS `tl_iso_rules`;
DROP TABLE IF EXISTS `tl_iso_rule_usage`;
DROP TABLE IF EXISTS `tl_iso_rule_restrictions`;
DROP TABLE IF EXISTS `tl_iso_requestcache`;
DROP TABLE IF EXISTS `tl_iso_related_products`;
DROP TABLE IF EXISTS `tl_iso_related_categories`;
DROP TABLE IF EXISTS `tl_iso_producttypes`;
DROP TABLE IF EXISTS `tl_iso_products`;
DROP TABLE IF EXISTS `tl_iso_productcache`;
DROP TABLE IF EXISTS `tl_iso_product_categories`;
DROP TABLE IF EXISTS `tl_iso_prices`;
DROP TABLE IF EXISTS `tl_iso_price_tiers`;
DROP TABLE IF EXISTS `tl_iso_payment_modules`;
DROP TABLE IF EXISTS `tl_iso_orderstatus`;
DROP TABLE IF EXISTS `tl_iso_orders`;
DROP TABLE IF EXISTS `tl_iso_order_items`;
DROP TABLE IF EXISTS `tl_iso_order_downloads`;
DROP TABLE IF EXISTS `tl_iso_mail_content`;
DROP TABLE IF EXISTS `tl_iso_mail`;
DROP TABLE IF EXISTS `tl_iso_labels`;
DROP TABLE IF EXISTS `tl_iso_groups`;
DROP TABLE IF EXISTS `tl_iso_downloads`;
DROP TABLE IF EXISTS `tl_iso_config`;
DROP TABLE IF EXISTS `tl_iso_cart_items`;
DROP TABLE IF EXISTS `tl_iso_cart`;
DROP TABLE IF EXISTS `tl_iso_baseprice`;
DROP TABLE IF EXISTS `tl_iso_attributes`;
DROP TABLE IF EXISTS `tl_iso_addresses`;


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


CREATE TABLE `tl_iso_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(2) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `salutation` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `street_1` varchar(255) NOT NULL DEFAULT '',
  `street_2` varchar(255) NOT NULL DEFAULT '',
  `street_3` varchar(255) NOT NULL DEFAULT '',
  `postal` varchar(32) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `subdivision` varchar(10) NOT NULL DEFAULT '',
  `country` varchar(32) NOT NULL DEFAULT '',
  `phone` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `isDefaultShipping` char(1) NOT NULL DEFAULT '',
  `isDefaultBilling` char(1) NOT NULL DEFAULT '',
  `vat_no` varchar(255) NOT NULL DEFAULT '',
  `vat_no_ok` varchar(16) NOT NULL DEFAULT 'nok',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `field_name` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `legend` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `options` blob,
  `customer_defined` char(1) NOT NULL DEFAULT '',
  `mandatory` char(1) NOT NULL DEFAULT '',
  `fe_filter` char(1) NOT NULL DEFAULT '',
  `fe_search` char(1) NOT NULL DEFAULT '',
  `fe_sorting` char(1) NOT NULL DEFAULT '',
  `multiple` char(1) NOT NULL DEFAULT '',
  `size` smallint(5) unsigned NOT NULL DEFAULT '0',
  `extensions` varchar(255) NOT NULL DEFAULT '',
  `be_filter` char(1) NOT NULL DEFAULT '',
  `be_search` char(1) NOT NULL DEFAULT '',
  `multilingual` char(1) NOT NULL DEFAULT '',
  `variant_option` char(1) NOT NULL DEFAULT '',
  `invisible` char(1) NOT NULL DEFAULT '',
  `foreignKey` text,
  `rte` varchar(255) NOT NULL DEFAULT '',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `rgxp` varchar(255) NOT NULL DEFAULT '',
  `conditionField` varchar(30) NOT NULL DEFAULT '',
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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_baseprice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `amount` varchar(32) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `session` varchar(64) NOT NULL DEFAULT '',
  `store_id` int(2) unsigned NOT NULL DEFAULT '0',
  `settings` blob,
  `coupons` blob,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`store_id`),
  KEY `session` (`session`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_sku` varchar(128) NOT NULL DEFAULT '',
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_options` blob,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `href_reader` varchar(255) NOT NULL DEFAULT '',
  `tax_free_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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


CREATE TABLE `tl_iso_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `product_type` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_labels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(2) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


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


CREATE TABLE `tl_iso_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_sku` varchar(128) NOT NULL DEFAULT '',
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_options` blob,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `tax_free_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_orders` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `pid` int(10) unsigned NOT NULL DEFAULT '0',
    `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
    `settings` blob,
    `date` int(10) unsigned NOT NULL DEFAULT '0',
    `date_paid` varchar(10) NOT NULL DEFAULT '',
    `date_shipped` varchar(10) NOT NULL DEFAULT '',
    `status` int(10) unsigned NOT NULL DEFAULT '0',
    `order_id` varchar(14) NOT NULL DEFAULT '',
    `uniqid` varchar(27) NOT NULL DEFAULT '',
    `config_id` int(10) unsigned NOT NULL DEFAULT '0',
    `cart_id` int(10) unsigned NOT NULL DEFAULT '0',
    `payment_id` int(10) unsigned NOT NULL DEFAULT '0',
    `shipping_id` int(10) unsigned NOT NULL DEFAULT '0',
    `language` varchar(2) NOT NULL DEFAULT '',
    `shipping_address` blob,
    `billing_address` blob,
    `checkout_info` blob,
    `surcharges` blob,
    `coupons` blob,
    `payment_data` blob,
    `shipping_data` blob,
    `subTotal` decimal(12,2) NOT NULL DEFAULT '0.00',
    `grandTotal` decimal(12,2) NOT NULL DEFAULT '0.00',
    `cc_num` varchar(64) NOT NULL DEFAULT '',
    `cc_type` varchar(32) NOT NULL DEFAULT '',
    `cc_exp` varchar(16) NOT NULL DEFAULT '',
    `cc_cvv` varchar(8) NOT NULL DEFAULT '',
    `currency` varchar(4) NOT NULL DEFAULT '',
    `notes` text,
    PRIMARY KEY (`id`),
    KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_payment_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `note` text,
  `price` varchar(16) NOT NULL DEFAULT '',
  `tax_class` int(10) NOT NULL DEFAULT '0',
  `countries` blob,
  `shipping_modules` blob,
  `product_types` blob,
  `allowed_cc_types` text,
  `minimum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `maximum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `new_order_status` int(10) unsigned NOT NULL DEFAULT '0',
  `trans_type` varchar(8) NOT NULL DEFAULT '',
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
  `requireCCV` char(1) NOT NULL DEFAULT '',
  `button` varchar(255) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  `debug` char(1) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_price_tiers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `min` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `page_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_productcache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL DEFAULT '0',
  `module_id` int(10) unsigned NOT NULL DEFAULT '0',
  `requestcache_id` int(10) unsigned NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `products` blob,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`module_id`,`requestcache_id`,`keywords`,`expires`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


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


CREATE TABLE `tl_iso_related_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_related_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `category` int(10) unsigned NOT NULL DEFAULT '0',
  `products` blob,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_requestcache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `filters` blob,
  `sorting` blob,
  `limits` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_rule_restrictions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`),
  KEY `type` (`type`,`object_id`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
  `tax_class` int(10) NOT NULL DEFAULT '0',
  `enableCode` char(1) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `minItemQuantity` int(10) unsigned NOT NULL DEFAULT '0',
  `maxItemQuantity` int(10) unsigned NOT NULL DEFAULT '0',
  `quantityMode` varchar(32) NOT NULL DEFAULT '',
  `limitPerMember` int(10) unsigned NOT NULL DEFAULT '0',
  `limitPerConfig` int(10) unsigned NOT NULL DEFAULT '0',
  `startDate` varchar(10) NOT NULL DEFAULT '',
  `endDate` varchar(10) NOT NULL DEFAULT '',
  `startTime` varchar(10) NOT NULL DEFAULT '',
  `endTime` varchar(10) NOT NULL DEFAULT '',
  `configRestrictions` char(1) NOT NULL DEFAULT '',
  `configCondition` char(1) NOT NULL DEFAULT '',
  `memberRestrictions` varchar(32) NOT NULL DEFAULT '',
  `memberCondition` char(1) NOT NULL DEFAULT '',
  `productRestrictions` varchar(32) NOT NULL DEFAULT '',
  `productCondition` char(1) NOT NULL DEFAULT '',
  `attributeName` varchar(32) NOT NULL DEFAULT '',
  `attributeCondition` varchar(8) NOT NULL DEFAULT '',
  `attributeValue` varchar(255) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT '',
  `minSubtotal` int(10) unsigned NOT NULL DEFAULT '0',
  `maxSubtotal` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_shipping_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `note` text,
  `tax_class` int(10) NOT NULL DEFAULT '0',
  `countries` blob,
  `subdivisions` longblob,
  `postalCodes` text,
  `minimum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `maximum_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `product_types` blob,
  `price` varchar(16) NOT NULL DEFAULT '',
  `surcharge_field` varchar(255) NOT NULL DEFAULT '',
  `flatCalculation` varchar(10) NOT NULL DEFAULT '',
  `weight_unit` varchar(5) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_tax_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `applyRoundingIncrement` char(1) NOT NULL DEFAULT '',
  `includes` int(10) unsigned NOT NULL DEFAULT '0',
  `rates` blob,
  `notNegative` char(1) NOT NULL DEFAULT '',
  `germanize_price` varchar(5) NOT NULL DEFAULT '',
  `germanize_rate` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


CREATE TABLE `tl_iso_tax_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `postalCodes` text,
  `config` int(10) unsigned NOT NULL DEFAULT '0',
  `rate` varchar(255) NOT NULL DEFAULT '',
  `address` blob,
  `amount` varchar(255) NOT NULL DEFAULT '',
  `stop` char(1) NOT NULL DEFAULT '',
  `countries` text,
  `subdivisions` text,
  `guests` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


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


CREATE TABLE `tl_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varbinary(128) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `pageTitle` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(2) NOT NULL DEFAULT '',
  `robots` varchar(32) NOT NULL DEFAULT '',
  `description` text,
  `redirect` varchar(32) NOT NULL DEFAULT '',
  `jumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `target` char(1) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `dns` varchar(255) NOT NULL DEFAULT '',
  `adminEmail` varchar(255) NOT NULL DEFAULT '',
  `dateFormat` varchar(32) NOT NULL DEFAULT '',
  `timeFormat` varchar(32) NOT NULL DEFAULT '',
  `datimFormat` varchar(32) NOT NULL DEFAULT '',
  `createSitemap` char(1) NOT NULL DEFAULT '',
  `sitemapName` varchar(32) NOT NULL DEFAULT '',
  `autoforward` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  `includeLayout` char(1) NOT NULL DEFAULT '',
  `layout` int(10) unsigned NOT NULL DEFAULT '0',
  `includeCache` char(1) NOT NULL DEFAULT '',
  `cache` int(10) unsigned NOT NULL DEFAULT '0',
  `includeChmod` char(1) NOT NULL DEFAULT '',
  `cuser` int(10) unsigned NOT NULL DEFAULT '0',
  `cgroup` int(10) unsigned NOT NULL DEFAULT '0',
  `chmod` varchar(255) NOT NULL DEFAULT '',
  `noSearch` char(1) NOT NULL DEFAULT '',
  `cssClass` varchar(64) NOT NULL DEFAULT '',
  `sitemap` varchar(32) NOT NULL DEFAULT '',
  `hide` char(1) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `tabindex` smallint(5) unsigned NOT NULL DEFAULT '0',
  `accesskey` char(1) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `staticFiles` varchar(255) NOT NULL DEFAULT '',
  `staticSystem` varchar(255) NOT NULL DEFAULT '',
  `staticPlugins` varchar(255) NOT NULL DEFAULT '',
  `useSSL` char(1) NOT NULL DEFAULT '',
  `piwikEnabled` char(1) NOT NULL DEFAULT '',
  `piwikPath` varchar(255) NOT NULL DEFAULT '',
  `piwikSiteID` varchar(4) NOT NULL DEFAULT '',
  `piwikUserToken` varchar(32) NOT NULL DEFAULT '',
  `piwikCountAdmins` char(1) NOT NULL DEFAULT '0',
  `piwikCountUsers` char(1) NOT NULL DEFAULT '1',
  `piwikPageName` char(1) NOT NULL DEFAULT '0',
  `piwik404` char(1) NOT NULL DEFAULT '0',
  `piwikExtensions` text,
  `piwikVisitorCookieTimeout` int(10) unsigned NOT NULL DEFAULT '0',
  `piwikDownloadClasses` varchar(255) NOT NULL DEFAULT '',
  `iso_config` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_setReaderJumpTo` char(1) NOT NULL DEFAULT '',
  `iso_readerJumpTo` int(10) unsigned NOT NULL DEFAULT '0',
  `auto_activate_registration` char(1) NOT NULL DEFAULT '',
  `auto_activate_where` varchar(255) NOT NULL DEFAULT '',
  `auto_login_registration` char(1) NOT NULL DEFAULT '',
  `auto_login_activation` char(1) NOT NULL DEFAULT '',
  `piwikTemplate` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `alias` (`alias`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(2) NOT NULL DEFAULT '',
  `backendTheme` varchar(32) NOT NULL DEFAULT '',
  `showHelp` char(1) NOT NULL DEFAULT '',
  `thumbnails` char(1) NOT NULL DEFAULT '',
  `useRTE` char(1) NOT NULL DEFAULT '',
  `useCE` char(1) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `admin` char(1) NOT NULL DEFAULT '',
  `groups` blob,
  `inherit` varchar(32) NOT NULL DEFAULT '',
  `modules` blob,
  `themes` blob,
  `pagemounts` blob,
  `alpty` blob,
  `filemounts` blob,
  `fop` blob,
  `forms` blob,
  `formp` blob,
  `disable` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `loginCount` smallint(5) unsigned NOT NULL DEFAULT '3',
  `locked` int(10) unsigned NOT NULL DEFAULT '0',
  `session` blob,
  `dateAdded` int(10) unsigned NOT NULL DEFAULT '0',
  `currentLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `lastLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `calendars` blob,
  `calendarp` blob,
  `news` blob,
  `newp` blob,
  `newsletters` blob,
  `newsletterp` blob,
  `uploader` varchar(32) NOT NULL DEFAULT '',
  `pwChange` char(1) NOT NULL DEFAULT '',
  `faqs` blob,
  `faqp` blob,
  `iso_modules` blob,
  `iso_product_types` blob,
  `iso_product_typep` blob,
  `iso_payment_modules` blob,
  `iso_payment_modulep` blob,
  `iso_shipping_modules` blob,
  `iso_shipping_modulep` blob,
  `iso_tax_classes` blob,
  `iso_tax_classp` blob,
  `iso_tax_rates` blob,
  `iso_tax_ratep` blob,
  `iso_mails` blob,
  `iso_mailp` blob,
  `iso_configs` blob,
  `iso_configp` blob,
  `iso_groups` blob,
  `iso_groupp` blob,
  `translation` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tl_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `modules` blob,
  `themes` blob,
  `pagemounts` blob,
  `alpty` blob,
  `filemounts` blob,
  `fop` blob,
  `forms` blob,
  `formp` blob,
  `alexf` blob,
  `disable` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `calendars` blob,
  `calendarp` blob,
  `news` blob,
  `newp` blob,
  `newsletters` blob,
  `newsletterp` blob,
  `faqs` blob,
  `faqp` blob,
  `iso_modules` blob,
  `iso_product_types` blob,
  `iso_product_typep` blob,
  `iso_payment_modules` blob,
  `iso_payment_modulep` blob,
  `iso_shipping_modules` blob,
  `iso_shipping_modulep` blob,
  `iso_tax_classes` blob,
  `iso_tax_classp` blob,
  `iso_tax_rates` blob,
  `iso_tax_ratep` blob,
  `iso_mails` blob,
  `iso_mailp` blob,
  `iso_configs` blob,
  `iso_configp` blob,
  `iso_groups` blob,
  `iso_groupp` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `tl_iso_config` VALUES
    (1,1291657980,'Default','Default Store','','1','mul',2,'0.01','USD','1','left','10,000.00','','','1','Isotope','Demo','','','01027','Easthampton','Isotope','us',NULL,NULL,NULL,NULL,'123-456-7890','demo@isotopeecommerce.com','1 Isotope Lane','US-MA',1,'default',0x613A343A7B693A303B613A363A7B733A343A226E616D65223B733A373A2267616C6C657279223B733A353A227769647468223B733A323A223530223B733A363A22686569676874223B733A323A223530223B733A343A226D6F6465223B733A343A2263726F70223B733A393A2277617465726D61726B223B733A303A22223B733A383A22706F736974696F6E223B733A323A22746C223B7D693A313B613A363A7B733A343A226E616D65223B733A393A227468756D626E61696C223B733A353A227769647468223B733A333A22313030223B733A363A22686569676874223B733A333A22313030223B733A343A226D6F6465223B733A333A22626F78223B733A393A2277617465726D61726B223B733A303A22223B733A383A22706F736974696F6E223B733A323A22746C223B7D693A323B613A363A7B733A343A226E616D65223B733A363A226D656469756D223B733A353A227769647468223B733A333A22323030223B733A363A22686569676874223B733A333A22323030223B733A343A226D6F6465223B733A333A22626F78223B733A393A2277617465726D61726B223B733A303A22223B733A383A22706F736974696F6E223B733A323A22746C223B7D693A333B613A363A7B733A343A226E616D65223B733A353A226C61726765223B733A353A227769647468223B733A333A22383030223B733A363A22686569676874223B733A333A22383030223B733A343A226D6F6465223B733A333A22626F78223B733A393A2277617465726D61726B223B733A303A22223B733A383A22706F736974696F6E223B733A323A22746C223B7D7D,0.00,'','','','',4,'','',0,0,'us','us','');

INSERT INTO `tl_iso_orders` VALUES
    (1, 1, 1368454510, '', 1368454510, '1368454510', '1368454510', 3, '20130001', '201351d5852e535802.64006316', 3, 27, 2, 1, 'de', 'a:9:{s:10:"salutation";s:0:"";s:9:"firstname";s:3:"Max";s:8:"lastname";s:6:"Muster";s:7:"company";s:11:"Musterfirma";s:8:"street_1";s:15:"Musterstrasse 1";s:6:"postal";s:5:"00000";s:4:"city";s:12:"Musterhausen";s:7:"country";s:2:"de";s:2:"id";i:-1;}', 'a:9:{s:10:"salutation";s:0:"";s:9:"firstname";s:3:"Max";s:8:"lastname";s:6:"Muster";s:7:"company";s:11:"Musterfirma";s:8:"street_1";s:15:"Musterstrasse 1";s:6:"postal";s:5:"00000";s:4:"city";s:12:"Musterhausen";s:7:"country";s:2:"de";s:2:"id";i:0;}', '', NULL, NULL, NULL, NULL, 27.00, 26.19, '', '', '', '', 'EUR', ''),
    (2, 2, 1368454510, '', 1368454510, '1368454510', '1368454510', 3, '20130002', '201351d5852e535802.64006316', 1, 30, 2, 1, 'de', 'a:9:{s:10:"salutation";s:0:"";s:9:"firstname";s:3:"Max";s:8:"lastname";s:6:"Muster";s:7:"company";s:11:"Musterfirma";s:8:"street_1";s:15:"Musterstrasse 1";s:6:"postal";s:5:"00000";s:4:"city";s:12:"Musterhausen";s:7:"country";s:2:"de";s:2:"id";i:0;}', 'a:9:{s:10:"salutation";s:0:"";s:9:"firstname";s:3:"Max";s:8:"lastname";s:6:"Muster";s:7:"company";s:11:"Musterfirma";s:8:"street_1";s:15:"Musterstrasse 1";s:6:"postal";s:5:"00000";s:4:"city";s:12:"Musterhausen";s:7:"country";s:2:"de";s:2:"id";i:0;}', '', NULL, NULL, NULL, NULL, 27.00, 26.19, '', '', '', '', 'EUR', '');

INSERT INTO `tl_iso_order_items` VALUES
    (1, 1, 1368454510, 1, 'the-standout', 'The Standout 0', 'xxx', 1, 24.95, '', 24.95),
    (2, 1, 1368454510, 2, 'the-standout-1', 'The Standout 1', 'xxx', 2, 24.95, '', 24.95),
    (3, 1, 1368454510, 3, 'the-standout-2', 'The Standout 2', 'xxx', 3, 24.95, '', 24.95),
    (4, 1, 1368454510, 4, 'the-standout-3', 'The Standout 3', 'xxx', 4, 24.95, '', 24.95),
    (5, 2, 1368454510, 5, 'the-standout-4', 'The Standout 4', 'xxx', 1, 24.95, '', 24.95),
    (6, 2, 1368454510, 6, 'the-standout-5', 'The Standout 5', 'xxx', 2, 24.95, '', 24.95),
    (7, 2, 1368454510, 7, 'the-standout-6', 'The Standout 6', 'xxx', 3, 24.95, '', 24.95);

INSERT INTO `tl_iso_products` VALUES
    (1,0,1274642006,1,0x613A323A7B693A303B733A333A22323432223B693A313B733A333A22323733223B7D,'the-standout','the-standout','The Standout 0',NULL,NULL,'<p>These are some very beautiful shoes. The detail on them is striking, along with extra support that make them good for[nbsp]running[nbsp]long distances.</p>',24.95,'',1,'1','','','',0x613A353A7B733A353A22426C61636B223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A22426C7565223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A2242726F776E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A353A22477265656E223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22526564223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,0x613A31353A7B693A373B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22372E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A383B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22382E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A393B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A333A22392E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31303B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231302E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31313B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231312E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31323B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D733A343A2231322E35223B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31333B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31343B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D693A31353B613A323A7B733A373A22696E6865726974223B733A313A2231223B733A353A226C6162656C223B733A303A22223B7D7D,NULL,NULL,NULL,'',1274642006,4,'','',NULL,'',''),
    (2,0,1274316218,2,NULL,'the-standout-1','the-standout-1','The Standout 1',NULL,NULL,NULL,24.95,'',0,'1','','','',NULL,NULL,NULL,'',1274316218,0,'','',NULL,'',''),
    (3,0,1274316218,1,NULL,'the-standout-2','the-standout-2','The Standout 2',NULL,NULL,NULL,24.95,'',0,'1','','','',NULL,NULL,NULL,'',1274316218,0,'','',NULL,'',''),
    (4,0,1274316218,3,NULL,'the-standout-3','the-standout-3','The Standout 3',NULL,NULL,NULL,24.95,'',0,'1','','','',NULL,NULL,NULL,'',1274316218,0,'','',NULL,'',''),
    (5,0,1274316218,1,NULL,'the-standout-4','the-standout-4','The Standout 4',NULL,NULL,NULL,24.95,'',0,'1','','','',NULL,NULL,NULL,'',1274316218,0,'','',NULL,'',''),
    (6,0,1274316218,2,NULL,'the-standout-5','the-standout-5','The Standout 5',NULL,NULL,NULL,24.95,'',0,'1','','','',NULL,NULL,NULL,'',1274316218,0,'','',NULL,'','');


INSERT INTO `tl_iso_producttypes` VALUES
    (1,1287955253,'Shoes',NULL,0x613A31393A7B733A353A22636F6C6F72223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A303B7D733A343A2273697A65223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A313B7D733A343A2274797065223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A323B7D733A353A227061676573223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A333B7D733A353A22616C696173223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A343B7D733A333A22736B75223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A353B7D733A343A226E616D65223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A363B7D733A363A22746561736572223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A373B7D733A31313A226465736372697074696F6E223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A383B7D733A31363A226465736372697074696F6E5F6D657461223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A393B7D733A31333A226B6579776F7264735F6D657461223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31303B7D733A353A227072696365223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31313B7D733A31343A2270726963655F6F76657272696465223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31323B7D733A393A227461785F636C617373223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31333B7D733A31353A227368697070696E675F6578656D7074223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31343B7D733A363A22696D61676573223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31353B7D733A393A227075626C6973686564223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31363B7D733A353A227374617274223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31373B7D733A343A2273746F70223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A31383B7D7D,'',0x613A373A7B733A333A22736B75223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A303B7D733A343A226E616D65223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A313B7D733A353A227072696365223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A323B7D733A31343A2270726963655F6F76657272696465223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A333B7D733A393A227075626C6973686564223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A343B7D733A353A227374617274223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A353B7D733A343A2273746F70223B613A323A7B733A373A22656E61626C6564223B733A313A2231223B733A383A22706F736974696F6E223B693A363B7D7D,'regular','iso_list_default','iso_reader_default','0','','','','',''),
    (2,1409761225,'Download','',0x613A31333A7B733A353A22616C696173223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A323B7D733A31313A226465736372697074696F6E223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A363B7D733A363A22696D61676573223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A393B7D733A343A226E616D65223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A343B7D733A353A227061676573223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A313B7D733A353A227072696365223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A373B7D733A393A227075626C6973686564223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A31303B7D733A333A22736B75223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A333B7D733A353A227374617274223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A31313B7D733A343A2273746F70223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A31323B7D733A393A227461785F636C617373223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A383B7D733A363A22746561736572223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A353B7D733A343A2274797065223B613A353A7B733A373A22656E61626C6564223B733A313A2231223B733A31353A22746C5F636C6173735F73656C656374223B733A303A22223B733A31333A22746C5F636C6173735F74657874223B733A303A22223B733A393A226D616E6461746F7279223B733A313A2230223B733A383A22706F736974696F6E223B693A303B7D7D,'1',NULL,'dimension','iso_list_default','iso_reader_default','','','','','','');
