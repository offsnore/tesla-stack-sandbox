#!/bin/bash
# Add extertnal monitor cluster exporter config to DATA_DRIVE cluster
source ../dev-ops/cluster-vars.source

echo "Configuring external monitoring to cluster at: `ls -al $PATH_CONFIGS_MONITORING`"
echo "xpack.monitoring.exporters:" | tee -a $PATH_CONFIGS_DATA_DRIVE/node-*/elasticsearch.yml
echo "  id1:" |  tee -a $PATH_CONFIGS_DATA_DRIVE/node-*/elasticsearch.yml
echo "    type: http" | tee -a $PATH_CONFIGS_DATA_DRIVE/node-*/elasticsearch.yml
echo "    host: [\"http://es-mon-1:9211\"]" | tee -a $PATH_CONFIGS_DATA_DRIVE/node-*/elasticsearch.yml
echo "#    auth.username: remote_monitor" | tee -a $PATH_CONFIGS_DATA_DRIVE/node-*/elasticsearch.yml
echo :#    auth.password: changeme" | tee -a $PATH_CONFIGS_DATA_DRIVE/node-*/elasticsearch.yml
