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

    final public function getConnection()
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

    public function getDataSet()
    {
        return new \PHPUnit_Extensions_Database_DataSet_DefaultDataSet();
    }

    public function getPathToFixture($fixtureFileName)
    {
        return __DIR__ . '/../fixtures/' . $fixtureFileName;
    }
}