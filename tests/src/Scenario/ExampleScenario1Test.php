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

use Isotope\Migration\Test\ScenarioTestCase;

/**
 * Class Scenario1Test
 *
 * This scenario tests some default settings
 *
 */
class ExampleScenario1Test extends ScenarioTestCase
{
    public function testScenario()
    {
        $this->prepareScenario(array(
            'mail_template' => array(
                'mailGateway' => 0
            )
        ));

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

    protected function getExpectedMySQLXMLDataSet()
    {
        return $this->createMySQLXMLDataSet(
            $this->getDataSetPath() . '/expected.xml'
        );
    }
}