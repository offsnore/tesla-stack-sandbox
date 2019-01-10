#!/bin/bash
dir=`pwd`
#/Users/andrew/workspace/elastic-stack/current/kibana/bin/kibana>> ~/workspace/tesla-stack/logs/kibana/kibana.out &

cd
cd workspace/elastic-stack/current/kibana
./bin/kibana  >> ~/workspace/tesla-stack/logs/kibana/kibana.log  & echo $! > kibana.pid
echo $! > kibana.pid
echo "Kibana started with pid `cat kibana.pid`"

cd $dir
