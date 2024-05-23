DOCKER_COMPOSE = srcs/docker-compose.yml

all: create_folder build up

create_folder:
	mkdir -p /home/ylachhab/data/mariadb_data
	mkdir -p /home/ylachhab/data/wordpress_data

build:
	docker-compose -f $(DOCKER_COMPOSE) build

up:
	docker-compose -f $(DOCKER_COMPOSE) up -d

down:
	docker-compose -f $(DOCKER_COMPOSE) down

clean:
	docker-compose -f $(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans

.PHONY: build up down clean