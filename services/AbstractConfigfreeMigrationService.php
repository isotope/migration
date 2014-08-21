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

abstract class AbstractConfigfreeMigrationService extends AbstractMigrationService
{
    /**
     * Migration status code
     * @type int
     */
    protected $status = null;

    /**
     * Error message
     * @type string
     */
    private $errorMessage = '';

    /**
     * Returns the view for error or config message
     *
     * @param Request $request
     *
     * @return string|Response
     */
    public function renderConfigView(Request $request)
    {
        if ($this->getStatus() == MigrationServiceInterface::STATUS_ERROR) {
            return $this->twig->render('config_error.twig', array(
                'title'       => $this->getName(),
                'description' => $this->getDescription(),
                'error'       => $this->errorMessage
            ));

        } else {
            return $this->twig->render('configfree.twig', array(
                'title'       => $this->getName(),
                'description' => $this->getDescription(),
                'no_save'     => true
            ));
        }
    }

    /**
     * Returns status code of the migration step
     *
     * @return int
     */
    public function getStatus()
    {
        if (null === $this->status) {
            $this->status = MigrationServiceInterface::STATUS_ERROR;

            try {
                $this->verifyDatabase();
                $this->status = MigrationServiceInterface::STATUS_READY;
            } catch (\RuntimeException $e) {
                $this->errorMessage = $e->getMessage();
            }
        }

        return $this->status;
    }

    /**
     * Set error message for migration step
     *
     * @param string $message
     *
     * @return $this
     */
    protected function setErrorMessage($message)
    {
        $this->errorMessage = $message;

        return $this;
    }

    /**
     * Check if the migration can be executed
     *
     * @throws \RuntimeException
     */
    abstract protected function verifyDatabase();
}