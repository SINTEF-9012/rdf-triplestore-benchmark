#!/bin/bash

# Install docker
sudo ./docker_install.sh

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
