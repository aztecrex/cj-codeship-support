#!/bin/sh

service=$1
cluster=$2
taskDef=$(entrypoint.aws-base aws ecs describe-services --service $service --cluster $cluster --output text --query 'services[0]|   taskDefinition')
taskSpec=$(entrypoint.aws-base aws ecs describe-task-definition --task-definition $taskDef --query 'taskDefinition | {containerDefinitions:containerDefinitions,volumes:volumes,family:family}')
newTaskDef=$(entrypoint.aws-base aws ecs register-task-definition --cli-input-json "$taskSpec" --output text --query 'taskDefinition.taskDefinitionArn')
entrypoint.aws-base aws ecs update-service --service $service --cluster $cluster --task-definition $newTaskDef
