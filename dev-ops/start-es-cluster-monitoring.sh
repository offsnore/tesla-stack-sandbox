#!/bin/bash
# Start script for cluster running on internal LOCAL drive
source cluster-vars.source
dir=`pwd`

STACK_DIR=~/workspace/elastic-stack/current
PROJECT_STACK=~/workspace/tesla-stack
#ES_HOME=$STACK_DIR/elasticsearch

ES_PORT_MONITORING=9211

echo "STACK_DIR: $STACK_DIR"
echo "PROJECT_STACK: $PROJECT_STACK"

cd $PROJECT_STACK/dev-ops
source cluster-vars.source
echo "ES_HOME sourced: $ES_HOME < should be there"

echo "Does this exist? CLUSTER_NAME_MONITORING:  ${CLUSTER_NAME_MONITORING}" 
if [  -z "$CLUSTER_NAME_MONITORING" ]; then
  read -p "CLUSTER_NAME_MONITORING not set, please enter(last default - local_drive.2019-01-09):  " CLUSTER_NAME_MONITORING
fi

#DATA_DRIVE=/data/data_drive
CLUSTER_DIR_MONITORING=/data/local_drive/elasticsearch/$CLUSTER_NAME_MONITORING

DATA_DIR=$CLUSTER_DIR_MONITORING/data
PATH_CONFIG=$CLUSTER_DIR_MONITORING/configs
PIDS_DIR=$CLUSTER_DIR_MONITORING/pids
LOGS_DIR=$CLUSTER_DIR_MONITORING/logs
LOGS_DIR_KIBANA=$LOGS_DIR/kibana


DEFAULT_CONFIGS_PATH_ES=${PROJECT_STACK}/elasticsearch-configs/elasticsearch-monitoring
MONITORING_NODE_TYPE=config.monitoring
NODE_HEAP_GB=1
echo "CLUSTER_DIR_MONITORING env var: $CLUSTER_DIR_MONITORING"

echo "Checking that directory path exists: $DATA_DIR"
# Set up $DATA_DIR paths
# Need root privs to create data, config, log paths
if [ ! -z $DATA_DIR ]; then
  sudo mkdir -p $DATA_DIR
  echo "Created data directory: $DATA_DIR"
fi 

cd $CLUSTER_DIR_MONITORING
# Create Logs Directory
if [ ! -z $LOGS_DIR ]; then
# Need root privs to create data, config, log paths
  sudo mkdir -p $LOGS_DIR
  echo "Created logs directory: $LOGS_DIR"
fi


# Create Process ID directory
if [ ! -z $PIDS_DIR_MONITORING ]; then
# Need root privs to create data, config, log paths for monitoring cluster data directories
  sudo mkdir -p $PIDS_DIR_MONITORING
  echo "Created pids directory: $PIDS_DIR_MONITORING"
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

if [ ! -z $PATH_CONFIG ]; then
# Need root privs to create data, config, log paths
  sudo mkdir -p $PATH_CONFIG
  echo "Created configs path directory: $PATH_CONFIG"
fi


# --- Start Elasticsearch Processes ---
if [  -z ES_HOME ]; then 
  read -p "ES_HOME not set (e.g. ~/workspace/elastic-stack/current/elasticsearch), please enter (check env vars)" ES_HOME
  cd $ES_HOME
fi

# Single Monitoring Node 
NODE_NAME=monitoring-node-0
NODE_HEAP_GB=1
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  sudo mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
# Create node config directories, if they don't exist
if [ ! -z $PATH_CONFIGS/$NODE_NAME  ]; then
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME/certs
  echo "Created node config directory: $PATH_CONFIGS/$NODE_NAME"
  echo "Copying monitoring configs from: $DEFAULT_CONFIGS_PATH/$MONITORING_NODE_TYPE"
  if [ ! -f $PATH_CONFIGS/$NODE_NAME/elasticsearch.yml ]; then 
    sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$MONITORING_NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME/
  fi
fi


# IMPORTANT - chown node directories to non-root user
echo "IMPORTANT: chowning recursively all cluster config, data directories created before starting up cluster.."
sudo chown -R $OS_USER:$OS_GROUP ${PATH_CONFIGS}
sudo chown -R $OS_USER:$OS_GROUP ${DATA_DIR}
sudo chown -R $OS_USER:$OS_GROUP ${LOGS_DIR}
sudo chown -R $OS_USER:$OS_GROUP ${PIDS_DIR}


cd $ES_HOME
echo "Starting Elasticsearch from this directory: `pwd`"
echo "Starting Elasticsearch node ${NODE_NAME} in cluster ${CLUSTER_NAME_MONITORING}"
ES_JAVA_OPTS="-Xms1g -Xmx1g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -p ${PIDS_DIR_MONITORING}/${NODE_NAME}.pid -E path.data=${DATA_DIR}/${NODE_NAME}  -E path.logs=${LOGS_DIR}/$NODE_NAME  -E "cluster.name=${CLUSTER_NAME_MONITORING}" -E node.name=${NODE_NAME}  -d
echo "Started Elasticsearch $NODE_NAME"
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Pid file is at $PIDS_DIR_MONITORING/$NODE_NAME.pid: `cat $PIDS_DIR_MONITORING/$NODE_NAME.pid`"
echo "Configs created are at $PATH_CONFIG/$NODE_NAME"

