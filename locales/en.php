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
        'contao'         => 'Your Contao installation was not found. To fix this problem, make sure you placed the migration tool in the root folder of your installation and there is localconfig.php in your "system/config" directory.',
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
        'prepare_headline' => 'Preparing your installation',
        'prepare_description' => 'We will guide you step by step through the migration. But first, make sure your installation meets our expectations. The migration tool will not be able to run if you do not correctly prepare your database.',
        'prepare_step1' => 'Your installation must be updated to Isotope version v1.4.8. If you are using an older version, you must first upgrade to v1.4.8. This will adjust existing v0.2/v1.3 databases.',
        'prepare_step2' => 'If you have a multilingual shop, make sure to delete the <i>isotope_multilingual</i> extension. The functionality is already included in Isotope 2 and the data will be migrated automatically.',
        'prepare_step3' => 'Update Contao to version 3.3. Migrating to 3.2 is currently not possible.  There are two ways:',
        'prepare_step4' => 'Update the database using the Contao install tool. You should be in core only mode, so you can execute all recommended changes to the database.',
        'prepare_liveupdate' => 'Using <a href="http://www.inetrobots.com/shop/product_info.php?info=p12_contao-live-update-id.html&language=en" target="_blank">the Live-Update service</a>, which will take care of any necessary changes (recommended).',
        'prepare_manual' => 'Manually, by following <a href="https://contao.org/en/manual/3.3/installation.html#manual-update" target="_blank">the manual update guide</a>.',
        'prepare_warning' => 'If you do not follow this process, the database will not be ready and the migration configuration step will report errors.',
        'info_headline' => 'What you must know',
        'info_part1' => 'The migration tool will convert the database from Isotope version 1.4.8 to version 2. It will NOT touch any of your files and it will NOT change any templates. A lot of templates have changed in Isotope 2 and your customizations will no longer work. It is very likely you will need to start from scratch with your template adjustments.',
        'info_part2' => 'Due to the API changes, we assume ALL existing extensions for Isotope 1.4 will no longer work with version 2. If you have installed any Isotope-related extension, check for available updates or contact the developers if necessary. We will try not to destroy any third-party data.',
        'thanks_headline' => 'Many Thanks!',
        'thanks_description' => 'The development of this migration tool would not have been possible without our community. Thanks to the donators on our fundraising:<br>Kim Wormer, Monique Hahnefeld, Websache, Cyrill Weiss, Karlheinz Büscher, Holger Neuner, Mingel2k',  // TODO: Update list of supporters!
    ),
    'config' => array(
        'back'          => 'Back',
        'continue'      => 'Continue',
        'save'          => 'Save',
        'saveContinue'  => 'Save & continue',
        'start'         => 'Start configuration',
    ),
    'config_intro' => array(
        'headline'           => 'Set up migration',
        'description'        => 'Tell us about your installation so we can migrate the database.',
        'step_headline'      => 'Step by step',
        'step_description'   => 'The migration tool is split into multiple steps. Each migration step will take care of a small part of the application. You can see the list of migration steps in the navigation to the left side.',
        'step_list'          => 'Every step has three different states:',
        'grey'               => 'Grey if your input is required',
        'green'              => 'Green if everything is ready',
        'red'                => 'Red if something is wrong',
        'secure_headline'    => 'Don\'t worry',
        'secure_description' => 'We\'re not changing your database during the configuration process. Your input is stored in the browser session. The migration can only be executed if all steps are green.',
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
        'error_button'      => 'Start over',
        'success_headline' => 'Configuration successful',
        'success_description' => 'You have successfully answered all questions and configured the migration tool.',
        'backup_headline' => 'Did you create a backup?',
        'backup_description' => 'Please be aware that we are not responsible for your data. Here\'s what the LGP license says:',
        'lgpl' => 'This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the <a href="https://www.gnu.org/licenses/lgpl.html" target="_blank">GNU Lesser General Public License</a> for more details.',
    ),
    'service' => array(
        'address_book' => array(
            'service_name'        => 'Address Book',
            'service_description' => 'Migrates the member address book'
        ),
        'attribute' => array(
            'service_name'        => 'Product attributes',
            'service_description' => 'Migrates product attributes from shop configuration',
            'mm_title'       => 'Custom media manager attributes',
            'mm_explain'     => 'Your installation contains the following attributes of type "Media Manager".',
            'mm_description' => 'In Isotope 1.4, it was possible to define a gallery class for each attribute. This is no longer possible in Isotope 2, as galleries have become their own backend configuration. Technically this is still possible by adjusting templates, but someone needs to <a href="https://github.com/isotope/docs/issues/14" target="_blank">write documentation about it</a>…',
            'list'           => '%name% (database name "%field_name%")',
            'confirmation'   => 'Please confirm that you have read the above. It is your responsibility to adjust the templates if you need gallery classes.',
        ),
        'download' => array(
            'service_name'        => 'Downloads',
            'service_description' => 'Migrates product downloads and updates orders with downloads.',
            'titleAndDescription' => 'The database columns tl_iso_download.title as well as tl_iso_download.description cannot be converted automatically. They contain the title as well as the description of a download (provided you entered them). In Contao 3+ you can manage meta data for files in the file system directly so there is no need for Isotope eCommerce to have yet another tilte or description field. Because the migration tool cannot automatically detect in what language you entered the data in Isotope 1.4 (and possibly how you translated them), it does not touch the data in any way at all! Make sure you do not (!!) delete tl_iso_download.description and tl_iso_download.title before you migrated the data manually!'
        ),
        'frontend_module' => array(
            'service_name'        => 'Frontend modules',
            'service_description' => 'Migrate front end module configuration.',
            'xhtml_title'       => 'XHTML page template',
            'xhtml_explain'     => 'The following page layouts use the XHTML template. XHTML templates are not supported by Isotope 2 core.',
            'xhtml_description' => 'Either you change your page layouts to HTML5 and adjust all your templates (recommended), or you must duplicate all Isotope templates and rename the file extension.',
            'confirmation'      => 'Please confirm that you have read the above. It is your responsibility to adjust the page layouts or create the XHTML templates.',
            'templates'         => 'The migration tool migrated the templates "iso_cart_full" to "iso_collection_default" and "iso_cart_mini" to "iso_collection_mini". However, it cannot migrate logic you built into your templates. You will have to check and adjust every (!) single template!'
        ),
        'gallery' => array(
            'service_name'        => 'Galleries',
            'service_description' => 'Create galleries from old shop configurations.',
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
        'mail_template' => array(
            'service_name'        => 'Mail Templates',
            'service_description' => 'Migrates mail templates to notification center.',
            'gateway_legend' => 'E-Mail Gateway',
            'gateway_intro'  => 'Please select one of the available email gateways from notification center or select to create a new one for mail template migration.',
            'gateway_new'    => 'Create a new e-mail gateway',
            'gateway_db'     => 'Gateways from your database',
            'orderstatus'    => 'Order status "%name%"',
            'checkoutmodule' => 'Checkout module "%name%"',
            'gateway_label'  => 'E-Mail Gateway (from Isotope Migration)'
        ),
        'payment_method' => array(
            'service_name'        => 'Payment Methods',
            'service_description' => 'Migrates payment methods.',
            'name'                => '%name% (Type "%type%")',
            'old_title'           => 'Old payment methods',
            'old_explain'         => 'The following payment methods are no longer supported in Isotope 2 (core):',
            'old_description'     => 'We won\'t touch the data, so maybe you will find a third-party extension or you can contact a developer to fix this for you.',
            'unknown_title'       => 'Unknown payment methods',
            'unknown_explain'     => 'The following payment methods appear to be from third-party extensions:',
            'unknown_description' => 'We can\'t tell if they work in Isotope 2, nor are we able to migrate their data. We won\'t touch them though, so if you\'re lucky a third-party developer might provide an upgrade option.',
            'confirmation'        => 'Please confirm that you have read the above. It is your responsibility to not delete any data of the old/unsuppported payment methods if you need them in the future.'
        ),
        'product_collection' => array(
            'service_name'        => 'Product collections',
            'service_description' => 'Migrates order information',
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
        'product_data' => array(
            'service_name'        => 'Product data',
            'service_description' => 'Migrates product data.'
        ),
        'product_type' => array(
            'service_name'        => 'Product type',
            'service_description' => 'Migrates product types'
        ),
        'related_product' => array(
            'service_name'        => 'Related Products',
            'service_description' => 'Migrates related products and their categories.'
        ),
        'shipping_method' => array(
            'service_name'        => 'Shipping Methods',
            'service_description' => 'Migrates shipping methods.',
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
        'shop_config' => array(
            'service_name'        => 'Shop Configuration',
            'service_description' => 'Migrates shop configuration.'
        ),
        'translation' => array(
            'service_name'        => 'Translations',
            'service_description' => 'Migrates translation labels.'
        ),
    )
);
