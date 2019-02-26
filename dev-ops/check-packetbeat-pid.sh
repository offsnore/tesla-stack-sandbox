#!/bin/bash
# Use env var script to keep track of Monitoring Cluster pids
source cluster-vars.source

echo "Checking for pids at: $PIDS_DIR_MONITORING/packetbeat.pid"
ps -ef | grep `cat $PIDS_DIR_MONITORING/packetbeat.pid`

