Android Build Dockerfile
========================

Android Dockerfile that provides an Android development &amp; build environment. This image contains all the packages
needed to run tests & build a Gradle based Android project. This results in a consistent build across different 
machines. Can be used in with preferred CI server (ie, jenkins, bamboo, etc).

Installed packages:

* Oracle JDK 8
* Android SDK 24.3.3 (19, 21, 22)
* Android Tools (tools, platform-tools, extras)
* Android NDK r10b
* Gradle 2.5

## About this image

The `android-build:latest` tag will always point the latest stable release. Stable releases are also tagged with their
version (ie, android-build:sdk23,  android-build:sdk24, etc).

## Install image
```
docker pull lukin0110/android-build
```

## Run
```
docker run -it --rm lukin0110/android-build
```

# Contributing & Feedback

You are invited to contribute new features, fixes, or updates, large or small; i'm always thrilled to receive pull
requests, and do my best to process them as fast as i can. Check out the
[Github](https://github.com/lukin0110/docker-android-build) repo for more information about this image and its history.

If encounter problems don't hesitate to open a [Github issue](https://github.com/lukin0110/docker-android-build/issues).
