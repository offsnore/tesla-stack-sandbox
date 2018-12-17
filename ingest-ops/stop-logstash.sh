#!/bin/bash
dir=`pwd`
cd
cd workspace/elastic-stack/current/logstash
kill `cat /var/run/logstash/logstash.pid`
cd $dir


