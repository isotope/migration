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

class FrontendModuleMigrationService extends AbstractMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Frontend modules');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrate front end module configuration.');
    }

    /**
     * Returns status code of the migration step
     *
     * @return int
     */
    public function getStatus()
    {
        try {
            $this->verifyIntegrity();
        } catch (\RuntimeException $e) {
            return MigrationServiceInterface::STATUS_ERROR;
        }

        // Nothing to do
        if (!$this->hasXhtmlLayout()) {
            return MigrationServiceInterface::STATUS_READY;
        }

        if (!$this->config->get('confirmed')) {
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
            $this->verifyIntegrity();
        } catch (\RuntimeException $e) {
            return $this->renderConfigError($e->getMessage());
        }

        if (!$this->hasXhtmlLayout()) {
            return $this->renderConfigFree();
        }

        $request = $requestStack->getCurrentRequest();

        if ($request->isMethod('POST') && $request->get('confirm') !== null) {
            $this->config->set('confirmed', (bool) $request->get('confirm'));
        }

        return $this->twig->render(
            'frontend_module.twig',
            array(
                'title'           => $this->getName(),
                'description'     => $this->getDescription(),
                'can_save'        => true,
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
        $tableDiff = new TableDiff('tl_module');

        $column = new Column('iso_collectionTpl', Type::getType(Type::STRING));
        $column->setLength(64)->setNotnull(true)->setDefault('');
        $tableDiff->addedColumns['iso_collectionTpl'] = $column;

        $sql = $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff);


        return $sql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        $this->checkMigrationStatus();

        // Migrate default templates

        // iso_cart_full --> iso_collection_default
        $qb = $this->db->createQueryBuilder();
        $qb->update('tl_module', 'm')
            ->set('m.iso_collectionTpl', ':collectionTpl')
            ->where('m.iso_cart_layout = :cartLayout');
        $qb->setParameter(':collectionTpl', 'iso_collection_default');
        $qb->setParameter(':cartLayout', 'iso_cart_full');
        $qb->execute();

        // iso_cart_mini --> iso_collection_mini
        $qb = $this->db->createQueryBuilder();
        $qb->update('tl_module', 'm')
            ->set('m.iso_collectionTpl', ':collectionTpl')
            ->where('m.iso_cart_layout = :cartLayout');
        $qb->setParameter(':collectionTpl', 'iso_collection_mini');
        $qb->setParameter(':cartLayout', 'iso_cart_mini');
        $qb->execute();

        // iso_filter_default is already correct!
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyIntegrity()
    {
        $this->dbcheck
            ->columnMustExist('tl_module', 'iso_cart_layout')
            ->columnMustExist('tl_module', 'iso_filterTpl');

        // Must not use XHTML layout
    }

    /**
     * Return a list of to do's or messages for the summary page
     *
     * @return string[]
     */
    public function getSummaryMessages()
    {
        return array(
            $this->trans('service.frontend_module.templates')
        );
    }

    /**
     * Check if there are XHTML layouts in the database
     *
     * @return bool
     */
    private function hasXhtmlLayout()
    {
        if ($this->dbcheck->tableExists('tl_layout')) {
            $total = $this->db->fetchColumn("SELECT COUNT(*) AS total FROM tl_layout WHERE doctype!='html5'");

            if ($total > 0) {
                return true;
            }
        }

        return false;
    }
}
