#!/bin/bash
source ~/workspace/tesla-stack/dev-ops/cluster-vars.source
dir=`pwd`
cd
cd workspace/elastic-stack/current/logstash
kill `cat $PIDS_DIR_LOCAL/logstash.pid`
cd $dir


