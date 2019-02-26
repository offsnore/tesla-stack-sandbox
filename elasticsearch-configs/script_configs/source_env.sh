cd ~/workspace/tesla-stack/elasticsearch-configs/script_configs
source ~/workspace/tesla-stack/env-vars/cluster-vars.source
echo "Running configuration update.."
#echo "cat configure-ccr.yml | tee -a $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml"
echo "Check that configs exist.."
ls -al  $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml
ls -al  $CLUSTER_DIR_DATA_DRIVE/configs/node-*/elasticsearch.yml
