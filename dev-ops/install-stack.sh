#!/bin/bash
# Download and build Elastic Stack
# Uses environment variables and symlinks to simplify management and operation of the stack
# This is a sandbox environment with the entire stack on one server, and should not be considered production ready.

#TODO Prompt for ES_STACK_VERSION if not set
ES_STACK_VERSION=${ES_STACK_VERSION}

#TODO
#TODO Archive version directory if it exists
#TODO Move ./stack-download into the version directory directly
#TODO Optional installs:
cd
cd workspace/elastic-stack/

# - minio
mv stack-download stack-download-`date '+%Y-%m-%d %H:%M:%S'`
mkdir stack-download
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
ln -s filebeat-${ES_STACK_VERSION}-darwin-x86_64 filebeat
ln -s metricbeat-${ES_STACK_VERSION}-darwin-x86_64 metricbeat
ln -s packetbeat-${ES_STACK_VERSION}-darwin-x86_64 packetbeat
ln -s auditbeat-${ES_STACK_VERSION}-darwin-x86_64 auditbeat
ln -s heartbeat-${ES_STACK_VERSION} heartbeat
ln -s journalbeat-${ES_STACK_VERSION}-linux-x86_64 journalbeat

# Other Tools

# Minio
cd
cd ~/workspace/elastic-stack/
wget https://dl.minio.io/server/minio/release/darwin-amd64/minio
chmod +x minio


cd ..
sudo mkdir /var/run/filebeat/
sudo chown -Rf andrew:staff /var/run/filebeat

# Minio
cd
cd ~/workspace/tesla-stack/
wget https://dl.minio.io/server/minio/release/darwin-amd64/minio
chmod +x minio
# to-run
# ./minio server /data/minio
