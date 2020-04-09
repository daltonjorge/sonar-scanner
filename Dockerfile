FROM alpine:3.11

MAINTAINER Dalton Jorge <daltonjorge@gmail.com>

ENV SONAR_VERSION 4.3.0.2102
ENV SONAR_APP sonar-scanner-cli-${SONAR_VERSION}
ENV SONAR_URL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli

RUN set -x \
    && apk update \
    && apk upgrade \
    && apk add --update --no-cache openjdk8-jre ca-certificates zip unzip curl sshpass \
    && echo "---> Download and install sonar-scaner" \
    && cd /opt \
    && curl -L ${SONAR_URL}/${SONAR_APP}.zip -o ${SONAR_APP}.zip \
    && unzip ${SONAR_APP}.zip \
    && rm -f ${SONAR_APP}.zip \
    && ln -s /opt/sonar-scanner-${SONAR_VERSION}/bin/sonar-scanner /usr/local/bin/sonar-scanner

VOLUME ["/data"]

