# * From
FROM oupfiz5/ubuntu-s6:20.04-3.0.0.0-1

# * Arg
ARG BUILD_DATE \
    NS_VERSION=4.99.23 \
    NS_MODULES_VERSION=4.99.23 \
    TCLLIB_VERSION=1.20 \
    TCL_VERSION=8.6.11 \
    TDOM_VERSION=0.9.1 \
    THREAD_VERSION=2.8.6 \
    XOTCL_VERSION=2.3.0

# * Env
ENV version_ns=${NS_VERSION} \
    version_modules=${NS_VERSION_MODULES} \
    version_thread=${THREAD_VERSION} \
    version_tcl=${TCL_VERSION} \
    version_tcllib=${TCLLIB_VERSION} \
    version_xotcl=${XOTCL_VERSION} \
    version_tdom=${TDOM_VERSION}

# * Labels
LABEL \
    maintainer="Oupfiz V <oupfiz5@yandex.ru>" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.authors="Oupfiz V (Five)" \
    org.opencontainers.image.url="https://chiselapp.com/user/oupfiz5/repository/naviserver-s6/home" \
    org.opencontainers.image.documentation="https://chiselapp.com/user/oupfiz5/repository/naviserver-s6/wiki" \
    org.opencontainers.image.source="https://chiselapp.com/user/oupfiz5/repository/naviserver-s6/brlist" \
    org.opencontainers.image.version="0.0.2d" \
    org.opencontainers.image.revision="" \
    org.opencontainers.image.vendor="" \
    org.opencontainers.image.licenses="" \
    org.opencontainers.image.ref.name="" \
    org.opencontainers.image.title="NaviServer on ubuntu base docker image using s6-overlay" \
    org.opencontainers.image.description="NaviServer on ubuntu base docker image using s6-overlay" \
    custom.package.version.naviserver=${NS_VERSION} \
    custom.package.version.naviserver_modules=${NS_MODULES_VERSION} \
    custom.package.version.thread=${THREAD_VERSION} \
    custom.package.version.tcl=${TCL_VERSION} \
    custom.package.version.tcllib=${TCLLIB_VERSION} \
    custom.package.version.tdom=${VERSION_TDOM} \
    custom.package.version.xotcl=${XOTCL_VERSION}

# * Copy install scripts
COPY rootfs/usr/local/src/scripts /usr/local/src/scripts

# * Workdir for build
WORKDIR /usr/local/src

# * Run
RUN export LANG=en_US.UTF-8 && export LC_ALL=en_US.UTF-8 \
    && apt-get update && apt-get install curl wget gnupg apt-utils tzdata bash -y \
    && apt-get install make gcc zlib1g-dev zip unzip openssl libssl-dev libpq-dev postgresql-client locales -y \
    && locale-gen en_US.UTF-8 && update-locale LANG="en_US.UTF-8" && update-locale LC_ALL=en_US.UTF-8 \
    && apt-get clean \
    && scripts/install-ns.sh build \
    && cd /usr/local/src/modules/nsstats \
    && make NAVISERVER=/usr/local/ns \
    && make NAVISERVER=/usr/local/ns install \
    && cd /usr/local/src/modules/nsconf \
    && make NAVISERVER=/usr/local/ns \
    && make NAVISERVER=/usr/local/ns install \
    && rm -rf /usr/local/src/* \
    && env | grep version_ > /usr/local/ns/versions.txt \
    && apt-get remove make gcc libssl-dev gnupg apt-utils -y && apt-get auto-remove -y \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/apt/*

# * Copy s6 and naviserver configurations
COPY rootfs/etc /etc/
COPY rootfs/usr/local/ns/conf /usr/local/ns/conf

# * Expose
EXPOSE 8080

# * Environment
Env NS_CONF="/usr/local/ns/conf/nsd-config.tcl"

# * Workdir
WORKDIR /usr/local/ns

# * Entrypoint
ENTRYPOINT ["/init"]

# * Cmd
CMD []
