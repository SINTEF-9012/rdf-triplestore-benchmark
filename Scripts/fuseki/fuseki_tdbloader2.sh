#!/bin/bash

# Parameters
DATASET_NAME=$1
INPUT_FILE=$2

# Check parameters
if [ ! -n "$DATASET_NAME" ] || [ ! -n "$INPUT_FILE" ]
then
	echo "Usage: fuseki_tdbloader2.sh <dataset_name> <input_file>"
	echo "  Example: fuseki_tdbloader2.sh /fuseki/databases/dataset /staging/dataset.nt > fuseki_tdbloader2_dataset.log 2>&1 &"
	exit
fi

# Start time
time=$(date)
echo "***** Start import on $time *****"

# Execute tbdloader in the running container fuseki 
sudo docker exec fuseki /bin/bash -c "./tdbloader2 --loader=parallel --loc $DATASET_NAME $INPUT_FILE"

# End time
time=$(date)
echo "***** End import on $time *****"
