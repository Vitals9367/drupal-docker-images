REPOSITORY = ghcr.io/city-of-helsinki/drupal-repository

ifeq ($(TAG),)
	TAG = latest
endif

.PHONY: build push release

default: build

run:
	docker run -it --rm -u 100000 $(REPOSITORY):$(TAG) /bin/sh
build:
	docker build -t $(REPOSITORY):$(TAG) ./

push:
	docker push $(REPOSITORY):$(TAG)

release: build push
