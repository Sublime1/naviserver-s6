#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSION ; set +a;

IMAGE="${IMAGE:-oupfiz5/naviserver-s6:${VERSION}}"

docker push "${IMAGE}"
