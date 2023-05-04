# syntax=docker/dockerfile:1.4

# * Arguments
ARG \
    BUILD_DATE="${BUILD_DATE}" \
    NS_MODULES_VERSION="${NS_MODULES_VERSION}" \
    NS_VERSION="${NS_VERSION}" \
    RL_JSON_VERSION="${RL_JSON_VERSION}" \
    TCLLIB_VERSION="${TCLLIB_VERSION}" \
    TCL_BUILD_IMAGE_NAME="${TCL_BUILD_IMAGE_NAME}" \
    TCL_BUILD_IMAGE_REPOSITORY="${TCL_BUILD_IMAGE_REPOSITORY}" \
    TCL_BUILD_IMAGE_TAG="${TCL_BUILD_IMAGE_TAG}" \
    TCL_VERSION="${TCL_VERSION}" \
    TDOM_VERSION="${TDOM_VERSION}" \
    THREAD_VERSION="${THREAD_VERSION}" \
    UBUNTU_IMAGE_NAME="${UBUNTU_IMAGE_NAME}" \
    UBUNTU_IMAGE_REPOSITORY="${UBUNTU_IMAGE_REPOSITORY}" \
    UBUNTU_IMAGE_TAG="${UBUNTU_IMAGE_TAG}" \
    XOTCL_VERSION="${XOTCL_VERSION}"

# * Build software
FROM ${TCL_BUILD_IMAGE_REPOSITORY}/${TCL_BUILD_IMAGE_NAME}:${TCL_BUILD_IMAGE_TAG} as build

# ** Environmen
ENV NS_VERSION="${NS_VERSION}" \
    NS_MODULES_VERSION="${NS_MODULES_VERSION}" \
    RL_JSON_VERSION_VERSION="${RL_JSON_VERSION_VERSION}" \
    TCLLIB_VERSION="${TCLLIB_VERSION}" \
    TCL_VERSION="${TCL_VERSION}" \
    TDOM_VERSION="${TDOM_VERSION}" \
    THREAD_VERSION="${THREAD_VERSION}" \
    XOTCL_VERSION="${XOTCL_VERSION}"

# ** Build
WORKDIR /
RUN mkdir /workspaces
COPY builds /builds
RUN  /bin/bash /builds/all-build.sh

# * From
FROM ${UBUNTU_IMAGE_REPOSITORY}/${UBUNTU_IMAGE_NAME}:${UBUNTU_IMAGE_TAG}
ARG \
    BUILD_DATE \
    NS_MODULES_VERSION \
    NS_VERSION \
    RL_JSON_VERSION \
    TCLLIB_VERSION \
    TCL_BUILD_IMAGE_NAME \
    TCL_BUILD_IMAGE_REPOSITORY \
    TCL_BUILD_IMAGE_TAG \
    TCL_VERSION \
    TDOM_VERSION \
    THREAD_VERSION \
    UBUNTU_IMAGE_NAME \
    UBUNTU_IMAGE_REPOSITORY \
    UBUNTU_IMAGE_TAG \
    XOTCL_VERSION

# ** Copy naviserver
WORKDIR /
COPY --from=build /usr/local/ns /usr/local/ns/

# ** Labels
# hadolint ignore=DL3048
LABEL \
    maintainer="Oupfiz V <oupfiz5@yandex.ru>" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.authors="Oupfiz V (Five)" \
    org.opencontainers.image.url="https://chiselapp.com/user/oupfiz5/repository/naviserver-s6/home" \
    org.opencontainers.image.documentation="https://chiselapp.com/user/oupfiz5/repository/naviserver-s6/wiki" \
    org.opencontainers.image.source="https://chiselapp.com/user/oupfiz5/repository/naviserver-s6/brlist" \
    org.opencontainers.image.version="0.0.3d" \
    org.opencontainers.image.revision="" \
    org.opencontainers.image.vendor="" \
    org.opencontainers.image.licenses="" \
    org.opencontainers.image.ref.name="" \
    org.opencontainers.image.title="NaviServer on ubuntu base docker image using s6-overlay" \
    org.opencontainers.image.description="NaviServer on ubuntu base docker image using s6-overlay" \
    custom.package.version.naviserver=${NS_VERSION} \
    custom.package.version.naviserver_modules=${NS_MODULES_VERSION} \
    custom.package.version.rl_json=${RL_JSON_VERSION} \
    custom.package.version.tcl=${TCL_VERSION} \
    custom.package.version.tcllib=${TCLLIB_VERSION} \
    custom.package.version.tdom=${TDOM_VERSION} \
    custom.package.version.thread=${THREAD_VERSION} \
    custom.package.version.xotcl=${XOTCL_VERSION} \
    custom.package.base_image="${UBUNTU_IMAGE_REPOSITORY}/${UBUNTU_IMAGE_NAME}:${UBUNTU_IMAGE_TAG}"


# ** Run
# hadolint ignore=DL3008
RUN export LANG="en_US.UTF-8" \
    && export LC_ALL="en_US.UTF-8" \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y --no-install-recommends install libssl-dev locales libpq-dev postgresql-client wget \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG="en_US.UTF-8" \
    && update-locale LC_ALL="en_US.UTF-8" \
    && apt-get clean \
    && apt-get auto-remove -y \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/apt/* \
    && groupadd nsadmin \
    && useradd -g nsadmin nsadmin \
    && chown -R  nsadmin:nsadmin /usr/local/ns

# ** Copy s6 and naviserver configurations
COPY rootfs/etc /etc/
COPY rootfs/usr/local/ns/conf /usr/local/ns/conf

# ** Expose
EXPOSE 8080

# ** Environment
Env NS_CONF="/usr/local/ns/conf/nsd-config.tcl"

# ** Workdir
WORKDIR /usr/local/ns

# ** Entrypoint
ENTRYPOINT ["/init"]

# ** Cmd
CMD []
