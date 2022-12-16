#!/bin/bash

# Parameters
SPARQL_ENDPOINT=$1

# Check parameters
if [ ! -n "$SPARQL_ENDPOINT" ]
then
	echo "Usage: curl_test_query.sh <sparql_endpoint>"
	echo "  Example: curl_test_query.sh http://localhost:3030/dataset/query"
	exit
fi

test_query="SELECT ?subject ?predicate ?object WHERE { ?subject ?predicate ?object } LIMIT 25"

response=$(curl -H "Accept: application/sparql-results+json"-G -s --data-urlencode "query=$test_query" $SPARQL_ENDPOINT)

echo "$response"
