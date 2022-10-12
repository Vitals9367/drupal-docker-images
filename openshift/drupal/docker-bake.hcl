variable "REPO_BASE" {
  default = "ghcr.io/city-of-helsinki/drupal-docker-base"
}
group "default" {
  targets = ["dev"]
}

group "dev" {
  targets = ["php80-dev", "php81-dev"]
}

group "prod" {
  targets = ["php80", "php81"]
}

target "php" {
  target = "final"
  args = {
    ALPINE_VERSION = "3.15"
  }
}

target "php81-dev" {
  inherits = ["php"]
  args = {
    PHP_VERSION = "8.1"
    PHP_SHORT_VERSION = "81"
    ALPINE_VERSION = "3.16"
  }
  tags = ["${REPO_BASE}:8.1-dev"]
  platforms = ["linux/amd64"]
}

target "php81" {
  inherits = ["php"]
  args = {
    PHP_VERSION = "8.1"
    PHP_SHORT_VERSION = "81"
    ALPINE_VERSION = "3.16"
  }
  tags = ["${REPO_BASE}:8.1"]
  platforms = ["linux/amd64"]
}

target "php80" {
  inherits = ["php"]
  args = {
    PHP_VERSION = "8.0"
    PHP_SHORT_VERSION = "8"
  }
  tags = ["${REPO_BASE}:8.0"]
  platforms = ["linux/amd64"]
}

target "php80-dev" {
  inherits = ["php"]
  args = {
    PHP_VERSION = "8.0"
    PHP_SHORT_VERSION = "8"
  }
  tags = ["${REPO_BASE}:8.0-dev"]
  platforms = ["linux/amd64"]
}

