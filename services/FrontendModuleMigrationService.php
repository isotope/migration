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


class FrontendModuleMigrationService extends AbstractConfigfreeMigrationService
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
     * Get SQL commands to migration the database
     *
     * @return array
     */
    public function getMigrationSQL()
    {
        if ($this->getStatus() != MigrationServiceInterface::STATUS_READY) {
            throw new \BadMethodCallException('Migration service is not ready');
        }

        // TODO: tl_module.iso_collectionTpl = tl_module.iso_cart_layout
        // TODO: tl_module.iso_filterTpl = tl_module.iso_filter_layout
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        // TODO: finish implementation
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyDatabase()
    {
        // TODO: finish implementation
    }
}