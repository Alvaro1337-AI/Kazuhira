#!/bin/bash

# Get current logged-in user and their Desktop path
LOGGED_IN_USER=$(stat -f%Su /dev/console)
DESKTOP_PATH="/Users/$LOGGED_IN_USER/Desktop"

# Create an array of local users with UID > 500 (excluding system accounts)
USER_LIST=$(dscl . -list /Users UniqueID | awk '$2 >= 501 && $1 !~ /^_/' | awk '{print $1}')

# Convert user list to AppleScript format (comma-separated, quoted)
APPLE_LIST=$(printf '"%s", ' $USER_LIST | sed 's/, $//')

# Prompt user to choose an account
SELECTED_USER=$(osascript <<EOF
set userList to {$APPLE_LIST}
set chosenUser to (choose from list userList with prompt "Select a local user account to inspect:" default items (item 1 of userList))
if chosenUser is false then
    return ""
else
    return item 1 of chosenUser
end if
EOF
)

# Exit if user cancelled
if [[ -z "$SELECTED_USER" ]]; then
    echo "No user selected. Exiting."
    exit 0
fi

# Output dscl record to file
OUTPUT_FILE="$DESKTOP_PATH/${SELECTED_USER}_record.txt"
dscl . -read /Users/"$SELECTED_USER" > "$OUTPUT_FILE"

echo "User record for '$SELECTED_USER' written to: $OUTPUT_FILE"