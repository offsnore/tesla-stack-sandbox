curl -X "POST" "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/wake_up" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "/data/tesla/wake_up-response-$(date +%Y-%m-%dT%H:%M.%s).json"
curl  "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/data_request/charge_state" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "/data/tesla/charge_state-response-$(date +%Y-%m-%dT%H:%M.%s).json"
curl  "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/data_request/charge_state" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "/data/tesla/climate_state-response-$(date +%Y-%m-%dT%H:%M.%s).json"
## Driving and Position
curl "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/data_request/drive_state" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "/data/tesla/drive_state-response-$(date +%Y-%m-%dT%H:%M.%s).json"
curl  "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/data_request/gui_settings" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "/data/tesla/gui_settings-response-$(date +%Y-%m-%dT%H:%M.%s).json"
curl  "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/mobile_enabled" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "/data/tesla/mobile_enabled-response-$(date +%Y-%m-%dT%H:%M.%s).json"
## Vehicle State
curl "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/data_request/vehicle_state" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "/data/tesla/vehicle_state-response-$(date +%Y-%m-%dT%H:%M.%s).json"
