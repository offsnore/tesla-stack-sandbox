source ../dev-ops/cluster-vars.source
echo "Enabling security for nodes at: `ls -al $CLUSTER_CONFIGS_LOCAL`"
echo 'xpack.security.enabled: true' >> $CLUSTER_CONFIGS_LOCAL/node-*/elasticsearch.yml
