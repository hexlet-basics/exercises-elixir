-include /opt/basics/common/common.mk

install:
	mix deps.get

compose-setup: compose-build compose-install

compose:
	docker-compose up

compose-install:
	docker-compose run --rm exercises make install

compose-bash:
	docker-compose run --rm exercises bash

compose-build:
	docker-compose build

compose-down:
	docker-compose down -v --remove-orphans

compose-test:
	docker-compose run --rm exercises make test

compose-code-lint:
	docker-compose run --rm exercises make code-lint

code-lint-fix:
	mix format

code-lint:
	mix format --check-formatted && \
	mix credo

compose-description-lint:
	docker-compose run --rm exercises make description-lint

compose-schema-validate:
	docker-compose run --rm exercises make schema-validate

ci-check:
	docker-compose --file docker-compose.yml build
	docker-compose --file docker-compose.yml up --abort-on-container-exit
