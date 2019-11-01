FROM ubuntu:18.04

RUN apt-get update -y

RUN apt-get install -y ca-certificates
RUN apt-get install -y curl
RUN apt-get install -y fonts-liberation
RUN apt-get install -y gconf-service
RUN apt-get install -y libappindicator1
RUN apt-get install -y libasound2
RUN apt-get install -y libatk-bridge2.0-0
RUN apt-get install -y libatk1.0-0
RUN apt-get install -y libc6
RUN apt-get install -y libcairo2
RUN apt-get install -y libcups2
RUN apt-get install -y libdbus-1-3
RUN apt-get install -y libexpat1
RUN apt-get install -y libfontconfig1
RUN apt-get install -y libgcc1
RUN apt-get install -y libgconf-2-4
RUN apt-get install -y libgdk-pixbuf2.0-0
RUN apt-get install -y libglib2.0-0
RUN apt-get install -y libgtk-3-0
RUN apt-get install -y libnspr4
RUN apt-get install -y libnss3
RUN apt-get install -y libpango-1.0-0
RUN apt-get install -y libpangocairo-1.0-0
RUN apt-get install -y libstdc++6
RUN apt-get install -y libx11-6
RUN apt-get install -y libx11-xcb1
RUN apt-get install -y libxcb1
RUN apt-get install -y libxcomposite1
RUN apt-get install -y libxcursor1
RUN apt-get install -y libxdamage1
RUN apt-get install -y libxext6
RUN apt-get install -y libxfixes3
RUN apt-get install -y libxi6
RUN apt-get install -y libxrandr2
RUN apt-get install -y libxrender1
RUN apt-get install -y libxss1
RUN apt-get install -y libxtst6
RUN apt-get install -y lsb-release
RUN apt-get install -y wget
RUN apt-get install -y xdg-utils

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_12.x | \
	bash -

RUN apt-get install -y nodejs

# Install Node.js dependencies
COPY . /app

WORKDIR /app

RUN npm install

# Install gcsfuse
RUN apt-get install -y curl
RUN apt-get install -y gnupg2
RUN apt-get install -y lsb-release

RUN export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` && \
	echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | \
	tee /etc/apt/sources.list.d/gcsfuse.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

RUN apt-get update -y
RUN apt-get install -y gcsfuse

# Install gcloud
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | \
	tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN apt-get install -y apt-transport-https
RUN apt-get install -y ca-certificates

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
	apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

RUN apt-get update -y
RUN apt-get install -y google-cloud-sdk
