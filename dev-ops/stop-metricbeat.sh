#!/bin/bash
# Script ot start metricbeat, with pid, logs, config in cluster path

cd ~/workspace/tesla-stack/dev-ops
source ./cluster-vars.source

if [ -z "$(ls -A $PIDS_DIR_MONITORING)" ]; then
   echo "No pid files found for cluster $CLUSTER_NAME at $PIDS_DIR_MONITORING"
else
   echo "Killing metricbeat pid: `cat $PIDS_DIR_MONITORING/metricbeat.pid`"
   kill `cat $PIDS_DIR_MONITORING/metricbeat.pid`
fi
