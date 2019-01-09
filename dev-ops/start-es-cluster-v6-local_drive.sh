#!/bin/bash
# start local es cluster script
dir=`pwd`
cd


STACK_DIR=~/workspace/elastic-stack/current
PROJECT_STACK=~/workspace/tesla-stack
ES_HOME=$STACK_DIR/elasticsearch
#CLUSTER_NAME=local_data.2019-01-09

if [ -z "${ENV_CLUSTER_NAME}" ] ; then
  echo "Setting cluster.name with env vare: $ENV_CLUSTER_NAME"
  CLUSTER_NAME=$ENV_CLUSTER_NAME
fi

if [ -z "${CLUSTER_NAME}" ]; then
  echo "CLUSTER_NAME not set (e.g. sourced environment var). Last backup (hardcoded): local_data.2019-01-09"
  read -p "CLUSTER_NAME not set, please enter:" CLUSTER_NAME 
  echo "Set CLUSTER_NAME: $CLUSTER_NAME"
fi

if [ -z "${CLUSTER_NAME_LOCAL}" ]; then
  echo "CLUSTER_NAME_LOCAL not set. Using backup default: local_data.2019-01-09"
  CLUSTER_NAME_LOCAL=local_data.2019-01-09
fi


DATA_DIR=/data/local_drive
CLUSTER_DIR=$DATA_DIR/elasticsearch/$CLUSTER_NAME_LOCAL

DATA_DIR=$CLUSTER_DIR/data
PATH_CONFIGS=$CLUSTER_DIR/configs
PIDS_DIR=$CLUSTER_DIR/pids
LOGS_DIR=$CLUSTER_DIR/logs

DEFAULT_CONFIGS_PATH_ES=${PROJECT_STACK}/default-configs/elasticsearch
DEFAULT_NODE_TYPE=default.config
HOT_NODE_TYPE=hot.config
WARM_NODE_TYPE=warm.config
COOL_NODE_TYPE=cool.config
NUM_HOT_NODES=1
NUM_WARM_NODES=1
NUM_COOL_NODES=1
NODE_HEAP_GB=4



echo "Checking that directory path exists: $DATA_DIR"
# Set up $DATA_DIR paths
# Need root privs to create data, config, log paths
if [ ! -z $DATA_DIR ]; then
  sudo mkdir -p $DATA_DIR
  echo "Created data directory: $DATA_DIR"
fi 

cd $CLUSTER_DIR
# Create Logs Directory
if [ ! -z $LOGS_DIR ]; then
# Need root privs to create data, config, log paths
  sudo mkdir -p $LOGS_DIR
  echo "Created logs directory: $LOGS_DIR"
fi


# Create Process ID directory
if [ ! -z $PIDS_DIR ]; then
# Need root privs to create data, config, log paths
  sudo mkdir -p $PIDS_DIR
  echo "Created pids directory: $PIDS_DIR"
fi


# Create Configs directory
# Todo: need to copy in defaults, else throw immediate exception

if [ ! -z $PATH_CONFIGS ]; then
# Need root privs to create data, config, log paths
  sudo mkdir -p $PATH_CONFIGS
  echo "Created pids directory: $PATH_CONFIGS"
fi


# --- Start Elasticsearch Processes ---
if [ -z ES_HOME ]; then 
  cd $ES_HOME
else cd ~/workspace/elastic-stack/current/elasticsearch
fi

# NODE 1
NODE_NAME=node-0
NODE_HEAP_GB=4
NODE_TYPE=$HOT_NODE_TYPE
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  sudo mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
# Create node config directories, if they don't exist
if [ ! -z $PATH_CONFIGS/$NODE_NAME  ]; then
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node config directory: $PATH_CONFIGS/$NODE_NAME"
  echo "Copying default configs from: $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE"
  if [ ! -f $PATH_CONFIGS/$NODE_NAME/elasticsearch.yml ]; then 
    echo "HERE $PATH_CONFIGS/$NODE_NAME/elasticsearch.yml better not exist!"
    sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME
  fi
fi


