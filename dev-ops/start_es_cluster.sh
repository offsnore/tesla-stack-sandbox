ES_JAVA_OPTS="-Xms4g -Xmx4g" /Users/andrew/workspace/elastic-stack/6.5/elasticsearch/bin/elasticsearch -E path.data=/data/elasticsearch/node0 -p /var/run/elasticsearch/pid9200 -E path.logs=/var/log/elasticsearch/node0 -E "node.attr.my_node_type=hot"   -E "node.name=hot-node0" -d
ES_JAVA_OPTS="-Xms2g -Xmx2g" /Users/andrew/workspace/elastic-stack/6.5/elasticsearch/bin/elasticsearch -E path.data=/data/elasticsearch/node1 -p /var/run/elasticsearch/pid9201 -E path.logs=/var/log/elasticsearch/node1 -E "node.attr.my_node_type=warm"   -E "node.name=warm-node1" -d
ES_JAVA_OPTS="-Xms1g -Xmx1g" /Users/andrew/workspace/elastic-stack/6.5/elasticsearch/bin/elasticsearch -E path.data=/data/elasticsearch/node2 -p /var/run/elasticsearch/pid9202 -E path.logs=/var/log/elasticsearch/node2 -E "node.attr.my_node_type=cold"   -E "node.name=cold-node2" -d
ES_JAVA_OPTS="-Xms1g -Xmx1g" /Users/andrew/workspace/elastic-stack/6.5/elasticsearch/bin/elasticsearch -E path.data=/data/elasticsearch/node3 -p /var/run/elasticsearch/pid9203 -E path.logs=/var/log/elasticsearch/node3 -E "node.attr.my_node_type=frozen"   -E "node.name=cold-node3" -d
ES_JAVA_OPTS="-Xms500m -Xmx500m" /Users/andrew/workspace/elastic-stack/6.5/elasticsearch/bin/elasticsearch -E path.data=/data/elasticsearch/node4 -p /var/run/elasticsearch/pid9204 -E path.logs=/var/log/elasticsearch/node4 -E "node.attr.my_node_type=froze"   -E "node.name=froze-node4" -d
ES_JAVA_OPTS="-Xms500m -Xmx500m" /Users/andrew/workspace/elastic-stack/6.5/elasticsearch/bin/elasticsearch -E path.data=/data/elasticsearch/node5 -p /var/run/elasticsearch/pid9205 -E path.logs=/var/log/elasticsearch/node5 -E "node.attr.my_node_type=froze"   -E "node.name=froze-node5" -d
