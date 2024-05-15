FROM debian:buster

WORKDIR /app

RUN apt update && apt install mariadb-server -y

COPY script.sh .

CMD ["bash", "script.sh" ]
