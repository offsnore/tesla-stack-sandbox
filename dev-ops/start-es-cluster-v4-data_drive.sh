#!/bin/bash
dir=`pwd`
cd

CLUSTER_NAME=data-drive.2019-01-02
DATA_DRIVE=/data/data_drive
CLUSTER_DIR=$DATA_DRIVE/elasticsearch/$CLUSTER_NAME
DATA_DIR=$CLUSTER_DIR/data
DEFAULT_CLUSTER_CONFIGS=~/workspace/tesla-stack/elasticsearch-configs
PATH_CONFIGS=$CLUSTER_DIR/configs
PIDS_DIR=$CLUSTER_DIR/pids
LOGS_DIR=$CLUSTER_DIR/logs

echo "Checking that directory path exists: $DATA_DIR"
# Set up $DATA_DIR paths
if [ ! -z $DATA_DIR ]; then
  mkdir -p $DATA_DIR
  echo "Created data directory: $DATA_DIR"
fi 

cd $CLUSTER_DIR
if [ ! -z $LOGS_DIR ]; then
  mkdir -p $LOGS_DIR
  echo "Created logs directory: $LOGS_DIR"
fi


if [ ! -z $PIDS_DIR ]; then
  mkdir -p $PIDS_DIR
  echo "Created pids directory: $PIDS_DIR"
fi
cd ~/workspace/elastic-stack/current/elasticsearch

# --- Start Elasticsearch processes ---

# NODE 1
NODE_NAME=node-d0
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
if [ ! -z ${PATH_CONFIGS}/${NODE_NAME ]; then
  mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
ES_JAVA_OPTS="-Xms4g -Xmx4g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.data=${DATA_DIR}/${NODE_NAME}  -E path.logs=${LOGS_DIR}  -E "cluster.name=${CLUSTER_NAME}" -E "node.name"=${NODE_NAME}  -d
echo "Started Elasticsearch $NODE_NAME"
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"

# NODE 2
NODE_NAME=node-d1
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
if [ ! -z ${PATH_CONFIGS}/${NODE_NAME ]; then
  mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
# DEFAULT_CLUSTER_CONFIG
ES_JAVA_OPTS="-Xms2g -Xmx2g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -E path.data=${DATA_DIR}/${NODE_NAME}  -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.logs=${LOGS_DIR} -E "cluster.name=${CLUSTER_NAME}"  -E "node.name"=${NODE_NAME}   -d
echo "Started Elasticsearch $NODE_NAME"
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"

# NODE 3
NODE_NAME=node-d2
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
if [ ! -z ${PATH_CONFIGS}/${NODE_NAME ]; then
  mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
ES_JAVA_OPTS="-Xms2g -Xmx2g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.data=${DATA_DIR}/${NODE_NAME}  -E path.logs=${LOGS_DIR} -E "node.name"=${NODE_NAME} -E "cluster.name=${CLUSTER_NAME}" -d
echo "Started Elasticsearch $NODE_NAME" 
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"

