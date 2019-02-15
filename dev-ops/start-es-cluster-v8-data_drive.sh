#!/bin/bash
# Start script for cluster running on external DATA_DRIVE

dir=`pwd`

STACK_DIR=~/workspace/elastic-stack/current
PROJECT_STACK=~/workspace/tesla-stack
#ES_HOME=$STACK_DIR/elasticsearch

cd $PROJECT_STACK/dev-ops
source ./cluster-vars.source
echo "ES_HOME sourced: $ES_HOME < should be there"

echo "Does this exist? CLUSTER_NAME_DATA_DRIVE:  ${CLUSTER_NAME_DATA_DRIVE}" 
if [  -z "$CLUSTER_NAME_DATA_DRIVE" ]; then
  read -p "CLUSTER_NAME_DATA_DRIVE not set, please enter(last default - data_drive.2019-01-09):  " CLUSTER_NAME_DATA_DRIVE
fi

DATA_DRIVE=/data/data_drive
CLUSTER_DIR=$DATA_DRIVE/elasticsearch/$CLUSTER_NAME_DATA_DRIVE

DATA_DIR=$CLUSTER_DIR/data
PATH_CONFIGS=$CLUSTER_DIR/configs
PIDS_DIR=$CLUSTER_DIR/pids
LOGS_DIR=$CLUSTER_DIR/logs
LOGS_DIR_KIBANA=$LOGS_DIR/kibana
LOGS_DIR_LOGSTASH=$LOGS_DIR/logstash
LOGS_DIR_BEATS=$LOGS_DIR/beats


DEFAULT_CONFIGS_PATH_ES=${PROJECT_STACK}/elasticsearch-configs/elasticsearch-data_drive
DEFAULT_NODE_TYPE=config.default
HOT_NODE_TYPE=config.hot
WARM_NODE_TYPE=config.warm
COOL_NODE_TYPE=config.cool
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

echo "Creating Kibana logs directory: $LOGS_DIR_KIBANA"
if [ ! -f $KIBANA_LOGS_DIR ] ; then
  sudo mkdir -p $LOGS_DIR_KIBANA
  echo "Created Kibana logs directorty: `ls  $LOGS_DIR_KIBANA`"
fi

echo "Creating Kibana logs directory: $LOGS_DIR_LOGSTASH"
if [ ! -f $LOGSTASH_LOGS_DIR ] ; then
  sudo mkdir -p $LOGS_DIR_LOGSTASH
  echo "Created Logstash logs directory: `ls $LOGS_DIR_LOGSTASH`"
fi
echo "Creating Beats logs directory: $LOGS_DIR_BEATS"
if [ ! -f $LOGS_DIR_BEATS ] ; then
  sudo mkdir -p $LOGS_DIR_BEATS
  echo "Created Beatsh logs directory: `ls $LOGS_DIR_BEATS`"
fi

# Create Configs directory
# Todo: need to copy in defaults, else throw immediate exception

if [ ! -z $PATH_CONFIGS ]; then
# Need root privs to create data, config, log paths
  sudo mkdir -p $PATH_CONFIGS
  echo "Created configs path directory: $PATH_CONFIGS"
fi


# --- Start Elasticsearch Processes ---
if [  -z ES_HOME ]; then 
  read -p "ES_HOME not set (e.g. ~/workspace/elastic-stack/current/elasticsearch), please enter (check env vars)" ES_HOME
  cd $ES_HOME
fi

# NODE 1
NODE_NAME=node-d0
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
    sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME
  fi
fi


# IMPORTANT - chown node directories to non-root user
echo "IMPORTANT: chowning recursively all cluster config, data directories created before starting up cluster.."
sudo chown -R andrew:wheel ${PATH_CONFIGS}
sudo chown -R andrew:wheel ${DATA_DIR}
sudo chown -R andrew:wheel ${LOGS_DIR}
sudo chown -R andrew:wheel ${PIDS_DIR}


cd $ES_HOME
echo "Starting Elasticsearch from this directory: `pwd`"
echo "Starting Elasticsearch node ${NODE_NAME} in cluster ${CLUSTER_NAME_DATA_DRIVE}"
ES_JAVA_OPTS="-Xms4g -Xmx4g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.data=${DATA_DIR}/${NODE_NAME}  -E path.logs=${LOGS_DIR}/$NODE_NAME  -E "cluster.name=${CLUSTER_NAME_DATA_DRIVE}" -E node.name=${NODE_NAME}  -d
echo "Started Elasticsearch $NODE_NAME"
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Pid file is at $PIDS_DIR/$NODE_NAME.pid: `cat $PIDS_DIR/$NODE_NAME.pid`"
echo "Configs created are at $PATHS_CONFIG/$NODE_NAME"

