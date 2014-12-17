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

        $this->prepareScenario(
            'scenario1.sql',
            array_merge(
                $this->getDefaultServiceConfigs(),
                array(
                    'product_collection' => array(
                        'surcharge_types' => array(
                            'Bezahlung (Vorkasse)' => 'payment',
                            'enthaltene MwSt.' => 'tax',
                            'Weihnachtsaktion' => 'rule',
                        )
                    ),
                    'gallery' => array(
                        'galleries' => array(
                            array(
                                'name'            => 'List',
                                'main_config'     => '1-thumbnail',
                                'gallery_config'  => '1-thumbnail',
                                'lightbox_config' => '',
                            ),
                            array(
                                'name'            => 'Reader',
                                'main_config'     => '1-medium',
                                'gallery_config'  => '1-gallery',
                                'lightbox_config' => '1-large',
                            )
                        ),
                        'productTypes' => array(
                            1 => array(
                                'list_gallery'   => '0',
                                'reader_gallery' => '1',
                            ),
                            2 => array(
                                'list_gallery'   => '0',
                                'reader_gallery' => '1',
                            )
                        )
                    )
                )
            )
        );
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


    public function testOrders()
    {
        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_product_collection',
            "SELECT id, member, source_collection_id, locked, order_status, subtotal, total, document_number FROM tl_iso_product_collection"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/orders.xml')->getTable("tl_iso_product_collection");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }


    public function testOrderItems()
    {
        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_product_collection_item',
            "SELECT id, name, sku, quantity, configuration, type FROM tl_iso_product_collection_item"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/orders.xml')->getTable("tl_iso_product_collection_item");

        $this->assertTablesEqual($expectedTable, $queryTable);
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


    public function testSurcharges()
    {
        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_product_collection_surcharge',
            "SELECT id, pid, sorting, type, label, price, total_price, tax_free_total_price, tax_class, tax_id, before_tax, addToTotal, products FROM tl_iso_product_collection_surcharge"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/orders.xml')->getTable("tl_iso_product_collection_surcharge");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }
}
