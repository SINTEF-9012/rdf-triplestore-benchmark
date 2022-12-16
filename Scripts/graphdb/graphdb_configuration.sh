#!/bin/bash

# Create data folder
if [ ! -d "/data/graphdb" ] 
then 
sudo mkdir /data/graphdb
sudo chmod a+rwx /data/graphdb
fi

if [ ! -d "/data/graphdb/data" ] 
then 
sudo mkdir /data/graphdb/data
sudo chmod a+rwx /data/graphdb/data
fi

# Create Java tmp folder
if [ ! -d "/data/graphdb/javatmp" ] 
then 
sudo mkdir /data/graphdb/javatmp
sudo chmod a+rwx /data/graphdb/javatmp
fi

# Copy license file
if [ ! -d "/data/graphdb/license" ] 
then 
sudo mkdir /data/graphdb/license
sudo chmod a+rwx /data/graphdb/license
fi

if [ ! -f "/data/graphdb/conf/*.license" ]
then
sudo cp graphdb.license /data/graphdb/license/
sudo chmod a+r /data/graphdb/license/graphdb.license
fi
