help:
	@echo "\n${ORANGE}usage: make ${BLUE}COMMAND${NC}"
	@echo "\n${YELLOW}Commands:${NC}"
	@echo "  ${BLUE}php-cs-fixer          : ${LIGHT_BLUE}Check Symfony Coding standard.${NC}"
	@echo "  ${BLUE}clean                 : ${LIGHT_BLUE}Clean directories for reset.${NC}"
	@echo "  ${BLUE}c-install             : ${LIGHT_BLUE}Install PHP/SF4 dependencies with composer.${NC}"
	@echo "  ${BLUE}c-update              : ${LIGHT_BLUE}Update PHP/SF4 dependencies with composer.${NC}"
	@echo "  ${BLUE}docker-start          : ${LIGHT_BLUE}Create and start containers.${NC}"
	@echo "  ${BLUE}docker-stop           : ${LIGHT_BLUE}Stop and clear all services.${NC}"
	@echo "  ${BLUE}logs                  : ${LIGHT_BLUE}Follow log output.${NC}"

init:
	@echo "${BLUE}Project configuration initialization:${NC}"
	@$(shell cp -n $(shell pwd)/docker-compose.yml.dist $(shell pwd)/docker-compose.yml 2> /dev/null)
	@$(shell cp -n $(shell pwd)/sf-api/composer.json.dist $(shell pwd)/sf-api/composer.json 2> /dev/null)

clean:
	@echo "${BLUE}Clean directories:${NC}"
	@rm -Rf docker-compose.yml
	@rm -Rf sf-api/composer.json
	@rm -Rf sf-api/composer.lock
	@rm -Rf sf-api/symfony.lock
	@rm -Rf sf-api/vendor
	@rm -Rf sf-api/var
	@rm -Rf sf-api/.php_cs.caches

c-update:
	@echo "${BLUE}Updating your application dependencies:${NC}"
	@docker-compose exec -T php composer update

c-install:
	@echo "${BLUE}Installing your application dependencies:${NC}"
	@docker-compose exec -T php composer install

docker-start: init
	@echo "${BLUE}Starting all containers:${NC}"
	@docker-compose up -d
	@make c-install

docker-stop:
	@echo "${BLUE}Stopping all containers:${NC}"
	@docker-compose down -v

logs:
	@docker-compose logs -f

# Shell colors.
RED=\033[0;31m
LIGHT_RED=\033[1;31m
GREEN=\033[0;32m
LIGHT_GREEN=\033[1;32m
ORANGE=\033[0;33m
YELLOW=\033[1;33m
BLUE=\033[0;34m
LIGHT_BLUE=\033[1;34m
PURPLE=\033[0;35m
LIGHT_PURPLE=\033[1;35m
CYAN=\033[0;36m
LIGHT_CYAN=\033[1;36m
NC=\033[0m

.PHONY: clean test php-cs-fixer init