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
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBagInterface;
use Symfony\Component\Translation\TranslatorInterface;

class MailTemplateMigrationService extends AbstractMigrationService
{
    /**
     * Return a name for the migration step
     *
     * @return string
     */
    public function getName()
    {
        return $this->trans('service.mail_template.service_name');
    }

    /**
     * Return a description what this step is about
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->trans('service.mail_template.service_description');
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
        if (!$this->hasMails()) {
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

        $gatewayId = $this->getGatewayId($requestStack);

        if ($gatewayId === false) {
            return $this->renderConfigFree();
        }

        $mailGateways = ($this->dbcheck->tableExists('tl_nc_gateway')) ? $this->db->fetchAll("SELECT * FROM tl_nc_gateway") : array();

        return $this->twig->render(
            'mail_template.twig',
            array(
                'title' => $this->getName(),
                'description' => $this->getDescription(),
                'can_save' => true,
                'mailGateways' => $mailGateways,
                'mailGateway' => $gatewayId
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

        // Nothing to do if there are no mail templates
        if (!$this->hasMails()) {
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
        if (!$this->hasMails()) {
            return;
        }

        $gatewayId = $this->config->get('mailGateway');

        if ($gatewayId === 0) {
            $this->db->insert(
                'tl_nc_gateway',
                array(
                    'tstamp' => time(),
                    'type'   => 'email',
                    'title'  => $this->trans('service.mail_template.gateway_label')
                )
            );

            $gatewayId = $this->db->lastInsertId();
        }

        $this->migrateOrderStatusMails($gatewayId);
        $this->migrateCheckoutModuleMails($gatewayId);

        // Rename tables, otherwise the Isotope Upgrade step will run into data loss protection
        foreach (
            array_merge(
                $this->renameTable('tl_iso_mail', 'tl_iso_mail_backup'),
                $this->renameTable('tl_iso_mail_content', 'tl_iso_mail_content_backup')
            ) as $query
        ) {
            $this->db->exec($query);
        }
    }


    private function verifyIntegrity()
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
            ->columnMustExist('tl_iso_mail_content', 'textOnly')
            ->columnMustExist('tl_iso_mail_content', 'attachments');


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

        $this->dbcheck->tableMustExist('tl_module');
    }

    /**
     * @return bool
     */
    private function verifyGatewayConfig()
    {
        // Nothing to do if there are no mails
        if (!$this->hasMails()) {
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
            $table = $this->createContaoTable('tl_nc_gateway', $schema);
            $table->addColumn('type', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>32));
            $table->addColumn('title', Type::STRING, array('notnull'=>true, 'default'=>''));
        }

