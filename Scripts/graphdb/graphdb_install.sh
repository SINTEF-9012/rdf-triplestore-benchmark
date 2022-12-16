#!/bin/bash

if ! command -v java > /dev/null 2>&1
then
sudo apt update
sudo apt install default-jdk
java -version
fi

if ! command -v unzip > /dev/null 2>&1
then
sudo apt update
sudo apt install unzip
unzip -version
fi

if [ ! -d "graphdb-ee-9.10.0" ]
then
sudo unzip graphdb-ee-9.10.0-dist.zip
sudo cp graphdb.properties graphdb-ee-9.10.0/conf/
fi

# Create /data folder
if [ ! -d "/data" ] 
then 
sudo mkdir /data
sudo chmod a+rwx /data
fi

# Create /input folder
if [ ! -d "/input" ] 
then 
sudo mkdir /input
sudo chmod a+rwx /input
fi

# Create /export folder
if [ ! -d "/export" ] 
then 
sudo mkdir /export
sudo chmod a+rwx /export
fi
