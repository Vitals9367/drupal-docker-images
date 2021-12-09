PHP_VERSION ?= 8.1-fpm-alpine-3.15
TAG ?= 8.1-dev
REPOSITORY = ghcr.io/city-of-helsinki/drupal-docker-base

.PHONY: build push release

default: build

build:
	docker build -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./

push:
	docker push $(REPOSITORY):$(TAG)

release: build push
