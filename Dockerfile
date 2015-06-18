# ################################################################
# DESC: Docker file to run AWS CLI tools.
# ################################################################

FROM alpine:latest
MAINTAINER Stuart Wong <cgs.wong@gmail.com>

RUN apk --update add \
      python \
      py-pip \
      jq \
      curl \
      bash &&\
    pip install --upgrade \
      pip \
      awscli &&\
    mkdir /root/.aws

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

ENTRYPOINT ["/usr/bin/aws"]
CMD ["--version"]
