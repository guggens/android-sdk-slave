# This is a meta jenkins slave to build other jenkins slave docker images
FROM openjdk:8

MAINTAINER Sascha Guggenberger<guggens@googlemail.com>
RUN apt-get update
RUN apt-get install -y wget

# install Android SDK dependencies
# RUN apt-get install -y openjdk-7-jre-headless lib32z1 lib32ncurses5 lib32bz2-1.0 g++-multilib

# Main Android SDK
RUN wget -qO- "https://dl.google.com/android/repository/tools_r25.2.3-linux.zip" | unzip -d /opt/
RUN echo y | /opt/android-sdk-linux/tools/android update sdk --all --filter platform-tools,build-tools-25.0.2 --no-ui --force

ENV ANDROID_HOME /opt/android-sdk-linux