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
     * @return array
     */
    public function getMigratePathToUuidSQL($tableName, $columnName)
    {
        $sql = array();

        $values = $this->db->createQueryBuilder()
            ->add('select', 'd.' . $columnName)
            ->from($tableName, 'd')
            ->execute()
            ->fetchAll(\PDO::FETCH_COLUMN);

        foreach ($values as $path) {
            $uuid = $this->findByPath($path);
            $qb = $this->db->createQueryBuilder();
            $qb->update($tableName, 'd')
                ->set('d.' . $columnName, $uuid)
                ->where('d.' . $columnName .'=:path');
            $qb->setParameter(':path', $path);
            $sql[] = $qb->getSQL();
        }

        return $sql;
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