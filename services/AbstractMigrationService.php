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
use Doctrine\DBAL\Schema\Schema;
use Doctrine\DBAL\Types\Type;
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBagInterface;
use Symfony\Component\Translation\TranslatorInterface;

abstract class AbstractMigrationService implements MigrationServiceInterface
{

    /**
     * @type AttributeBagInterface
     */
    protected $config;

    /**
     * @type AttributeBagInterface
     */
    protected $summary;

    /**
     * @type \Twig_Environment
     */
    protected $twig;

    /**
     * @type TranslatorInterface
     */
    protected $translator;

    /**
     * @type Connection
     */
    protected $db;

    /**
     * @type DatabaseVerificationService
     */
    protected $dbcheck;


    public function __construct(AttributeBagInterface $config, AttributeBagInterface $summary, \Twig_Environment $twig, TranslatorInterface $translator, Connection $db, DatabaseVerificationService $migration_dbcheck)
    {
        $this->config = $config;
        $this->summary = $summary;
        $this->twig = $twig;
        $this->translator = $translator;
        $this->db = $db;
        $this->dbcheck = $migration_dbcheck;
    }

    /**
     * Return a list of to do's or messages for the summary page
     *
     * @return array
     */
    public function getSummaryMessages()
    {
        return array();
    }

    /**
     * Get URL slug for this migration step
     *
     * @return string
     */
    public static function getSlug()
    {
        $className = get_called_class();
        $className = substr($className, strrpos($className, '\\')+1);
        $className = str_replace('MigrationService', '', $className);

        return strtolower(ltrim(preg_replace('/([A-Z])/', '_$1', $className), '_'));
    }

    /**
     * Translate a string using the translator service
     *
     * @param string $string
     * @param array  $parameters
     *
     * @return string
     */
    protected function trans($string, array $parameters = array())
    {
        return $this->translator->trans($string, $parameters);
    }

    /**
     * Add a basic Contao table to given database schema
     *
     * @param string $name
     * @param Schema $schema
     * @param bool   $addPid
     *
     * @return \Doctrine\DBAL\Schema\Table
     */
    protected function createContaoTable($name, Schema $schema, $addPid = false)
    {
        $table = $schema->createTable($name);

        $table->addColumn('id', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'autoincrement'=>true));
        $table->setPrimaryKey(array('id'));

        if ($addPid) {
            $table->addColumn('pid', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
        }

        $table->addColumn('tstamp', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));

        return $table;
    }
}
