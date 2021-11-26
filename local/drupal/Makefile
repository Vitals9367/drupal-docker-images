PHP_VERSION ?= 8.0
TAG ?= 8.0
REPOSITORY = ghcr.io/city-of-helsinki/drupal-web

.PHONY: build push release

default: build

build:
	docker build -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./

push:
	docker push $(REPOSITORY):$(TAG)

release: build push
