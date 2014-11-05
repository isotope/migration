<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Test\Scenario;


use Isotope\Migration\Service\MigrationServiceInterface;
use Isotope\Migration\Test\SilexAwareTestCase;
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBag;

class MigrationStepInterfaceTest extends SilexAwareTestCase
{

    public function testUniqueSlug()
    {
        $slugs = array();
        $app = $this->getApp();

        foreach ($app['migration.service.classes']->keys() as $key) {

            /** @type MigrationServiceInterface $class */
            $class = $app['migration.service.classes'][$key];
            $slug = $class::getSlug();

            $this->assertNotContains($slug, $slugs);
            $slugs[] = $slug;
        }
    }

    public function testNameNotEmpty()
    {
        foreach ($this->getServices() as $service) {
            $this->assertNotEmpty($service->getName(), $service->getSlug());
        }
    }

    public function testDescriptionNotEmpty()
    {
        foreach ($this->getServices() as $service) {
            $this->assertNotEmpty($service->getDescription(), $service->getSlug());
        }
    }

    /**
     * @return MigrationServiceInterface[]
     */
    private function getServices()
    {
        $app = $this->getApp();
        $services = array();

        foreach ($app['migration.service.classes']->keys() as $key) {

            /** @type MigrationServiceInterface $class */
            $class = $app['migration.service.classes'][$key];
            $slug = $class::getSlug();

            // register config
            $configBag = new AttributeBag('config_' . $slug);
            $configBag->setName('config_' . $slug);

            if (isset($serviceConfigs[$slug])) {
                $configBag->initialize($serviceConfigs[$slug]);
            }

            // summary
            $summaryBag = new AttributeBag('summary_' . $slug);
            $summaryBag->setName('summary_' . $slug);

            $services[] = $app['class_factory']->create(
                $class,
                array(
                    'summary'   => $summaryBag,
                    'config'    => $configBag,
                )
            );
        }

        return $services;
    }
}