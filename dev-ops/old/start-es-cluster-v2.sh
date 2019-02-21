dir=`pwd`
cd
CLUSTER_NAME=cluster20181218
#DATA_DRIVE=/data/data_drive/elasticsearch/${CLUSTER_NAME}
DATA_DRIVE=/data/elasticsearch/${CLUSTER_NAME}
mkdir $DATA_DRIVE
LOGS_DIR=${DATA_DRIVE}/elasticsearch/logs
cd workspace/elastic-stack/current/elasticsearch
ES_JAVA_OPTS="-Xms4g -Xmx4g" ./bin/elasticsearch -E path.config=${CONFIGS_DIR/node0} -E path.data=${DATA_DRIVE}/node0 -p ${DATA_DRIVE}/pid/9200 -E path.logs=${LOGS_DIR}/node0 -E "node.attr.my_node_type=hot"   -E "node.name=node-0-hot" -E "node.master=false" -E "cluster.name=${CLUSTER_NAME}" -d
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.config=${CONFIGS_DIR/node1} -E path.data=${DATA_DRIVE}/node1 -p ${DATA_DRIVE}/pid/9201 -E path.logs=${LOGS_DIR}/node1 -E "node.attr.my_node_type=warm"   -E "node.name=node-1-warm" -E "node.master=false"  -E "cluster.name=${CLUSTER_NAME}" -d
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.config=${CONFIGS_DIR/node3} -E path.data=${DATA_DRIVE}/node2 -p ${DATA_DRIVE}/pid/9202 -E path.logs=${LOGS_DIR}/node2 -E "node.attr.my_node_type=cool"   -E "node.name=node-2-cool" -E "node.master=true" -E "cluster.name=${CLUSTER_NAME}" -d
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.config=${CONFIGS_DIR/node4} -E path.data=${DATA_DRIVE}/node3 -p ${DATA_DRIVE}/pid/9203 -E path.logs=${LOGS_DIR}/node3 -E "node.attr.my_node_type=warm"   -E "node.name=node-3-cool" -E "node.master=true"  -E "cluster.name=${CLUSTER_NAME}" -d
ES_JAVA_OPTS="-Xms1g -Xmx1g" ./bin/elasticsearch -E path.config=${CONFIGS_DIR/node5} -E path.data=${DATA_DRIVE}/node4 -p ${DATA_DRIVE}/pid/9204 -E path.logs=${LOGS_DIR}/node4 -E "node.attr.my_node_type=cool"   -E "node.name=node-4-cool" -E "node.master=true"  -E "cluster.name=${CLUSTER_NAME}" -d
ES_JAVA_OPTS="-Xms500m -Xmx500m" ./bin/elasticsearch -E path.data=${DATA_DRIVE}/node5 -p ${DATA_DRIVE}/pid/9205 -E path.logs=${LOGS_DIR}/node5 -E "node.attr.my_node_type=froze"   -E "node.name=node-5-froze" -E "node.master=true"  -E "cluster.name=data-drive-cluster" -d
