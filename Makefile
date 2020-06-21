export UID = $(shell id -u)
export GID = $(shell id -g)
export USER = $(shell whoami)

.PHONY: setup-dev
setup-dev:
	docker-compose build --build-arg UID=${UID} --build-arg GID=${GID} --build-arg USER=${USER}
	docker-compose run --rm app mix do deps.get, deps.compile, ecto.setup
	docker-compose run --rm -w /opt/dev webpack npm install

	@echo "Dockerized development environment is setup and ready to go."

.PHONY: serve
serve:
	docker-compose up
