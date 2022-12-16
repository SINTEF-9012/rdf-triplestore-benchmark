#!/bin/bash

# https://docs.stardog.com/operating-stardog/server-administration/capacity-planning

# Update /etc/environment
sudo chmod go+w /etc/environment
sudo echo 'STARDOG_HOME="/data/stardog"' >> /etc/environment
sudo echo 'STARDOG_SERVER_JAVA_ARGS="-Xmx30g -Xms30g -XX:MaxDirectMemorySize=80g"' >> /etc/environment 
sudo echo '_JAVA_OPTIONS="-Djava.io.tmpdir=/java/tmp"' >> /etc/environment
sudo chmod go-w /etc/environment

# Reboot for changes to take effect
sudo reboot
