#!/bin/zsh

# PostInstall Script to enable automatic software update checks

# Get the domain if we have not opened the app yet
# defaults read -app /Applications/VLC.app/

# Get the domain
# codesign -dv /Applications/VLC.app/

defaults write /Library/Preferences/org.videolan.vlc.plist SUEnableAutomaticChecks -bool true