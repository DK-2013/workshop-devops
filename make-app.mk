USER = "$(shell id -u):$(shell id -g)"

app:
	docker-compose up

app-:
	docker-compose down

#app-setup: app-build
#	docker-compose run --user=$(USER) app <install deps>

#app-db:
#  docker-compose run bin/rails setup

app-build:
	docker-compose build

app-bash:
	docker-compose run --user=$(USER) app bash

app-clear:
	docker-compose run app rm -r tmp