#!/bin/bash

# Variables
JAMF_HELPER="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
ICON="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/Sync.icns" # Choose an appropriate icon
TITLE="Inventory Update"
HEADING="Inventory Update Required"
DESCRIPTION="Please update your device inventory. Click Proceed to continue or Cancel to skip."

# Display the jamfHelper window
CHOICE=$("$JAMF_HELPER" \
    -windowType utility \
    -title "$TITLE" \
    -heading "$HEADING" \
    -description "$DESCRIPTION" \
    -icon "$ICON" \
    -button1 "Proceed" \
    -button2 "Cancel" \
    -defaultButton 1)

# Check user response
if [ "$CHOICE" == "0" ]; then
    # User clicked Proceed
    echo "User chose to proceed. Updating inventory..."
    /usr/local/bin/jamf recon
elif [ "$CHOICE" == "2" ]; then
    # User clicked Cancel
    echo "User cancelled. Displaying informational message..."
    "$JAMF_HELPER" \
        -windowType utility \
        -title "$TITLE" \
        -heading "Inventory Update Skipped" \
        -description "You chose not to update the inventory at this time." \
        -icon "$ICON" \
        -button1 "OK" \
        -defaultButton 1
else
    echo "Unknown selection or jamfHelper exited unexpectedly."
fi