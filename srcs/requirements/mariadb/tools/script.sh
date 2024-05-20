#! /bin/sh

echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf
# echo "bind-address = mariadb >> /etc/mysql/mariadb.conf.d/50-server.cnf


# service mariadb start
mysqld_safe &
		# mysqld_safe : it starts the MySQL/MariaDB server process in the background and ensures 
		#			that it runs with proper error handling and logging
		# & : allowing you to continue using the terminal while the process runs in the background.

sleep 5

mysql -e "create database if not exists ${MARIADB_DATABASE};
	create user if not exists '${MARIADB_USER}'@'%' identified by '${MARIADB_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%'  IDENTIFIED BY '${MARIADB_PASSWORD}';
	create user if not exists 'root'@'localhost' identified by '${MARIADB_ROOT_PASSWORD}';
	flush privileges;"

# service mariadb stop
mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown
mysqld_safe

exec $@
