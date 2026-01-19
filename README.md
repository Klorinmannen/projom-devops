# Development setup scripts and instructions.

## Ubuntu
* ``* ./scripts/install.sh <user> <db_name> [php_version = 8.3]``

## Windows
* Download php >=8.3 thread safe x64 build
* Move to folder: C:\php-{8.3}\
* Enable extensions as needed in the "php-ini"-file(s).

### xdebug
* VSCode: use the extension.
* Else: Download the xdebug .dll-file and rename it to "php_xdebug.dll"
  * Put php_xdebug.dll inside your php directory /ext/ folder.
  * Edit php.ini:
    * Add: zend_extension=xdebug
    * Add: xdebug.mode=coverage
  * Set xdebug stub in VSCode Preferences: User Settings (JSON).
* Set php include folder: C:\php-{8.3}\

## PHPUnit 
### Installing
* ``composer require phpunit/phpunit``

### Setup
* Generate phpunit.xml configuration file: ``./vendor/bin/phpunit --generate-configuration``
* Edit configuration as needed.
  * Add test suites.
  * Check the include directory.
  * Add coverage / report .

### Usage
* Coverage report: ``./vendor/bin/phpunit --coverage-text="coverage/coverage.txt" --coverage-html="coverage/html"``
* Run all tests: ``./vendor/bin/phpunit``
* Run specific test suite: ``./vendor/bin/phpunit --testsuite="<test_suite>"``
* Run specific test: ``./vendor/bin/phpunit --filter "<method_name>" "<unit_test_file>"``
* Run without cache: ``./vendor/bin/phpunit --testsuite="<test_suite>" --do-not-cache``
