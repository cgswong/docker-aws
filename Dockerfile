# ################################################################
# NAME: Dockerfile
# DESC: Docker file to run AWS CLI.
#
# LOG:
# yyyy/mm/dd [name] [version]: [notes]
# 2015/04/14 cgwong [v0.1.0]: Initial creation.
# ################################################################
FROM gliderlabs/alpine:3.1

RUN apk --update add python py-pip && \
    pip install awscli

CMD [""]