#!/bin/bash
# jq https://stedolan.github.io/jq/

# insert username and API key from https://languagetoolplus.com/api-access
username='mail'
apiKey='key'

while IFS= read -r line; do

  matchesJSON=$(
  curl -s -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' -d 'text='"$line"'&language=eo&username='"$username"'&apiKey='"$apiKey"'&enabledOnly=false' 'https://api.languagetoolplus.com/v2/check' |\
  jq '.matches')

  matchesJSONLength=$(echo -n $matchesJSON | wc -c)
  #  echo $matchesJSONLength

  if [ "$matchesJSONLength" -eq "6" ]; then
        echo "$line"
  fi

  sleep 2
done < "$1"
