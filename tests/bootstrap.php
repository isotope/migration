<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

include __DIR__ .'/../vendor/autoload.php';

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

// Delete all tables if there are any (because there could be new ones not being touched
// by initial.sql
$stmt = $pdo->prepare('SELECT table_name FROM information_schema.tables WHERE table_schema=:db');
$stmt->bindParam(':db', $GLOBALS['DB_DBNAME']);

$stmt->execute();
$tables = $stmt->fetchAll(\PDO::FETCH_COLUMN);

foreach ((array) $tables as $table) {
    $pdo->query('DROP TABLE IF EXISTS ' . $table);
}

// Create database
$pdo->query(file_get_contents(__DIR__ . '/fixtures/initial.sql'));