ARG OPENAPI_VERSION
FROM openapitools/openapi-generator-cli

RUN apk update --no-cache && \
  apk add jq make sed
RUN openapi-generator-cli version-manager set "${OPENAPI_VERSION}"
