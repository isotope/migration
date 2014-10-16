<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

require_once __DIR__ . '/vendor/autoload.php';

$app = new Silex\Application();

//ini_set('error_reporting', E_ALL & ~E_NOTICE);
$app['debug'] = true;
$app['kernel.root_dir'] = __DIR__;

// Support PHAR
if (\Phar::running()) {
    $app['kernel.root_dir'] = \Phar::running(false);
}

$app->register(new \Isotope\Migration\Provider\ContaoServiceProvider(), array(
    'contao.root' => dirname($app['kernel.root_dir'])
));
$app->register(new \Isotope\Migration\Provider\MigrationServiceProvider());

// Display a nice error page in production mode
if (!$app['debug']) {
    $app->error(
        function (\Exception $e) use ($app) {

            /** @type Twig_Environment $twig */
            $twig = $app['twig'];
            $context = array(
                'base_path' => $app['request']->getBasePath(),
                'message'   => $e->getMessage(),
                'reason'    => 'unknown'
            );

            // Try to handle issues with Contao or database connection
            if ($e instanceof \Symfony\Component\HttpKernel\Exception\HttpException && $e->getStatusCode() == 501) {
                switch ($e->getCode()) {
                    case 403:
                        $context['reason'] = 'database';
                        break;

                    case 404:
                        $context['reason'] = 'contao';
                        break;
                }
            }

            return new Symfony\Component\HttpFoundation\Response(
                $twig->render('error.twig', $context),
                500
            );
        }
    );
}

$app->get('/', 'migration.controller:indexAction');
$app->get('/config/', 'migration.controller:configIntroAction');
$app->match('/config/{slug}', 'migration.controller:configAction');
$app->get('/execute', 'migration.controller:executeAction');
$app->get('/summary', 'migration.controller:summaryAction');

$app->run();