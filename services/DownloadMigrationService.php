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
        return $this->trans('service.download.service_name');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('service.download.service_description');
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
            $this->dbafs->getMigrateFilePathForUuidSQL('tl_iso_downloads', 'singleSRC'),
            $this->getProductSQL(),
            $this->renameTable('tl_iso_order_downloads', 'tl_iso_product_collection_download')
        );
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $this->dbafs->migratePathToUuid('tl_iso_download', 'singleSRC');
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyIntegrity()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_downloads')
            ->tableMustNotExist('tl_iso_download')
            ->columnMustExist('tl_iso_downloads', 'title')
            ->columnMustExist('tl_iso_downloads', 'description')
            ->columnMustExist('tl_iso_downloads', 'singleSRC')
            ->columnMustNotExist('tl_iso_downloads', 'published');

        $this->dbcheck
            ->tableMustExist('tl_iso_order_downloads')
            ->tableMustNotExist('tl_iso_product_collection_download');

        $this->dbcheck
            ->tableMustExist('tl_files')
            ->columnMustExist('tl_files', 'uuid')
            ->columnMustExist('tl_files', 'path');
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

        return $sql;
    }

    /**
     * {@inheritdoc}
     */
    public function getSummary()
    {
        $total = $this->db->fetchColumn("
            SELECT COUNT(*) AS total
            FROM tl_iso_download
            WHERE title!='' OR description!=''
        ");

        return $total > 0 ? $this->trans('service.download.summary') : '';
    }
}
