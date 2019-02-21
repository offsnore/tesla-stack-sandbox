# Double check sourced vars from local dev-ops dir
source ./cluster-vars.source
cd /data/elasticsearch
echo "CLUSTER_NAME_DATA_DRIVE current: $CLUSTER_NAME_DATA_DRIVE"
if [ -z "$CLUSTER_NAME_DATA_DRIVE" ]; then
  read -p "CLUSTER_NAME_DATA_DRIVE env variable not set, enter cluster name to kill:" CLUSTER_NAME_DATA_DRIVE
fi
DATA_DIR_DATA_DRIVE=/data/data_drive/elasticsearch
for f in ${DATA_DIR_DATA_DRIVE}/${CLUSTER_NAME_DATA_DRIVE}/pids/*.pid; do kill `cat $f` && echo "killed Elasticsearch at pid $f"; done
