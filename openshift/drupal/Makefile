PHONY :=
REPOSITORY = ghcr.io/city-of-helsinki/drupal-docker-base

PHONY += build-php80-dev
build-php80-dev:
	DOCKER_BUILDKIT=1 docker build --target=php80 -t $(REPOSITORY):8.0-dev --build-arg PHP_VERSION=8.0-fpm-alpine3.13 ./

PHONY += run-php80-dev
run-php80-dev:
	docker run -it --rm -u 100000 $(REPOSITORY):8.0-dev /bin/sh

PHONY += test-php80-dev
test-php80-dev: build-php80-dev
	cst test --image $(REPOSITORY):8.0-dev --config tests/php80.yaml
	cst test --image $(REPOSITORY):8.0-dev --config tests/php.yaml
	cst test --image $(REPOSITORY):8.0-dev --config tests/nginx.yaml

PHONY += push-php80-dev
push-php80-dev: test-php80-dev
	docker push $(REPOSITORY):8.0-dev

PHONY += build-php80
build-php80:
	DOCKER_BUILDKIT=1 docker build --target=php80 -t $(REPOSITORY):8.0 --build-arg PHP_VERSION=8.0-fpm-alpine3.13 ./

PHONY += push-php80
push-php80: test-php80
	docker push $(REPOSITORY):8.0

PHONY += run-php80
run-php80:
	docker run -it --rm -u 100000 $(REPOSITORY):8.0 /bin/sh

PHONY += test-php80
test-php80: build-php80
	cst test --image $(REPOSITORY):8.0 --config tests/php80.yaml
	cst test --image $(REPOSITORY):8.0 --config tests/php.yaml
	cst test --image $(REPOSITORY):8.0 --config tests/nginx.yaml

PHONY += build-php81-dev
build-php81-dev:
	DOCKER_BUILDKIT=1 docker build --target=php81 -t $(REPOSITORY):8.1-dev --build-arg PHP_VERSION=8.1.1-fpm-alpine3.15 ./

PHONY += run-php81-dev
run-php81-dev:
	docker run -it --rm -u 100000 $(REPOSITORY):8.1-dev /bin/sh

PHONY += test-php81-dev
test-php81-dev: build-php81-dev
	cst test --image $(REPOSITORY):8.1-dev --config tests/php80.yaml
	cst test --image $(REPOSITORY):8.1-dev --config tests/php.yaml
	cst test --image $(REPOSITORY):8.1-dev --config tests/nginx.yaml

PHONY += push-php81-dev
push-php81-dev: test-php81-dev
	docker push $(REPOSITORY):8.1-dev

PHONY += run-php81
run-php81:
	docker run -it --rm -u 100000 $(REPOSITORY):8.1 /bin/sh

PHONY += test-php81
test-php81: build-php81
	cst test --image $(REPOSITORY):8.1 --config tests/php80.yaml
	cst test --image $(REPOSITORY):8.1 --config tests/php.yaml
	cst test --image $(REPOSITORY):8.1 --config tests/nginx.yaml

PHONY += build-php81
build-php81:
	DOCKER_BUILDKIT=1 docker build --target=php81 -t $(REPOSITORY):8.1 --build-arg PHP_VERSION=8.1.1-fpm-alpine3.15 ./

PHONY += push-php81
push-php81: test-php81
	docker push $(REPOSITORY):8.1


.PHONY: $(PHONY)
