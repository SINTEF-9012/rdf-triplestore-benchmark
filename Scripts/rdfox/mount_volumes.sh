#!/bin/bash

sudo mount /dev/xvdf1 /data
sudo chmod a+rwx /data
echo "*************************"
echo "ls -l /data              "
echo "*************************"
ls -l /data

sudo mount /dev/xvdg1 /input
sudo chmod a+rwx /input
echo "*************************"
echo "ls -l /input             "
echo "*************************"
ls -l /input

sudo mount /dev/xvdh1 /export
sudo chmod a+rwx /export
echo "*************************"
echo "ls -l /export            "
echo "*************************"
ls -l /export
