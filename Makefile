#!/bin/bash

## ------------------------------
## Author: Amirhossein Pooladvand
## ------------------------------

include .env
export

.PHONY: help all full dist

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Builds the docker-compose.yml file
	docker compose build --remove-orphans

rebuild: ## Rebuilds docker-compose.yml
	docker compose up --build --force-recreate --remove-orphans

up: ## Create and start containers
	docker compose up --remove-orphans

watch: ## Create, start and detach containers
	docker compose up -d --remove-orphans

down: ## Stop and remove resources
	docker compose down

ps: ## List project containers
	@docker compose ps -f name=${PROJECT_NAME}

login: ## Login into a specific container
	@read -p "Enter the container name:" CONTAINER_NAME; \
	docker exec -it $(PROJECT_NAME)-$$CONTAINER_NAME sh;

install: ## Runs yarn install
	docker compose run --rm node yarn install

dist: ## Runs yarn build APPLICATION_NAME
	@read -p "Enter the application name:" APPLICATION; \
	docker compose run --rm node yarn build $$APPLICATION;

full: install dist ## Runs all of the necessary
