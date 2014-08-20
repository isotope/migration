<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Test;


use Symfony\Component\Yaml\Exception\RuntimeException;

class SilexAwareTestCase extends \PHPUnit_Extensions_Database_TestCase
{
    private $app = null;

    protected function getConnection()
    {
        throw new RuntimeException('getConnection() has to be implemented by child class!');
    }

    protected function getDataSet()
    {
        throw new RuntimeException('getDataSet() has to be implemented by child class!');
    }

    public function setUp()
    {
        $app = new \Silex\Application();
        $app['debug'] = true;
        $app['db.options'] = array(
            'dbname'   => $GLOBALS['DB_DBNAME'],
            'host'     => $GLOBALS['DB_HOST'],
            'user'     => $GLOBALS['DB_USER'],
            'password' => $GLOBALS['DB_PASSWD'],
            'charset'  => 'UTF8',
            'port'     => $GLOBALS['DB_PORT'],
        );

        $app->register(new \Isotope\Migration\Provider\MigrationServiceProvider());

        $app->boot();

        $this->app = $app;

        parent::setUp();
    }

    public function getApp()
    {
        return $this->app;
    }
} 