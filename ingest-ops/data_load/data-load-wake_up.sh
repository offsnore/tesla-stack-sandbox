#!/bin/bash
find  /data/tesla-data/wake_up -name "wake_up*.json" | while read filename; do
   curl -X POST http://localhost:9200/tesla-api-wake-up/_doc/ -d  @"$filename" \
    --header "Content-Type: application/json" >> /dev/null 2>&1
    printf "."
done
