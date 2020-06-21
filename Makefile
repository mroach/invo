.PHONY: setup-dev
setup-dev:
	docker-compose build
	docker-compose run --rm app mix do deps.get, ecto.setup
	docker-compose run --rm -w /opt/dev webpack npm install

	@echo "Dockerized development environment is setup and ready to go."

.PHONY: serve
serve:
	docker-compose up
