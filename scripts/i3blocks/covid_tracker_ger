#! /usr/bin/bash

country_code="DE"
URL="https://coronavirus-tracker-api.herokuapp.com/v2/locations"
res=$(curl -sf "$URL")

if [ -z "$res" ]; then
    echo " Impossible to fetch data. "
    return 1
fi

country_code=\""$country_code"\"
country=$(jq '.["locations"][] | if .["country_code"] == '$country_code' then .["id"] else empty end' <<< $res)

nb_confirmed=$(jq '.["locations"]['$country']["latest"]["confirmed"]' <<< $res)
nb_death=$(jq '.["locations"]['$country']["latest"]["deaths"]' <<< $res)
nb_recovered=$(jq '.["locations"]['$country']["latest"]["recovered"]' <<< $res)

echo "  $nb_confirmed  $nb_death  $nb_recovered "
