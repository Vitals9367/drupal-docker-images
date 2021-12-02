ARG BASE_IMAGE_TAG
FROM python:${BASE_IMAGE_TAG}-alpine3.14

ENV PYTHONPATH=/usr/lib/python3.9/site-packages
# Install system dependencies
RUN apk update; \
  apk --no-cache upgrade; \
  apk --no-cache add \
    chromium \
    chromium-chromedriver \
    py3-pillow \
    ; \
 apk add --virtual .build-deps \
    python3-dev \
    automake \
    imagemagick \
    gcc \
    g++ \
    zlib \
    libffi-dev \
    ; \
  pip install --upgrade --no-cache-dir pip \
    ; \
  pip install \
    --no-cache-dir \
    --upgrade \
    robotframework \
    robotframework-eyes \
    robotframework-seleniumlibrary \
    ; \
 apk del .build-deps

