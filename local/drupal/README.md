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

## Known issues

Sometimes chromium fails to install due to `unable to select packages` error, something like:

```
 => ERROR [linux/amd64 base  4/10] RUN sudo apk add --no-cache chromium chromium-chromedriver                                                                                                                                                          0.5s
 => CANCELED [linux/arm64 base  2/10] COPY --from=ghcr.io/city-of-helsinki/drupal-oc-cli:latest /usr/bin/oc /usr/bin/oc                                                                                                                                0.0s
------
 > [linux/amd64 base  4/10] RUN sudo apk add --no-cache chromium chromium-chromedriver:
#0 0.088 fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/main/x86_64/APKINDEX.tar.gz
#0 0.234 fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/community/x86_64/APKINDEX.tar.gz
#0 0.437 ERROR: unable to select packages:
#0 0.449   libdav1d-0.9.2-r0:
#0 0.449     conflicts: libdav1d-1.0.0-r0
#0 0.449     satisfies: ffmpeg-libs-4.4.1-r2[so:libdav1d.so.5]
#0 0.449   libdav1d-1.0.0-r0:
#0 0.449     conflicts: libdav1d-0.9.2-r0
#0 0.449     satisfies: libavif-0.9.3-r1[so:libdav1d.so.6
```

This can usually be fixed by changing the repository where chromium is installed from:

```diff
# Dockerfile
+RUN sudo apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community chromium chromium-chromedriver
-RUN sudo apk add --no-cache chromium chromium-chromedriver
```
