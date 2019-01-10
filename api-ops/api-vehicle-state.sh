## Vehicle State
<<<<<<< HEAD
curl "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/data_request/vehicle_state" \
=======
curl "https://owner-api.teslamotors.com/api/1/vehicles/33843057077253004/data_request/vehicle_state" \
>>>>>>> 68b783ba84de627248a7c0eada88368868881036
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer ${TESLA_API_TOKEN}' \
     -o "vehicle_state-response-$(date +%H:%M.%s).json"
