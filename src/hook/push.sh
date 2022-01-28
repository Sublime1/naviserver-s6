#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSION ; set +a;

if [[ ${BRANCH} == 'dev' ]]; then
    TAG_PREFIX='dev-'
else
    TAG_PREFIX=''
fi

docker push oupfiz5/naviserver-s6:"${TAG_PREFIX}${VERSION:-undefine}"
