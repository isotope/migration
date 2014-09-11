<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Test;

use Isotope\Migration\Service\MigrationServiceInterface;
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBag;

abstract class ScenarioTestCase extends DbTestCase
{

    protected function prepareScenario(array $serviceConfigs)
    {
        // Insert scenario setup
        $pdo = $this->getConnection()->getConnection();
        $query = file_get_contents($this->getScenarioFile());
        $pdo->exec($query);

        $migrationServices = array();

        $app = $this->getApp();

        // Register config and then boot app
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

            $migrationServices[$slug] = $app['class_factory']->create($class, array(
                'summary'   => $summaryBag,
                'config'    => $configBag,
            ));
        }

        // Run migration queries
        $this->runMigrationQueries($migrationServices);

        // Run post migration queries
        $this->runPostMigration($migrationServices);
    }

    private function runMigrationQueries($migrationServices)
    {
        $queries = array();

        /** @var $service \Isotope\Migration\Service\MigrationServiceInterface*/
        foreach ($migrationServices as $key => $service) {

            if ($service->getStatus() !== MigrationServiceInterface::STATUS_READY) {
                $this->fail('Migration service "' . $key . '" is not ready. Scenario cannot be completed!');
            }
            $queries = array_merge($queries, $service->getMigrationSQL());
        }

        foreach ($queries as $query) {
            try {
                $this->getConnection()->getConnection()->query($query);
            } catch (\PDOException $e) {
                $this->fail('Query could not be executed! Error message: ' . $e->getMessage() . '. Query: ' . $query);
            }
        }
    }

    private function runPostMigration($migrationServices)
    {
        /** @var $service \Isotope\Migration\Service\MigrationServiceInterface*/
        foreach ($migrationServices as $key => $service) {
            try {
                $service->postMigration();
            } catch (\PDOException $e) {
                $this->fail('Post migration could not be executed! Error message: ' . $e->getMessage() . '. Service: ' . $key);
            }
        }
    }

    /**
     * Tell the unit test to use our actual DB for testing
     * Data is imported in the setUp() method
     *
     * @return \PHPUnit_Extensions_Database_DataSet_DefaultDataSet|void
     */
    protected function getDataSet()
    {
        return new \PHPUnit_Extensions_Database_DataSet_DefaultDataSet();
    }

    protected function getScenarioFile()
    {
        $className = get_called_class();
        $className = substr($className, strrpos($className, '\\')+1);
        $scenarioId = preg_replace('/(.+)Scenario(\d+)Test$/', '$2', $className);

        return $this->getPathToFixture('scenario'.$scenarioId.'.sql');
    }

    protected function getDataSetPath()
    {
        $className = get_called_class();
        $className = substr($className, strrpos($className, '\\')+1);
        $testName = preg_replace('/(.+)Scenario(\d+)Test$/', '$1', $className);

        return $this->getPathToFixture(strtolower(ltrim(preg_replace('/([A-Z])/', '_$1', $testName), '_')));
    }
}