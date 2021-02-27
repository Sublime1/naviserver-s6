#!/bin/bash
if [ ! -f thread${thread_version}.tar.gz ] ; then
    wget ${wget_options} https://downloads.sourceforge.net/sourceforge/tcl/thread${thread_version}.tar.gz
fi
