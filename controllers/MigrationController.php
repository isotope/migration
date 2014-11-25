<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Controller;


use Doctrine\DBAL\Connection;
use Isotope\Migration\Service\MigrationServiceInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class MigrationController
{

    private $twig;
    private $services;
    private $requestStack;
    private $db;
    private $session;

    public function __construct(\Twig_Environment $twig, \Pimple $migration_services, RequestStack $request_stack, Connection $db, Session $session)
    {
        $this->twig = $twig;
        $this->services = $migration_services;
        $this->requestStack = $request_stack;
        $this->db = $db;
        $this->session = $session;

        $request = $request_stack->getCurrentRequest();
        $pharPath = \Phar::running() ? '/'.basename(\Phar::running()) : '';

        $twig->addGlobal('base_path', $request->getBasePath() . $pharPath);
        $twig->addGlobal('base_url', $request->getBaseUrl());
        $twig->addGlobal('services', $this->getServices());
        $twig->addGlobal('current_service', false);
        $twig->addGlobal('navigation_index', ($request->getPathInfo() == '/'));
        $twig->addGlobal('navigation_config', (strpos($request->getPathInfo(), '/config') === 0));
        $twig->addGlobal('navigation_execute', ($request->getPathInfo() == '/execute'));
        $twig->addGlobal('navigation_summary', ($request->getPathInfo() == '/summary'));
    }

    public function indexAction()
    {
        return $this->twig->render('index.twig');
    }

    public function configIntroAction()
    {
        $services = $this->getServices();

        return $this->twig->render(
            'config_intro.twig',
            array(
                'continue' => $services[0]->getSlug()
            )
        );
    }

    public function configAction($slug)
    {
        foreach ($this->getServices() as $service) {
            if ($slug == $service->getSlug()) {
                $this->twig->addGlobal('current_service', $service);

                $view = $service->renderConfigView($this->requestStack);
                $request = $this->requestStack->getCurrentRequest();

                if ($request->isMethod('POST')) {
                    if ($request->request->get('continue')
                        && $service->getStatus() == MigrationServiceInterface::STATUS_READY
                    ) {
                        return $this->goToNext($service->getSlug());
                    } elseif ($request->request->get('back')) {
                        return $this->goToPrevious($service->getSlug());
                    }
                }

                return $view;
            }
        }

        throw new NotFoundHttpException();
    }

    /**
     * Render the execution screen
     *
     * @return string
     * @throws \Doctrine\DBAL\DBALException
     */
    public function executeAction()
    {
        $sql = array();
        $hasError = false;
        $services = $this->getServices();
        $request = $this->requestStack->getCurrentRequest();

        foreach ($services as $service) {
            if ($service->getStatus() != MigrationServiceInterface::STATUS_READY) {
                $hasError = true;
                break;
                //return new RedirectResponse($this->requestStack->getCurrentRequest()->getBaseUrl() . '/config/' . $service->getSlug(), 303);
            }

            $sql = array_merge($sql, $service->getMigrationSQL());
        }

        if (!$hasError && $request->isMethod('POST')) {
            if ($request->get('cancel') !== null) {
                $this->session->invalidate();
                return new RedirectResponse($request->getBaseUrl() . '/', 303);
            }

            foreach ($sql as $query) {
                $this->db->exec($query);
            }

            foreach ($services as $service) {
                $service->postMigration();
            }

            return new RedirectResponse($request->getBaseUrl() . '/summary', 303);
        }

        return $this->twig->render(
            'execute.twig',
            array(
                'error' => $hasError
            )
        );
    }

    public function summaryAction()
    {
        $allMessages = array();
        $services = $this->getServices();

        foreach ($services as $service) {
            $summary = $service->getSummary();

            if ($summary != '') {
                $allMessages[] = array(
                    'title'   => $service->getName(),
                    'message' => $summary
                );
            }
        }

        return $this->twig->render('summary.twig', array(
            'messages' => $allMessages
        ));
    }

    /**
     * Get an array of services from the storage container
     *
     * @return MigrationServiceInterface[]
     */
    protected function getServices()
    {
        $services = array();

        foreach ($this->services->keys() as $name) {
            $service = $this->services[$name];

            if (!($service instanceof MigrationServiceInterface)) {
                throw new \LogicException('Migration services must implement MigrationServiceInterface');
            }

            $services[] = $service;
        }

        return $services;
    }

    /**
     * Redirect to next service or the execution step
     *
     * @param string $currentService
     *
     * @return RedirectResponse
     */
    private function goToNext($currentService)
    {
        $keys = $this->services->keys();
        $pos = array_search($currentService, $keys);
        $max = max(array_keys($keys));

        if ($pos === false || $pos === $max) {
            return new RedirectResponse($this->requestStack->getCurrentRequest()->getBaseUrl() . '/execute');
        } else {
            return new RedirectResponse($this->requestStack->getCurrentRequest()->getBaseUrl() . '/config/' . $this->services[$keys[$pos+1]]->getSlug());
        }
    }

    /**
     * Redirect to previous service or the config overview
     *
     * @param string $currentService
     *
     * @return RedirectResponse
     */
    private function goToPrevious($currentService)
    {
        $keys = $this->services->keys();
        $pos = array_search($currentService, $keys);

        if ($pos === false || $pos === 0) {
            return new RedirectResponse($this->requestStack->getCurrentRequest()->getBaseUrl() . '/config');
        } else {
            return new RedirectResponse($this->requestStack->getCurrentRequest()->getBaseUrl() . '/config/' . $this->services[$keys[$pos-1]]->getSlug());
        }
    }
}
