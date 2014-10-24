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

class ProductCollectionTest extends ScenarioTestCase
{

    protected function setUp()
    {
        parent::setUp();

        $this->prepareScenario('scenario1.sql', $this->getDefaultServiceConfigs());
    }

    public function testCollectionType()
    {
        $this->assertEquals(
            array(
                array(
                    'type' => 'order',
                    0 => 'order'
                )
            ),
            $this
                ->getConnection()
                ->getConnection()
                ->query("SELECT DISTINCT type FROM tl_iso_product_collection")
                ->fetchAll()
        );
    }


    public function testPrivateAddresses()
    {
        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_address',
            "SELECT id, ptable, pid, store_id, salutation, company, firstname, lastname, street_1, street_2, street_3, postal, city, subdivision, country, phone, email, isDefaultShipping, isDefaultBilling FROM tl_iso_address"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/privateaddresses.xml')->getTable("tl_iso_address");

        $this->assertTablesEqual($expectedTable, $queryTable);


        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_product_collection',
            "SELECT id, billing_address_id, shipping_address_id FROM tl_iso_product_collection"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/privateaddresses.xml')->getTable("tl_iso_product_collection");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }
}
