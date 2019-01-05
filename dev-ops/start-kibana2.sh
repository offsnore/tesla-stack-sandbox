#!/bin/bash
dir=`pwd`

cd
cd workspace/elastic-stack/current/kibana
./bin/kibana -p 5602 -e "http://localhost:9205" >> ~/workspace/tesla-stack/logs/kibana/kibana2.log  & echo $! > kibana2.pid
echo $! > kibana.pid
echo "Kibana started with pid `cat kibana2.pid`"

cd $dir
