dir=`pwd`
cd
#DATA_DRIVE=/data/data_drive/elasticsearch/cluster20181218
DATA_DRIVE=/data/data_drive/elasticsearch/cluster20181227
LOGS_DIR=/data/data_drive/elasticsearch/logs
cd workspace/elastic-stack/current/elasticsearch
ES_JAVA_OPTS="-Xms4g -Xmx4g" ./bin/elasticsearch -E path.data=${DATA_DRIVE}/node0 -p /data/data_drive/pid/9210 -E path.logs=${LOGS_DIR}/node0 -E "node.attr.my_node_type=hot"   -E "node.name=node-0-hot" -E "node.master=false" -E "cluster.name=data-drive-cluster" -d
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.data=${DATA_DRIVE}node1 -p /data/data_drive/pid/9211 -E path.logs=/var/log/elasticsearch/data_drive-node1 -E "node.attr.my_node_type=warm"   -E "node.name=node-1-warm" -E "node.master=false"  -E "cluster.name=data-drive-cluster" -d
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.data=${DATA_DRIVE}node2 -p /data/data_drive/pid/9212 -E path.logs=/var/log/elasticsearch/data_drive-node2 -E "node.attr.my_node_type=cool"   -E "node.name=node-2-cool" -E "node.master=true" -E "cluster.name=data-drive-cluster" -d
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.data=${DATA_DRIVE}node3 -p /data/data_drive/pid/9213 -E path.logs=/var/log/elasticsearch/data_drive-node3 -E "node.attr.my_node_type=warm"   -E "node.name=node-3-cool" -E "node.master=true"  -E "cluster.name=data-drive-cluster" -d
ES_JAVA_OPTS="-Xms1g -Xmx1g" ./bin/elasticsearch -E path.data=${DATA_DRIVE}node4 -p /data/data_drive/pid/9214 -E path.logs=/var/log/elasticsearch/data_drive-node4 -E "node.attr.my_node_type=cool"   -E "node.name=node-4-cool" -E "node.master=true"  -E "cluster.name=data-drive-cluster" -d
ES_JAVA_OPTS="-Xms500m -Xmx500m" ./bin/elasticsearch -E path.data=${DATA_DRIVE}node5 -p /data/data_drive/pid/9215 -E path.logs=/var/log/elasticsearch/data_drive-node5 -E "node.attr.my_node_type=froze"   -E "node.name=node-5-froze" -E "node.master=true"  -E "cluster.name=data-drive-cluster" -d
