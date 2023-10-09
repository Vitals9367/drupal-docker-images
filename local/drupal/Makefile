PHONY :=
REPOSITORY = ghcr.io/city-of-helsinki/drupal-web

PHONY += run-php82-amd64
run-php82-amd64:
	$(call run_image,linux/amd64,php82,8.2)

PHONY += run-php81-amd64
run-php81-amd64:
	$(call run_image,linux/amd64,php81,8.1)

PHONY += run-php82-arm64
run-php82-arm64:
	$(call run_image,linux/arm64,php82,8.2)

PHONY += run-php81-arm64
run-php81-arm64:
	$(call run_image,linux/arm64,php81,8.1)

PHONY += push-php81
push-php81:
	$(call push_image,php81,8.1)

PHONY += push-php82
push-php82:
	$(call push_image,php82,8.2)

PHONY += push-php
push-php: push-php81 push-php82

define run_image
	docker buildx build --load --platform $(1) --target=$(2) -t $(REPOSITORY):$(3) --build-arg PHP_VERSION=$(3) ./
endef

define push_image
	docker buildx build --pull --platform linux/arm64,linux/amd64 --target=$(1) -t $(REPOSITORY):$(2) --build-arg PHP_VERSION=$(2) ./ --push
endef

.PHONY: $(PHONY)
