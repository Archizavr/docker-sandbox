.PHONY: help

help: ## Display this help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ PostgreSQL
pg_start: ## Run the docker compose
	docker compose -f docker-compose-postgres.yml up -d

pg_stop: ## Stop the docker compose
	docker compose -f docker-compose-postgres.yml down -v

pg_connect: # Connect to the PostgreSQL container
	docker exec -it pg_db psql -U admin -d school_db

##@ Redis
redis_start: ## Run the docker compose
	docker compose -f docker-compose-redis.yml up -d

redis_stop: ## Stop the docker compose
	docker compose -f docker-compose-redis.yml down -v

redis_connect: # Connect to the Redis container
	docker exec -it redis redis-cli