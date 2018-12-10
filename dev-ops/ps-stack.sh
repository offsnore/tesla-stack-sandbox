#!/bin/bash

echo "Checking for running instaces of stack (`ps -ef | grep {STACK_COMPONENT}`)"
echo Checking on Elasticsearch instances: 
ps -ef | grep elasticsearch
echo Checking on kibana:  
ps -ef | grep kibana
echo Checking on Logstash instances:  
ps -ef | grep logstash
echo Checking on Filebeat instances:
ps -ef | grep Filebeat
