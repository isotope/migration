<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

ini_set('error_reporting', E_ALL);
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');

$autoload = __DIR__ . '/../vendor/autoload.php';
if (!file_exists($autoload)) {
    throw new RuntimeException('Install dependencies to run test suite.');
}

include $autoload;