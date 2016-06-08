FROM cjengineering/codeship-aws-docker

MAINTAINER CJ Developers

# # Java 8 JRE to run Clojure Uberjars
# RUN  apk update \
#   && apk add openjdk8-jre \
#   && rm -rf /var/cache/apk/*

COPY /scripts/* /usr/local/bin/
ENV SETTLE_BUDGET 30
ENTRYPOINT ["entrypoint.promote"]
CMD [""]
