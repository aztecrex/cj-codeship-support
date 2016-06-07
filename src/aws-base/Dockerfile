FROM cjengineering/codeship-bash
MAINTAINER CJ Developers

RUN apk -Uv add python py-pip \
 && pip install awscli \
 && apk --purge -v del py-pip \
 && rm -rf /var/cache/apk/*

COPY entrypoint.aws-base /usr/local/bin/

ENV AWS_DEFAULT_REGION us-east-1

ENTRYPOINT ["entrypoint.aws-base"]
