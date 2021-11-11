# Drupal docker images

Build scripts for Docker images used by City-of-Helsinki Drupal projects.

## OpenShift Drupal docker image

Contains production ready Docker images for Drupal.

See [openshift/drupal/Dockerfile](openshift/drupal/Dockerfile) to see how these images are built.

Available PHP versions: `8.0`, `7.4`:

- `ghcr.io/city-of-helsinki/drupal-docker-base:8.0`
- `ghcr.io/city-of-helsinki/drupal-docker-base:7.4`

See [drupal-helfi-platform/docker/openshift](https://github.com/City-of-Helsinki/drupal-helfi-platform/tree/main/docker/openshift) for an example how to use this image.

## CI docker images

Contains Docker images for testing Drupal.

See [ci/drupal/Dockerfile](ci/drupal/Dockerfile) and [ci/robo/Dockerfile](ci/robo/Dockerfile).

Available PHP versions: `8.0`, `7.4`:

- `ghcr.io/city-of-helsinki/drupal-php-docker:8.0`
- `ghcr.io/city-of-helsinki/drupal-php-docker:7.4`

All containers include packages necessary to run all Drupal tests (including FunctionalJavascript tests using `chromium-driver`).

See [test.yml](https://github.com/City-of-Helsinki/drupal-helfi-platform/blob/main/.github/workflows/test.yml.dist) for an example how to run tests using this image.

Available Robotframework images: `latest`:

- `ghcr.io/city-of-helsinki/drupal-robo:latest`

Contains necessary packages to run Robotframework tests.

## OpenShift Drupal repository image

Docker image used to run [City-of-Helsinki/drupal-repository](https://github.com/City-of-Helsinki/drupal-repository).
