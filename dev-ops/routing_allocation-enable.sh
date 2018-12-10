echo "Current allocation setting.."
curl -XGET -s -u elastic:foobar "http://localhost:9200/_cluster/settings" | jq ".persistent.cluster.routing"
sleep 1
echo "Enabling routing allocation.."
curl -XPUT -s -u elastic:foobar  "http://localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "all"
  }
}' | jq ".persistent.cluster.routing"

sleep 1
echo "Checking that allocation is enabled.."
curl -XGET -s -u elastic:foobar "http://localhost:9200/_cluster/settings" | jq ".persistent.cluster.routing"

