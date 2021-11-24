ARG BASE_IMAGE_TAG
FROM python:${BASE_IMAGE_TAG}

RUN pip install --no-cache-dir numpy \
  robotframework-doctestlibrary \
  robotframework-seleniumlibrary

RUN apt-get update && apt-get install -y --no-install-recommends \
    imagemagick \
    ghostscript \
    tesseract-ocr \
    ghostscript \
    wget \
    libdmtx0b \
    xvfb \
    unzip \
    software-properties-common \
    gettext-base

# Set up the Chrome PPA
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

ENV CHROMEDRIVER_DIR /chromedriver
RUN mkdir $CHROMEDRIVER_DIR

# Update the package list and install chrome and latest chromedriver
RUN apt-get update && \
    apt-get install -y gnupg wget curl unzip --no-install-recommends && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update -y && \
    apt-get install -y google-chrome-stable && \
    CHROMEVER=$(google-chrome --product-version | grep -o "[^\.]*\.[^\.]*\.[^\.]*") && \
    DRIVERVER=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROMEVER") && \
    wget -q --continue -P /chromedriver "http://chromedriver.storage.googleapis.com/$DRIVERVER/chromedriver_linux64.zip" && \
    unzip $CHROMEDRIVER_DIR/chromedriver* -d /chromedriver && \
    rm -rf /var/lib/apt/lists/*

ENV PATH $CHROMEDRIVER_DIR:$PATH
