SHELL := /bin/bash
PHONY :=
COMMAND = openapi-generator-cli
REPOSITORY = ghcr.io/city-of-helsinki/php-openapi-generator
VERSION=5.3.0

ifeq ($(TAG),)
	TAG = latest
endif

PHONY += build-image
build-image:
	docker build -t $(REPOSITORY):$(TAG) --build-arg OPENAPI_VERSION=$(VERSION) ./

PHONY += push-image
push-image:
	docker push $(REPOSITORY):$(TAG)

.PHONY: $(PHONY)
