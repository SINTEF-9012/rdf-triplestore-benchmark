#!/bin/bash

# Parameters
DATASET_NAME=$1
INPUT_FILE=$2

# Check parameters
if [ ! -n "$DATASET_NAME" ] || [ ! -n "$INPUT_FILE" ]
then
	echo "Usage: stardog_data_add.sh <dataset_name> <input_file>"
	echo "  Example: stardog_data_add.sh dataset /input/dataset.nt > stardog_data_add_dataset.log 2>&1 &"
	exit
fi

# Start time
time=$(date)
echo "***** Start import on $time *****"

# Add data
sudo /opt/stardog/bin/stardog data add -v $DATASET_NAME $INPUT_FILE

# End time
time=$(date)
echo "***** End import on $time *****"
