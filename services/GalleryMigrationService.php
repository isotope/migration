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

class GalleryMigrationService extends AbstractMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('service.gallery.service_name');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('service.gallery.service_description');
    }

    /**
     * Returns status code of the migration step
     *
     * @return int
     */
    public function getStatus()
    {
        try {
            $this->verifyIntegrity();
        } catch (\RuntimeException $e) {
            return MigrationServiceInterface::STATUS_ERROR;
        }

        // Nothing to do
        if ($this->dbcheck->tableIsEmpty('tl_iso_config')
            || $this->dbcheck->tableIsEmpty('tl_iso_producttypes')
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
     * @return string
     */
    public function renderConfigView(RequestStack $requestStack)
    {
        try {
            $this->verifyIntegrity();
        } catch (\RuntimeException $e) {
            return $this->renderConfigError($e->getMessage());
        }

        if ($this->dbcheck->tableIsEmpty('tl_iso_config')) {
            return $this->renderConfigFree();
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
                array('name' => $this->trans('service.gallery.list_name')),
                array('name' => $this->trans('service.gallery.reader_name'))
            );
        }

        return $this->twig->render(
            'gallery.twig',
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
        $table->addColumn('placeholder', Type::BLOB, array('length'=>65535, 'notnull'=>false));
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
        $this->convertGalleries();
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    private function verifyIntegrity()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_config')
            ->columnMustExist('tl_iso_config', 'id')
            ->columnMustExist('tl_iso_config', 'name')
            ->columnMustExist('tl_iso_config', 'missing_image_placeholder')
            ->columnMustExist('tl_iso_config', 'imageSizes');

        $this->dbcheck
            ->tableMustExist('tl_iso_producttypes')
            ->columnMustExist('tl_iso_producttypes', 'id')
            ->columnMustExist('tl_iso_producttypes', 'name')
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
                $this->trans('service.gallery.gallery_empty')
            );
        }

        foreach ($galleries as $gallery) {
            if (empty($gallery['name'])) {
                throw new \RuntimeException(
                    $this->trans('service.gallery.gallery_missing_name')
                );
            }

            if (empty($gallery['main_config']) || empty($gallery['gallery_config'])) {
                throw new \RuntimeException(
                    $this->trans('service.gallery.missing_config')
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
                    $this->trans('service.gallery.productType_missing_config')
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

    private function convertGalleries()
    {
        if ($this->dbcheck->tableIsEmpty('tl_iso_config')
            || $this->dbcheck->tableIsEmpty('tl_iso_producttype')) {
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
            $this->convertGalleryConfig($main_config, 'main', $data);

            $gallery_config = $this->getGalleryConfig($gallery['gallery_config']);
            $this->convertGalleryConfig($gallery_config, 'gallery', $data);

            if ($gallery['lightbox_config']) {
                $lightbox_config = $this->getGalleryConfig($gallery['lightbox_config']);
                $this->convertGalleryConfig($lightbox_config, 'lightbox', $data);
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

    /**
     * @param array  $config
     * @param string $name
     * @param array  $data
     */
    private function convertGalleryConfig(array $config, $name, array &$data)
    {
        $data[$name.'_size'] = serialize(array($config['width'], $config['height'], $config['mode']));
        $data[$name.'_watermark_image'] = $this->dbafs->findByPath($config['watermark']);
        $data[$name.'_watermark_position'] = $this->getWatermarkPosition($config['position']);
    }

    /**
     * @param string $position
     *
     * @return string
     */
    private function getWatermarkPosition($position)
    {
        static $map = array(
            'tl' => 'left_top',
            'tc' => 'center_top',
            'tr' => 'right_top',
            'bl' => 'left_bottom',
            'bc' => 'center_bottom',
            'br' => 'right_bottom',
            'cc' => 'center_center',
        );

        return $map[$position] ?: '';
    }
}
