## Scripts

### Install script
* ``* ./scripts/install.sh <user> <db_name> [php_version = 8.3]``

### MariaDB
#### Install MariaDB and add local user + database
* ``./scripts/mariadb_install.sh <user> <database_name> [host = localhost, password = random]``

#### Remote user
* Change Configuration: ``/etc/mysql/mariadb.conf.d/50-server.cnf`` and the value ``bind-address=0.0.0.0``
* ``systemctl restart mariadb.service``

### SSH key pair
Creates ssh key pair and starts the ssh-agent
* ``./scripts/ssh_key_pair.sh <ssh_key_name> [ssh_key_comment = ""]``

### PHP with composer
* ``./scripts/php.sh [php_version = 8.3]``

### Apache2
Install apache2 + vhost.
* ``./scripts/apache2.sh <domain>``
