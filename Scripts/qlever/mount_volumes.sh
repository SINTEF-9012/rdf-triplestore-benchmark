#!/bin/bash

sudo mount /dev/nvme1n1p1 /data
sudo chmod a+rwx /data
echo "*************************"
echo "ls -l /data              "
echo "*************************"
ls -l /data

sudo mount /dev/nvme2n1p1 /input
sudo chmod a+rwx /input
echo "*************************"
echo "ls -l /input             "
echo "*************************"
ls -l /input
