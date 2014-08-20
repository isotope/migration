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

class ProductTypeMigrationService extends AbstractConfigfreeMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Product type');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates product types');
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

        $tableDiff = new TableDiff('tl_iso_producttypes');
        $tableDiff->newName = 'tl_iso_producttype';
        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);

        return $sql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $productTypes = $this->db->fetchAll("SELECT id, attributes, variant_attributes FROM tl_iso_attribute");

        foreach ($productTypes as $type) {
            $attributes = @unserialize($type['attributes']);
            $variantAttributes = @unserialize($type['variant_attributes']);

            $attributes = is_array($attributes) ? serialize($this->convertAttributes($attributes)) : '';
            $variantAttributes = is_array($variantAttributes) ? serialize($this->convertAttributes($variantAttributes)) : '';

            $this->db->update(
                'tl_iso_attribute',
                array(
                    'attributes'         => $attributes,
                    'variant_attributes' => $variantAttributes),
                array(
                    'id' => $type['id']
                )
            );
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
            ->tableMustExist('tl_iso_producttypes')
            ->tableMustNotExist('tl_iso_producttype')
            ->columnMustExist('tl_iso_producttypes', 'attributes')
            ->columnMustExist('tl_iso_producttypes', 'variant_attributes');
    }


    private function convertAttributes(array $oldData)
    {
        $newData = array();

        foreach ($oldData as $name => $config) {
            $newData[$name] = array(
                'enabled'   => $config['enabled'],
                'name'      => $name,
                'legend'    => '', // TODO: load legend from DCA/attributes table
                'tl_class'  => '', // TODO: load tl_class from DCA/attributes table
                'mandatory' => '', // TODO: load mandatory-ness from DCA/attributes table
                'position'  => $config['position']
            );
        }

        return $newData;
    }
}