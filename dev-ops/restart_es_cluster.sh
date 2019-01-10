./stop_es_cluster.sh
./start_es_cluster.sh
echo "PS stats:"
ps -ef | grep elasticsearch
ps -ef | grep kibana
ps -ef | grep logstash
