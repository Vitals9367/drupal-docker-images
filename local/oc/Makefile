PHONY :=
REPOSITORY = ghcr.io/city-of-helsinki/drupal-oc-cli

.PHONY: test-amd64 test-arm64 release

test-amd64:
	docker buildx build --load --platform linux/amd64 -t $(REPOSITORY):$(TAG) ./
test-arm64:
	docker buildx build --load --platform linux/arm64 -t $(REPOSITORY):$(TAG) ./
push-arm64:
	docker buildx build --platform linux/arm64 -t $(REPOSITORY):$(TAG) ./ --push

PHONY += push-php80
push-php80:
	$(call push_image,8.0)

PHONY += push-php81
push-php81:
	$(call push_image,8.1)

PHONY += push-php
push-php: push-php81 push-php80

define test_image
	docker buildx build --load --platform $(1) -t $(REPOSITORY):$(2) ./
endef

define push_image
	docker buildx build --platform linux/amd64,linux/arm64 -t $(REPOSITORY):$(1) ./ --push
endef

.PHONY: $(PHONY)
