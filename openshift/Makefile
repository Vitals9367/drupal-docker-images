PHP_VERSION ?= 8.0
REPOSITORY = ghcr.io/city-of-helsinki/drupal-docker-base

ifeq ($(TAG),)
	TAG = $(PHP_VERSION)
endif

.PHONY: build push release

default: build

build:
	docker build -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(TAG) ./

push:
	docker push $(REPOSITORY):$(TAG)

release: build push
