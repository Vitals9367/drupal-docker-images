PHP_VERSION ?= 8.0
TAG ?= 8.0
REPOSITORY = ghcr.io/city-of-helsinki/drupal-web

.PHONY: test-amd64 build-amd64 test-arm64 push-arm64

test-amd64:
	docker buildx build --load --platform linux/amd64 -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./
build-amd64:
	docker buildx build --platform linux/amd64 -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./ --push
test-arm64:
	docker buildx build --load --platform linux/arm64 -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./
push-arm64:
	docker buildx build --platform linux/arm64 -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./ --push

release: push-amd64 push-arm64
