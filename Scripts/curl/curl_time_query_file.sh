#!/bin/bash

# Parameters
QUERY_FILE=$1
ITERATIONS=$2
SPARQL_ENDPOINT=$3

# Check parameters
if [ ! -n "$QUERY_FILE" ] || [ ! -n "$ITERATIONS" ] || [ ! -n "$SPARQL_ENDPOINT" ]
then
	echo "Usage: curl_time_query_file.sh <query_file> <iterations> <sparql_endpoint>"
	echo "  Example: curl_time_query_file.sh query.sparql 2 http://localhost:3030/dataset/query"
	exit
fi

# Decimal roundings
decimal_rounding=5

# Formatted cURL output that contains the various response timings separated by '-'
curl_format="%{time_namelookup}-%{time_connect}-%{time_appconnect}-%{time_pretransfer}-%{time_redirect}-%{time_starttransfer}-%{time_total}"

# Extract filename without path
filename="${QUERY_FILE##*/}"

for i in `seq 1 $ITERATIONS`;
do
	response=$(curl -G -o /dev/null -s -w $curl_format --data-urlencode "query@$QUERY_FILE" $SPARQL_ENDPOINT)

	# Splits response string by the delimiter of "-"
	response_times=($(echo "$response" | tr "-" "\n"))

	# Assigning each type of response time to a variable
	time_namelookup=${response_times[0]}
	time_connect=${response_times[1]}
	time_appconnect=${response_times[2]}
	time_pretransfer=${response_times[3]}
	time_redirect=${response_times[4]}
	time_starttransfer=${response_times[5]}
	time_total=${response_times[6]}

	# Write CSV data (for appending to benchmark result file)
    echo "$filename,$time_namelookup,$time_connect,$time_appconnect,$time_pretransfer,$time_redirect,$time_starttransfer,$time_total"
done
