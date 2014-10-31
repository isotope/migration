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
     * Check if a table column exists
     *
     * @param string $tableName
     * @param string $columnName
     *
     * @return bool
     */
    public function columnExists($tableName, $columnName)
    {
        if (!$this->tableExists($tableName)) {
            return false;
        }

        $columns = $this->schemaManager()->listTableColumns($tableName);

        foreach ($columns as $column) {
            if ($column->getName() == $columnName) {
                return true;
            }
        }

        return false;
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
            $this->exception('error.tableNotFound', $tableName);
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
            $this->exception('error.tableFound', $tableName);
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

        $this->exception('error.columnNotFound', $tableName, $columnName);

        return $this;
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
                $this->exception('error.columnFound', $tableName, $columnName);
            }
        }

        return $this;
    }

    /**
     * Check if a table is empty (contains no records)
     *
     * @param string $tableName
     *
     * @return bool
     */
    public function tableIsEmpty($tableName)
    {
        return $this->db->fetchColumn("SELECT COUNT(*) FROM $tableName") === '0';
    }

    /**
     * @return \Doctrine\DBAL\Schema\AbstractSchemaManager
     */
    private function schemaManager()
    {
        return $this->db->getSchemaManager();
    }

    /**
     * @param string $message
     * @param string $table
     * @param string $column
     */
    private function exception($message, $table, $column = '')
    {
        throw new \RuntimeException(
            $this->translator->trans(
                $message,
                array(
                    '%table%'  => $table,
                    '%column%' => $column
                )
            )
        );
    }
}
