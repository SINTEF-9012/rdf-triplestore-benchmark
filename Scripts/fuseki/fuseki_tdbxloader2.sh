#!/bin/bash

# Parameters
DATASET_NAME=$1
INPUT_FILE=$2

# Check parameters
if [ ! -n "$DATASET_NAME" ] || [ ! -n "$INPUT_FILE" ]
then
	echo "Usage: fuseki_tdbloader2.sh <dataset_name> <input_file>"
	echo "  Example: fuseki_tdbloader2.sh /data/fuseki/databases/wikidata /input/clean-wikidata.ttl > fuseki_tdbloader2_clean_wikidata.log 2>&1 &"
	exit
fi

# Start time
time=$(date)

export JVM_ARGS="-Xmx300G"

echo "***** Start import on $time *****"

# Execute tbdloader in the running container fuseki 
sudo ./apache-jena-4.4.0/bin/tdb2.xloader --threads=50 --loc $DATASET_NAME $INPUT_FILE

# End time
time=$(date)
echo "***** End import on $time *****"
