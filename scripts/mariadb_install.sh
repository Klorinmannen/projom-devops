#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <USER> <DATABASE_NAME>"
	exit 1
fi
USER=$1

if [ -z "$2" ]; then
	echo "Usage: $0 <USER> <DATABASE_NAME>"
	exit 1
fi
DATABASE_NAME=$2

HOST="localhost"
if [ -z "$3" ]; then
	echo "No host provided, using default: localhost"
else
	HOST=$3
fi

PASSWORD=$(openssl rand -base64 12);
PASSWORD=${PASSWORD:0:8}
if [ -z $4 ]; then
	echo "No password provided, using generated password: $PASSWORD"
else
	PASSWORD=$4
fi

echo -e "\n\n**Installing MariaDB server packages**\n\n"
sudo apt-get -y install mariadb-server
sudo apt-get -y install openssl

sleep 1

echo "Creating database: $DATABASE_NAME .."
sudo mysql --password=root -e "CREATE DATABASE $DATABASE_NAME;"
if [ $? -ne 0 ]; then
	echo "Error creating database: $DATABASE_NAME"
	exit 1
fi

echo "Creating user: $USER @ $HOST with password: $PASSWORD .."
sudo mysql --password=root -e "CREATE USER '$USER'@'$HOST' IDENTIFIED BY '$PASSWORD';"
if [ $? -ne 0 ]; then
	echo "Error creating user: $USER @ $HOST with password: $PASSWORD"
	exit 1
fi

echo -e "Setting up grants on $DATABASE_NAME.* for $USER @ $HOST .. \n"
sudo mysql -e "GRANT CREATE, CREATE TEMPORARY TABLES ON $DATABASE_NAME.* TO '$USER'@'$HOST';"
sudo mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON $DATABASE_NAME.* TO '$USER'@'$HOST';"
if [ $? -ne 0 ]; then
	echo "Error setting grants: $DATABASE_NAME.* TO $USER @ $HOST"
	exit 1
fi

sudo mysql -e "FLUSH PRIVILEGES;"

echo -e "\n\n***SAVE THIS INFORMATION!***"
echo "User: $USER @ $HOST, Password: $PASSWORD, Database: $DATABASE_NAME"
echo -e "***SAVE THIS INFORMATION***\n\n"

sleep 1

echo -e "Restarting MariaDB server service .. \n"
sudo systemctl restart mariadb.service

exit 0
