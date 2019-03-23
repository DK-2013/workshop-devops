USER = "$(shell id -u):$(shell id -g)"

app:
	docker-compose up

app-:
	docker-compose down

app-setup: app-build app-db

app-db:
	docker-compose run app bin/rails db:create
	docker-compose run app bin/rails db:migrate

app-build:
	docker-compose build

app-bash:
	docker-compose run --user=$(USER) app bash

app-clear:
	docker-compose run app rm -r tmp