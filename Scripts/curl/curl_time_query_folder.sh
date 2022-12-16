#!/bin/bash

# Parameters
QUERY_FOLDER=$1
ITERATIONS=$2
SPARQL_ENDPOINT=$3
BENCHMARK_RESULT_FILE=$4

# Check parameters
if [ ! -n "$QUERY_FOLDER" ] || [ ! -n "$ITERATIONS" ] || [ ! -n "$SPARQL_ENDPOINT" ] || [ ! -n "$BENCHMARK_RESULT_FILE" ]
then
	echo "Usage: curl_time_query_folder.sh <query_folder> <iterations> <sparql_endpoint> <benchmark_result_file>"
	echo "  Example: curl_time_query_folder.sh dataset 2 http://localhost:3030/dataset/query dataset_benchmark_result.csv"
	exit
fi

# Create benchmark CSV file
if [ ! -f "$BENCHMARK_RESULT_FILE" ]
then
	touch $BENCHMARK_RESULT_FILE
else
	sudo rm $BENCHMARK_RESULT_FILE
fi

# Write headings to benchmark CSV file
echo "query_file,time_namelookup,time_connect,time_appconnect,time_pretransfer,time_redirect,time_starttransfer,time_total" >> $BENCHMARK_RESULT_FILE

# Process *.sparql query files in query folder
for query_file in $QUERY_FOLDER/*.sparql
do
	./curl_time_query_file.sh $query_file $ITERATIONS $SPARQL_ENDPOINT >> $BENCHMARK_RESULT_FILE
done
