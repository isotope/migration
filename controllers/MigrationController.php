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
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class MigrationController
{

    protected $twig;
    protected $services;
    protected $request;
    protected $db;

    public function __construct(\Twig_Environment $twig, \Pimple $migration_services, Request $request, Connection $db)
    {
        $this->twig = $twig;
        $this->services = $migration_services;
        $this->request = $request;
        $this->db = $db;

        $twig->addGlobal('base_path', $request->getBasePath());
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
        $forwardToNext = false;

        foreach ($this->getServices() as $service) {
            if ($forwardToNext) {
                return new RedirectResponse($this->request->getBaseUrl() . '/config/'.$service->getSlug());

            } elseif ($slug == $service->getSlug()) {
                $this->twig->addGlobal('current_service', $service);

                $view = $service->renderConfigView($this->request);

                if ($this->request->isMethod('POST') && $this->request->request->get('continue') && $service->getStatus() == MigrationServiceInterface::STATUS_READY) {
                    $forwardToNext = true;
                    continue;
                }

                return $view;
            }
        }

        if ($forwardToNext) {
            return new RedirectResponse($this->request->getBaseUrl() . '/execute');
        } else {
            throw new NotFoundHttpException();
        }
    }

    public function executeAction()
    {
/*        foreach ($this->getServices() as $service) {
            if ($service->getStatus() != MigrationServiceInterface::STATUS_READY) {
                return new RedirectResponse($this->request->getBaseUrl() . '/config/'.$service->getSlug(), 303);
            }
        }*/

        $sql = array();
        $services = $this->getServices();

        foreach ($services as $service) {
            $sql = array_merge($sql, $service->getMigrationSQL());
        }

        foreach ($sql as $query) {
            $this->db->exec($query);
        }

        foreach ($services as $service) {
            $service->postMigration();
        }

        return $this->twig->render('execute.twig');
    }

    public function summaryAction()
    {
        $allMessages = array();
        $services = $this->getServices();

        foreach ($services as $service) {
            $serviceMessages = $service->getSummaryMessages();

            if (!empty($messages)) {
                $allMessages[] = array(
                    'title'    => $service->getName(),
                    'messages' => $serviceMessages
                );
            }
        }

        return $this->twig->render('summary.twig', array(
            'messages' => $allMessages
        ));
    }

    /**
     * Get an array of services from the storage container
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
}
