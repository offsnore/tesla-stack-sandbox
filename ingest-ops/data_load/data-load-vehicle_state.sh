#!/bin/bash

find  /data/tesla-data/vehicle_state -name "vehicle_state*.json" | while read filename; do
  curl -X POST http://localhost:9200/tesla-vehicle-state/_doc/ -d  @"$filename" \
    --header "Content-Type: application/json" >> /dev/null 2>&1
  printf "."
done
