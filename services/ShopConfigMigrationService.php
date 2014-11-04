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
        $this->checkMigrationStatus();

        $sql = array();

        // Add tl_iso_config.address_fields
        $tableDiff = new TableDiff('tl_iso_config');
        $column = new Column('address_fields', Type::getType(Type::BLOB));
        $column->setLength(65535);
        $tableDiff->addedColumns['address_fields'] = $column;

        $sql = array_merge(
            $sql,
            $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff)
        );

        // Add tl_page.iso_store_id
        $tableDiff = new TableDiff('tl_page');
        $column = new Column('iso_store_id', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->addedColumns['iso_store_id'] = $column;

        $sql = array_merge(
            $sql,
            $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff),
            array(
                "UPDATE tl_page SET iso_store_id=(SELECT store_id FROM tl_iso_config WHERE fallback='1') WHERE type='root'",
                "UPDATE tl_page p SET iso_store_id=(SELECT store_id FROM tl_iso_config c WHERE c.id=p.iso_config) WHERE type='root'"
            )
        );

        return $sql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $this->convertAddressFields();
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyIntegrity()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_config')
            ->columnMustExist('tl_iso_config', 'id')
            ->columnMustExist('tl_iso_config', 'billing_fields')
            ->columnMustExist('tl_iso_config', 'shipping_fields')
            ->columnMustNotExist('tl_iso_config', 'address_fields')
            ->columnMustExist('tl_iso_config', 'store_id');

        $this->dbcheck
            ->tableMustExist('tl_page')
            ->columnMustNotExist('tl_page', 'iso_store_id');
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

                    $addressFields[$name] = array(
                        'name' => $name,
                        'billing' => $this->getFieldState($field),
                        'shipping' => 'disabled',
                        'position' => ($position * 10)
                    );
                }
            }

            if (is_array($shippingFields)) {
                foreach ($shippingFields as $position => $field) {
                    $name = $field['value'];

                    if (isset($addressFields[$name])) {
                        $addressFields[$name]['shipping'] = $this->getFieldState($field);
                    } else {
                        $addressFields[$name] = array(
                            'name' => $name,
                            'billing' => 'disabled',
                            'shipping' => $this->getFieldState($field),
                            'position' => ($position * 10 + 5)
                        );
                    }
                }
            }

            $this->db->update('tl_iso_config', array('address_fields' => serialize($addressFields)), array('id' => $configData['id']));
        }
    }

    private function getFieldState(array $field)
    {
        if (!$field['enabled']) {
            return 'disabled';
        } elseif ($field['mandatory']) {
            return 'mandatory';
        } else {
            return 'enabled';
        }
    }
}
