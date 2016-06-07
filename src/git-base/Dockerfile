FROM cjengineering/codeship-bash

# NOTE: git-lfs is coming from Alpine Edge. Use the standard version once it
#       becomes part of the main packages

RUN  apk update \
  && apk add git \
  && apk add git-lfs \
        --update-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        --allow-untrusted \
  && rm -rf /var/cache/apk/*

COPY entrypoint.git-base /usr/local/bin/
ENTRYPOINT ["entrypoint.git-base"]
