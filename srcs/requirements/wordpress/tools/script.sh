#! /bin/sh

echo "listen = wordpress:9000" >> /etc/php/7.3/fpm/pool.d/www.conf

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

sleep 15

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# while ! ping -c 1 mariadb > /dev/null 2>&1; do
# 	sleep 3
# done

wp core download --allow-root
wp config create --dbname=wp_db --dbuser=ylachhab --dbpass=2002 --dbhost=mariadb:3306 --allow-root
wp core install --url=localhost --title="Title" --admin_user=admin --admin_password=123 --admin_email=admin@gmail.com --allow-root
wp user create issam issam@gmail.com --role=author --allow-root

exec $@