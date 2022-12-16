#!/bin/bash

# Parameters
QUERY_FILE=$1
SPARQL_ENDPOINT=$2

# Check parameters
if [ ! -n "$QUERY_FILE" ] || [ ! -n "$SPARQL_ENDPOINT" ]
then
	echo "Usage: curl_test_query_file.sh <query_file> <sparql_endpoint>"
	echo "  Example: curl_test_query_file.sh query.sparql http://localhost:3030/dataset/query"
	exit
fi

response=$(curl -H "Accept: application/sparql-results+json" -G -s --data-urlencode "query@$QUERY_FILE" $SPARQL_ENDPOINT)

echo "$response"
