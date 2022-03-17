M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######################
### MAIN FUNCTIONS ###
######################

.PHONY: dynamodb_start
dynamodb_start: ## Start the dynamodb docker container
	$(info $(M) Starting an instance of dynamodb)
	@docker stack rm dynamodb
	@docker stack deploy -c ./docker/docker-compose-swarm.yml dynamodb

.PHONY: dynamodb_stop
dynamodb_stop: ## Stopping running dynamodb instances
	$(info $(M) Stopping dynamodb instance)
	@docker stack rm dynamodb

.DEFAULT_GOAL := help