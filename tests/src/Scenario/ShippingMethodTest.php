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

class ShippingMethodTest extends ScenarioTestCase
{

    public function testFlatShipping()
    {
        $this->prepareScenario('scenario1.sql', $this->getDefaultServiceConfigs());

        $this->assertEquals(1, $this->getConnection()->getRowCount('tl_iso_shipping'));
    }


    public function testOrderTotalShipping()
    {
        $this->prepareScenario('scenario2.sql', $this->getDefaultServiceConfigs());

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_shipping',
            "SELECT id, name, type, label, minimum_total, maximum_total, price, enabled, group_methods, group_calculation FROM tl_iso_shipping"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/order_total.xml')
                              ->getTable("tl_iso_shipping");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }
}