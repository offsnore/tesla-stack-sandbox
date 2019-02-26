#!/bin/bash
find  /data/tesla-data/gui_settings -name "gui_settings*.json" | while read filename; do
   curl -X POST http://localhost:9200/tesla-gui_settings/_doc/ -d  @"$filename" \
    --header "Content-Type: application/json" >> /dev/null 2>&1
   printf "."
done
