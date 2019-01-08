#!/bin/bash
# README - kill all pids of `local_data` and `data_drive` clusters
cd /data/elasticsearch

#CLUSTER_NAME=cluster.plane-12-29-2018
DATA_DIR=/data/local_data/elasticsearch
CLUSTER_DIR=$DATA_DIR/$CLUSTER_NAME
PIDS_DIR=${DATA_DIR}/${ENV_CLUSTER_NAME}/pids

if [ -z "$(ls -A $PIDS_DIR/)" ]; then
   echo "No pid files found for cluster $ENV_CLUSTER_NAME at $CLUSTER_DIR" 
else
   for f in ${PIDS_DIR}/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done
   echo "Killed pids for ${ENV_CLUSTER_NAME} found at $CLUSTER_DIR"
fi
# old working - for f in ${DATA_DIR}/${ENV_CLUSTER_NAME}/pids/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done

cd /data/elasticsearch
CLUSTER_NAME=data-drive.2019-01-02
DATA_DIR=/data/data_drive/elasticsearch
PIDS_DIR=$DATA_DIR/$CLUSTER_NAME

if [ -z "$(ls -A $PIDS_DIR)" ]; then
   echo "No pid files found for cluster $CLUSTER_NAME at $CLUSTER_DIR"
else
   for f in ${PIDS_DIR}/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done
for f in ${PIDS_DIR}/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done
fi
