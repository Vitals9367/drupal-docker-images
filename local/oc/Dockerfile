FROM alpine:3.15.0

ENV OC_COMMIT_HASH=02c110006bfef4ba53fa5042bb9eae170dd3dc1c
RUN \
  apk add --no-cache --virtual .build-deps \
    git \
    build-base \
    krb5-dev \
    go; \
  wget https://github.com/openshift/oc/archive/${OC_COMMIT_HASH}.zip -O oc.zip; \
  unzip -o oc.zip; \
  cd oc-${OC_COMMIT_HASH}; \
  make oc && install -Dm755 oc -t "/usr/bin"; \
  rm -rf ../oc-* /root/go /root/.cache; \
  apk del .build-deps
