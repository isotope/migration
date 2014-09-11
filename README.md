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

1. Database is reset to the initial state
2. The Scenario sets up its configuration
3. The configuration is executed on the database
4. The result is compared to a fixture


## Adding new tests

By default, for every scenario there is a directory within `tests/fixtures` where its files can be placed.
To make it easier for you, there's a helper script to dump database tables in SQL or XML format.

Simply run either

	./tests/dump_iso_tables --initial [database] [username] [password] [scenario_fixture_path]

for the initial (SQL) or

	./tests/dump_iso_tables --expected [database] [username] [password] [scenario_fixture_path]

for the expected (XML) file.

**Note:** Make sure you do not simply use an Isotope 1.4 installation but an 1.4 installation
**after** regular Contao migration to version 3.3!

Assuming you test is called "MyPaymentTest", you commands could look like this:

```
./tests/dump_iso_tables --initial [database] [username] [password] my_payment/initial.sql

// run migration tool here

./tests/dump_iso_tables --expected [database] [username] [password] my_payment/expected.xml tl_iso_payment
```

Now you can write a unit test to check the XML file against your database after migration.