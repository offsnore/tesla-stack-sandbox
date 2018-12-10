dir=`pwd`
cd
cd workspace/elastic-stack/current/elasticsearch
ES_JAVA_OPTS="-Xms4g -Xmx4g" ./bin/elasticsearch -E path.data=/data/elasticsearch/node0 -p /var/run/elasticsearch/pid9200 -E path.logs=/var/log/elasticsearch/node0 -E "node.attr.my_node_type=hot"   -E "node.name=node-0-hot" -E "node.master=false" -d
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.data=/data/elasticsearch/node1 -p /var/run/elasticsearch/pid9201 -E path.logs=/var/log/elasticsearch/node1 -E "node.attr.my_node_type=hot"   -E "node.name=node-1-hot" -E "node.master=false" -d
ES_JAVA_OPTS="-Xms2g -Xmx2g" ./bin/elasticsearch -E path.data=/data/elasticsearch/node2 -p /var/run/elasticsearch/pid9202 -E path.logs=/var/log/elasticsearch/node2 -E "node.attr.my_node_type=warm"   -E "node.name=node-2-warm" -E "node.master=true" -d
ES_JAVA_OPTS="-Xms1g -Xmx1g" ./bin/elasticsearch -E path.data=/data/elasticsearch/node3 -p /var/run/elasticsearch/pid9203 -E path.logs=/var/log/elasticsearch/node3 -E "node.attr.my_node_type=cool"   -E "node.name=node-3-cool" -E "node.master=true" -d
ES_JAVA_OPTS="-Xms500m -Xmx500m" ./bin/elasticsearch -E path.data=/data/elasticsearch/node4 -p /var/run/elasticsearch/pid9204 -E path.logs=/var/log/elasticsearch/node4 -E "node.attr.my_node_type=cool"   -E "node.name=node-4-cool" -E "node.master=true" -d
ES_JAVA_OPTS="-Xms500m -Xmx500m" ./bin/elasticsearch -E path.data=/data/elasticsearch/node5 -p /var/run/elasticsearch/pid9205 -E path.logs=/var/log/elasticsearch/node5 -E "node.attr.my_node_type=cool"   -E "node.name=node-5-froze" -E "node.master=true" -d


