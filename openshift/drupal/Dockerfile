ARG PHP_VERSION
FROM php:${PHP_VERSION} as php

ENV ELASTIC_APM_SHA256SUM dfcbb89b348621f96f775938b7b60cc809a4bf6147ced1531ebacc20b929bbd0
RUN \
  curl -fSL https://github.com/elastic/apm-agent-php/releases/download/v1.3.1/apm-agent-php_1.3.1_all.apk > apm-agent-php.apk && \
  echo "$ELASTIC_APM_SHA256SUM *apm-agent-php.apk" | sha256sum -c - && \
  apk add --allow-untrusted apm-agent-php.apk && \
  rm apm-agent-php.apk

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
    echo 'max_execution_time=180'; \
	} > /usr/local/etc/php/conf.d/php-overrides.ini

# Install required tools (https://docs.acquia.com/blt/install/)
# alpine-sdk required for the make script in composer.json
RUN apk update && apk upgrade && \
    apk add --no-cache git patch rsync bash mariadb-client alpine-sdk tini nginx bash

# Override default fpm pool conf to run nginx and php-fpm as same user.
COPY php-fpm-pool.conf /usr/local/etc/php-fpm.d/www.conf

# Install Composer
COPY --from=composer:2.2 /usr/bin/composer /usr/local/bin/

ENV PATH=${PATH}:/app/vendor/bin
ENV COMPOSER_HOME=/.composer

# Copy configuration files and scripts
COPY files/ /
RUN chmod +x /entrypoints/* && \
  chmod +x /usr/local/bin/entrypoint

# Fetch certificate for the Azure MariaDB service
RUN wget https://www.digicert.com/CACerts/BaltimoreCyberTrustRoot.crt.pem -O /usr/local/share/ca-certificates/BaltimoreCyberTrustRoot.crt.pem

ENV DRUSH_LAUNCHER_SHA256SUM c6e3e520a33ac7790ab37e5af0fd91fc1108f0830a3a5ebe5b7c36e8782bea30
# Install drush launcher
RUN \
  curl -fSL -o drush "https://github.com/drush-ops/drush-launcher/releases/download/0.10.1/drush.phar" && \
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
  chmod -R a+rwx /etc/nginx/conf.d && \
  # Redirect log output to docker log collector.
  touch /var/log/drupal.log && \
  ln -sf /proc/1/fd/1 /var/log/nginx/access.log && \
  ln -sf /proc/1/fd/2 /var/log/nginx/error.log && \
  ln -sf /proc/1/fd/1 /var/log/drupal.log

# Expose nginx
EXPOSE 8080

ENTRYPOINT ["/sbin/tini", "--"]

# Default command: Start up multiple services via entrypoint
CMD ["entrypoint"]

# install the PHP extensions we need
FROM php as php80
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
  pecl install mysqlnd_azure apcu \
    redis \
  ; \
  \
	docker-php-ext-configure gd \
		--with-freetype \
		--with-jpeg=/usr/include \
	; \
	\
  docker-php-ext-enable apcu.so mysqlnd_azure.so redis; \
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

FROM php as php81
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
  pecl install apcu \
    redis \
  ; \
  \
	docker-php-ext-configure gd \
		--with-freetype \
		--with-jpeg=/usr/include \
	; \
	\
  docker-php-ext-enable apcu.so redis; \
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
	apk del .build-deps; \
  rm -r /tmp/*;
