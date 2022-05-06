PHONY :=
REPOSITORY = ghcr.io/city-of-helsinki/drupal-docker-base

PHONY += push-php-dev
push-php-dev: push-php-81-dev push-php-80-dev

PHONY += push-php81-dev
push-php81-dev: test-php81-dev
	docker push $(REPOSITORY):8.1-dev

PHONY += push-php80-dev
push-php80-dev: test-php80-dev
	docker push $(REPOSITORY):8.0-dev

PHONY += push-php
push-php: push-php-81 push-php-80

PHONY += push-php81
push-php81: test-php81
	docker push $(REPOSITORY):8.1

PHONY += push-php80
push-php80: test-php80
	docker push $(REPOSITORY):8.0

PHONY += build-php
build-php: build-php81 build php80

PHONY += build-php-dev
build-php-dev: build-php81-dev build-php80-dev

PHONY += build-php81-dev
build-php81-dev:
	$(call build_image,php81-dev)

PHONY += build-php80-dev
build-php80-dev:
	$(call build_image,php80-dev)

PHONY += build-php80
build-php80:
	$(call build_image,php80)

PHONY += build-php81
build-php81:
	$(call build_image,php81)

PHONY += test-php80-dev
test-php80-dev: build-php80-dev
	$(call run_tests,8.0-dev)

PHONY += test-php80
test-php80: build-php80
	$(call run_tests,8.0)

PHONY += test-php81-dev
test-php81-dev: build-php81-dev
	$(call run_tests,8.0-dev)

PHONY += test-php81
test-php81: build-php81
	$(call run_tests,8.1)

PHONY += run-php80
run-php80:
	docker run -it --rm -u 100000 $(REPOSITORY):8.0 /bin/sh

PHONY += run-php80-dev
run-php80-dev:
	docker run -it --rm -u 100000 $(REPOSITORY):8.0-dev /bin/sh

PHONY += run-php81-dev
run-php81-dev:
	docker run -it --rm -u 100000 $(REPOSITORY):8.1-dev /bin/sh

PHONY += run-php81
run-php81:
	docker run -it --rm -u 100000 $(REPOSITORY):8.1 /bin/sh

define run_tests
	cst test --image $(REPOSITORY):$(1) --config tests/php$(subst -dev,,$(subst .,,$(1))).yaml
	cst test --image $(REPOSITORY):$(1) --config tests/php.yaml
	cst test --image $(REPOSITORY):$(1) --config tests/nginx.yaml
endef

define build_image
	DOCKER_BUILDKIT=1 docker buildx bake --load -f docker-bake.hcl $(1)
endef

.PHONY: $(PHONY)
