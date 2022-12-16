#!/bin/bash

# https://docs.stardog.com/operating-stardog/server-administration/server-configuration

# Create Stardog home folder
if [ ! -d "/data/stardog" ] 
then 
sudo mkdir /data/stardog
sudo chmod a+rwx /data/stardog
fi

# Create Java tmp folder
if [ ! -d "/java/tmp" ] 
then 
sudo mkdir /java/tmp
sudo chmod a+rwx /java/tmp
fi

# Replace stardog.env.sh file
sudo cp -f stardog.env.sh /etc/stardog.env.sh

# Copy license file
if [ ! -f "/data/stardog/stardog-license-key.bin" ] 
then 
sudo cp stardog-license-key.bin /data/stardog/
fi
