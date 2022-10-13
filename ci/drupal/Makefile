PHONY :=
REPOSITORY = ghcr.io/city-of-helsinki/drupal-php-docker

PHONY += run-php80
run-php80:
	docker run -it --rm -u 100000 $(REPOSITORY):8.0-alpine /bin/sh

PHONY += build-php80
build-php80:
	$(call build_image,8.0)

PHONY += push-php80
push-php80: test-php80
	docker push $(REPOSITORY):8.0-alpine

PHONY += run-php81
run-php81:
	docker run -it --rm -u 100000 $(REPOSITORY):8.1-alpine /bin/sh

PHONY += build-php81
build-php81:
	$(call build_image,8.1)

PHONY += push-php81
push-php81: test-php81
	docker push $(REPOSITORY):8.1-alpine

PHONY += test-php80
test-php80: build-php80
	container-structure-test test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.0-alpine --config tests/php80.yaml
	container-structure-test test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.0-alpine --config tests/php.yaml

PHONY += test-php81
test-php81: build-php81
	container-structure-test test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.1-alpine --config tests/php81.yaml
	container-structure-test test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.1-alpine --config tests/php.yaml

PHONY += test-php
test-php: test-php80 test-php81

PHONY += push-php
push-php: push-php80 push-php81

define build_image
	docker build --pull --no-cache -t $(REPOSITORY):$(1)-alpine --build-arg BASE_IMAGE_TAG=$(1)-alpine3.15 ./
endef

.PHONY: $(PHONY)
