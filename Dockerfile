# DESC: Docker file to run AWS CLI tools.
FROM gliderlabs/alpine:3.3
MAINTAINER Stuart Wong <cgs.wong@gmail.com>

RUN apk --no-cache add \
      bash \
      curl \
      jq \
      py-pip \
      python &&\
    pip install --upgrade \
      pip \
      awscli &&\
    mkdir ~/.aws

# Expose volume for adding credentials
VOLUME ["~/.aws"]

ENTRYPOINT ["/usr/bin/aws"]
CMD ["--version"]
