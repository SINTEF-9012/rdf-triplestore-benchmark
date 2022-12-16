#!/bin/bash

# Parameters
DATASET_LOC=$1
DATASET_NAME=$2

# Check parameters
if [ ! -n "$DATASET_NAME" ] || [ ! -n "$DATASET_LOC" ]
then
	echo "Usage: fuseki_start.sh <dataset_loc> <dataset_name>"
	echo "  Example: fuseki_start.sh /data/fuseki/databases/wikidata wikidata &"
	exit
fi

# Start time
time=$(date)

export JVM_ARGS="-Xmx300G"

echo "***** Start import on $time *****"


./apache-jena-fuseki-4.4.0/fuseki-server --loc $DATASET_LOC "/$DATASET_NAME"

# End time
time=$(date)
echo "***** End import on $time *****"
