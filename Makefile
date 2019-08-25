compose: compose-build
	docker-compose up

compose-test:
	docker-compose -f docker-compose.test.yml run sut

compose-lint-code:
	docker-compose run exercises make lint-code

compose-format:
	docker-compose run exercises mix format

compose-lint-yaml:
	docker-compose run exercises make lint-yaml

compose-lint:
	docker-compose run exercises make lint

compose-install:
	docker-compose run exercises composer install

compose-bash:
	docker-compose run exercises bash

compose-build:
	docker-compose build

SUBDIRS := $(wildcard modules/**/*/.)

lint: lint-yaml lint-code

lint-yaml:
	yamllint modules

lint-code:
	mix credo

test: $(SUBDIRS)
$(SUBDIRS):
	@echo
	make -C $@ test
	@echo

.PHONY: all $(SUBDIRS)
