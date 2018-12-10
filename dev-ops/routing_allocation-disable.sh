echo "Current routing allocation setting.."
curl -XGET -u elastic:foobar "http://localhost:9200/_cluster/settings" | jq ".persistent.cluster.routing"
echo "Disabling cluster routing allocation.."
sleep 1
curl -XPUT -u elastic:foobar  "http://localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "none"
  }
}' | jq ".persistent.cluster.routing"

sleep 1
echo "Checking that cluster routing is disabled.."
curl -XGET -u elastic:foobar "http://localhost:9200/_cluster/settings" | jq ".persistent.cluster.routing"

