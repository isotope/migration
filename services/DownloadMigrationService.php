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

class DownloadMigrationService extends AbstractConfigfreeMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Downloads');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates product downloads and updates orders with downloads.');
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

        // TODO: migrate tl_iso_download.singleSRC from path to UUID
        // TODO: title and description fields are now in the file manager

        return array_merge(
            $this->getProductSQL(),
            $this->getCollectionSQL()
        );
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyDatabase()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_downloads')
            ->tableMustNotExist('tl_iso_download')
            ->columnMustNotExist('tl_iso_downloads', 'published');

        $this->dbcheck
            ->tableMustExist('tl_iso_order_downloads')
            ->tableMustNotExist('tl_iso_product_collection_download');

        // TODO: finish implementation
    }

    /**
     * @return array
     */
    private function getProductSQL()
    {
        $tableDiff = new TableDiff('tl_iso_downloads');
        $tableDiff->newName = 'tl_iso_download';

        $column = new Column('published', Type::getType(Type::STRING));
        $column->setFixed(true)->setLength(1)->setNotnull(true)->setDefault('');
        $tableDiff->addedColumns['published'] = $column;

        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
        $sql[] = "UPDATE tl_iso_download SET published='1'";

        // TODO: finish implementation

        return $sql;
    }

    /**
     * @return array
     */
    private function getCollectionSQL()
    {
        $tableDiff = new TableDiff('tl_iso_order_downloads');
        $tableDiff->newName = 'tl_iso_product_collection_download';

        // TODO: finish implementation

        return $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
    }
}