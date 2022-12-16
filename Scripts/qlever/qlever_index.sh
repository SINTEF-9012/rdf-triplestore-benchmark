#!/bin/bash

# Parameters
DATASET_LOCATION=$1
INPUT_FILE=$2
SETTINGS_FILE=$3

# Check parameters
if [ ! -n "$DATASET_LOCATION" ] || [ ! -n "$INPUT_FILE" ] || [ ! -n "$SETTINGS_FILE" ]
then
	echo "Usage: qlever_index.sh <dataset_location> <input_file> <settings_file>"
	echo "  Example: qlever_index.sh /index/dataset /input/dataset.nt /input/dataset-settings.json > qlever_index_dataset.log 2>&1 &"
	exit
fi

# Start time
time=$(date)
echo "***** Start import on $time *****"

# Index data
sudo docker run --name qlever -d -it --privileged --rm -v "/input:/input" -v "/data/qlever/index:/index" --entrypoint "bash" qlever
sudo docker exec qlever IndexBuilderMain -l -i $DATASET_LOCATION -f $INPUT_FILE -s $SETTINGS_FILE

# End time
time=$(date)
echo "***** End import on $time *****"
