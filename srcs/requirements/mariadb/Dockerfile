FROM debian:bullseye

WORKDIR /app

RUN apt update && apt install mariadb-server -y

COPY tools/script.sh .

ENTRYPOINT ["bash", "script.sh" ]

CMD [ "mysqld_safe" ]
