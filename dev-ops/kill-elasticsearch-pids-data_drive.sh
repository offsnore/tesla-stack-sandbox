#!/bin/bash
# README - kill all pids of only the `data_drive` cluster

echo "Directory: `pwd`"

source cluster-vars.source

cd /data/elasticsearch
DATA_DIR=/data/data_drive/elasticsearch
echo cluster name: $ENV_CLUSTER_NAME
for f in ${DATA_DIR}/${ENV_CLUSTER_NAME}/pids/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done

