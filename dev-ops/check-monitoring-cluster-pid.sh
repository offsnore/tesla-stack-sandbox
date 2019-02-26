#!/bin/bash
# Use env var script to keep track of Monitoring Cluster pids
source cluster-vars.source

#ps -ef | grep `cat monitoring-cluster.2019-02-25/pids/monitoring-node-0.pid`
echo "Checking for pids at: $PIDS_DIR_MONITORING/monitoring-node-0.pid"
ps -ef | grep `cat $PIDS_DIR_MONITORING/monitoring-node-0.pid`

