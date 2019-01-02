#!/bin/bash
for filename in /data/tesla/*/*.json; do
    for ((i=0; i <= 20; i++)); do
	curl -X POST http://localhost:9200/tesla-api-data/_doc/ -d  @"$filename" \
       --header "Content-Type: application/json" >> /dev/null 2>&1
	printf "."
    done
done


curl -XGET "http://1e4a8ce8a63047a3bb4be0601ec0c0fe.containerhost:9244/_search" -H 'Content-Type: application/json' -d'
{
  "query": {
    "match_all": {}
  }
}'

curl -XGET "https://4879a9d7ab51435995831380eaf74a34.us-central1.gcp.cloud.es.io:9243/" -H 'Content-Type: application/json' -u 'elastic:xob4freEIOFSAsp3tRY2HWaH'  -d'
{
  "foo" : "bar"
}'


curl -XGET "https://4879a9d7ab51435995831380eaf74a34.us-central1.gcp.cloud.es.io:9243/" -u 'elastic:LycHhr1Sn8aG555LBIrrob7B'

# curl -X POST https://4879a9d7ab51435995831380eaf74a34.us-central1.gcp.cloud.es.io:9243/tesla-api-data/_doc/ -d  @"$filename" \

#       -u '$ELASTIC_AUTH' \
