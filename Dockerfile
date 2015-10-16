# Docker file to run AWS CLI, S3CMD and RDS tools.

FROM cgswong/java:openjdk8
MAINTAINER Stuart Wong <cgs.wong@gmail.com>

ENV S3_TMP /tmp/s3cmd.zip
ENV S3_ZIP /tmp/s3cmd-master
ENV RDS_TMP /tmp/RDSCLi.zip
ENV RDS_VERSION 1.19.004
ENV AWS_RDS_HOME /usr/local/RDSCli-${RDS_VERSION}
ENV PKG_URL "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64"
ENV PATH $PATH:${AWS_RDS_HOME}/bin
ENV PATH $PATH:$JAVA_HOME/bin:$AWS_RDS_HOME/bin

WORKDIR /tmp

RUN apk --update add \
      python \
      py-pip \
      jq \
      curl \
      bash &&\
    pip install --upgrade pip \
      awscli \
      python-dateutil &&\
    curl --silent --location --output ${S3_TMP} https://github.com/s3tools/s3cmd/archive/master.zip &&\
    curl --silent --location --output ${RDS_TMP} http://s3.amazonaws.com/rds-downloads/RDSCli.zip &&\
    unzip -q ${S3_TMP} -d /tmp &&\
    unzip -q ${RDS_TMP} -d /tmp &&\
    mv ${S3_ZIP}/S3 ${S3_ZIP}/s3cmd /usr/bin/ &&\
    mv /tmp/RDSCli-${RDS_VERSION} /usr/local/ &&\
    rm -rf /tmp/* &&\
    mkdir ~/.aws &&\
    chmod 700 ~/.aws

# Expose volume for adding credentials
VOLUME ["~/.aws"]

CMD ["/bin/bash"]
