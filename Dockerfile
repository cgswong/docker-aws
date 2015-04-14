# ################################################################
# NAME: Dockerfile
# DESC: Docker file to run AWS CLI and S3CMD.
#
# LOG:
# yyyy/mm/dd [name] [version]: [notes]
# 2015/04/14 cgwong [v0.1.0]: Initial creation.
# ################################################################

FROM gliderlabs/alpine:3.1

ENV S3_TMP /tmp/s3cmd.zip

RUN apk --update add python py-pip jq wget && \
    pip install awscli \
    && wget --no-check-certificate -O ${S3_TMP} https://github.com/s3tools/s3cmd/archive/master.zip \
    && unzip ${S3_TMP} -d /tmp \
    && mv /tmp/s3cmd-master/S3 /tmp/s3cmd-master/s3cmd /usr/bin/

CMD ["/bin/sh"]