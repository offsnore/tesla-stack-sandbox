ps -ef | grep tesla-send-json-files | cut -c 7-12 >> tesla-send-json-files.pids
sleep 2
for pid in `cat tesla-send-json-files.pids`; do echo killing $pid; echo ..; kill $pid; done;
rm tesla-send-json-files.pids
