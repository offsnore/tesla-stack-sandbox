#!/bin/bash
dir=`pwd`
cd ~/workspace/tesla-stack/dev-ops
source ./cluster-vars.source
echo "Kibana logs dir: $LOGS_DIR_KIBANA"
cd
cd ~/workspace/elastic-stack/current/kibana
echo "Checking for logs dir: $LOGS_DIR_KIBANA"
if [ -z $LOGS_DIR_KIBANA ]; then 
  read -p "Kibana logs directory not sourced. Please enter: " -p LOGS_DIR_KIBANA
fi
if [ ! -f $LOGS_DIR_KIBANA ] ; then
  sudo mkdir $LOGS_DIR_KIBANA
fi
echo "Where am I: `pwd`"
echo "Kibana Log: $LOGS_DIR_KIBANA/kibana.log"
./bin/kibana  >> $LOGS_DIR_KIBANA/kibana.log  & echo $! > kibana.pid
echo $! > kibana.pid
echo "Kibana started with pid `cat kibana.pid`"

cd $dir
