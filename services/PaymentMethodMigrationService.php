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


use Doctrine\DBAL\Schema\TableDiff;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class PaymentMethodMigrationService extends AbstractMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Payment Methods');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates payment methods.');
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
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_payment_modules") === '0') {
            return MigrationServiceInterface::STATUS_READY;
        }

        $totalMethods = $this->db->fetchColumn("
            SELECT COUNT(*) AS total
            FROM tl_iso_payment_modules
            WHERE type NOT IN ('', 'cash', 'paypal', 'postfinance')
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
            FROM tl_iso_payment_modules
            WHERE type='authorizedotnet'
        ");

        $unknownMethods = $this->db->fetchAll("
            SELECT id, name, type
            FROM tl_iso_payment_modules
            WHERE type NOT IN ('', 'cash', 'paypal', 'postfinance', 'authorizedotnet')
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
            'payment_method.twig',
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

        $tableDiff = new TableDiff('tl_iso_payment_modules');
        $tableDiff->newName = 'tl_iso_payment';
        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);

        // TODO: do we need to adjust fields?

        return $sql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        // TODO: do we need post migration?
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyDatabase()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_payment_modules')
            ->tableMustNotExist('tl_iso_payment');
    }
}