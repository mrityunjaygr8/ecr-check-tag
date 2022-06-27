#!/usr/bin/env bash

USAGE="find-ecr-image — Check ECR for existing docker image

    Usage:
      ./find-ecr-image <repository-name> <image-tag>
    Example:
      ./find-ecr-image.sh foo/bar mytag

    Options:
      <repository-name>   ECR repository name
      <image-tag>         ECR image tag 
      -h                  Show this message
  "
  help() {
    echo "$USAGE"
  }

if [[ $# -lt 2 ]] || [[ "$1" == "-h" ]]; then
    help
    exit 1
fi 
IMAGE_EXISTS="$( aws ecr list-images \
    --repository-name $1 \
    --query "imageIds[?imageTag=='$2'].imageTag" \
    --output text )"

if [[ -n $IMAGE_EXISTS ]]; then
  echo "$1:$2 exists"
  echo "::set-output name=exists::true"
else
  echo "$1:$2 not exists"
  echo "::set-output name=exists::false"
fi

