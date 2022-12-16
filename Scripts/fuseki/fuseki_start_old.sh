#!/bin/bash

if [ -f "/data/fuseki/system/tdb.lock" ]
then
	sudo rm /data/fuseki/system/tdb.lock
fi

if [ -f "/data/fuseki/databases/dataset/tdb.lock" ]
then
	sudo rm /data/fuseki/databases/dataset/tdb.lock
fi

if [ -f "/data/fuseki/databases/wikidata/tdb.lock" ]
then
	sudo rm /data/fuseki/databases/wikidata/tdb.lock
fi

sudo docker-compose up -d
