# kill `cat /data/elasticsearch/cluster.plane-12-29-2018/pids/9200.pid`
source cluster-vars.source
CLUSTER_NAME=cluster.plane-12-29-2018
CLUSTER_DIR=/data/elasticsearch/${CLUSTER_NAME}
DATA_DIR=/data/elasticsearch/${CLUSTER_NAME}/data
PATH_CONFIGS=${CLUSTER_DIR}/configs
PIDS_DIR=${CLUSTER_DIR}/pids
LOGS_DIR=${CLUSTER_DIR}/logs

KILL_PATH="${PIDS_DIR}/node*.pid"
echo "Killing pids at path: $KILL_PATH"
#kill `cat /data/elasticsearch/cluster.plane-12-29-2018/pids/920*`
#kill `cat $KILLPATH`

#for ((i=0; i<=2; i++)); do echo "Kill node$i pid(`cat cat /data/elasticsearch/cluster.plane-12-29-2018/pids/node$i.pid` ).." && kill  `cat /data/elasticsearch/cluster.plane-12-29-2018/pids/node$i.pid`; done



for ((i=0; i<=2; i++)); do kill  `cat /data/elasticsearch/cluster.plane-12-29-2018/pids/node$i.pid`; done
