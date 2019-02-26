#!/bin/bash
source ~/workspace/tesla-stack/dev-ops/cluster-vars.source
# ref:  >> $LOGS_DIR_KIBANA/kibana.log  & echo $! > $PIDS_DIR/kibana.pid

# TODO: Create symlink between tesla-stack logstash-config and elastic-stack/current/logstash/config 

echo PIDS_DIR_LOCAL: $PIDS_DIR_LOCAL
echo LOGS_DIR_LOGSTASH: $LOGS_DIR_LOGSTASH
cd ~/workspace/elastic-stack/current/logstash
if [ ! -d ${LOGSTASH_LOG_DIR} ]; then
  echo "GOT HERE"
  mkdir  $LOGS_DIR_LOGSTASH
  #chown $OS_USER:$OS_GROUP $LOGS_DIR_LOGSTASH
fi
./bin/logstash -r  >> $LOGS_DIR_LOGSTASH/logstash-`date +%Y-%m-%d`.out & echo $! > $PIDS_DIR_LOCAL/logstash.pid
echo "Logstash started with pid file `cat $PIDS_DIR_LOCAL/logstash.pid`"
