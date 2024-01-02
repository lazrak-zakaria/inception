build:
	docker compose -f ./srcs/docker-compose.yml build 

up:
	docker compose -f ./srcs/docker-compose.yml  up

down:
	docker compose -f ./srcs/docker-compose.yml  down


stop:
	docker compose -f ./srcs/docker-compose.yml  stop

start:
	docker compose -f ./srcs/docker-compose.yml  start

delimages:
	docker rmi $$(docker images -aq) || true

delcontainers:
	docker rm -f $$(docker ps -aq) || true

delvol:
	docker volume rm $$(docker volume ls -q) || true

delnet:
	docker network rm $$(docker network ls -q) || true

rmdata:
	sudo rm -rf ~/data/wp/* ~/data/db/*

clean: delcontainers delimages delvol delnet rmdata