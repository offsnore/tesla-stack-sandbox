#!/bin/bash
dir=`pwd`
cd
cd workspace/elastic-stack/current/filebeat
./filebeat -c "${FILEBEAT_CONFIG_DIR}/filebeat-current.yml" >> "${FILEBEAT_LOG_DIR}/filebeat.out" & echo $! > filebeat.pid 
echo "Filebeat started with pid file `cat filebeat.pid`"

#ln -s filebeat-quickpivot.yml filebeat-current.yml
#if [ ! -f  filebeat-current.yml ]; then
#	ln -s filebeat-quickpivot filebeat-current.yml
#fi
cd $dir
