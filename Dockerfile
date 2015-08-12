# ################################################################
# DESC: Docker file to run AWS CLI, S3CMD and RDS tools.
# ################################################################

FROM alpine:latest
MAINTAINER Stuart Wong <cgs.wong@gmail.com>

ENV S3_TMP /tmp/s3cmd.zip
ENV S3_ZIP /tmp/s3cmd-master
ENV RDS_TMP /tmp/RDSCLi.zip
ENV RDS_VERSION 1.19.004
ENV AWS_RDS_HOME /usr/local/RDSCli-${RDS_VERSION}
ENV PKG_URL "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64"
ENV PATH $PATH:${AWS_RDS_HOME}/bin
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 51
ENV JAVA_VERSION_BUILD 16
ENV JAVA_HOME /usr/local/jre
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
    curl --silent --insecure --location --output ${S3_TMP} https://github.com/s3tools/s3cmd/archive/master.zip &&\
    curl --silent --insecure --location --output ${RDS_TMP} http://s3.amazonaws.com/rds-downloads/RDSCli.zip &&\
    unzip -q ${S3_TMP} -d /tmp &&\
    unzip -q ${RDS_TMP} -d /tmp &&\
    mv ${S3_ZIP}/S3 ${S3_ZIP}/s3cmd /usr/bin/ &&\
    mv /tmp/RDSCli-${RDS_VERSION} /usr/local/ &&\
    curl --silent --insecure --location --remote-name "${PKG_URL}/glibc-2.21-r2.apk" &&\
    curl --silent --insecure --location --remote-name "${PKG_URL}/glibc-bin-2.21-r2.apk" &&\
    apk add --allow-untrusted \
      glibc-2.21-r2.apk \
      glibc-bin-2.21-r2.apk &&\
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib &&\
    curl --silent --insecure --location --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/server-jre-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz | tar zxf - -C /usr/local &&\
    ln -s /usr/local/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /usr/local/jre &&\
    rm -rf /tmp/* &&\
    mkdir /root/.aws

WORKDIR /root

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

CMD ["/bin/bash"]
