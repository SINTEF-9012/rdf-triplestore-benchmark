#!/bin/bash

# Parameters
DATASET_NAME=$1

# Check parameters
if [ ! -n "$DATASET_NAME" ]
then
	echo "Usage: stardog_db_drop.sh <dataset_name>"
	echo "  Example: stardog_db_drop.sh dataset"
	exit
fi

# Drop database
sudo /opt/stardog/bin/stardog-admin db drop -n $DATASET_NAME
