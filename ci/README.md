# Drupal

Contains Docker images for testing Drupal.

## Drupal
### Included packages

- git
- libzip-dev
- zip
- libpng-dev
- mariadb-client
- chromium-driver
- gh (Github CLI)

### PHP extensions

- php-gd
- php-pdo
- php-zip
- php-bcmath

### PHP libraries

- drush 10.x
- composer

### Development

#### Building

- `make build TAG=8.0 PACKAGE=drupal`

#### Pushing

- `make push TAG=8.0 PACKAGE=drupal`

## Robotframework

Docker image used to test Drupal using Robotframework.

### Development

#### Building

- `make build TAG=latest PACKAGE=robo`

#### Pushing

- `make push TAG=latest PACKAGE=robo`

