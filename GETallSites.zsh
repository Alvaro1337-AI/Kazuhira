#!/bin/zsh

# Bearer Token Template
baseURL="https://a300-1a.pro.jamf.training"
client_id="ee470375-a742-4557-817d-2d1a2267071a"
client_secret="NgRpVee9ITKvkQUkDDqKGpX_ol9OHo5xbmp3af_PVgCuC18fjc1PxQobi68eLMCo"

access_token=$(curl --silent --location \
	--request POST "$baseURL/api/oauth/token" \
	--header "Content-Type: application/x-www-form-urlencoded" \
	--data-urlencode "client_id=$client_id" \
	--data-urlencode "grant_type=client_credentials" \
	--data-urlencode "client_secret=$client_secret" | plutil -extract "access_token" raw -o - -)

# echo "$access_token"

curl -X 'GET' \
'https://a300-1a.pro.jamf.training/api/v1/sites' \
-H 'accept: application/json' \
-H "Authorization: Bearer $access_token"