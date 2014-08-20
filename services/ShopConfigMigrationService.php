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
use Doctrine\DBAL\Schema\TableDiff;
use Doctrine\DBAL\Types\Type;

class ShopConfigMigrationService extends AbstractConfigfreeMigrationService
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
     * Get SQL commands to migration the database
     *
     * @return array
     */
    public function getMigrationSQL()
    {
        if ($this->getStatus() != MigrationServiceInterface::STATUS_READY) {
            throw new \BadMethodCallException('Migration service is not ready');
        }

        $tableDiff = new TableDiff('tl_iso_config');

        $column = new Column('address_fields', Type::getType(Type::BLOB));
        $column->setLength(65535);
        $tableDiff->addedColumns['address_fields'] = $column;

        // TODO: migrate data from tl_iso_config.billing_fields and tl_iso_config.shipping_fields to tl_iso_config.address
        // TODO: new tl_iso_gallery instead of tl_iso_config.gallery
        // TODO: convert tl_iso_config.imageSizes to galleries
        // TODO: tl_iso_config.missing_image_placeholder is now in the gallery
        // TODO: store_id is now a root page setting

        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);

        return $sql;
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyDatabase()
    {
        $this->dbcheck
            ->columnMustNotExist('tl_iso_config', 'address_fields');

        // TODO: finish implementation
    }
}