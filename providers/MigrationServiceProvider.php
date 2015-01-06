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


use Isotope\Migration\Service\ConstructorInjectionService;
use Isotope\Migration\Service\DatabaseVerificationService;
use Isotope\Migration\Service\DbafsService;
use Silex\Application;
use Silex\Provider\DoctrineServiceProvider;
use Silex\Provider\ServiceControllerServiceProvider;
use Silex\Provider\SessionServiceProvider;
use Silex\Provider\TranslationServiceProvider;
use Silex\Provider\TwigServiceProvider;
use Silex\ServiceProviderInterface;
use Silex\Translator;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBag;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class MigrationServiceProvider implements ServiceProviderInterface
{

    public function register(Application $app)
    {
        $app->register(new TranslationServiceProvider());
        $app['translator'] = $app->share($app->extend('translator', function(Translator $translator) use ($app) {
            $translator->addResource('array', include(__DIR__.'/../locales/en.php'), 'en');
            $translator->addResource('array', include(__DIR__.'/../locales/de.php'), 'de');

            return $translator;
        }));

        $app->register(new TwigServiceProvider(), array(
            'twig.path' => __DIR__.'/../views',
        ));

        $app->register(new DoctrineServiceProvider());
        $app->register(new ServiceControllerServiceProvider());
        $app->register(new SessionServiceProvider());

        $app['migration.dbcheck'] = $app->share(function() use ($app) {
            return new DatabaseVerificationService($app['db'], $app['translator']);
        });

        $app['migration.dbafs'] = $app->share(function() use ($app) {
            return new DbafsService($app['db']);
        });

        $app['class_factory'] = $app->share(function() use ($app) {
            return new ConstructorInjectionService($app);
        });

        $this->registerServices($app);
        $this->registerErrorHandler($app);
    }

    public function boot(Application $app)
    {
        $app['migration.controller'] = $app['class_factory']->share('\\Isotope\\Migration\\Controller\\MigrationController');
        $app['migration.services'] = new \Pimple();

        foreach ($app['migration.service.classes']->keys() as $slug) {
            $class = $app['migration.service.classes'][$slug];

            $configBag = new AttributeBag('config_' . $slug);
            $configBag->setName('config_' . $slug);
            $app['session']->registerBag($configBag);

            $app['migration.services'][$slug] = $app->share(
                function() use ($app, $slug, $class) {
                    $config = $app['session']->getBag('config_' . $slug);
                    return $app['class_factory']->create($class, array(
                        'config'    => $config
                    ));
                }
            );
        }
    }

    private function registerServices(Application $app)
    {
        $services = new \Pimple();

        /** @type \Isotope\Migration\Service\MigrationServiceInterface[] $serviceClasses */
        $serviceClasses = array(
            // this order DOES MATTER!!
            '\\Isotope\\Migration\\Service\\AddressBookMigrationService',
            '\\Isotope\\Migration\\Service\\AttributeMigrationService',
            '\\Isotope\\Migration\\Service\\ProductTypeMigrationService',
            '\\Isotope\\Migration\\Service\\ProductDataMigrationService',
            '\\Isotope\\Migration\\Service\\ProductCollectionMigrationService',

            '\\Isotope\\Migration\\Service\\FrontendModuleMigrationService',
            '\\Isotope\\Migration\\Service\\MailTemplateMigrationService',

            '\\Isotope\\Migration\\Service\\ShopConfigMigrationService',
            '\\Isotope\\Migration\\Service\\GalleryMigrationService',

            // here we don't know (yet) ;-)

            '\\Isotope\\Migration\\Service\\RelatedProductMigrationService',
            '\\Isotope\\Migration\\Service\\TranslationMigrationService',
            '\\Isotope\\Migration\\Service\\PaymentMethodMigrationService',
            '\\Isotope\\Migration\\Service\\ShippingMethodMigrationService',
            '\\Isotope\\Migration\\Service\\DownloadMigrationService',
            '\\Isotope\\Migration\\Service\\RuleMigrationService',
        );

        foreach ($serviceClasses as $class) {
            $slug = $class::getSlug();
            $services[$slug] = $class;
        }

        $app['migration.service.classes'] = $services;
    }

    private function registerErrorHandler(Application $app)
    {
        $app->error(
            function (\Exception $e) use ($app) {

                /** @type \Twig_Environment $twig */
                $twig = $app['twig'];
                $context = array(
                    'base_path' => $app['request']->getBasePath(),
                    'message'   => $e->getMessage(),
                    'reason'    => 'unknown'
                );

                // Try to handle issues with Contao or database connection
                if ($e instanceof NotFoundHttpException) {
                    return new RedirectResponse($app['request_stack']->getCurrentRequest()->getBaseUrl() . '/');
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
}
