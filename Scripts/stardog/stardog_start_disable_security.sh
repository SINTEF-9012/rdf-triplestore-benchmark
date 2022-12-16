#!/bin/bash

# Start server
sudo /opt/stardog/bin/stardog-admin server start --foreground --port 5820 --home /data/stardog --disable-security
