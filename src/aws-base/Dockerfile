FROM alpine:3.3
MAINTAINER CJ Developers

RUN apk -Uv add python py-pip \
 && pip install awscli \
 && apk --purge -v del py-pip \
 && rm -rf /var/cache/apk/*

ENV AWS_REGION us-east-1

COPY entrypoint.aws-base /usr/local/bin/entrypoint.aws-base
ENTRYPOINT ["entrypoint.aws-base"]
CMD ["sh"]
