cd /data/elasticsearch
CLUSTER_NAME=cluster.plane-12-29-2018
DATA_DIR=/data/local_drive/elasticsearch
#for f in /data/elasticsearch/cluster.plane-12-29-2018/pids/*; do kill `cat $f` && echo "killed pid $f"; done
#for f in ${DATA_DIR}/${CLUSTER_NAME}/pids/*; do kill `cat $f` && echo "Killed Elasticsearch at pid $f"; done

for f in ${DATA_DIR}/${CLUSTER_NAME}/pids/*.pid; do if [ ! -z $f ]; then cat $f; fi; done  && echo "killed Elasticsearch at pid $f"; done
