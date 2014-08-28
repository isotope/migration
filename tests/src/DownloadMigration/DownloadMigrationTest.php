<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Test\Dbafs;


use Isotope\Migration\Test\DbTestCase;

class DownloadMigrationTest extends DbTestCase
{
    protected function setUp()
    {
        parent::setUp();

        // Insert scenario setup
        $pdo = $this->getConnection()->getConnection();
        $pdo->query(
            file_get_contents($this->getPathToFixture('download_migration/initial.sql'))
        );
    }

    public function testMigration()
    {
        $app = $this->getBootedApp();
        /** @var $service \Isotope\Migration\Service\DownloadMigrationService */
        $service = $app['migration.services']['download'];

        $sql = $service->getMigrationSQL();

        // @todo assert migration queries
    }

    protected function getDataSet()
    {
        return new \PHPUnit_Extensions_Database_DataSet_DefaultDataSet();
    }
}