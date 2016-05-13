FROM cjengineering/codeship-aws-base
MAINTAINER CJ Developers

RUN apk add --update bash && rm -rf /var/cache/apk/*
COPY entrypoint.aws-ecs-run /usr/local/bin/

ENTRYPOINT ["entrypoint.aws-ecs-run"]
CMD [""]