# Local Drupal docker image

Based on [druidfi/drupal-web](https://github.com/druidfi/docker-images) with few additions:

- [OpenShift origin client (OC)](/local/oc)
- Chromedriver and chrome to allow functional/function javascript tests to be run
- Force HTTPS nginx fastcgi parameter `on` to make sure Drupal generates URLs using `https`
- Run php-fpm and nginx as same user to prevent some weird permission issues

Available PHP versions: `8.1`, `8.0`:

- `ghcr.io/city-of-helsinki/drupal-web:8.1`
- `ghcr.io/city-of-helsinki/drupal-web:8.0`

## Development

### Requirements

- [docker/buildx](https://github.com/docker/buildx) (most likely already included by default)
- Ability to build multi-platform images. See [docker/buildx#building-multi-platform-images](https://github.com/docker/buildx#building-multi-platform-images)

### Building

To run image locally:

- `8.0` tag (on `amd64` arch): `make run-php80-amd64`
- `8.1` tag (on `amd64` arch): `make run-php81-amd64`
- `8.0` tag (on `arm64` arch): `make run-php80-arm64`
- `8.1` tag (on `arm64` arch): `make run-php81-arm64`

To release a specific tag:

- Release `8.0` tag: `make push-php80`
- Release `8.1` tag: `make push-php81`

To release all tags at once: `make push-php`.
