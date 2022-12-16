#!/bin/bash

# Parameters
DATASET_NAME=$1
COMMANDS_FILE=$2

# Check parameters
if [ ! -n "$DATASET_NAME" ] || [ ! -n "$COMMANDS_FILE" ]
then
	echo "Usage: rdfox_run_commands.sh <dataset_name> <commands_file>"
	echo "  Example: rdfox_run_commands.sh dataset commands_file.rdfox > /data/logs/rdfox_run_commands_file.log 2>&1 &"
	exit
fi

# Create data folder
if [ ! -d "$DATASET_NAME" ] 
then 
sudo mkdir /data/rdfox/$DATASET_NAME
sudo chmod a+rwx /data/rdfox/$DATASET_NAME
fi

# Start time
time=$(date)
echo "***** Start import on $time *****"

# Run commands in shell environment
sudo ./RDFox-linux-x86_64-5.4/RDFox -role guest -server-directory /data/rdfox/$DATASET_NAME shell < $COMMANDS_FILE

# End time
time=$(date)
echo "***** End import on $time *****"
