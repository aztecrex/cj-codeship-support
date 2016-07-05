FROM alpine:3.4
MAINTAINER CJ Developers

RUN  apk update \
  && apk add bash ca-certificates\
  && rm -rf /var/cache/apk/*

ENV CJ_FEATURE_DATA_DIR=/share/features
ENV CJ_FEATURE_SCRIPT_DIR=/features

COPY features/* features/bash/
VOLUME ["features/bash"]
