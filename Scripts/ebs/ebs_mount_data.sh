#!/bin/bash

if [ ! -d "/data" ] 
then 
sudo mkdir /data
sudo chmod a+rwx /data
fi

sudo mount /dev/nvme1n1p1 /data
ls -l /data
