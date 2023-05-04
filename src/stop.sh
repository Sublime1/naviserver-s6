#!/bin/bash
set -a; source ./VERSIONS ; set +a;

IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"

echo "Stop container:"
docker container stop "${CONTAINER_NAME}"
echo ""
echo "Remove container:"
docker container rm "${CONTAINER_NAME}"
