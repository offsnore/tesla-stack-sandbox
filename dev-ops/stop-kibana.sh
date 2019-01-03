dir=`pwd`
cd 
cd workspace/elastic-stack/current/kibana

#./routing_allocation-disable.sh
echo "Klling kibana at pid `cat kibana.pid`.." && kill `cat kibana.pid`
rm kibana.pid
