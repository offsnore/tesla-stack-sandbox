# Dev Tools History

```
GET _cat/indices
GET _cat/nodes
GET _cluster/health
DELETE _all

PUT _template/tesla_wake_template
{
  "index_patterns" : ["tesla-wake-history-*"],
  "settings" : {
    "number_of_shards" : 1
  }
}


DELETE tesla-wake-history-*
PUT /tesla-wake-history-000001 
{
  "settings": {
    "number_of_shards": 1
  }, 
  "aliases": {
    "tesla-wake-history": {}
  }
}

POST tesla-wake-history/_doc
{
  "id": ***REMOVED***,
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
  "id_s": "***REMOVED***",
  "calendar_enabled": true,
  "api_version": 4,
  "backseat_token": null,
  "backseat_token_updated_at": null
}

POST /tesla-wake-history/_rollover 
{
  "conditions": {
    "max_age":   "1d",
    "max_docs":  2,
    "max_size":  "5gb"
  }
}

GET _cat/indices

POST /_aliases
{
    "actions" : [
        {
            "add" : {
                 "index" : "tesla-wake-history-*",
                 "alias" : "tesla-wake-history-search"
            }
        }
    ]
}

GET tesla-wake-history-search/_search
```

