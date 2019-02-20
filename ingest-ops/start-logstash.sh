#!/bin/bash
source ~/workspace/tesla-stack/dev-ops/cluster-vars.source

echo PIDS_DIR_LOCAL: $PIDS_DIR_LOCAL

cd ~/workspace/elastic-stack/current/logstash
./bin/logstash -r  > ~/workspace/tesla-stack/logs/logstash/logstash.out & echo $! > $PIDS_DIR_LOCAL/logstash/logstash.pid
echo "Logstash started with pid file `cat $PIDS_DIR/logstash/logstash.pid`"
#if [ ! -f ${LOGSTASH_LOG_DIR}/logstash.out ]; then
#	ln -s "${LOGSTASH_LOG_DIR}/logstash.out" logstash.out
#fi
