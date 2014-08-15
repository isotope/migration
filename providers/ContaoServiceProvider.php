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

    function register(Application $app)
    {
        $app['contao.root'] = '';

        // Verify Contao installation
        $app->before(function() use ($app) {
            if (!$app['contao.ready']) {
                throw new HttpException(501, 'Contao was not found at "'.$app['contao.root'].'"');
            }
        });
    }

    function boot(Application $app)
    {
        $contaoFiles = array(
            'system/config/localconfig.php',
            'system/modules/core/library/Contao/Config.php',
        );

        foreach ($contaoFiles as $file) {
            if (!is_file($app['contao.root'] . '/' . $file)) {
                $app['contao.ready'] = false;
                return;
            }
        }

        define('TL_ROOT', $app['contao.root']);

        require_once TL_ROOT . '/system/modules/core/library/Contao/Config.php';

        \Contao\Config::preload();

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