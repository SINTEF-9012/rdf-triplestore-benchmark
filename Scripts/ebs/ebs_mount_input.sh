#!/bin/bash

if [ ! -d "/input" ] 
then 
sudo mkdir /input
sudo chmod a+rwx /input
fi

sudo mount /dev/nvme2n1p1 /input
ls -l /input
