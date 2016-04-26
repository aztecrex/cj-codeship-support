FROM cjengineering/codeship-aws-base
MAINTAINER CJ Developers

RUN apk add --update bash && rm -rf /var/cache/apk/*
COPY entrypoint.aws-s3-deploy /usr/local/bin/

ENTRYPOINT ["entrypoint.aws-s3-deploy"]
