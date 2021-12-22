ARG BASE_IMAGE_TAG
FROM python:${BASE_IMAGE_TAG}-alpine3.14

ENV PYTHONPYCACHEPREFIX="/var/cache/python/"
# Install system dependencies
RUN apk update; \
  apk --no-cache upgrade; \
  apk --no-cache add \
    chromium \
    chromium-chromedriver \
    imagemagick \
    ; \
 apk add --virtual .build-deps \
    python3-dev \
    automake \
    gcc \
    g++ \
    zlib \
    zlib-dev \
    jpeg-dev \
    libffi-dev \
    ; \
  pip install --upgrade --no-cache-dir pip \
    ; \
  pip install \
    --no-cache-dir \
    --upgrade \
    robotframework-pabot \
    Pillow \
    robotframework \
    robotframework-eyes \
    robotframework-seleniumlibrary \
    ; \
 apk del .build-deps; \
 rm -rf /var/cache/*

