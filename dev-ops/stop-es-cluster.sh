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
