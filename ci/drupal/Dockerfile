ARG BASE_IMAGE_TAG
FROM php:${BASE_IMAGE_TAG}
ARG DRUSH

RUN apt-get update -yqq && apt-get install gpg -yqq
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Install PHP and composer dependencies
RUN apt-get update -yqq && apt-get install git libzip-dev zip libpng-dev mariadb-client chromium-driver jq gh -yqq

# Install needed extensions
RUN docker-php-ext-install gd pdo_mysql zip bcmath

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install drush
RUN composer global require "drush/drush:${DRUSH}.*"

ENV PATH "$PATH:/root/.config/composer/vendor/bin"
