ARG PHP_VERSION
FROM druidfi/drupal-web:php-${PHP_VERSION}

# Install chromedriver.
RUN sudo apk add chromium chromium-chromedriver

# Install OC cli.
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
