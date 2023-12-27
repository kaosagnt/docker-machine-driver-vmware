#!/bin/bash

set -e

DOCKER_IMAGE_NAME="docker-machine-vmware-build"
DOCKER_CONTAINER_NAME="docker-machine-vmware-build-container"

if [[ $(docker ps -a | grep $DOCKER_CONTAINER_NAME) != "" ]]; then
  docker rm -f $DOCKER_CONTAINER_NAME 2>/dev/null
fi

docker build -t $DOCKER_IMAGE_NAME .

docker run --name $DOCKER_CONTAINER_NAME \
  -e DEBUG \
  -e STATIC \
  -e VERBOSE \
  -e BUILDTAGS \
  -e PARALLEL \
  -e COVERAGE_DIR \
  -e TARGET_OS \
  -e TARGET_ARCH \
  -e GOOS \
  -e GOARCH \
  -e PREFIX \
  $DOCKER_IMAGE_NAME \
  make "$@"

#if [[ "$@" == *"clean"* ]] && [[ -d bin ]]; then
#  rm -Rf bin
#fi

docker cp \
	$DOCKER_CONTAINER_NAME:/go/src/github.com/machine-drivers/docker-machine-driver-vmware/bin \
	.
