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

class OldTablesTest extends ScenarioTestCase
{

    public function testEmptyTables()
    {
        $this->prepareScenario('empty.sql', $this->getDefaultServiceConfigs());

        $tables = $this->getConnection()->getConnection()->query('SHOW TABLES')->fetchAll(\PDO::FETCH_COLUMN);

        static::assertNotContains('tl_iso_products', $tables);
        static::assertNotContains('tl_iso_producttypes', $tables);
        static::assertNotContains('tl_iso_prices', $tables);
        static::assertNotContains('tl_iso_price_tiers', $tables);
        static::assertNotContains('tl_iso_product_categories', $tables);
        static::assertNotContains('tl_iso_related_categories', $tables);
        static::assertNotContains('tl_iso_related_products', $tables);
        static::assertNotContains('tl_iso_labels', $tables);
        static::assertNotContains('tl_iso_groups', $tables);
        static::assertNotContains('tl_iso_rules', $tables);
        static::assertNotContains('tl_iso_rule_restrictions', $tables);
        static::assertNotContains('tl_iso_downloads', $tables);
        static::assertNotContains('tl_iso_attributes', $tables);
        static::assertNotContains('tl_iso_addresses', $tables);
        static::assertNotContains('tl_iso_payment_modules', $tables);
        static::assertNotContains('tl_iso_shipping_modules', $tables);
        static::assertNotContains('tl_iso_orders', $tables);
        static::assertNotContains('tl_iso_order_items', $tables);
        static::assertNotContains('tl_iso_cart', $tables);
        static::assertNotContains('tl_iso_cart_items', $tables);
        static::assertNotContains('tl_iso_mail', $tables);
        static::assertNotContains('tl_iso_mail_content', $tables);
    }
}
