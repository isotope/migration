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
        return $this->trans('service.frontend_module.service_name');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('service.frontend_module.service_description');
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
        if (count($this->getXhtmlTemplates()) === 0) {
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

        $xhtmlTemplates = $this->getXhtmlTemplates();

        if (count($xhtmlTemplates) === 0) {
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
                'confirmed'       => (bool) $this->config->get('confirmed'),
                'xhtmlTemplates'  => $xhtmlTemplates,
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
        // Set default templates
        $qb = $this->db->createQueryBuilder();
        $qb->update('tl_module', 'm')
           ->set('m.iso_collectionTpl', ':collectionTpl');
        $qb->setParameter(':collectionTpl', 'iso_collection_default');
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
            ->columnMustExist('tl_module', 'iso_filterTpl')
            ->columnMustNotExist('tl_module', 'iso_collectionTpl');

        // Must not use XHTML layout
    }

    /**
     * {@inheritdoc}
     */
    public function getSummary()
    {
        return $this->trans('service.frontend_module.summary');
    }

    /**
     * Check if there are XHTML layouts in the database
     *
     * @return array
     */
    private function getXhtmlTemplates()
    {
        if ($this->dbcheck->columnExists('tl_layout', 'doctype')) {
            return $this->db->fetchAll("SELECT id, name FROM tl_layout WHERE doctype!='html5'");
        }

        return array();
    }
}
