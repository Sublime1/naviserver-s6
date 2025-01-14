#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSIONS ; set +a;
source ../builds/env-vars.sh

IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"
IMAGE_LATEST="${IMAGE_LATEST:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:latest}"
DOCKERFILE="${DOCKERFILE:-Dockerfile}"

docker buildx build --no-cache \
    --build-arg UBUNTU_IMAGE_REPOSITORY="${UBUNTU_IMAGE_REPOSITORY}" \
    --build-arg UBUNTU_IMAGE_NAME="${UBUNTU_IMAGE_NAME}" \
    --build-arg UBUNTU_IMAGE_TAG="${UBUNTU_IMAGE_TAG}" \
    --build-arg TCL_BUILD_IMAGE_REPOSITORY="${TCL_BUILD_IMAGE_REPOSITORY}" \
    --build-arg TCL_BUILD_IMAGE_NAME="${TCL_BUILD_IMAGE_NAME}" \
    --build-arg TCL_BUILD_IMAGE_TAG="${TCL_BUILD_IMAGE_TAG}" \
    --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg NS_VERSION="${NS_VERSION}" \
    --build-arg NS_MODULES_VERSION="${NS_MODULES_VERSION}" \
    --build-arg RL_JSON_VERSION="${RL_JSON_VERSION}" \
    --build-arg TCLLIB_VERSION="${TCLLIB_VERSION}" \
    --build-arg TCL_VERSION="${TCL_VERSION}" \
    --build-arg TDOM_VERSION="${TDOM_VERSION}" \
    --build-arg THREAD_VERSION="${THREAD_VERSION}" \
    --build-arg XOTCL_VERSION="${XOTCL_VERSION}" \
    --tag "${IMAGE}" \
    --tag "${IMAGE_LATEST}" \
    --file ../"${DOCKERFILE}" \
    ../.

# Let everyone know we are finished!
for i in {1..10}; do
    echo -e "\a"
    sleep 0.5   
done