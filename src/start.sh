#!/bin/bash
set -a; source ./VERSIONS ; set +a;

IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"

docker run -itd \
    --restart always \
    --name="${CONTAINER_NAME}" \
    -p 127.0.0.1:8090:8080 \
    "${IMAGE}"
