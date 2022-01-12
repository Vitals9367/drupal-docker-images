PHP_VERSION ?= 8.0
TAG ?= 8.0
REPOSITORY = ghcr.io/city-of-helsinki/drupal-web

.PHONY: build push release

default: build

build:
	docker buildx build --platform linux/arm64,linux/amd64 -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./

push:
	docker buildx build --platform linux/arm64,linux/amd64 -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./ --push

release: build push
