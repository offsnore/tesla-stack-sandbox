#!/bin/bash
dir=`pwd`
source ./cluster-vars.source
cd
cd workspace/elastic-stack/current/kibana
echo "Checking for logs dir: $LOGS_DIR"
./bin/kibana  >> ~/workspace/tesla-stack/logs/kibana/kibana.log  & echo $! > kibana.pid
echo $! > kibana.pid
echo "Kibana started with pid `cat kibana.pid`"

cd $dir
