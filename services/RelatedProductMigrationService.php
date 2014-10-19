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


use Doctrine\DBAL\Schema\TableDiff;

class RelatedProductMigrationService extends AbstractConfigfreeMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Related Products');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates related products and their categories.');
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
        $renamed = array(
            'tl_iso_related_categories' => 'tl_iso_related_category',
            'tl_iso_related_products' => 'tl_iso_related_product',
        );

        foreach ($renamed as $old => $new) {
            $tableDiff = new TableDiff($old);
            $tableDiff->newName = $new;

            $sql = array_merge(
                $sql,
                $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff)
            );
        }

        return $sql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        // List of product IDs is now comma-separated instead of serialized
        $relations = $this->db->fetchAll("SELECT id, products FROM tl_iso_related_product WHERE products!=''");

        foreach ($relations as $row) {
            $ids = unserialize($row['products']);

            if (!empty($ids) && is_array($ids)) {
                $this->db->update(
                    'tl_iso_related_product',
                    array(
                        'products' => implode(',', $ids)
                    ),
                    array('id' => $row['id'])
                );
            }
        }
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyDatabase()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_related_categories')
            ->tableMustNotExist('tl_iso_related_category');

        $this->dbcheck
            ->tableMustExist('tl_iso_related_products')
            ->tableMustNotExist('tl_iso_related_product')
            ->columnMustExist('tl_iso_related_products', 'id')
            ->columnMustExist('tl_iso_related_products', 'products');
    }
}
