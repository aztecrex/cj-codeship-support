FROM ubuntu:15.10

RUN  apt-get update \
  && apt-get -y install git curl \
  && curl -s \
       https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh \
       | bash \
  && apt-get install git-lfs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.git /usr/local/bin

RUN mkdir /project
WORKDIR /project

ENTRYPOINT ["entrypoint.git"]
CMD [""]
