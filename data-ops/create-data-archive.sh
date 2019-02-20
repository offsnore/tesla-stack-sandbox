#!/bin/bash
# Script to create archive of all tesla api data

tar cvfz climate_state-`date +%Y-%m-%d`.tar.gz climate_state
tar cvfz charge_state-`date +%Y-%m-%d`.tar.gz charge_state
tar cvfz drive_state-`date +%Y-%m-%d`.tar.gz drive_state
tar cvfz gui_settings-`date +%Y-%m-%d`.tar.gz gui_settings
tar cvfz mobile_enabled-`date +%Y-%m-%d`.tar.gz mobile_enabled
tar cvfz wake_up-`date +%Y-%m-%d`.tar.gz wake_up
tar cvfz tesla-data-archive-`date +%Y-%m-%d`.tar.gz *.tar.gz

echo "Archive created: `pwd`: tesla-data-archive-`date +%Y-%m-%d`.tar.gz"
