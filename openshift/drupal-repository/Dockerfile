FROM alpine:3.17
COPY --from=almir/webhook /usr/local/bin/webhook /usr/local/bin/webhook

# We need php and git to build satis.
RUN apk add --no-cache git php81 php81-openssl php81-common php81-json php81-phar php81-mbstring php81-pecl-apcu make

ENV COMPOSER_HOME=/.composer
ENV PROJECT_DIR=/var/www/html
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/
RUN \
  # COMPOSER_HOME permissions.
  mkdir -p $COMPOSER_HOME && \
  chmod -R a+rwx $COMPOSER_HOME

WORKDIR     /etc/webhook
VOLUME      ["/etc/webhook"]
EXPOSE      9000
ENTRYPOINT  ["/usr/local/bin/webhook"]
CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-template", "-hotreload", "-debug"]
