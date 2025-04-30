#!/bin/zsh

# Bearer Token Template

baseURL="BASE_URL"
client_id="CLIENT_ID"
client_secret="CLIENT_SCECRET"

# Generate Access Token
access_token=$(curl --silent --location \
	--request POST "$baseURL/api/oauth/token" \
	--header "Content-Type: application/x-www-form-urlencoded" \
	--data-urlencode "client_id=$client_id" \
	--data-urlencode "grant_type=client_credentials" \
	--data-urlencode "client_secret=$client_secret" | plutil -extract "access_token" raw -o - -)

# Display Access Token
echo "$access_token"