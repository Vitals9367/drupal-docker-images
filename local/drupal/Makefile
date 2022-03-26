PHP_VERSION ?= 8.0
TAG ?= 8.0
REPOSITORY = ghcr.io/city-of-helsinki/drupal-web

ifeq ($(PHP_VERSION),8.0)
	TARGET=php80
else
	TARGET=php81
endif
.PHONY: test-amd64 test-arm64 release

test-amd64:
	docker buildx build --load --platform linux/amd64 --target=$(TARGET) -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./
test-arm64:
	docker buildx build --load --platform linux/arm64 --target=$(TARGET) -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./
release:
	docker buildx build --platform linux/arm64,linux/amd64 --target=$(TARGET) -t $(REPOSITORY):$(TAG) --build-arg PHP_VERSION=$(PHP_VERSION) ./ --push
