dir=`pwd`
cd 
cd workspace/elastic-stack/current/kibana

#./routing_allocation-disable.sh
echo "Klling kibana at pid `cat kibana.pid`.." && kill `cat kibana.pid`
echo "Klling kibana2 at pid `cat kibana2.pid`.." && kill `cat kibana2.pid`
rm kibana.pid kibana2.pid
