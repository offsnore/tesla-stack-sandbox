## Vehicle State
curl "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/data_request/vehicle_state" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "vehicle_state-response-$(date +%H:%M.%s).json"
