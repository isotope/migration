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


use Isotope\Migration\Provider\MigrationServiceProvider;
use Silex\Application;
use Symfony\Component\HttpFoundation\Session\Storage\MockArraySessionStorage;

abstract class SilexAwareTestCase extends \PHPUnit_Extensions_Database_TestCase
{
    /**
     * @return Application
     */
    public function getApp()
    {
        if (!isset($GLOBALS['SILEX_APP'])) {
            $app = new Application();
            $app['debug'] = true;

            $app['db.options'] = array(
                'dbname'   => $GLOBALS['DB_DBNAME'],
                'host'     => $GLOBALS['DB_HOST'],
                'user'     => $GLOBALS['DB_USER'],
                'password' => $GLOBALS['DB_PASSWD'],
                'charset'  => 'UTF8',
                'port'     => $GLOBALS['DB_PORT'],
            );

            $app->register(new MigrationServiceProvider());

            // enable testing the session
            $app['session.test'] = true;
            $app['session.storage.test'] = $app->share(function () {
                return new MockArraySessionStorage();
            });

            $app->boot();

            $GLOBALS['SILEX_APP'] = $app;
        }

        return $GLOBALS['SILEX_APP'];
    }
}