# IMPORTANT - chown node directories to non-root user
echo "IMPORTANT: chowning recursively all cluster config, data directories created before starting up cluster.."
sudo chown -R andrew:wheel ${PATH_CONFIGS}
sudo chown -R andrew:wheel ${DATA_DIR}
sudo chown -R andrew:wheel ${LOGS_DIR}
sudo chown -R andrew:wheel ${PIDS_DIR}


ES_JAVA_OPTS="-Xms4g -Xmx4g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.data=${DATA_DIR}/${NODE_NAME}  -E path.logs=${LOGS_DIR}/$NODE_NAME  -E "cluster.name=${CLUSTER_NAME_LOCAL}" -E node.name=${NODE_NAME}  -d
echo "Started Elasticsearch $NODE_NAME"
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Configs created are ate $PATHS_CONFIG/$NODE_NAME"

# NODE 2

NODE_NAME=node-1
NODE_HEAP_GB=2
NODE_TYPE=$COOL_NODE_TYPE
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
# Create node config directories, if they don't exist
if [ ! -z $PATH_CONFIGS/$NODE_NAME  ]; then
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node config directory: $PATH_CONFIGS/$NODE_NAME"
  echo "Copying default configs from: $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE"
  if [ ! -f $PATH_CONFIGS/$NODE_NAME/elasticsearch.yml ]; then 
    sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME
  fi
fi
if [ -z ES_HOME ]; then 
  cd $ES_HOME
else cd ~/workspace/elastic-stack/current/elasticsearch
fi

# IMPORTANT - chown node directories to non-root user
echo "IMPORTANT: chowning recursively all cluster config, data directories created before starting up cluster.."
sudo chown -R andrew:wheel ${PATH_CONFIGS}
sudo chown -R andrew:wheel ${DATA_DIR}
sudo chown -R andrew:wheel ${LOGS_DIR}
sudo chown -R andrew:wheel ${PIDS_DIR}

ES_JAVA_OPTS="-Xms2g -Xmx2g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -E path.data=${DATA_DIR}/${NODE_NAME}  -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.logs=${LOGS_DIR}/$NODE_NAME -E cluster.name=${CLUSTER_NAME_LOCAL}  -E node.name=${NODE_NAME} -d
echo "Started Elasticsearch $NODE_NAME"
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Configs created are ate $PATHS_CONFIG/$NODE_NAME"

# NODE 3

NODE_NAME=node-2
NODE_HEAP_GB=2
NODE_TYPE=$COOL_NODE_TYPE
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
# Create node config directories, if they don't exist
if [ ! -z $PATH_CONFIGS/$NODE_NAME  ]; then
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node config directory: $PATH_CONFIGS/$NODE_NAME"
  echo "Copying default configs from: $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE"
  if [ ! -f $PATH_CONFIGS/$NODE_NAME/elasticsearch.yml ]; then 
    sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME
  fi 
fi
if [ -z ES_HOME ]; then
  cd $ES_HOME
else cd ~/workspace/elastic-stack/current/elasticsearch
fi
# IMPORTANT - chown node directories to non-root user
echo "IMPORTANT: chowning recursively all cluster config, data directories created before starting up cluster.."
sudo chown -R andrew:wheel ${PATH_CONFIGS}
sudo chown -R andrew:wheel ${DATA_DIR}
sudo chown -R andrew:wheel ${LOGS_DIR}
sudo chown -R andrew:wheel ${PIDS_DIR}

ES_JAVA_OPTS="-Xms1g -Xmx1g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.data=${DATA_DIR}/${NODE_NAME}  -E path.logs=${LOGS_DIR}/$NODE_NAME -E node.name=${NODE_NAME} -E cluster.name=${CLUSTER_NAME_LOCAL} -d
echo "Started Elasticsearch $NODE_NAME" 
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Configs created are ate $PATHS_CONFIG/$NODE_NAME"
echo "Creating alias to tail all elasticsearch logs: tail-elasticsaerch-logs"
alias tail-elasticsearch-logs="tail -F node-d*/data_drive.2019-01-08.log"
