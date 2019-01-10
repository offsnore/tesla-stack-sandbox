curl  "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/data_request/charge_state" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer fe0e4f4912b9e258f707c79fad4b7db11a72098a3ed133163bff8d2806d68346' \
     -o "charge_state-response-$(date +%H:%M.%s).json"
