#!/bin/bash
IMAGE_TAG="`whoami`/micropython-build-env"

docker build --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` --tag "$IMAGE_TAG" .
docker run --rm -ti --mount type=bind,src=`pwd`,dst='/usr/local/src' $IMAGE_TAG
