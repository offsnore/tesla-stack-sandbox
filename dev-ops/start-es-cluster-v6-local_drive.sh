dir=`pwd`
cd

STACK_DIR=~/workspace/elastic-stack/current
ES_HOME=$STACK_DIR/elasticsearch
CLUSTER_NAME=local_data.2019-01-07
if [ -z $ENV_CLUSTER_NAME ] ; then
  echo "Setting cluster.name with env vare: $ENV_CLUSTER_NAME"
  CLUSTER_NAME=$ENV_CLUSTER_NAME
fi
DATA_DRIVE=/data/local_drive
CLUSTER_DIR=$DATA_DRIVE/elasticsearch/$CLUSTER_NAME

DATA_DIR=$CLUSTER_DIR/data
PATH_CONFIGS=$CLUSTER_DIR/configs
PIDS_DIR=$CLUSTER_DIR/pids
LOGS_DIR=$CLUSTER_DIR/logs
PROJECT_STACK=~/workspace/tesla-stack
DEFAULT_CONFIGS_PATH_ES=${PROJECT_STACK}/default-configs/elasticsearch
DEFAULT_NODE_TYPE=default.config
NUM_HOT_NODES=1
NUM_WARM_NODES=1
NUM_COOL_NODES=1

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
  echo "TODO: Copy defaults"
fi

# --- Start Elasticsearch Processes ---
if [ -z ES_HOME ]; then 
  cd $ES_HOME
else cd ~/workspace/elastic-stack/current/elasticsearch
fi

# NODE 1
NODE_NAME=node-d0
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  sudo mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
# Create node config directories, if they don't exist
if [ ! -z $PATH_CONFIGS/$NODE_NAME  ]; then
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node config directory: $PATH_CONFIGS/$NODE_NAME"
  echo "Copying default configs from: $EFAULT_CONFIGS_PATH_ES/$DEFAULT_NODE_TYPE"
  sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$DEFAULT_NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME
fi

ES_JAVA_OPTS="-Xms4g -Xmx4g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.data=${DATA_DIR}/${NODE_NAME}  -E path.logs=${LOGS_DIR}  -E "cluster.name=${CLUSTER_NAME}" -E "node.name"=${NODE_NAME}  -d
echo "Started Elasticsearch $NODE_NAME"
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Configs created are ate $PATHS_CONFIG/$NODE_NAME"

# NODE 2

NODE_NAME=node-d1
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
fi
# Create node config directories, if they don't exist
if [ ! -z $PATH_CONFIGS/$NODE_NAME  ]; then
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node config directory: $PATH_CONFIGS/$NODE_NAME"
  echo "Copying default configs from: $EFAULT_CONFIGS_PATH_ES/$DEFAULT_NODE_TYPE"
  sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$DEFAULT_NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME
fi
if [ -z ES_HOME ]; then 
  cd $ES_HOME
else cd ~/workspace/elastic-stack/current/elasticsearch
fi

ES_JAVA_OPTS="-Xms2g -Xmx2g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -E path.data=${DATA_DIR}/${NODE_NAME}  -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.logs=${LOGS_DIR} -E cluster.name=${CLUSTER_NAME}  -E "node.name"=${NODE_NAME} -d
echo "Started Elasticsearch $NODE_NAME"
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Configs created are ate $PATHS_CONFIG/$NODE_NAME"

# NODE 3

NODE_NAME=node-d2
if [ ! -z $DATA_DIR/$NODE_NAME ]; then
  mkdir -p $DATA_DIR/$NODE_NAME
  echo "Created node data directory: $DATA_DIR/$NODE_NAME"
  echo "Copying default configs from: $EFAULT_CONFIGS_PATH_ES/$DEFAULT_NODE_TYPE"
  sudo cp -rf $DEFAULT_CONFIGS_PATH_ES/$DEFAULT_NODE_TYPE/* $PATH_CONFIGS/$NODE_NAME
fi
# Create node config directories, if they don't exist
if [ ! -z $PATH_CONFIGS/$NODE_NAME  ]; then
  sudo mkdir -p $PATH_CONFIGS/$NODE_NAME
  echo "Created node config directory: $PATH_CONFIGS/$NODE_NAME"
fi
if [ -z ES_HOME ]; then 
  cd $ES_HOME
else cd ~/workspace/elastic-stack/current/elasticsearch
fi
echo "HERE `pwd`"
ES_JAVA_OPTS="-Xms2g -Xmx2g" ES_PATH_CONF="${PATH_CONFIGS}/${NODE_NAME}" ./bin/elasticsearch -p ${PIDS_DIR}/${NODE_NAME}.pid -E path.data=${DATA_DIR}/${NODE_NAME}  -E path.logs=${LOGS_DIR} -E node.name=${NODE_NAME} -E "cluster.name=${CLUSTER_NAME}" -d
echo "Started Elasticsearch $NODE_NAME" 
echo "Logs are at $LOGS_DIR"
echo "Data is at $DATA_DIR"
echo "Configs created are ate $PATHS_CONFIG/$NODE_NAME"
