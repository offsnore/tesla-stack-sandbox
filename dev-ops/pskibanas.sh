#!/bin/bash
cd
cd ~/workspace/elastic-stack/current/kibana/
echo "grepping for kibana.pid, kibana2.pid files.."

#ps -ef | grep cat "`kibana.pid`"
#ps -ef | grep cat "`kibana2.pid`"
KIBANA1=kibana.pid
KIBANA2=kibana2.pid
#./routing_allocation-disable.sh
if [ ! -f $KIBANA1 ]; then
  echo "No pid file found: `pwd`/$KIBANA1"
fi
if [ ! -f $KIBANA2 ]; then
  echo "No pid file found: `pwd`/$KIBANA2"
fi
if [ -f $KIBANA1 ]; then
  ps -ef | grep `cat kibana.pid`
fi
if [ -f $KIBANA2 ]; then
  ps -ef | grep `cat kibana2.pid`
fi
