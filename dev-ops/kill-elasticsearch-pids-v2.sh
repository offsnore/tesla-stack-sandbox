cd /data/elasticsearch
CLUSTER_NAME=cluster.plane-12-29-2018
DATA_DIR=/data/elasticsearch
#for f in /data/elasticsearch/cluster.plane-12-29-2018/pids/*; do kill `cat $f` && echo "killed pid $f"; done
for f in ${DATA_DIR}/${CLUSTER_NAME}/pids/*; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done


