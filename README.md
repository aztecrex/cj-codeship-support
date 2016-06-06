
[ ![Codeship Status for aztecrex/cj-codeship-support](https://codeship.com/projects/63f2a570-de54-0133-9b49-6a683e002de2/status?branch=master)](https://codeship.com/projects/144706)

# Codeship Support

Supporting containers for Codeship continuous delivery

## Build

[Docker and Docker Compose](https://docs.docker.com/) are required to build locally. Build with ```make``` (```make help``` for all
  targets).

## Images

## aws-cli

This image houses the AWS command-line interface.  By default, a container
run from this image displays its awscli and Python versions.

To run an aws command, use ```docker run cjengineering/codeship-aws-cli <command> [args...]``` .  To
inject properties, use the docker environment (```-e```) or environment
file (```--env-file```) options.

To use with Codeship, encrypt an environment file containing appropriate
credentials using ```jet encrypt aws.env aws.encrypted.env``` (see [codeship jet](https://codeship.com/documentation/docker/installation/#jet) for info)
and configure as a service:

#### unencrypted aws environment file, aws.env
```sh
AWS_ACCESS_KEY_ID=ASIAJH36GLMHQSO6R7YA
AWS_SECRET_ACCESS_KEY=A5bH5/kodS9xb6Jqg8UhhZTPYmMxPbOmr3u3/Gv4
```

#### codeship-services.yml
```yaml
aws:
  image: cjengineering/codeship-aws-cli
  encrypted-env-file: aws.env.encrypted
  environment:
    AWS_DEFAULT_REGION: us-east-1
```

Use the service with any steps you need in your pipeline.

#### codeship-steps.yml
```yaml
- type: serial
  service: aws
  steps:
    - command: >
       cloudformation create-stack --stack-name network
       --template-body file://network.json
    - command:  missiles launch --silo-name alpha
```

## aws-ecs-deploy

This image initiates forced update to an ECS service. Runtime parameters
are the service output key and cluster output key and a list of stacks
to inspect.

To use with Codeship, supply an encrypted environment file containing
appropriate credentials using ```jet encrypt aws.env aws.encrypted.env``` (see [codeship jet](https://codeship.com/documentation/docker/installation/#jet)
for info) and configure as a service:

#### unencrypted aws environment file, aws.env
```sh
AWS_ACCESS_KEY_ID=ASIAJH36GLMHQSO6R7YA
AWS_SECRET_ACCESS_KEY=A5bH5/kodS9xb6Jqg8UhhZTPYmMxPbOmr3u3/Gv4
```

#### codeship-services.yml
```yaml
deploy:
  image: cjengineering/codeship-aws-ecs-deploy
  encrypted-env-file: aws.env.encrypted
  environment:
    AWS_DEFAULT_REGION: us-west-1
```

Use the configured Codeship service to initiate a rolling deployment to a
designated ECS service.

#### codeship-steps.yml
```yaml
- service: deploy
  tag: master
  command: Service Cluster staging-deployment-cluster staging-proxy
```

In the above, ```Service``` and ```Cluster``` are the keys that will be
used to extract service name and cluster name from the inspected
stacks. ```staging-deployment-cluster``` and ```staging-proxy``` are the
stacks to inspect.

## aws-s3-deploy

This image initiates synchronization with S3. Runtime parameters are the source directory, stack-output bucket key, destination path within the bucket, and a list of stacks to inspect.

To use with Codeship, supply an encrypted environment file containing
appropriate credentials using ```jet encrypt aws.env aws.encrypted.env``` (see [codeship jet](https://codeship.com/documentation/docker/installation/#jet)
for info) and configure as a service:

#### unencrypted aws environment file, aws.env
```sh
AWS_ACCESS_KEY_ID=ASIAJH36GLMHQSO6R7YA
AWS_SECRET_ACCESS_KEY=A5bH5/kodS9xb6Jqg8UhhZTPYmMxPbOmr3u3/Gv4
```

#### codeship-services.yml
```yaml
deploy:
  image: cjengineering/codeship-aws-s3-deploy
  encrypted-env-file: aws.env.encrypted
  environment:
    AWS_DEFAULT_REGION: us-west-1
```

Use the configured Codeship service to initiate synchronization with a
designated S3 bucket.

#### codeship-steps.yml
```yaml
- service: deploy
  tag: master
  command: assets Bucket site-assets staging-store
```

In the above, ```assets``` is the name of the asset source directory mounted
into the container. ```Bucket``` is the key that will be
used to extract the bucket name from the inspected
stacks. ```site-assets``` is the path in the bucket to which assets are
synchronized.  ```staging-store``` is the stack to inspect.


## git
This image contains git and includes git lfs extension. By default, shows git version. The special command, ```sh```, runs bash.

To run a git command, use ```docker run cjengineering/codeship-git [args...]```. To inject properties, use the docker environment (-e) or environment file (--env-file) options. Git runs against a project mounted at ```/project```.

To use with Codeship, define a git service.

#### codeship-services.yml
```yaml
git:
  image: cjengineering/codeship-git
  volumes:
    - .:/project
```
