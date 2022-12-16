#!/bin/bash

LOAD_TASK_ID=$1


curl -G "https://wikidata-instance-1.cybqqkizomiw.eu-west-1.neptune.amazonaws.com:8182/loader/"$LOAD_TASK_ID

