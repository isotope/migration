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
    )
);