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
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

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
            if ($e instanceof NotFoundHttpException) {
                return new RedirectResponse($app['request_stack']->getCurrentRequest()->getBaseUrl());
            } else if ($e instanceof HttpException && $e->getStatusCode() == 501) {
                switch ($e->getCode()) {
                    case 403:
                        $context['reason'] = 'database';
                        break;

                    case 404:
                        $context['reason'] = 'contao';
                        break;
                }
            }

            return new Response(
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
