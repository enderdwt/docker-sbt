FROM java:8-jdk-alpine

#Install sbt
ENV SBT_VERSION 0.13.11
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN apk add --update wget bash \
    && wget https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.zip \
    && unzip sbt-${SBT_VERSION}.zip -d /usr/local/ \
    && rm sbt-${SBT_VERSION}.zip

#Install Docker
RUN apk add --no-cache \
                ca-certificates \
                curl \
                openssl

ENV DOCKER_BUCKET test.docker.com
ENV DOCKER_VERSION 1.12.0-rc2
ENV DOCKER_SHA256 6df54c3360f713370aa59b758c45185b9a62889899f1f6185a08497ffd57a39b

RUN set -x \
        && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz" -o docker.tgz \
        && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
        && tar -xzvf docker.tgz \
        && mv docker/* /usr/local/bin/ \
        && rmdir docker \
        && rm docker.tgz \
        && docker -v

RUN mkdir /app

WORKDIR /app

