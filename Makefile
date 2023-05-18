export VIRTUAL_HOST := $(shell hostname)
export VIRTUAL_PATH = /nginx-proxy-running


.PHONY: dev down help
.DEFAULT_GOAL := help

help:
	@echo "Available commands:"
	@echo "  dev    : Create 'diomac' network if it doesn't exist and start nginx-proxy."
	@echo "  down   : Stop and remove containers, and delete 'diomac' network if it exists."

dev:
	@echo "Checking if Docker is running..."
	@if ! docker info > /dev/null 2>&1 ; then echo "Docker is not running. Please start Docker and try again."; exit 1; fi
	@echo "Creating network 'diomac' if it doesn't exist..."
	@docker network create diomac || true
	@echo "Starting nginx-proxy..."
	@docker-compose up -d
	@echo ""
	@echo "Access: http://$(VIRTUAL_HOST)$(VIRTUAL_PATH)"

down:
	@echo "Stopping and removing containers..."
	@docker-compose down
	@echo "Deleting network 'diomac' if it exists..."
	@docker network rm diomac || true
