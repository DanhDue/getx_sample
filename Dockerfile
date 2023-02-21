# Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

# coverage:ignore-file

FROM adoptopenjdk/openjdk11:jdk-11.0.18_10-ubuntu-slim

WORKDIR /

SHELL ["/bin/sh", "-c"]

# Install bash tools.
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    procps \
    curl \
    file \
    bash \
    git \
    wget \
    zip \
    unzip \
    g++ \
    make \
    ca-certificates \
    dpkg-sig \
    libcap-dev \
    libsqlite3-dev \
    mercurial \
    reprepro \
    ruby \
    ruby-rdoc \
    ruby-irb \
    ruby-dev \
    ruby-webrick \
    s3cmd \
    nano \
    && rm -rf /var/lib/apt/lists/*

# android pre-installed sdk tools/libs
ARG ANDROID_COMPILE_SDK_VERSION=33
ARG ANDROID_BUILD_TOOL_VERSION="33.0.1"
ARG ANDROID_VERSION="android-${ANDROID_COMPILE_SDK_VERSION}"
ARG ANDROID_EMULATOR_PACKAGE_x86_64="system-images;${ANDROID_VERSION};google_apis;x86_64"
ARG ANDROID_PLATFORM_VERSION="platforms;${ANDROID_VERSION}"
# ARG ANDROID_SDK_VERSION="sdk-tools-linux-4333796.zip"
ARG ANDROID_SDK_VERSION="commandlinetools-linux-9477386_latest.zip"
ARG ANDROID_SDK_PACKAGES_EXTRA="build-tools;${ANDROID_BUILD_TOOL_VERSION}"
ARG ANDROID_SDK_PACKAGES="${ANDROID_EMULATOR_PACKAGE_x86_64} ${ANDROID_PLATFORM_VERSION} platform-tools ${ANDROID_SDK_PACKAGES_EXTRA}"

RUN wget https://dl.google.com/android/repository/${ANDROID_SDK_VERSION} -P /tmp && \
    unzip -d /tmp /tmp/${ANDROID_SDK_VERSION}
RUN mkdir /opt/android
RUN mkdir /opt/android/cmdline-tools
RUN mkdir /opt/android/cmdline-tools/tools
RUN mv /tmp/cmdline-tools/* /opt/android/cmdline-tools/tools
RUN rm -rf /tmp/cmdline-tools
WORKDIR /
ENV ANDROID_HOME=/opt/android
ENV PATH "$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/tools/bin:$ANDROID_HOME/platform-tools"

# sdkmanager
RUN mkdir /root/.android/
RUN touch /root/.android/repositories.cfg
RUN yes Y | sdkmanager --licenses
RUN yes Y | sdkmanager --verbose --no_https ${ANDROID_SDK_PACKAGES}

# # avdmanager
ENV EMULATOR_NAME_x86_64="android_x86"
RUN echo "no" | avdmanager --verbose create avd --force --name "${EMULATOR_NAME_x86_64}" --device "pixel" --package "${ANDROID_EMULATOR_PACKAGE_x86_64}"
ENV LD_LIBRARY_PATH "$ANDROID_HOME/emulator/lib64:$ANDROID_HOME/emulator/lib64/qt/lib"

# Install Fastlane
RUN gem install google-api-client
RUN gem install fastlane -NV

# firebase-tools setup
ADD https://github.com/firebase/firebase-tools/releases/download/v11.22.0/firebase-tools-linux firebase-tools-linux
RUN chmod +x firebase-tools-linux
# # if we use firebase tools <7.4.0 we need additional command firebase --open-sesame appdistribution because until now this feature was in closed alpha.
# # RUN ./firebase-tools-linux --open-sesame appdistribution

# Install home brew
RUN yes Y | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
ENV HOME_BREW=/home/linuxbrew/.linuxbrew
ENV PATH "$PATH:$HOME_BREW/bin:$HOME_BREW/sbin"

# Install gradle
WORKDIR /

ENV GRADLE_VERSION 7.4
RUN wget -c https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-all.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-$GRADLE_VERSION-all.zip

ENV GRADLE_HOME /opt/gradle/gradle-$GRADLE_VERSION
ENV PATH ${PATH}:${GRADLE_HOME}/bin

WORKDIR /

# Install the Flutter Version Management & Melos.
RUN brew tap leoafarias/fvm
RUN brew install fvm
RUN dart pub global activate fvm

ENV FLUTTER_VERSION 3.3.9
RUN fvm install $FLUTTER_VERSION
ENV FLUTTER_HOME=/root/fvm/versions/3.3.9
ENV PATH ${PATH}:${FLUTTER_HOME}/bin
ENV PUB_CACHE=/root/.pub-cache
ENV PATH ${PATH}:${PUB_CACHE}/bin
RUN echo "export LANG=en_US.UTF-8\n\n$(cat ~/.bashrc)" > ~/.bashrc

# Active flutter tools.
RUN dart pub global activate melos
RUN dart pub global activate flutter_gen 5.0.0
RUN dart pub global activate get_cli
RUN brew install golang
# install lcov to convert the lcov.info file to HTML pages.
RUN brew install lcov
# install cloc to tracking file types.
RUN brew install cloc

# clean up
RUN apt-get update
RUN yes Y | apt-get upgrade
RUN rm -rf /var/lib/apt/lists/* /tmp/*

# addlicense
RUN go install github.com/google/addlicense@latest

# active tools.
RUN gradle --version
RUN flutter doctor -v

## Remove comment for local testing.
COPY . /ftu_lms

WORKDIR /ftu_lms

# Trigger the first time building to cache all build tools.
RUN melos buildAPKRelease

WORKDIR /

# remove the source code & pub cache to optimize the docker image size.
RUN rm -rf /ftu_lms
RUN yes Y | fvm flutter pub cache clean

# Reactivate dart tools.
RUN dart pub global activate fvm
RUN dart pub global activate melos
RUN dart pub global activate flutter_gen 5.0.0
RUN dart pub global activate get_cli
