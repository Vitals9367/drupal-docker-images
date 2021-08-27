ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm-alpine3.13 as php

# install the PHP extensions we need
RUN set -eux; \
	\
	apk add --no-cache --virtual .build-deps \
		coreutils \
		freetype-dev \
		libjpeg-turbo-dev \
		libpng-dev \
		libzip-dev \
    autoconf \
    g++ \
    libtool \
    make \
	; \
	\
	docker-php-ext-configure gd \
		--with-freetype \
		--with-jpeg=/usr/include \
	; \
	\
	docker-php-ext-install -j "$(nproc)" \
		gd \
		opcache \
		pdo_mysql \
		zip \
	; \
	\
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apk add --virtual .drupal-phpexts-rundeps $runDeps; \
	apk del .build-deps

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# override memory limit and upload max filesize and post max size
# to enable bigger uploads
RUN { \
		echo 'memory_limit=512M'; \
		echo 'upload_max_filesize=32M'; \
		echo 'post_max_size=32M'; \
	} > /usr/local/etc/php/conf.d/php-overrides.ini

# Install required tools (https://docs.acquia.com/blt/install/)
# alpine-sdk required for the make script in composer.json
RUN apk update && apk upgrade && \
    apk add --no-cache git patch rsync bash mariadb-client alpine-sdk tini nginx bash

# Override default fpm pool conf to run nginx and php-fpm as same user.
COPY php-fpm-pool.conf /usr/local/etc/php-fpm.d/www.conf

# Install Composer
COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/

ENV PATH=${PATH}:/app/vendor/bin
ENV COMPOSER_HOME=/.composer

# Copy configuration files and scripts
COPY files/ /
RUN chmod +x /entrypoints/*
RUN chmod +x /usr/local/bin/entrypoint

# Fetch certificate for the Azure MariaDB service
RUN wget https://www.digicert.com/CACerts/BaltimoreCyberTrustRoot.crt.pem -O /usr/local/share/ca-certificates/BaltimoreCyberTrustRoot.crt.pem

ENV DRUSH_LAUNCHER_SHA256SUM 52b5e22031789e087e4f79ac49c74d94c0379ad6859f3ec14671ce1647a3b7a6
# Install drush launcher
RUN \
  curl -fSL -o drush "https://github.com/drush-ops/drush-launcher/releases/download/0.9.1/drush.phar" && \
  echo "$DRUSH_LAUNCHER_SHA256SUM *drush" | sha256sum -c -

RUN chmod +x drush && mv drush /usr/local/bin

# Create missing nginx folder.
RUN mkdir -p /run/nginx
COPY drupal.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-custom.locations /etc/nginx/conf.d/custom.locations

RUN \
  # COMPOSER_HOME permissions.
  mkdir -p $COMPOSER_HOME && \
  chmod -R a+rwx $COMPOSER_HOME && \
  # File permissions to code base
  chmod -R a+rwx /var/www/html && \
  # Correct permissions to nginx folders.
  chmod -R a+rwx /var/lib/nginx && \
  chmod -R a+rwx /var/log/nginx && \
  chmod -R a+rwx /etc/nginx/conf.d

# Expose nginx
EXPOSE 8080

ENTRYPOINT ["/sbin/tini", "--"]

# Default command: Start up multiple services via entrypoint
CMD ["entrypoint"]
