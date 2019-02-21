dir=`pwd`
cd
CLUSTER_NAME=cluster.plane-12-29-2018
#DATA_DRIVE=/data/data_drive/elasticsearch/${CLUSTER_NAME}
DATA_DRIVE=/data/elasticsearch/${CLUSTER_NAME}

mkdir $DATA_DRIVE
mkdir $DATA_DRIVE/pid
LOGS_DIR=${DATA_DRIVE}/logs
mkdir LOGS_DIR
cd workspace/elastic-stack/current/elasticsearch
PATH_CONFIGS=${DATA_DRIVE}/configs
mkdir $PATH_CONFIGS
PIDS_DIR=${DATA_DRIVE}/${CLUSTER_NAME}/pids
mkdir $PIDS_DIR
# NODE 1
NODE_NAME=node0
NODE_PORT=9200
ES_JAVA_OPTS="-Xms4g -Xmx4g" ./bin/elasticsearch -E path.config=${CONFIGS_DIR/${NODE_NAME} -E path.data=${DATA_DRIVE}/${NODE_NAME} -p ${PIDS_DIR}/${NODE_PORT}.pid -E path.logs=${LOGS_DIR}/$[NODE_NAME] -E "node.attr.my_node_type=hot"   -E "node.name=node-0-hot" -E "node.master=false" -E "cluster.name=${CLUSTER_NAME}" -d

# NODE 2
NODE_NAME=node1
NODE_PORT=9201
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.config=${CONFIGS_DIR}/${NODE_NAME} -E path.data=${DATA_DRIVE}/${NODE_NAME} -p ${PIDS_DIR}/${NODE_PORT}.pid -E path.logs=${LOGS_DIR}/${NODE_NAME} -E "node.attr.my_node_type=warm"   -E "node.name=node-1-warm" -E "node.master=false"  -E "cluster.name=${CLUSTER_NAME}" -d

# NODE 3
NODE_NAME=node2
NODE_PORT=9202
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.config=${CONFIGS_DIR}/node2}-E path.data=${DATA_DRIVE}/node2 -p ${PIDS_DIR}/${NODE_PORT} -E path.logs=${LOGS_DIR}/${NODE_NAME} -E "node.attr.my_node_type=cool"   -E "node.name=node-2-cool" -E "node.master=true" -E "cluster.name=${CLUSTER_NAME}" -d

# NODE 4
#ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.config=${CONFIGS_DIR}/node3} -E path.data=${DATA_DRIVE}/node3 -p ${DATA_DRIVE}/pid/9203 -E path.logs=${LOGS_DIR}/node3 -E "node.attr.my_node_type=warm"   -E "node.name=node-3-cool" -E "node.master=true"  -E "cluster.name=${CLUSTER_NAME}" -d

# NODE 5
#ES_JAVA_OPTS="-Xms1g -Xmx1g" ./bin/elasticsearch-E path.config=${CONFIGS_DIR}/node4}  -E path.data=${DATA_DRIVE}/node4 -p ${DATA_DRIVE}/pid/9204 -E path.logs=${LOGS_DIR}/node4 -E "node.attr.my_node_type=cool"   -E "node.name=node-4-cool" -E "node.master=true"  -E "cluster.name=${CLUSTER_NAME}" -d

# NODE 6
#ES_JAVA_OPTS="-Xms500m -Xmx500m" ./bin/elasticsearch -E path.config=${CONFIGS_DIR}/node5} -E path.data=${DATA_DRIVE}/node5 -p ${DATA_DRIVE}/pid/9205 -E path.logs=${LOGS_DIR}/node6 -E "node.attr.my_node_type=froze"   -E "node.name=node-5-froze" -E "node.master=true"  -E "cluster.name=data-drive-cluster" -d
