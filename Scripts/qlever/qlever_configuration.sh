#!/bin/bash

if [ ! -d "/data/qlever" ] 
then 
sudo mkdir /data/qlever
sudo chmod a+rwx /data/qlever
fi

if [ ! -d "/data/qlever/index" ] 
then 
sudo mkdir /data/qlever/index
sudo chmod a+rwx /data/qlever/index
fi
