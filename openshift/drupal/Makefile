REPOSITORY = ghcr.io/city-of-helsinki/drupal-docker-base

.PHONY: build-php80-dev build-php80 push-php80-dev push-php80 build-php81-dev build-php81 push-php81-dev push-php81

build-php80-dev:
	DOCKER_BUILDKIT=1 docker build --target=php80 -t $(REPOSITORY):8.0-dev --build-arg PHP_VERSION=8.0-fpm-alpine3.13 ./
build-php80:
	DOCKER_BUILDKIT=1 docker build --target=php80 -t $(REPOSITORY):8.0 --build-arg PHP_VERSION=8.0-fpm-alpine3.13 ./
push-php80:
	docker push $(REPOSITORY):8.0
push-php80-dev:
	docker push $(REPOSITORY):8.0-dev

build-php81-dev:
	DOCKER_BUILDKIT=1 docker build --target=php81 -t $(REPOSITORY):8.1-dev --build-arg PHP_VERSION=8.1.1-fpm-alpine3.15 ./
build-php81:
	DOCKER_BUILDKIT=1 docker build --target=php81 -t $(REPOSITORY):8.1 --build-arg PHP_VERSION=8.1.1-fpm-alpine3.15 ./
push-php81:
	docker push $(REPOSITORY):8.1
push-php81-dev:
	docker push $(REPOSITORY):8.1-dev
