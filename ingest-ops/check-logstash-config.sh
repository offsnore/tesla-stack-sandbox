#!/bin/bash
source ~/workspace/tesla-stack/dev-ops/cluster-vars.source

echo PIDS_DIR_LOCAL: $PIDS_DIR_LOCAL

cd ~/workspace/elastic-stack/current/logstash
./bin/logstash -t 

#if [ ! -f ${LOGSTASH_LOG_DIR}/logstash.out ]; then
#	ln -s "${LOGSTASH_LOG_DIR}/logstash.out" logstash.out
#fi
