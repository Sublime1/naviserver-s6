#!.bats-battery/bats-core/bin/bats
load './helpers.bash'

setup() {
    . ./common_conf.bash
}

@test "Remove container" {
    skip
    run docker container rm "${CONTAINER_NAME}" || true
    assert_success
}

@test "Run naviserver-s6 container" {
    run docker run -itd \
     --restart always \
     --name="${CONTAINER_NAME}" \
     --name=naviserver-s6 \
     -p 127.0.0.1:8090:8080 \
     "${IMAGE}"
    assert_success
}

@test "Container stop" {
    run docker container stop "${CONTAINER_NAME}"
    assert_success
}

@test "Container remove" {
    run docker container rm "${CONTAINER_NAME}"
    assert_success
}
