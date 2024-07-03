# Isotope eCommerce Migration Tool

The Isotope eCommerce Migration Tool takes care of updating your **Isotope eCommerce 1.4.8 database**
to Isotope eCommerce 2.2.*. Please note that it does only support this update path, other versions 
are not supported (yet)!

- [Dokumentation auf Deutsch](docs/de.md)
- [Developer Infos](docs/dev.md)


## Installation

There are two different installation methods to get the Migration Tool up and running. 
Choose the one that works best for you. For both of then, after you uploaded the file(s) into
the **root directory** of your Contao installation you then have to enter the mentioned URL to
execute the migration tool.

### Phar file

You can download a ".phar" file which represents the whole Migration Tool within one single file. 
Note that executing Phar files imposes some requirements on your server infrastructure and might 
not work for you. In such case, use the installation method "regular archive".

**URL to execute the migration tool:** http(s)://your-domain.tld/name-of-the-phar-file.phar.php

[Download](https://github.com/isotope/migration/releases/download/1.0.5/isotope-migration.phar.php.zip)

### Regular archive

You can download the Migration Tool as a packed archive from GitHub and upload the whole 
directory containing all the necessary files to your server.

**URL to execute the migration tool:** http(s)://your-domain.tld/name-of-the-directory/

[Download](https://github.com/isotope/migration/releases/download/1.0.5/isotope-migration.zip)


## Executing the migration

You are now about to migrate data of your online shop. This is not a trivial task and if you
run into errors it might happen that you need to start over. Having backups is thus an absolute must!

Once you installed it, the Migration Tool will explain all the necessary steps you have to take. 
Note that there are tons of things you have to do which the Migration Tool cannot do for you. 
Especially when you heavily customized your 1.4.8 installation (lots of template modifications, 
third-party extensions) the update will become a time-consuming task! In any case, the update 
from version 1.4.8 to 2.2.* will not be a piece of cake!

At this point we would like to make you aware of the 
[Isotope eCommerce Circle](https://circle.isotopeecommerce.org) which is where you 
can - as a member - get professional support.
