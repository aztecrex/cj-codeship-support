FROM alpine:3.3
MAINTAINER CJ Developers

RUN apk -Uv add python py-pip \
 && pip install awscli \
 && apk --purge -v del py-pip \
 && rm -rf /var/cache/apk/*

ENV AWS_REGION us-east-1

COPY entrypoint.awscli /usr/local/bin/entrypoint.awscli
ENTRYPOINT ["entrypoint.awscli"]
CMD ["--version"]
