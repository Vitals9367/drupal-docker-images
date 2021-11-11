BUILDARGS ?=

ifndef PACKAGE
$(error PACKAGE flag is not set)
endif

ifeq ($(PACKAGE),drupal)
PHP_VERSION ?= 8.0
TAG ?= $(PHP_VERSION)
DRUSH ?= 10
REPOSITORY = ghcr.io/city-of-helsinki/drupal-php-docker
BUILDARGS += --build-arg DRUSH=$(DRUSH)
BASE_IMAGE_TAG = $(PHP_VERSION)
endif

ifeq ($(PACKAGE),robo)
REPOSITORY = ghcr.io/city-of-helsinki/drupal-robo
TAG ?= latest
BASE_IMAGE_TAG = 3.9
endif

ifndef TAG
$(error TAG flag is not set)
endif

BUILDARGS += --build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG)

.PHONY: build push release

build:
	docker build -f $(PACKAGE)/Dockerfile -t $(REPOSITORY):$(TAG) $(BUILDARGS) ./

push:
	docker push $(REPOSITORY):$(TAG)

release-drupal: build push
