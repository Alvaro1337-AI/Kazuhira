#!/bin/bash

# Go through each .app inside /System/Applications
for app in /System/Applications/*.app; do
    if [ -d "$app" ]; then
        # Get the basename (just the name of the .app)
        app_name=$(basename "$app")
        
        # Try to read the version from the app's Info.plist
        version=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$app/Contents/Info.plist" 2>/dev/null)

        echo "$app_name : $version"
    fi
done