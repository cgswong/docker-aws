# ################################################################
# DESC: Docker file to run AWS CLI tools.
# ################################################################

FROM gliderlabs/alpine:3.1

RUN apk --update add \
      python \
      py-pip \
      jq \
      wget \
      bash &&\
    pip install --upgrade awscli &&\
    mkdir /root/.aws

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

ENTRYPOINT ["/usr/bin/aws"]
CMD [""]
