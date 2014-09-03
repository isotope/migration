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
        'saveContinue'  => 'Save & continue',
    ),
    'index' => array(
        'start'         => 'Start configuration'
    ),
    'summary' => array(
        'nothingSpecialToDo'         => 'You don\'t need to take any further action for this step.'
    ),
    'error' => array(
        'tableFound'  => 'Table "%table%" must NOT exist in the database.',
        'tableNotFound' => 'Table "%table%" not found in the database.',
        'columnFound' => 'Column "%column%" must NOT exist in the table "%table%".',
        'columnNotFound' => 'Column "%column%" not found in the table "%table%".',
    ),
    'confirm' => array(
        'configfree' => 'There is no configuration necessary for this migration step.',
    ),
    'mailtemplate' => array(
        'empty' => 'You do not have any mail templates so there\'s nothing to migrate here.',
        'gateway_legend' => 'E-Mail Gateway',
        'gateway_intro' => 'Please select one of the available email gateways from notification center or select to create a new one for mail template migration.',
        'gateway_new' => 'Create a new e-mail gateway',
        'gateway_db' => 'Gateways from your database',
        'orderstatus' => 'Order status "%name%"'
    ),
    'download' => array(
        'titleAndDescription'   => 'The database columns tl_iso_download.title as well as tl_iso_download.description cannot be converted automatically. They contain the title as well as the description of a download (provided you entered them). In Contao 3+ you can manage meta data for files in the file system directly so there is no need for Isotope eCommerce to have yet another tilte or description field. Because the migration tool cannot automatically detect in what language you entered the data in Isotope 1.4 (and possibly how you translated them), it does not touch the data in any way at all! Make sure you do not (!!) delete tl_iso_download.description and tl_iso_download.title before you migrated the data manually!'
    )
);