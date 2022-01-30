#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSIONS ; set +a;

IMAGE="${IMAGE:-oupfiz5/naviserver-s6:${NS_IMAGE_TAG}}"

docker build \
       --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
       --build-arg VERSION="${NS_IMAGE_TAG}" \
       -t "${IMAGE}" \
       -f ../Dockerfile \
       ../.
