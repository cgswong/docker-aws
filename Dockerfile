# DESC: Docker file to run AWS RDS CLI tools.
FROM cgswong/java:openjre8
MAINTAINER Stuart Wong <cgs.wong@gmail.com>

ENV RDS_TMP /tmp/RDSCLi.zip
ENV RDS_VERSION 1.19.004
ENV AWS_RDS_HOME /usr/local/RDSCli-${RDS_VERSION}
ENV PATH ${PATH}:${AWS_RDS_HOME}/bin:${JAVA_HOME}/bin:${AWS_RDS_HOME}/bin

WORKDIR /tmp

RUN apk --no-cache add \
      bash \
      curl \
      jq &&\
    curl -sSL --output ${RDS_TMP} http://s3.amazonaws.com/rds-downloads/RDSCli.zip &&\
    unzip -q ${RDS_TMP} -d /tmp &&\
    mv /tmp/RDSCli-${RDS_VERSION} /usr/local/ &&\
    rm -rf /tmp/* &&\
    mkdir ~/.aws

WORKDIR ~/

# Expose volume for adding credentials
VOLUME ["~/.aws"]

ENTRYPOINT ["rds"]
CMD ["--help"]
