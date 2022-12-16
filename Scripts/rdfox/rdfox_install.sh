#!/bin/bash

if ! command -v unzip > /dev/null 2>&1
then
sudo apt update
sudo apt install unzip
unzip -version
fi

if [ ! -d "RDFox-linux-x86_64-5.4" ]
then
sudo unzip RDFox-linux-x86_64-5.4.zip
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
