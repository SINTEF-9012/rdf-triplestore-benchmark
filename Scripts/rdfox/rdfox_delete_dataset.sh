#!/bin/bash

# Parameters
DATASET_NAME=$1

# Check parameters
if [ ! -n "$DATASET_NAME" ]
then
	echo "Usage: rdfox_delete_dataset.sh <dataset_name>"
	echo "  Example: rdfox_delete_dataset.sh dataset"
	exit
fi

# Delete server-directory corresponding to dataset name
if [ -d "/data/rdfox/$DATASET_NAME" ] 
then 
sudo rm -rf /data/rdfox/$DATASET_NAME
fi
