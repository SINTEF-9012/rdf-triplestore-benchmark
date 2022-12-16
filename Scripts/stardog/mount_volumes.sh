#!/bin/bash

sudo mount /dev/nvme1n1p1 /data
sudo chmod a+rwx /data
echo "*************************"
echo "ls -l /data              "
echo "*************************"
ls -l /data

sudo mount /dev/nvme2n1p1 /java
sudo chmod a+rwx /java
echo "*************************"
echo "ls -l /java              "
echo "*************************"
ls -l /java
