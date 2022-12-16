# EBS scripts

[Formatting NVME Partition on CentOS 7 – The Linux Cluster](https://thelinuxcluster.com/2018/07/09/formatting-nvme-partition-on-centos-7/)
```
sudo lsblk
sudo fdisk /dev/nvme1n1
```
Create a partition table (command 'g'), then create a new partition (command 'n'), and finally write the partition information (command 'w')

Then you can format the new partition using e.g., the ext4 file system.
```
sudo mkfs -t ext4 /dev/nvme1n1p1
```

[Make an Amazon EBS volume available for use on Linux - Amazon Elastic Compute Cloud](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html)
```
sudo mkdir /data
sudo mount /dev/nvme1n1p1 /data
```

[Extend a Linux file system after resizing a volume - Amazon Elastic Compute Cloud](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recognize-expanded-volume-linux.html?icmpid=docs_ec2_console)
```
sudo growpart /dev/nvme1n1 1
sudo resize2fs /dev/nvme1n1p1
```
