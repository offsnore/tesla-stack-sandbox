#!/bin/bash
# Script ot start metricbeat, with pid, logs, config in cluster path

cd ~/workspace/tesla-stack/dev-ops
source ./cluster-vars.source

cd ~/workspace/elastic-stack/current/packetbeat
sudo ./packetbeat -c packetbeat.yml -e  |  tee -a  $LOGS_DIR_MONITORING/packetbeat-`date +%Y-%m-%d`.out  & echo $! > $PIDS_DIR_MONITORING/packetbeat.pid
#./packetbeat -c packetbeat.yml -e 2>&1 |  tee -a  $LOGS_DIR_MONITORING/packetbeat-`date +%Y-%m-%d`.out  & echo $! > $PIDS_DIR_MONITORING/packetbeat.pid
