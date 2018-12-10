# Ingest JSON files on this server into cluster Elasticsearch endpoint
for ((i=0; i<40; i++)); do ./tesla-send-json-files.sh & done
