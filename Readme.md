# Table of Contents

-   [About](#org33f559f)
-   [Installation](#org3ebc177)
    -   [Download from dockerhub](#org7d36d05)
    -   [Build from chiselapp (fossil)](#orgad88c7f)
    -   [Build from github](#org16c7a0b)
    -   [Contfiguration](#org93ec4e2)
        -   [Build arguments](#org063a0e9)
        -   [Example of build](#org075afaf)
-   [Configuration options](#orgd952cb7)
    -   [General options](#org139aef3)
    -   [Timezone](#org9396fae)
    -   [HTTP listen port](#org20b113f)
    -   [Configuration file](#orgb9f8335)
-   [Quickstart](#orge008c58)
-   [CI/CD](#org665f04d)
-   [Maintenance](#orgfd4584f)
    -   [Log output](#org02fef7f)
    -   [Shell access](#org8fee78b)



<a id="org33f559f"></a>

# About

This is [Naviserver](https://wiki.tcl-lang.org/page/NaviServer) on [ubuntu base docker image](https://hub.docker.com/_/ubuntu) (version 20.04) using [s6-overlay](https://github.com/just-containers/s6-overlay).  To install the Naviserver I used code from  [Gustaf Neumann](https://github.com/gustafn/install-ns) script [install-ns.sh](https://github.com/gustafn/install-ns/blob/master/install-oacs.sh).   The base image is [oupfiz5/ubuntu-s6](https://hub.docker.com/r/oupfiz5/ubuntu-s6).

Naviserver-S6 is self-hosting at <https://chiselapp.com/user/oupfiz5/repository/naviserver-s6>.

If you are reading this on GitHub, then you are looking at a Git mirror of the self-hosting Naviserver-S6 repository.  The purpose of that mirror is to test and exercise Fossil's ability to export a Git mirror and using Github CI/CD  (Github Actions). Nobody much uses the GitHub mirror, except to verify that the mirror logic works. If you want to know more about Naviserver-S6, visit the official self-hosting site linked above.


<a id="org3ebc177"></a>

# Installation


<a id="org7d36d05"></a>

## Download from dockerhub

    docker pull oupfiz5/naviserver-s6:latest
    docker pull oupfiz5/naviserver-s6:4.99.21


<a id="orgad88c7f"></a>

## Build from chiselapp (fossil)

    fossil clone https://chiselapp.com/user/oupfiz5/repository/naviserver-s6 naviserver-s6.fossil
    mkdir naviserver-s6
    cd naviserver-s6
    fossil open ../naviserver-s6.fossil

Build image using one step (install-ns.sh from Gustaf Neumann):

    docker build -t oupfiz5/naviserver-s6 -f ./Dockerfile .

Build image using multi steps  (by means of docker oupfiz5/tcl-build):

    docker build -t oupfiz5/naviserver-s6 -f ./Dockerfile.multisteps .

In both cases will get naviserver docker image. But mulit steps image will have smaller size.


<a id="org16c7a0b"></a>

## Build from github

    git clone https://github.com/oupfiz5/naviserver-s6.git
    cd naviserver-s6
    docker build -t oupfiz5/naviserver-s6 .

One step build image  (using install-ns.sh from Gustaf Neumann):

    docker build -t oupfiz5/naviserver-s6 -f ./Dockerfile .

Multi steps build image (using build docker oupfiz5/tcl-build):

    docker build -t oupfiz5/naviserver-s6 -f ./Dockerfile.multisteps .

In both cases will get naviserver docker image. But mulit steps image will have smaller size.


<a id="org93ec4e2"></a>

## Contfiguration


<a id="org063a0e9"></a>

### Build arguments

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Arguments</th>
<th scope="col" class="org-right">Default</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">BUILD_DATE</td>
<td class="org-right">none</td>
<td class="org-left">Set build date for label</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">NS_VERSION</td>
<td class="org-right">4.99.21</td>
<td class="org-left">Define version for Naviserver</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">NS_MODULE_VERSION</td>
<td class="org-right">4.99.21</td>
<td class="org-left">Define version for Naviserver  modules</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">TCL_VERSION</td>
<td class="org-right">8.6.11</td>
<td class="org-left">Define version for  tcl</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">TCLLIB_VERSION</td>
<td class="org-right">1.1.20</td>
<td class="org-left">Define version for  tcllib</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">TDOM_VERSION</td>
<td class="org-right">0.9.1</td>
<td class="org-left">Define version for tdom</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">THREAD_VERSION</td>
<td class="org-right">2.8.6</td>
<td class="org-left">Define version for thread</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">XOTCL_VERSION</td>
<td class="org-right">2.3.0</td>
<td class="org-left">Define version for xotcl</td>
</tr>
</tbody>
</table>


<a id="org075afaf"></a>

### Example of build

    docker build --no-cache \
            --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
            --build-arg NS_VERSION=4.99.21 \
            --build-arg TCL_VERSION=8.6.11 \
            -t oupfiz5/naviserver-s6:4.99.21 \
            -f ../Dockerfile.multisteps \
             ../.


<a id="orgd952cb7"></a>

# Configuration options


<a id="org139aef3"></a>

## General options

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Option</th>
<th scope="col" class="org-left">Default</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">TZ</td>
<td class="org-left">UTC</td>
<td class="org-left">Set timezone, example Europe/Moscow</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">HTTP</td>
<td class="org-left">8090</td>
<td class="org-left">Set http listen port, example 18090</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left"><a href="#orgb9f8335">Configuration file</a></td>
<td class="org-left">nsd-config.tcl</td>
<td class="org-left">Configuration file for Naviserver</td>
</tr>
</tbody>
</table>


<a id="org9396fae"></a>

## Timezone

Set the timezone for the container, defaults to UTC. To set the timezone set the desired timezone with the variable TZ.

    docker run -itd \
           --restart always \
           --name=naviserver-s6 \
           --env 'TZ=Europe/Moscow' \
           -p 127.0.0.1:8090:8080 \
           oupfiz5/naviserver-s6:latest


<a id="org20b113f"></a>

## HTTP listen port

Set the http listen port for the container `-p 127.0.0.1:18090:8080`.  In this case the Naviserver is accessible by URL [http://localhost:18090](http://localhost:8090).

    docker run -itd \
           --restart always \
           --name=naviserver-s6 \
           -p 127.0.0.1:18090:8080 \
           oupfiz5/naviserver-s6:latest


<a id="orgb9f8335"></a>

## Configuration file

The default configuration file is `rootfs/usr/local/ns/conf/nsd-config.tcl`.  For using own configuration file you can apply docker mount option:

1.  Create own configuration file with name `nsd-config.tcl`
2.  Put it to some directory (for example `rootfs/usr/local/ns/conf/test`)
3.  Mount the the directory from item 2 as `/usr/local/ns/conf`

        docker run -itd \
               --restart always \
               --name=naviserver-s6  \
               -p 127.0.0.1:8090:8080 \
               --mount type=bind,src=$(pwd)/rootfs/usr/local/ns/conf/test,destination=/usr/local/ns/conf \
               oupfiz5/naviserver-s6:latest


<a id="orge008c58"></a>

# Quickstart

Start Naviserver using CLI:

    docker run -itd \
           --restart always \
           --name=naviserver-s6 \
           -p 127.0.0.1:8090:8080 \
           oupfiz5/naviserver-s6:latest

Start Naviserver using script `start.sh`:

    ./start.sh

After start open the naviserver will be accessible by url `http://localhost:8090`


<a id="org665f04d"></a>

# CI/CD

For  build and push docker images we use  [Github Actions workflow](https://github.com/oupfiz5/naviserver-s6/blob/master/.github/workflows/on-push.yaml).


<a id="orgfd4584f"></a>

# Maintenance


<a id="org02fef7f"></a>

## Log output

For debugging and maintenance purposes you may want access the output log. If you are using Docker version 1.3.0 or higher you can access a running containers shell by starting bash using docker interactive:

    docker run -it --rm \
           --name=naviserver-s6 \
           -p 127.0.0.1:8090:8080 \
           oupfiz5/naviserver-s6:latest


<a id="org8fee78b"></a>

## Shell access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version 1.3.0 or higher you can access a running containers shell by starting bash using docker exec:

    docker exec -it naviserver-s6 /bin/bash
