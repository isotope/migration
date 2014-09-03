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
use Doctrine\DBAL\Schema\Column;
use Doctrine\DBAL\Schema\Schema;
use Doctrine\DBAL\Schema\SchemaConfig;
use Doctrine\DBAL\Schema\TableDiff;
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
        try {
            $this->verifyDatabase();
        } catch (\RuntimeException $e) {
            return MigrationServiceInterface::STATUS_ERROR;
        }

        // Nothing to do
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_mail") === '0') {
            return MigrationServiceInterface::STATUS_READY;
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

        if ($request->isMethod('POST') && $request->get('mailGateway') !== null) {
            $this->config->set('mailGateway', (int) $request->get('mailGateway'));
        }

        $mailGateways = ($this->dbcheck->tableExists('tl_nc_gateway')) ? $this->db->fetchAll("SELECT * FROM tl_nc_gateway") : array();

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

        $tableDiff = new TableDiff('tl_iso_orderstatus');
        $column = new Column('notification', Type::getType(Type::INTEGER));
        $column->setNotnull(true)->setDefault(0);
        $tableDiff->addedColumns['notification'] = $column;

        return array_merge(
            $this->getNotificationTablesSql(),
            $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff)
        );
    }

    /**
     * Execute manual data migration after all the database fields are up-to-date
     */
    public function postMigration()
    {
        // Nothing to do if there are no mail templates
        if ($this->db->fetchColumn("SELECT COUNT(*) FROM tl_iso_mail") === '0') {
            return;
        }

        $gatewayId = $this->config->get('mailGateway');

        if ($gatewayId === 0) {
            $this->db->insert(
                'tl_nc_gateway',
                array(
                    'tstamp' => time(),
                    'type'   => 'email',
                    'title'  => 'E-Mail Gateway (from Isotope Migration)' // TODO: do we need translation?
                )
            );

            $gatewayId = $this->db->lastInsertId();
        }

        $this->migrateOrderStatusMails($gatewayId);

        // TODO: implement for checkout frontend modules
    }


    private function verifyDatabase()
    {
        $this->dbcheck
            ->tableMustExist('tl_iso_mail')
            ->columnMustExist('tl_iso_mail', 'id')
            ->columnMustExist('tl_iso_mail', 'tstamp')
            ->columnMustExist('tl_iso_mail', 'name')
            ->columnMustExist('tl_iso_mail', 'senderName')
            ->columnMustExist('tl_iso_mail', 'sender')
            ->columnMustExist('tl_iso_mail', 'cc')
            ->columnMustExist('tl_iso_mail', 'bcc')
            ->columnMustExist('tl_iso_mail', 'priority')
            ->columnMustExist('tl_iso_mail', 'template');

        $this->dbcheck
            ->tableMustExist('tl_iso_mail_content')
            ->columnMustExist('tl_iso_mail_content', 'pid')
            ->columnMustExist('tl_iso_mail_content', 'tstamp')
            ->columnMustExist('tl_iso_mail_content', 'language')
            ->columnMustExist('tl_iso_mail_content', 'fallback')
            ->columnMustExist('tl_iso_mail_content', 'subject')
            ->columnMustExist('tl_iso_mail_content', 'text')
            ->columnMustExist('tl_iso_mail_content', 'html')
            ->columnMustExist('tl_iso_mail_content', 'textOnly');


        // If notification center is installed, validate it's table structure. Otherwise we'll create it.
        if ($this->dbcheck->tableExists('tl_nc_gateway')) {
            $this->dbcheck
                ->columnMustExist('tl_nc_gateway', 'id')
                ->columnMustExist('tl_nc_gateway', 'tstamp')
                ->columnMustExist('tl_nc_gateway', 'title')
                ->columnMustExist('tl_nc_gateway', 'type');
        }

        if ($this->dbcheck->tableExists('tl_nc_notification')) {
            $this->dbcheck
                ->columnMustExist('tl_nc_notification', 'tstamp')
                ->columnMustExist('tl_nc_notification', 'title')
                ->columnMustExist('tl_nc_notification', 'type');
        }

        if ($this->dbcheck->tableExists('tl_nc_message')) {
            $this->dbcheck
                ->columnMustExist('tl_nc_message', 'pid')
                ->columnMustExist('tl_nc_message', 'tstamp')
                ->columnMustExist('tl_nc_message', 'title')
                ->columnMustExist('tl_nc_message', 'gateway')
                ->columnMustExist('tl_nc_message', 'gateway_type')
                ->columnMustExist('tl_nc_message', 'email_priority')
                ->columnMustExist('tl_nc_message', 'email_template')
                ->columnMustExist('tl_nc_message', 'published');
        }

        if ($this->dbcheck->tableExists('tl_nc_language')) {
            $this->dbcheck
                ->columnMustExist('tl_nc_language', 'pid')
                ->columnMustExist('tl_nc_language', 'tstamp')
                ->columnMustExist('tl_nc_language', 'gateway_type')
                ->columnMustExist('tl_nc_language', 'language')
                ->columnMustExist('tl_nc_language', 'fallback')
                ->columnMustExist('tl_nc_language', 'recipients')
                ->columnMustExist('tl_nc_language', 'email_sender_name')
                ->columnMustExist('tl_nc_language', 'email_sender_address')
                ->columnMustExist('tl_nc_language', 'email_recipient_cc')
                ->columnMustExist('tl_nc_language', 'email_recipient_bcc')
                ->columnMustExist('tl_nc_language', 'email_subject')
                ->columnMustExist('tl_nc_language', 'email_text')
                ->columnMustExist('tl_nc_language', 'email_html')
                ->columnMustExist('tl_nc_language', 'email_mode');
        }

        $this->dbcheck
            ->tableMustExist('tl_iso_orderstatus')
            ->columnMustExist('tl_iso_orderstatus', 'id')
            ->columnMustExist('tl_iso_orderstatus', 'mail_customer')
            ->columnMustExist('tl_iso_orderstatus', 'mail_admin')
            ->columnMustExist('tl_iso_orderstatus', 'sales_email')
            ->columnMustNotExist('tl_iso_orderstatus', 'notification');
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
     * Create notification center tables if they do not exist
     */
    private function getNotificationTablesSql()
    {
        $schemaConfig = new SchemaConfig();
        $schemaConfig->setDefaultTableOptions(array('engine'=>'MyISAM'));

        $schema = new Schema(array(), array(), $schemaConfig);

        if (!$this->dbcheck->tableExists('tl_nc_gateway')) {
            $table = $schema->createTable('tl_nc_gateway');
            $table->addColumn('id', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'autoincrement'=>true));
            $table->addColumn('tstamp', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('type', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>32));
            $table->addColumn('title', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->setPrimaryKey(array('id'));
        }

        if (!$this->dbcheck->tableExists('tl_nc_notification')) {
            $table = $schema->createTable('tl_nc_notification');
            $table->addColumn('id', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'autoincrement'=>true));
            $table->addColumn('tstamp', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('type', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>32));
            $table->addColumn('title', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->setPrimaryKey(array('id'));
        }

        if (!$this->dbcheck->tableExists('tl_nc_message')) {
            $table = $schema->createTable('tl_nc_message');
            $table->addColumn('id', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'autoincrement'=>true));
            $table->addColumn('pid', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('tstamp', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('title', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->addColumn('gateway', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('gateway_type', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>32));
            $table->addColumn('email_priority', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('email_template', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->addColumn('published', Type::STRING, array('fixed'=>true, 'notnull'=>true, 'default'=>'', 'length'=>1));
            $table->setPrimaryKey(array('id'));
        }

        if (!$this->dbcheck->tableExists('tl_nc_language')) {
            $table = $schema->createTable('tl_nc_language');
            $table->addColumn('id', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'autoincrement'=>true));
            $table->addColumn('pid', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('tstamp', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('gateway_type', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>32));
            $table->addColumn('language', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>5));
            $table->addColumn('fallback', Type::STRING, array('fixed'=>true, 'notnull'=>true, 'default'=>'', 'length'=>1));
            $table->addColumn('recipients', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->addColumn('email_sender_name', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->addColumn('email_sender_address', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->addColumn('email_recipient_cc', Type::TEXT, array('length'=>65535));
            $table->addColumn('email_recipient_bcc', Type::TEXT, array('length'=>65535));
            $table->addColumn('email_subject', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->addColumn('email_text', Type::TEXT, array('length'=>65535));
            $table->addColumn('email_html', Type::TEXT, array('length'=>65535));
            $table->addColumn('email_mode', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>16));
            $table->setPrimaryKey(array('id'));
        }

        return $schema->toSql($this->db->getDatabasePlatform());
    }


    private function migrateOrderStatusMails($gatewayId)
    {
        $orderStatus = $this->db->query("
            SELECT GROUP_CONCAT(id) AS ids, GROUP_CONCAT(name SEPARATOR '\", \"') AS name, mail_customer, mail_admin, sales_email
            FROM tl_iso_orderstatus
            WHERE mail_customer!=0 OR mail_admin!=0
            GROUP BY mail_customer, mail_admin, sales_email
        ")->fetchAll(\PDO::FETCH_COLUMN);

        foreach ($orderStatus as $row) {
            $mailConfig = array(
                $row['mail_customer'] => array(
                    'recipient' => '##recipient_email##'
                ),
                $row['mail_admin'] => array(
                    'recipient' => $row['sales_email']
                ),
            );

            $notificationTitle = $this->trans('mailtemplate.orderstatus', $orderStatus['name']);
            $notificationId = $this->convertMailsToNotification($mailConfig, $gatewayId, $notificationTitle);

            $this->db->executeUpdate(
                "UPDATE tl_iso_orderstatus SET notification=? WHERE id IN (?)",
                array($notificationId, explode(',', $row['ids'])),
                array(\PDO::PARAM_INT, Connection::PARAM_INT_ARRAY)
            );
        }
    }

    /**
     * @param array  $mailIds
     * @param int    $gatewayId
     * @param string $notificationTitle
     *
     * @return int
     */
    private function convertMailsToNotification(array $mailConfig, $gatewayId, $notificationTitle)
    {
        $this->db->insert(
            'tl_nc_notification',
            array(
                'tstamp' => time(),
                'title'  => $notificationTitle,
                'type'   => 'iso_order_status_change',
            )
        );

        $notificationId = (int) $this->db->lastInsertId();

        $mailTemplates = $this->db->fetchAll(
            "SELECT * FROM tl_iso_mail WHERE id IN (?)",
            array(array_keys($mailConfig)),
            array(Connection::PARAM_INT_ARRAY)
        );

        foreach ($mailTemplates as $mail) {
            $this->db->insert(
                'tl_nc_message',
                array(
                    'pid'            => $notificationId,
                    'tstamp'         => $mail['tstamp'],
                    'title'          => $mail['name'],
                    'gateway'        => $gatewayId,
                    'gateway_type'   => 'email',
                    'email_priority' => $mail['priority'],
                    'email_template' => $mail['template'],
                    'published'      => '1',
                )
            );

            $messageId = $this->db->lastInsertId();
            $mailContents = $this->db->fetchAll("SELECT * FROM tl_iso_mail_content WHERE pid=?", array($mail['id']));

            foreach ($mailContents as $content) {
                $this->db->insert(
                    'tl_nc_language',
                    array(
                        'pid'                  => $messageId,
                        'tstamp'               => $content['tstamp'],
                        'gateway_type'         => 'email',
                        'language'             => $content['language'],
                        'fallback'             => $content['fallback'],
                        'recipients'           => $mailConfig['recipient'],
                        'email_sender_name'    => $mail['senderName'],
                        'email_sender_address' => $mail['sender'],
                        'email_recipient_cc'   => $mail['cc'],
                        'email_recipient_bcc'  => $mail['bcc'],
                        'email_subject'        => $content['subject'],
                        'email_text'           => $content['text'],
                        'email_html'           => $content['html'],
                        'email_mode'           => ($content['textOnly'] ? 'textOnly' : 'textAndHtml'),
                        // TODO: add attachments from mail content
                    )
                );
            }
        }

        return $notificationId;
    }
}