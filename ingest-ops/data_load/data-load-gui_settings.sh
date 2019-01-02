#!/bin/bash
for filename in /data/tesla/gui_settings/gui_settings*.json; do
#    for ((i=0; i <= 20; i++)); do
	curl -X POST http://localhost:9200/tesla-api-gui_settings/_doc/ -d  @"$filename" \
       --header "Content-Type: application/json" >> /dev/null 2>&1
	printf "."
#    done
done
#       --header "Content-Type: application/json" >> /dev/null 2>&1
#       --header "Content-Type: application/json" >> gui_settings.out
