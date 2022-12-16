#!/bin/bash

# https://graphdb.ontotext.com/documentation/enterprise/loading-data-using-the-loadrdf-tool.html

# Parameters
REPO_CONFIG_FILE=$1
INPUT_FILE=$2

# Check parameters
if [ ! -n "$REPO_CONFIG_FILE" ] || [ ! -n "$INPUT_FILE" ]
then
	echo "Usage: graphdb_loadrdf.sh <repo_config_file> <input_file>"
	echo "  Example: graphdb_loadrdf.sh dataset-repo-config.ttl /input/dataset.nt > graphdb_loadrdf_dataset.log 2>&1 &"
	exit
fi

# Start time
time=$(date)
echo "***** Start import on $time *****"

# Configure Java memory heaps, see https://graphdb.ontotext.com/documentation/enterprise/requirements.html#
export GDB_MIN_MEM=30G
export GDB_MAX_MEM=30G

# Load data
sudo graphdb-ee-9.10.0/bin/loadrdf -f -p -m parallel -v -c $REPO_CONFIG_FILE $INPUT_FILE

# End time
time=$(date)
echo "***** End import on $time *****"
