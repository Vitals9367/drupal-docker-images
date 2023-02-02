# Drupal docker images

Build scripts for Docker images used by City-of-Helsinki Drupal projects.

## Requirements

Login to `ghcr.io` docker repository: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry

## OpenShift Drupal docker image

Contains production Docker images for Drupal.

See:
- [City-of-Helsinki/drupal-helfi-platform/documentation/openshift.md](https://github.com/City-of-Helsinki/drupal-helfi-platform/blob/main/documentation/openshift.md) for documentation on how to use this image in your own project.
- [openshift/drupal/README.md](openshift/drupal/README.md) for developer documentation.

Available PHP versions: `8.2`, `8.1`, `8.0`:

- `ghcr.io/city-of-helsinki/drupal-docker-base:8.2`
- `ghcr.io/city-of-helsinki/drupal-docker-base:8.1`
- `ghcr.io/city-of-helsinki/drupal-docker-base:8.0`

## Local Drupal docker image

Based on [druidfi/drupal-web](https://github.com/druidfi/docker-images) with [few additions](https://github.com/City-of-Helsinki/drupal-docker-images/blob/main/local/drupal/Dockerfile):

- [OpenShift origin client (OC)](https://github.com/City-of-Helsinki/drupal-docker-images/tree/main/local/oc)
- Chromedriver, chrome to allow functional/function javascript tests to be run
- Force HTTPS nginx fastcgi parameter `on` to make sure Drupal generates URLs using `https`.

See [local/drupal/README.md](local/drupal/README.md) for documentation.

Available PHP versions: `8.2`, `8.1`, `8.0`:

- `ghcr.io/city-of-helsinki/drupal-web:8.2`
- `ghcr.io/city-of-helsinki/drupal-web:8.1`
- `ghcr.io/city-of-helsinki/drupal-web:8.0`

## CI docker images

Contains Docker images for testing Drupal.

See:
- [ci/drupal](ci/drupal) for more documentation about Drupal CI image.
- [ci/robo](ci/robo) for more documentation about Roboframework CI image.

Available PHP versions: `8.2`, `8.1`, `8.0`:

- `ghcr.io/city-of-helsinki/drupal-php-docker:8.2-alpine`
- `ghcr.io/city-of-helsinki/drupal-php-docker:8.1-alpine`
- `ghcr.io/city-of-helsinki/drupal-php-docker:8.0-alpine`
- `ghcr.io/city-of-helsinki/drupal-php-docker:8.0`(deprecated, use `drupal-php-docker:8.0-alpine` instead)

All images include packages necessary to run all Drupal tests (including FunctionalJavascript tests using `chromium-driver`).

See [test.yml](https://github.com/City-of-Helsinki/drupal-helfi-platform/blob/main/.github/workflows/test.yml.dist) for an example how to run tests using this image.

Available Robotframework images:

- `ghcr.io/city-of-helsinki/drupal-robo:dev`
- `ghcr.io/city-of-helsinki/drupal-robo:latest`

Contains necessary packages to run Robotframework tests.

## OpenShift Drupal repository image

Docker image used to run [City-of-Helsinki/drupal-repository](https://github.com/City-of-Helsinki/drupal-repository).

See [openshift/drupal-repository](openshift/drupal-repository) for more documentation.
