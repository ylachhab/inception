#! /bin/sh

#This allows the MariaDB server to accept connections from any IP address.
echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe &

sleep 5

mysql -e "create database if not exists ${MARIADB_DATABASE};
	create user if not exists '${MARIADB_USER}'@'%' identified by '${MARIADB_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%'  IDENTIFIED BY '${MARIADB_PASSWORD}';
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
	flush privileges;"

mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown

#to execute the command specified as arguments when running the script.
exec $@
