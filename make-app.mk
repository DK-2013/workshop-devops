USER = "$(shell id -u):$(shell id -g)"

app:
	docker-compose up

app-:
	docker-compose down

app-build:
	docker-compose build

app-bash:
	docker-compose run --user=$(USER) app bash

app-setup: development-setup-env app-build app-db

development-setup-env:
	ansible-playbook ansible/development.yml -i ansible/development -vv

app-db:
	docker-compose run app bin/rails db:create
	docker-compose run app bin/rails db:migrate
