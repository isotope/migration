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

class AddressBookMigrationService extends AbstractConfigfreeMigrationService
{
    /**
     * Migration status code
     * @type int
     */
    protected $status = null;


    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Address Book');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates the member address book');
    }

    /**
     * Get SQL commands to migration the database
     *
     * @return array
     */
    public function getMigrationSQL()
    {
        $tableDiff = new TableDiff('tl_iso_addresses');
        $tableDiff->newName = 'tl_iso_address';

        $column = new Column('ptable', Type::getType(Type::STRING));
        $column->setLength(255)->setNotnull(true)->setDefault('');
        $tableDiff->addedColumns['ptable'] = $column;

        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
        $sql[] = "UPDATE tl_iso_address SET ptable='tl_member'";

        return $sql;
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
        $this->dbcheck
            ->tableMustExist('tl_iso_addresses')
            ->tableMustNotExist('tl_iso_address')
            ->columnMustNotExist('tl_iso_addresses', 'ptable');
    }
}