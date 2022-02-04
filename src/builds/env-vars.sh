#!/bin/bash
# shellcheck shell=bash
export PREFIX="${PREFIX:-/usr/local/ns}"

# * Options
export WGET_OPTIONS="${WGET_OPTIONS:-""}"

# * NaviServer
# Using for NaviServer
# the pg_* variables should be the path leading to the include and
# library file of postgres to be used in this build.  In particular,
# "libpq-fe.h" and "libpq.so" are typically needed.
export PG_INCL="/usr/include/postgresql"
export PG_LIB="/usr/lib"
