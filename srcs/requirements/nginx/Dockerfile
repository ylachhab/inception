FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/CN=${CN}"

COPY conf/conf.conf /etc/nginx/conf.d/default.conf

# COPY index.html /var/www/html/

# EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]