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

class ProductCollectionMigrationService extends AbstractMigrationService
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
        if ($this->dbcheck->tableIsEmpty('tl_iso_orders')) {
            return MigrationServiceInterface::STATUS_READY;
        }

        try {
            $this->verifySurchargesConfig($this->config->get('surcharge_types'));
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
            $this->verifyDatabase();
        } catch (\RuntimeException $e) {
            return $this->renderConfigError($e->getMessage());
        }

        if ($this->dbcheck->tableIsEmpty('tl_iso_orders')) {
            return $this->renderConfigFree();
        }

        $error = '';
        $surchargeTypes = $this->config->get('surcharge_types');
        $request = $requestStack->getCurrentRequest();

        if ($request->isMethod('POST')) {
            $surchargeTypes = $request->get('surcharge_types');

            try {
                $this->verifySurchargesConfig($surchargeTypes);

                $this->config->set('surcharge_types', $surchargeTypes);
            } catch (\RuntimeException $e) {
                $error = $e->getMessage();
            }
        }

        foreach ($this->getSurchargesByCollection() as $collection) {
            foreach ($collection['surcharges'] as $surcharge) {
                if (!isset($surchargeTypes[$surcharge['label']])) {
                    $surchargeTypes[$surcharge['label']] = '';
                }
            }
        }

        return $this->twig->render(
            'product_collection.twig',
            array(
                'title'          => $this->getName(),
                'description'    => $this->getDescription(),
                'can_save'       => true,
                'surchargeTypes' => $surchargeTypes,
                'error'          => $error,
                'defaultTypes'   => array('rule', 'payment', 'shipping', 'tax'),
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

        return array_merge(
            $this->getCollectionSQL(),
            $this->getItemSQL(),
            $this->getSurchargesSQL()
        );
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $this->createPrivateAddresses();
        $this->convertSurcharges();

        // TODO: recreate tl_iso_product_collection_item.jumpTo
        // TODO: check if we need to convert product_options
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
            ->columnMustNotExist('tl_iso_orders', 'type')
            ->columnMustExist('tl_iso_orders', 'cart_id')
            ->columnMustNotExist('tl_iso_orders', 'source_collection_id');

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

        $this->dbcheck
            ->tableMustNotExist('tl_iso_product_collection_surcharge')
            ->columnMustExist('tl_iso_orders', 'surcharges');
    }

    /**
     * Validate surcharges config
     *
     * @param mixed $surchargeTypes
     */
    private function verifySurchargesConfig($surchargeTypes)
    {
        if (empty($surchargeTypes) || !is_array($surchargeTypes)) {
            throw new \RuntimeException(
                $this->trans('service.product_collection.surcharges_empty')
            );
        }

        $surchargesByCollection = $this->getSurchargesByCollection();

        foreach ($surchargesByCollection as $order) {
            foreach ($order['surcharges'] as $surcharge) {
                if (!isset($surchargeTypes[$surcharge['label']]) || $surchargeTypes[$surcharge['label']] === '') {
                    throw new \RuntimeException(
                        $this->trans('service.product_collection.surcharge_type_missing')
                    );
                }
            }
        }
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

        $column = new Column('source_collection_id', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->renamedColumns['cart_id'] = $column;

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

    /**
     * Create product collection surcharges table
     *
     * @return array
     */
    private function getSurchargesSQL()
    {
        $schemaConfig = new SchemaConfig();
        $schemaConfig->setDefaultTableOptions(array('engine'=>'MyISAM'));
        $schema = new Schema(array(), array(), $schemaConfig);

        $table = $this->createContaoTable('tl_iso_product_collection_surcharge', $schema, true, true);
        $table->addColumn('type', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>64));
        $table->addColumn('label', Type::STRING, array('notnull'=>true, 'default'=>''));
        $table->addColumn('price', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>32));
        $table->addColumn('total_price', Type::DECIMAL, array('precision'=>12, 'scale'=>2, 'notnull'=>true, 'default'=>'0.00'));
        $table->addColumn('tax_free_total_price', Type::DECIMAL, array('precision'=>12, 'scale'=>2, 'notnull'=>true, 'default'=>'0.00'));
        $table->addColumn('tax_class', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
        $table->addColumn('tax_id', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>32));
        $table->addColumn('before_tax', Type::STRING, array('fixed'=>true, 'notnull'=>true, 'default'=>'', 'length'=>1));
        $table->addColumn('addToTotal', Type::STRING, array('fixed'=>true, 'notnull'=>true, 'default'=>'', 'length'=>1));
        $table->addColumn('products', Type::BLOB, array('length'=>65535));

        return $schema->toSql($this->db->getDatabasePlatform());
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


    private function convertSurcharges()
    {
        $time = time();
        $surchargeTypes = $this->config->get('surcharge_types');

        foreach ($this->getSurchargesByCollection(true) as $collection) {
            $sorting = 0;

            foreach ($collection['surcharges'] as $surcharge) {
                $this->db->insert(
                    'tl_iso_product_collection_surcharge',
                    array(
                        'pid'                  => $collection['id'],
                        'sorting'              => ($sorting += 128),
                        'tstamp'               => $time,
                        'type'                 => $surchargeTypes[$surcharge['label']],
                        'label'                => $surcharge['label'],
                        'price'                => $surcharge['price'],
                        'total_price'          => $surcharge['total_price'],
                        'tax_free_total_price' => '',
                        'tax_class'            => (isset($surcharge['tax_class']) ? $surcharge['tax_class'] : ''),
                        'tax_id'               => (isset($surcharge['tax_id']) ? $surcharge['tax_id'] : ''),
                        'before_tax'           => ((isset($surcharge['before_tax']) && $surcharge['before_tax']) ? '1' : ''),
                        'addToTotal'           => ((isset($surcharge['add']) && $surcharge['add'] === false) ? '' : '1'),
                        'products'             => (isset($surcharge['products']) ? serialize($surcharge['products']) : '')
                    )
                );
            }
        }
    }

    /**
     * Get all surcharges from all orders
     *
     * @param bool $afterMigration
     *
     * @return array
     * @throws \Doctrine\DBAL\DBALException
     */
    private function getSurchargesByCollection($afterMigration = false)
    {
        $surchargesByCollection = array();
        $tableName = $afterMigration ? 'tl_iso_product_collection' : 'tl_iso_orders';
        $orders = $this->db->query("SELECT id, tstamp, surcharges FROM $tableName WHERE surcharges!=''");

        foreach ($orders as $order) {
            $surcharges = unserialize($order['surcharges']);

            if (!empty($surcharges) && is_array($surcharges)) {
                $surchargesByCollection[$order['id']] = array(
                    'id' => $order['id'],
                    'tstamp' => $order['tstamp'],
                    'surcharges' => $surcharges,
                );
            }
        }

        return $surchargesByCollection;
    }
}
