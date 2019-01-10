#!/bin/bash
dir=`pwd`
cd
cd ~/workspace/elastic-stack/current/logstash
./bin/logstash -t 
cd $dir
