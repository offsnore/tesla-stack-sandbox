cd /data/elasticsearch
DATA_DIR=/data/local_drive/elasticsearch
echo cluster name: $ENV_CLUSTER_NAME
for f in ${DATA_DIR}/${ENV_CLUSTER_NAME}/pids/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done

