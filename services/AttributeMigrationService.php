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


use Symfony\Component\HttpFoundation\RequestStack;

class AttributeMigrationService extends AbstractMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Product attributes');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates product attributes from shop configuration');
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
        if (count($this->getMediaAttributes()) === 0) {
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

        $attributes = $this->getMediaAttributes();

        if (count($attributes) === 0) {
            return $this->renderConfigFree();
        }

        $request = $requestStack->getCurrentRequest();

        if ($request->isMethod('POST') && $request->get('confirm') !== null) {
            $this->config->set('confirmed', (bool) $request->get('confirm'));
        }

        return $this->twig->render(
            'attribute.twig',
            array(
                'title'           => $this->getName(),
                'description'     => $this->getDescription(),
                'can_save'        => true,
                'confirmed'       => (bool) $this->config->get('confirmed'),
                'attributes'      => $attributes
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

        return $this->renameTable('tl_iso_attributes', 'tl_iso_attribute');
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyIntegrity()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_attributes')
            ->tableMustNotExist('tl_iso_attribute')
            ->columnMustExist('tl_iso_attributes', 'type')
            ->columnMustExist('tl_iso_attributes', 'gallery');
    }

    /**
     * Checks if there are media attributes with a custom gallery in tl_iso_attributes
     *
     * @return array
     */
    private function getMediaAttributes()
    {
        return $this->db->fetchAll("SELECT id, name, field_name FROM tl_iso_attributes WHERE type='mediaManager' AND gallery!=''");
    }
}
