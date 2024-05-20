#! /bin/sh

echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf
# echo "bind-address = mariadb >> /etc/mysql/mariadb.conf.d/50-server.cnf


# service mariadb start
mysqld_safe &
		# mysqld_safe : it starts the MySQL/MariaDB server process in the background and ensures 
		#			that it runs with proper error handling and logging
		# & : allowing you to continue using the terminal while the process runs in the background.

sleep 10

mysql -e "create database if not exists wp_db;
	create user if not exists 'ylachhab'@'%' identified by '2002';
	GRANT ALL PRIVILEGES ON wp_db.* TO 'ylachhab'@'%'  IDENTIFIED BY '2002';
	create user if not exists 'root'@'localhost' identified by '123';
	flush privileges;"

# service mariadb stop
mysqladmin -u root -p"123" shutdown
mysqld_safe

exec $@
