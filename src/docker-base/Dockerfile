FROM cjengineering/codeship-bash
MAINTAINER CJ Developers

ENV DOCKER_VERSION 1.9.1
ENV DOCKER_SIG 52286a92999f003e1129422e78be3e1049f963be1888afc3c9a99d5a9af04666

RUN  apk update \
  && apk add curl \
  && curl -fSL "https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}" -o /usr/local/bin/docker \
  && echo "${DOCKER_SIG}  /usr/local/bin/docker" | sha256sum -c - \
  && chmod +x /usr/local/bin/docker \
  && apk --purge -v del curl \
  && rm -rf /var/cache/apk/*

COPY entrypoint.docker-base /usr/local/bin/
ENTRYPOINT ["entrypoint.docker-base"]
