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


use Doctrine\DBAL\Connection;
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBagInterface;
use Symfony\Component\Translation\TranslatorInterface;

class TranslationMigrationService extends AbstractConfigfreeMigrationService
{
    private $contao_root;

    public function __construct(
        AttributeBagInterface $config,
        AttributeBagInterface $summary,
        \Twig_Environment $twig,
        TranslatorInterface $translator,
        Connection $db,
        DatabaseVerificationService $migration_dbcheck,
        DbafsService $migration_dbafs,
        $contao_root
    ) {
        parent::__construct($config, $summary, $twig, $translator, $db, $migration_dbcheck, $migration_dbafs);

        $this->contao_root = $contao_root;
    }

    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('service.translation.service_name');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('service.translation.service_description');
    }

    /**
     * Get SQL commands to migration the database
     *
     * @return array
     */
    public function getMigrationSQL()
    {
        $this->checkMigrationStatus();

        if ($this->dbcheck->tableExists('tl_iso_labels')) {
            return $this->renameTable('tl_iso_labels', 'tl_iso_label');
        }

        return array();
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        // nothing to do here
    }

    /**
     * Make sure database structure is correct before migration
     *
     * @throws \RuntimeException
     */
    protected function verifyIntegrity()
    {
        if ($this->dbcheck->tableExists('tl_iso_labels')) {
            $this->dbcheck->tableMustNotExist('tl_iso_label');
        }

        if (file_exists($this->contao_root . '/system/modules/isotope_multilingual')) {
            throw new \RuntimeException(
                $this->trans(
                    'error.extensionFound',
                    array(
                        '%extension%' => 'isotope_multilingual'
                    )
                )
            );
        }
    }
}
