ARG PHP_VERSION
FROM druidfi/drupal-web:php-${PHP_VERSION} as base

COPY --from=ghcr.io/city-of-helsinki/drupal-oc-cli:latest /usr/bin/oc /usr/bin/oc

RUN sudo apk add --no-cache jq

# Autostart drush server and syslog services.
COPY entrypoints/ /entrypoints

COPY files/ /

FROM base as php81
RUN sudo apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing  \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main  \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community add php81-pecl-pcov php81-pecl-imagick
# Override default fpm pool conf to run nginx and php-fpm as same user.
COPY php-fpm-pool.conf /etc/php81/php-fpm.d/www.conf

FROM base as php82
RUN sudo apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main  \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/releases add php82-pecl-imagick && \
  # @todo Remove this once php82 has pcov package
  sudo apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/releases php82-dev php82-pear && \
  sudo apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main g++ autoconf make pcre2-dev && \
  sudo pecl82 install pcov && \
  sudo apk del --no-cache g++ autoconf pcre2-dev && \
  echo 'extension=pcov.so' | sudo tee -a /etc/php82/conf.d/pcov.ini
# Override default fpm pool conf to run nginx and php-fpm as same user.
COPY php-fpm-pool.conf /etc/php82/php-fpm.d/www.conf
