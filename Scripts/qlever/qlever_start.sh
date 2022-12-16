#!/bin/bash

# Parameters
DATASET_NAME=$1

# Check parameters
if [ ! -n "$DATASET_NAME" ]
then
	echo "Usage: qlever_start.sh <dataset_name>"
	echo "  Example: qlever_start.sh dataset | tee qlever_start_dataset.log"
	exit
fi

# Load data
sudo docker run --name qlever -p 7001:7001 -v "/data/qlever/index:/index" -e INDEX_PREFIX=$DATASET_NAME -e MEMORY_FOR_QUERIES=380 -e CACHE_MAX_SIZE_GB=380 qlever
