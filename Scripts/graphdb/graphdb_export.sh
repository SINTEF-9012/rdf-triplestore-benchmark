#!/bin/bash

# https://graphdb.ontotext.com/documentation/standard/storage-tool.html

# The tool works only on repository images that are not in use (i.e., when the database is down).

# Parameters
REPO_STORAGE_FOLDER=$1
DESTINATION_FILE=$2

# Check parameters
if [ ! -n "$REPO_STORAGE_FOLDER" ] || [ ! -n "$DESTINATION_FILE" ]
then
	echo "Usage: graphdb_export.sh <repo_storage_folder> <destination_file>"
	echo "  Example: graphdb_export.sh /data/graphdb/data/repositories/wikidata/storage /export/wikidata-export.ttl > graphdb_export_wikidata.log 2>&1 &"
	exit
fi

# Start time
time=$(date)
echo "***** Start export on $time *****"

# Export data
sudo graphdb-ee-9.10.0/bin/storage-tool -esize=40 -command=export -storage=$REPO_STORAGE_FOLDER -srcIndex=pos -destFile=$DESTINATION_FILE

# End time
time=$(date)
echo "***** End export on $time *****"
