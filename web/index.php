<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

// web/index.php
require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();

//ini_set('error_reporting', E_ALL & ~E_NOTICE);
$app['debug'] = true;

$app->register(new \Isotope\Migration\Provider\MigrationServiceProvider());

$app->get('/', 'migration.controller:indexAction');
$app->get('/config/', 'migration.controller:configAction');
$app->match('/config/{slug}', 'migration.controller:configAction');
$app->get('/execute', 'migration.controller:executeAction');

$app->run();