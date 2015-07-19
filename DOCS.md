Development docs
================
The `README.md` file contains documentation on how to use the image. This file contains about how to develop & build 
 the image.

## Build
```
docker build -t lukin0110/android-build .
```

## Mount
```
docker run -it --rm -v /Users/johndoe/GitProjects/docker-android-build:/data/app lukin0110/android-build
```

## Github tags

Create tag
```
git tag -a sdk24 -m 'sdk24'
```

Push tag:
```
git push origin --tags
```

## TODO

* example use for android
* explain mounting


