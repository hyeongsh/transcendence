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

start:
	@docker exec -d django bash -c "python3 manage.py runserver 0.0.0.0:8000 > /logs/django.log 2>&1"

stop:
	@docker exec django pkill -f "python3 manage.py runserver"

restart: stop start

.PHONY: all up re clean fclean exec it start stop