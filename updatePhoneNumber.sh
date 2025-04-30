#!/bin/bash

# Get current logged-in user
CURRENT_USER=$(stat -f%Su /dev/console)

# Prompt user for their phone number using osascript (GUI input box)
PHONE_NUMBER=$(osascript <<EOF
tell application "System Events"
    activate
    display dialog "Please enter your phone number for IT records:" default answer "" with title "Phone Number Update" buttons {"Submit"} default button "Submit"
    return text returned of result
end tell
EOF
)

# Confirm input was received
if [[ -z "$PHONE_NUMBER" ]]; then
    echo "No phone number entered. Exiting."
    exit 1
fi

echo "Phone number entered: $PHONE_NUMBER"

# Use the jamf binary to update the phone number
/usr/local/bin/jamf recon -phone "$PHONE_NUMBER"

echo "Phone number submitted to Jamf Pro."