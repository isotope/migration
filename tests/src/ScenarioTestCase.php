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
    abstract protected function getConfiguration();

    protected function setUp()
    {
        parent::setUp();

        // Insert scenario setup
        $pdo = $this->getConnection()->getConnection();
        $pdo->query(
            file_get_contents($this->getScenarioPath() . '/initial.sql')
        );
    }

    public function testScenario()
    {
        $config = $this->getConfiguration();
        $migrationServices = array();

        $app = $this->getApp();

        // Register config and then boot app
        foreach ($app['migration.service.classes']->keys() as $key) {
            $class = $app['migration.service.classes'][$key];
            $slug = $class::getSlug();

            // register config
            $configBag = new AttributeBag($slug);
            $configBag->setName($slug);

            if (isset($config[$slug])) {
                $configBag->initialize($config[$slug]);
            }

            $migrationServices[$slug] = $app['class_factory']->create($class, array('config' => $configBag));
        }

        // Boot app
        $app->boot();

        // Run migration queries
        $this->runMigrationQueries($migrationServices);

        // Run post migration queries
        $this->runPostMigrationQueries($migrationServices);

        // Assert data sets
        $this->assertDataSets();
    }

    private function runMigrationQueries($migrationServices)
    {
        $queries = array();

        /** @var $service \Isotope\Migration\Service\MigrationServiceInterface*/
        foreach ($migrationServices as $key => $service) {

            if ($service->getStatus() !== MigrationServiceInterface::STATUS_READY) {
                $this->fail('Migration service "' . $key . '" is not ready (migration). Scenario cannot be completed!');
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

    private function runPostMigrationQueries($migrationServices)
    {
        $queries = array();

        /** @var $service \Isotope\Migration\Service\MigrationServiceInterface*/
        foreach ($migrationServices as $key => $service) {
            try {
                $service->postMigration();
            } catch (\PException $e) {
                $this->fail('Post migration could not be executed! Error message: ' . $e->getMessage() . '. Service: ' . $key);
            }
        }
    }

    private function assertDataSets()
    {
        $expectedDataset = $this->getExpectedMySQLXMLDataSet();
        $currentDataset = $this->getConnection()->createDataSet();

        // Filter out data that should be compared such as timestamps etc.
        $expectedDataset = $this->filterDataset($expectedDataset);
        $currentDataset = $this->filterDataset($currentDataset);

        $this->assertDataSetsEqual($expectedDataset, $currentDataset);
    }

    private function filterDataset($dataSet)
    {
        $filteredDataSet = new \PHPUnit_Extensions_Database_DataSet_DataSetFilter($dataSet);
        $filteredDataSet->setExcludeColumnsForTable('tl_nc_gateway', array('tstamp'));
        return $filteredDataSet;
    }

    protected function getDataSet()
    {
        return new \PHPUnit_Extensions_Database_DataSet_DefaultDataSet();
    }

    protected function getExpectedMySQLXMLDataSet()
    {
        return $this->createMySQLXMLDataSet(
            $this->getScenarioPath() . '/expected.xml'
        );
    }

    protected function getScenarioPath()
    {
        $ref = new \ReflectionClass($this);
        $scenario = preg_replace('/Scenario(.+)Test/', '$1', $ref->getShortName());
        return $this->getPathToFixture('scenarios/scenario' . $scenario);
    }
}