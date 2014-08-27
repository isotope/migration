<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Test;

abstract class DbTestCase extends SilexAwareTestCase
{
    static private $pdo = null;

    private $conn = null;

    protected function setUp()
    {
        // Empty table
        $pdo = $this->getConnection()->getConnection();
        $stmt = $pdo->prepare('SELECT table_name FROM information_schema.tables WHERE table_schema=:db');
        $stmt->bindParam(':db', $GLOBALS['DB_DBNAME']);

        $stmt->execute();
        $tables = $stmt->fetchAll(\PDO::FETCH_COLUMN);

        foreach ((array) $tables as $table) {
            $pdo->query('DROP TABLE IF EXISTS ' . $table);
        }

        parent::setUp();
    }

    final protected function getConnection()
    {
        if ($this->conn === null) {
            if (self::$pdo == null) {
                self::$pdo = new \PDO(
                    sprintf('mysql:host=%s;port=%s;dbname=%s;',
                        $GLOBALS['DB_HOST'],
                        $GLOBALS['DB_PORT'],
                        $GLOBALS['DB_DBNAME']
                    ),
                    $GLOBALS['DB_USER'],
                    $GLOBALS['DB_PASSWD']);
            }

            $this->conn = $this->createDefaultDBConnection(self::$pdo, $GLOBALS['DB_DBNAME']);
        }

        return $this->conn;
    }

    protected function getDataSet()
    {
        throw new \RuntimeException('getDataSet() has to be implemented by child class!');
    }

    public function getPathToFixture($fixtureFileName)
    {
        return __DIR__ . '/../fixtures/' . $fixtureFileName;
    }
}