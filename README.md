# Codeship Support

Supporting containers for Codeship continuous delivery

## awscli

This images houses the AWS command-line interface.  By default, a container
run from this image displays its awscli and Python versions.

To run an aws command, use ```docker run aws <command> [args...]``` .  To
inject properties, use the docker environment (```-e```) or environment
file (```--env-file```) options.

To use with Codeship, encrypt an environment file containing your
credentials using ```jet encrypt aws.env aws.encrypted.env``` and configure
as a service:

#### unencrypted aws environment file, aws.env
```sh
AWS_ACCESS_KEY_ID=ASIAJH36GLMHQSO6R7YA
AWS_SECRET_ACCESS_KEY=A5bH5/kodS9xb6Jqg8UhhZTPYmMxPbOmr3u3/Gv4
```

#### codeship-services.yml
```yaml
aws:
  image: <TBD image name>
  encrypted-env-file: aws.env.encrypted
  environment:
    AWS_REGION: us-east-1
```

Use the service with any steps you need in your pipeline.

#### codeship-steps.yml
```yaml
- type: serial
  service: aws
  steps:
    - command: cloudformation create-stack --stack-name network --template-body file://network.json
    - command:  missiles launch --silo-name alpha
```


