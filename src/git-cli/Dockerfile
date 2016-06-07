FROM cjengineering/codeship-git-base

COPY entrypoint.git-cli /usr/local/bin

RUN mkdir /project
WORKDIR /project

ENTRYPOINT ["entrypoint.git-cli"]
CMD [""]
