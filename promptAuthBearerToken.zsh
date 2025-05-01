#!/bin/zsh
# Bearer Token Template
# Define Variables

baseURL="https://a300-1a.pro.jamf.training"

echo "What is your Jamf Pro Client ID?"; read client_id

# Add -s to silence character entry
echo "What is your Jamf Pro Client Secret?"; read -s client_secret

echo ""

# echo "I wont tell anyone that the secret for $client_id is $client_secret"

# Generate Access Token
access_token=$(curl --silent --location \
	--request POST "$baseURL/api/oauth/token" \
	--header "Content-Type: application/x-www-form-urlencoded" \
	--data-urlencode "client_id=$client_id" \
	--data-urlencode "grant_type=client_credentials" \
	--data-urlencode "client_secret=$client_secret" | plutil -extract "access_token" raw -o - -)

# Display Access Token
echo "$access_token"