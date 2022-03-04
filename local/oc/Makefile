TAG ?= latest
REPOSITORY = ghcr.io/city-of-helsinki/drupal-oc-cli

.PHONY: build push release

default: build

build-test:
	docker buildx build --load --progress=plain --platform linux/amd64 -t $(REPOSITORY):$(TAG) ./
build:
	docker buildx build --platform linux/arm64,linux/amd64 -t $(REPOSITORY):$(TAG) ./
push:
	docker buildx build --platform linux/arm64,linux/amd64 -t $(REPOSITORY):$(TAG) ./ --push

release: build push
