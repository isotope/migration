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
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBagInterface;

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


    public function __construct(AttributeBagInterface $config, AttributeBagInterface $summary, \Twig_Environment $twig, Translator $translator, Connection $db, DatabaseVerificationService $migration_dbcheck)
    {
        $this->config = $config;
        $this->summary = $summary;
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
     * Return a list of to do's or messages for the summary page
     *
     * @return array
     */
    public function getSummaryMessages()
    {
        return array($this->trans('summary.nothingSpecialToDo'));
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