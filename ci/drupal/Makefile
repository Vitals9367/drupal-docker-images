PHONY :=
REPOSITORY = ghcr.io/city-of-helsinki/drupal-php-docker

PHONY += run-php81
run-php81:
	docker run -it --rm -u 100000 $(REPOSITORY):8.1-alpine /bin/sh

PHONY += build-php81
build-php81:
	$(call build_image,8.1)

PHONY += push-php81
push-php81: test-php81
	docker push $(REPOSITORY):8.1-alpine

PHONY += run-php82
run-php82:
	docker run -it --rm -u 100000 $(REPOSITORY):8.2-alpine /bin/sh

PHONY += build-php82
build-php82:
	$(call build_image,8.2)

PHONY += push-php82
push-php82: test-php82
	docker push $(REPOSITORY):8.2-alpine

PHONY += test-php81
test-php81: build-php81
	container-structure-test test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.1-alpine --config tests/php81.yaml
	container-structure-test test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.1-alpine --config tests/php.yaml

PHONY += test-php82
test-php82: build-php82
	container-structure-test test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.2-alpine --config tests/php82.yaml
	container-structure-test test --image ghcr.io/city-of-helsinki/drupal-php-docker:8.2-alpine --config tests/php.yaml

PHONY += test-php
test-php: test-php81 test-php82

PHONY += push-php
push-php: push-php81 push-php82

define build_image
	docker build --pull -t $(REPOSITORY):$(1)-alpine --build-arg BASE_IMAGE_TAG=$(1)-alpine ./
endef

.PHONY: $(PHONY)
