<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Provider;


use Silex\Application;
use Silex\ServiceProviderInterface;
use Symfony\Component\HttpKernel\Exception\HttpException;

class ContaoServiceProvider implements ServiceProviderInterface
{

    public function register(Application $app)
    {
        $app['contao.root'] = '';

        // Verify Contao installation
        $app->before(function() use ($app) {
            if (!$app['contao.ready']) {
                throw new HttpException(501, 'Contao was not found at "'.$app['contao.root'].'"');
            }
        });
    }

    public function boot(Application $app)
    {
        if (!is_file($app['contao.root'] . '/system/config/localconfig.php')) {
            $app['contao.ready'] = false;
            return;
        }

        define('TL_ROOT', $app['contao.root']);

        require_once TL_ROOT . '/system/config/localconfig.php';

        $app['contao.ready'] = true;
        $app['contao.config'] = $GLOBALS['TL_CONFIG'];

        $app['db.options'] = array(
            'dbname'   => $app['contao.config']['dbDatabase'],
            'host'     => $app['contao.config']['dbHost'],
            'user'     => $app['contao.config']['dbUser'],
            'password' => $app['contao.config']['dbPass'],
            'charset'  => $app['contao.config']['dbCharset'],
            'port'     => $app['contao.config']['dbPort'],
        );
    }
} 