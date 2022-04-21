PHONY :=
PHP_VERSION ?= 8.0
TAG ?= $(PHP_VERSION)
REPOSITORY = ghcr.io/city-of-helsinki/drupal-php-docker
BASE_IMAGE_TAG = $(PHP_VERSION)-alpine3.15
COMPOSER_VERSION ?= 2.3

BUILDARGS += --build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG)

PHONY += run-php80
run-php80:
	docker run -it --rm -u 100000 $(REPOSITORY):8.0-alpine /bin/sh

PHONY += build-php80
build-php80:
	docker build -t $(REPOSITORY):8.0-alpine --build-arg BASE_IMAGE_TAG=8.0-alpine3.15 ./

PHONY += push-php80
push-php80: test-php80
	docker push $(REPOSITORY):8.0-alpine

PHONY += run-php81
run-php81:
	docker run -it --rm -u 100000 $(REPOSITORY):8.1-alpine /bin/sh

PHONY += build-php81
build-php81:
	docker build -t $(REPOSITORY):8.1-alpine --build-arg BASE_IMAGE_TAG=8.1-alpine3.15 ./

PHONY += push-php81
push-php81: test-php81
	docker push $(REPOSITORY):8.1-alpine

PHONY += test-php80
test-php80: build-php80
	cst test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.0-alpine --config tests/php80.yaml
	cst test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.0-alpine --config tests/php.yaml

PHONY += test-php81
test-php81: build-php81
	cst test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.1-alpine --config tests/php81.yaml
	cst test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.1-alpine --config tests/php.yaml

PHONY += test-php
test-php: test-php80 test-php81

PHONY += push-php
push-php: push-php80 push-php81

.PHONY: $(PHONY)
