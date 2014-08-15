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

        // TODO: finish implementation

        return $sql;
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @return bool
     */
    protected function verifyDatabase()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_producttypes')
            ->tableMustNotExist('tl_iso_producttype');

        // TODO: finish implementation
    }
}