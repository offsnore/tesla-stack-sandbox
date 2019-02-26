#!/bin/bash
# Stop monitoring cluster kibana
source cluster-vars.source

kill `cat $PIDS_DIR_MONITORING/monitoring-node-0.pid`
