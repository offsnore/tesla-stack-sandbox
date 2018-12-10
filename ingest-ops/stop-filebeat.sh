#!/bin/bash
dir=`pwd`
cd
cd workspace/elastic-stack/current/filebeat
kill `cat filebeat.pid`
rm filebeat.pid
cd $dir


