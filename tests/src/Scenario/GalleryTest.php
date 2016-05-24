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

use Isotope\Migration\Service\GalleryMigrationService;
use Isotope\Migration\Service\MigrationServiceInterface;
use Isotope\Migration\Test\ScenarioTestCase;
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBag;

class GalleryTest extends ScenarioTestCase
{

    public function testGalleries()
    {
        $this->prepareScenario(
            'galleries.sql',
            array_merge(
                $this->getDefaultServiceConfigs(),
                array(
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

    /**
     * @dataProvider configProvider
     *
     * @param array $config
     * @param int   $expectedStatus
     */
    public function testConfigStatus(array $config, $expectedStatus)
    {
        $this->loadScenario('galleries.sql');

        $app = $this->getApp();
        $slug = GalleryMigrationService::getSlug();

        $configBag = new AttributeBag('config_' . $slug);
        $configBag->setName('config_' . $slug);
        $configBag->initialize($config);

        /** @type GalleryMigrationService $service */
        $service = $app['class_factory']->create(
            '\Isotope\Migration\Service\GalleryMigrationService',
            array('config' => $configBag)
        );

        $this->assertEquals($expectedStatus, $service->getStatus());
    }


    public function configProvider()
    {
        return array(
            array(
                array('galleries'=>array()),
                MigrationServiceInterface::STATUS_CONFIG
            ),
            array(
                array(
                    'galleries' => array(
                        array('name' => '')
                    )
                ),
                MigrationServiceInterface::STATUS_CONFIG
            ),
            array(
                array(
                    'galleries' => array(
                        array('name' => 'test')
                    )
                ),
                MigrationServiceInterface::STATUS_CONFIG
            ),
            array(
                array(
                    'galleries' => array(
                        array(
                            'name' => 'test',
                            'main_config' => 1,
                            'gallery_config' => 1
                        )
                    )
                ),
                MigrationServiceInterface::STATUS_CONFIG
            ),
            array(
                array(
                    'galleries' => array(
                        array(
                            'name' => 'test',
                            'main_config' => 1,
                            'gallery_config' => 1
                        )
                    ),
                    'productTypes' => array(
                        1 => array(
                            'list_gallery' => 1,
                            'reader_gallery' => 1
                        ),
                        2 => array(
                            'list_gallery' => 1,
                            'reader_gallery' => 1
                        )
                    )
                ),
                MigrationServiceInterface::STATUS_READY
            ),
        );
    }
}