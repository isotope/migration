<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Test\Scenario;

use Isotope\Migration\Test\ScenarioTestCase;

class ShopConfigTest extends ScenarioTestCase
{

    public function testStoreId1()
    {
        $this->prepareScenario('store_id_1.sql', $this->getDefaultServiceConfigs());

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_page',
            "SELECT id, iso_config, iso_store_id FROM tl_page WHERE type='root' ORDER BY id"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/store_id_1.xml')
                              ->getTable("tl_page");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }

    public function testStoreId2()
    {
        $this->prepareScenario('store_id_2.sql', $this->getDefaultServiceConfigs());

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_page',
            "SELECT id, iso_config, iso_store_id FROM tl_page WHERE type='root' ORDER BY id"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/store_id_2.xml')
                              ->getTable("tl_page");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }
}