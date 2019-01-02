
CLUSTER_NAME=cluster.plane-12-29-2018
DATA_DIR=/data/elasticsearch/$CLUSTER_NAME
PIDS_DIR=$DATA_DIR/pids
PIDS="$PIDS_DIR/920*"
echo "pid files: `ls $PIDS_DIR`"
dir=/data/elasticsearch/$CLUSTER_NAME
echo "Killing Elasticsearch instances running at pid `ls $PIDS_DIR/920*`"
#echo "$ PIDS: $PIDS"
kill `cat $PIDS`
kill `cat $PIDS_DIR/9200` 
kill `cat $PIDS_DIR/9201` 
kill `cat $PIDS_DIR/9202` 
