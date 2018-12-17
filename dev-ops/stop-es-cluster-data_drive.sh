dir=`pwd`
cd 
cd workspace/tesla-stack/dev-ops/

#./routing_allocation-disable.sh
kill `cat /var/run/elasticsearch/pid-data_drive-9200`
kill `cat /var/run/elasticsearch/pid-data_drive-9201`
kill `cat /var/run/elasticsearch/pid-data_drive-9202`
kill `cat /var/run/elasticsearch/pid-data_drive-9203`
kill `cat /var/run/elasticsearch/pid-data_drive-9204`
kill `cat /var/run/elasticsearch/pid-data_drive-9205`
