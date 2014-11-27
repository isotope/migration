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

use Doctrine\DBAL\Connection;
use Doctrine\DBAL\Driver\Statement;
use Doctrine\DBAL\Query\QueryBuilder;
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
        return $this->trans('service.product_data.service_name');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('service.product_data.service_description');
    }

    /**
     * Get SQL commands to migration the database
     *
     * @return array
     */
    public function getMigrationSQL()
    {
        $this->checkMigrationStatus();

        return array_merge(
            $this->renameTable('tl_iso_groups', 'tl_iso_group'),
            $this->renameTable('tl_iso_product_categories', 'tl_iso_product_category'),
            $this->getProductSQL(),
            $this->renameTable('tl_iso_prices', 'tl_iso_product_price'),
            $this->renameTable('tl_iso_price_tiers', 'tl_iso_product_pricetier')
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
    protected function verifyIntegrity()
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


    private function migrateNonAdvancedPrices()
    {
        $nonAdvancedTypes = $this->db->executeQuery("SELECT id, attributes, variants, variant_attributes FROM tl_iso_producttype WHERE prices=''");

        if ($nonAdvancedTypes->rowCount() == 0) {
            return;
        }

        $position = 0;
        $queryBuilder = $this->db
            ->createQueryBuilder()
            ->select('id', 'tax_class', 'price')
            ->from('tl_iso_product', 'p');

        while ($type = $nonAdvancedTypes->fetch()) {
            $attributes = unserialize($type['attributes']);
            $variantAttributes = unserialize($type['variant_attributes']);

            $this->addAttributeCondition($queryBuilder, $attributes, $type, $position);
            $this->addVariantAttributeCondition($queryBuilder, $variantAttributes, $type, $position);
        }

        $allProducts = $queryBuilder->execute();

        $this->createPrices($allProducts);
    }

    /**
     * @param array $attributes
     *
     * @return bool
     */
    private function hasPrice(array $attributes)
    {
        if (!empty($attributes)
            && is_array($attributes)
            && isset($attributes['price'])
            && $attributes['price']['enabled']
        ) {
            return true;
        }

        return false;
    }

    private function addAttributeCondition(QueryBuilder $queryBuilder, $attributes, array $type, &$position)
    {
        if ($this->hasPrice($attributes)) {
            $queryBuilder->orWhere('type=? AND pid=0');
            $queryBuilder->setParameter($position++, $type['id'], \PDO::PARAM_INT);
        }
    }

    private function addVariantAttributeCondition(QueryBuilder $queryBuilder, $attributes, array $type, &$position)
    {
        if ($type['variants'] && $this->hasPrice($attributes)) {
            $productIds = array_map(
                'current',
                $this->db->fetchAll(
                    "SELECT id FROM tl_iso_product WHERE type=?",
                    array(
                        $type['id']
                    )
                )
            );

            if (!empty($productIds)) {
                $queryBuilder->orWhere("pid IN (?) AND language=''");
                $queryBuilder->setParameter($position++, $productIds, Connection::PARAM_INT_ARRAY);
            }
        }
    }

    private function createPrices(Statement $products)
    {
        $time = time();

        while ($product = $products->fetch()) {

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
