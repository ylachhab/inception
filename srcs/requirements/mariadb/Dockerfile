FROM debian:buster

WORKDIR /app

RUN apt update && apt install mariadb-server -y

COPY script.sh .

ENTRYPOINT ["bash", "script.sh" ]

CMD [ "mysqld_safe" ]
