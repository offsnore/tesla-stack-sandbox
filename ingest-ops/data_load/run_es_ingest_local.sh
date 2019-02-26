#  2>&1 | tee -a  $LOGS_DIR_MONITORING/metricbeat-`date +%Y-%m-%d`.out  & echo $! > $PIDS_DIR_MONITORING/metricbeat.pi


source ~/workspace/tesla-stack/dev-ops/cluster-vars.source
echo "LOGS_DIR_DATA_LOAD: $LOGS_DIR_DATA_LOAD"

echo "Checking that directoies are created.."

echo "LOGS_DIR_DATA_LOAD: $LOGS_DIR_DATA_LOAD"

# Create Data Load log directory
if [ ! -z $LOGS_DIR_DATA_LOAD ]; then
# Need root privs to create data, config, log paths
  sudo mkdir -p $LOGS_DIR_DATA_LOAD
  echo "Created data_load logs directory: $LOGS_DIR_DATA_LOAD"
fi

# broke xample: 
#./data-load-wake_up.sh 2>&1 | tee -a $LOGS_DIR_DATA_LOAD/load-wake_up-`date +%Y-%m-%d`.out & echo $1 > $PIDS_DIR/data-load-wake_up.pid

./data-load-charge_state.sh & 
./data-load-climate_state.sh &
./data-load-drive_state.sh & 
./data-load-gui_settings.sh &
./data-load-vehicle_state.sh &
./data-load-wake_up.sh &
