cd data_load
./data-load-wake_up.sh >> data_load_logs/wake_up.log  &
./data-load-charge_state.sh >> data_load_logs/charge_state.log &
./data-load-climate_state.sh &
./data-load-drive_state.sh  &
./data-load-gui_settings.sh &
./data-load-vehicle_state.sh &
