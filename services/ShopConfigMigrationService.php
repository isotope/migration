<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Service;


use Doctrine\DBAL\Schema\Column;
use Doctrine\DBAL\Schema\Schema;
use Doctrine\DBAL\Schema\SchemaConfig;
use Doctrine\DBAL\Schema\TableDiff;
use Doctrine\DBAL\Types\Type;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;

class ShopConfigMigrationService extends AbstractMigrationService
{

    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Shop Configuration');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates shop configuration.');
    }

    /**
     * Returns status code of the migration step
     *
     * @return int
     */
    public function getStatus()
    {
        try {
            $this->verifyDatabase();
        } catch (\RuntimeException $e) {
            return MigrationServiceInterface::STATUS_ERROR;
        }

        // Nothing to do
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_config") === '0'
            || $this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_producttypes") === '0'
        ) {
            return MigrationServiceInterface::STATUS_READY;
        }

        try {
            $this->verifyGalleryConfig($this->config->get('galleries'));
            $this->verifyProductTypeConfig($this->config->get('productTypes'));
        } catch (\RuntimeException $e) {
            return MigrationServiceInterface::STATUS_CONFIG;
        }

        return MigrationServiceInterface::STATUS_READY;
    }

    /**
     * Returns the view for step configuration or information
     *
     * @param RequestStack $requestStack
     *
     * @return string|Response
     */
    public function renderConfigView(RequestStack $requestStack)
    {
        try {
            $this->verifyDatabase();
        } catch (\RuntimeException $e) {
            return $this->twig->render(
                'config_error.twig',
                array(
                    'title' => $this->getName(),
                    'description' => $this->getDescription(),
                    'error' => $e->getMessage(),
                )
            );
        }

        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_config") === '0') {
            return $this->twig->render(
                'config_ready.twig',
                array(
                    'title' => $this->getName(),
                    'description' => $this->getDescription(),
                    'message' => $this->trans('confirm.configfree'),
                    'can_continue' => true
                )
            );
        }

        $error = '';
        $galleries = $this->config->get('galleries');
        $productTypes = $this->config->get('productTypes');
        $request = $requestStack->getCurrentRequest();

        if ($request->isMethod('POST')) {
            $galleries = $request->get('galleries');
            $productTypes = $request->get('productTypes');

            if ($request->get('add_gallery') !== null) {
                $galleries[] = array();
            } elseif ($request->get('delete_gallery') !== null) {
                unset($galleries[$request->get('delete_gallery')]);
            } else {
                try {
                    $this->verifyGalleryConfig($galleries);
                    $this->verifyProductTypeConfig($productTypes);

                    $this->config->set('galleries', $galleries);
                    $this->config->set('productTypes', $productTypes);
                } catch (\RuntimeException $e) {
                    $error = $e->getMessage();
                }
            }
        }

        if (empty($galleries)) {
            $productTypes = array();
            $galleries = array(
                array('name' => $this->trans('service.shop_config.gallery_list_name')),
                array('name' => $this->trans('service.shop_config.gallery_reader_name'))
            );
        }

        return $this->twig->render(
            'shop_config.twig',
            array(
                'title'        => $this->getName(),
                'description'  => $this->getDescription(),
                'can_save'     => true,
                'imageSizes'   => $this->getImageSizes(),
                'galleries'    => $galleries,
                'productTypes' => $this->getProductTypes($productTypes),
                'error'        => $error
            )
        );
    }

    /**
     * Get SQL commands to migration the database
     *
     * @return array
     */
    public function getMigrationSQL()
    {
        $this->checkMigrationStatus();

        $sql = array();

        // Add tl_iso_config.address_fields
        $tableDiff = new TableDiff('tl_iso_config');
        $column = new Column('address_fields', Type::getType(Type::BLOB));
        $column->setLength(65535);
        $tableDiff->addedColumns['address_fields'] = $column;

        $sql = array_merge(
            $sql,
            $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff)
        );

        // Add tl_page.iso_store_id
        $tableDiff = new TableDiff('tl_page');
        $column = new Column('iso_store_id', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->addedColumns['iso_store_id'] = $column;

        $sql = array_merge(
            $sql,
            $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff),
            array(
                "UPDATE tl_page SET iso_store_id=(SELECT store_id FROM tl_iso_config WHERE fallback='1') WHERE type='root'",
                "UPDATE tl_page p SET iso_store_id=(SELECT store_id FROM tl_iso_config c WHERE c.id=p.iso_config) WHERE type='root'"
            )
        );

        // Add tl_iso_producttype.list_gallery and tl_iso_producttype.reader_gallery
        $tableDiff = new TableDiff('tl_iso_producttype');

        $column = new Column('list_gallery', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->addedColumns['list_gallery'] = $column;

        $column = new Column('reader_gallery', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->addedColumns['reader_gallery'] = $column;

        $sql = array_merge(
            $sql,
            $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff)
        );

        // Create gallery table
        $schemaConfig = new SchemaConfig();
        $schemaConfig->setDefaultTableOptions(array('engine'=>'MyISAM'));
        $schema = new Schema(array(), array(), $schemaConfig);

        $table = $this->createContaoTable('tl_iso_gallery', $schema);
        $table->addColumn('name', Type::STRING, array('notnull'=>true, 'default'=>''));
        $table->addColumn('type', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>64));
        $table->addColumn('anchor', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>8));
        $table->addColumn('placeholder', Type::BLOB, array('length'=>65535));
        $table->addColumn('main_size', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>64));
        $table->addColumn('gallery_size', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>64));
        $table->addColumn('lightbox_size', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>64));
        $table->addColumn('main_watermark_image', Type::BLOB, array('notnull'=>false, 'length'=>65535));
        $table->addColumn('main_watermark_position', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>16));
        $table->addColumn('gallery_watermark_image', Type::BLOB, array('notnull'=>false, 'length'=>65535));
        $table->addColumn('gallery_watermark_position', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>16));
        $table->addColumn('lightbox_watermark_image', Type::BLOB, array('notnull'=>false, 'length'=>65535));
        $table->addColumn('lightbox_watermark_position', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>16));

        $sql = array_merge(
            $sql,
            $schema->toSql($this->db->getDatabasePlatform())
        );

        return $sql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $this->convertAddressFields();
        $this->convertGalleries();
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    private function verifyDatabase()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_config')
            ->columnMustExist('tl_iso_config', 'id')
            ->columnMustExist('tl_iso_config', 'billing_fields')
            ->columnMustExist('tl_iso_config', 'shipping_fields')
            ->columnMustNotExist('tl_iso_config', 'address_fields')
            ->columnMustExist('tl_iso_config', 'store_id');

        $this->dbcheck
            ->tableMustExist('tl_page')
            ->columnMustNotExist('tl_page', 'iso_store_id');

        $this->dbcheck
            ->tableMustExist('tl_iso_producttypes')
            ->columnMustNotExist('tl_iso_producttypes', 'list_gallery')
            ->columnMustNotExist('tl_iso_producttypes', 'reader_gallery');

        $this->dbcheck->tableMustNotExist('tl_iso_gallery');
    }

    /**
     * Check if gallery config is valid
     *
     * @param mixed $galleries
     *
     * @throws \RuntimeException
     */
    private function verifyGalleryConfig($galleries)
    {
        if (empty($galleries) || !is_array($galleries)) {
            throw new \RuntimeException(
                $this->trans('service.shop_config.gallery_empty')
            );
        }

        foreach ($galleries as $gallery) {
            if (empty($gallery['name'])) {
                throw new \RuntimeException(
                    $this->trans('service.shop_config.gallery_missing_name')
                );
            }

            if (empty($gallery['main_config']) || empty($gallery['gallery_config'])) {
                throw new \RuntimeException(
                    $this->trans('service.shop_config.gallery_missing_config')
                );
            }
        }
    }

    /**
     * Check if product types config is valid
     *
     * @param mixed $productTypes
     *
     * @throws \RuntimeException
     */
    private function verifyProductTypeConfig($productTypes)
    {
        $productTypes = $this->getProductTypes($productTypes);

        foreach ($productTypes as $config) {
            if ($config['list_gallery'] === '' || $config['reader_gallery'] === '') {
                throw new \RuntimeException(
                    $this->trans('service.shop_config.productType_missing_config')
                );
            }
        }
    }

    /**
     * Generate an array of image sizes for the select menu
     */
    private function getImageSizes()
    {
        $options = array();
        $shopConfigs = $this->db->executeQuery("SELECT id, name, imageSizes FROM tl_iso_config");

        while ($config = $shopConfigs->fetch()) {
            $imageSizes = unserialize($config['imageSizes']);

            if (is_array($imageSizes)) {
                foreach ($imageSizes as $size) {
                    $options[$config['name']][$config['id'].'-'.$size['name']] = sprintf(
                        '%s (%s x %s)',
                        $size['name'],
                        $size['width'],
                        $size['height']
                    );
                }
            }
        }

        return $options;
    }

    /**
     * Get options for product types
     *
     * @param mixed $config
     *
     * @return array
     * @throws \Doctrine\DBAL\DBALException
     */
    private function getProductTypes($config)
    {
        $options = array();
        $productTypes = $this->db->executeQuery("SELECT id, name FROM tl_iso_producttypes");

        while ($row = $productTypes->fetch()) {
            $options[] = array(
                'id'              => $row['id'],
                'name'            => $row['name'],
                'list_gallery'    => (isset($config[$row['id']]['list_gallery']) ? $config[$row['id']]['list_gallery'] : ''),
                'reader_gallery'  => (isset($config[$row['id']]['reader_gallery']) ? $config[$row['id']]['reader_gallery'] : ''),
            );
        }

        return $options;
    }

    /**
     * Field tl_iso_config.billing_fields and tl_iso_config.shipping_fields have been
     * combined in to one field tl_iso_config.address_fields
     */
    private function convertAddressFields()
    {
        $allConfigs = $this->db->fetchAll("SELECT id, billing_fields, shipping_fields FROM tl_iso_config");

        foreach ($allConfigs as $configData) {

            $addressFields = array();
            $billingFields = @unserialize($configData['billing_fields']);
            $shippingFields = @unserialize($configData['shipping_fields']);

            if (is_array($billingFields)) {
                foreach ($billingFields as $position => $field) {
                    $name = $field['value'];

                    $addressFields[$name] = array(
                        'name' => $name,
                        'billing' => $this->getFieldState($field),
                        'shipping' => 'disabled',
                        'position' => ($position * 10)
                    );
                }
            }

            if (is_array($shippingFields)) {
                foreach ($shippingFields as $position => $field) {
                    $name = $field['value'];

                    if (isset($addressFields[$name])) {
                        $addressFields[$name]['shipping'] = $this->getFieldState($field);
                    } else {
                        $addressFields[$name] = array(
                            'name' => $name,
                            'billing' => 'disabled',
                            'shipping' => $this->getFieldState($field),
                            'position' => ($position * 10 + 5)
                        );
                    }
                }
            }

            $this->db->update('tl_iso_config', array('address_fields' => serialize($addressFields)), array('id' => $configData['id']));
        }
    }


    private function convertGalleries()
    {
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_config") === '0'
            || $this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_producttype") === '0'
        ) {
            return;
        }

        $time = time();

        $galleryMap = array();

        foreach ($this->config->get('galleries') as $id => $gallery) {

            $data = array(
                'tstamp' => $time,
                'name' => $gallery['name'],
                'anchor' => 'reader'
            );

            $main_config = $this->getGalleryConfig($gallery['main_config']);

            $data['type'] = $main_config['type'];
            $data['placeholder'] = $main_config['placeholder'];
            $data['main_size'] = serialize(array($main_config['width'], $main_config['height'], $main_config['mode']));
            $data['main_watermark_image'] = ($main_config['watermark'] ?: null); // TODO: convert to UUID
            $data['main_watermark_position'] = $this->getWatermarkPosition($main_config['position']);

            $gallery_config = $this->getGalleryConfig($gallery['gallery_config']);
            $data['gallery_size'] = serialize(array($gallery_config['width'], $gallery_config['height'], $gallery_config['mode']));
            $data['gallery_watermark_image'] = ($gallery_config['watermark'] ?: null); // TODO: convert to UUID
            $data['gallery_watermark_position'] = $this->getWatermarkPosition($gallery_config['position']);

            if ($gallery['lightbox_config']) {
                $lightbox_config = $this->getGalleryConfig($gallery['lightbox_config']);
                $data['lightbox_size'] = serialize(array($lightbox_config['width'], $lightbox_config['height'], $lightbox_config['mode']));
                $data['lightbox_watermark_image'] = ($lightbox_config['watermark'] ?: null); // TODO: convert to UUID
                $data['lightbox_watermark_position'] = $this->getWatermarkPosition($lightbox_config['position']);
                $data['anchor'] = 'lightbox';
            }

            $this->db->insert(
                'tl_iso_gallery',
                $data
            );

            $galleryMap[$id] = $this->db->lastInsertId();
        }

        foreach ($this->config->get('productTypes') as $id => $config) {
            $this->db->update(
                'tl_iso_producttype',
                array(
                    'list_gallery'   => $galleryMap[$config['list_gallery']],
                    'reader_gallery' => $galleryMap[$config['reader_gallery']],
                ),
                array(
                    'id' => $id
                )
            );
        }
    }

    /**
     * @param string $key
     *
     * @return array
     */
    private function getGalleryConfig($key)
    {
        static $configs = array();

        list($id, $name) = explode('-', $key, 2);

        if (!isset($configs[$id])) {
            $configs[$id]= $this->db->fetchAssoc("SELECT * FROM tl_iso_config WHERE id=? LIMIT 1", array($id));
            $sizes = unserialize($configs[$id]['imageSizes']);
            $configs[$id]['imageSizes'] = array();
            foreach ($sizes as $k => $size) {
                $size['placeholder'] = $configs[$id]['missing_image_placeholder'];
                $size['type'] = ($configs[$id]['gallery'] == 'default' ? 'standard' : $configs[$id]['gallery']);
                $configs[$id]['imageSizes'][$size['name']] = $size;
            }
        }

        return $configs[$id]['imageSizes'][$name];
    }


    private function getWatermarkPosition($position)
    {
        switch ($position) {
            case 'tl':
                return 'left_top';

            case 'tc':
                return 'center_top';

            case 'tr':
                return 'right_top';

            case 'bl':
                return 'left_bottom';

            case 'bc':
                return 'center_bottom';

            case 'br':
                return 'right_bottom';

            case 'cc':
                return 'center_center';
        }

        return '';
    }


    private function getFieldState(array $field)
    {
        if (!$field['enabled']) {
            return 'disabled';
        } elseif ($field['mandatory']) {
            return 'mandatory';
        } else {
            return 'enabled';
        }
    }
}
