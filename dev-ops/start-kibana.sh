#!/bin/bash
dir=`pwd`
cd ~/workspace/tesla-stack/dev-ops
source ./cluster-vars.source
echo "Kibana logs dir: $LOGS_DIR_KIBANA"
cd
cd ~/workspace/elastic-stack/current/kibana
echo "Checking for logs dir: $LOGS_DIR_KIBANA"
if [  -z $LOGS_DIR_KIBANA ]; then 
  read -p "Kibana logs directory not sourced. Please enter: " -p LOGS_DIR_KIBANA
fi
if [ ! -f $LOGS_DIR_KIBANA ] ; then
  mkdir -p $LOGS_DIR_KIBANA
fi
echo "Checking for pids dir: $PIDS_DIR"
if [ ! -f $PIDS_DIR ] ; then
  mkdir -p $PIDS_DIR
fi


echo "Where am I: `pwd`"
echo "Kibana Log: $LOGS_DIR_KIBANA/kibana.log"
./bin/kibana  >> $LOGS_DIR_KIBANA/kibana.log  & echo $! > $PIDS_DIR/kibana.pid
echo $! > $PIDS_DIR/kibana.pid
echo "Kibana started with pid `cat $PIDS_DIR/kibana.pid`"

cd $dir
