#!/bin/bash

# Parameters
DATASET_NAME=$1

# Check parameters
if [ ! -n "$DATASET_NAME" ]
then
	echo "Usage: rdfox_start_shell.sh <dataset_name>"
	echo "  Example: rdfox_start_shell.sh dataset"
	exit
fi

# Run commands in shell environment
sudo ./RDFox-linux-x86_64-5.4/RDFox -role guest -server-directory /data/rdfox/$DATASET_NAME shell
