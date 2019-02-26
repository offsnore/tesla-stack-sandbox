#/Users/andrew/workspace/tesla-stack/elasticsearch-configs/script_configs
# TODO: check for fields existing before `tee` duplicates configuration settings
# README: One time configuration of CCR with `tee` command. 
cd ~/workspace/tesla-stack/elasticsearch-configs/script_configs
source ~/workspace/tesla-stack/env-vars/cluster-vars.source
./source_env.sh

echo "Running cat command on config-ccr.yml to put CCR config into place" 
echo "cat configure-ccr.yml | tee -a $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml"
echo "Check that configs exist.."
ls -al  $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml
ls -al  $CLUSTER_DIR_DATA_DRIVE/configs/node-*/elasticsearch.yml

# Uncomment these lines to run command
#cat configure-ccr.yml | tee -a $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml
#cat configure-ccr.yml | tee -a $CLUSTER_DIR_DATA_DRIVE/configs/node-*/elasticsearch.yml
tail -n7 $CLUSTER_DIR_LOCAL/configs/node-*/elasticsearch.yml
tail -n7 $CLUSTER_DIR_DATA_DRIVE/configs/node-*/elasticsearch.yml
