FROM java:8-jdk

ENV SBT_VERSION 0.13.11
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

run wget https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.zip \
    && unzip sbt-${SBT_VERSION}.zip -d /usr/local/ \
    && rm sbt-${SBT_VERSION}.zip \
    && mkdir /app

WORKDIR /app
