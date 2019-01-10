echo "Current allocation setting.."
curl -XGET -s -u elastic:foobar "http://localhost:9200/_cluster/settings" | jq ".persistent.cluster.routing"
