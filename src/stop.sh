#!/bin/bash
set -a; source ./VERSIONS ; set +a;

IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"

docker container stop "${CONTAINER_NAME}"
docker container rm "${CONTAINER_NAME}"
