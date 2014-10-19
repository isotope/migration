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

class TranslationMigrationService extends AbstractConfigfreeMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Translations');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates translation labels.');
    }

    /**
     * Get SQL commands to migration the database
     *
     * @return array
     */
    public function getMigrationSQL()
    {
        $this->checkMigrationStatus();

        if ($this->dbcheck->tableExists('tl_iso_labels')) {
            $tableDiff = new TableDiff('tl_iso_labels');
            $tableDiff->newName = 'tl_iso_label';

            return $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
        }

        return array();
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        // nothing to do here
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyDatabase()
    {
        if ($this->dbcheck->tableExists('tl_iso_labels')) {
            $this->dbcheck->tableMustNotExist('tl_iso_label');
        }
    }
}
