# Charge State

# Request - Headers

GET /api/1/vehicles/${VEHICLE_ID}/data_request/charge_state HTTP/1.1
client_id: "${TESLA_API_CLIENT_ID}"
client_secret: "${TESLA_API_CLIENT_SECRET}"
Authorization: Bearer "${TESLA_API_TOKEN}"
Host: owner-api.teslamotors.com
Connection: close
User-Agent: Paw/3.1.5 (Macintosh; OS X/10.14.1) GCDHTTPRequest


# Response

```
HTTP/1.1 200 OK
Server: nginx
Date: Wed, 14 Nov 2018 00:37:39 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 1158
Connection: close
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-TXID: d8501c854ac9246c8a31aa7f26168171
ETag: W/"50889a5678a17bd90fc3212f1f549dec"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e4c984dd-5e29-4d20-87a4-ed352aee27a1
X-Runtime: 0.261173
X-Frame-Options: SAMEORIGIN

{"response":{"battery_heater_on":false,"battery_level":64,"battery_range":200.02,"charge_current_request":48,"charge_current_request_max":48,"charge_enable_request":true,"charge_energy_added":28.26,"charge_limit_soc":90,"charge_limit_soc_max":100,"charge_limit_soc_min":50,"charge_limit_soc_std":90,"charge_miles_added_ideal":115.5,"charge_miles_added_rated":115.5,"charge_port_door_open":true,"charge_port_latch":"Engaged","charge_rate":241.2,"charge_to_max_range":false,"charger_actual_current":0,"charger_phases":null,"charger_pilot_current":33,"charger_power":45,"charger_voltage":386,"charging_state":"Charging","conn_charge_cable":"SAE","est_battery_range":124.78,"fast_charger_brand":"Tesla","fast_charger_present":true,"fast_charger_type":"Tesla","ideal_battery_range":200.02,"managed_charging_active":false,"managed_charging_start_time":null,"managed_charging_user_canceled":false,"max_range_charge_counter":0,"not_enough_power_to_heat":null,"scheduled_charging_pending":false,"scheduled_charging_start_time":null,"time_to_full_charge":0.5,"timestamp":1542155859465,"trip_charging":false,"usable_battery_level":64,"user_charge_enable_request":null}}
```
