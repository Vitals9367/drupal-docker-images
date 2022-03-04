PHP_VERSION ?= 8.0
TAG ?= $(PHP_VERSION)
REPOSITORY = ghcr.io/city-of-helsinki/drupal-php-docker
BASE_IMAGE_TAG = $(PHP_VERSION)-alpine3.15

BUILDARGS += --build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG)

.PHONY: build-php80 build-php81 push-php80 push-php81

build-php80:
	docker build -t $(REPOSITORY):8.0-alpine --build-arg BASE_IMAGE_TAG=8.0-alpine3.15 ./

push-php80:
	docker push $(REPOSITORY):8.0-alpine

build-php81:
	docker build -t $(REPOSITORY):8.1-alpine --build-arg BASE_IMAGE_TAG=8.1-alpine3.15 ./

push-php81:
	docker push $(REPOSITORY):8.1-alpine

default: build-php80
