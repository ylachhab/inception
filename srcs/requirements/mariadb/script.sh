#! /bin/sh

echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf
# echo "bind-address = mariadb >> /etc/mysql/mariadb.conf.d/50-server.cnf


mysqld_safe &
		# mysqld_safe : it starts the MySQL/MariaDB server process in the background and ensures 
		#			that it runs with proper error handling and logging
		# & : allowing you to continue using the terminal while the process runs in the background.

sleep 10

mysql -e "create database mariadb;
	set password for 'root'@'localhost' = password('123');
	create user 'ylachhab'@'%' identified by '2002';
	grant usage on *.* to 'ylachhab'@'%';
	grant all on \`mariadb\`.* to 'ylachhab'@'%';
	flush privileges;"

#service mariadb stop
#mysqld_safe