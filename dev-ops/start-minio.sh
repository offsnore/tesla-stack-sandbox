#!/bin/bash
dir=`pwd`
cd
cd workspace/elastic-stack/current/minio
minio server "${MINIO_DATA_DIR}"  >> ~/workspace/elastic-stack/logs/minio/minio.out & echo $! > /var/run/minio/minio.pid
echo "Minio started with pid file `cat /var/run/minio/minio.pid`"
cd $dir
