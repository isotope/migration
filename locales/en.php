<?php

return array(
    'base' => array(
        'title'             => 'Isotope 2 – Migration Tool',
        'welcome'           => 'Welcome',
        'configuration'     => 'Configuration',
        'execution'         => 'Execution',
        'summary'           => 'Summary',
    ),
    'error' => array(
        'headline'       => 'Application Error',
        'contao'         => 'Your Contao installation was not found. To fix this problem, make sure you placed the migration tool in the root folder of your installation and there is localconfig.php in your system/config directory.',
        'database'       => 'Connecting to your database failed. This means Contao\'s localconfig.php was found, but there were either no credentials available or they were incorrect. Make sure your Contao installation works.',
        'installTool'    => 'Open Contao Install-Tool',
        'tableFound'     => 'Table "%table%" must NOT exist in the database.',
        'tableNotFound'  => 'Table "%table%" not found in the database.',
        'columnFound'    => 'Column "%column%" must NOT exist in the table "%table%".',
        'columnNotFound' => 'Column "%column%" not found in the table "%table%".',
        'extensionFound' => 'You must delete the "%extension%" extension.'
    ),
    'confirm' => array(
        'configfree' => 'There is no configuration necessary for this migration step.',
        'title'      => 'Confirmation',
        'checkbox'   => 'I understand and agree'
    ),
    'help' => array(
        'intro'        => 'Need help?',
        'community'    => 'Contao Community Forum',
        'professional' => 'Professional support',
    ),
    'index' => array(
        'headline'      => 'Welcome to the Isotope 2 Migration Tool',
        'intro'         => 'This tool will migrate your Isotope 1.4 data to Isotope 2. Please read carefully before continuing.',
        'start'         => 'Start migration',
    ),
    'config' => array(
        'back'          => 'Back',
        'continue'      => 'Continue',
        'save'          => 'Save',
        'saveContinue'  => 'Save & Continue',
        'start'         => 'Start configuration',
    ),
    'execute' => array(
        'headline'          => 'Ready, set, go!',
        'intro'             => 'This is the last step before migration. Please read carefully before executing.', // TODO: write a better intro
        'back'              => 'Back',
        'cancel'            => 'Cancel',
        'cancel_confirm'    => 'Are you sure to cancel? This will delete all your configuration!',
        'continue'          => 'Execute migration',
        'error_headline'    => 'Slow down, young warrior …',
        'error_description' => 'Looks like you\'re not yet ready for the migration. Please start by reading the welcome text and then configure all necessary steps.',
        'error_button'      => 'Start over'
    ),
    'service' => array(
        'attribute' => array(
            'mm_title'       => 'Custom media manager attributes',
            'mm_explain'     => 'Your installation contains the following attributes of type "Media Manager".',
            'mm_description' => 'In Isotope 1.4, it was possible to define a gallery class for each attribute. This is no longer possible in Isotope 2, as galleries have become their own backend configuration. Technically this is still possible by adjusting templates, but someone needs to <a href="https://github.com/isotope/docs/issues/14" target="_blank">write documentation about it</a>…',
            'list'           => '%name% (database name "%field_name%")',
            'confirmation'   => 'Please confirm that you have read the above. It is your responsibility to adjust the templates if you need gallery classes.',
        ),
        'mail_template' => array(
            'gateway_legend' => 'E-Mail Gateway',
            'gateway_intro'  => 'Please select one of the available email gateways from notification center or select to create a new one for mail template migration.',
            'gateway_new'    => 'Create a new e-mail gateway',
            'gateway_db'     => 'Gateways from your database',
            'orderstatus'    => 'Order status "%name%"',
            'checkoutmodule' => 'Checkout module "%name%"'
        ),
        'shipping_method' => array(
            'name'                => '%name% (Type "%type%")',
            'old_title'           => 'Old shipping methods',
            'old_explain'         => 'The following shipping methods are no longer supported in Isotope 2 (core):',
            'old_description'     => 'We won\'t touch the data, so maybe you will find a third-party extension or you can contact a developer to fix this for you.',
            'unknown_title'       => 'Unknown shipping methods',
            'unknown_explain'     => 'The following shipping methods appear to be from third-party extensions:',
            'unknown_description' => 'We can\'t tell if they work in Isotope 2, nor are we able to migrate their data. We won\'t touch them though, so if you\'re lucky a third-party developer might provide an upgrade option.',
            'confirmation'        => 'Please confirm that you have read the above. It is your responsibility to not delete any data of the
            old/unsuppported shipping methods if you need them in the future.'
        ),
        'payment_method' => array(
            'name'                => '%name% (Type "%type%")',
            'old_title'           => 'Old payment methods',
            'old_explain'         => 'The following payment methods are no longer supported in Isotope 2 (core):',
            'old_description'     => 'We won\'t touch the data, so maybe you will find a third-party extension or you can contact a developer to fix this for you.',
            'unknown_title'       => 'Unknown payment methods',
            'unknown_explain'     => 'The following payment methods appear to be from third-party extensions:',
            'unknown_description' => 'We can\'t tell if they work in Isotope 2, nor are we able to migrate their data. We won\'t touch them though, so if you\'re lucky a third-party developer might provide an upgrade option.',
            'confirmation'        => 'Please confirm that you have read the above. It is your responsibility to not delete any data of the old/unsuppported payment methods if you need them in the future.'
        ),
        'download' => array(
            'titleAndDescription'   => 'The database columns tl_iso_download.title as well as tl_iso_download.description cannot be converted automatically. They contain the title as well as the description of a download (provided you entered them). In Contao 3+ you can manage meta data for files in the file system directly so there is no need for Isotope eCommerce to have yet another tilte or description field. Because the migration tool cannot automatically detect in what language you entered the data in Isotope 1.4 (and possibly how you translated them), it does not touch the data in any way at all! Make sure you do not (!!) delete tl_iso_download.description and tl_iso_download.title before you migrated the data manually!'
        ),
        'frontend_module' => array(
            'xhtml_title'       => 'XHTML page template',
            'xhtml_explain'     => 'The following page layouts use the XHTML template. XHTML templates are not supported by Isotope 2 core.',
            'xhtml_description' => 'Either you change your page layouts to HTML5 and adjust all your templates (recommended), or you must duplicate all Isotope templates and rename the file extension.',
            'confirmation'      => 'Please confirm that you have read the above. It is your responsibility to adjust the page layouts or create the XHTML templates.',
            'templates'         => 'The migration tool migrated the templates "iso_cart_full" to "iso_collection_default" and "iso_cart_mini" to "iso_collection_mini". However, it cannot migrate logic you built into your templates. You will have to check and adjust every (!) single template!'
        ),
        'gallery' => array(
            'gallery_empty' => 'Gallery configuration is empty.',
            'missing_name' => 'You must enter a name for each gallery.',
            'missing_config' => 'Every gallery must have a main and gallery image config.',
            'list_name' => 'List',
            'reader_name' => 'Reader',
            'gallery_legend' => 'Configure galleries',
            'gallery_intro' => 'Please setup your new galleries based on image sizes in shop configs of Isotope 1.x',
            'gallery_description' => <<<'HTML'
<p class="explain">In Isotope 2, the image sizes have been moved to gallery configurations. Every gallery configuration contains
    information about image sizes and link action (e.g. link to product or open lightbox).</p>
<p class="explain">The default configuration of Isotope 1.x contained four different image sizes: <i>gallery</i>, <i>thumbnail</i>, <i>medium</i> and <i>large</i>.<br>
If you followed these, you should choose <i>thumbnail</i> for both main and gallery image of the list gallery, and
setup the reader gallery like this: Main Image Size = <i>medium</i>, Gallery Size = <i>gallery</i>, Lightbox Size = <i>large</i>.</p>
</p>
HTML
,
            'gallery_row_id' => 'ID',
            'gallery_row_name' => 'Name',
            'gallery_row_main' => 'Main Image Size',
            'gallery_row_gallery' => 'Gallery Size',
            'gallery_row_lightbox' => 'Lightbox Size',
            'gallery_default' => 'Gallery #:id',
            'gallery_lightbox_blank' => 'None (for list galleries)',
            'gallery_delete_title' => 'Delete gallery',
            'gallery_add_title' => 'Add one more gallery configuration',
            'gallery_add_label' => 'Add another gallery',
            'productType_missing_config' => 'Please assign a list and reader gallery to each product type',
            'productType_legend' => 'Configure product types',
            'productType_intro' => 'Every product type must have a gallery configuration assigned.',
            'productType_description' => <<<'HTML'
<p class="explain">Here you need to assign your gallery configurations to the product types. Each product type has a gallery
for the list and one for the reader view. They can be the same, but you probably want one with lightbox in the reader,
but a link in the list. After migration, you can also override the gallery in each frontend module configuration.</p>
HTML
,
            'productType_row_id' => 'ID',
            'productType_row_name' => 'Name',
            'productType_row_list' => 'List Gallery',
            'productType_row_reader' => 'Reader Gallery',
        ),
        'product_collection' => array(
            'legend' => 'Surcharge types',
            'intro' => 'Please tell us of what type the existing surcharges are.',
            'description' => <<<'HTML'
<p class="explain">Each order can have unlimited surcharges in Isotope. This can be a payment surcharge, a shipping surcharge or anything similar.
Isotope 2 introduced surcharge types so developer can find out what each surcharge is.
Unfortunately, it's not possible to tell automatically, so you will need to configure this.</p>
<p class="explain">Most of the time you can simply check the label and it will become obvious to you what the surcharge is.
If you used third party extensions that added their own surcharges, please aks the developer what type they need for Isotope 2.
You can then use the "Custom" option and manually enter the value.</p>
HTML
,
            'label' => 'Label',
            'type' => 'Type',
            'surcharges_empty' => 'Surcharges configuration is empty.',
            'surcharge_type_missing' => 'You must select a type for each surcharge.',
        ),
    )
);
