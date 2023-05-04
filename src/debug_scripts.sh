#!/bin/bash
set -a; source ./VERSIONS ; set +a;

IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"

# bind and replace s6 service scripts and configuration for debug purpose
docker run -it --rm \
    -v $(pwd)/rootfs/etc/s6-overlay/s6-rc.d/naviserver/:/etc/s6-overlay/s6-rc.d/naviserver/ \
    -v $(pwd)/rootfs/etc/s6-overlay/s6-rc.d/user/contents.d/:/etc/s6-overlay/s6-rc.d/user/contents.d/ \
    -v $(pwd)/rootfs/usr/local/ns/conf/:/usr/local/ns/conf/ \
    --name="${CONTAINER_NAME}" \
    -p 127.0.0.1:8090:8080 \
    "${IMAGE}"
