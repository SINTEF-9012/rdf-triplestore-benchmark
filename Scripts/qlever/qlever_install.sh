#!/bin/bash

# Install docker
sudo ./docker_install.sh

# Clone qlever and build docker image
sudo git clone --recursive https://github.com/ad-freiburg/QLever.git qlever
cd qlever
sudo docker build -t qlever .

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
