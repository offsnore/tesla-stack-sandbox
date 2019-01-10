while true
do
    cd ~/workspace/tesla/api-calls && ./tesla_api_poll.sh
    echo "Sleeping for 5 minutes at $(date +%H:%M:%S).."
    sleep 300
done
