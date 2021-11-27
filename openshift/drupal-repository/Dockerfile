FROM        golang:alpine3.14 AS build
WORKDIR     /go/src/github.com/adnanh/webhook
ENV         WEBHOOK_VERSION 2.8.0
RUN         apk add --update -t build-deps curl libc-dev gcc libgcc
RUN         curl -L --silent -o webhook.tar.gz https://github.com/adnanh/webhook/archive/${WEBHOOK_VERSION}.tar.gz && \
            tar -xzf webhook.tar.gz --strip 1 &&  \
            go get -d && \
            go build -o /usr/local/bin/webhook && \
            apk del --purge build-deps && \
            rm -rf /var/cache/apk/* && \
            rm -rf /go

FROM        alpine:3.14
COPY        --from=build /usr/local/bin/webhook /usr/local/bin/webhook
WORKDIR     /etc/webhook
VOLUME      ["/etc/webhook"]
EXPOSE      9000
ENTRYPOINT  ["/usr/local/bin/webhook"]

# We need php and git to build satis.
RUN         apk add --no-cache git php8 php8-openssl php8-common php8-json php8-phar php8-mbstring make
RUN         ln -s /usr/bin/php8 /usr/bin/php

COPY        --from=composer:2.0 /usr/bin/composer /usr/local/bin/

CMD         ["-verbose", "-hooks=/etc/webhook/hooks.json", "-template", "-hotreload", "-debug"]
