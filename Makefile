
COMPOSE_FILE = ./srcs/docker-compose.yml
ENV_PATH = ./srcs/.env
DATA_ROOT = ~/data

all:
	docker-compose -f ${COMPOSE_FILE} --env-file ${ENV_PATH} up -d

down :
	docker-compose -f ${COMPOSE_FILE} down

clean :
	-docker-compose -f ${COMPOSE_FILE} down --rmi all

fclean: clean
	docker system prune -af
	-docker volume rm $$(docker volume ls -q)
	sudo rm -rf ${DATA_ROOT}/mariadb ${DATA_ROOT}/wordpress
	mkdir ${DATA_ROOT}/mariadb ${DATA_ROOT}/wordpress

re: fclean all

.PHONY: all mariadb clean fclean re
