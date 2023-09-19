# Robotframework CI image

*_IMPORTANT_: This is no longer updated and should not be used!*

Docker image used to test Drupal using Robotframework.

Available tags:

- `ghcr.io/city-of-helsinki/drupal-robo:dev`
- `ghcr.io/city-of-helsinki/drupal-robo:latest`

## Development

It's highly recommended to build `dev` tag first and test the changes locally before pushing them into `latest` tag.

### Building

- To build `dev` tag: `make build`
- To build `latest` tag: `make build-latest`

### Release process

- To release `dev` tag: `make push`
- To release `latest` tag: `make push-latest`
