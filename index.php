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
use Symfony\Component\HttpFoundation\Request;

require_once __DIR__ . '/vendor/autoload.php';

$app = new Silex\Application();
$app['kernel.root_dir'] = __DIR__;

// Support PHAR
if (\Phar::running()) {
    $app['kernel.root_dir'] = \Phar::running(false);
}

$app->register(new ContaoServiceProvider(), array(
    'contao.root' => dirname($app['kernel.root_dir'])
));
$app->register(new MigrationServiceProvider());

$app->before(function (Request $request) use ($app) {
    $app['translator']->setLocale($request->getPreferredLanguage(array('en', 'de')));
});

$app->get('/', 'migration.controller:indexAction');
$app->get('/config/', 'migration.controller:configIntroAction');
$app->match('/config/{slug}', 'migration.controller:configAction');
$app->match('/execute', 'migration.controller:executeAction');
$app->get('/summary', 'migration.controller:summaryAction');

$app->run();
