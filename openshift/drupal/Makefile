PHP_VERSION ?= 8.1.1-fpm-alpine3.15
TAG ?= 8.1-dev
REPOSITORY = ghcr.io/city-of-helsinki/drupal-docker-base
DOCKERFILE ?= Dockerfile

.PHONY: build push release

default: build

build:
	docker build -f $(DOCKERFILE) -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./

push:
	docker push $(REPOSITORY):$(TAG)

release: build push
