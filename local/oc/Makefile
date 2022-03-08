TAG ?= latest
REPOSITORY = ghcr.io/city-of-helsinki/drupal-oc-cli

.PHONY: test-amd64 push-amd64 test-arm64 push-arm64

test-amd64:
	docker buildx build --load --platform linux/amd64 -t $(REPOSITORY):$(TAG) ./
push-amd64:
	docker buildx build --platform linux/amd64 -t $(REPOSITORY):$(TAG) ./ --push
test-arm64:
	docker buildx build --load --platform linux/arm64 -t $(REPOSITORY):$(TAG) ./
push-arm64:
	docker buildx build --platform linux/arm64 -t $(REPOSITORY):$(TAG) ./ --push

release: push-adm64 push-arm64
