#!/bin/bash

# webURL http://dev.ondata.it/projs/openmepa/openMepa.csv

# attivo debug
set -x

cartella="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


## Dati Caronte


var=$(base64 "$cartella"/dati/risorse/caronte.csc);

<<comment1
curl -i -X PUT https://api.github.com/repos/ondata/openmepa/contents/openMepa.csv -H 'Authorization: token '"$token"'' -d @- <<CURL_DATA
{"path": "openMepa.csv", "message": "update", "content": "$var", "branch": "master","sha": $(curl -X GET https://api.github.com/repos/ondata/openmepa/contents/openMepa.csv | jq '.sha')}
CURL_DATA
comment1

