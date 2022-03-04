FROM alpine:3.15.0

ENV OC_COMMIT_HASH=5fce66b5070e7e6806457548885f986bea6b9893
RUN \
  apk add --no-cache --virtual .build-deps \
    git \
    build-base \
    linux-headers \
    krb5-dev \
    go; \
  wget https://github.com/openshift/oc/archive/${OC_COMMIT_HASH}.zip -O oc.zip; \
  unzip -o oc.zip; \
  rm oc.zip; \
  cd oc-${OC_COMMIT_HASH}; \
  make oc && install -Dm755 oc -t "/usr/bin"; \
  rm -rf ../oc-* /root/go /root/.cache; \
  apk del .build-deps
