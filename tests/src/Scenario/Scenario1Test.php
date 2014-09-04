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
class Scenario1Test extends ScenarioTestCase
{
    protected function getConfiguration()
    {
        return array(
            'mail_template' => array(
                'mailGateway'   => 0
            )
        );
    }
} 