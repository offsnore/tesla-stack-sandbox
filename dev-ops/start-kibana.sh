#!/bin/bash
dir=`pwd`
/Users/andrew/workspace/elastic-stack/current/kibana/bin/kibana>> ~/workspace/tesla-stack/logs/kibana/kibana.out &

cd
cd workspace/elastic-stack/current/kibana
./bin/kibana  >> ~/workspace/tesla-stack/logs/kibana/kibana.out & echo $! > /var/run/kibana/kibana.pid
echo "Kibana started with pid file `cat /var/run/kibana/kibana.pid`"

cd $dir
