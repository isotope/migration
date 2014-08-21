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
        // Empty table
        $pdo = $this->getConnection()->getConnection();
        $stmt = $pdo->prepare('SELECT table_name FROM information_schema.tables WHERE table_schema=:db');
        $stmt->bindParam(':db', $GLOBALS['DB_DBNAME']);

        $stmt->execute();
        $tables = $stmt->fetchAll(\PDO::FETCH_COLUMN);

        foreach ((array) $tables as $table) {
            $pdo->query('DROP TABLE IF EXISTS ' . $table);
        }

        // Insert scenario setup
        $pdo->query(
            file_get_contents($this->getScenarioPath() . '/initial.sql')
        );

        parent::setUp();
    }

    public function testScenario()
    {
        $config = $this->getConfiguration();
        $queries = array();
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

        // Collect SQL queries
        /** @var $service \Isotope\Migration\Service\MigrationServiceInterface*/
        foreach ($migrationServices as $service) {

            if ($service->getStatus() !== MigrationServiceInterface::STATUS_READY) {
                $this->fail('Migration service "' . $key . '" is not ready. Scenario cannot be completed!');
            }

            // @todo getMigrationSQL() should always return an array and not throw any exception?
            $queries = array_merge($queries, $service->getMigrationSQL() ?: array());
        }

        foreach ($queries as $query) {
            try {
                $this->getConnection()->getConnection()->query($query);
            } catch (\PDOException $e) {
                $this->fail('Query could not be executed! Error message: ' . $e->getMessage() . '. Query: ' . $query);
            }
        }

        $expectedDataset = $this->getExpectedMySQLXMLDataSet();
        $currentDataset = $this->getConnection()->createDataSet();

        $this->assertDataSetsEqual($expectedDataset, $currentDataset);
    }

    protected function getDataSet()
    {
        return new \PHPUnit_Extensions_Database_DataSet_DefaultDataSet();
        /*return $this->createMySQLXMLDataSet(
            $this->getScenarioPath() . '/initial.xml'
        );*/
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
        return $this->getPathToFixture('scenario' . $scenario);
    }
}