#!/bin/bash

# https://docs.stardog.com/get-started/install-stardog/linux-installation

curl http://packages.stardog.com/stardog.gpg.pub | sudo apt-key add
sudo chmod go+w /etc/apt/sources.list
echo "deb http://packages.stardog.com/deb/ stable main" >> /etc/apt/sources.list
sudo chmod go-w /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y stardog=7.8.0

# Create /data folder
if [ ! -d "/data" ] 
then 
sudo mkdir /data
sudo chmod a+rwx /data
fi

# Create /java folder
if [ ! -d "/java" ] 
then 
sudo mkdir /java
sudo chmod a+rwx /java
fi

# Create /input folder
if [ ! -d "/input" ] 
then 
sudo mkdir /input
sudo chmod a+rwx /input
fi
