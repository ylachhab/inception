FROM debian:buster

WORKDIR /var/www/html

RUN apt update && apt install -y mariadb-client curl php php-fpm php-mysqlnd

RUN mkdir -p /run/php

COPY tools/script.sh .

ENTRYPOINT  [ "bash", "script.sh" ]

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]