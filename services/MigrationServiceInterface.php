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


use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

interface MigrationServiceInterface
{
    /**
     * Status codes
     */
    const STATUS_CONFIG = 1;
    const STATUS_READY = 2;
    const STATUS_ERROR = 3;

    /**
     * Get URL slug for this migration step
     *
     * @return string
     */
    public static function getSlug();

    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName();

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription();

    /**
     * Returns status code of the migration step
     *
     * @return int
     */
    public function getStatus();

    /**
     * Returns the view for step configuration or information
     *
     * @param Request $request
     *
     * @return string|Response
     */
    public function renderConfigView(Request $request);

    /**
     * Get SQL commands to migration the database
     *
     * @return array
     */
    public function getMigrationSQL();

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration();
}