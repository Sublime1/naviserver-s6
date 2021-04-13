#!/bin/bash
docker build \
       --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
       -t oupfiz5/naviserver-s6:4.99.21 \
       -t oupfiz5/naviserver-s6:latest \
       -f ../Dockerfile \
        ../.
