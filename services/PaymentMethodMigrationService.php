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
use Symfony\Component\HttpFoundation\RequestStack;

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
        if ($this->dbcheck->tableIsEmpty('tl_iso_payment_modules')) {
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
     * @param RequestStack $requestStack
     *
     * @return string
     */
    public function renderConfigView(RequestStack $requestStack)
    {
        try {
            $this->verifyDatabase();
        } catch (\RuntimeException $e) {
            $this->renderConfigError($e->getMessage());
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
            return $this->renderConfigFree();
        }

        $request = $requestStack->getCurrentRequest();

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
        $this->checkMigrationStatus();

        $tableDiff = new TableDiff('tl_iso_payment_modules');
        $tableDiff->newName = 'tl_iso_payment';

        $column = new Column('psp_pspid', Type::getType(Type::INTEGER));
        $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
        $tableDiff->renamedColumns['postfinance_pspid'] = $column;

        $column = new Column('psp_http_method', Type::getType(Type::STRING));
        $column->setLength(4)->setNotnull(true)->setDefault('');
        $tableDiff->renamedColumns['postfinance_method'] = $column;

        $column = new Column('psp_hash_in', Type::getType(Type::STRING));
        $column->setLength(128)->setNotnull(true)->setDefault('');
        $tableDiff->renamedColumns['postfinance_secret'] = $column;

        $column = new Column('psp_hash_out', Type::getType(Type::STRING));
        $column->setLength(128)->setNotnull(true)->setDefault('');
        $tableDiff->addedColumns['psp_hash_out'] = $column;

        $column = new Column('psp_hash_method', Type::getType(Type::STRING));
        $column->setLength(6)->setNotnull(true)->setDefault('');
        $tableDiff->addedColumns['psp_hash_method'] = $column;

        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);
        $sql[] = "UPDATE tl_iso_payment SET psp_hash_out = psp_hash_in, psp_hash_method = 'sha1'";

        return $sql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        // Nothing to do here
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
            ->tableMustNotExist('tl_iso_payment')
            ->columnMustExist('tl_iso_payment_modules', 'postfinance_pspid')
            ->columnMustNotExist('tl_iso_payment_modules', 'psp_pspid')
            ->columnMustExist('tl_iso_payment_modules', 'postfinance_method')
            ->columnMustNotExist('tl_iso_payment_modules', 'psp_http_method')
            ->columnMustExist('tl_iso_payment_modules', 'postfinance_secret')
            ->columnMustNotExist('tl_iso_payment_modules', 'psp_hash_in')
            ->columnMustNotExist('tl_iso_payment_modules', 'psp_hash_out')
            ->columnMustNotExist('tl_iso_payment_modules', 'psp_hash_method');
    }
}
