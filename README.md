# Dogwalkers

This application sets up a simple API with all basic operations to manage your DogWalking needs :tada:
It uses docker, docker-compose and rails to achieve such a feat!

## Requirements
 - A nice and recent Docker and docker-compose release on your machine.
 - https://docs.docker.com/install/
 - https://docs.docker.com/compose/install/

## Set up!

Run these commands in order, please:
 
	docker-compose build

	docker-compose run web rails webpacker:install

	docker-compose run web rake db:create

	docker-compose run web rake db:migrate

## Running the app!

	docker-compose up --build

## Running the test suite!

	docker-compose run web bundle exec rspec -c -fd -e "RAILS_ENV=test"

## Postman request collection

	https://documenter.getpostman.com/view/10475772/SzKTxKGB?version=latest

## Known ToDo's:
	- Use factorybot to clean up the tests!
	- Transfer private methods from the controller to helper modules
	- Add even more unit tests!
	- Implement status attribute usage (0 for scheduled, 1 for 'in progress' and 2 for 'done')