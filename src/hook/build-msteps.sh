#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSION ; set +a;
source ../builds/env-vars.sh

IMAGE="${IMAGE:-oupfiz5/naviserver-s6:${VERSION}}"

docker build --no-cache \
       --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
       --build-arg VERSION="${VERSION}" \
       --build-arg NS_VERSION="${NS_VERSION}" \
       --build-arg NS_MODULES_VERSION="${NS_MODULES_VERSION}" \
       --build-arg RL_JSON_VERSION="${RL_JSON_VERSION}" \
       --build-arg TCLLIB_VERSION="${TCLLIB_VERSION}" \
       --build-arg TCL_VERSION="${TCL_VERSION}" \
       --build-arg TDOM_VERSION="${TDOM_VERSION}" \
       --build-arg THREAD_VERSION="${THREAD_VERSION}" \
       --build-arg XOTCL_VERSION="${XOTCL_VERSION}" \
       -t "${IMAGE}" \
       -f ../Dockerfile.multisteps \
       ../.
