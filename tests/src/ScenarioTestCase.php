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

abstract class ScenarioTestCase extends DbTestCase
{
    abstract protected function getConfiguration();

    public function testScenario()
    {
        // @todo implement configuraiton
        $config = $this->getConfiguration();

        $queries = array();

        // Loop over all services
        $app = $this->getApp();
        foreach ($app['migration.services']->keys() as $key) {

            /** @var $service \Isotope\Migration\Service\MigrationServiceInterface*/
            $service = $app['migration.services'][$key];

            if ($service->getStatus() !== MigrationServiceInterface::STATUS_READY) {
                $this->fail('Migration service "' . $key . '" is not ready. Scenario cannot be completed!');
            }

            // @todo getMigrationSQL() should always return an array
            $queries = array_merge($queries, $service->getMigrationSQL() ?: array());
        }

        foreach ($queries as $query) {
            try {
                $this->getConnection()->getConnection()->query($query);
            } catch (\PDOException $e) {
                $this->fail('Query could not be executed! Error message: ' . $e->getMessage());
            }
        }

        $expectedDataset = $this->getExpectedMySQLXMLDataSet();
        $currentDataset = $this->getConnection()->createDataSet();

        $this->assertDataSetsEqual($expectedDataset, $currentDataset);
    }

    protected function getExpectedMySQLXMLDataSet()
    {
        $ref = new \ReflectionClass($this);
        $scenario = (int) preg_replace('/Scenario(\\d)Test/', '$1', $ref->getShortName());
        return $this->createMySQLXMLDataSet(
            $this->getPathToFixture('scenario' . $scenario . '.xml')
        );
    }
}