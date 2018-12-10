#!/bin/bash
for filename in /data/tesla/wake_up/wake_up*.json; do
#    for ((i=0; i <= 20; i++)); do
	curl -X POST http://localhost:9200/tesla-api-wake-up/_doc/ -d  @"$filename" \
       --header "Content-Type: application/json" >> /dev/null 2>&1
	printf "."
#    done
done
