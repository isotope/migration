<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

$autoload = __DIR__ . '/../vendor/autoload.php';
if (!file_exists($autoload)) {
    throw new RuntimeException('Install dependencies to run test suite.');
}

include $autoload;

try {
    $pdo = new \PDO(
        sprintf('mysql:host=%s;port=%s;dbname=%s;',
            $GLOBALS['DB_HOST'],
            $GLOBALS['DB_PORT'],
            $GLOBALS['DB_DBNAME']
        ),
        $GLOBALS['DB_USER'],
        $GLOBALS['DB_PASSWD']);
} catch (\PDOException $e) {
    echo 'Could not connect to your configured database settings! Error: ' . $e->getMessage();
    exit;
}