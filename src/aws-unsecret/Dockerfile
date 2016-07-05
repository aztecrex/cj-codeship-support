FROM cjengineering/codeship-aws-base

COPY scripts/* /usr/local/bin/
COPY features/* /features/aws-unsecret/
ENV CJ_PLAINTEXT /share/secrets

ENTRYPOINT ["entrypoint.aws-unsecret"]
CMD [""]
