-include /opt/basics/common/common.mk

compose-setup: compose-build compose-install

compose:
	docker-compose up

compose-install:
	docker-compose run exercises mix deps.get

compose-build:
	docker-compose build

code-lint:
	mix credo

compose-format:
	docker-compose run exercises mix format
