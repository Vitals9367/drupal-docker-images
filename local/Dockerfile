ARG PHP_VERSION
FROM druidfi/drupal-web:php-${PHP_VERSION}

# Install chromedriver.
RUN sudo apk add chromium chromium-chromedriver

RUN sudo apk add build-base krb5-dev go
ENV OC_COMMIT_HASH=02c110006bfef4ba53fa5042bb9eae170dd3dc1c
RUN sudo wget https://github.com/openshift/oc/archive/${OC_COMMIT_HASH}.zip -O oc.zip && \
  sudo unzip -o oc.zip && \
  cd oc-${OC_COMMIT_HASH} && \
  sudo make oc && sudo install -Dm755 oc -t "/usr/bin" && \
  cd ../ && \
  sudo rm -rf oc-${OC_COMMIT_HASH} && \
  sudo rm oc.zip && \
  sudo mkdir -p /home/druid/.kube && \
  sudo chown druid:druid /home/druid/.kube

RUN sudo apk del build-base krb5-dev go openssh

# Configure nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY custom.locations /etc/nginx/conf.d/custom.locations

# Override default fpm pool conf to run nginx and php-fpm as same user.
COPY php-fpm-pool.conf /etc/php8/php-fpm.d/www.conf

# Autostart chromedriver and drush server
COPY entrypoints/30-chromedriver.sh /entrypoints
COPY entrypoints/30-drush-server.sh /entrypoints
