#!/bin/bash
dir=`pwd`
cd
cd workspace/elastic-stack/current/logstash
kill `cat logstash.pid`
rm logstash.pid
cd $dir


