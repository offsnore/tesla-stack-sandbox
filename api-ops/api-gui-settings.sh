curl  "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/data_request/gui_settings" \
     -H 'client_id: ${TESLA_CLIENT_ID}' \
     -H 'client_secret: ${TESLA_CLIENT_SECRET}' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "gui_settings-response-$(date +%H:%M.%s).json"
