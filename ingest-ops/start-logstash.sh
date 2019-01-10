#!/bin/bash
cd
cd ~/workspace/elastic-stack/current/logstash
./bin/logstash -r  > ~/workspace/tesla-stack/logs/logstash/logstash.out & echo $! > /var/run/logstash/logstash.pid
echo "Logstash started with pid file `cat /var/run/logstash/logstash.pid `"
#if [ ! -f ${LOGSTASH_LOG_DIR}/logstash.out ]; then
#	ln -s "${LOGSTASH_LOG_DIR}/logstash.out" logstash.out
#fi
