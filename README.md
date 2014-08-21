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


## Adding new tests

There is one sql file in `tests/fixtures` which defines how the initial state
of the database should look before each test is executed. This file is called
`initial.sql` If you want to adjust the initial state you will have to adjust
that file. The easiest way to do this is to use `mysqldump`. For the sake of your
nerves there's a helper script. Simply run

	./tests/dump_iso_tables [database] [username] [password] ./tests/fixtures/initial.sql


### Scenarios

The tests work with scenarios whereas a scenario stands for a certain
configuration. The following happens for every scenario:

1. Database is reset to the initial state (`initial.sql`)
* The Scenario sets up its configuration
* The configuration is executed on the database
* The result is compared to a fixture with the same name (e.g. (`scenario1.xml`))

### Result fixtures

To compare the database to a desired state you need to add result fixtures.
E.g. `Scenario1Test` is executed and afterwards compared to the file `scenario1.xml`
which must contain the correct/expected result of the test.
To create such an xml file the easiest way is to bring the database to the desired
state and then run the command line script that is shipped within the `tests`
directory:

	./tests/dump_iso_tables_xml [database] [username] [password] ./tests/fixtures/scenario1.xml

