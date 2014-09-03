# Isotope eCommerce Migration Tool

develop: [![Build Status](https://travis-ci.org/isotope/migration.svg?branch=develop)](https://travis-ci.org/isotope/migration)
master: [![Build Status](https://travis-ci.org/isotope/migration.svg?branch=master)](https://travis-ci.org/isotope/migration)

This is the Isotope eCommerce Migration Tool. It migrates the data of your
1.4 installations to 2.x.!


## Running the unit tests

To run the unit tests locally you have to add a local mysql database and then
copy the file `phpunit.xml.dist` to `phpunit.xml` and adjust the database
settings in the file.


Then call

	./vendor/bin/phpunit


### Scenarios

The tests can work with scenarios whereas a scenario stands for a certain
configuration. The following happens for every scenario:

1. Database is reset to the initial state. (`initial.sql`)
* The Scenario sets up its configuration
* The configuration is executed on the database
* The result is compared to a fixture (`expected.xml`)


## Adding new tests

For every scenario there is a directory within `tests/fixtures` which must contain
two xml files that define the initial and expected state of the database.
To make it easier for you, there's a helper script. Simply run either

	./tests/dump_iso_tables --initial [database] [username] [password] [scenario_fixture_path]

for the initial or

	./tests/dump_iso_tables --expected [database] [username] [password] [scenario_fixture_path]

for the expected file.

**Note:** Make sure you do not simply use an Isotope 1.4 installation but an 1.4 installation
**after** regular Contao migration to version 3.3!

Assuming you named your scenario "42", you should thus end up having the following
structure:

* fixtures
    * scenarios/
        *scenario42
            * initial.sql
            * expected.xml
* src
    * Scenario
        * Scenario42Test.php