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

        $sql = array();

        // Add tl_iso_config.address_fields
        $tableDiff = new TableDiff('tl_iso_config');

        $column = new Column('address_fields', Type::getType(Type::BLOB));
        $column->setLength(65535);
        $tableDiff->addedColumns['address_fields'] = $column;

        $sql = array_merge($sql,
            $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff)
        );

        // Add tl_page.store_id
        $tableDiff = new TableDiff('tl_page');

        $column = new Column('store_id', Type::getType(Type::INTEGER), array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
        $tableDiff->addedColumns['store_id'] = $column;

        // TODO: new tl_iso_gallery instead of tl_iso_config.gallery
        // TODO: convert tl_iso_config.imageSizes to galleries
        // TODO: tl_iso_config.missing_image_placeholder is now in the gallery

        $sql = array_merge($sql,
            $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff)
        );

        return $sql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $this->convertAddressFields();

        // TODO: Merge store_id as it is now a root page setting
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyDatabase()
    {
        $this->dbcheck
            ->columnMustExist('tl_iso_config', 'id')
            ->columnMustExist('tl_iso_config', 'billing_fields')
            ->columnMustExist('tl_iso_config', 'shipping_fields')
            ->columnMustNotExist('tl_iso_config', 'address_fields')
            ->columnMustNotExist('tl_page', 'store_id');

        // TODO: finish implementation
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

                    if (!$field['enabled']) {
                        $state = 'disabled';
                    } elseif ($field['mandatory']) {
                        $state = 'mandatory';
                    } else {
                        $state = 'enabled';
                    }

                    $addressFields[$name] = array(
                        'name' => $name,
                        'billing' => $state,
                        'shipping' => 'disabled',
                        'position' => ($position * 10)
                    );
                }
            }

            if (is_array($shippingFields)) {
                foreach ($shippingFields as $position => $field) {
                    $name = $field['value'];

                    if (!$field['enabled']) {
                        $state = 'disabled';
                    } elseif ($field['mandatory']) {
                        $state = 'mandatory';
                    } else {
                        $state = 'enabled';
                    }

                    if (isset($addressFields[$name])) {
                        $addressFields[$name]['shipping'] = $state;
                    } else {
                        $addressFields[$name] = array(
                            'name' => $name,
                            'billing' => 'disabled',
                            'shipping' => $state,
                            'position' => ($position * 10 + 5)
                        );
                    }
                }
            }

            $this->db->update('tl_iso_config', array('address_fields' => serialize($addressFields)), array('id' => $configData['id']));
        }
    }
}