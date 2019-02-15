#!/bin/bash
# Download and build Elastic Stack
# Uses environment variables galore and symlinks to simplify management and operation of the stack, halfway to demo various techniques useful in managing a stack.
# This is a sandbox environment with the entire stack on one server, and should not be considered production ready.

ES_STACK_VERSION=
#TODO Prompt for ES_STACK_VERSION if not set
if [ !-z $1 ]; then
  ES_STACK_VERSION=$1
fi
if [ -z "$ES_STACK_VERSION" ]; then
  read -p  "Enter stack version (latest from http://elastic.co/downloads)" ES_STACK_VERSION
fi
echo ES Stack version to install: $ES_STACK_VERSION
OS=darwin
BUILD=$BUILD

#TODO
#TODO Archive version directory if it exists
#TODO Move ./stack-download into the version directory directly
#TODO Optional installs:
cd
cd workspace/elastic-stack/

if [ -d "stack-download" ]; then
  mv stack-download stack-download-`date '+%Y-%m-%d %H:%M:%S'`
elif [ ! -d "stack-download" ]; then
  mkdir stack-download
fi



cd stack-download
./download-stack-components.sh
echo .
sleep 1
echo .
sleep 1
cd stack-download
for file in *.tar.gz; do tar xvfz $file; done;
for file in *zip;  do unzip $file; done;
sleep 1
ln -s elasticsearch-${ES_STACK_VERSION} elasticsearch
ln -s logstash-${ES_STACK_VERSION} logstash
ln -s filebeat-${ES_STACK_VERSION}-$OS-$BUILD filebeat
ln -s metricbeat-${ES_STACK_VERSION}-$OS-$BUILD metricbeat
ln -s packetbeat-${ES_STACK_VERSION}-$OS-$BUILD packetbeat
ln -s auditbeat-${ES_STACK_VERSION}-$OS-$BUILD auditbeat
ln -s heartbeat-${ES_STACK_VERSION} heartbeat
ln -s journalbeat-${ES_STACK_VERSION}-$OS-$BUILD journalbeat

# Other Tools

# Minio
cd
cd ~/workspace/elastic-stack/
wget https://dl.minio.io/server/minio/release/$OS-amd64/minio
chmod +x minio

# Filebeat runtime args TODO: move off /var/run
cd
cd ~/workspace/elastic-stack

#if [ ! -d "stack-download" ]; then
#  sudo mkdir /var/run/filebeat
#fi
sudo chown -Rf andrew:staff /var/run/filebeat

# Minio
cd
cd ~/workspace/tesla-stack/
wget https://dl.minio.io/server/minio/release/$OS-amd64/minio
chmod +x minio
# to-run
# ./minio server /data/minio
