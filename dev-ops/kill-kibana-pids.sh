#!/bin/bash
KIBANA_DIR=~/workspace/elastic-stack/current/kibana
printf "ls KIBANA_DIR:\n`ls $KIBANA_DIR/*.pid`\n"
for f in ${KIBANA_DIR}/*.pid; do kill `cat $f` && rm $f &&  echo "killed Kibana at pid $f"; done
