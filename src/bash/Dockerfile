FROM alpine:3.4
MAINTAINER CJ Developers

RUN  apk update \
  && apk add bash ca-certificates\
  && rm -rf /var/cache/apk/*

ENV FEATURE_DATA_DIR=/feature/.data
VOLUME /feature/.data

COPY features/* /features/codeship-bash/
VOLUME ["features/codeship-bash"]
