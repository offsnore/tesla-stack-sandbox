curl -X "POST" "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/wake_up" \
     -H 'client_id: ${TESLA_CLIENT_ID}' \
     -H 'client_secret: ${TESLA_CLIENT_SECRET}' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "wake_up-response-$(date +%H:%M.%s).json"
