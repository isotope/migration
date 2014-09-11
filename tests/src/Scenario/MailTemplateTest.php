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
use PHPUnit_Extensions_Database_DataSet_FlatXmlDataSet;

class MailTemplateTest extends ScenarioTestCase
{

    public function testOrderStatus()
    {
        $this->prepareScenario('orderstatus.sql', $this->getDefaultServiceConfigs());

        $this->validateExpectation($this->createFlatXmlDataSet($this->getDataPath() . '/orderstatus.xml'));
    }


    private function validateExpectation(PHPUnit_Extensions_Database_DataSet_FlatXmlDataSet $expectedData)
    {
        $databaseTables = $this->getConnection()->getMetaData()->getTableNames();
        $testTables = $expectedData->getTableNames();

        if (in_array('tl_nc_gateway', $testTables)) {
            $this->assertContains('tl_nc_gateway', $databaseTables);
            $this->assertTablesEqual(
                $expectedData->getTable("tl_nc_gateway"),
                $this->getConnection()->createQueryTable(
                    'tl_nc_gateway',
                    "SELECT id, title, type FROM tl_nc_gateway"
                )
            );
        }

        if (in_array('tl_nc_notification', $testTables)) {
            $this->assertContains('tl_nc_notification', $databaseTables);
            $this->assertTablesEqual(
                $expectedData->getTable("tl_nc_notification"),
                $this->getConnection()->createQueryTable(
                    'tl_nc_notification',
                    "SELECT id, type, title FROM tl_nc_notification"
                )
            );
        }

        if (in_array('tl_nc_message', $testTables)) {
            $this->assertContains('tl_nc_message', $databaseTables);
            $this->assertTablesEqual(
                $expectedData->getTable("tl_nc_message"),
                $this->getConnection()->createQueryTable(
                    'tl_nc_message',
                    "SELECT id, pid, title, gateway, gateway_type, email_priority, email_template, published FROM tl_nc_message"
                )
            );
        }

        if (in_array('tl_nc_language', $testTables)) {
            $this->assertContains('tl_nc_language', $databaseTables);
            $this->assertTablesEqual(
                $expectedData->getTable("tl_nc_language"),
                $this->getConnection()->createQueryTable(
                    'tl_nc_language',
                    "SELECT id, pid, gateway_type, language, fallback, recipients, email_sender_name, email_sender_address, email_recipient_cc, email_recipient_bcc, email_subject, email_text, email_html, email_mode FROM tl_nc_language"
                )
            );
        }
    }
}