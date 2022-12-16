#!/bin/bash

# https://graphdb.ontotext.com/documentation/enterprise/quick-start-guide.html#quick-start-guide-run-gdb-as-standalone-server
# https://graphdb.ontotext.com/documentation/enterprise/requirements.html#

# Set Java heap size
export GDB_MIN_MEM=30G
export GDB_MAX_MEM=30G

# Set Java tmp dir
export GDB_JAVA_OPTS=-Djava.io.tmpdir=/data/graphdb/javatmp

# Start GraphDB
sudo graphdb-ee-9.10.0/bin/graphdb -Dgraphdb.home=/data/graphdb -Dgraphdb.home.data=/data/graphdb/data
