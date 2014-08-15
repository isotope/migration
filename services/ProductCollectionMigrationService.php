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

class ProductCollectionMigrationService extends AbstractConfigfreeMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Product collections');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates order information');
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
            $this->getCollectionSQL(),
            $this->getItemSQL()
        );
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @return bool
     */
    protected function verifyDatabase()
    {
        // TODO: should we check for cart tables (because they are dropped)?

        $this->dbcheck
            ->tableMustExist('tl_iso_orders')
            ->tableMustNotExist('tl_iso_product_collection')
            ->columnMustExist('tl_iso_orders', 'pid')
            ->columnMustNotExist('tl_iso_orders', 'member')
            ->columnMustExist('tl_iso_orders', 'subTotal')
            ->columnMustNotExist('tl_iso_orders', 'type');

        $this->dbcheck
            ->tableMustExist('tl_iso_order_items')
            ->tableMustNotExist('tl_iso_product_collection_item')
            ->columnMustExist('tl_iso_order_items', 'product_name')
            ->columnMustNotExist('tl_iso_order_items', 'name')
            ->columnMustExist('tl_iso_order_items', 'product_sku')
            ->columnMustNotExist('tl_iso_order_items', 'sku')
            ->columnMustExist('tl_iso_order_items', 'product_quantity')
            ->columnMustNotExist('tl_iso_order_items', 'quantity')
            ->columnMustExist('tl_iso_order_items', 'product_options')
            ->columnMustNotExist('tl_iso_order_items', 'options'); // TODO: rename to "coniguration"

        // TODO: finish implementation
    }

    /**
     * @return array
     */
    private function getCollectionSQL()
    {
        $tableDiff = new TableDiff('tl_iso_orders');
        $tableDiff->newName = 'tl_iso_product_collection';

        $column = new Column('member', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->renamedColumns['pid'] = $column;

        $column = new Column('subtotal', Type::getType(Type::DECIMAL));
        $column->setPrecision(12)->setScale(2)->setNotnull(true)->setDefault('0.00');
        $tableDiff->renamedColumns['subTotal'] = $column;

        $column = new Column('type', Type::getType(Type::STRING));
        $column->setLength(32)->setNotnull(true)->setDefault('');
        $tableDiff->addedColumns['type'] = $column;

        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
        $sql[] = "UPDATE tl_iso_product_collection SET type='order'";

        // TODO: finish implementation

        return $sql;
    }

    /**
     * @return array
     */
    private function getItemSQL()
    {
        $tableDiff = new TableDiff('tl_iso_order_items');
        $tableDiff->newName = 'tl_iso_product_collection_item';

        $column = new Column('name', Type::getType(Type::STRING));
        $column->setLength(255)->setNotnull(true)->setDefault('');
        $tableDiff->renamedColumns['product_name'] = $column;

        $column = new Column('sku', Type::getType(Type::STRING));
        $column->setLength(128)->setNotnull(true)->setDefault('');
        $tableDiff->renamedColumns['product_sku'] = $column;

        $column = new Column('quantity', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->renamedColumns['product_quantity'] = $column;

        // TODO: should use "configuration" once the prices feature branch is merged
        // TODO: will create LONGBLOB instead of BLOB
        $column = new Column('options', Type::getType(Type::BLOB));
        $tableDiff->renamedColumns['product_options'] = $column;

        // TODO: finish implementation

        return $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
    }
}