<?php

return array(
    'base' => array(
        'title'             => 'Isotope 2 – Migration Tool',
        'welcome'           => 'Welcome',
        'configuration'     => 'Configuration',
        'execution'         => 'Execution',
        'summary'           => 'Summary',
    ),
    'config' => array(
        'continue'      => 'Continue',
        'save'          => 'Save',
        'saveContinue'  => 'Save & Continue',
    ),
    'index' => array(
        'start'         => 'Start configuration'
    ),
    'error' => array(
        'tableFound'  => 'Table "%table%" must NOT exist in the database.',
        'tableNotFound' => 'Table "%table%" not found in the database.',
        'columnFound' => 'Column "%column%" must NOT exist in the table "%table%".',
        'columnNotFound' => 'Column "%column%" not found in the table "%table%".',
    ),
    'confirm' => array(
        'configfree' => 'There is no configuration necessary for this migration step.',
        'title' => 'Confirmation',
        'checkbox' => 'I understand and agree'
    ),
    'service' => array(
        'mail_template' => array(
            'gateway_legend' => 'E-Mail Gateway',
            'gateway_intro' => 'Please select one of the available email gateways from notification center or select to create a new one for mail template migration.',
            'gateway_new' => 'Create a new e-mail gateway',
            'gateway_db' => 'Gateways from your database',
            'orderstatus' => 'Order status "%name%"'
        ),
        'shipping_method' => array(
            'name' => '%name% (Type "%type%")',
            'old_title' => 'Old shipping methods',
            'old_explain' => 'The following shipping methods are no longer supported in Isotope 2 (core):',
            'old_description' => 'We won\'t touch the data, so maybe you will find a third-party extension or you can contact a developer to fix this for you.',
            'unknown_title' => 'Unknown shipping methods',
            'unknown_explain' => 'The following shipping methods appear to be from third-party extensions:',
            'unknown_description' => 'We can\'t tell if they work in Isotope 2, nor are we able to migrate their data. We won\'t touch them though, so if you\'re lucky a third-party developer might provide an upgrade option.',
            'confirmation' => 'Please confirm that you have read the above. It is your responsibility to not delete any data of the
            old/unsuppported shipping methods if you need them in the future.'
        ),
        'payment_method' => array(
            'name' => '%name% (Type "%type%")',
            'old_title' => 'Old payment methods',
            'old_explain' => 'The following payment methods are no longer supported in Isotope 2 (core):',
            'old_description' => 'We won\'t touch the data, so maybe you will find a third-party extension or you can contact a developer to fix this for you.',
            'unknown_title' => 'Unknown payment methods',
            'unknown_explain' => 'The following payment methods appear to be from third-party extensions:',
            'unknown_description' => 'We can\'t tell if they work in Isotope 2, nor are we able to migrate their data. We won\'t touch them though, so if you\'re lucky a third-party developer might provide an upgrade option.',
            'confirmation' => 'Please confirm that you have read the above. It is your responsibility to not delete any data of the old/unsuppported payment methods if you need them in the future.'
        ),
        'download' => array(
            'titleAndDescription'   => 'The database columns tl_iso_download.title as well as tl_iso_download.description cannot be converted automatically. They contain the title as well as the description of a download (provided you entered them). In Contao 3+ you can manage meta data for files in the file system directly so there is no need for Isotope eCommerce to have yet another tilte or description field. Because the migration tool cannot automatically detect in what language you entered the data in Isotope 1.4 (and possibly how you translated them), it does not touch the data in any way at all! Make sure you do not (!!) delete tl_iso_download.description and tl_iso_download.title before you migrated the data manually!'
        ),
        'frontend_module' => array(
            'templates'   => 'The migration tool migrated the templates "iso_cart_full" to "iso_collection_default" and "iso_cart_mini" to "iso_collection_mini". However, it cannot migrate logic you built into your templates. You will have to check and adjust every (!) single template!'
        )
    )
);