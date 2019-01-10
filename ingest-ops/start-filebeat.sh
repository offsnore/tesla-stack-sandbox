#!/bin/bash
dir=`pwd`
cd
cd workspace/elastic-stack/current/filebeat
./filebeat -c "${FILEBEAT_CONFIG_DIR}/filebeat-current.yml" >> "${FILEBEAT_LOG_DIR}/filebeat.out" & echo $! > /var/run/filebeat/filebeat.pid 
echo "Filebeat started with pid file `cat /var/run/filebeat/filebeat.pid`"

cd $dir
