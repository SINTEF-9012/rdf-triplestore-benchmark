#!/bin/bash

# Parameters


monitor_process_id=""
skip_to_file=""
exclude_files="" 

while getopts m:j:x: flag
do
    case "${flag}" in
		m) monitor_process_id="${monitor_process_id} -p ${OPTARG}";;
        j) skip_to_file=${OPTARG};;
		x) exclude_files="${exclude_files} ${OPTARG}";;
    esac
done


QUERY_FOLDER=${@:$OPTIND:1}
ITERATIONS=${@:$OPTIND+1:1}
SPARQL_ENDPOINT=${@:$OPTIND+2:1}
BENCHMARK_RESULT_FILE=${@:$OPTIND+3:1}
BENCHMARK_RESPONSE_FOLDER=${@:$OPTIND+4:1}


# Check parameters
if [ ! -n "$QUERY_FOLDER" ] || [ ! -n "$ITERATIONS" ] || [ ! -n "$SPARQL_ENDPOINT" ] || [ ! -n "$BENCHMARK_RESULT_FILE" ] || [ ! -n "$BENCHMARK_RESPONSE_FOLDER" ]
then
	echo "Usage: curl_benchmark_query_folder.sh <query_folder> <iterations> <sparql_endpoint> <benchmark_result_file> <benchmark_response_folder>"
	echo "  Example: curl_benchmark_query_folder.sh wikidata 10 http://localhost:5820/wikidata/query wikidata_benchmark_result.csv wikidata_benchmark_responses"
	exit
fi


echo "monitor_process_id=${monitor_process_id}" 

# Check availability of required scripts
if [ ! -f "curl_test_query_file.sh" ]
then
	echo "Error: Missing script file 'curl_test_query_file.sh'"
fi

if [ ! -f "curl_time_query_file.sh" ]
then
	echo "Error: Missing script file 'curl_time_query_file.sh'"
fi

# Created benchmark response folder
if [ ! -d "$BENCHMARK_RESPONSE_FOLDER" ]
then
	sudo mkdir $BENCHMARK_RESPONSE_FOLDER
	sudo chmod a+rwx $BENCHMARK_RESPONSE_FOLDER
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

# Process *.sparql query files in query folder and update benchmark CSV file
# Write response file in the benchmark response folder the first time for each query
for query_file in $QUERY_FOLDER/*.sparql
do
	filename="${query_file##*/}"
	
	
	if [ ! -z "$skip_to_file" ] && [ "$filename" != "$skip_to_file" ]; 
	then
		echo "Skip $filename"
		continue
	else
		#echo "$skip_to_file"
		skip_to_file=""
	fi
	
	if [[ $exclude_files == *"$filename"* ]]; then
		echo "Exclude $filename"
		continue
	fi
	
	echo "$filename"
	
	if [ ! -z "$monitor_process_id" ];
	then
		top -b $monitor_process_id	> "${BENCHMARK_RESPONSE_FOLDER}/top_${filename}.data" &
		top_pid=$!
	fi
	
	./curl_test_query_file.sh $query_file $SPARQL_ENDPOINT > $BENCHMARK_RESPONSE_FOLDER/$filename.response
	./curl_time_query_file.sh $query_file $ITERATIONS $SPARQL_ENDPOINT >> $BENCHMARK_RESULT_FILE
	
	if [ ! -z "$monitor_process_id" ];
	then
		sleep 4
		sudo killall top
	fi
	
	
done
