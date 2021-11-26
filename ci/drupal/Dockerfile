ARG BASE_IMAGE_TAG
FROM php:${BASE_IMAGE_TAG}

ENV GH_SHA256SUM 76bd37160c61cf668b96a362ebc01d23736ebf94ec9dfe3090cacea37fd3b3fb
RUN \
  curl -fSL -o gh.tar.gz "https://github.com/cli/cli/releases/download/v2.2.0/gh_2.2.0_linux_amd64.tar.gz" && \
  echo "$GH_SHA256SUM *gh.tar.gz" | sha256sum -c - && \
  tar -zxvf gh.tar.gz && \
  mv gh_2.2.0_linux_amd64/bin/gh /usr/bin/gh && \
  chmod +x /usr/bin/gh && \
  rm -rf gh_2.2.0_linux_amd64/ && \
  rm gh.tar.gz

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
  pecl install apcu; \
  \
	docker-php-ext-configure gd \
		--with-freetype \
		--with-jpeg=/usr/include \
	; \
	\
  docker-php-ext-enable apcu.so; \
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

# Install required tools
RUN apk update && apk upgrade && \
    apk add --no-cache \
    git \
    patch \
    mariadb-client \
    chromium \
    chromium-chromedriver \
    # druidfi/tools has dependency to make and
    # 'make cast-spell' has dependency to bash
    make \
    bash \
    jq

# Install Composer
COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/
ENV PATH=${PATH}:/app/vendor/bin
ENV COMPOSER_HOME=/.composer

# Install drush
ENV DRUSH_LAUNCHER_SHA256SUM 52b5e22031789e087e4f79ac49c74d94c0379ad6859f3ec14671ce1647a3b7a6
# Install drush launcher
RUN \
  curl -fSL -o drush "https://github.com/drush-ops/drush-launcher/releases/download/0.9.1/drush.phar" && \
  echo "$DRUSH_LAUNCHER_SHA256SUM *drush" | sha256sum -c - && \
  chmod +x drush && \
  mv drush /usr/bin/local

RUN rm -r /var/cache/*
