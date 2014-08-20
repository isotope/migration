<?php
/**
 * Created by PhpStorm.
 * User: aschempp
 * Date: 14.08.14
 * Time: 17:58
 */

namespace Isotope\Migration\Service;


use Doctrine\DBAL\Connection;
use Silex\Translator;

class DatabaseVerificationService
{
    /**
     * @type Connection
     */
    protected $db;

    /**
     * @type Translator
     */
    protected $translator;


    public function __construct(Connection $db, Translator $translator)
    {
        $this->db = $db;
        $this->translator = $translator;
    }

    /**
     * Check if a table exists in the database
     *
     * @param string $tableName
     *
     * @return bool
     */
    public function tableExists($tableName)
    {
        return $this->schemaManager()->tablesExist(array($tableName));
    }

    /**
     * Make sure a database table exists
     *
     * @param string $tableName
     *
     * @return $this
     */
    public function tableMustExist($tableName)
    {
        if (!$this->schemaManager()->tablesExist(array($tableName))) {
            throw new \RuntimeException(
                $this->translator->trans(
                    'error.tableNotFound',
                    array(
                        '%table%' => $tableName
                    )
                )
            );
        }

        return $this;
    }

    /**
     * Make sure a database table does not exists
     *
     * @param string $tableName
     *
     * @return $this
     */
    public function tableMustNotExist($tableName)
    {
        if ($this->schemaManager()->tablesExist(array($tableName))) {
            throw new \RuntimeException(
                $this->translator->trans(
                    'error.tableFound',
                    array(
                        '%table%' => $tableName
                    )
                )
            );
        }

        return $this;
    }

    /**
     * Make sure a database table column exists
     *
     * @param string $tableName
     * @param string $columnName
     *
     * @return $this
     */
    public function columnMustExist($tableName, $columnName)
    {
        $columns = $this->schemaManager()->listTableColumns($tableName);

        foreach ($columns as $column) {
            if ($column->getName() == $columnName) {
                return $this;
            }
        }

        throw new \RuntimeException(
            $this->translator->trans(
                'error.columnNotFound',
                array(
                    '%table%' => $tableName,
                    '%column%' => $columnName
                )
            )
        );
    }

    /**
     * Make sure a database table column does not exist
     *
     * @param string $tableName
     * @param string $columnName
     *
     * @return $this
     */
    public function columnMustNotExist($tableName, $columnName)
    {
        $columns = $this->schemaManager()->listTableColumns($tableName);

        foreach ($columns as $column) {
            if ($column->getName() == $columnName) {
                throw new \RuntimeException(
                    $this->translator->trans(
                        'error.columnFound',
                        array(
                            '%table%'  => $tableName,
                            '%column%' => $columnName
                        )
                    )
                );
            }
        }

        return $this;
    }

    /**
     * @return \Doctrine\DBAL\Schema\AbstractSchemaManager
     */
    private function schemaManager()
    {
        return $this->db->getSchemaManager();
    }
} 