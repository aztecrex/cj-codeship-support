FROM cjengineering/codeship-bash

# NOTE: git-lfs is coming from Alpine Edge. Use the standard version once it
#       becomes part of the main packages

RUN  apk update \
  && apk add openssh \
  && apk add git \
  && apk add curl \
  && mkdir /build \
  && curl -fSL "https://github.com/github/git-lfs/releases/download/v1.2.1/git-lfs-linux-amd64-1.2.1.tar.gz" -o /build/lfs.tgz \
  && cd /build \
  && tar -xzvf lfs.tgz \
  && cd git-lfs-1.2.1 \
  && ./install.sh \
  && git lfs install \
  && rm -Rf /build \
  && cd / \
  && apk --purge -v del curl \
  && rm -rf /var/cache/apk/*

COPY entrypoint.git-base /usr/local/bin/
ENTRYPOINT ["entrypoint.git-base"]
