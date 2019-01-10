#!/bin/bash
# README - kill all pids of `local_data` and `data_drive` clusters

echo "Directory: `pwd`"

source cluster-vars.source

if [  -z "${CLUSTER_NAME_LOCAL}" ]; then
  echo "CLUSTER_NAME_LOCAL not set. Using backup default: local_drive.2019-01-09"
  CLUSTER_NAME_LOCAL=local_drive.2019-01-09
fi

if [  -z "${CLUSTER_NAME_DATA_DRIVE}" ]; then
  echo "CLUSTER_NAME_DATA_DRIVE not set. Using backup default: data_drive.2019-01-09"
  CLUSTER_NAME_DATA_DRIVE=data_drive.2019-01-09
fi

DATA_DIR=/data/local_drive/elasticsearch
CLUSTER_DIR=$DATA_DIR/$CLUSTER_NAME_LOCAL
PIDS_DIR=${DATA_DIR}/${CLUSTER_NAME_LOCAL}/pids


if [ -z "$(ls -A $PIDS_DIR/)" ]; then
   echo "No pid files found for cluster $CLUSTER_NAME_LOCAL at $PIDS_DIR" 
else
   for f in ${PIDS_DIR}/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done
   echo "Killed pids for ${CLUSTER_NAME_LOCAL} found at $CLUSTER_DIR"
fi
# old working - for f in ${DATA_DIR}/${CLUSTER_NAME_LOCAL}/pids/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done

# DATA_DRIVE

cd /data/elasticsearch
DATA_DIR=/data/data_drive/elasticsearch
CLUSTER_DIR=$DATA_DIR/$CLUSTER_NAME_DATA_DRIVE
PIDS_DIR=${DATA_DIR}/${CLUSTER_NAME_DATA_DRIVE}/pids

if [ -z "$(ls -A $PIDS_DIR)" ]; then
   echo "No pid files found for cluster $CLUSTER_NAME at $PIDS_DIR"
else
   for f in ${PIDS_DIR}/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done
for f in ${PIDS_DIR}/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done
fi
