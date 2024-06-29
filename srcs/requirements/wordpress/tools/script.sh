#! /bin/sh

echo "listen = wordpress:9000" >> /etc/php/7.4/fpm/pool.d/www.conf

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

sleep 5

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# you're basically asking it to gather up all the main parts and pieces that make WordPress work
wp core download --allow-root
wp config create --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=mariadb:3306 --allow-root
wp core install --url=${DOMAIN_NAME} --title="Title" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root
wp user create ${USER_NAME} ${USER_EMAIL} --user_pass=${USER_PASSWORD} --role=author --allow-root


exec $@