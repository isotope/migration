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
use Silex\Translator;

abstract class AbstractMigrationService implements MigrationServiceInterface
{

    /**
     * @type \Twig_Environment
     */
    protected $twig;

    /**
     * @type Translator
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


    public function __construct(\Twig_Environment $twig, Translator $translator, Connection $db, DatabaseVerificationService $migration_dbcheck)
    {
        $this->twig = $twig;
        $this->translator = $translator;
        $this->db = $db;
        $this->dbcheck = $migration_dbcheck;
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
     * Get URL slug for this migration step
     *
     * @return string
     */
    public static function getSlug()
    {
        $className = get_called_class();
        $className = substr($className, strrpos($className, '\\')+1);
        $className = str_replace('MigrationService', '', $className);

        return strtolower(ltrim(preg_replace('/([A-Z])/', '-$1', $className), '-'));
    }
} 