        if (!$this->dbcheck->tableExists('tl_nc_notification')) {
            $table = $this->createContaoTable('tl_nc_notification', $schema);
            $table->addColumn('type', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>32));
            $table->addColumn('title', Type::STRING, array('notnull'=>true, 'default'=>''));
        }

        if (!$this->dbcheck->tableExists('tl_nc_message')) {
            $table = $this->createContaoTable('tl_nc_message', $schema, true);
            $table->addColumn('title', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->addColumn('gateway', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('gateway_type', Type::STRING, array('notnull'=>true, 'default'=>'', 'length'=>32));
            $table->addColumn('email_priority', Type::INTEGER, array('unsigned'=>true, 'notnull'=>true, 'default'=>0));
            $table->addColumn('email_template', Type::STRING, array('notnull'=>true, 'default'=>''));
            $table->addColumn('published', Type::STRING, array('fixed'=>true, 'notnull'=>true, 'default'=>'', 'length'=>1));
        }

        if (!$this->dbcheck->tableExists('tl_nc_language')) {
            $table = $this->createContaoTable('tl_nc_language', $schema, true);
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
            $table->addColumn('attachments', Type::BLOB, array('length'=>65535, 'notnull'=>false));
        }

        $sql = $schema->toSql($this->db->getDatabasePlatform());

        if (!$this->dbcheck->columnExists('tl_module', 'nc_notification')) {
            $tableDiff = new TableDiff('tl_module');

            $column = new Column('nc_notification', Type::getType(Type::INTEGER));
            $column->setUnsigned(true)->setNotnull(true)->setDefault(0);
            $tableDiff->addedColumns['nc_notification'] = $column;

            $sql = array_merge($sql, $this->db->getDatabasePlatform()->getAlterTableSQL($tableDiff));
        }

        return $sql;
    }


    /**
     * @param int $gatewayId
     *
     * @throws \Doctrine\DBAL\DBALException
     */
    private function migrateOrderStatusMails($gatewayId)
    {
        $orderStatus = $this->db->fetchAll("
            SELECT
                GROUP_CONCAT(id) AS ids,
                GROUP_CONCAT(name SEPARATOR '\", \"') AS name,
                mail_customer,
                mail_admin,
                sales_email
            FROM tl_iso_orderstatus
            WHERE mail_customer!=0 OR mail_admin!=0
            GROUP BY mail_customer, mail_admin, sales_email
        ");

        $this->migrateMails(
            $orderStatus,
            $gatewayId,
            'service.mail_template.orderstatus',
            'tl_iso_orderstatus',
            'notification'
        );
    }


    /**
     * @param int $gatewayId
     *
     * @throws \Doctrine\DBAL\DBALException
     */
    private function migrateCheckoutModuleMails($gatewayId)
    {
        $checkoutModules = $this->db->fetchAll("
            SELECT
                GROUP_CONCAT(id) AS ids,
                GROUP_CONCAT(name SEPARATOR '\", \"') AS name,
                iso_mail_customer AS mail_customer,
                iso_mail_admin AS mail_admin,
                iso_sales_email AS sales_email
            FROM tl_module
            WHERE type='iso_checkout' AND iso_mail_customer!=0 OR iso_mail_admin!=0
            GROUP BY iso_mail_customer, iso_mail_admin, iso_sales_email
        ");

        $this->migrateMails(
            $checkoutModules,
            $gatewayId,
            'service.mail_template.checkoutmodule',
            'tl_module',
            'nc_notification'
        );
    }


    /**
     * @param array  $configs
     * @param int    $gatewayId
     * @param string $label
     * @param string $table
     * @param string $field
     *
     * @throws \Doctrine\DBAL\DBALException
     */
    private function migrateMails(array $configs, $gatewayId, $label, $table, $field)
    {
        foreach ($configs as $row) {

            $notificationId = $this->convertMailsToNotification(
                $row,
                $gatewayId,
                $this->trans($label, array('%name%' => $row['name']))
            );

            $this->db->executeUpdate(
                "UPDATE $table SET $field=? WHERE id IN (?)",
                array($notificationId, explode(',', $row['ids'])),
                array(\PDO::PARAM_INT, Connection::PARAM_INT_ARRAY)
            );
        }
    }

    /**
     * @param array  $config
     * @param int    $gatewayId
     * @param string $notificationTitle
     *
     * @return int
     */
    private function convertMailsToNotification(array $config, $gatewayId, $notificationTitle)
    {
        $mailTemplates = $this->db->fetchAll(
            "SELECT * FROM tl_iso_mail WHERE id IN (?)",
            array(array($config['mail_customer'], $config['mail_admin'])),
            array(Connection::PARAM_INT_ARRAY)
        );

        // Mail templates no longer exist, we won't create notifications
        if (empty($mailTemplates)) {
            return 0;
        }

        $this->db->insert(
            'tl_nc_notification',
            array(
                'tstamp' => time(),
                'title'  => $notificationTitle,
                'type'   => 'iso_order_status_change',
            )
        );

        $notificationId = (int) $this->db->lastInsertId();

        if ($config['mail_customer'] > 0) {
            $this->createMessage($config['mail_customer'], '%s (Customer)', '##recipient_email##', $notificationId, $gatewayId);
        }

        if ($config['mail_admin'] > 0) {
            $this->createMessage($config['mail_admin'], '%s (Admin)', $config['sales_email'], $notificationId, $gatewayId);
        }

        return $notificationId;
    }

    /**
     * @param int    $mailId
     * @param string $titleDraft
     * @param string $recipient
     * @param int    $notificationId
     * @param int    $gatewayId
     */
    private function createMessage($mailId, $titleDraft, $recipient, $notificationId, $gatewayId)
    {
        $mail = $this->db->fetchAssoc(
            "SELECT * FROM tl_iso_mail WHERE id=?",
            array($mailId)
        );

        $this->db->insert(
            'tl_nc_message',
            array(
                'pid'            => $notificationId,
                'tstamp'         => $mail['tstamp'],
                'title'          => sprintf($titleDraft, $mail['name']),
                'gateway'        => $gatewayId,
                'gateway_type'   => 'email',
                'email_priority' => $mail['priority'],
                'email_template' => $mail['template'],
                'published'      => '1',
            )
        );

        $this->createLanguages(
            $this->db->lastInsertId(),
            $mail,
            $recipient
        );
    }

    /**
     * @param int    $messageId
     * @param array  $mail
     * @param string $recipient
     */
    private function createLanguages($messageId, $mail, $recipient)
    {
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
                    'recipients'           => ($recipient ?: '##admin_email##'),
                    'email_sender_name'    => $mail['senderName'],
                    'email_sender_address' => $mail['sender'],
                    'email_recipient_cc'   => $mail['cc'],
                    'email_recipient_bcc'  => $mail['bcc'],
                    'email_subject'        => $content['subject'],
                    'email_text'           => $content['text'],
                    'email_html'           => $content['html'],
                    'email_mode'           => ($content['textOnly'] ? 'textOnly' : 'textAndHtml'),
                    'attachments'          => $this->convertAttachments($content['attachments'])
                )
            );
        }
    }

    /**
     * @return bool
     */
    private function hasMails()
    {
        return !$this->dbcheck->tableIsEmpty('tl_iso_mail');
    }

    /**
     * @return bool
     */
    private function hasGateways()
    {
        $gatewayCount = 0;

        if ($this->dbcheck->tableExists('tl_nc_gateway')) {
            $gatewayCount = $this->db->fetchColumn("SELECT COUNT(*) FROM tl_nc_gateway");
        }

        return $gatewayCount > 0;
    }

    /**
     * Get gateway ID from config or false if none is necessary
     *
     * @param RequestStack $requestStack
     *
     * @return bool|int
     */
    private function getGatewayId(RequestStack $requestStack)
    {
        if (!$this->hasMails() || $this->hasGateways()) {
            $this->config->set('mailGateway', 0);

            return false;
        }

        $request = $requestStack->getCurrentRequest();

        if ($request->isMethod('POST') && $request->get('mailGateway') !== null) {
            $this->config->set('mailGateway', (int) $request->get('mailGateway'));
        }

        return $this->config->get('mailGateway');
    }

    /**
     * @param string $mailData
     *
     * @return array|null
     */
    private function convertAttachments($mailData)
    {
        $attachments = null;
        $files = @unserialize($mailData);

        if (!empty($files) && is_array($files)) {
            foreach ($files as $path) {
                if (($uuid = $this->dbafs->findByPath($path)) !== null) {
                    $attachments[] = $uuid;
                }
            }
        }

        return $attachments;
    }
}
