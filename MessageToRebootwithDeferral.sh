#!/bin/bash

# Define variables
JAMF_HELPER="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
TITLE="System Reboot Required"
MESSAGE="Your Mac requires a reboot to install important updates."
ICON="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/RestartIcon.icns"
DEFER_COUNT_FILE="/Library/Application Support/JAMF/.reboot_defer_count"
MAX_DEFERS=3

# Read the defer count
if [[ -f "$DEFER_COUNT_FILE" ]]; then
    DEFER_COUNT=$(cat "$DEFER_COUNT_FILE")
else
    DEFER_COUNT=0
fi

if [[ "$DEFER_COUNT" -lt "$MAX_DEFERS" ]]; then
    BUTTON_CLICKED=$("$JAMF_HELPER" -windowType utility -title "$TITLE" -description "$MESSAGE" -icon "$ICON" -button1 "Reboot Now" -button2 "Defer" -defaultButton 1 -cancelButton 2)
    
    if [[ "$BUTTON_CLICKED" == 2 ]]; then
        ((DEFER_COUNT++))
        echo "$DEFER_COUNT" > "$DEFER_COUNT_FILE"
        echo "Reboot deferred $DEFER_COUNT time(s). Reminder will show again in 24 hours."
        
        # Schedule the script to run again in 24 hours
        /bin/launchctl asuser "$(/usr/bin/stat -f %u /dev/console)" /usr/bin/osascript -e "delay 86400" -e "do shell script \"$0\""
        exit 0
    fi
fi

# Final message: No deferral allowed, force reboot
"$JAMF_HELPER" -windowType utility -title "$TITLE" -description "Your Mac must now reboot to complete important updates." -icon "$ICON" -button1 "Reboot Now" -defaultButton 1

# Force reboot
touch "$DEFER_COUNT_FILE" # Reset defer count to track future prompts
/sbin/shutdown -r now