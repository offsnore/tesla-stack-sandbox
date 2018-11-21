curl -X "POST" "https://owner-api.teslamotors.com/api/1/vehicles/***REMOVED***/wake_up" \
     -H 'client_id: "${TESLA_API_CLIENT_ID}"' \
     -H 'client_secret: "${TESLA_API_CLIENT_SECRET}"' \
     -H 'Authorization: Bearer "${TESLA_API_TOKEN}"' \
     -o "/data/tesla/wake_up-response-$(date +%Y-%m-%dT%H:%M.%s).json"
curl  "https://owner-api.teslamotors.com/api/1/vehicles/***REMOVED***/data_request/charge_state" \
     -H 'client_id: "${TESLA_API_CLIENT_ID}"' \
     -H 'client_secret: "${TESLA_API_CLIENT_SECRET}"' \
     -H 'Authorization: Bearer "${TESLA_API_TOKEN}"' \
     -o "/data/tesla/charge_state-response-$(date +%Y-%m-%dT%H:%M.%s).json"
curl  "https://owner-api.teslamotors.com/api/1/vehicles/***REMOVED***/data_request/charge_state" \
     -H 'client_id: "${TESLA_API_CLIENT_ID}"' \
     -H 'client_secret: "${TESLA_API_CLIENT_SECRET}"' \
     -H 'Authorization: Bearer "${TESLA_API_TOKEN}"' \
     -o "/data/tesla/climate_state-response-$(date +%Y-%m-%dT%H:%M.%s).json"
## Driving and Position
curl "https://owner-api.teslamotors.com/api/1/vehicles/***REMOVED***/data_request/drive_state" \
     -H 'client_id: "${TESLA_API_CLIENT_ID}"' \
     -H 'client_secret: "${TESLA_API_CLIENT_SECRET}"' \
     -H 'Authorization: Bearer "${TESLA_API_TOKEN}"' \
     -o "/data/tesla/drive_state-response-$(date +%Y-%m-%dT%H:%M.%s).json"
curl  "https://owner-api.teslamotors.com/api/1/vehicles/***REMOVED***/data_request/gui_settings" \
     -H 'client_id: "${TESLA_API_CLIENT_ID}"' \
     -H 'client_secret: "${TESLA_API_CLIENT_SECRET}"' \
     -H 'Authorization: Bearer "${TESLA_API_TOKEN}"' \
     -o "/data/tesla/gui_settings-response-$(date +%Y-%m-%dT%H:%M.%s).json"
curl  "https://owner-api.teslamotors.com/api/1/vehicles/***REMOVED***/mobile_enabled" \
     -H 'client_id: "${TESLA_API_CLIENT_ID}"' \
     -H 'client_secret: "${TESLA_API_CLIENT_SECRET}"' \
     -H 'Authorization: Bearer "${TESLA_API_TOKEN}"' \
     -o "/data/tesla/mobile_enabled-response-$(date +%Y-%m-%dT%H:%M.%s).json"
## Vehicle State
curl "https://owner-api.teslamotors.com/api/1/vehicles/***REMOVED***/data_request/vehicle_state" \
     -H 'client_id: "${TESLA_API_CLIENT_ID}"' \
     -H 'client_secret: "${TESLA_API_CLIENT_SECRET}"' \
     -H 'Authorization: Bearer "${TESLA_API_TOKEN}"' \
     -o "/data/tesla/vehicle_state-response-$(date +%Y-%m-%dT%H:%M.%s).json"
