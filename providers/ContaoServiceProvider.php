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
        $config = (array) $GLOBALS['TL_CONFIG'];

        $app['contao.ready'] = true;
        $app['contao.config'] = $config;

        $this->normalizeConfig($config);

        $app['db.options'] = array(
            'dbname'   => $config['dbDatabase'],
            'host'     => $config['dbHost'],
            'user'     => $config['dbUser'],
            'password' => $config['dbPass'],
            'charset'  => $config['dbCharset'],
            'port'     => $config['dbPort'],
        );
    }


    /**
     * @param array $config
     */
    private function normalizeConfig(array &$config)
    {
        foreach (array('dbDatabase', 'dbHost', 'dbUser', 'dbPass', 'dbCharset', 'dbPort') as $key) {
            if (!isset($config[$key])) {
                $config[$key] = '';
            }
        }
    }
}
