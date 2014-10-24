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
        $this->checkMigrationStatus();

        return array_merge(
            $this->getCollectionSQL(),
            $this->getItemSQL()
        );
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $this->createPrivateAddresses();

        // TODO: recreate tl_iso_product_collection_item.jumpTo
        // TODO: check if we need to convert product_options
        // TODO: convert surcharges from serialized array to subtable
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyDatabase()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_orders')
            ->tableMustNotExist('tl_iso_product_collection')
            ->columnMustExist('tl_iso_orders', 'id')
            ->columnMustExist('tl_iso_orders', 'pid')
            ->columnMustNotExist('tl_iso_orders', 'member')
            ->columnMustExist('tl_iso_orders', 'billing_address')
            ->columnMustNotExist('tl_iso_orders', 'billing_address_id')
            ->columnMustExist('tl_iso_orders', 'shipping_address')
            ->columnMustNotExist('tl_iso_orders', 'shipping_address_id')
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
            ->columnMustNotExist('tl_iso_order_items', 'options'); // TODO: rename to "configuration"
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

        $column = new Column('billing_address_id', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->addedColumns['billing_address_id'] = $column;

        $column = new Column('shipping_address_id', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->addedColumns['shipping_address_id'] = $column;

        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
        $sql[] = "UPDATE tl_iso_product_collection SET type='order'";

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
        $column = new Column('options', Type::getType(Type::BLOB));
        $column->setLength(65535);
        $tableDiff->renamedColumns['product_options'] = $column;

        return $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
    }


    private function createPrivateAddresses()
    {
        $allCollections = $this->db->fetchAll("
            SELECT p.id, p.billing_address, p.shipping_address, IFNULL(c.store_id, 0) AS store_id
            FROM tl_iso_product_collection p
            LEFT JOIN tl_iso_config c ON c.id=p.config_id
        ");

        foreach ($allCollections as $collection) {
            $billingAddress = @unserialize($collection['billing_address']);
            $shippingAddress = @unserialize($collection['shipping_address']);

            $billingAddressId = 0;
            $shippingAddressId = 0;

            if (is_array($billingAddress)) {
                $billingAddressId = $this->addAddress($billingAddress, $collection['id'], $collection['store_id'], ($billingAddress['id'] === 0 || $billingAddress['id'] === '0'));
            }

            if (is_array($shippingAddress)) {
                if ($shippingAddress['id'] == '-1' && $billingAddressId > 0) {
                    $shippingAddressId = $billingAddressId;
                } else {
                    $shippingAddressId = $this->addAddress($shippingAddress, $collection['id'], $collection['store_id'], false, ($shippingAddress['id'] === 0 || $shippingAddress['id'] === '0'));
                }
            }

            $this->db->update(
                'tl_iso_product_collection',
                array(
                    'billing_address_id' => $billingAddressId,
                    'shipping_address_id' => $shippingAddressId
                ),
                array('id'=>$collection['id'])
            );
        }
    }


    private function addAddress(array $data, $collectionId, $storeId = 0, $isDefaultBilling = false , $isDefaultShipping = false)
    {
        // TODO: what do we do if the serialized data contains fields that are not in the table?

        unset($data['id']);

        $data['tstamp'] = time();
        $data['ptable'] = 'tl_iso_product_collection';
        $data['pid'] = $collectionId;
        $data['store_id'] = $storeId;
        $data['isDefaultBilling'] = ($isDefaultBilling ? '1' : '');
        $data['isDefaultShipping'] = ($isDefaultShipping ? '1' : '');

        $this->db->insert('tl_iso_address', $data);

        return $this->db->lastInsertId();
    }
}
