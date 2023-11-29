FROM alpine:3.18

ENV OC_TAG=openshift-clients-4.13.0-202304190216
RUN \
  apk add --no-cache --virtual .build-deps \
    git \
    gpgme-dev \
    libassuan-dev \
    build-base \
    linux-headers \
    krb5-dev \
    go; \
  git clone --branch ${OC_TAG} https://github.com/openshift/oc.git /oc-code; \
  cd /oc-code; \
  make oc && install -Dm755 oc -t "/usr/bin"; \
  rm -rf /oc-code /root/go /root/.cache; \
  apk del .build-deps ; \
  oc version
