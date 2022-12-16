#!/bin/bash


# Start time
time=$(date)


echo "***** Start import on $time *****"


curl -X POST \
    -H 'Content-Type: application/json' \
    https://wikidata-instance-1.cybqqkizomiw.eu-west-1.neptune.amazonaws.com:8182/loader -d '
    {
      "source" : "s3://skytrack-wikidata/latest-all.tll",
      "format" : "turtle",
      "iamRoleArn" : "arn:aws:iam::411141415506:role/NeptuneLoadFromS3",
      "region" : "eu-west-1",
      "failOnError" : "FALSE",
      "parallelism" : "OVERSUBSCRIBE",
      "updateSingleCardinalityProperties" : "FALSE",
      "queueRequest" : "TRUE"
    }'

# End time
time=$(date)
echo "***** End import on $time *****"
