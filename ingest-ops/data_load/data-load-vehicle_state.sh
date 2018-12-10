#!/bin/bash
for filename in /data/tesla/vehicle_state/vehicle_state*.json; do
    for ((i=0; i <= 20; i++)); do
	curl -X POST http://localhost:9200/tesla-api-vehicle-state/_doc/ -d  @"$filename" \
       --header "Content-Type: application/json" >> /dev/null 2>&1
	printf "."
    done
done
