#!/bin/bash

image_name=$GITHUB_WORKFLOW-ci-$GITHUB_REF_NAME

set -xe

docker build -f Dockerfile.test -t ${image_name} .
docker run --rm $image_name /app/.github/run-in-container.sh
