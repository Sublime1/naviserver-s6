#!/bin/bash
. /builds/common.sh
. /builds/ns-env-vars.sh

build_setup

package_directory="thread${thread_version}"
if [ ! -d /workspaces/${package_directory} ]; then
    cd /workspaces && sh /builds/ns-thread-download.sh
    tar xvfz thread${thread_version}.tar.gz
fi

mkdir -p /workspaces/logs
echo "Running the autoconf configure in /workspaces/${package_directory}"
cd /workspaces/${package_directory}/unix || exit 1
echo "Building ${package_directory}"
> /workspaces/logs/${package_directory}.log
../configure --enable-threads --prefix=${ns_install_dir} --exec-prefix=${ns_install_dir} --with-naviserver=${ns_install_dir} --with-tcl=${ns_install_dir}/lib 2>&1 | tee -a /workspaces/logs/${package_directory}.log
make 2>&1 | tee -a /workspaces/logs/${package_directory}.log
make install 2>&1 | tee -a /workspaces/logs/${package_directory}.log

build_cleanup
