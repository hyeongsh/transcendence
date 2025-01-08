COMPOSE_FILE = srcs/docker-compose.yml
VOLUME_DIR=/Users/hyeongsh/42cursus/transcendence/srcs/project

all: up

up:
	@mkdir -p $(VOLUME_DIR)
	docker-compose -f $(COMPOSE_FILE) up --build -d

re: fclean up

logs:
	docker-compose -f $(COMPOSE_FILE) logs

clean:
	docker-compose -f $(COMPOSE_FILE) down -v

fclean: 
	docker-compose -f $(COMPOSE_FILE) down -v --rmi all

exec:
	docker exec django $(cmd)

it:
	docker exec -it django $(cmd)

.PHONY: all up re clean fclean exec it