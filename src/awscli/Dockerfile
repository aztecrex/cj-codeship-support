FROM alpine:3.3
MAINTAINER CJ Developers

RUN apk -Uv add python py-pip \
 && pip install awscli \
 && apk --purge -v del py-pip \
 && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/aws"]
CMD ["--version"]
