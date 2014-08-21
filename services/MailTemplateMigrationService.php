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


use Doctrine\DBAL\Schema\Schema;
use Doctrine\DBAL\Types\Type;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class MailTemplateMigrationService extends AbstractMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('Mail Templates');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('Migrates mail templates to notification center.');
    }

    /**
     * Returns status code of the migration step
     *
     * @return int
     */
    public function getStatus()
    {
        // Nothing to do
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_mail") === '0') {
            return MigrationServiceInterface::STATUS_READY;
        }

        try {
            $this->verifyDatabase();
        } catch (\RuntimeException $e) {
            return MigrationServiceInterface::STATUS_ERROR;
        }

        if (!$this->verifyGatewayConfig()) {
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
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_mail") === '0') {
            return $this->twig->render(
                'config_ready.twig',
                array(
                    'title' => $this->getName(),
                    'description' => $this->getDescription(),
                    'message' => $this->trans('mailtemplate.empty'),
                )
            );
        }

        try {
            $this->verifyDatabase();
        } catch (\RuntimeException $e) {
            return $this->twig->render(
                'config_error.twig',
                array(
                    'title' => $this->getName(),
                    'description' => $this->getDescription(),
                    'error' => $e->getMessage(),
                )
            );
        }

        if ($request->isMethod('POST') && $request->get('mailGateway') !== null) {
            $this->config->set('mailGateway', (int) $request->get('mailGateway'));
        }

        $mailGateways = array();

        if ($this->dbcheck->tableExists('tl_nc_gateway')) {
            $mailGateways = $this->db->fetchAll("SELECT * FROM tl_nc_gateway");
        }

        return $this->twig->render(
            'config_mailtemplate.twig',
            array(
                'title' => $this->getName(),
                'description' => $this->getDescription(),
                'can_save' => true,
                'mailGateways' => $mailGateways,
                'mailGateway' => $this->config->get('mailGateway')
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

        // Nothing to do if there are no mail templates
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_mail") === '0') {
            return array();
        }

        $gatewaySql = $this->getGatewayTableSql();

        return $gatewaySql;
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        if ($this->getStatus() != MigrationServiceInterface::STATUS_READY) {
            throw new \BadMethodCallException('Migration service is not ready');
        }

        $mailGateway = $this->config->get('mailGateway');
        $mailTemplates = $this->db->fetchAll("SELECT * FROM tl_iso_mail");

        // Nothing to migrate
        if (empty($mailTemplates)) {
            return;
        }

        if ($mailGateway === 0) {
            $this->db->insert(
                'tl_nc_gateway',
                array(
                    'tstamp' => time(),
                    'type'   => 'email',
                    'title'  => 'E-Mail Gateway (from Isotope Migration)' // TODO: do we need translation?
                )
            );

            $mailGateway = $this->db->lastInsertId();
        }

        // TODO: migrate mail templates to notification center
    }


    private function verifyDatabase()
    {
        // If notification center is installed, validate it's table structure. Otherwise we'll create it.
        if ($this->dbcheck->tableExists('tl_nc_gateway')) {
            $this->dbcheck
                ->columnMustExist('tl_nc_gateway', 'id')
                ->columnMustExist('tl_nc_gateway', 'tstamp')
                ->columnMustExist('tl_nc_gateway', 'title')
                ->columnMustExist('tl_nc_gateway', 'type');
        }
    }

    /**
     * @return bool
     */
    private function verifyGatewayConfig()
    {
        // Nothing to do if there are no mails
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_mail") === '0') {
            return true;
        }

        if (!$this->config->has('mailGateway')) {
            return false;
        }

        $mailGateway = (int) $this->config->get('mailGateway');

        if ($mailGateway > 0) {
            if (!$this->dbcheck->tableExists('tl_nc_gateway')) {
                return false;
            }


            if (!$this->db->executeQuery(
                    "SELECT id FROM tl_nc_gateway WHERE id=?",
                    array($mailGateway)
                )->fetchColumn()
            ) {
                return false;
            }
        }

        return true;
    }

    /**
     * Create notification center gateway table if it does not exist
     */
    private function getGatewayTableSql()
    {
        if ($this->dbcheck->tableExists('tl_nc_gateway')) {
            return array();
        }

        $schema = new Schema();

        $table = $schema->createTable('tl_nc_gateway');
        $table->addColumn('id', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0, 'autoincrement'=>true));
        $table->addColumn('tstamp', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
        $table->addColumn('type', Type::STRING, array('notnull'=>true, 'default'=>'', 'lenght'=>32));
        $table->addColumn('title', Type::STRING, array('notnull'=>true, 'default'=>''));
        $table->setPrimaryKey(array('id'));

        return $schema->toSql($this->db->getDatabasePlatform());
    }
}