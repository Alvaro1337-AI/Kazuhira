#!/bin/zsh

# Remove Jamf Protect extension attribute
rm /Library/Application\ Support/JamfProtect/groups/protect-HiddenLaunchPlistCreated

# Display message to the user using the jamfHelper app
"/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper" \
-windowType hud -title "Possible Malicious Activity" \
-heading "Malware Detected" \
-alignHeading natural \
-description "Your computer may be infected with malware. Contact your IT administrator immediately." \
-alignDescription natural -icon "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertStopIcon.icns" \
-button1 Ok \
-alignCountdown center \
-lockHUD