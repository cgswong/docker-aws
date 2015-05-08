# ################################################################
# DESC: Docker file to run AWS CLI, S3CMD and RDS tools.
# ################################################################

FROM gliderlabs/alpine:3.1

ENV S3_TMP /tmp/s3cmd.zip
ENV S3_ZIP /tmp/s3cmd-master

WORKDIR /tmp

RUN apk --update add \
      python \
      py-pip \
      jq \
      wget \
      bash &&\
    pip install python-dateutil &&\
    wget --no-check-certificate -O ${S3_TMP} https://github.com/s3tools/s3cmd/archive/master.zip &&\
    unzip ${S3_TMP} -d /tmp &&\
    mv ${S3_ZIP}/S3 ${S3_ZIP}/s3cmd /usr/bin/ &&\
    rm -rf /tmp/* &&\
    mkdir /root/.aws

WORKDIR /root

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

ENTRYPOINT ["/usr/bin/s3cmd"]
CMD ["--version"]
