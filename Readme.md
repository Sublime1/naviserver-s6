# Table of Contents

-   [About](#org8380c16)
-   [Installation](#org3174856)
    -   [Download from dockerhub](#org6249cd9)
    -   [Build from chiselapp (fossil)](#orgb634e63)
    -   [Build from github](#org57944fc)
-   [Configuration options](#orgf84e1cd)
    -   [General options](#orgc9da42a)
    -   [Timezone](#org78d9460)
    -   [HTTP listen port](#org4a22104)
    -   [Configuration file](#orgaf419f8)
    -   [Quickstart](#org72e1e4f)
-   [CI/CD](#org8d58fce)
-   [Maintenance](#orge3c54e6)
    -   [Log output](#orga8220e6)
    -   [Shell access](#org12e899d)



<a id="org8380c16"></a>

# About

This is [Naviserver](https://wiki.tcl-lang.org/page/NaviServer) on [ubuntu base docker image](https://hub.docker.com/_/ubuntu) (version 20.04) using [s6-overlay](https://github.com/just-containers/s6-overlay).
For install the Naviserver was used script [install-ns.sh](https://github.com/gustafn/install-ns/blob/master/install-oacs.sh) from [Gustaf Neumann](https://github.com/gustafn/install-ns).
The base image is [oupfiz5/ubuntu-s6](https://hub.docker.com/r/oupfiz5/ubuntu-s6).

Naviserver-S6 is self-hosting at <https://chiselapp.com/user/oupfiz5/repository/naviserver-s6>.

If you are reading this on GitHub, then you are looking at a Git mirror of the self-hosting Naviserver-S6 repository.  The purpose of that mirror is to test and exercise Fossil's ability to export a Git mirror and using Github CI/CD  (Github Actions). Nobody much uses the GitHub mirror, except to verify that the mirror logic works. If you want to know more about Naviserver-S6, visit the official self-hosting site linked above.


<a id="org3174856"></a>

# Installation


<a id="org6249cd9"></a>

## Download from dockerhub

    docker pull oupfiz5/naviserver-s6:latest
    docker pull oupfiz5/naviserver-s6:4.99.19


<a id="orgb634e63"></a>

## Build from chiselapp (fossil)

    fossil clone https://chiselapp.com/user/oupfiz5/repository/naviserver-s6 naviserver-s6.fossil
    mkdir naviserver-s6
    cd naviserver-s6
    fossil open naviserver-s6/naviserver-s6.fossil
    docker build -t oupfiz5/naviserver-s6 .


<a id="org57944fc"></a>

## Build from github

    git clone https://github.com/oupfiz5/naviserver-s6.git
    cd naviserver-s6
    docker build -t oupfiz5/naviserver-s6 .


<a id="orgf84e1cd"></a>

# Configuration options


<a id="orgc9da42a"></a>

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
<td class="org-left"><a href="#orgaf419f8">Configuration file</a></td>
<td class="org-left">nsd-config.tcl</td>
<td class="org-left">Configuration file for Naviserver</td>
</tr>
</tbody>
</table>


<a id="org78d9460"></a>

## Timezone

Set the timezone for the container, defaults to UTC. To set the timezone set the desired timezone with the variable TZ.

    docker run -itd \
           --restart always \
           --name=naviserver-s6 \
           --env 'TZ=Europe/Moscow' \
           -p 127.0.0.1:8090:8080 \
           oupfiz5/naviserver-s6:latest


<a id="org4a22104"></a>

## HTTP listen port

Set the http listen port for the container `-p 127.0.0.1:18090:8080`.
In this case the Naviserver is accessible by URL [http://localhost:18090](http://localhost:8090).

    docker run -itd \
           --restart always \
           --name=naviserver-s6 \
           -p 127.0.0.1:18090:8080 \
           oupfiz5/naviserver-s6:latest


<a id="orgaf419f8"></a>

## Configuration file

The default configuration file is `rootfs/usr/local/ns/conf/nsd-config.tcl`.
For using own configuration file you can apply docker mount option:

1.  Create own configuration file with name `nsd-config.tcl`
2.  Put it to some directory (for example `rootfs/usr/local/ns/conf/test`)
3.  Mount the the directory from item 2 as `/usr/local/ns/conf`

    docker run -itd \
           --restart always \
           --name=naviserver-s6  \
           -p 127.0.0.1:8090:8080 \
           --mount type=bind,src=$(pwd)/rootfs/usr/local/ns/conf/test,destination=/usr/local/ns/conf \
           oupfiz5/naviserver-s6:latest


<a id="org72e1e4f"></a>

## Quickstart

Start Naviserver using CLI:

    docker run -itd \
           --restart always \
           --name=naviserver-s6 \
           -p 127.0.0.1:8090:8080 \
           oupfiz5/naviserver-s6:latest

Start Naviserver using script `start.sh`:

    ./start.sh


<a id="org8d58fce"></a>

# CI/CD

For  build and push docker images we use  [Github Actions workflow](https://github.com/oupfiz5/naviserver-s6/blob/master/.github/workflows/on-push.yaml).


<a id="orge3c54e6"></a>

# Maintenance


<a id="orga8220e6"></a>

## Log output

For debugging and maintenance purposes you may want access the output
log. If you are using Docker version 1.3.0 or higher you can access a
running containers shell by starting bash using docker interactive:

    docker run -it --rm \
           --name=naviserver-s6 \
           -p 127.0.0.1:8090:8080 \
           oupfiz5/naviserver-s6:latest


<a id="org12e899d"></a>

## Shell access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version 1.3.0 or higher you can access a running containers shell by starting bash using docker exec:

    docker exec -it naviserver-s6 /bin/bash
