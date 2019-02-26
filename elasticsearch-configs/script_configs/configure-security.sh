cd ~/workspace/tesla-stack/elasticsearch-configs/script_configs
./init_source.sh

#source ~/workspace/tesla-stack/env-vars/cluster-vars.source
echo "Running cat command on config-security.yml to put Security config into place"
echo "Run cat configure-security.yml | tee -a $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml"
echo "But first - Check that configs exist.."
ls -al  $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml
ls -al  $CLUSTER_DIR_DATA_DRIVE/configs/node-*/elasticsearch.yml

#echo "xpack.security.enabled: true" | tee -a $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml
#echo "xpack.security.enabled: true" | tee -a $CLUSTER_DIR_DATA_DRIVE/configs/node-*/elasticsearch.yml
./check-configs.sh
