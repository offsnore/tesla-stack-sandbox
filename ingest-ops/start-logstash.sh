#!/bin/bash
cd
cd ~/workspace/elastic-stack/current/logstash
./bin/logstash -r >> ~/workspace/tesla-stack/logs/logstash/logstash.out & echo $! > logstash.pid 
echo "Logstash started with pid file `cat logstash.pid`"
if [ ! -f ${LOGSTASH_LOG_DIR}/logs/logstash/logstash.out ]; then
	ln -s ../logs/logstash/logstash.out logstash.out
fi



