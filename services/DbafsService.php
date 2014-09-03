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


use Doctrine\DBAL\Connection;
use Doctrine\DBAL\Schema\Column;
use Doctrine\DBAL\Schema\ColumnDiff;
use Doctrine\DBAL\Schema\TableDiff;
use Doctrine\DBAL\Types\Type;

class DbafsService
{
    /**
     * @type Connection
     */
    protected $db;


    public function __construct(Connection $db)
    {
        $this->db = $db;
    }

    /**
     * Get migrate resource path to UUID SQL queries
     *
     * @param string $tableName
     * @param string $columnName
     *
     * @throws \PDOException
     */
    public function migratePathToUuid($tableName, $columnName)
    {
        $values = $this->db->createQueryBuilder()
            ->add('select', 'd.' . $columnName)
            ->from($tableName, 'd')
            ->execute()
            ->fetchAll(\PDO::FETCH_COLUMN);

        foreach ($values as $path) {
            $uuid = $this->findByPath($path);
            $qb = $this->db->createQueryBuilder();
            $qb->update($tableName, 'd')
                ->set('d.' . $columnName, ':uuid')
                ->where('d.' . $columnName .'=:path');
            $qb->setParameter(':uuid', $path);
            $qb->setParameter(':path', $path);
            $qb->execute();
        }
    }

    /**
     * Get SQL query for migrating a file path column to a column type
     * holding a binary UUID. We're using BLOB here because Doctrine does not
     * support BINARY(16), however Contao itself will automatically alter the
     * column to BINARY(16) when updating the database.
     *
     * @param string $tableName
     * @param string $columnName
     *
     * @return array
     */
    public function getMigrateFilePathForUuidSQL($tableName, $columnName)
    {

        // Add tl_iso_config.address_fields
        $tableDiff = new TableDiff($tableName);

        $oldColumn = $this->db->getSchemaManager()->listTableDetails($tableName)->getColumn($columnName);

        $newColumn = new Column($columnName, Type::getType(Type::BLOB));
        $newColumn->setLength(65535);

        $columnDiff = new ColumnDiff($columnName, $newColumn, array(), $oldColumn);

        $tableDiff->changedColumns[$columnName] = $columnDiff;

        return $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
    }

    /**
     * Finds a resource by path in the DBAFS and returns its UUID or null if not found
     *
     * @param string $path
     *
     * @return string
     */
    public function findByPath($path)
    {
        $stmt = $this->db->prepare("SELECT uuid FROM tl_files WHERE path=:path");
        $stmt->bindParam(':path', $path);
        $stmt->execute();
        return $stmt->fetch(\PDO::FETCH_COLUMN);
    }
} 