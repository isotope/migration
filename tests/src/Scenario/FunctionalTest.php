<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Test\Scenario;


use Isotope\Migration\Service\MigrationServiceInterface;
use Isotope\Migration\Test\SilexAwareTestCase;
use Silex\WebTestCase;
use Symfony\Component\HttpKernel\HttpKernel;


class FunctionalTest extends WebTestCase
{

    public function testPageStatus()
    {
        $client = $this->createClient();

        $crawler = $client->request('GET', '/');
        $this->assertTrue($client->getResponse()->isOk());

        $crawler = $client->request('GET', '/config');
        $this->assertTrue($client->getResponse()->isRedirection());

        $crawler = $client->request('GET', '/config/');
        $this->assertTrue($client->getResponse()->isOk());

        $crawler = $client->request('GET', '/execute');
        $this->assertTrue($client->getResponse()->isOk());

        $crawler = $client->request('GET', '/summary');
        $this->assertTrue($client->getResponse()->isOk());
    }


    public function testRedirectOnInvalidUrl()
    {
        $client = $this->createClient();
        $client->request('GET', '/invalid-url');

        $this->assertTrue($client->getResponse()->isRedirection());
    }

    /**
     * @dataProvider serviceUrlProvider
     *
     * @param $url
     */
    public function testServiceConfigView($url)
    {
        $client = $this->createClient();
        $crawler = $client->request('GET', $url);
        $this->assertTrue($client->getResponse()->isOk());
    }

    /**
     * Creates the application.
     *
     * @return HttpKernel
     */
    public function createApplication()
    {
        return SilexAwareTestCase::getApp();
    }


    public function serviceUrlProvider()
    {
        $urls = array();

        $app = SilexAwareTestCase::getApp();

        /** @type \Pimple $services */
        $services = $app['migration.services'];

        foreach ($services->keys() as $id) {

            /** @type MigrationServiceInterface $service */
            $service = $services[$id];

            $urls[] = array('/config/'.$service->getSlug());
        }

        return $urls;
    }
}