#!/bin/bash

SCRIPT_LOG="/Users/Shared/asset_tag_search.log"
LAST_RUN_PLIST="/Library/Preferences/com.anyorg.assetlookup.plist"

read -p "b92e7642-0dcb-4fdc-b1fc-2646e8b54c06" CLIENT_ID
read -s -p "_jEagKEVXxWzay-CHlDIY4afka5PTs-7a2nVYtNtJOeBaAD-0GpRCw8cdDuI-TFs" CLIENT_SECRET
echo

TOKEN_RESPONSE=$(curl -s -X POST "https://we400-7a.pro.jamf.training/api/v1/auth/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET")

BEARER_TOKEN=$(echo "$TOKEN_RESPONSE" | /usr/bin/plutil -extract token raw -)

if [[ -z "$BEARER_TOKEN" ]]; then
    echo "Token request failed"
    exit 1
fi

while true; do
    ASSET_TAG=$(osascript <<EOF_INNER
tell application "System Events"
    activate
    display dialog "Enter the asset tag (Format: JS######):" default answer "" with title "Asset Tag Lookup" buttons {"OK"} default button "OK"
    return text returned of result
end tell
EOF_INNER
)

    if [[ ! "$ASSET_TAG" =~ ^JS[0-9]{6}$ ]]; then
        osascript -e 'display dialog "Invalid format. Please enter a tag like JS######." buttons {"OK"}'
        continue
    fi

    RESULTS=$(curl -s -H "Authorization: Bearer $BEARER_TOKEN" \
      "https://we400-7a.pro.jamf.training/JSSResource/mobiledevices/match/$ASSET_TAG")

    MATCH_COUNT=$(echo "$RESULTS" | grep -c "<mobile_device>")

    if [[ $MATCH_COUNT -eq 0 ]]; then
        jamfHelper -windowType utility -title "Asset Tag Search" -description "No matching record found" -button1 "OK"
    else
        INFO=""
        while read -r line; do
            USERNAME=$(echo "$line" | xmllint --xpath "//username/text()" - 2>/dev/null)
            BUILDING=$(echo "$line" | xmllint --xpath "//building/text()" - 2>/dev/null)
            DEPARTMENT=$(echo "$line" | xmllint --xpath "//department/text()" - 2>/dev/null)
            INFO+="User: $USERNAME\nBuilding: $BUILDING\nDepartment: $DEPARTMENT\n\n"
        done < <(echo "$RESULTS" | awk 'BEGIN {RS="</mobile_device>"; ORS=""} {print $0 "</mobile_device>"}')

        jamfHelper -windowType utility -title "Asset Tag Lookup Results" -description "$INFO" -button1 "OK"
    fi

    CHOICE=$(jamfHelper -windowType utility -title "Asset Tag Search" \
        -description "Would you like to search for another asset tag?" \
        -button1 "Yes" -button2 "No" -defaultButton 1)

    if [[ "$CHOICE" == "2" ]]; then
        defaults write "$LAST_RUN_PLIST" LastRun "$(date -u)"
        /usr/local/bin/jamf recon &
        echo "Last run saved to $LAST_RUN_PLIST" >> "$SCRIPT_LOG"
        break
    fi
done
