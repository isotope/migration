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

class ProductDataMigrationService extends AbstractConfigfreeMigrationService
{

    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Product data');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates product data.');
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

        return array_merge(
            $this->getGroupSQL(),
            $this->getCategoriesSQL(),
            $this->getProductSQL(),
            $this->getPriceSQL()
        );
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyDatabase()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_groups')
            ->tableMustNotExist('tl_iso_group');

        $this->dbcheck
            ->tableMustExist('tl_iso_product_categories')
            ->tableMustNotExist('tl_iso_product_category');

        $this->dbcheck
            ->tableMustExist('tl_iso_products')
            ->tableMustNotExist('tl_iso_product')
            ->columnMustExist('tl_iso_products', 'description_meta')
            ->columnMustNotExist('tl_iso_products', 'meta_description')
            ->columnMustExist('tl_iso_products', 'keywords_meta')
            ->columnMustNotExist('tl_iso_products', 'meta_keywords');

        $this->dbcheck
            ->tableMustExist('tl_iso_prices')
            ->tableMustNotExist('tl_iso_product_price');

        $this->dbcheck
            ->tableMustExist('tl_iso_price_tiers')
            ->tableMustNotExist('tl_iso_product_pricetier');

        // TODO: finish implementation
    }

    /**
     * @return array
     */
    private function getGroupSQL()
    {
        $tableDiff = new TableDiff('tl_iso_groups');
        $tableDiff->newName = 'tl_iso_group';

        // TODO: finish implementation

        return $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
    }

    /**
     * @return array
     */
    private function getCategoriesSQL()
    {
        $tableDiff = new TableDiff('tl_iso_product_categories');
        $tableDiff->newName = 'tl_iso_product_category';

        // TODO: finish implementation

        return $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
    }

    /**
     * @return array
     */
    private function getProductSQL()
    {
        $tableDiff = new TableDiff('tl_iso_products');
        $tableDiff->newName = 'tl_iso_product';

        $column = new Column('meta_description', Type::getType(Type::TEXT));
        $column->setLength(65532);
        $tableDiff->renamedColumns['description_meta'] = $column;

        $column = new Column('meta_keywords', Type::getType(Type::TEXT));
        $column->setLength(65532);
        $tableDiff->renamedColumns['keywords_meta'] = $column;

        // TODO: finish implementation

        return $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
    }

    /**
     * @return array
     */
    private function getPriceSQL()
    {
        $tableDiff = new TableDiff('tl_iso_prices');
        $tableDiff->newName = 'tl_iso_product_price';
        $priceSql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);

        $tableDiff = new TableDiff('tl_iso_price_tiers');
        $tableDiff->newName = 'tl_iso_product_pricetier';
        $tiersSql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);

        // TODO: finish implementation

        return array_merge($priceSql, $tiersSql);
    }
}