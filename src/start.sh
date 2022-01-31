#!/bin/bash
set -a; source ./VERSIONS ; set +a;

IMAGE="${IMAGE:-oupfiz5/naviserver-s6:${NS_IMAGE_TAG}}"

docker run -itd \
       --restart always \
       --name=naviserver-s6 \
       -p 127.0.0.1:8090:8080 \
       ${IMAGE}
