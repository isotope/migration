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
        $app->before(
            function() use ($app) {
                if (!$app['contao.ready']) {
                    throw new HttpException(501, 'Contao was not found at "'.$app['contao.root'].'"', null, array(), 404);
                }

                $dbError = false;

                try {
                    /** @type \Doctrine\DBAL\Connection $db */
                    $db = $app['db'];

                    if ((!$db->connect() && !$db->isConnected()) || $db->getDatabase() === null) {
                        $dbError = true;
                    }
                } catch (\Exception $e) {
                    $dbError = true;
                }

                if ($dbError) {
                    throw new HttpException(501, 'Database connection failed', null, array(), 403);
                }
            }
        );
    }

    public function boot(Application $app)
    {
        if (!is_file($app['contao.root'] . '/system/config/localconfig.php')) {
            $app['contao.ready'] = false;
            return;
        }

        require_once $app['contao.root'] . '/system/config/localconfig.php';

        $app['contao.ready'] = true;
        $app['contao.config'] = (array) $GLOBALS['TL_CONFIG'];

        $this->normalizeConfig($app['contao.config']);

        $app['db.options'] = array(
            'dbname'   => $app['contao.config']['dbDatabase'],
            'host'     => $app['contao.config']['dbHost'],
            'user'     => $app['contao.config']['dbUser'],
            'password' => $app['contao.config']['dbPass'],
            'charset'  => $app['contao.config']['dbCharset'],
            'port'     => $app['contao.config']['dbPort'],
        );
    }


    private function normalizeConfig(&$config)
    {
        foreach (array('dbDatabase', 'dbHost', 'dbUser', 'dbPass', 'dbCharset', 'dbPort') as $key) {
            if (!isset($config[$key])) {
                $config[$key] = '';
            }
        }
    }
}
