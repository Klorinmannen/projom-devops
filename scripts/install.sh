#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <system> <user> <DB_USER> <db_name> [php_version = 8.3]"
	exit 1
fi
USER=$1

if [ -z "$2" ]; then
	echo "Usage: $0 <system> <user> <DB_USER> <db_name> [php_version = 8.3]"
	exit 1
fi
DB_NAME=$2

PHP_VERSION="8.3"
if [ -z "$3" ]; then
	echo "No PHP version provided, using default: $PHP_VERSION"
else
	PHP_VERSION=$3
fi

sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install curl

sleep 1

bash ./scripts/php.sh $PHP_VERSION

sleep 1

bash ./scripts/mariadb_install.sh $USER $DB_NAME
if [ $? -ne 0 ]; then
	echo "Error: MariaDB installation failed"
	exit 1
fi

sleep 1

bash ./scripts/ssh_key_pair.sh $USER
if [ $? -ne 0 ]; then
	echo "Error: SSH key pair generation failed"
	exit 1
fi

exit 0
