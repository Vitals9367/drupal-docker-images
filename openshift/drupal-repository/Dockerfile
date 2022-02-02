FROM alpine:3.14
COPY --from=almir/webhook /usr/local/bin/webhook /usr/local/bin/webhook

# We need php and git to build satis.
RUN apk add --no-cache git php8 php8-openssl php8-common php8-json php8-phar php8-mbstring make ; \
  ln -s /usr/bin/php8 /usr/bin/php

ENV COMPOSER_HOME=/.composer
COPY --from=composer:2.2 /usr/bin/composer /usr/local/bin/
RUN \
  # COMPOSER_HOME permissions.
  mkdir -p $COMPOSER_HOME && \
  chmod -R a+rwx $COMPOSER_HOME

WORKDIR     /etc/webhook
VOLUME      ["/etc/webhook"]
EXPOSE      9000
ENTRYPOINT  ["/usr/local/bin/webhook"]
CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-template", "-hotreload", "-debug"]
