.PHONY: help

help: ## Display this help screen
	@awk 'BEGIN {FS = ":.*?##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_%-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


##@ PostgreSQL
pg_start: ## Run the docker compose for PostgreSQL
	docker compose -f docker-compose-postgres.yml up -d

pg_stop: ## Stop the docker compose for PostgreSQL
	docker compose -f docker-compose-postgres.yml down -v

pg_connect: # Connect to the PostgreSQL container
	docker exec -it pg_db psql -U admin -d school_db


##@ Redis
redis_start: ## Run the docker compose for Redis
	docker compose -f docker-compose-redis.yml up -d

redis_connect: # Connect to the Redis container
	docker exec -it redis redis-cli

FILE_ID ?= 0
run_redis_scenario-%: ## Run Redis scenario with specified file ID (default: 0)
	@echo "Running Redis scenario #$*"
	bash redis/scenarios/redis-scenario-$*.sh
%:
	@:

redis_stop: ## Stop the docker compose for Redis
	docker compose -f docker-compose-redis.yml down -v


##@ Nginx
nginx_start: ## Run the docker compose for Nginx
	docker compose -f docker-compose-nginx.yml up -d

nginx_renew_container: ## Restart the docker compose for Nginx
	docker compose -f docker-compose-nginx.yml up -d --build

nginx_stop: ## Stop the docker compose for Nginx
	docker compose -f docker-compose-nginx.yml down -v


##@ Kafka
kafka_start: ## Run the docker compose for Kafka
	docker compose -f docker-compose-kafka.yml up -d

kafka_run_scenario: ## Run Kafka scenario 1
	bash kafka/kafka_scenario1.sh

kafka_stop: ## Stop the docker compose for Kafka
	docker compose -f docker-compose-kafka.yml down -v