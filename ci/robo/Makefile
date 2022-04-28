REPOSITORY = ghcr.io/city-of-helsinki/drupal-robo
BASE_IMAGE_TAG = 3.9
BUILDARGS ?= --build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG)

.PHONY: build push release

build:
	docker build -t $(REPOSITORY):dev $(BUILDARGS) ./

push:
	docker push $(REPOSITORY):dev

build-latest:
	docker build -t $(REPOSITORY):latest $(BUILDARGS) ./

push-latest:
	docker push $(REPOSITORY):latest

release-drupal: build push
