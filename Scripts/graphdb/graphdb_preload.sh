#!/bin/bash

# https://graphdb.ontotext.com/documentation/free/loading-data-using-preload.html

# - Create a repo first using the GraphDB UI. Use create from file, see https://graphdb.ontotext.com/documentation/free/creating-a-repository.html#create-a-repository
# - Use "no inference" as a ruleset. The preload tool will not reinfer by default so this does not really matter.
# - The preload tool has a built-in safety mechanism which makes restore points in some intervals, which lets it continue if run again.

# Parameters
REPO_ID=$1
INPUT_FILE=$2

# Check parameters
if [ ! -n "$REPO_ID" ] || [ ! -n "$INPUT_FILE" ]
then
	echo "Usage: graphdb_preload.sh <repo_id> <input_file>"
	echo "  Example: graphdb_preload.sh dataset /input/dataset.nt > graphdb_preload_dataset.log 2>&1 &"
	exit
fi

# Start time
time=$(date)
echo "***** Start import on $time *****"

# Load data
sudo graphdb-ee-9.10.0/bin/preload -f -p -t 12 -i $REPO_ID $INPUT_FILE

# End time
time=$(date)
echo "***** End import on $time *****"
