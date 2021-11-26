TAG ?= latest
REPOSITORY = ghcr.io/city-of-helsinki/drupal-oc-cli

.PHONY: build push release

default: build

build:
	DOCKER_BUILDKIT=1 docker build -t $(REPOSITORY):$(TAG) ./

push:
	docker push $(REPOSITORY):$(TAG)

release: build push