# NODE 2

NODE_NAME=node-d1
NODE_HEAP_GB=2
NODE_TYPE=$COOL_NODE_TYPE
if [ ! -f $DATA_DIR/$NODE_NAME ]; then
  mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
# Create node config directories, if they don't exist
if [ ! -f $PATH_CONFIGS/$NODE_NAME  ]; then
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node config directory: $PATH_CONFIGS/$NODE_NAME"
  echo "Copying default configs from: $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE"
  if [ ! -f $PATH_CONFIGS/$NODE_NAME/elasticsearch.yml ]; then 
    sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME
  fi
fi

if [  -z ES_HOME ]; then
  read -p "ES_HOME not set (e.g. ~/workspace/elastic-stack/current/elasticsearch), please enter (check env vars)" ES_HOME
  cd $ES_HOME
fi

# IMPORTANT - chown node directories to non-root user
echo "IMPORTANT: chowning recursively all cluster config, data directories created before starting up cluster.."
sudo chown -R andrew:wheel ${PATH_CONFIGS}
sudo chown -R andrew:wheel ${DATA_DIR}
sudo chown -R andrew:wheel ${LOGS_DIR}
sudo chown -R andrew:wheel ${PIDS_DIR}
cd $ES_HOME
echo "Starting Elasticsearch from this directory: `pwd`"
echo "Starting Elasticsearch node ${NODE_NAME} in cluster ${CLUSTER_NAME_DATA_DRIVE}"
ES_JAVA_OPTS="-Xms2g -Xmx2g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -E path.data=${DATA_DIR}/${NODE_NAME}  -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.logs=${LOGS_DIR}/$NODE_NAME -E cluster.name=${CLUSTER_NAME_DATA_DRIVE}  -E node.name=${NODE_NAME} -d
echo "Started Elasticsearch $NODE_NAME"
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Pid file is at $PIDS_DIR/$NODE_NAME.pid: `cat $PIDS_DIR/$NODE_NAME.pid`"
echo "Configs created are at $PATH_CONFIGS/$NODE_NAME"

# NODE 3

NODE_NAME=node-d2
NODE_HEAP_GB=2
NODE_TYPE=$COOL_NODE_TYPE
if [ ! -f $DATA_DIR/$NODE_NAME ]; then
  mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
# Create node config directories, if they don't exist
if [ ! -f $PATH_CONFIGS/$NODE_NAME  ]; then
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node config directory: $PATH_CONFIGS/$NODE_NAME"
  echo "Copying default configs from: $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE"
  if [ ! -f $PATH_CONFIGS/$NODE_NAME/elasticsearch.yml ]; then 
    sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME
  fi 
fi
if [ -z ES_HOME ]; then
  read -p "ES_HOME not set (e.g. ~/workspace/elastic-stack/current/elasticsearch), please enter (check env vars)" ES_HOME
  cd $ES_HOME
fi

# IMPORTANT - chown node directories to non-root user
echo "IMPORTANT: chowning recursively all cluster config, data directories created before starting up cluster.."
sudo chown -R andrew:wheel ${PATH_CONFIGS}
sudo chown -R andrew:wheel ${DATA_DIR}
sudo chown -R andrew:wheel ${LOGS_DIR}
sudo chown -R andrew:wheel ${PIDS_DIR}

cd $ES_HOME
echo "Starting Elasticsearch node ${NODE_NAME} in cluster ${CLUSTER_NAME_DATA_DRIVE}"
echo "Starting Elasticsearch from this directory: `pwd`"
ES_JAVA_OPTS="-Xms1g -Xmx1g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.data=${DATA_DIR}/${NODE_NAME}  -E path.logs=${LOGS_DIR}/$NODE_NAME -E node.name=${NODE_NAME} -E cluster.name=${CLUSTER_NAME_DATA_DRIVE} -d
echo "Started Elasticsearch $NODE_NAME" 
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Pid file is at $PIDS_DIR/$NODE_NAME.pid: `cat $PIDS_DIR/$NODE_NAME.pid`"
echo "Configs created are at $PATH_CONFIGS/$NODE_NAME"
echo "Creating alias to tail all elasticsearch logs: tail-elasticsearch-logs"
alias tail-elasticsearch-logs-data_drive="tail -F $DATA_DIR/*/${CLUSTER_NAME_DATA_DRIVE}.log"
