ARG PHP_VERSION
FROM druidfi/drupal-web:php-${PHP_VERSION} as base

COPY --from=ghcr.io/city-of-helsinki/drupal-oc-cli:latest /usr/bin/oc /usr/bin/oc

RUN sudo apk add --no-cache jq

# Install chromedriver.
RUN sudo apk add --no-cache chromium chromium-chromedriver

# Configure nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY custom.locations /etc/nginx/conf.d/custom.locations

# Override default fpm pool conf to run nginx and php-fpm as same user.
COPY php-fpm-pool.conf /etc/php8/php-fpm.d/www.conf

# Autostart chromedriver and drush server
COPY entrypoints/30-chromedriver.sh /entrypoints
COPY entrypoints/30-drush-server.sh /entrypoints
# Autostart syslog
COPY entrypoints/15-syslog.sh /entrypoints

FROM base as php81
RUN sudo apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing add php81-pecl-pcov

FROM base as php80
RUN sudo apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing add php8-pecl-pcov
