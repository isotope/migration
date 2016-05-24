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

use Isotope\Migration\Service\MigrationServiceInterface;
use Isotope\Migration\Service\ProductCollectionMigrationService;
use Isotope\Migration\Test\ScenarioTestCase;
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBag;

class ProductCollectionTest extends ScenarioTestCase
{

    public function testCollectionType()
    {
        $this->prepareScenario('scenario1.sql', $this->getDefaultServiceConfigs());

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
        $this->prepareScenario('scenario1.sql', $this->getDefaultServiceConfigs());

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_product_collection',
            "SELECT id, member, source_collection_id, locked, order_status, subtotal, total, document_number FROM tl_iso_product_collection"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/orders.xml')->getTable("tl_iso_product_collection");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }


    public function testOrderItems()
    {
        $this->prepareScenario('scenario1.sql', $this->getDefaultServiceConfigs());

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_product_collection_item',
            "SELECT id, name, sku, quantity, configuration, type FROM tl_iso_product_collection_item"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/orders.xml')->getTable("tl_iso_product_collection_item");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }


    public function testPrivateAddresses()
    {
        $this->prepareScenario('scenario1.sql', $this->getDefaultServiceConfigs());

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


    public function testMissingAddressField()
    {
        $gotException = false;

        try {
            $this->prepareScenario('missing_address_field.sql', $this->getDefaultServiceConfigs());
        } catch (\RuntimeException $e) {
            $gotException = true;
        }

        $this->assertTrue($gotException, 'Services should not be ready');

        $app = $this->getApp();
        /** @type MigrationServiceInterface $service */
        $service = $app['migration.services']['product_collection'];

        $this->assertEquals(MigrationServiceInterface::STATUS_ERROR, $service->getStatus(), 'Status should be ERROR');
    }


    public function testSurcharges()
    {
        $this->prepareScenario('scenario1.sql', $this->getDefaultServiceConfigs());

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_product_collection_surcharge',
            "SELECT id, pid, sorting, type, label, price, total_price, tax_free_total_price, tax_class, tax_id, before_tax, addToTotal, products FROM tl_iso_product_collection_surcharge"
        );

        $expectedTable = $this->createFlatXmlDataSet($this->getDataPath() . '/orders.xml')->getTable("tl_iso_product_collection_surcharge");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }

    /**
     * @dataProvider emptySurchargesProvider
     */
    public function testEmptySurcharges($scenario, array $config, $expectedStatus)
    {
        $this->loadScenario($scenario);

        $app = $this->getApp();
        $slug = ProductCollectionMigrationService::getSlug();

        $configBag = new AttributeBag('config_' . $slug);
        $configBag->setName('config_' . $slug);
        $configBag->initialize($config['product_collection']);

        /** @type ProductCollectionMigrationService $service */
        $service = $app['class_factory']->create(
            '\Isotope\Migration\Service\ProductCollectionMigrationService',
            array('config' => $configBag)
        );

        $this->assertEquals($expectedStatus, $service->getStatus());
    }

    public function emptySurchargesProvider()
    {
        return array(
            array('scenario1.sql', $this->getDefaultServiceConfigs(), MigrationServiceInterface::STATUS_READY),
            array('scenario1.sql', $this->getDefaultServiceConfigs(false), MigrationServiceInterface::STATUS_CONFIG),
            array('empty_orders.sql', $this->getDefaultServiceConfigs(false), MigrationServiceInterface::STATUS_READY),
            array('empty_surcharges.sql', $this->getDefaultServiceConfigs(false), MigrationServiceInterface::STATUS_READY),
        );
    }


    protected function getDefaultServiceConfigs($includeSurcharges = true)
    {
        $surcharges = array();

        if ($includeSurcharges) {
            $surcharges = array(
                'surcharge_types' => array(
                    'Bezahlung (Vorkasse)' => 'payment',
                    'enthaltene MwSt.' => 'tax',
                    'Weihnachtsaktion' => 'rule',
                )
            );
        }

        return array_merge(
            parent::getDefaultServiceConfigs(),
            array(
                'product_collection' => $surcharges,
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
        );
    }
}
