# Dogwalkers

This application sets up a simple API with all basic CRUD operations to manage your DogWalking needs :tada:
It uses docker, docker-compose and rails to achieve such a feat!

## Requirements
 - A nice and recent Docker and docker-compose release on your machine.

## Set up!

Run these commands in order, please:
 
	docker-compose build

	docker-compose run web rails webpacker:install

	docker-compose run web rake db:create

## Running the app!

	docker-compose up --build

## Running the test suite!

	docker-compose run -e "RAILS_ENV=test" web rspec

## Postman request collection

	link placeholder