#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSIONS ; set +a;

IMAGE="${IMAGE:-oupfiz5/naviserver-s6:${NS_IMAGE_TAG}}"

docker push "${IMAGE}"
