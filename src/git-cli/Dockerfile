FROM cjengineering/codeship-git-base

COPY entrypoint.git /usr/local/bin

RUN mkdir /project
WORKDIR /project

ENTRYPOINT ["entrypoint.git"]
CMD [""]
