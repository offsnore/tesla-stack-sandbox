dir=`pwd`
cd 
cd workspace/tesla-stack/dev-ops/

#./routing_allocation-disable.sh
kill `cat /var/run/elasticsearch/pid9200`
kill `cat /var/run/elasticsearch/pid9201`
kill `cat /var/run/elasticsearch/pid9202`
kill `cat /var/run/elasticsearch/pid9203`
kill `cat /var/run/elasticsearch/pid9204`
kill `cat /var/run/elasticsearch/pid9205`

kill `cat /data/elasticsearch/cluster.plane-12-29-2018/pid/9200`
kill `cat /data/elasticsearch/cluster.plane-12-29-2018/pid/9201`
kill `cat /data/elasticsearch/cluster.plane-12-29-2018/pid/9202`
