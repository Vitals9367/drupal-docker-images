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

Slim image with:
```
docker-slim build \
  --target ghcr.io/city-of-helsinki/drupal-robo:latest \
  --tag ghcr.io/city-of-helsinki/drupal-robo:latest \
  --exec 'bash -c "cd /app/helfi-test-automation-python && robot --exitonfailure -i CRITICAL -A environments/ci.args -v PREFIX:/kaupunkiymparisto-ja-liikenne -d robotframework-reports ."' \
  --http-probe=false \
  --mount ./:/app \
  --network stonehenge-network \
  --etc-hosts-map "varnish-helfi-kymp.docker.so:host-gateway" \
  --etc-hosts-map "helfi-kymp.docker.so:host-gateway" \
  --etc-hosts-map "varnish-helfi-sote.docker.so:host-gateway" \
  --etc-hosts-map "helfi-sote.docker.so:host-gateway" \
  --preserve-path "/usr/local/lib/python3.9"
```
#### Building

- `make build TAG=latest PACKAGE=robo`

#### Pushing

- `make push TAG=latest PACKAGE=robo`

