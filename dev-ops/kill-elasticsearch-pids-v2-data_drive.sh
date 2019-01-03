cd /data/elasticsearch
CLUSTER_NAME=data-drive.2019-01-02
DATA_DIR=/data/data_drive/elasticsearch
for f in ${DATA_DIR}/${CLUSTER_NAME}/pids/*; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done


