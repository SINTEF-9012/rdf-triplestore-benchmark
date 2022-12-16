#!/bin/bash
sudo lsblk -f
sudo mkfs -t ext4 /dev/nvme1n1p1
