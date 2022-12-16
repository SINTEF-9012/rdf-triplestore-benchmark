#!/bin/bash

# https://docs.stardog.com/operating-stardog/database-administration/managing-databases
# https://docs.stardog.com/operating-stardog/database-administration/database-configuration

# Parameters
DATASET_NAME=$1
INPUT_FILE=$2

# Check parameters
if [ ! -n "$DATASET_NAME" ] || [ ! -n "$INPUT_FILE" ]
then
	echo "Usage: stardog_db_create.sh <dataset_name> <input_file>"
	echo "  Example: stardog_db_create.sh dataset /input/dataset.nt > stardog_db_create_dataset.log 2>&1 &"
	exit
fi

# Start time
time=$(date)
echo "***** Start import on $time *****"

# Create database with strict.parsing=false
sudo /opt/stardog/bin/stardog-admin db create -n $DATASET_NAME -o strict.parsing=false -v $INPUT_FILE

# End time
time=$(date)
echo "***** End import on $time *****"
