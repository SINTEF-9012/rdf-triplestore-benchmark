#!/bin/bash

# Create data folder
if [ ! -d "/data/rdfox" ] 
then 
sudo mkdir /data/rdfox
sudo chmod a+rwx /data/rdfox
fi

# Create logs folder
if [ ! -d "/data/logs" ] 
then 
sudo mkdir /data/logs
sudo chmod a+rwx /data/logs
fi

# Copy license file
if [ ! -f "/RDFox-linux-x86_64-5.4/RDFox.lic" ] 
then 
sudo cp RDFox.lic RDFox-linux-x86_64-5.4/
fi
