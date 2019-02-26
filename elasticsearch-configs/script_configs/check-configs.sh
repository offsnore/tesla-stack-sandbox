source ~/workspace/tesla-stack/env-vars/cluster-vars.source
cd ~/workspace/tesla-stack/elasticsearch-configs/script_configs
lines=10
tail -n$lines $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml
tail -n$lines $CLUSTER_DIR_DATA_DRIVE/configs/node-*/elasticsearch.yml
