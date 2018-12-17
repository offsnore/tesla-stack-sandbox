# Ingest JSON files on this server into cluster Elasticsearch endpoint
jobs=5
for ((i=0; i<jobs; i++)); do ./tesla-send-json-files.sh & done
