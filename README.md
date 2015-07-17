Android Build Dockerfile
========================

Android Dockerfile that provides an Android development &amp; Build environment.

## Build
```
docker build -t lukin0110/android-build .
```

## Run
```
docker run -it --rm lukin0110/android-build
```

## Mount
```
docker run -it --rm -v /Users/maartenhuijsmans/GitProjects/docker-android-build:/data/app lukin0110/android-build
```

TODO
----

* android tools
* gradle
* tagging, tagging strategy
* document howto, example use for android
