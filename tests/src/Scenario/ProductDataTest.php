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

class ProductDataTest extends ScenarioTestCase
{

    public function testPrices()
    {
        $this->prepareScenario('scenario1.sql', $this->getDefaultServiceConfigs());

        $this->assertEquals(10, $this->getConnection()->getRowCount('tl_iso_product_price'));

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_product_price',
            "SELECT pid, tax_class, config_id, member_group, start, stop FROM tl_iso_product_price"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/scenario1.xml')
                              ->getTable("tl_iso_product_price");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }


    public function testPriceTiers()
    {
        $this->prepareScenario('scenario1.sql', $this->getDefaultServiceConfigs());

        $this->assertEquals(10, $this->getConnection()->getRowCount('tl_iso_product_pricetier'));

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_product_pricetier',
            "SELECT pid, min, price FROM tl_iso_product_pricetier"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/scenario1.xml')
                              ->getTable("tl_iso_product_pricetier");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }
}
