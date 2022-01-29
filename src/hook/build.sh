#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSION ; set +a;

IMAGE="${IMAGE:-oupfiz5/naviserver-s6:${VERSION}"

docker build \
       --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
       --build-arg VERSION="${VERSION}" \
       -t "${IMAGE}" \
       -f ../Dockerfile \
       ../.
