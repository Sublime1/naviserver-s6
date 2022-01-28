#!/bin/bash
docker run -itd \
       --restart always \
       --name=naviserver-s6 \
       -p 127.0.0.1:8090:8080 \
       oupfiz5/naviserver-s6:latest
