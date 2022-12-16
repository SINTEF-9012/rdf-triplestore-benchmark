#!/bin/bash

# Start time
time=$(date)
echo "***** Start download on $time *****"

# Download file
wget https://dumps.wikimedia.org/wikidatawiki/entities/latest-truthy.nt.gz

# End time
time=$(date)
echo "***** End download on $time *****"
