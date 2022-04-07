REPOSITORY = ghcr.io/city-of-helsinki/drupal-robo
TAG ?= latest
BASE_IMAGE_TAG = 3.9
BUILDARGS ?= --build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG)

.PHONY: build push release

build:
	docker build -t $(REPOSITORY):$(TAG) $(BUILDARGS) ./

push:
	docker push $(REPOSITORY):$(TAG)

release-drupal: build push
