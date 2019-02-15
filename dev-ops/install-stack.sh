#!/bin/bash
# Download and build Elastic Stack
# Uses environment variables galore and symlinks to simplify management and operation of the stack, halfway to demo various techniques useful in managing a stack.
# This is a sandbox environment with the entire stack on one server, and should not be considered production ready.

ES_STACK_VERSION=
#TODO Prompt for ES_STACK_VERSION if not set
<<<<<<< HEAD
if [ !-z $1 ]; then
  ES_STACK_VERSION=$1
fi
if [ -z "$ES_STACK_VERSION" ]; then
  read -p  "Enter stack version (latest from http://elastic.co/downloads)" ES_STACK_VERSION
=======
#ES_STACK_VERSION=
#TODO Prompt for ES_STACK_VERSION if not set
if [ ! -z $1 ]; then
  ES_STACK_VERSION=$1
fi
if [  -z "$ES_STACK_VERSION" ]; then
  read -p "Enter stack version (latest from http://elastic.co/downloads): " ES_STACK_VERSION
>>>>>>> bb872654c7163cf9550691b809884a92a2c8d394
fi
echo "ES Stack version to install: $ES_STACK_VERSION"
OS=$OS
BUILD=$BUILD

#TODO
#TODO Archive version directory if it exists
#TODO Move ./stack-download into the version directory directly
#TODO Optional installs:
cd
cd workspace/elastic-stack/

if [ -d "stack-download-$ES_STACK_VERSION" ]; then
  mv stack-download stack-download-`date '+%Y-%m-%d %H:%M:%S'`
elif [ ! -d "stack-download-$ES_STACK_VERSION" ]; then
  mkdir stack-download-$ES_STACK_VERSION
fi
echo "Initiating download of components into `pwd`/stack-download-$ES_STACK_VERSION.."

./download-stack-components.sh
echo .
sleep 1
echo .
./install-stack-components.sh
sleep 1
./install-stack-symlinks.sh
#cd stack-download-$ES_STACK_VERSION
#for file in *.tar.gz; do tar xvfz $file; done;
#for file in *zip;  do unzip $file; done;
#sleep 1
#echo "Creating symlinks.."
#ln -s elasticsearch-${ES_STACK_VERSION} elasticsearch
#ln -s kibana-$ES_STACK_VERSION-$OS-$BUILD kibana
#ln -s logstash-${ES_STACK_VERSION} logstash
#ln -s filebeat-${ES_STACK_VERSION}-$OS-$BUILD filebeat
#ln -s metricbeat-${ES_STACK_VERSION}-$OS-$BUILD metricbeat
#ln -s packetbeat-${ES_STACK_VERSION}-$OS-$BUILD packetbeat
#ln -s auditbeat-${ES_STACK_VERSION}-$OS-$BUILD auditbeat
#ln -s heartbeat-${ES_STACK_VERSION} heartbeat
#ln -s journalbeat-${ES_STACK_VERSION}-$OS-$BUILD journalbeat

# Other Tools
./download-install-minio.sh
# Minio
#cd
#cd ~/workspace/elastic-stack/
#wget https://dl.minio.io/server/minio/release/$OS-amd64/minio
#chmod +x minio

# Filebeat runtime args TODO: move off /var/run
<<<<<<< HEAD
cd
cd ~/workspace/elastic-stack
=======
#cd 
#cd ~/workspace/elastic-stack
>>>>>>> bb872654c7163cf9550691b809884a92a2c8d394

#if [ ! -d "stack-download" ]; then
#  sudo mkdir /var/run/filebeat
#fi
#sudo chown -Rf andrew:andrew /var/run/filebeat

# Minio
#cd
#cd ~/workspace/tesla-stack/
#wget https://dl.minio.io/server/minio/release/$OS-amd64/minio
#chmod +x minio
# to-run
# ./minio server /data/minio
