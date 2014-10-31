<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

use Isotope\Migration\Provider\ContaoServiceProvider;
use Isotope\Migration\Provider\MigrationServiceProvider;

require_once __DIR__ . '/vendor/autoload.php';

$app = new Silex\Application();
$app['kernel.root_dir'] = __DIR__;

$app['debug'] = true; // TODO: disable debug mode for stable version

// Support PHAR
if (\Phar::running()) {
    $app['kernel.root_dir'] = \Phar::running(false);
}

$app->register(new ContaoServiceProvider(), array(
    'contao.root' => dirname($app['kernel.root_dir'])
));
$app->register(new MigrationServiceProvider());

$app->get('/', 'migration.controller:indexAction');
$app->get('/config/', 'migration.controller:configIntroAction');
$app->match('/config/{slug}', 'migration.controller:configAction');
$app->get('/execute', 'migration.controller:executeAction');
$app->get('/summary', 'migration.controller:summaryAction');

$app->run();
