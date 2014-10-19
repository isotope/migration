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
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $this->migrateNonAdvancedPrices();
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
            ->columnMustNotExist('tl_iso_products', 'meta_keywords')
            ->columnMustExist('tl_iso_products', 'id')
            ->columnMustExist('tl_iso_products', 'price')
            ->columnMustExist('tl_iso_products', 'tax_class');

        $this->dbcheck
            ->tableMustExist('tl_iso_producttypes')
            ->columnMustExist('tl_iso_producttypes', 'id')
            ->columnMustExist('tl_iso_producttypes', 'prices');

        $this->dbcheck
            ->tableMustExist('tl_iso_prices')
            ->tableMustNotExist('tl_iso_product_price')
            ->columnMustExist('tl_iso_prices', 'pid')
            ->columnMustExist('tl_iso_prices', 'tstamp')
            ->columnMustExist('tl_iso_prices', 'tax_class');

        $this->dbcheck
            ->tableMustExist('tl_iso_price_tiers')
            ->tableMustNotExist('tl_iso_product_pricetier')
            ->columnMustExist('tl_iso_price_tiers', 'pid')
            ->columnMustExist('tl_iso_price_tiers', 'tstamp')
            ->columnMustExist('tl_iso_price_tiers', 'min')
            ->columnMustExist('tl_iso_price_tiers', 'price');
    }

    /**
     * @return array
     */
    private function getGroupSQL()
    {
        $tableDiff = new TableDiff('tl_iso_groups');
        $tableDiff->newName = 'tl_iso_group';

        return $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
    }

    /**
     * @return array
     */
    private function getCategoriesSQL()
    {
        $tableDiff = new TableDiff('tl_iso_product_categories');
        $tableDiff->newName = 'tl_iso_product_category';

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
        $column->setNotnull(false);
        $tableDiff->renamedColumns['description_meta'] = $column;

        $column = new Column('meta_keywords', Type::getType(Type::TEXT));
        $column->setLength(65532);
        $column->setNotnull(false);
        $tableDiff->renamedColumns['keywords_meta'] = $column;

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

        return array_merge($priceSql, $tiersSql);
    }


    private function migrateNonAdvancedPrices()
    {
        $time = time();
        $where = array();
        $params = array();
        $nonAdvancedTypes = $this->db->executeQuery("SELECT id, attributes, variants, variant_attributes FROM tl_iso_producttype WHERE prices=''");

        if ($nonAdvancedTypes->rowCount() == 0) {
            return;
        }

        while ($type = $nonAdvancedTypes->fetch()) {
            $attributes = unserialize($type['attributes']);
            $variantAttributes = unserialize($type['variant_attributes']);

            if (!empty($attributes)
                && is_array($attributes)
                && isset($attributes['price'])
                && $attributes['price']['enabled']
            ) {
                $params[] = $type['id'];
                $where[] = "(type=? AND pid=0)";
            }

            if ($type['variants']
                && !empty($variantAttributes)
                && is_array($variantAttributes)
                && isset($variantAttributes['price'])
                && $variantAttributes['price']['enabled']
            ) {
                $params[] = $type['id'];
                $where[] = "(type=? AND pid>0 AND language='')";
            }
        }

        $allProducts = $this->db->executeQuery(
            "SELECT id, tax_class, price FROM tl_iso_product WHERE " . implode(' OR ', $where),
            $params
        );

        while ($product = $allProducts->fetch()) {

            $this->db->insert(
                'tl_iso_product_price',
                array(
                    'pid'       => $product['id'],
                    'tstamp'    => $time,
                    'tax_class' => $product['tax_class']
                )
            );

            $priceId = $this->db->lastInsertId();

            $this->db->insert(
                'tl_iso_product_pricetier',
                array(
                    'pid'    => $priceId,
                    'tstamp' => $time,
                    'min'    => '1',
                    'price'  => $product['price']
                )
            );
        }
    }
}
