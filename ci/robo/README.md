# Robotframework CI image

Docker image used to test Drupal using Robotframework.

Available tags:

- `ghcr.io/city-of-helsinki/drupal-robo:dev`
- `ghcr.io/city-of-helsinki/drupal-robo:latest`

## Development

### Building

- To build `latest` tag: `make build-latest`
- To build `dev` tag: `make build`

### Release process

- To release `latest` tag: `make push-latest`
- To release `dev` tag: `make push`
