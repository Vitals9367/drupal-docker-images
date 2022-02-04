# Drupal docker images

Build scripts for Docker images used by City-of-Helsinki Drupal projects.

## OpenShift Drupal docker image

Contains production ready Docker images for Drupal.

See [openshift/drupal/Dockerfile](openshift/drupal/Dockerfile) to see how these images are built.

Available PHP versions: `8.1`, `8.0`, `7.4`:

- `ghcr.io/city-of-helsinki/drupal-docker-base:8.1`
- `ghcr.io/city-of-helsinki/drupal-docker-base:8.0`
- `ghcr.io/city-of-helsinki/drupal-docker-base:7.4` (deprecated)

See [drupal-helfi-platform/docker/openshift](https://github.com/City-of-Helsinki/drupal-helfi-platform/tree/main/docker/openshift) for an example how to use this image.

## Local Drupal docker image

Based on [druidfi/drupal-web:8.0](https://github.com/druidfi/docker-images):

- `ghcr.io/city-of-helsinki/drupal-web:8.1`
- `ghcr.io/city-of-helsinki/drupal-web:8.0`

## CI docker images

Contains Docker images for testing Drupal.

See [ci/drupal/Dockerfile](ci/drupal/Dockerfile) and [ci/robo/Dockerfile](ci/robo/Dockerfile).

Available PHP versions: `8.1`, `8.0`, `7.4`:

- `ghcr.io/city-of-helsinki/drupal-php-docker:8.1-alpine`
- `ghcr.io/city-of-helsinki/drupal-php-docker:8.0-alpine`
- `ghcr.io/city-of-helsinki/drupal-php-docker:8.0`(deprecated, use `drupal-php-docker:8.0-alpine` instead)
- `ghcr.io/city-of-helsinki/drupal-php-docker:7.4` (deprecated, left for legacy reasons)

All images include packages necessary to run all Drupal tests (including FunctionalJavascript tests using `chromium-driver`).

See [test.yml](https://github.com/City-of-Helsinki/drupal-helfi-platform/blob/main/.github/workflows/test.yml.dist) for an example how to run tests using this image.

Available Robotframework images:

- `ghcr.io/city-of-helsinki/drupal-robo:alpine`

Contains necessary packages to run Robotframework tests.

## OpenShift Drupal repository image

Docker image used to run [City-of-Helsinki/drupal-repository](https://github.com/City-of-Helsinki/drupal-repository).
