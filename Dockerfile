#
# Android Build Dockerfile
#
# https://github.com/lukin0110/docker-android-build
#
# Version: 0.0.1
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Maarten Huijsmans <maarten.huijsmans@gmail.com>


# Update, upgrade and install packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install curl build-essential unzip python-software-properties software-properties-common


# Install Oracle Java JDK
# https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get
# https://github.com/dockerfile/java/blob/master/oracle-java7/Dockerfile
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle


# Install Android SDK
# https://developer.android.com/sdk/index.html#Other
RUN cd /usr/local/ && \
    curl -L -O http://dl.google.com/android/android-sdk_r24.3.3-linux.tgz && \
    tar xf android-sdk_r24.3.3-linux.tgz && \
    rm android-sdk_r24.3.3-linux.tgz
ENV ANDROID_HOME /usr/local/android-sdk-linux


# Install Android Tools
#TODO


# Install Android NDK
# https://developer.android.com/tools/sdk/ndk/index.html
# https://developer.android.com/ndk/index.html
RUN cd /usr/local && \
    curl -L -O http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin && \
    chmod a+x android-ndk-r10e-linux-x86_64.bin && \
    ./android-ndk-r10e-linux-x86_64.bin
RUN rm -f android-ndk-r10e-linux-x86_64.bin
ENV ANDROID_NDK_HOME /usr/local/android-ndk-r10e


# Install Gradle
RUN cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-2.5-bin.zip -o gradle-2.5-bin.zip && \
    unzip gradle-2.5-bin.zip
ENV GRADLE_HOME=/usr/local/gradle-2.5


# Set PATH
#ENV ANT_HOME /usr/local/apache-ant-1.9.2
#ENV MAVEN_HOME /usr/local/apache-maven-3.1.1
#ENV PATH $PATH:$ANT_HOME/bin
#ENV PATH $PATH:$MAVEN_HOME/bin
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_NDK_HOME/platform-tools:$ANDROID_NDK_HOME:$GRADLE_HOME/bin


# Flatten the image
# https://intercityup.com/blog/downsizing-docker-containers.html
# Cleaning APT
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Define working directory.
RUN mkdir -p /data/app
WORKDIR /data/app

# Define volume: your local app code directory can be mounted here
# Mount with: -v /your/local/directory:/data/app
VOLUME ["/data/app"]

# Define default command
CMD ["bash"]
