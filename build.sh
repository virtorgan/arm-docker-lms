#! /bin/bash


# lms image tag
# (Nightly)
VERSION=8.0.0-1600144351
DOCKERHUBUSER=virtorgan
REPONAME=arm-docker-lms

# docker image to build
IMAGE_NAME=$DOCKERHUBUSER/$REPONAME:$VERSION

# build runtime
docker build -t $IMAGE_NAME .

# push to docker hub
docker push $IMAGE_NAME
