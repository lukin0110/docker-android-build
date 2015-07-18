Android Build Dockerfile
========================

Android Dockerfile that provides an Android development &amp; build environment. This image contains all the packages
needed to run tests & build a Gradle based Android project. This results in a consistent build across different 
machines.

Installed packages:

* Oracle JDK 8
* Android SDK 24.3.3 (19, 21, 22)
* Android Tools (tools, platform-tools, extras)
* Android NDK r10b
* Gradle 2.5

## Install image
```
docker pull lukin0110/android-build
```

## Run
```
docker run -it --rm lukin0110/android-build
```
