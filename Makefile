SERVER = "php-server"

install: ## Install the project
	@make env
	@make up
	docker exec -it $(SERVER) composer install

up: ## Start the server
	docker build -t image .
	docker run --name $(SERVER) -qp $(APP_PORT):9000 -ditv $(ROOT)/app:/var/www image 

down: ## Stop the server
	docker stop $(SERVER) && docker rm -f $(SERVER)

restart: ## Restart the server
	@make stop
	@make start
	
clean: ## Clean all
	docker rmi -f image
	docker system prune -af >/dev/null

watch: ## Start the server and show the realtime logs
	@make up
	@make logs
	
exec: ## Execute a bash in the server
	docker exec -it $(SERVER) /bin/bash
	
logs: ## Start showing the server logs
	docker logs $(SERVER) --tail=20 -f
	
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-10s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

env:
	test -f .env || cp .env.example .env
	
ROOT = $(PWD)
ifneq (,$(wildcard .env))
	include .env
else
	APP_PORT ?= 8080
endif
