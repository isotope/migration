<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Service;


use Doctrine\DBAL\Schema\Column;
use Doctrine\DBAL\Schema\TableDiff;
use Doctrine\DBAL\Types\Type;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ShippingMethodMigrationService extends AbstractMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Shipping Methods');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates shipping methods.');
    }

    /**
     * Returns status code of the migration step
     *
     * @return int
     */
    public function getStatus()
    {
        try {
            $this->verifyDatabase();
        } catch (\RuntimeException $e) {
            return MigrationServiceInterface::STATUS_ERROR;
        }

        // Nothing to do
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_shipping_modules") === '0') {
            return MigrationServiceInterface::STATUS_READY;
        }

        $totalMethods = $this->db->fetchColumn("
            SELECT COUNT(*) AS total
            FROM tl_iso_shipping_modules
            WHERE type NOT IN ('', 'flat', 'order_total', 'weight_total')
        ");

        if ($totalMethods > 0 && !$this->config->get('confirmed')) {
            return MigrationServiceInterface::STATUS_CONFIG;
        }

        return MigrationServiceInterface::STATUS_READY;
    }

    /**
     * Returns the view for step configuration or information
     *
     * @param Request $request
     *
     * @return string|Response
     */
    public function renderConfigView(Request $request)
    {
        try {
            $this->verifyDatabase();
        } catch (\RuntimeException $e) {
            return $this->twig->render(
                'config_error.twig',
                array(
                    'title'       => $this->getName(),
                    'description' => $this->getDescription(),
                    'error'       => $e->getMessage(),
                )
            );
        }

        $oldMethods = $this->db->fetchAll("
            SELECT id, name, type
            FROM tl_iso_shipping_modules
            WHERE type='ups' OR type='usps'
        ");

        $unknownMethods = $this->db->fetchAll("
            SELECT id, name, type
            FROM tl_iso_shipping_modules
            WHERE type NOT IN ('', 'flat', 'order_total', 'weight_total', 'ups', 'usps')
        ");

        if (empty($oldMethods) && empty($unknownMethods)) {
            return $this->twig->render(
                'config_ready.twig',
                array(
                    'title'        => $this->getName(),
                    'description'  => $this->getDescription(),
                    'message'      => $this->trans('confirm.configfree'),
                    'can_continue' => true
                )
            );
        }

        if ($request->isMethod('POST') && $request->get('confirm') !== null) {
            $this->config->set('confirmed', (bool) $request->get('confirm'));
        }

        return $this->twig->render(
            'shipping_method.twig',
            array(
                'title'           => $this->getName(),
                'description'     => $this->getDescription(),
                'can_save'        => true,
                'old_methods'     => $oldMethods,
                'unknown_methods' => $unknownMethods,
                'confirmed'       => (bool) $this->config->get('confirmed')
            )
        );
    }

    /**
     * Get SQL commands to migration the database
     *
     * @return array
     */
    public function getMigrationSQL()
    {
        if ($this->getStatus() != MigrationServiceInterface::STATUS_READY) {
            throw new \BadMethodCallException('Migration service is not ready');
        }

        $tableDiff = new TableDiff('tl_iso_shipping_modules');
        $tableDiff->newName = 'tl_iso_shipping';

        $column = new Column('minimum_weight', Type::getType(Type::STRING));
        $column->setNotnull(true)->setDefault('');
        $tableDiff->addedColumns['minimum_weight'] = $column;

        $column = new Column('maximum_weight', Type::getType(Type::STRING));
        $column->setNotnull(true)->setDefault('');
        $tableDiff->addedColumns['maximum_weight'] = $column;

        $column = new Column('group_methods', Type::getType(Type::BLOB));
        $column->setLength(65535);
        $tableDiff->addedColumns['group_methods'] = $column;

        $column = new Column('group_calculation', Type::getType(Type::STRING));
        $column->setLength(10)->setNotnull(true)->setDefault('');
        $tableDiff->addedColumns['group_calculation'] = $column;

        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);

        return $sql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $methods = $this->db->fetchAll("SELECT * FROM tl_iso_shipping WHERE type='order_total' OR type='weight_total'");

        foreach ($methods as $shipping) {
            if ($shipping['type'] == 'order_total') {
                $options = $this->db->fetchAll(
                    "SELECT * FROM tl_iso_shipping_options WHERE pid=? ORDER BY minimum_total ASC, maximum_total ASC",
                    array($shipping['id'])
                );

                $this->convertShippingOptions(
                    $options,
                    $shipping,
                    function ($data, $option) {
                        $data['minimum_total'] = $option['minimum_total'];
                        $data['maximum_total'] = $option['maximum_total'];

                        return $data;
                    }
                );

            } elseif ($shipping['type'] == 'weight_total') {
                $options = $this->db->fetchAll(
                    "SELECT * FROM tl_iso_shipping_options WHERE pid=? ORDER BY weight_from ASC, weight_to ASC",
                    array($shipping['id'])
                );

                $this->convertShippingOptions(
                    $options,
                    $shipping,
                    function($data, $option) use ($shipping) {
                        $data['minimum_weight'] = serialize(array('unit'=>$shipping['weight_unit'], 'value'=>$option['weight_from']));
                        $data['maximum_weight'] = serialize(array('unit'=>$shipping['weight_unit'], 'value'=>$option['weight_to']));

                        return $data;
                    }
                );
            }
        }
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    private function verifyDatabase()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_shipping_modules')
            ->tableMustNotExist('tl_iso_shipping')
            ->columnMustExist('tl_iso_shipping_modules', 'tstamp')
            ->columnMustExist('tl_iso_shipping_modules', 'type')
            ->columnMustExist('tl_iso_shipping_modules', 'name')
            ->columnMustExist('tl_iso_shipping_modules', 'note')
            ->columnMustExist('tl_iso_shipping_modules', 'enabled')
            ->columnMustExist('tl_iso_shipping_modules', 'minimum_total')
            ->columnMustExist('tl_iso_shipping_modules', 'maximum_total')
            ->columnMustNotExist('tl_iso_shipping_modules', 'minimum_weight')
            ->columnMustNotExist('tl_iso_shipping_modules', 'maximum_weight')
            ->columnMustNotExist('tl_iso_shipping_modules', 'group_methods')
            ->columnMustNotExist('tl_iso_shipping_modules', 'group_calculation');

        $this->dbcheck
            ->tableMustExist('tl_iso_shipping_options')
            ->columnMustExist('tl_iso_shipping_options', 'pid');
    }

    /**
     * Create shipping methods for options and merge as a shipping group module
     *
     * @param array    $options
     * @param array    $shipping
     * @param callable $callback
     */
    private function convertShippingOptions(array $options, array $shipping, \Closure $callback)
    {
        $groupIds = array();

        foreach ($options as $row) {
            $data = array(
                'tstamp' => $row['tstamp'],
                'name' => ($shipping['name'] . ' (' . $row['name'] . ')'),
                'note' => $row['description'],
                'type' => 'flat',
                'enabled' => $row['enabled'],
            );

            $data = $callback($data, $row);

            $this->db->insert(
                'tl_iso_shipping',
                $data
            );

            $groupIds[] = $this->db->lastInsertId();
        }

        $this->db->update(
            'tl_iso_shipping',
            array(
                'type' => 'group',
                'group_methods' => serialize($groupIds),
                'group_calculation' => 'first'
            ),
            array(
                'id' => $shipping['id']
            )
        );
    }
}
