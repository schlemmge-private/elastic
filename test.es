// test

DELETE /play

// create index
PUT /play

GET /_cat/indices

// configure index
PUT /play/_mappings
{
    "properties": {
        "firstName": {
            "type": "text"
        },
        "place": {
            "type": "text"
        },
        "dateOfBirth": {
            "type": "date"
        },
        "generated": {
            "type": "date"
        },
        "location": {
            "type": "geo_point"
        }
    }
}

pub

PUT /play/_settings
{
    "index.number_of_replicas" : 0
}

// 52°22'28" N und 9°44'19" O.
// "1968-12-02"

GET /play/_mappings

## "analyzer": "whitespace"

POST /play/_doc/p1
{
    "firstName": "Gerhard",
    "dateOfBirth": "2021-01-01",
    "generated": "2021-01-01",
    "place": "Hanover",
    "location": {
        "lat": 52.3744779,
        "lon": 9.7385532
    }
}

GET /play/_search
{
    "query": {
        "match_all": {}
    },
    "sort": [
        { "generated": { "order": "desc" }}
    ]    
}

DELETE /play/_doc/XQPMankBkidRCbSJNue-


POST /play/_delete_by_query
{
    "query": {
        "match_all": {}
    }
}