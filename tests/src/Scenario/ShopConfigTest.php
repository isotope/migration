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

    public function testGalleries()
    {
        $this->prepareScenario(
            'galleries.sql',
            array_merge(
                $this->getDefaultServiceConfigs(),
                array(
                    'shop_config' => array(
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

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_gallery',
            "SELECT
                id,
                name,
                type,
                anchor,
                placeholder,
                main_size,
                gallery_size,
                lightbox_size,
                main_watermark_image,
                main_watermark_position,
                gallery_watermark_image,
                gallery_watermark_position,
                lightbox_watermark_image,
                lightbox_watermark_position
            FROM tl_iso_gallery
            ORDER BY id"
        );

        $expectedTable = $this->createXmlDataSet($this->getDataPath() . '/galleries.xml')
                              ->getTable("tl_iso_gallery");

        $this->assertTablesEqual($expectedTable, $queryTable);

        $queryTable = $this->getConnection()->createQueryTable(
            'tl_iso_producttype',
            "SELECT id, list_gallery, reader_gallery FROM tl_iso_producttype ORDER BY id"
        );

        $expectedTable = $this->createXmlDataSet($this->getDataPath() . '/galleries.xml')
                              ->getTable("tl_iso_producttype");

        $this->assertTablesEqual($expectedTable, $queryTable);
    }
}