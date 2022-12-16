#!/bin/bash

# https://docs.stardog.com/stardog-cli-reference/data/data-export#stardog-data-export

# Parameters
DATASET_NAME=$1
EXPORT_FILE=$2

# Check parameters
if [ ! -n "$DATASET_NAME" ] || [ ! -n "$EXPORT_FILE" ]
then
	echo "Usage: stardog_data_export.sh <dataset_name> <export_file>"
	echo "  Example: stardog_data_export.sh wikidata /export/wikidata-export.ttl > stardog_data_export_wikidata.log 2>&1 &"
	exit
fi

# Start time
time=$(date)
echo "***** Start export on $time *****"

# Export data
sudo /opt/stardog/bin/stardog data export --named-graphs ALL -- $DATASET_NAME $EXPORT_FILE

# End time
time=$(date)
echo "***** End export on $time *****"
