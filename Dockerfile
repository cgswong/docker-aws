# ################################################################
# DESC: Docker file to run AWS S3CMD CLI tools.
# ################################################################

FROM alpine:latest
MAINTAINER Stuart Wong <cgs.wong@gmail.com>

ENV S3_TMP /tmp/s3cmd.zip
ENV S3_ZIP /tmp/s3cmd-master

WORKDIR /tmp

RUN apk --update add \
      python \
      py-pip \
      jq \
      curl \
      bash &&\
    pip install --upgrade \
      pip \
      python-dateutil &&\
    curl --silent --insecure --location --output ${S3_TMP} https://github.com/s3tools/s3cmd/archive/master.zip &&\
    unzip -q ${S3_TMP} -d /tmp &&\
    mv ${S3_ZIP}/S3 ${S3_ZIP}/s3cmd /usr/bin/ &&\
    rm -rf /tmp/* &&\
    mkdir /root/.aws

WORKDIR /root

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

ENTRYPOINT ["/usr/bin/s3cmd"]
CMD ["--version"]
