#!/bin/bash
sudo growpart /dev/nvme1n1 1
sudo e2fsck -f /dev/nvme1n1p1
sudo resize2fs /dev/nvme1n1p1
