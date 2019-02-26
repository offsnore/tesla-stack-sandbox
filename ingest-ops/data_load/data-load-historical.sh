#!/bin/bash
find  /data/tesla-data/historical -name "**/*.json" | while read filename; do
	curl -X POST http://localhost:9200/tesla-charge-state/_doc/ -d  @"$filename" \
       --header "Content-Type: application/json" >> /dev/null 2>&1
	printf "."
done
