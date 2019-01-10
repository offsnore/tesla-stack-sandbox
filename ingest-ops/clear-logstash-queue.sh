cd ~/workspace/tesla-stack/ingest-ops
./stop-logstash.sh
sleep 1
./stop-logstash.sh
sleep 1
./stop-logstash.sh
echo "Sent Logstash terminate signal, waiting 10 seconds before deleting the persistent queue"
sleep 10
echo "Delete Logstash queue, current size:"
./check-logstash-queue-size.sh
cd ~/workspace/elastic-stack/current/logstash

rm -rf data/*
#rm ${LOGSTASH_DIR}/data/test.foo
cd ~/workspace/tesla-stack/ingest-ops
echo "Checking cleared queue size:"
./check-logstash-queue-size.sh

