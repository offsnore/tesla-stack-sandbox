

# Request - Headers
```
POST /api/1/vehicles/${VEHICLE_ID}/wake_up HTTP/1.1
client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384
client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3
Authorization: Bearer fe0e4f4912b9e258f707c79fad4b7db11a72098a3ed133163bff8d2806d68346
Host: owner-api.teslamotors.com
Connection: close
User-Agent: Paw/3.1.5 (Macintosh; OS X/10.14.1) GCDHTTPRequest
Content-Length: 0


```

# Response
```
HTTP/1.1 200 OK
Server: nginx
Date: Mon, 19 Nov 2018 17:36:57 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 566
Connection: close
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-TXID: 487aa68f23a77fc6b552c79b65ccda4e
ETag: W/"b8ec0a49d7ab1018e7a38e416e3358c2"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 24489509-8797-4345-87c6-9726902e6075
X-Runtime: 1.234024
X-Frame-Options: SAMEORIGIN

{"response":{"id":${VEHICLE_ID},"user_id":456477,"vehicle_id":547836570,"vin":"5YJ3E1EB3JF055639","display_name":"BFR","option_codes":"AD15,MDL3,PBSB,RENA,BT37,ID3W,RF3G,S3PB,DRLH,DV2W,W39B,APF0,COUS,BC3B,CH07,PC30,FC3P,FG31,GLFR,HL31,HM31,IL31,LTPB,MR31,FM3B,RS3H,SA3P,STCP,SC04,SU3C,T3CA,TW00,TM00,UT3P,WR00,AU3P,APH3,AF00,ZCST,MI00,CDM0","color":null,"tokens":["4d2caefa9d6606ef","ec0a41b8c53f7b7a"],"state":"asleep","in_service":false,"id_s":"${VEHICLE_ID}","calendar_enabled":true,"api_version":4,"backseat_token":null,"backseat_token_updated_at":null}}
{
  "response": {
    "id": ${VEHICLE_ID},
    "user_id": 456477,
    "vehicle_id": 547836570,
    "vin": "5YJ3E1EB3JF055639",
    "display_name": "BFR",
    "option_codes": "AD15,MDL3,PBSB,RENA,BT37,ID3W,RF3G,S3PB,DRLH,DV2W,W39B,APF0,COUS,BC3B,CH07,PC30,FC3P,FG31,GLFR,HL31,HM31,IL31,LTPB,MR31,FM3B,RS3H,SA3P,STCP,SC04,SU3C,T3CA,TW00,TM00,UT3P,WR00,AU3P,APH3,AF00,ZCST,MI00,CDM0",
    "color": null,
    "tokens": [
      "d997d9c88cf78bf9",
      "be86cf8613c99b02"
    ],
    "state": "asleep",
    "in_service": false,
    "id_s": "${VEHICLE_ID}",
    "calendar_enabled": true,
    "api_version": 4,
    "backseat_token": null,
    "backseat_token_updated_at": null
  }
}
```

Mock in kibana:
```
PUT tesla-wake-history/_doc/1
{
  "id": ${VEHICLE_ID},
  "user_id": 456477,
  "vehicle_id": 547836570,
  "vin": "5YJ3E1EB3JF055639",
  "display_name": "BFR",
  "option_codes": "AD15,MDL3,PBSB,RENA,BT37,ID3W,RF3G,S3PB,DRLH,DV2W,W39B,APF0,COUS,BC3B,CH07,PC30,FC3P,FG31,GLFR,HL31,HM31,IL31,LTPB,MR31,FM3B,RS3H,SA3P,STCP,SC04,SU3C,T3CA,TW00,TM00,UT3P,WR00,AU3P,APH3,AF00,ZCST,MI00,CDM0",
  "color": null,
  "tokens": [
    "d997d9c88cf78bf9",
    "be86cf8613c99b02"
  ],
  "state": "asleep",
  "in_service": false,
  "id_s": "${VEHICLE_ID}",
  "calendar_enabled": true,
  "api_version": 4,
  "backseat_token": null,
  "backseat_token_updated_at": null
}
```

```
PUT tesla-wake-history/_doc/1
{
  "id": ${VEHICLE_ID},
  "user_id": 456477,
  "vehicle_id": 547836570,
  "vin": "5YJ3E1EB3JF055639",
  "display_name": "BFR",
  "option_codes": "AD15,MDL3,PBSB,RENA,BT37,ID3W,RF3G,S3PB,DRLH,DV2W,W39B,APF0,COUS,BC3B,CH07,PC30,FC3P,FG31,GLFR,HL31,HM31,IL31,LTPB,MR31,FM3B,RS3H,SA3P,STCP,SC04,SU3C,T3CA,TW00,TM00,UT3P,WR00,AU3P,APH3,AF00,ZCST,MI00,CDM0",
  "color": null,
  "tokens": [
    "d997d9c88cf78bf9",
    "be86cf8613c99b02"
  ],
  "state": "asleep",
  "in_service": false,
  "id_s": "${VEHICLE_ID}",
  "calendar_enabled": true,
  "api_version": 4,
  "backseat_token": null,
  "backseat_token_updated_at": null
}
```

# curl request (missing token)

```
curl -X "POST" "https://owner-api.teslamotors.com/api/1/vehicles/${VEHICLE_ID}/wake_up" \
     -H 'client_id: 81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384' \
     -H 'client_secret: c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3' \
     -H 'Authorization: Bearer TOKEN'
```
